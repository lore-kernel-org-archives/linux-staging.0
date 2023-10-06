Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA43838F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZTm/y2D"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53142351997so840078a12.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619096; x=1697223896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=68/nbTks8CXo1X/QB95+J8jvFGHLP1OjPuI8hsZjNRI=;
        b=XZTm/y2D9ZfUfXpjrV/H3Hqmw1Y7oiAMKacASQHeqam14Ac95ofJaE9ZnovgtukEVO
         Fib/fKVoC99N870i97VS149wk44uuGh2rnYDoK6TXEGPszaaK+iIpLK1jysEV5pdIqm5
         7EORInjGTZHH5VjrAcJRgmXnZN8le5CbBnkDxhdsyhW9kTvwgmslOKnzu3xTgNhbEWFP
         rGLi7wbcK9rmhmKipR4U1dR0+WNPvqVkdTrAMlGf80B3iHUucmDToPgItnX3aFe4oons
         a4Frh5KGha/WKeDXjqwiUxNlrVz9EiSGkGcAxPJsA1oupe4QeNEsYkwgWqiEPmtVynpG
         wTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619096; x=1697223896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68/nbTks8CXo1X/QB95+J8jvFGHLP1OjPuI8hsZjNRI=;
        b=tacAVCD1EiP8/flvLVQ7xgbnYKycr5JvzIyCHEmwqjH1xxDkpujSgGermfJZi4kPKr
         aXxpcmjUbzSTXLIV37I6aTq7cGFhsyExWzwCyQejYa2sH/NDy2nu+JjTS1tnCry6GbaX
         7+TJrkxuolqiuy939wbX3N/0M6YuUD4qw6G+R6pe1DEBBEdwy2tkxoNLYUnt2wIZRwvD
         TM5oX5l0qYUkHLhOuzfYqdculwfkmRQiwPQ6LMekdhd7gDXZvtvg8uz71px1RpxHaN8/
         pQAykDEqHPh+8gEZr4OA46LOAjoUF7njZ7I+P7CFUD2XcR+aV6FfRbKJFKl6ZqTliHmu
         ENBg==
X-Gm-Message-State: AOJu0YyMf1NgbJsSyHt8SnMYYpGjhYFWCv7Kj+RwrSBKmNYKOmM88Ecp
	m2uFO2NRX/fPyzgQxXYgn3w=
X-Google-Smtp-Source: AGHT+IGDAH25y+WS9bMxScDAaMkKQ7xkjm4qdz6XkggJ9HO6OwZY6UYPPnH2GZNV4sqp0xum2cSRSA==
X-Received: by 2002:a05:6402:35c2:b0:530:2bd:71b2 with SMTP id z2-20020a05640235c200b0053002bd71b2mr7460311edc.0.1696619096088;
        Fri, 06 Oct 2023 12:04:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id ev5-20020a056402540500b0053b67aba57bsm244120edb.17.2023.10.06.12.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:04:55 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:04:54 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Remove constant variable
 reg_max_lps_awake_intvl
Message-ID: <d5b2ccc0f10c28f960552dd2b2c5ec83aa62041f.1696548527.git.philipp.g.hortmann@gmail.com>
References: <cover.1696548527.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696548527.git.philipp.g.hortmann@gmail.com>

Remove constant variable reg_max_lps_awake_intvl as this value is just
written to MaxPeriod. Function _rtl92e_init_priv_constant() is then empty
and can be removed as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 10 ----------
 drivers/staging/rtl8192e/rtllib.h            |  1 -
 drivers/staging/rtl8192e/rtllib_softmac.c    |  8 +-------
 3 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f46cb152930a..7db01d68000a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -712,15 +712,6 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->ScanOperationBackupHandler = rtl92e_scan_op_backup;
 }
 
-static void _rtl92e_init_priv_constant(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	struct rt_pwr_save_ctrl *psc = (struct rt_pwr_save_ctrl *)
-					&priv->rtllib->pwr_save_ctrl;
-
-	psc->reg_max_lps_awake_intvl = 5;
-}
-
 static void _rtl92e_init_priv_variable(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
@@ -838,7 +829,6 @@ static short _rtl92e_init(struct net_device *dev)
 	memset(&priv->stats, 0, sizeof(struct rt_stats));
 
 	_rtl92e_init_priv_handler(dev);
-	_rtl92e_init_priv_constant(dev);
 	_rtl92e_init_priv_variable(dev);
 	_rtl92e_init_priv_lock(priv);
 	_rtl92e_init_priv_task(dev);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6d54c03f5680..307bcbb7fbb6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1079,7 +1079,6 @@ struct rt_pwr_save_ctrl {
 
 	bool				bLeisurePs;
 	u8				LpsIdleCount;
-	u8				reg_max_lps_awake_intvl;
 	u8				LPSAwakeIntvl;
 
 	u32				CurPsLevel;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 206f8e05d5d0..f84133744bc3 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1588,16 +1588,10 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 		if (ieee->bAwakePktSent) {
 			psc->LPSAwakeIntvl = 1;
 		} else {
-			u8 MaxPeriod = 1;
+			u8 MaxPeriod = 5;
 
 			if (psc->LPSAwakeIntvl == 0)
 				psc->LPSAwakeIntvl = 1;
-			if (psc->reg_max_lps_awake_intvl == 0)
-				MaxPeriod = 1;
-			else if (psc->reg_max_lps_awake_intvl == 0xFF)
-				MaxPeriod = ieee->current_network.dtim_period;
-			else
-				MaxPeriod = psc->reg_max_lps_awake_intvl;
 			psc->LPSAwakeIntvl = (psc->LPSAwakeIntvl >=
 					       MaxPeriod) ? MaxPeriod :
 					       (psc->LPSAwakeIntvl + 1);
-- 
2.42.0

