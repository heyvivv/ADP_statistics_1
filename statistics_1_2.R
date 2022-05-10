#Q. 귀무가설 : 평균은 0, 대립가설 : 평균은 0이 아님을 검정하기 위해서, 
#   표준정규분포로부터 표본크기가 30인 자료를 100개 만든 후, 신뢰구간을 100개 만들자.
#   mean = 0을 포함하지 못하는 구간이 100개 중 몇개인지 세어보자. 

x <- rnorm(100*30, 0, 1) #3000개 난수 생성
x <- matrix(x, 100, 30) #100 * 30 행렬로 만들기, 각 행이 표본크기 30인 표본에 해당함. 
x.bar <- apply(x, 1, mean) #각 표본(행)의 평균을 계산

low <- x.bar - 1.96*1/sqrt(30) #신뢰구간의 하한값 계산
high <- x.bar + 1.96*1/sqrt(30) #신뢰구간의 상한값 계산
ci <- data.frame(low, high) #(하한값, 상한값)을 data.frame으로 묶음
ci

#그래프 그리기
plot(NA, xlim=c(0, 101), ylim=c(-1,1))
ci$x0 <- 1:100
ci$x1 <- 1:100
segments(ci$x0, ci$low, ci$x1, ci$high)
abline(h = 0)

#0을 포함하지 못한 신뢰구간 찾기
which(high < 0)
which(low > 0)
