Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F523A9B3
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770573092; cv=none; b=kHMELeM3GRDCnX/rO2q0WobMQVdkKREUXAwTAA87j/5HXs2LQJLHldY125r5yMhzFbjr+FRwzHt7AkWSzBh9zFyRxN6m6p58UthFhj7qTA24kytZCC5NvQ7VBIs+DOwNKL/3CCKFpESc2HIvLDxrICTQ/fo2LkchFJc+yxMq9V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770573092; c=relaxed/simple;
	bh=4NWZlvcpyxbKMda9eLX4OsMcU4XLJDPr2scT42zK/pA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIsLPAWT53RpifSFZY5kWBs3iUEMIzaNY7ARcsmeg6jVe5vqecdpnHvv7sjdQ3+vKD41akvimgM0YFR5YaGTBtY7rHZWxNSOserK3AQhBQBrU7veGiPRc9oh9TZ2sKMrCkOTBc7zjXqQUpqhkqO6JJn4FLAXOwhCQ00vozak6m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjrwUYla; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjrwUYla"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4833115090dso9839655e9.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 09:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770573091; x=1771177891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4iKYL5Chvl6ih9LtcPKaHb8zyc+O0iK3+L8aHdHzQgY=;
        b=PjrwUYla9NO1t3HZxWZD14MwTx8IUQuR++Mg6c9KOXbVVvUdEJ8Poulh1ug7Qv/j9C
         DtEVyBrIE3KNXYg3mJEHK9TeHMSFK8ivl1ltAi4pshKhv7ZLSq7mZeKVMWU0EdU14VJE
         bEpnTKHXS+j4pskDMIesZurH6S2bRP4zzbG8HrVxcwF3GSGMcpYgnS8vKm3exWVcQ+zO
         L639lv57ZBglOo1KpuyRA4r4LBT4wnTuDPGSM+SFqx8Jfglq5m6bHewrIDYlYcaXBlTM
         3uZYaEEGhdzF8VHg6dBWsD1At2wHxEfHAfvqJ4+pOelDGVxLaC7e5rhIKIgTE2k1ICb5
         BhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770573091; x=1771177891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iKYL5Chvl6ih9LtcPKaHb8zyc+O0iK3+L8aHdHzQgY=;
        b=wq7F3tRDyvNCanGcu/Nd29FJ+otyWJiGErz+BkW6hPJoGWTFNp7V3SOehdZwS8JdO8
         VI06xY4eV7Fv266mJaxhvn+rpIv3ykBDMGvLYeW5FxwFtCmSes3j/pfED9j2JBTx6EZ1
         jCrStAKnYtCi2Hpv1nwTZ9mKLxc3/L4e3EgqivRbHGNzYDNvqMRgzamClu71UBLHtXnW
         TwDpS81GlkpKN7+vU9BpKNJpMWttZXBAjPtTnc9qbPqBXR/yAcnN0su9gahLHK7VlGnN
         WszIIlQolwL64CZqFgA65ost6BwJM9j0Z0r+8PrPgbB2lXhTxc2iOcrVALbJjJyIl6ar
         QB8A==
X-Forwarded-Encrypted: i=1; AJvYcCUhrFoc8wSH6iitQ8eUjJTpYpCxjc0a1SJVtSkuboXjzG1CRky5xK8V2QJLS1YOhlYVwdGBZMK6yrJ7sd1/@lists.linux.dev
X-Gm-Message-State: AOJu0YzXeDSqY/B19dFB7Qwmwps8+beGEOMgFZj4LiuSOFR/VIsSNFWd
	Det922TrKD2LO/kzyN9RbTFVz2UVbMlkZ7pQ9YDKuvzlc3DRdfMnP0Zl
X-Gm-Gg: AZuq6aK5Mu41+xckQz7qXbvQS20MRJPTlAMXAJESEO82FJnkbx3DB6SY4CLPd7pamTU
	ArQ26l11xC63nYxZ7spSvJKgKatZvD76urtqxFypZAWi/Pa2ZKMtWv/VptEw6NYpxoQgve5TPQp
	hzZv7kP8sK+6eeBVCWXjKu8CeruMD87LaaltFYBNr0BYcazly6qZ9exyQFbRWF3YfOFHRZo5JBa
	tdNKdjUOQAkkxtN5ZHmZk3yT+9GjBRMjGHpUEy0jj6xwufTuiV5fvkEvFkrXEVXsQnaDcrR0Nyj
	BMLQiwmmgiZWLvIFu1ntr+NzZLVpSixOrnHGci1xX3gFLCFAx0SNqKVdUgRpv+7pLbWcWEjeTo1
	XGPt7dfETwIzWolqNmI2crxxhkS8PJZtQcj8WqgS4ZDyYx87QHZP9FVftYYe4gyIRGAwiq0ZCuL
	ve3MILDUCIF5u97rSY07grB/ei2T+Fw1eLd8aNJ+0B+wY=
X-Received: by 2002:a05:600c:83c5:b0:482:ef72:5781 with SMTP id 5b1f17b1804b1-4832022593dmr136660915e9.25.1770573090648;
        Sun, 08 Feb 2026 09:51:30 -0800 (PST)
Received: from fedora (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209d0007sm70942415e9.15.2026.02.08.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 09:51:30 -0800 (PST)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: karanja99erick@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: simplify boolean test in rtw_btcoex_MediaStatusNotify
Date: Sun,  8 Feb 2026 22:51:19 +0500
Message-ID: <20260208175120.15717-1-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary comparison to true and move logical operator
to the end of the previous line.

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index f4b19ef7b341..444a602d2868 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,8 +10,8 @@
 
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+	if ((media_status == RT_MEDIA_CONNECT) &&
+	    check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
-- 
2.52.0

