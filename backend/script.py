# import numpy as np
# import librosa.display
# from os import path
# import matplotlib.pyplot as plt
# import sys
# from pydub import AudioSegment

# print("hello from script")
# print('first param:' + sys.argv[1])
# print('first param:' + sys.argv[2])


# url = sys.argv[1]
# output = sys.argv[2]

# wavePath = "cough.wav"

# sound = AudioSegment.from_file(url,  format='m4a')
# sound.export(wavePath, format="wav")


# def create_spectrogram(audio_file, image_file):
#     fig = plt.figure()
#     ax = fig.add_subplot(1, 1, 1)
#     fig.subplots_adjust(left=0, right=1, bottom=0, top=1)

#     y, sr = librosa.load(audio_file)
#     ms = librosa.feature.melspectrogram(y, sr=sr)
#     log_ms = librosa.power_to_db(ms, ref=np.max)
#     librosa.display.specshow(log_ms, sr=sr)

#     fig.savefig(image_file)
#     print("hi")
#     plt.close(fig)

import json
import boto3
import numpy as np
import librosa.display
import os
import matplotlib.pyplot as plt
import sys
from pydub import AudioSegment


url = sys.argv[1]
output = sys.argv[2]
print(url)
wavePath = "./public/videos/output.wav"


def create_spectrogram(audio_file, image_file):
    fig = plt.figure()
    ax = fig.add_subplot(1, 1, 1)
    fig.subplots_adjust(left=0, right=1, bottom=0, top=1)

    y, sr = librosa.load(audio_file)
    ms = librosa.feature.melspectrogram(y, sr=sr)
    log_ms = librosa.power_to_db(ms, ref=np.max)
    librosa.display.specshow(log_ms, sr=sr)

    fig.savefig(image_file)
    plt.close(fig)


def create_pngs_from_wavs(input_path, output_path):
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    dir = os.listdir(input_path)

    for i, file in enumerate(dir):
        input_file = os.path.join(input_path, file)
        output_file = os.path.join(output_path, file.replace('.wav', '.png'))


sound = AudioSegment.from_file(url,  format='m4a')
print("high")
sound.export(wavePath, format="wav")

create_spectrogram(wavePath, output)
print(output)


def query_endpoint(img):
    endpoint_name = 'jumpstart-ftc-tf-ic-resnet-50-classification-1'
    client = boto3.client('runtime.sagemaker', region_name='us-east-1', aws_access_key_id="AKIAT7LO47EC2UQZW3UW",
                          aws_secret_access_key="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")
    response = client.invoke_endpoint(
        EndpointName=endpoint_name, ContentType='application/x-image', Body=img, Accept='application/json;verbose')
    return response


def parse_prediction(query_response):
    model_predictions = json.loads(query_response['Body'].read())
    predicted_label = model_predictions['predicted_label']
    labels = model_predictions['labels']
    probabilities = model_predictions['probabilities']
    return predicted_label, probabilities, labels


images = {}
with open(output+".png", 'rb') as file:
    images["a"] = file.read()

final_result = ""

for filename, img in images.items():
    print("s")
    query_response = query_endpoint(img)
    print("b")
    predicted_label, probabilities, labels = parse_prediction(query_response)
    print("v")
    final_result = predicted_label


print(final_result)

# final_result

resultsFile = open("results.json", "w")
resultsFile.write("{\"result\":" + "\"" + final_result + "\"" + "}")
