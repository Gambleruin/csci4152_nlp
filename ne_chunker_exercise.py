from nltk import FreqDist
from nltk.chunk import ne_chunk
from nltk.corpus import treebank

chunkd_trees =[ne_chunk(elem) for elem in treebank.tagged_sents()]
word_fd =FreqDist([' '.join(word for word, pos in tree.leaves()) for tree in chunkd_trees])
# print("Three most common named entities are: ")
# print(','.join(word_fd.most_common(3)))
# print(word_fd)

