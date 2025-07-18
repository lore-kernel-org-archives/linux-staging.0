Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB418035
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 01:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752803429; cv=none; b=NAxAQOl1vZK5AKRpN8KSiLlJ1zXTBVLR6/N2Mq7b1BMXL51YvAtkBcm8vUyzT0Ak/umGv8Ovh6wvzNKCftfgxi+iEkEzpwxkHhSuDqLAvmLHoOtnw24kI3LakibUvpYE5+ULTds0/WFDZZr2py1gJqxMP7Me0lbOTHrTWLOXbJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752803429; c=relaxed/simple;
	bh=sSF6GjXghc1GV1WEXBlQMli6JYp8FQUjuhEGOK+jmV0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=L+ajxNQLk17o2hybyDEArjQie+XO9Zrxo5bFp5Dkwj1KGHcMhSWZY41AOeWIWtvrgDms7B8ma2WH/GHXBOfwbmYZp+caABHmPnyrgkB/rakJDMB0NDK8DMlwtuK4LO1D/yNJOnlgHcZPLwmMU85digAjlvgZsfPhGl36Zaak31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDDndNx/; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDDndNx/"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6faf66905baso20741626d6.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 18:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752803427; x=1753408227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9E48+RSFL0xRXR+VqTC2UOx+PBaYVhWXemQV/BSEEc=;
        b=FDDndNx/4Y0N6StqvOygrKWDyGamgOUk7LSyZPDjLXn+S8qaK4yr8EqzQs8g7tFck9
         xIZqFqa513eazt/ms9WWbA1ac+q5QIoibD2o3kvjPBC7WiTOQks1lTQFjm+OXcdZ39KM
         pNvznrfjGj4NMgOP3gGOCsqmJbw6SWDpqRSdaQLxIFev/D6ni+ssYaj/dzeuEgiv+o27
         rNaOK9N1lP2AYHV7OkSD4aobi00VT11diyox5MaadQFA5bgQaIfLmc2hKK8FjfoZMdib
         +6Agm9LRwGvw0uFVx7TLvIab5K3AVtyF8BTpAAPtjysIRC8uAUzYkW0xal5d7e3vE+Ar
         ve+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752803427; x=1753408227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9E48+RSFL0xRXR+VqTC2UOx+PBaYVhWXemQV/BSEEc=;
        b=ANKfhG6B/vTf1YnRD5bbJRJWBHuwRG2TjjKEn7Pc6AOMEoiWj10fdyyZc1tK8mvv6z
         uqiwh4mTJWgKhOW8qLgp8xhNNmOMhR1AWNBCwOUesm/jG/ZknT0kMBtYIT0Z2gcee03p
         adlTcEx+Qn1ZRdxdHRb7RO5mAkTwqKTSTf4+u1s3oBdok099kHXn7DUaVffIk3urTpBZ
         /gyDLcoV7F0Uh4yFLKYkShOTYBIyjIkSx7k7YLs9vaeZsQiBXzVFh5IY6kWjnzRRUj81
         xEjBUvGWOnbGEl9llM+7w8ZaBNAkC81U2Ey/nzd214P9I/xC4g9Vut52uCSftuKGNM3j
         yvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXwOYe+HE3rOqs+QjNT8GQx5bER3NW+fIRx0mgATIyuGs0Lw/pn/OMR8BIbot3ZgBKu/+jM0Vn9rVn60xH@lists.linux.dev
X-Gm-Message-State: AOJu0YyJr0485sord4O8SPMuMGukqn/T9sGNWFGcHuM1F1qBnY6BkM9u
	tCTVm/UA/FAP0k2Hv0fO0perrV2ktCppcHjn9A4TqQ51wrRH2eVXQoID
X-Gm-Gg: ASbGncu8iSQA9oaxf/IsAU+w9qSuelaBUEW6GR7uAnDCqS4HSj9YPtssX3AKql1j/jB
	rcQjIgIuBynPMqJAWkTIPnP8ryecf43Q9U/aKcKV72yg4Ukk89znGBHld8K9yPgI7uXbl99TIxX
	FR9UjvdFWdyaukI8wBlLi2LWNzro7HSOeEJYyhLjGoguSG9HBKz4/obUlD2f5ToKNl4yDEvc23M
	Lk0SF8GIvRAUNFffXZ7U3c7/E2e35OR232UfFKKkFDHSCGJflz7xNww9DzrQy36/vXqHeDLulGl
	YGAw7Q6ezMehnASjUSOIKFDl9qo+tFz9mQ/eZPRT0UIICqq9e8V/mPbpyR5bQpnX1qTQpKwDJl1
	syZbevZbzLyDVAmB+hvHUJ8lZdIiHaPHU8YRQBHJl10zQaPiV2C4=
X-Google-Smtp-Source: AGHT+IH55WzzyvdjqHRW4WZoHyOXVFM7C0T9IzB9E+IGDC1bOrHif/PaQbxEfy9s6FhjkBb17LmKsw==
X-Received: by 2002:ad4:5d4c:0:b0:6fb:43d:65b7 with SMTP id 6a1803df08f44-704f6b46a96mr159069076d6.36.1752803426925;
        Thu, 17 Jul 2025 18:50:26 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b907181sm2372176d6.36.2025.07.17.18.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 18:50:26 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	vivek.balachandhar@gmail.com
Subject: [PATCH v2] staging: rtl8192u: Rename ChannelPlan to channel_plan and fix index name
Date: Fri, 18 Jul 2025 01:49:47 +0000
Message-Id: <20250718014947.162423-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames the global array ChannelPlan to channel_plan
to follow Linux kernel coding style. Also renamed the index
variable from channel_plan to chan_plan_idx to avoid
shadowing and improve readability.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 Makefile                               |  2 +-
 drivers/staging/rtl8192u/r8192U_core.c | 16 +++++++++-------
 init/main.c                            |  1 +
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 997b67722..93b6fa091 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = -vivek
 NAME = Hurr durr I'ma ninja sloth
 
 # *DOCUMENTATION*
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 0a60ef201..b449d0d96 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -120,7 +120,7 @@ struct CHANNEL_LIST {
 	u8	Len;
 };
 
-static struct CHANNEL_LIST ChannelPlan[] = {
+static struct CHANNEL_LIST channel_plan[] = {
 	/* FCC */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 36, 40, 44, 48, 52, 56, 60, 64, 149, 153, 157, 161, 165}, 24},
 	/* IC */
@@ -145,12 +145,12 @@ static struct CHANNEL_LIST ChannelPlan[] = {
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14}
 };
 
-static void rtl819x_set_channel_map(u8 channel_plan, struct r8192_priv *priv)
+static void rtl819x_set_channel_map(u8 chan_plan_idx, struct r8192_priv *priv)
 {
 	int i, max_chan = -1, min_chan = -1;
 	struct ieee80211_device *ieee = priv->ieee80211;
 
-	switch (channel_plan) {
+	switch (chan_plan_idx) {
 	case COUNTRY_CODE_FCC:
 	case COUNTRY_CODE_IC:
 	case COUNTRY_CODE_ETSI:
@@ -172,15 +172,17 @@ static void rtl819x_set_channel_map(u8 channel_plan, struct r8192_priv *priv)
 				 "unknown rf chip, can't set channel map in function:%s()\n",
 				 __func__);
 		}
-		if (ChannelPlan[channel_plan].Len != 0) {
+		if (channel_plan[chan_plan_idx].Len != 0) {
 			/* Clear old channel map */
 			memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
 			       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
 			/* Set new channel map */
-			for (i = 0; i < ChannelPlan[channel_plan].Len; i++) {
-				if (ChannelPlan[channel_plan].Channel[i] < min_chan || ChannelPlan[channel_plan].Channel[i] > max_chan)
+			for (i = 0; i < channel_plan[chan_plan_idx].Len; i++) {
+				if (channel_plan[chan_plan_idx].Channel[i] < min_chan ||
+					channel_plan[chan_plan_idx].Channel[i] > max_chan)
 					break;
-				GET_DOT11D_INFO(ieee)->channel_map[ChannelPlan[channel_plan].Channel[i]] = 1;
+				GET_DOT11D_INFO(ieee)->channel_map
+					[channel_plan[chan_plan_idx].Channel[i]] = 1;
 			}
 		}
 		break;
diff --git a/init/main.c b/init/main.c
index aa21add5f..648589720 100644
--- a/init/main.c
+++ b/init/main.c
@@ -680,6 +680,7 @@ static void __init setup_command_line(char *command_line)
 
 static __initdata DECLARE_COMPLETION(kthreadd_done);
 
+
 noinline void __ref rest_init(void)
 {
 	struct task_struct *tsk;
-- 
2.39.5

