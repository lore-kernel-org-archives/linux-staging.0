Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1861972
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:35:57 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id y32so7185961pga.11
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zTJs2BTaTABCUyNSzygxb7w5Eiwv3e639bQ2LLKnHnM=;
        b=Mj4WQJXcma0VVgXG/XUr0XCRq3oX0Y9P0ITCXK1+tSYapq25iwmM2IdVbHfYeGgxod
         k1MZ+Kb8vS0ge4hkPhW68QAdRygMrHUuuOnfANT72Kvz8SM8hJC77boWoWUQGq4l9DgI
         svNHX+rgL9sFIH0evpLe6d/U74qC+sps0ZGswLPor38xfvV3IdHwsRltpR99idI4rE9W
         /QznuMRFXSBPkW3TV4VRn4bs5Lqg0pKZvPDHbj8GLAWDBtjCM1I2ubHXGtd5n9x8ERNm
         PDNblmivdRukkUyCeberzc0NkfBnVrx0RWiBt171trkFjzbV4D+I3cCqiU6Lkr/shQ40
         VDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zTJs2BTaTABCUyNSzygxb7w5Eiwv3e639bQ2LLKnHnM=;
        b=DW8oLQZlgn13AsdJafVqnflHZSr9DcQ3whLtYkX+TpM6TY6d1N6LVJbjOcdY0u7Xvg
         0N5Zd2jkIL+P5lRyb0XbfXTqSJphMcXbs51AWXxiMZd2Tq/ljOZegNWjymbso9g0Ykp/
         1csEob7JXa9E4ecXHKCWdvJTj77VHp8pZSIK9S/qBS4P2m8MA8BDlgHaaPg7Xi5+cQ4f
         q0a8i81LzMDXal4eZDF99bsUsxvolM5bV2KN0HcQRXI4m+aJhwol5TdvmYj5O4uBRrBN
         LYSvnc2bvbaAwhI2qMA7M8UXAdIw2WMCbbiPi9l2GTvKnJ8ct8pX1jhMGZqaDYYE6aCJ
         +wZw==
X-Gm-Message-State: AOAM532hL6CXbrxts1fnOok1HifcPqHU36mc5ChaBJfz8yu5PSmhMfDJ
	VusEikQza6nJrPOGjG5uldc=
X-Google-Smtp-Source: ABdhPJzzjfTQgNj1uOMSGiIM5Ixftq7aqAZORbDaUofhh2y/8KmJi8b6TJ57B7BY6Go3QTlP6S1TRA==
X-Received: by 2002:a62:2cc8:0:b029:23d:bd0d:2ac3 with SMTP id s191-20020a622cc80000b029023dbd0d2ac3mr20391256pfs.41.1618140956629;
        Sun, 11 Apr 2021 04:35:56 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id w1sm8151277pgh.26.2021.04.11.04.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 04:35:56 -0700 (PDT)
Date: Sun, 11 Apr 2021 17:05:47 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4 3/3] staging: rtl8192e: remove unnecessary parentheses
Message-ID: <29464cba775f9529db30b7fb4168198975098b55.1618139271.git.mitaliborkar810@gmail.com>
References: <cover.1618139271.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618139271.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses because they must be used only when it
is necessary or they improve readability.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v3:- No changes.
Changes from v2:- Rectified spelling mistake in subject description.
Changes from v1:- No changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 89d0e9ec188d..b1fa8e9a4f28 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -287,7 +287,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 		u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};
 
 		memcpy(posHTCap, EWC11NHTCap, sizeof(EWC11NHTCap));
-		pCapELE = (struct ht_capab_ele *)&(posHTCap[4]);
+		pCapELE = (struct ht_capab_ele *)&posHTCap[4];
 		*len = 30 + 2;
 	} else {
 		pCapELE = (struct ht_capab_ele *)posHTCap;
@@ -646,13 +646,13 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->CurrentMPDUDensity = pHTInfo->MPDU_Density;
 	pHTInfo->CurrentAMPDUFactor = pHTInfo->AMPDU_Factor;
 
-	memset((void *)(&(pHTInfo->SelfHTCap)), 0,
+	memset((void *)(&pHTInfo->SelfHTCap), 0,
 	       sizeof(pHTInfo->SelfHTCap));
-	memset((void *)(&(pHTInfo->SelfHTInfo)), 0,
+	memset((void *)(&pHTInfo->SelfHTInfo), 0,
 	       sizeof(pHTInfo->SelfHTInfo));
-	memset((void *)(&(pHTInfo->PeerHTCapBuf)), 0,
+	memset((void *)(&pHTInfo->PeerHTCapBuf), 0,
 	       sizeof(pHTInfo->PeerHTCapBuf));
-	memset((void *)(&(pHTInfo->PeerHTInfoBuf)), 0,
+	memset((void *)(&pHTInfo->PeerHTInfoBuf), 0,
 	       sizeof(pHTInfo->PeerHTInfoBuf));
 
 	pHTInfo->bSwBwInProgress = false;
@@ -668,7 +668,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->IOTRaFunc = 0;
 
 	{
-		u8 *RegHTSuppRateSets = &(ieee->RegHTSuppRateSet[0]);
+		u8 *RegHTSuppRateSets = &ieee->RegHTSuppRateSet[0];
 
 		RegHTSuppRateSets[0] = 0xFF;
 		RegHTSuppRateSets[1] = 0xFF;
-- 
2.30.2

