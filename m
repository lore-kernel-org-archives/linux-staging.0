Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C351C53A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 20:00:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id k16so13676wms.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 12:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKHxjmN02i/BHbdj2UWJHSksRbf2ziy6vT0R/buc9Kw=;
        b=I5FI9EU/z5BZ4/wpjNCc/vMEvZPZI6KnWjr9ycx26XKe1v+Wat2zoohBGrbayqUYRY
         xAKlpfayi6Fdy//xjIpTh5EgECV1JH1/XcZ5B9AWNI6K7tq68o1NNnuS5QxkmBa78GRO
         LDkIBMMPMNO0VugcwJUAEHMFvWad5CU03fKGxD83Ink33tfnPVrVAZzTfgHMWNJrwOp1
         B5hUZqIJSRh9fbN5fpK6YohtKHepiTXU1QJ28K7sKp8U6qZXLTXyAXpILbteVl5gw+yT
         G7joulItwvXIsbwlMQuci08Jrl+q+XMXS5ECAG9up8gwfVj+cxQwjma+0DZ3RT02BVPT
         dH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKHxjmN02i/BHbdj2UWJHSksRbf2ziy6vT0R/buc9Kw=;
        b=YrviIJloGsrYUSUBIanwKJxiVef3wm37c6aJm4OKRO5DzWZ7uh6mDC7aRBdDMMPXmD
         7ysRiqsIQDOHioReyDlAga3aZyWyBSmM/uZoMxh19eC2DERlCNiaENNdnI56Ze6KuAaR
         imjOpNrDEe/OxQyfs1/xSDrLOlJsw1O05S/PMQiRalvjU+vOpcZA1vU1zdwrh5O5v0Fj
         HNWInTcDJ/PLwwud+8IhpmZVdn7UM88dLvPgrEMhq7h30Ji5A450WuLvE5HGt28RHn9j
         8BPW/qu09+M5FU4AOonYhe8USAskZPb0zbzcbi6Gdw5QPQJhdEPbi8OZPE2/uVCW/Bod
         pn1w==
X-Gm-Message-State: AFqh2kortGF0gHqir4MbIRNc7GiGHR0seyE7VWJm22oQPFkSl1igI9lA
	yiQuYf7ty/eCG657oFIhurQ=
X-Google-Smtp-Source: AMrXdXtM6vpOEkGvWWDvDbC+610yIbibv+L0IS1JciOtIsHsPzq60bZVFNIVj8rFbJneozPo3mCOag==
X-Received: by 2002:a05:600c:3b29:b0:3da:f7a9:50ca with SMTP id m41-20020a05600c3b2900b003daf7a950camr2017626wms.0.1674072020111;
        Wed, 18 Jan 2023 12:00:20 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id e1-20020a5d65c1000000b002be15ee1377sm6184451wrw.22.2023.01.18.12.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 12:00:19 -0800 (PST)
Date: Wed, 18 Jan 2023 21:00:17 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] staging: rtl8192e: Remove unused variable DM_Type
Message-ID: <380fa2767d1f1cc32a5ad271057683d67ceb1b6f.1674071236.git.philipp.g.hortmann@gmail.com>
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

DM_Type is initialized and then never evaluated. Remove resulting dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h   | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 6662558e56fa..11f3f88491b2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -457,8 +457,6 @@ struct r8192_priv {
 	bool set_rf_pwr_state_in_progress;
 	bool bdisable_nic;
 
-	u8 DM_Type;
-
 	u8 cck_pwr_enl;
 	u16 tssi_13dBm;
 	u32 pwr_track;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index cb55b6645674..ba92dab682ec 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -203,8 +203,6 @@ void rtl92e_dm_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	priv->DM_Type = DM_Type_ByDriver;
-
 	priv->undecorated_smoothed_pwdb = -1;
 
 	_rtl92e_dm_init_dynamic_tx_power(dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 1d4d7d98a859..65d077dfee37 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -47,8 +47,6 @@
 #define		TX_RETRY_COUNT_REG		0x1ac
 #define		RegC38_TH				 20
 
-#define		DM_Type_ByDriver		1
-
 /*--------------------------Define Parameters-------------------------------*/
 
 
-- 
2.39.0

