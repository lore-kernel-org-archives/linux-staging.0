Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858DA53A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 20:00:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so2184779wma.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 12:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93TSWSfcAvhzEd5s0QeYy7VAbNnlQKb4h0RKMKN4xLE=;
        b=PuJuqo/QtMPy6MvZLbhebn3A9HxGuzjBWisUUiuUu8rV3A7SKMGi65pv0/PeNlhpDt
         mdR53A4E54oolcA4m6jsoCVnkudF2xqgB12EPnU4hE+ApueUjaaNZN/cwP0J6o53bcP0
         NFciYZFdGW5tz82/qcNWunQtXZ/FdkIX74MwuCXjSSlPUFZxk/W2iUkFN4CgD7NUf1mS
         36IwszhOOf/E5Rm1ndHRUKyIsN5RRrRvPGaHf+QwV68DlpT7vuhWNpDOMkOZi0k833Op
         LyerFw2H04gLpOh6U0J2HF+wSqB3sBMDi6v5vXCHQrNzGZuqAICyVf7SR0WrN28p72nW
         T2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93TSWSfcAvhzEd5s0QeYy7VAbNnlQKb4h0RKMKN4xLE=;
        b=DQzIxKBQUHXfDfJ4hnPKnKs2FhMhyMDtsWnjSAwFT5dCuKzImXxjrPJa9EaJbXQGiW
         K55d3Qb2x+S2w6JnpYMpdinjrOfRQuy5eUPhNpPEqb3dBdHWpXS2HApXuNYCaXBg3/ay
         RP7ymIGYsAcvaG484OMZujbLmvk+WPH9TWf+z/ehZhRcu0kHDyOJEfSMGMUd4fmcrMLo
         EfP7ysCrKyrz6esr8JA+FFoCcZYVmj8LG2SypWTSAR2uB94k5IsTB1H3dI08ZLJEBxjg
         AHd8mxXLiUZbrvCHIxt3N/UxVHCdLFqlp/QxrfbOhItywQjAXPwJ4Bu300E40oeyu5xy
         UoEQ==
X-Gm-Message-State: AFqh2krJmSd59+6F4dXT88tLY8gbKpgTc8QzgpODHCF0oBZYiPmk6yCL
	VAT6jZxVxBv7y8wCwRoGz2D+dVI/jBc=
X-Google-Smtp-Source: AMrXdXtjYHLQ93dpaCEfO1nFbqO2oLpBJYE4JwjyQjzUfFFMQwfQUBYsVA0j7Vl+/P8BUyeobzooCQ==
X-Received: by 2002:a05:600c:3b06:b0:3d3:446a:b493 with SMTP id m6-20020a05600c3b0600b003d3446ab493mr2146003wms.4.1674072009873;
        Wed, 18 Jan 2023 12:00:09 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id j35-20020a05600c1c2300b003c71358a42dsm3903876wms.18.2023.01.18.12.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 12:00:09 -0800 (PST)
Date: Wed, 18 Jan 2023 21:00:07 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] staging: rtl8192e: Remove unused variable RF_C_TxPwDiff
Message-ID: <bcace15cc05057ab310f807f27619ef6ff391d91.1674071236.git.philipp.g.hortmann@gmail.com>
References: <cover.1674071236.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674071236.git.philipp.g.hortmann@gmail.com>

RF_C_TxPwDiff is set to a value and then never evaluated. Remove resulting
dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index aafe39e50bd9..ff66a97b8763 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -603,8 +603,6 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 			ant_pwr_diff = priv->tx_pwr_level_ofdm_24g_c[channel - 1]
 				       - priv->tx_pwr_level_ofdm_24g_a[channel - 1];
 
-			priv->RF_C_TxPwDiff = ant_pwr_diff;
-
 			ant_pwr_diff &= 0xf;
 
 			priv->antenna_tx_pwr_diff[2] = 0;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 12a869a556bb..6662558e56fa 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -476,7 +476,6 @@ struct r8192_priv {
 	u8 tx_pwr_level_ofdm_24g_a[14];
 	u8 tx_pwr_level_ofdm_24g_c[14];
 	u8 legacy_ht_tx_pwr_diff;
-	s8		RF_C_TxPwDiff;
 	u8 antenna_tx_pwr_diff[3];
 
 	bool		dynamic_tx_high_pwr;
-- 
2.39.0

