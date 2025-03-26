Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2FF19CD13;
	Wed, 26 Mar 2025 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742974135; cv=none; b=EcmvrWSW4q0Iv2b4Wyokc/CIYQIBYTvzlrE7J9LrgigrUwqvOvkK6/gsrCcA/bemzd4O84/hXqiyLJCdkba4LO6RiEgn3dyytZmuA3lgNj8J3TdPqWbJK8cXWLZxCbBt81HjEyDzf1mMBWvu+IAFFdL/PduvuYcwFaVEhUwiCpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742974135; c=relaxed/simple;
	bh=LfAZcSwVWHBjKeKz8WpCYmIYe3EhckrRr4HaVJWjrf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6Dls7F1SODgKVPx1hMyvOaFsdFUkgI0A6Tz/i6XrJ80c2FuOU6uUcFMoWfiP+DJVby6n+x0I+UPaCUk2wZiChZcdaNie+eBSQFooJPHZ6Y9fUG7KNz8ZCiLLJ9PJbAfAN4aEv+ErXHBIxIWlxQpXo9CzswMCTNA+9nBYeHzIAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNlewrlC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNlewrlC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso45518165e9.0;
        Wed, 26 Mar 2025 00:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742974132; x=1743578932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XiWJ6VyTMM17GbhhguALUb4t5szUucYhL49egidGGFU=;
        b=hNlewrlCinQC8WK6nrdp3xL3riXQy1FmN0QqF8uqYBEYxArMWk0Zsk5AskkY6yoJnG
         7f2pRY/cR19zNbH4ruuJSeV25UUObzaDSihRYKgD3j8Y7f+NrzyAt/PtRUXKv5mk1Q6h
         zTC1sK0ctKRX+oC1lKN+d5W0k+7xdCyFvnV6KNf+fJS8bGpfyqlQnIbYi+5klEML79Xz
         ScabLpCDjSATQ6deYN5rzPzbxwiZdb1GlEDGQY+/JX0fcsK17tmzyBTAFpFOiF4ytKlQ
         02IX9OZtBaRTR2Vvvu00pQO80dLFimdSJaUOveahJxlnOrOevQhcKltogWaJy1x82EiL
         N+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742974132; x=1743578932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiWJ6VyTMM17GbhhguALUb4t5szUucYhL49egidGGFU=;
        b=VHeaA0ginYgRxNIWV+Hune/Gkn5H1zRcGL6RUMlytoKWTQ83NNejlofKQUgNJmBNwF
         grVmbJ4IOoqNGj3ve08yURYYY0MRSgCTwpXmsHaO/A4h9RrkpB12kSWDpBXgBmCEZinq
         4M28tlr9+ktS1l7bs6gc9D7s9LqF4FFbXCfmcpZTxpyRYZM+wq/o/u3/Kzo95P28Eqj1
         PNZZTN+HOXxvr9wPRbdy74zqF1ZNF0VBiuKt6UG2SWjrtdazNQ+vM7w0YD5S5hOvr+/I
         jqXNBGu+/9rYlSOYUNQZJvO0hVTXv8bUEOqR4Yhzgi3WWPtdJTcAnkdpcAQmv4ULESJM
         jb5g==
X-Forwarded-Encrypted: i=1; AJvYcCVplbSt9NoampKgJnrl8c6yNcQ3sd6norw8+KZvUETog8V5+Wlml/qbnED2NM0zhqav4c3aoUnNSpMj@lists.linux.dev, AJvYcCXXU6NiuBv1ynlWGYAq8kc9TpFH99LH3ddD1yxYThVL7qv/kfzneH6XnmAZySo/RNzx6As+/jo3qzmUQeah@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvkg8Ug4qdt7I1yMhgSI9FOoxudrHOPzPPQYImxHRhYciQDfx+
	SLedxWscWYRIg8K041POGcuH2lsQysBwboxSdNpo34/yMgxhCQ5HpN3fPafHzFk=
X-Gm-Gg: ASbGncsQ0vZCZ1qCf/bKjns+BU222EWhkaccGc81pYIEhMlo/EowtT8m/flfQ3hVGE8
	xqSS5p9LSYuLRUSN9VL6zCy8GHc4VGqSQCDWXH+BVtA3bq3I77wUO+7A/UvRzSs+LjciJWW6G8K
	fSS7dXD2UcChEjd8OAhApuBxTQugGIP210h/D15tuzGy+GKUDAd5dQ7qz09LIVSdUbeTikqfLoK
	tiDUvX/xdS6Yuu4Yf5MZU/WxGvKKmW52hWK0VLvyizXbwcECQd6TJ+xMZvxBej9wLHE47TaMnfk
	kBahnDAC7WNpsFduvtmhKO/6Rye5+t4nM/QXpwAXrQ==
X-Google-Smtp-Source: AGHT+IGnW2A4jsdj1Z8yfFb7tuiieNjS2/hY8dI9Tw2HiSljJAD6f8ZVhhG8oHJF3dcYC0mX59QNTw==
X-Received: by 2002:a05:600c:4e87:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43d509ec5bfmr151377935e9.9.1742974131580;
        Wed, 26 Mar 2025 00:28:51 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fceae03sm180783435e9.8.2025.03.26.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 00:28:50 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: rtl8723bs: Rename variables
Date: Wed, 26 Mar 2025 10:28:42 +0300
Message-ID: <20250326072842.10344-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable `mediaStatus` to `media_status` and variable
`lpsVal` to `lps_val` to adhere to Linux kernel coding
standards by using snake_case instead of CamelCase.

Fixes checkpatch.pl warning:
	CHECK: Avoid CamelCase: <mediaStatus>
	CHECK: Avoid CamelCase: <lpsVal>

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index d54095f50113..f4b19ef7b341 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -8,14 +8,14 @@
 #include <rtw_btcoex.h>
 #include <hal_btcoex.h>
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus)
+void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((mediaStatus == RT_MEDIA_CONNECT)
+	if ((media_status == RT_MEDIA_CONNECT)
 		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
-	hal_btcoex_MediaStatusNotify(padapter, mediaStatus);
+	hal_btcoex_MediaStatusNotify(padapter, media_status);
 }
 
 void rtw_btcoex_HaltNotify(struct adapter *padapter)
@@ -52,14 +52,14 @@ void rtw_btcoex_RejectApAggregatedPacket(struct adapter *padapter, u8 enable)
 void rtw_btcoex_LPS_Enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
-	u8 lpsVal;
+	u8 lps_val;
 
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	pwrpriv->bpower_saving = true;
-	lpsVal = hal_btcoex_LpsVal(padapter);
-	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lpsVal, "BTCOEX");
+	lps_val = hal_btcoex_LpsVal(padapter);
+	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lps_val, "BTCOEX");
 }
 
 void rtw_btcoex_LPS_Leave(struct adapter *padapter)
-- 
2.43.0

