Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874151860
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 16:20:02 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id r18so14951056eja.11
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GsdpeDwqiQ59y1KF9qjXgzUuhoO/WMpaF1rt8+KLfKc=;
        b=jEAk2DZ1D4pSbzFy8lLdAgFAIiZb75w2RbVNn5hDJNmFW1f6L3TQAr6G6Tt9lfOQgk
         vH+f3/7roALGxkIoUit65Ng9lf/Uh9Rhbf2QO3x81r32u8sMp7mq5RbnbkYwN+o/1Hvl
         ub9IWalSSz5UTwpMPK1hIXYk9NNipRjKQkQTJ09e306nd4i4I5ITLehbzzVNas0X4/3l
         4hKLhpO7n0RyiRHVlLo/BDNw2fup4jbMagMbNY2fm7TxJ09UaWawn/nt/kVqvEGCJU+U
         f7z4ZtlSvkw74qNkvaLKiQCbiQy+JT95/SAPp3M/ox7wQTUjbXGkGwnl00OJKplef6w0
         Ymmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GsdpeDwqiQ59y1KF9qjXgzUuhoO/WMpaF1rt8+KLfKc=;
        b=CbdEwPeqUeC95hZdACrGKDMW/hckGIuTWFrEUtlZCEaDrgt8oRax14wArkOwFEE1DW
         HP00x/cmYwgYJpts/luJB2yao7QC8r0JKF28pvAOL1h4ODNATi3aGFTts96FC+gCPeE9
         m1N3vRvN+w9RdIHSAiHn+ytOKuniJVT2HvwjpKfngblVhxnLAFtH5qVokHyUhQl1CNQz
         Hulg3Sx4lnlxdT8LoA0+AunqKvhHRtVRuUt+MTeeBwmJUa124aG1Pkggw2rUg5eK68Cg
         0vg4UD4AAjde+P8Lq4GWEnBEJF8FS90m+jPxt/2zhQKFHETVpLeOCeFjMQPBosqsBKYU
         rTSA==
X-Gm-Message-State: ACgBeo3qTNyOcvLGh9Jwtx6588pXA3G4E6Ro1f91XlQlO42vta+rcnkz
	GsfANcpw7g6QkpOTH9h7Dsg=
X-Google-Smtp-Source: AA6agR75KgWe00X/90kNewrayvjKNnBiAKF5xum9uin/07Ow4IuT5iJzfv1899rRu1u5SkMRyhNXaA==
X-Received: by 2002:a17:907:9729:b0:77c:3742:137a with SMTP id jg41-20020a170907972900b0077c3742137amr3000202ejc.630.1662913200779;
        Sun, 11 Sep 2022 09:20:00 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id bt6-20020a170906b14600b00779dc23be62sm3055346ejb.120.2022.09.11.09.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 09:20:00 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/6] staging: r8188eu: rename odm_SignalScaleMapping()
Date: Sun, 11 Sep 2022 18:19:44 +0200
Message-Id: <20220911161949.11293-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911161949.11293-1-straube.linux@gmail.com>
References: <20220911161949.11293-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename odm_SignalScaleMapping() to avoid camel case.

odm_SignalScaleMapping -> odm_signal_scale_mapping

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 035d94b3458e..cd6af491d5a8 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -13,7 +13,7 @@ static u8 odm_QueryRxPwrPercentage(s8 AntPower)
 		return 100 + AntPower;
 }
 
-static s32 odm_SignalScaleMapping(struct odm_dm_struct *dm_odm, s32 CurrSig)
+static s32 odm_signal_scale_mapping(struct odm_dm_struct *dm_odm, s32 CurrSig)
 {
 	s32 RetSig = 0;
 
@@ -200,10 +200,10 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 	/* UI BSS List signal strength(in percentage), make it good looking, from 0~100. */
 	/* It is assigned to the BSS List in GetValueFromBeaconOrProbeRsp(). */
 	if (isCCKrate) {
-		pPhyInfo->SignalStrength = (u8)(odm_SignalScaleMapping(dm_odm, PWDB_ALL));/* PWDB_ALL; */
+		pPhyInfo->SignalStrength = (u8)(odm_signal_scale_mapping(dm_odm, PWDB_ALL));/* PWDB_ALL; */
 	} else {
 		if (rf_rx_num != 0)
-			pPhyInfo->SignalStrength = (u8)(odm_SignalScaleMapping(dm_odm, total_rssi /= rf_rx_num));
+			pPhyInfo->SignalStrength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
 	}
 
 	/* For 88E HW Antenna Diversity */
-- 
2.37.3

