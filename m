Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD075F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c8so3915847wrq.11
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F72NHyh0iUP5M7yAg9s4WmPfsLz3WPDAkNZmdg43138=;
        b=Ryk7YtPDZaEPUXvrIP4c8tc2aPPZHqnKMlpxfsTF+rDmeBsciU74eAuIwHZpuquIn5
         7VqlKGO3Dxyld1bz+hT5E/3kf1VAFY0Hp2ZrXNuyytMJpmDTsWXey1UM5Koln99CqxTV
         +T94nHIx0FrlFkF/eHPP24XTDMJJ9976+AHMzkVcMiF5DEbf9WAuNnpCBhRMoMiZrxVs
         RNSPhJwYH+nNc4jU3I43QBDYj7hThljOD14MsO3zI/W8UK5tWhqP5sTxsrW9CTJUVv5U
         f/6mrD6FJzisCsHIYwmRPAcpfzaGxFAzTdFcdLEbL8H6CpJhVgCqiNVB9Srz7ZBKJETv
         HE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F72NHyh0iUP5M7yAg9s4WmPfsLz3WPDAkNZmdg43138=;
        b=piXEIiKHPJJy1Mf4uqobkPh3ar0wzuGND73Hd3mQVvla0Bf+/yCMIFH3XTeViB2wCe
         PzRgmtbkbB2MPA0JASNEkFh4dCtXU3wohbS7nydgrgs354ogzkFGNDNJvhhIwyX4vEwE
         exXNejtdzeGTkITM+kAtd/K36d47cbnK2nLC5lohUA6PiFABstA1j/6+TwyR8kd+WTIL
         KwAFXXcAUOBTk8wJhEg7kgw42eJwesY8FUpmj8kVvNwvAgwS5qefjaUfDIgcToeoX+Qf
         jiPwQGh3A215iFlIgLAsbPs/BBnwyETA4bcACl+ZPGkwkBwY3KYM/MxZcORF8GVSspbM
         bMuQ==
X-Gm-Message-State: AOAM532TnbnFkeNAXiCAnmFhx5yRRQ6TB49EcGyZY/y7ZaKc5Gl+6IZm
	MRdOcr4cBbmEc49tYdKQKTU=
X-Google-Smtp-Source: ABdhPJyizNMlAd/dZwYqsYf8FCh4efroLPmTz08rscnGAUtx42/z/jodIu/H99YDY2qg0JZdSnH7tQ==
X-Received: by 2002:a5d:6446:: with SMTP id d6mr18341946wrw.328.1616420247185;
        Mon, 22 Mar 2021 06:37:27 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:26 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 19/19] Staging: rtl8723bs: remove useless structs in odm.h
Date: Mon, 22 Mar 2021 14:37:17 +0100
Message-Id: <20210322133717.17797-20-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct's in hal/odm.h:

	struct odm_sta_info_t
	struct odm_ra_info_t

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 61 -----------------------------
 1 file changed, 61 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 3c8d76e42c99..981de3710709 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -293,35 +293,6 @@ enum ODM_Ability_E { /* tag_Dynamic_ODM_Support_Ability_Type */
 	ODM_PSD2AFH			= 0x00000800
 };
 
-/*  */
-/*  2011/20/20 MH For MP driver RT_WLAN_STA =  STA_INFO_T */
-/*  Please declare below ODM relative info in your STA info structure. */
-/*  */
-struct odm_sta_info_t {
-	/*  Driver Write */
-	bool bUsed;				/*  record the sta status link or not? */
-	/* u8 WirelessMode;		 */
-	u8 IOTPeer;			/*  Enum value.	HT_IOT_PEER_E */
-
-	/*  ODM Write */
-	/* 1 PHY_STATUS_INFO */
-	u8 RSSI_Path[4];		/*  */
-	u8 RSSI_Ave;
-	u8 RXEVM[4];
-	u8 RXSNR[4];
-
-	/*  ODM Write */
-	/* 1 TX_INFO (may changed by IC) */
-	/* TX_INFO_T		pTxInfo;		Define in IC folder. Move lower layer. */
-
-	/*  */
-	/* 	Please use compile flag to disabe the strcutrue for other IC except 88E. */
-	/* 	Move To lower layer. */
-	/*  */
-	/*  ODM Write Wilson will handle this part(said by Luke.Lee) */
-	/* TX_RPT_T		pTxRpt;			Define in IC folder. Move lower layer. */
-};
-
 /*  */
 /*  2011/10/20 MH Define Common info enum for all team. */
 /*  */
@@ -640,38 +611,6 @@ enum odm_cca_path_e { /* tag_CCA_Path */
 	ODM_CCA_1R_B		= 2,
 };
 
-struct odm_ra_info_t { /* _ODM_RA_Info_ */
-	u8 RateID;
-	u32 RateMask;
-	u32 RAUseRate;
-	u8 RateSGI;
-	u8 RssiStaRA;
-	u8 PreRssiStaRA;
-	u8 SGIEnable;
-	u8 DecisionRate;
-	u8 PreRate;
-	u8 HighestRate;
-	u8 LowestRate;
-	u32 NscUp;
-	u32 NscDown;
-	u16 RTY[5];
-	u32 TOTAL;
-	u16 DROP;
-	u8 Active;
-	u16 RptTime;
-	u8 RAWaitingCounter;
-	u8 RAPendingCounter;
-	u8 PTActive;  /*  on or off */
-	u8 PTTryState;  /*  0 trying state, 1 for decision state */
-	u8 PTStage;  /*  0~6 */
-	u8 PTStopCount; /* Stop PT counter */
-	u8 PTPreRate;  /*  if rate change do PT */
-	u8 PTPreRssi; /*  if RSSI change 5% do PT */
-	u8 PTModeSS;  /*  decide whitch rate should do PT */
-	u8 RAstage;  /*  StageRA, decide how many times RA will be done between PT */
-	u8 PTSmoothFactor;
-};
-
 struct iqk_matrix_regs_setting { /* _IQK_MATRIX_REGS_SETTING */
 	bool bIQKDone;
 	s32 Value[3][IQK_Matrix_REG_NUM];
-- 
2.30.2

