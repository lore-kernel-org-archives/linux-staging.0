Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F008495AD1
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376371; cv=none; b=YcQIY9+c88CczpO06OLHj0OLUUIXfhrYIZW2Sze1cwNIgRLXN+z6SxtLHvX7XGD+0WILqy11z2x+ccYkg5/1hirnklndIz44Cpm/0GL06Jy+Xut7bAivaPJ40gstWDvQAfpox6H42w19T1L0I22ePUmdZIrP30lHPkE4LzY4mQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376371; c=relaxed/simple;
	bh=dO/MYzQtlvPps5IbTVeIsa5qsYyyHFhF9D4YoGd0YBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JfnwHwDr2ge9YXQBMESPgHLLcnbZhVKD6rsmsNX6jw0G/6NawJhZpPVcl9epBictxtomJBVVpN1gOTXaNJlYOCJcfuYjySWUGsm8Q5/+lgllpaAqa8K0bRx9kEoEco7rgPPximnU7zYNZfFUhFSRtrAUcy1wNkp+BR4ajXIwj8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=FvO9qMPi; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="FvO9qMPi"
Received: from mac.lan (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0C80220B7166;
	Wed,  7 Oct 2026 05:31:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0C80220B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791376299;
	bh=pQ4wwiT76BFMNoOhttbE0LTYGX4LwnD1SR8wJSletVo=;
	h=From:To:Cc:Subject:Date:From;
	b=FvO9qMPiKPvGfhZW2Vyz3UbxqEejz9FAFB37GT+vEnrP8K/rUmc+9nI6PMm4FC8mZ
	 HVwAL6Vx68paRZeC5MmnncijDmOknrioUAmcDLeDsSKdXz/WCRla7jOA5lBrqvPFol
	 Ehoh1MLM4FmviJl9kEEQwKYzWMLmH83bYvHFi+G4=
From: Cen Zhang <cenzhang@linux.microsoft.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Probert <linus.probert@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Quentin Strydom <qstrydom0@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: hal: fix a multi-line comment in hal_btcoex.c
Date: Wed,  7 Oct 2026 08:32:21 -0400
Message-ID: <20261007123221.60521-1-cenzhang@linux.microsoft.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>

The comment in the BTC_GET_BL_WIFI_SCAN switch case of halbtcoutsrc_Get()
has coding style issues.

Fix them by placing the opening and closing comment delimiters on
separate lines, and keeping each line within 80 columns.

Signed-off-by: Cen Zhang (Microsoft) <cenzhang@linux.microsoft.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index a06e2e5b516c..d231b0277b76 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -290,8 +290,11 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 		break;
 
 	case BTC_GET_BL_WIFI_SCAN:
-		/* Use the value of the new variable GLBtcWiFiInScanState to judge whether WiFi is in scan state or not, since the originally used flag
-			WIFI_SITE_MONITOR in fwstate may not be cleared in time */
+		/*
+		 * Use the value of the new variable GLBtcWiFiInScanState to judge
+		 * whether WiFi is in scan state or not, since the originally used
+		 * flag WIFI_SITE_MONITOR in fwstate may not be cleared in time.
+		 */
 		*pu8 = GLBtcWiFiInScanState;
 		break;
 
-- 
2.55.0

