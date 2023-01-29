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

import numpy as np
import librosa.display
import os
import matplotlib.pyplot as plt
import sys
from pydub import AudioSegment


url = sys.argv[1]
output = sys.argv[2]

wavePath = "./public/videos/cough.wav"


print("hello")


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


print(url)
sound = AudioSegment.from_file(url,  format='m4a')
print('hi')
sound.export(wavePath, format="wav")


create_spectrogram(wavePath, output)
