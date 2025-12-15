Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED94E1A00F0
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 04:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765771308; cv=none; b=Z9AtVzzIy4cVr0+g6A+SDnY5yb6TdlXm6JIYySE1FKvhrRZdr709xQVu+XZlJCZLZkClSyol8rAU4f5RaSu6bEzwa53AIGi/Cs2f8JsfKueqFAtMAzS4iZKvRlpEgSkU+q6JeWdC/xZ/5QQIjbxK0mWz+vUumYnxG3UJtE6r2K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765771308; c=relaxed/simple;
	bh=MkS0LQOdxvHc77uALW7FfqfopRejLuzBk24JnAEal6w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=bS8awewSkdd9P8m4b6zTlYmM6Hw6QBGHubBsuxjHXlxTCldl/rfCnLHTSvg0FayBN7733R3azEHvicGD787nMFBcSS5tB0QrVs3QsFba4eVNvUGMa/FoQAn/UmeOVZZhSrnY6yKsnQaroIap8Wf3cCGwIR5/ivWHbaMHdKE3a00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=HUguZ6tG; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="HUguZ6tG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1765771295;
	bh=PTKAT0uQJfdikJBB13LrpiwUoCQrr8fSlG70rDq1JYk=;
	h=From:To:Cc:Subject:Date;
	b=HUguZ6tGlV9N5rALut8pFv4O0/rQ4L11vnYJ6XoO0SP2o6REgACKXWaiu1stld3g9
	 jcpWZwkb5w5ExXcMDbalxR6awZfFOXgoBgAkFXQQ8SIiO64Nh3wi+4bcXqPBUr3bX4
	 GJRhXqwv8ZAQ1XE6swMacZjtuQF2Le8xxqXCG3N0=
Received: from localhost ([2408:8207:c5b:c860:9ec7:6e84:86df:b3d9])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 6296413; Mon, 15 Dec 2025 12:01:34 +0800
X-QQ-mid: xmsmtpt1765771294t3l2s1u57
Message-ID: <tencent_9CA8125E2399DA1ADBDBB8FF585FC95A3606@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeWQwhfJghkSpmiDelpxLPSGgQWFEScweWaIWDL1H49QQ4k/wMiQ
	 lx3MTMxB58nuNJC4hMGqkJ0zSOGdFX4VlIm71E3ZaI39vttUh9HQ2ss7JW52/26xfjRCE8Xz868i
	 SxDrU5ltbOjScGU3rzJPZg7uszu9s0uiV4kbxbecE3nlo7Hn97BAYQ3DWsMS4b5IUXnWqbqxMgKe
	 xcMxIDePFmfiRfjxdSXOUenmskpfkDE0ZxYYcERbrJ1LqyEViF3B61xlVT6djXJ7e/sum8gk2kyw
	 D2X+LIKz7v6UHPQ5CvnhcDw0EzF21+6qIbgZEwrcH+tnn3r/HaQdhEI0QHXo1S7ZZKnAHWzeU6ix
	 tvf/woT4NQVOsnk7YcnWKn4aBBtn7bsa0rqN5rB7TWO9UZbpiINUL6fvdRwcg6na+EVY/tSw2/AG
	 byoHq7sTWl+ZZbRcPKZQeF1qEBcRJSS7l9aSKfJQv/Hje88Z/8G6SXZ+OhKecMwrTvP6mUDFsJrO
	 NZ8pVkhp7rvmm+YLDh4DUR4hf6MnONewCtTbxs2SbCKkcD+d9YiP9+4HPVgrveEFhXPMt1uRLKcW
	 Lpl3biHGbQPoMVqJefStCDeBvKTGWqyTYdMDAgFy9/7vbm9bU8Z6jF3/e55e2oh6GjZCRYD7pxxF
	 54zQXpv14qK8W9I/walEASK2UI8Nhr8taxJUpUIj+Nc21FIGP0elAyBP3rcsNuDUVUKIHbfC8mNA
	 Lwq0LThANsTIqalCUV+liMQjKorIfncU7Qvu+dY12L+ID4nK+emS+KO9vClHP02np8tav0VYCkj6
	 8Z7/KoLptyaDTHZEAbDsm+m0lMCen8j0RNGaIRjgbeGcTMxsL3U/5VHdbh2G8ov9ibg0tzpHtKZ1
	 qjyuvFoQFRWP8htSQSfUR97dEVjk3bM+oM7TIAKKCdw2y7AdnHCETR9y8IjRGBap9B87YqfXgP7I
	 sZdzTj02v9R0VSteaZ0mhzv+bDPAxerCTQuP16QgmciQUN2cIxYy+psuYRQc5NiBUvw6AAO9HAQw
	 w+hVRltkzCTUU77e/q33pOSPSxO0fDgMPLO5YXIGQ9UqaBwPtyQJ0pW/M3NIJjVv4TuIkQOLBK8h
	 tUKDvs3ZcBlbBigZJ1wjgFcMSlkTfFJkqbxLIOb3w4bOxRqWU2YaE4eIoKwRv5FkHfzA6R
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Zixuan Dong <dbeidachazi@foxmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	Zixuan Dong <dbeidachazi@foxmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix block comment coding style
Date: Mon, 15 Dec 2025 12:01:28 +0800
X-OQ-MSGID: <20251215040128.41208-1-dbeidachazi@foxmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch warnings in os_intfs.c:

  WARNING: Block comments use * on subsequent lines
  WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Zixuan Dong <dbeidachazi@foxmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548805..cd81d9e4a3d2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -934,14 +934,16 @@ static int netdev_close(struct net_device *pnetdev)
 	padapter->net_closed = true;
 	padapter->netif_up = false;
 
-/*if (!padapter->hw_init_completed)
-	{
-
-		padapter->bDriverStopped = true;
-
-		rtw_dev_unload(padapter);
-	}
-	else*/
+/*
+ * if (!padapter->hw_init_completed)
+ * {
+ *
+ *	padapter->bDriverStopped = true;
+ *
+ *	rtw_dev_unload(padapter);
+ * }
+ * else
+ */
 	if (pwrctl->rf_pwrstate == rf_on) {
 		/* s1. */
 		if (pnetdev) {
-- 
2.52.0

