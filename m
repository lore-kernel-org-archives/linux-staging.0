Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA8C38F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJPW/IYs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9b2d64c9307so97641366b.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619124; x=1697223924; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+br5pLFUbrcZI/srFnTe6wEnu5xbIzdKc9qsVerSfI=;
        b=OJPW/IYs1s9xFcStHa/AvJN3xH/+PtR0j8dMjD5zB03XMho/QVu99bSeJzoXOzObjd
         0EseNeoGFgQUvTjfEbbD6bizfSSW9vdSkUnzilLCsjM+ZelZndmcPdRygjmCG9jIi+Zf
         Tg1bLOhRby7gDLAh+ci3jfJP4Pm4GGU06/a1LzbpY6A5L8u4Nb0WGqoF7Dzlq6sX2+Ce
         BTj6gEHeeqJ1XUV5UxSwaTAvzfyqZEHkRe243efFxVdbRuUTPBqkGOqg0V2pEme2FEmu
         tj4VHjiz/qEl5yHn0ApFa7q/WA60ptyNJUewp+L+SYC4yOFy23VJkb0i/VWHZjD4gmsO
         g/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619124; x=1697223924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+br5pLFUbrcZI/srFnTe6wEnu5xbIzdKc9qsVerSfI=;
        b=XiiUQTHE2N4QyYkBAawKrrVCPtpcvJpXcRZiIAqtx6WOhDuXKNBF1wWWgLyQnrrJNh
         xfS/up7xdXeQZX72SX/unvJzhK2YfRk1iC5+8Vxq40wPiZEbyuq29XTM3R0efow7Qw25
         rwwoWFGc3OnV4Mk18p0sbk0c7Zl0MKMl32WinKP5yRVm6neY1LnNGjNx5yCrFkHQJgjH
         hp6WxfzTClT7y+0Ay0VB8e4pW3nquwyjYSgg4mUrIJEHLaClEpS8/My+QtKydDv7p57K
         MauUr4it/w/KY90YEDofka5dOv/QAqRmYIDGC8OQyWFM5zJO6QgzbMomZjOklc8vBPwk
         R/Uw==
X-Gm-Message-State: AOJu0YzDS1WwYsC7s3IX21eVrcWL1dyeEwlevo3uUdjPFDTXu5fbyPNO
	8DSjq2gc/LQgezY7NWluN8DGaCQebh0=
X-Google-Smtp-Source: AGHT+IEutXgDyZOdv9yVVTprRGPh9isbDdiPgUuwIVR39hzY8szwJ/QP2DSNAsvvtn401hb70YVuJw==
X-Received: by 2002:a17:906:29a:b0:9a6:ae76:d6ae with SMTP id 26-20020a170906029a00b009a6ae76d6aemr7716382ejf.3.1696619123915;
        Fri, 06 Oct 2023 12:05:23 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id dv8-20020a170906b80800b0098ce63e36e9sm3393081ejb.16.2023.10.06.12.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:05:23 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:05:22 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] staging: rtl8192e: Remove unchanged variable
 active_scan
Message-ID: <eea9f6cb1feeb8aa5beb546034562f55a03da449.1696548527.git.philipp.g.hortmann@gmail.com>
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

Remove variable active_scan as its value is set to 1 at initialization.
No further writes to active_scan are done. The equation results
accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtllib.h            | 2 --
 drivers/staging/rtl8192e/rtllib_softmac.c    | 3 +--
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 7db01d68000a..ba35ae4a21fa 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -755,7 +755,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 
 	priv->rtllib->current_network.beacon_interval = DEFAULT_BEACONINTERVAL;
 	priv->rtllib->iw_mode = IW_MODE_INFRA;
-	priv->rtllib->active_scan = 1;
 	priv->rtllib->be_scan_inprogress = false;
 
 	priv->rtllib->fts = DEFAULT_FRAG_THRESHOLD;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 307bcbb7fbb6..2f968c3c0229 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1332,8 +1332,6 @@ struct rtllib_device {
 	int rate;       /* current rate */
 	int basic_rate;
 
-	short active_scan;
-
 	/* this contains flags for selectively enable softmac support */
 	u16 softmac_features;
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index f84133744bc3..ff98b41c94e0 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -419,8 +419,7 @@ static void rtllib_send_probe(struct rtllib_device *ieee)
 
 static void rtllib_send_probe_requests(struct rtllib_device *ieee)
 {
-	if (ieee->active_scan && (ieee->softmac_features &
-	    IEEE_SOFTMAC_PROBERQ)) {
+	if (ieee->softmac_features & IEEE_SOFTMAC_PROBERQ) {
 		rtllib_send_probe(ieee);
 		rtllib_send_probe(ieee);
 	}
-- 
2.42.0

