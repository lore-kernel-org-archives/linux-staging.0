Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCEB5A1F
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 18:54:56 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id y22so8216164eds.2
        for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 10:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dnbl9J5as2Gf5vNj38MxzDXS9iSn1zZIqkNkCDFNSco=;
        b=ZxHYR6iNmM1pCGBttsHFowX65AGrCjogKt7NhOaysAdbOUZm+gM3lrXjbT+y1kvIR5
         RldlTsWCyLeqRQgvL1mxHPDq51Tvj7g7NMRUxWvbmDdTQzQudSd0oGvaROJ/+61ckN3R
         EU4J3OO1MJBiJz7qiHtMcXk2fO3U7yknilroUHXLZnIygs29R/xpvBf/tFhb7k6qN76e
         GI5cQgQ7ZAs2VbgKsITi3b09Owc3+pRl22Jai1ktC6iyedrmFwVF4uvFTI78ibDcxhRi
         PonXPntOhzJKqqytt9q1ggq3MlfVuX6/vzBbP9BzxZIHV9jL4DdWGC8lnd0/tC82wJQX
         mrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dnbl9J5as2Gf5vNj38MxzDXS9iSn1zZIqkNkCDFNSco=;
        b=krLkk7f/gHyJgLsNogZxMVq61HpxKDe4sqQg6wDA0aBbjQ46MSWFnnUZ2xPujxpcv0
         6wBaDXEs6PIzdUIEXkP+cZYCCfuRpuBCmC9b/DBY7XtX90QH2NLPWhijfwfV0uY5ze6n
         CzvoJanfPYZ0Kq0YwcPpBL7RcbIWlqu240NawALTjTqSpaLkVF7eqbeuDDNM1VZbz0bS
         4DdyuJLMY3k3lc2SOxTzVUI3842dnyymlwdbeEjGml3tflMED4g+o/nHLyGX0rThGp6t
         SacLNTOm0p39quDBkRMd+0RhSZtHtbAmMnHeQTB6OpgHKfadXdj3mTydS0zP0jwxO8pl
         jntg==
X-Gm-Message-State: AOAM530+V7MH5UWNJqJbgp6MzRVPYe2mVnMmndhHY5SyZ752t2pzZJ2Z
	G5JrdS0IMEwTxJwjgDu3Z81Ie9G7REw=
X-Google-Smtp-Source: ABdhPJymuVv6RmHNZ+R3h/hna6bzcvI9FHkHLmTKIJCFvWOz6Uq7LA0WhcrtfMDkqt/iySAkhaCCOQ==
X-Received: by 2002:a05:6402:4252:b0:416:6cd8:e273 with SMTP id g18-20020a056402425200b004166cd8e273mr5828633edb.328.1646938494518;
        Thu, 10 Mar 2022 10:54:54 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id bm23-20020a170906c05700b006d597fd51c6sm2117171ejb.145.2022.03.10.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:54:54 -0800 (PST)
Date: Thu, 10 Mar 2022 19:54:49 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] staging: vt6656: Remove unused rf_type in card.c
Message-ID: <e768dbb116e79349aa083747729213d2d1ca7af9.1646935331.git.philipp.g.hortmann@gmail.com>
References: <cover.1646935331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646935331.git.philipp.g.hortmann@gmail.com>

Remove rf_type that supports 5GHz band.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/card.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/vt6656/card.c b/drivers/staging/vt6656/card.c
index e92ecfad26d2..d74165d0d3bb 100644
--- a/drivers/staging/vt6656/card.c
+++ b/drivers/staging/vt6656/card.c
@@ -369,10 +369,8 @@ int vnt_radio_power_off(struct vnt_private *priv)
 	switch (priv->rf_type) {
 	case RF_AL2230:
 	case RF_AL2230S:
-	case RF_AIROHA7230:
 	case RF_VT3226:
 	case RF_VT3226D0:
-	case RF_VT3342A0:
 		ret = vnt_mac_reg_bits_off(priv, MAC_REG_SOFTPWRCTL,
 					   (SOFTPWRCTL_SWPE2 |
 					    SOFTPWRCTL_SWPE3));
@@ -423,10 +421,8 @@ int vnt_radio_power_on(struct vnt_private *priv)
 	switch (priv->rf_type) {
 	case RF_AL2230:
 	case RF_AL2230S:
-	case RF_AIROHA7230:
 	case RF_VT3226:
 	case RF_VT3226D0:
-	case RF_VT3342A0:
 		ret = vnt_mac_reg_bits_on(priv, MAC_REG_SOFTPWRCTL,
 					  (SOFTPWRCTL_SWPE2 |
 					   SOFTPWRCTL_SWPE3));
@@ -445,9 +441,6 @@ int vnt_set_bss_mode(struct vnt_private *priv)
 	unsigned char bb_vga_0 = 0x1c;
 	unsigned char bb_vga_2_3 = 0x00;
 
-	if (priv->rf_type == RF_AIROHA7230 && priv->bb_type == BB_TYPE_11A)
-		type = BB_TYPE_11G;
-
 	ret = vnt_mac_set_bb_type(priv, type);
 	if (ret)
 		return ret;
@@ -479,15 +472,6 @@ int vnt_set_bss_mode(struct vnt_private *priv)
 	if (ret)
 		return ret;
 
-	if (priv->rf_type == RF_AIROHA7230) {
-		priv->bb_vga[0] = bb_vga_0;
-
-		ret = vnt_control_out_u8(priv, MESSAGE_REQUEST_BBREG,
-					 0xe7, priv->bb_vga[0]);
-		if (ret)
-			return ret;
-	}
-
 	priv->bb_vga[2] = bb_vga_2_3;
 	priv->bb_vga[3] = bb_vga_2_3;
 
-- 
2.25.1

