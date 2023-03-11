Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A5F7B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:51:40 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id k10so34354613edk.13
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkZ4Olpuxh5E3cDSkJctHgzhe5euz/pqRRghSABvVlc=;
        b=SEht0PddCHabZafa5KLInfvaUrCDhb/wI+0h7XhFmCtjLMwojaI8lGBbdmwoVCWRqD
         jmbEJ8pFyMl7u6tFvBGLwun0ozPTG8/JLtjgJSpQTBzTBBtlJWYvOhI4b5NNt/YdXsyE
         bsfJ2f62XRrBtIZaWDiAtojkaiC6yUiM5a4800H/bAR7QvtR59W3InOdlmZhnf+zObC4
         AkEwSD54I2HY/BqBjhfASqM3C6/ZdElhLfOTzVjCNv2d6VCfeasJzWqQw+zvqngO5/4B
         4hxPiDssEYxsIfaHQNkLct3YiTUDcX8jZDrzxDcaYWqAGpl8x8Pg1wVws6NOUWITBwsO
         BV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkZ4Olpuxh5E3cDSkJctHgzhe5euz/pqRRghSABvVlc=;
        b=gplt/EJVYsxLZnWFdEZhQJ1KydiZw7pLD+FfnDeOGokF4COxjb2dcsc+sNFPz3iBKR
         uVP7wAZGgX68+ay4XrOvTZ4d73hFvMaY1x/v2BYsTDBte3uSz3PjUclcYkq2V41euD3S
         YnaYCZJMFokkF1VXGV+8cBVigi4B5eUt+OLG/VM9ASuE2HjYwvHwUyWSk5413qf+eQQF
         PdOusGEDnTpYQfLgMlZsfpglyhrJ/1c4B0fyKCz8kg/gVefOgwrkLeu2YZ5NzLbUfH/t
         bcs5J2emaM561oc45CY9RJSFbtBGHbLcPa+ybaO6Wu8Ak02x/7NMk8x80yB99M2wtcmJ
         zqiA==
X-Gm-Message-State: AO0yUKUL3UMda2B75a1e/9MQWNsOIG7LN4TQ16c64nIN62yMR0AtSKVm
	Mr9hl35Wzfnjk5UABAeiDoE=
X-Google-Smtp-Source: AK7set9YGzcuNatrSwhGf54AWthgBOslDCEbODCL7EQXYiF40b4xcRx0iaJoZ5cBCUHhHLsjK3HdAA==
X-Received: by 2002:a17:906:5352:b0:8b1:814e:c83d with SMTP id j18-20020a170906535200b008b1814ec83dmr6341330ejo.6.1678571498898;
        Sat, 11 Mar 2023 13:51:38 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709062da200b008cf377e8795sm1497633eji.199.2023.03.11.13.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:51:38 -0800 (PST)
Date: Sat, 11 Mar 2023 22:51:36 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] staging: rtl8192e: Remove unused variable
 rfLSSI_Select and rfTxGainStage
Message-ID: <48f05998f4d2fe2df88ff14860cc8615dd72734d.1678569965.git.philipp.g.hortmann@gmail.com>
References: <cover.1678569965.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678569965.git.philipp.g.hortmann@gmail.com>

Remove unused variable rfLSSI_Select and rfTxGainStage because they are
just once set and not used. Remove unused constants as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h    |  2 --
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c    | 10 ----------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h |  2 --
 3 files changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index adedcea5824e..2236c1aaf335 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -106,8 +106,6 @@ struct bb_reg_definition {
 	u32 rfintfo;
 	u32 rfintfe;
 	u32 rf3wireOffset;
-	u32 rfLSSI_Select;
-	u32 rfTxGainStage;
 	u32 rfHSSIPara1;
 	u32 rfHSSIPara2;
 	u32 rfSwitchControl;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 1013ab95bc7b..87f28718e732 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -368,16 +368,6 @@ static void _rtl92e_init_bb_rf_reg_def(struct net_device *dev)
 	priv->phy_reg_def[RF90_PATH_A].rf3wireOffset = rFPGA0_XA_LSSIParameter;
 	priv->phy_reg_def[RF90_PATH_B].rf3wireOffset = rFPGA0_XB_LSSIParameter;
 
-	priv->phy_reg_def[RF90_PATH_A].rfLSSI_Select = rFPGA0_XAB_RFParameter;
-	priv->phy_reg_def[RF90_PATH_B].rfLSSI_Select = rFPGA0_XAB_RFParameter;
-	priv->phy_reg_def[RF90_PATH_C].rfLSSI_Select = rFPGA0_XCD_RFParameter;
-	priv->phy_reg_def[RF90_PATH_D].rfLSSI_Select = rFPGA0_XCD_RFParameter;
-
-	priv->phy_reg_def[RF90_PATH_A].rfTxGainStage = rFPGA0_TxGainStage;
-	priv->phy_reg_def[RF90_PATH_B].rfTxGainStage = rFPGA0_TxGainStage;
-	priv->phy_reg_def[RF90_PATH_C].rfTxGainStage = rFPGA0_TxGainStage;
-	priv->phy_reg_def[RF90_PATH_D].rfTxGainStage = rFPGA0_TxGainStage;
-
 	priv->phy_reg_def[RF90_PATH_A].rfHSSIPara1 = rFPGA0_XA_HSSIParameter1;
 	priv->phy_reg_def[RF90_PATH_B].rfHSSIPara1 = rFPGA0_XB_HSSIParameter1;
 	priv->phy_reg_def[RF90_PATH_C].rfHSSIPara1 = rFPGA0_XC_HSSIParameter1;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index 19acc44648e1..b68e84dd003f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -65,8 +65,6 @@
 #define rFPGA0_XA_RFInterfaceOE		0x860
 #define rFPGA0_XB_RFInterfaceOE		0x864
 #define rFPGA0_XAB_RFInterfaceSW	0x870
-#define rFPGA0_XAB_RFParameter		0x878
-#define rFPGA0_XCD_RFParameter		0x87c
 #define rFPGA0_AnalogParameter1		0x880
 #define rFPGA0_AnalogParameter2		0x884
 #define rFPGA0_AnalogParameter3		0x888
-- 
2.39.2

