Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196C1840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:35:32 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q19so812001wrc.5
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733331; x=1682325331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtF6AKurBTM+JKZ/Gr3b6r0bPCKeZarTQibx8Hu6cr8=;
        b=mCmYVGja+bfDuj6JPK5LDBpQhwzHI9yyNlpIWbzdx1oBXQg/fiEIGfHvT0OGkz4l56
         dkXamSHJsNBNw5m5TtptIlc9HOkGGRC2B5C4oMa6b0uWqh3OwecuZWaRGTP28uEYW+xU
         urwGHPOvYAsQCOCbcfdVWfJa6yVDSovUQkrpo2iWx7YbLbSjowoNRDAs2EkdxrIaHF/I
         Q3rnZ0DBwRn9XX7hMslY9ADSlAnQPG82RCMTLTsO1FAa/6g6kz1sfNW5XUaena9k3OIZ
         SH7FO6kn6kb4fsaF9PDKsKG64FkHbx0sk/bXghrAycXYrRWANKzY4J4rBos3avPmPXef
         nCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733331; x=1682325331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtF6AKurBTM+JKZ/Gr3b6r0bPCKeZarTQibx8Hu6cr8=;
        b=3OkEUm5qHzURhAO9HdmpT7br0CeCD8fKuU6R5Xazfarvqjsme3gKsq4J/QlvDoT+5k
         G7SKVEp184t6ej5JAkRB6nylLSwglp1yeGAJt9MQG5v/HKkvob+QQ4Ea9NZ0yY0SkAdE
         /rSmRv4YZkYoWgeBhAxoGdEK3cUr+PCR0xj4cVTXGv0wTJQ1LmQsnEy3rzEQzJeE334p
         8MdohVhsEIi0kImODX+wQ7+sKUfG3sxEnsmrNzipA2EdyFUGf3ry6BGmPFLgJFMCUbDM
         T5rhcJAZGBwiKnwTZlwb1Wxl8rAqiQ3ZykIHvbY/Du/+b0DF6v2zBTVQdhrPehHcK8Tq
         YJow==
X-Gm-Message-State: AAQBX9fpmc1h93tQYShPOo43VGId3LI8JH/XabfuajUW8DF/MAWPEvo4
	tCXkZDwy8qBlBviyAdyOKbw=
X-Google-Smtp-Source: AKy350YNMWw2Nh59duWNphLeS/1CwE8/oS1wR8DKdFfu6iw2lDY3Go2dKL1CQLYhfmo0+AwrVJw3yQ==
X-Received: by 2002:a5d:4d88:0:b0:2c7:1c72:69ac with SMTP id b8-20020a5d4d88000000b002c71c7269acmr3220509wru.2.1679733330992;
        Sat, 25 Mar 2023 01:35:30 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id k10-20020a5d6e8a000000b002d1daafea30sm20102657wrz.34.2023.03.25.01.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:35:30 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:35:28 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] staging: rtl8192e: Remove priv->rf_chip in
 _rtl92e_phy_rf_write
Message-ID: <77628b7ecade212401d7da5e3c0b79f8ef55b5c1.1679732276.git.philipp.g.hortmann@gmail.com>
References: <cover.1679732276.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679732276.git.philipp.g.hortmann@gmail.com>

priv->rf_chip is initialized to RF_8256 and never changed. Remove
conditions in function _rtl92e_phy_rf_write as those are dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 46 +++++++++----------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index c4fd412cf3d6..acd1e1869d78 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -129,24 +129,22 @@ static void _rtl92e_phy_rf_write(struct net_device *dev,
 	struct bb_reg_definition *pPhyReg = &priv->phy_reg_def[eRFPath];
 
 	Offset &= 0x3f;
-	if (priv->rf_chip == RF_8256) {
-		rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter4, 0xf00, 0x0);
 
-		if (Offset >= 31) {
-			priv->rf_reg_0value[eRFPath] |= 0x140;
-			rtl92e_set_bb_reg(dev, pPhyReg->rf3wireOffset,
-					  bMaskDWord,
-					  (priv->rf_reg_0value[eRFPath] << 16));
-			NewOffset = Offset - 30;
-		} else if (Offset >= 16) {
-			priv->rf_reg_0value[eRFPath] |= 0x100;
-			priv->rf_reg_0value[eRFPath] &= (~0x40);
-			rtl92e_set_bb_reg(dev, pPhyReg->rf3wireOffset,
-					  bMaskDWord,
-					  (priv->rf_reg_0value[eRFPath] << 16));
-			NewOffset = Offset - 15;
-		} else
-			NewOffset = Offset;
+	rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter4, 0xf00, 0x0);
+
+	if (Offset >= 31) {
+		priv->rf_reg_0value[eRFPath] |= 0x140;
+		rtl92e_set_bb_reg(dev, pPhyReg->rf3wireOffset,
+				  bMaskDWord,
+				  (priv->rf_reg_0value[eRFPath] << 16));
+		NewOffset = Offset - 30;
+	} else if (Offset >= 16) {
+		priv->rf_reg_0value[eRFPath] |= 0x100;
+		priv->rf_reg_0value[eRFPath] &= (~0x40);
+		rtl92e_set_bb_reg(dev, pPhyReg->rf3wireOffset,
+				  bMaskDWord,
+				  (priv->rf_reg_0value[eRFPath] << 16));
+		NewOffset = Offset - 15;
 	} else {
 		NewOffset = Offset;
 	}
@@ -158,15 +156,13 @@ static void _rtl92e_phy_rf_write(struct net_device *dev,
 	if (Offset == 0x0)
 		priv->rf_reg_0value[eRFPath] = Data;
 
-	if (priv->rf_chip == RF_8256) {
-		if (Offset != 0) {
-			priv->rf_reg_0value[eRFPath] &= 0xebf;
-			rtl92e_set_bb_reg(dev, pPhyReg->rf3wireOffset,
-					  bMaskDWord,
-					  (priv->rf_reg_0value[eRFPath] << 16));
-		}
-		rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter4, 0x300, 0x3);
+	if (Offset != 0) {
+		priv->rf_reg_0value[eRFPath] &= 0xebf;
+		rtl92e_set_bb_reg(dev, pPhyReg->rf3wireOffset,
+				  bMaskDWord,
+				  (priv->rf_reg_0value[eRFPath] << 16));
 	}
+	rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter4, 0x300, 0x3);
 }
 
 void rtl92e_set_rf_reg(struct net_device *dev, enum rf90_radio_path eRFPath,
-- 
2.39.2

