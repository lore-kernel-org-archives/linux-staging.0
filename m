Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1DF71
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:30:43 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id s4so164823plg.12
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uEpsBQ7rbIhP4Lk4USk29pB1/Jh9hlfSvj6sx/s54ew=;
        b=CPh518p/r8+QMg9oy2zojCmiPG000e/X5GAIQdUmXiiAX8TKjTKiDsogH5MuYx2cSP
         +PrErEO5kTBoYRvO6TGrOFqB2IChBhkIKR4XY6wr3VIR4P2K+EzF3dQfOeBm0ijZ2lX+
         ZWHAU6fbSafvSd6UwtzzID1byTAP1kUGlUPyKsdMcw33seFgNKYnOfLdXo7i3wQFXWmw
         uo8AoyUDwoXdabsGyLpMfBq6bHHWKlXbZee+yNfpQ+LZDm3Lctr95jEutIAehzq3p7DC
         bP/YYiCXdPdn3zbS8ET5tTA0cgvn2K+lh0BFgpqepY4D60+KizWbw7etXQSMRTQKKL8r
         tjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uEpsBQ7rbIhP4Lk4USk29pB1/Jh9hlfSvj6sx/s54ew=;
        b=njUUR41UhGg7mGkO6cCIrYPSYG0ujfYi/zLkX/BEaNuCaoDFvxB4f/B/7G4QrBbrux
         jjs6ikJnvHXX3qP+gAebQDDGCafh86F5VitH0v81gehEnlzUjg5lOvQup4tCy2/ivC+H
         FrIOxc6iILuuSM5IiNtIen7FNlkuEWXeC0/bmsSn+BooShE4EAuBmyC722yI/cp5LaYG
         PnAyAfjDeHMkzEMKLPbAsWTOLYPnVFVi0u7EGwWMkpD0waWypXhXivpVnV5ItOmP2HMs
         AmWhr5cNHSlHwt173ihr7eRykZWXaF6eOmVgr7xI+jTECdmEncztGFb4l2ExzVsWgknG
         7/FA==
X-Gm-Message-State: AOAM5326xbdRtx0uMoLMv4d5aRFbxyz/nFIWj5B+Fb3ei4EvKG9GCrPH
	D/EL5+RM7Jwqbvq7cJVzxiE=
X-Google-Smtp-Source: ABdhPJxKi7aaoJ2oTE+wusMlkpoH9EasCm6Ge0iNmg9wM5wsjtnsjRUyHskEs5grSdg7Dqxer7lLGg==
X-Received: by 2002:a17:902:6ac6:b029:ee:e9ac:59f9 with SMTP id i6-20020a1709026ac6b02900eee9ac59f9mr55255447plt.58.1621168243305;
        Sun, 16 May 2021 05:30:43 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
        by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 05:30:42 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	fabioaiuto83@gmail.com,
	fmdefrancesco@gmail.com,
	eantoranz@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH 3/7] Staging: rtl8723bs: fix indentation in HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:23 -0400
Message-Id: <20210516122927.1132356-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes the following checkpatch.pl errors:

WARNING: suspect code indent for conditional statements (32, 33)
+				if (nCCKLockCounter < 5)
+				 nCCKLockCounter++;

WARNING: suspect code indent for conditional statements (32, 33)
+				if (nCCKLockCounter > 0)
+				 nCCKLockCounter--;

WARNING: suspect code indent for conditional statements (24, 26)
+			if (nCCKLockCounter > 0)
+			  nCCKLockCounter--;

WARNING: suspect code indent for conditional statements (16, 17)
+		if (nCCKLockCounter >= 5)
+		 pCoexSta->bCCKLock = true;

WARNING: suspect code indent for conditional statements (16, 17)
+		else
+		 pCoexSta->bCCKLock = false;

WARNING: suspect code indent for conditional statements (16, 17)
+		if (nCCKLockCounter == 0)
+		 pCoexSta->bCCKLock = false;

WARNING: suspect code indent for conditional statements (16, 17)
+		else
+		 pCoexSta->bCCKLock = true;

WARNING: suspect code indent for conditional statements (16, 25)
+		if (bScan || bLink || bRoam) {
+			 if (bScan)

WARNING: Statements should start on a tabstop
+			 if (bScan)

WARNING: Statements should start on a tabstop
+			 else

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 49f37aa16cc4..63d0eec572ec 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -361,15 +361,15 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 				)
 			) {
 				if (nCCKLockCounter < 5)
-				 nCCKLockCounter++;
+					nCCKLockCounter++;
 			} else {
 				if (nCCKLockCounter > 0)
-				 nCCKLockCounter--;
+					nCCKLockCounter--;
 			}
 
 		} else {
 			if (nCCKLockCounter > 0)
-			  nCCKLockCounter--;
+				nCCKLockCounter--;
 		}
 	} else {
 		if (nCCKLockCounter > 0)
@@ -379,14 +379,14 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 	if (!pCoexSta->bPreCCKLock) {
 
 		if (nCCKLockCounter >= 5)
-		 pCoexSta->bCCKLock = true;
+			pCoexSta->bCCKLock = true;
 		else
-		 pCoexSta->bCCKLock = false;
+			pCoexSta->bCCKLock = false;
 	} else {
 		if (nCCKLockCounter == 0)
-		 pCoexSta->bCCKLock = false;
+			pCoexSta->bCCKLock = false;
 		else
-		 pCoexSta->bCCKLock = true;
+			pCoexSta->bCCKLock = true;
 	}
 
 	pCoexSta->bPreCCKLock =  pCoexSta->bCCKLock;
@@ -2084,9 +2084,9 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_ROAM, &bRoam);
 
 		if (bScan || bLink || bRoam) {
-			 if (bScan)
+			if (bScan)
 				halbtc8723b1ant_ActionWifiNotConnectedScan(pBtCoexist);
-			 else
+			else
 				halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(pBtCoexist);
 		} else
 			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
-- 
2.25.1

