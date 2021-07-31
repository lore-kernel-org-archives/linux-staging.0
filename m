Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EA73486
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:24:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so4758058wms.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fQ9W/AmV0MCvyTypY0gyZNqN0CL0/4onHcDd3tEQqS0=;
        b=df5noCJTWkUQ03l/KtUOPCjIEuIZBIaoujD0Ug3uSrAxqnVcEv24zQI/H//MlRklFJ
         VFYsghAhpMaTyRUVvtrtkxOJv5iGZPmQwBq3EHeU7zZQoJYyTSH5zWrAXx1J2ug0YFXV
         +ZAqJ/9ZQrG/bC90ob1jSiliJ1CKdvzkVsH5ISwZ2ZgWzgrqA5ITqDJgwFvc1kbNei/6
         pGgKGY/QkSBeNtOQo305qvXbctpTJBfMqdacssZchNuEAwvOiyRPyCw8t5oaCjg9ToR2
         p6eUtFTNNFDqxIUtKobvx4ZydExdwQZHSTePlGUx7eQZfVwB1NjjEkKeO9Ehm882veaq
         +AFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQ9W/AmV0MCvyTypY0gyZNqN0CL0/4onHcDd3tEQqS0=;
        b=PI4ETJUibFIipAuIAQA3IsOPaSw2w1czzVce7Yfj3IBJdPfByebr9Psr5QHsVYTxza
         ZlCcdUm/YJAB3sS+1Sl0Rs+dlW+m1yCGMaOYN5g/fMj1yymwULQy0Fljc91ghmReC1BH
         eqse4DrAQkjD2t+KD0tsqp7AQAFpoQb0dDK5Xxupu6Y4aD1BwcgwyrL3hEaVdw9OX9LF
         NIplOfyIC2AEAVVIlbLAyuRZM9YbWGFKA7mCAOKYKdO5IDP++Apqr6Mf23HY7iNnyu1W
         zhDK8z8/iiUawZnVcOXqN4QS9a/Qf9x19soArpsEzotpL8LPLQnh6lHwlMj8OxFxChI/
         xT1g==
X-Gm-Message-State: AOAM532R1sRapcoyie74Pdzkxw8xUe4pUCt9RRrpfT1o8IS42J3xXY2G
	CSY5QEOYVV7ObVxPYmos1StnuA==
X-Google-Smtp-Source: ABdhPJyIS9REQepdJgCzfx9ZGxD/0Ma5uGEp8YdM4pulw79vgHhT4cG6AMUr/eg7f/8sULdO2LCB/Q==
X-Received: by 2002:a1c:a510:: with SMTP id o16mr5656009wme.162.1627691042829;
        Fri, 30 Jul 2021 17:24:02 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id x9sm3236011wmj.41.2021.07.30.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:24:02 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] staging: r8188eu: remove ODM_RT_TRACE calls from hal/odm_RegConfig8188E.c
Date: Sat, 31 Jul 2021 01:23:49 +0100
Message-Id: <20210731002353.68479-11-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731002353.68479-1-phil@philpotter.co.uk>
References: <20210731002353.68479-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_RT_TRACE calls from hal/odm_RegConfig8188E.c, as by removing these
calls in this file and others, we can ultimately then remove the macro
definition itself, which does not follow best practice.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  | 29 +++++--------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
index a26c36cf8786..ec8158e37cb3 100644
--- a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
@@ -32,7 +32,6 @@ void odm_ConfigRF_RadioA_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data
 	u32 maskforPhySet = (u32)(content&0xE000);
 
 	odm_ConfigRFReg_8188E(pDM_Odm, Addr, Data, RF_PATH_A, Addr|maskforPhySet);
-	ODM_RT_TRACE(pDM_Odm, ODM_COMP_INIT, ODM_DBG_TRACE, ("===> ODM_ConfigRFWithHeaderFile: [RadioA] %08X %08X\n", Addr, Data));
 }
 
 void odm_ConfigRF_RadioB_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data)
@@ -41,14 +40,11 @@ void odm_ConfigRF_RadioB_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data
 	u32 maskforPhySet = (u32)(content&0xE000);
 
 	odm_ConfigRFReg_8188E(pDM_Odm, Addr, Data, RF_PATH_B, Addr|maskforPhySet);
-
-	ODM_RT_TRACE(pDM_Odm, ODM_COMP_INIT, ODM_DBG_TRACE, ("===> ODM_ConfigRFWithHeaderFile: [RadioB] %08X %08X\n", Addr, Data));
 }
 
 void odm_ConfigMAC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u8 Data)
 {
 	ODM_Write1Byte(pDM_Odm, Addr, Data);
-	ODM_RT_TRACE(pDM_Odm, ODM_COMP_INIT, ODM_DBG_TRACE, ("===> ODM_ConfigMACWithHeaderFile: [MAC_REG] %08X %08X\n", Addr, Data));
 }
 
 void odm_ConfigBB_AGC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Bitmask, u32 Data)
@@ -56,33 +52,25 @@ void odm_ConfigBB_AGC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Bitmask
 	ODM_SetBBReg(pDM_Odm, Addr, Bitmask, Data);
 	/*  Add 1us delay between BB/RF register setting. */
 	ODM_delay_us(1);
-
-	ODM_RT_TRACE(pDM_Odm, ODM_COMP_INIT, ODM_DBG_TRACE,
-		     ("===> ODM_ConfigBBWithHeaderFile: [AGC_TAB] %08X %08X\n",
-		     Addr, Data));
 }
 
 void odm_ConfigBB_PHY_REG_PG_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
 				   u32 Bitmask, u32 Data)
 {
-	if (Addr == 0xfe) {
+	if (Addr == 0xfe)
 		ODM_sleep_ms(50);
-	} else if (Addr == 0xfd) {
+	else if (Addr == 0xfd)
 		ODM_delay_ms(5);
-	} else if (Addr == 0xfc) {
+	else if (Addr == 0xfc)
 		ODM_delay_ms(1);
-	} else if (Addr == 0xfb) {
+	else if (Addr == 0xfb)
 		ODM_delay_us(50);
-	} else if (Addr == 0xfa) {
+	else if (Addr == 0xfa)
 		ODM_delay_us(5);
-	} else if (Addr == 0xf9) {
+	else if (Addr == 0xf9)
 		ODM_delay_us(1);
-	} else{
-		ODM_RT_TRACE(pDM_Odm, ODM_COMP_INIT, ODM_DBG_LOUD,
-			     ("===> @@@@@@@ ODM_ConfigBBWithHeaderFile: [PHY_REG] %08X %08X %08X\n",
-			     Addr, Bitmask, Data));
+	else
 		storePwrIndexDiffRateOffset(pDM_Odm->Adapter, Addr, Bitmask, Data);
-	}
 }
 
 void odm_ConfigBB_PHY_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Bitmask, u32 Data)
@@ -106,8 +94,5 @@ void odm_ConfigBB_PHY_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Bitmask
 
 		/*  Add 1us delay between BB/RF register setting. */
 		ODM_delay_us(1);
-		ODM_RT_TRACE(pDM_Odm, ODM_COMP_INIT, ODM_DBG_TRACE,
-			     ("===> ODM_ConfigBBWithHeaderFile: [PHY_REG] %08X %08X\n",
-			     Addr, Data));
 	}
 }
-- 
2.31.1

