Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E34596E
	for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601271; cv=none; b=D8Eo505sLl2b+ayMetcUm0CwjeqEZXQRBvjyFgKm9V76RBmj0H5BMrKTN5D/1V03VNSiy7EXyUUjVZp5Wmn5FytJpC9oeswG+xok8v0nUHP1kFO9qup6hbBDfrH9dtAOIc6hqgzPYoM7GBMHjw0Jcha8llREQ47r4qyhJyszuTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601271; c=relaxed/simple;
	bh=cOOD/LklXxoR0eMhE983UUMMSzNLG37BUxGl/wGbQDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sgeb6+Wh4+amlaCoX8dn4f6QGs/GctoGUbr3Ik4ascr/JVa60wrI/KA0q4XrAwGGz+BGwnap543E2cQDKfdaZhZLHGSzRE2EbNMziy6by0DG1LCrLi2rz0FoPhJCJxLSX7LtIIbkIuo3hygy44rDYbF2CvOZdz01o+30FepWvs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OV8E2ZA7; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OV8E2ZA7"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55f279dca99so2120495a12.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 03:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708601268; x=1709206068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Do0TBWnjEnIoXDwl9l+y0DORBcXXcd9fc9eqtcity5g=;
        b=OV8E2ZA7/3qKIq9XxOiU0xc2USD2KH7pa9256/AcfN+Zo+TQxLF7P6baYEyh4nS1WG
         Kqt/DNpu7rToM6Cvk8ZyHT48pLbSBj1iIxKfSqADP2LGWDGBkssBDSpPI1BtmXSfazKT
         9dpiSEBJxYoyVQAzu0XwM0epARahWzLAnXdtfFahkfQc/m/00D88ASYJ6ePQgcooj4rT
         FepYVaVr20stK8k8t+BOYIk166rbOQc4amPKRQi/GeNmap9L6aiiqwa3xt4YC38B33Bj
         oOvZhi3fvX7nUlA1iY3hiI1TaXl3dzKjaTd0XPCN9IbQ93AgpKRa0U5mBWNI8E4telEb
         tDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708601268; x=1709206068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Do0TBWnjEnIoXDwl9l+y0DORBcXXcd9fc9eqtcity5g=;
        b=YVviK9uFcRertjYqkAo6GEDqHg5oWQhfd4Yij5ur/5STl+Obc6/0HsKLDMAGeOXfWC
         CPyP0cxXM4oMG/asdVzbeeKy0U1LTZWJn1cgOMjlgsJSznhg3vI38gLvzfnTF2UNi7GX
         yksanGtTOfPsoPhZwUGFZx/xdbFNtDwQqjuxYYMEZm+YFU1PX1+bpdDgA3EAmxQrksOq
         IrS6kkHSegNOGAvUTfmDiZpFWTGQtEWzvbNDCWuiKyXLjZli6JQv603QMIGg2m8/GHgk
         QV5rPzprnVrLN2WXNzbCc24VNsHqsaemWifFtlFCbmYwa9T8EVu+toTv6vPJTAZ/G4BA
         Xqug==
X-Forwarded-Encrypted: i=1; AJvYcCUTqEavTjZDox0fVGy1K7sGm7ZCc9CHciZu005RDOoZ4+7rwxKq7evc2rbK7+Fis+GlNjGDYfDeKlgmEBXWkxneT0WHz8/fGQ6aISEglA==
X-Gm-Message-State: AOJu0YxsvAWv3CotvCm1l5UveIa4x3jFKnDJgLFlSKMX/KJtFR+AZBwn
	xEqrybsDNC3EDSAJ9j5cG9TxN6sMIao8XZmI+zYtfUN/oEdpklDC
X-Google-Smtp-Source: AGHT+IE0EJjVMt/9f6FBRlMGPMbshECGhv2n/wrzRJgLMOJuo6Fm0pjmCN/I/RAGwgqsZ63j6sGjSQ==
X-Received: by 2002:aa7:d455:0:b0:564:2519:5a74 with SMTP id q21-20020aa7d455000000b0056425195a74mr9130416edr.11.1708601267734;
        Thu, 22 Feb 2024 03:27:47 -0800 (PST)
Received: from localhost.localdomain ([95.90.186.51])
        by smtp.gmail.com with ESMTPSA id ck8-20020a0564021c0800b0056452477a5esm4338524edb.24.2024.02.22.03.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 03:27:47 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: rtl8192e: rename rateIndex to rate_index
Date: Thu, 22 Feb 2024 12:27:21 +0100
Message-ID: <20240222112723.18428-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240222112723.18428-1-straube.linux@gmail.com>
References: <20240222112723.18428-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable rateIndex in the function
_rtl92e_update_received_rate_histogram_stats() to avoid camel case.

rateIndex -> rate_index

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 64 +++++++++----------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b54dbc97d4ba..0a3c81e14951 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1527,7 +1527,7 @@ static void _rtl92e_update_received_rate_histogram_stats(
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
 	u32 rcvType = 1;
-	u32 rateIndex;
+	u32 rate_index;
 
 	if (pstats->bCRC)
 		rcvType = 2;
@@ -1536,95 +1536,95 @@ static void _rtl92e_update_received_rate_histogram_stats(
 
 	switch (pstats->rate) {
 	case MGN_1M:
-		rateIndex = 0;
+		rate_index = 0;
 		break;
 	case MGN_2M:
-		rateIndex = 1;
+		rate_index = 1;
 		break;
 	case MGN_5_5M:
-		rateIndex = 2;
+		rate_index = 2;
 		break;
 	case MGN_11M:
-		rateIndex = 3;
+		rate_index = 3;
 		break;
 	case MGN_6M:
-		rateIndex = 4;
+		rate_index = 4;
 		break;
 	case MGN_9M:
-		rateIndex = 5;
+		rate_index = 5;
 		break;
 	case MGN_12M:
-		rateIndex = 6;
+		rate_index = 6;
 		break;
 	case MGN_18M:
-		rateIndex = 7;
+		rate_index = 7;
 		break;
 	case MGN_24M:
-		rateIndex = 8;
+		rate_index = 8;
 		break;
 	case MGN_36M:
-		rateIndex = 9;
+		rate_index = 9;
 		break;
 	case MGN_48M:
-		rateIndex = 10;
+		rate_index = 10;
 		break;
 	case MGN_54M:
-		rateIndex = 11;
+		rate_index = 11;
 		break;
 	case MGN_MCS0:
-		rateIndex = 12;
+		rate_index = 12;
 		break;
 	case MGN_MCS1:
-		rateIndex = 13;
+		rate_index = 13;
 		break;
 	case MGN_MCS2:
-		rateIndex = 14;
+		rate_index = 14;
 		break;
 	case MGN_MCS3:
-		rateIndex = 15;
+		rate_index = 15;
 		break;
 	case MGN_MCS4:
-		rateIndex = 16;
+		rate_index = 16;
 		break;
 	case MGN_MCS5:
-		rateIndex = 17;
+		rate_index = 17;
 		break;
 	case MGN_MCS6:
-		rateIndex = 18;
+		rate_index = 18;
 		break;
 	case MGN_MCS7:
-		rateIndex = 19;
+		rate_index = 19;
 		break;
 	case MGN_MCS8:
-		rateIndex = 20;
+		rate_index = 20;
 		break;
 	case MGN_MCS9:
-		rateIndex = 21;
+		rate_index = 21;
 		break;
 	case MGN_MCS10:
-		rateIndex = 22;
+		rate_index = 22;
 		break;
 	case MGN_MCS11:
-		rateIndex = 23;
+		rate_index = 23;
 		break;
 	case MGN_MCS12:
-		rateIndex = 24;
+		rate_index = 24;
 		break;
 	case MGN_MCS13:
-		rateIndex = 25;
+		rate_index = 25;
 		break;
 	case MGN_MCS14:
-		rateIndex = 26;
+		rate_index = 26;
 		break;
 	case MGN_MCS15:
-		rateIndex = 27;
+		rate_index = 27;
 		break;
 	default:
-		rateIndex = 28;
+		rate_index = 28;
 		break;
 	}
-	priv->stats.received_rate_histogram[0][rateIndex]++;
-	priv->stats.received_rate_histogram[rcvType][rateIndex]++;
+	priv->stats.received_rate_histogram[0][rate_index]++;
+	priv->stats.received_rate_histogram[rcvType][rate_index]++;
 }
 
 bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
-- 
2.43.1

