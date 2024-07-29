int resetCount = 0; // 환생 횟수
int clickableCount = 20; //클릭 가능 횟수

bool resetAble = false; //환생 가능 여부

int upgradeRateclickableCount = 5; //클릭 가능 횟수 업글 정도
int upgradeRateWASDclickableCount = 7; //각 키의 클릭 가능 횟수 업글 정도

// 각 키의 클릭 횟수
Map<String, int> keyCounts = {
  'w': 0,
  'a': 0,
  's': 0,
  'd': 0,
};

// 각 키의 카운트의 합을 저장할 맵
Map<String, int> keyCountsSum = {
  'w': 0,
  'a': 0,
  's': 0,
  'd': 0,
};

int sumKeyCounts() {
  return keyCounts['w']! + keyCounts['a']! + keyCounts['s']! + keyCounts['d']!;
}
