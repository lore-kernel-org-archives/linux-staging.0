Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005921CA1E
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753023393; cv=none; b=pb1kgwQmZ1iG7y/VwBjsLGpIYCWkF9L2cb8BgTiEKPDo/pooTw06GIOF65py0sidSKpFnB+yHWz1+mBxDFJgsmzEJj0Tfo79Mql33J9xCLqDxpX9tSWnu55GDXjNi+fxpmjQe8Ts0NYV17iYfjgMYKDXWiQNAD+znbjFzAKv2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753023393; c=relaxed/simple;
	bh=mWyrTWsnTK7eVL2ucLwWqpg72terTu+CfZahdXbXO8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zlp1GYVb8Z09ZiTq6rlH8xEyeagBe5JBncRH1t3NOLgXBr7zEan7aMJSVw6wWcP3W+K2XSqtPZwleP/aKKOYMKBrydcl5IyWDfy4Mntj1jMIo1SlizWMbhQ3XmBY/5jWZdUQBEEd5nx6Wxal247iC5WwKsmLJ6r7iZOvfcJj7M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqjZdeb3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqjZdeb3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45622a1829eso10619785e9.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753023389; x=1753628189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRdo3LqdiuYxa0l565rnPZPszxyhOzRNI2kuLRN50Co=;
        b=lqjZdeb3BdUHN/uEWWd4uJNIuMstOureI8lQnYYOx/BF9b49r61bLJO0cPSVhJ3dyc
         /3Vbs7lqTU4buaUiYipTm5GrATWOVdscNbQiCoIh7CwHqJJCIaa3P+W877wywGwlZtXn
         InLAkza/9dh0kJm84I+4iGcyQhHr/AfQ9v4DvsjyxFYI9E0p82HB2GS6yoiURfhS/F75
         oFlRFSY4zhIpWdx116Vd50Ytl9DtxIUhwzeLuJiDxKQb2G8TW9aEM8B28dNaqt8vFC8k
         MjqxoqVy+xv02QaESkADpjquHhytGUQq77SYUgWEURuor1jdUg8/ZJ0BoVpeEb2fi+lh
         BdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753023389; x=1753628189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRdo3LqdiuYxa0l565rnPZPszxyhOzRNI2kuLRN50Co=;
        b=fsSluU7NSeyP7QHhYvN7gkYgMDNzuTJDjCNHTfW1ZCSC2Zhq7362jmY+J0i/Qorhod
         7avF5MD/WFGma+qgoB8ma0+dmx/q7vmnkkQUuOUptQNnJcEyro+CCqvEnkvYyBk6N+uv
         5EP0FXNS2reG0Dahe+69QZIqf6nqGgZFY0/Mjt+gtNc7BSnePhdPTrkoQsaSxhwoHSXf
         e9M3UCvIWAvqs6xU8z3l84NYEsumO0F+3GaJsxgMBZJKjFaeEFLUbX98izEts78scoIu
         9NIuJKp8S3dg1FljzBD9i4wfqcApw3l0cw1ueBNzi91FsfkAQKh4IJSW1gjxNSV4DbOn
         q/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUsmgzaI5Qd1mkBFakZqyElV2l5/VxBA14JstYQ78G8QYntIYx9rBJX7jyNU/UQRCZVlKT8cNP+qYKus6sE@lists.linux.dev
X-Gm-Message-State: AOJu0YzEsihyKqcgz4/BcHZyBui3e5wQTf3wWW6P9zejP2Vp70F5pxhG
	0pRSbRH7Xn7kwl58HP0mp+yb/T02EUjj6zbO9cq+6+X1ItP6V8lZh/MTqPUKmPdd
X-Gm-Gg: ASbGnctwdwUnrTOiWiDcgH4+nX4cVVmEhPzP2H/5MiCiwpJcfIotGsJS+ANCleDyzGZ
	glnwNIONmPaVTX/CNmqmdHWwhXlqFvdYio1W7rFy7HMjYFpkyTYJVmSHvNZTZBnjbeTQKT3WArU
	xAbaTJPz9NdZ5L4MlGj7E2TQT1IX6V/Adjmt5TFGD2tsGDlmKyjSWzQYsMpHVdn3WilwhKr301i
	y4n9dxeRd4gSPggt3u/rE5KkHV+Iy0JqVOZvfwvbCouL5zpvWFUq2fxkd/+pP9vlgBuwYkQBM+y
	qVhfKrphDZpuJ01Ew9NG2zgMb3V2q5ekTYbMjBkJM/JCa/lD5becE900JZx7sj3OOhl09mYVSCD
	ymasdL502RiMt1951dx82WXt+TGRHoJo=
X-Google-Smtp-Source: AGHT+IG8e1KtQzYSLx0BPesPFUjhuIJ7UDeJpFPe7u5MvIMjFZREUEhHGw4SPCYps+xOIW03s3F4nA==
X-Received: by 2002:a05:600c:8205:b0:456:2020:165d with SMTP id 5b1f17b1804b1-4563b8fcc48mr93798435e9.31.1753023388967;
        Sun, 20 Jul 2025 07:56:28 -0700 (PDT)
Received: from zephyr ([77.237.185.246])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4c754sm7770550f8f.59.2025.07.20.07.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 07:56:28 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: replace unnamed parameters in hal_btcoex.h for consistency
Date: Sun, 20 Jul 2025 18:25:24 +0330
Message-ID: <20250720145524.9733-4-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720145524.9733-1-A.Nasrolahi01@gmail.com>
References: <20250720145524.9733-1-A.Nasrolahi01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update unnamed parameters in function declarations with explicit names
to be consistent with the rest of the functions in hal_btcoex.h file.

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_btcoex.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index 525cce3574f..df58b11605f 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -22,7 +22,7 @@ struct bt_coexist {
 
 void hal_btcoex_SetBTCoexist(struct adapter *padapter, u8 bBtExist);
 bool hal_btcoex_IsBtExist(struct adapter *padapter);
-bool hal_btcoex_IsBtDisabled(struct adapter *);
+bool hal_btcoex_IsBtDisabled(struct adapter *padapter);
 void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum);
 void hal_btcoex_SetSingleAntPath(struct adapter *padapter, u8 singleAntPath);
 
@@ -46,9 +46,9 @@ void hal_btcoex_Handler(struct adapter *padapter);
 s32 hal_btcoex_IsBTCoexCtrlAMPDUSize(struct adapter *padapter);
 bool hal_btcoex_IsBtControlLps(struct adapter *padapter);
 bool hal_btcoex_IsLpsOn(struct adapter *padapter);
-u8 hal_btcoex_RpwmVal(struct adapter *);
-u8 hal_btcoex_LpsVal(struct adapter *);
-u32 hal_btcoex_GetRaMask(struct adapter *);
+u8 hal_btcoex_RpwmVal(struct adapter *padapter);
+u8 hal_btcoex_LpsVal(struct adapter *padapter);
+u32 hal_btcoex_GetRaMask(struct adapter *padapter);
 void hal_btcoex_RecordPwrMode(struct adapter *padapter, u8 *pCmdBuf, u8 cmdLen);
 
 #endif /*  !__HAL_BTCOEX_H__ */
-- 
2.50.1

