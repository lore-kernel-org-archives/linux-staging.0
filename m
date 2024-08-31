Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA69121364
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725116384; cv=none; b=G4Rkt68dPM0Rt88zrS5DjygaM/nlxxr4ktIqtdQXcA1w8xzMTBMPGIS1dWU6Egsp45TS9HJJazTdgrK/lH04czVLrRHfKtWV0uEb4cHyQsUitY9IOEin1V7Zn6IUvk1bZJdXa4zylfZX1KnfqOkz8W8npsUGr3gNwGuyIk6Alfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725116384; c=relaxed/simple;
	bh=Pn8KwUv0DkKQ+7ZtjyoKep4bskoqW4L9AuBTQBa8zuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFhkQtXQr2CH4eSZf63/HzV8Ig9MQWQbPEHVbPQkNnJ4msXxikaNDcigdRtUqgDFZCzE101nmCwECXLWyOJnNMciVZrsXogCQHz/omogn8Lv0spxgqPAFj/GfhHBx32B1fhQ3m9vjjFq6A26ce9R+VB1DPDXaqlGi9IPzli7vEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drLS//Rz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drLS//Rz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-201fba05363so23060155ad.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725116382; x=1725721182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OyVG1AgOZE9WJVZe0FpJwMfaDm+MjzUmj8n+GYSoTc4=;
        b=drLS//RzeHSDaDMVxR4v4h/mejQfvF1aNS2/VzLatvh42WxYbbq2Xrk+NO6DI9/sm0
         +rvNW2Lbmp2RW65L1mvYM4IDRw5TtolU+I/AP5bervCWh3CV7R8ovNL31MQkNpr+F5Mb
         jfjQn7r9JSX+e/1GvBSTb77lPunJZ6wNpjeL8FCCrVW6J93DggtIaPemQGT5kglB2x4P
         8MKcnI7rrv/VYtOa24RzcNjzy+NGdr62wUvNZkQDUueZN61C4utUweazmDBCYR8t9clm
         e7pL5I3PTwdF+b4V7RSkUpsbvHQU1xB5nTIbW61mHmxRidNFm9nBx8p7rBbVtdQncUAd
         +FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725116382; x=1725721182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyVG1AgOZE9WJVZe0FpJwMfaDm+MjzUmj8n+GYSoTc4=;
        b=KAw62GW97kgZa2RUqvST4gw0q9qrEyr13I6JkLCcDahF/WzPHpJF21B75QUVSyWVWr
         JtYYZ6keqXZHxnkyU4WOTANvHtDVyEoD4dnWeHBkTl4g72yyQQSdmm4GqUIv05DsfNyo
         WBU00iPHAnvh8+1agLybaczCkyEfNmIk35hTAppoydEJMLMMBm+FQjCYCpV3BMCcQRdU
         6FXH8IQIaTF/VF8jmhvd4QoUeHo7xdEnST+7pCKPnKpsea+E/SGxiyeU3qzEEGnCVxJ6
         5UcSRc9eQSGoA/J+cxFeerXln6y9MQ0PxcUDGCyYfR4Qm8rXxDQkjiDF68qU5CpJGFF2
         LZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTn6VoyqGYIi1CazCgGxcSS2ji408UPeWaM6nvedYd+juz4o2M8ciY+fldt1jdZ+vuNOWzPm/u4yEAkiHU@lists.linux.dev
X-Gm-Message-State: AOJu0YzOhF++AJokAcDsxXR7Mx7M0iZiuPDxoVkX1QsIV6FyuajPYoK5
	kWxUzZkA+dVmguXks/Kpa/Gv0w0mRc6IEhIad8+RLt4Lo0Y5MKk8
X-Google-Smtp-Source: AGHT+IFFBXtR4oC1CxsZUzXfcNqZjWooOa3vPuKcBV2xy77m/B/eASaxdy4YIUPTCK7rRWJO6GOCQw==
X-Received: by 2002:a17:902:c94a:b0:202:3dcd:23ef with SMTP id d9443c01a7336-205447bc4c5mr20674015ad.61.1725116381799;
        Sat, 31 Aug 2024 07:59:41 -0700 (PDT)
Received: from fedora.. ([106.219.166.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205456242fesm12548175ad.53.2024.08.31.07.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 07:59:41 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: rtl8192e: Rename variable eRFPath
Date: Sat, 31 Aug 2024 20:29:32 +0530
Message-ID: <20240831145932.37744-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable eRFPath to erf_path to fix checkpatch
warning.

Issue reported in checkpatch:
-CHECK: Avoid CamelCase: <eRFPath>

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8190P_rtl8256.c   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
index 7061f1cf4d3a..256c19739ad1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
@@ -12,7 +12,7 @@
 void rtl92e_set_bandwidth(struct net_device *dev,
 			  enum ht_channel_width bandwidth)
 {
-	u8	eRFPath;
+	u8	erf_path;
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	if (priv->card_8192_version != VERSION_8190_BD &&
@@ -21,22 +21,22 @@ void rtl92e_set_bandwidth(struct net_device *dev,
 		return;
 	}
 
-	for (eRFPath = 0; eRFPath < priv->num_total_rf_path; eRFPath++) {
+	for (erf_path = 0; erf_path < priv->num_total_rf_path; erf_path++) {
 		switch (bandwidth) {
 		case HT_CHANNEL_WIDTH_20:
-			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)eRFPath,
+			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)erf_path,
 					  0x0b, bMask12Bits, 0x100);
-			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)eRFPath,
+			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)erf_path,
 					  0x2c, bMask12Bits, 0x3d7);
-			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)eRFPath,
+			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)erf_path,
 					  0x0e, bMask12Bits, 0x021);
 			break;
 		case HT_CHANNEL_WIDTH_20_40:
-			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)eRFPath,
+			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)erf_path,
 					  0x0b, bMask12Bits, 0x300);
-			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)eRFPath,
+			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)erf_path,
 					  0x2c, bMask12Bits, 0x3ff);
-			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)eRFPath,
+			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)erf_path,
 					  0x0e, bMask12Bits, 0x0e1);
 			break;
 		default:
-- 
2.46.0

