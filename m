Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157C3FCB
	for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 13:19:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f78-20020a1c1f51000000b0030cdb3d6079so2744706wmf.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/SmoyI4Lll6AWitzCqkM6cMjwJFHYFfQHXwNr4z9RaY=;
        b=U9UTlHRNxjunOSnsrQdZ9V0nmMcQYcqjRA/LOU2fgkR1wUaDyD10tJnc5bQWCboIfo
         Kq0hxoHAyW9O/nBdObbApKeLapaGjXDJbV6npFMMXWVFP9DDcK+z58ugnQH2qM7QOZOM
         LzM4jxUJcPv4rk8Z47ancqe+gDSuqyOWcgCbA/jGJ5pQXB2vFCpeMpai4f7O9i+dV1xR
         2e6kRQa9INj+HgyPrcg1wB5QQYP21amhaJFStyLjshzzM3PzCUHZmNfVd5rQsTP19Wwp
         6A+pi3nArvr2cBlU1upqiITMq9LtcCcTLCllOag2UBUCjp1TwWJN0y1bOX3BE8p41oce
         ypmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/SmoyI4Lll6AWitzCqkM6cMjwJFHYFfQHXwNr4z9RaY=;
        b=TTnpt07V6BimU4Kls7C3WX/KJ3DGE5bF9m0w3qZ+R/BHlIRfLtgpZPM4uulqPwUijB
         /vyW7LZemZJ2PbAB7NfP6T+XqqX3tP+ib6VgcLSgggZ/T8Ggfc/fIl8zm+CDBoqHbA5S
         IVwPZbcpyIFJG0TzMAMcz/Ket46K4tTvde7HZIg2pwB+gd4O0BoLYQXA1A0KisBZ0wvr
         bpkyw86IfUY2zIqvOTsBdxQ+yOrokvV9Fk12DZr4NFJwrwpqcwHmb/wH0NEg0HXtvZQt
         maWooYu5HRExgq8YUvjkFGay3C3l+SM2zBUgwgIZU1A+4k+RJs/pCcwAU7k1rmklbB7a
         Tf9A==
X-Gm-Message-State: AOAM532UrAz8dK/5ayUztHd10NMJYzidofsOzq3dDlYFEJA1gWir0TyD
	RqlPNeYMegiWvC9UPrflmwU=
X-Google-Smtp-Source: ABdhPJxAV9aMRAxie0IcPxRTZjsQB67pQRCd07Ma3Zo5LB079gvKvpbdBJvwirylXc7fsKxr9G8yNQ==
X-Received: by 2002:a1c:21d5:: with SMTP id h204mr4569166wmh.9.1632835184428;
        Tue, 28 Sep 2021 06:19:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::dc89])
        by smtp.gmail.com with ESMTPSA id m5sm1727030wms.41.2021.09.28.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:19:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove odm_GlobalAdapterCheck()
Date: Tue, 28 Sep 2021 15:19:30 +0200
Message-Id: <20210928131930.8866-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928131930.8866-1-straube.linux@gmail.com>
References: <20210928131930.8866-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_GlobalAdapterCheck() is empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 6 ------
 drivers/staging/r8188eu/include/odm_precomp.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 277357111452..bc49dc856a60 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -182,7 +182,6 @@ void ODM_DMInit(struct odm_dm_struct *pDM_Odm)
 void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
 {
 	/* 2012.05.03 Luke: For all IC series */
-	odm_GlobalAdapterCheck();
 	odm_CommonInfoSelfUpdate(pDM_Odm);
 	odm_FalseAlarmCounterStatistics(pDM_Odm);
 	odm_RSSIMonitorCheck(pDM_Odm);
@@ -1521,11 +1520,6 @@ u32 ConvertTo_dB(u32 Value)
 	return dB;
 }
 
-/*  2011/09/22 MH Add for 92D global spin lock utilization. */
-void odm_GlobalAdapterCheck(void)
-{
-}	/*  odm_GlobalAdapterCheck */
-
 /*  Description: */
 /* 	Set Single/Dual Antenna default setting for products that do not do detection in advance. */
 /*  Added by Joseph, 2012.03.22 */
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 210275a51994..1340b3df1181 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -39,7 +39,6 @@ void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
 void odm_SwAntDivInit_NIC(struct odm_dm_struct *pDM_Odm);
-void odm_GlobalAdapterCheck(void);
 void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm);
 void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
 void odm_DIG(struct odm_dm_struct *pDM_Odm);
-- 
2.33.0

