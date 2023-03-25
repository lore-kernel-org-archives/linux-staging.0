Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBCF1840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:35:17 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id o32so2317833wms.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UcQDl4D7QfpTg14fckybYa1gutFz2rlct5Mc7Ooqxbw=;
        b=YGvZ3CA0eLxSSJSxywKE1QEe4oOYAn4vDg+RM3MNiVaBaU84ypAF7SQVuUbLp5kwnB
         o5nbuE475eZg93Euh1SbCBAM/ftpS9twznrossXRMtTy23g6wdno8ojEmC8mVmG2aYDr
         x3D8IkQaIl/iTBmJWPXL6z75gi4jXmHO9cfyFH0sZvgF6Fcb9d/wG2yT+Hm0CSfaLKwD
         UA1a5aK19ppdgZXx552E1k8dIrrayRo4iNywoS+SH7I+FzwBFlkHe1CNjQ478K9HZI75
         160ARPVfY01NmUMPm546nGw8tYeCTnLDjPvZp3yEBr99fB4oZjkMo5ENX5cQhPqGA7aB
         K7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcQDl4D7QfpTg14fckybYa1gutFz2rlct5Mc7Ooqxbw=;
        b=ExzVD0g/zEdJ+bDg24+g1zjez/oxty8Z1feqAWTnODmNajt7TXYsPyRS00IG2vQY47
         cHMLdkDGm8qq5SBKDuOdY6VLQst2V6t6pIH1b6L4RVdMGDz+4t1TDv+bxthHLuDbjD37
         21YoGKNpZbbQxb1FJo5T1yFeAXqirz/ek4gJqgx8eSnBXP0Fc59F9r7fkJx2TRef0lDF
         DRYL91whi/NPmING+MLkqpK8Bgn75OVe9ZbJRZLQbsNQTfza0GO6IbE7LRuDQlaOEVRk
         kxKh8CYRYy2zH7b15KIRwb+NGD5Y/+LnTdlJs6Taxsya6GdUN/S0KYaQVD5bLle8eoGw
         NzjQ==
X-Gm-Message-State: AO0yUKULU74Sq0OrK2Qx/LLSBggI9kpl+iNIqIb7ch3KsiIo6fdxvUxz
	tcNqZs6TpdadAkTQB1r8li4=
X-Google-Smtp-Source: AK7set+yel7kFnUKUMO0oaWKn0x9lKhDur0VbctyxcZJRj4rK0XrrY8Df9AATmRWx6qC/y7z84VdCg==
X-Received: by 2002:a05:600c:4fc1:b0:3ed:2a41:8529 with SMTP id o1-20020a05600c4fc100b003ed2a418529mr4280480wmq.2.1679733316019;
        Sat, 25 Mar 2023 01:35:16 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id o15-20020a1c750f000000b003ee1acdb036sm7223202wmc.17.2023.03.25.01.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:35:15 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:35:13 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] staging: rtl8192e: Remove priv->rf_chip in
 _rtl92e_phy_rf_read
Message-ID: <c3b2e2a41cc450c1cb9ac41b8ed19b090d9627a6.1679732276.git.philipp.g.hortmann@gmail.com>
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
conditions in function _rtl92e_phy_rf_read as those are dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 43 ++++++++-----------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 2dbddf4ae3d6..c4fd412cf3d6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -82,24 +82,20 @@ static u32 _rtl92e_phy_rf_read(struct net_device *dev,
 
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
-
-			NewOffset = Offset - 15;
-		} else
-			NewOffset = Offset;
+	rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter4, 0xf00, 0x0);
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
@@ -113,15 +109,12 @@ static u32 _rtl92e_phy_rf_read(struct net_device *dev,
 	ret = rtl92e_get_bb_reg(dev, pPhyReg->rfLSSIReadBack,
 				bLSSIReadBackData);
 
-	if (priv->rf_chip == RF_8256) {
-		priv->rf_reg_0value[eRFPath] &= 0xebf;
-
-		rtl92e_set_bb_reg(dev, pPhyReg->rf3wireOffset, bMaskDWord,
-				  (priv->rf_reg_0value[eRFPath] << 16));
+	priv->rf_reg_0value[eRFPath] &= 0xebf;
 
-		rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter4, 0x300, 0x3);
-	}
+	rtl92e_set_bb_reg(dev, pPhyReg->rf3wireOffset, bMaskDWord,
+			  (priv->rf_reg_0value[eRFPath] << 16));
 
+	rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter4, 0x300, 0x3);
 
 	return ret;
 
-- 
2.39.2

