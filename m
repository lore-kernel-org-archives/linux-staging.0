Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1148D379C5D
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 18:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786301612; cv=none; b=WCI88J1rt8Nf3f5QcassffpK8Nwr5fCaIYtVn1Ya2s65PHuFne0mphqimjGZZFx2lw2+T8tkh81x5tpcAQpBo1xo4Jd2B/Z87zAq8FLTHDhGK8FCDX94rU5U2w8KnfzSVurtMJFmBAPITCdnfQw+mNQD8RHM3l7oOXFy40ExEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786301612; c=relaxed/simple;
	bh=vN4wii90rGvgxtMU/3hnXISL0ebXlS2sxsJu9H7SGaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AT5/bnZf1ader+4oO9aFcj2OSG8bLaSY3wM2y2mT2u9CU/I4v/yL34LRf+B1pcyR6Kwj0rhQToKYFJWoCLCtHdGUYiB+0cWlxR1v4C0QBOnHwKTbgR0OQZMA1wO3V5tJNoytYprEvyQgKSpILgl4GQZtp/PvdGUo2J2HmHd5gps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAgb3BTq; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAgb3BTq"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c998fd549a8so835590a12.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 11:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786301610; x=1786906410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C80OYfvibE1dW6sseYil1YEx8TM2408E19+TKhi2ui8=;
        b=PAgb3BTqEni2B4bmPQkrwZqacYGoubrnhz/VsniakBuoiQr/5UWKcwrf4bME79+S4C
         NJ0AXKeSoVe75AOH+TR+6GHeXKWeZitGh0f4WBrCZCrj78Tdcs3oA5yv2CO0ryCpbiis
         4R6wzBHPblXg4kPb84LmpjijkD408LKbyc+9o8v/sH3NdmHKWtrGHCLGtvVdZAbZW6Gh
         RaRBQgx9E5UYCzHBeqKJsDlcV6vuQj+ORwLLvYBUWbS6cYon5EGpmBfdGSyisUZMbKPO
         CvTTiSJkdjLYLwULtuKXuqMVKbHMeG4xinNV15hTelfVnnCUc3L+a6wHluFTA+GKCLzg
         PrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786301610; x=1786906410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C80OYfvibE1dW6sseYil1YEx8TM2408E19+TKhi2ui8=;
        b=f4Uy6SY841PEhyjoJzzDIoNLhgL0peZIgrDrpHgT2SxrPdoOYJ6ER60gilBsi69xL7
         QvS4KkPie8EFVQZMmQ/EehfjrBYLYW4fWUFRLQCOtrBeOWBwj9wS8xn84NygaO8h/5st
         OsEfGaZQ4L00IEekGzZZcYw6pnEI3i/qPJzpIimJxmYJA02YTrPYP7NgIoM4vyBy0O/B
         Kyz+54kJsyUckgnDSs7iFBbH9THfNiH8zgcYvaZtlU2MI75kgDflaV+VX0kJQRgYULxU
         huw0F2O1/y5OcH77oFEb+pNOCgfEGf1fGzxKjfgUY58ICrqm+2bJ+RLkVVZNzxXEkT1F
         zD0w==
X-Gm-Message-State: AOJu0YxGA+H7E+XJiIjg1Yuamo4wUEGcgy6huqTPguYrnVndlAw9Hbh2
	IR4PFOAutj6EkcnYzLvegzcpQ0zAwSs/UJitypod2nVhOtGNIiunOSuu
X-Gm-Gg: AR+sD11dtbIXozc4/TxPRx9/dLQO+sV9t05U4QVrOru+9pFPa6fz6jo0s7LIbsv508d
	7bth7zniPenjM3yunWtx7slYsp470CAjDbjlguGyrxpx5sVmLWu9HlQNxpTgKaV7YDpxDNSBmAH
	+/KJz85ZQvZ7vr1PZmXk4WAmwK5bZYNScBdcZ46RfIVQHb1Na7zDCJY1+nzjEeFM0fxJY5EEh65
	CSboyLwdDtWnPcqaz3sI5kaYxp1UhEHbILL/4OsuET/all3mwZZiMcM1AzB4JewcWKLmgfNLsN4
	6WpqdfrV3CP7A/cn1sbG2lOexVBm52ieawHydJBECzieZFRgPl//VvQcjpJ8jxjp323r+uhdtNp
	FsAzqRUoOT9JufhHz2BQskXDtLxQxvZjhUBtN6enOcNAzwyJOKq0Tq5Cwumim5ZDg5rORckc4A8
	rfHapXhz/aXImdVTW7MBPssN2th4NiYmj89jLUfzkRF1NK0XwEyEfE+oM+eB6wmDLg6RYodl6p
X-Received: by 2002:a05:6a21:a38d:b0:3bf:6fb1:ce0d with SMTP id adf61e73a8af0-3cb85ea3663mr45778904637.21.1786301610180;
        Sun, 09 Aug 2026 11:53:30 -0700 (PDT)
Received: from localhost ([103.210.95.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141018f18d6sm30469797c88.0.2026.08.09.11.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 11:53:29 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in HalBtc8723b2Ant.c
Date: Mon, 10 Aug 2026 00:22:50 +0530
Message-ID: <20260809185250.347772-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary curly braces around single statement if/else
blocks in halbtc8723b2ant_BtRssiState() and
halbtc8723b2ant_WifiRssiState(), as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 50 ++++++++-----------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 6da6940c9043..426662d8ba79 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -35,49 +35,43 @@ static u8 halbtc8723b2ant_BtRssiState(
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else {
-			if (btRssi < rssiThresh) {
+			if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preBtRssiState;
-		}
 
 		if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (btRssi < rssiThresh) {
+			else if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
-			if (btRssi < rssiThresh1) {
+			if (btRssi < rssiThresh1)
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	}
 
@@ -110,37 +104,33 @@ static u8 halbtc8723b2ant_WifiRssiState(
 				wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
 			}
 		} else {
-			if (wifiRssi < rssiThresh) {
+			if (wifiRssi < rssiThresh)
 				wifiRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preWifiRssiState[index];
-		}
 
 		if (
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (wifiRssi < rssiThresh) {
+			else if (wifiRssi < rssiThresh)
 				wifiRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
 			if (wifiRssi < rssiThresh1) {
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
-- 
2.55.0

