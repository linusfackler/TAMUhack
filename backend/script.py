import numpy as np
import librosa.display, os
import matplotlib.pyplot as plt
import sys
from pydub import AudioSegment

print("hello from script")
print('first param:' + sys.argv[1])
print('first param:' + sys.argv[2])


url = sys.argv[1]
output = sys.argv[2]

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

create_spectrogram(url, output)