Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4291A79CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 21:03:39 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id t10so41472306edd.12
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 14:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679951017; x=1682543017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1dijQb8BuQ1TCaGZWjHBSiEbh0gAL996aMBpLIQUkU=;
        b=YLRt1mLppRbAUSoZtvP5gsGj7SNMrEFdjt3LJVP5tCvFFqfkpxvBs9CvVTr2EKF8NJ
         qi9Fto0b8TfBvro6NkW8PV2tijDQv8x3wQVaI+wawLdjFPKv/XWNG3TFrioB1dZx0uxy
         f77tHKh4ek8hPSSBWcaLsOhU5QRrHywD7pyUsWqJ/fiWwt9CoYr8PT+2lTb3Jikf1wo7
         u5DvQi2E8W6UdRsX3h4cK/h+xuaMlt70GKRCzadkF1SRcOvyUr+SiH5O434DHvsX/jgW
         mzVZLSV19QaiRqRGCSO2T9CNWq15+P2H2TMWlehALB9pfnf6AWiUf26viB4Tls2R30q/
         9w4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679951017; x=1682543017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1dijQb8BuQ1TCaGZWjHBSiEbh0gAL996aMBpLIQUkU=;
        b=ARfbntV9U7x9Q3WB2dvHyqc8lOFWrI933euvifUnx7/QgtRob/4Ru0XpxR5aUc8kSD
         w3KOXDmCRpCobnjtAM7WBHlbEUFHQFPUxNJZ5NeEakPK7DL3We2GbkicznSMs6VyQ4mp
         +BErPgRXDpbu5O2ihPKpo7WQoz+Fc/hCNmSCTtu5xj1bC38j4g0UzWAQiHLeSGDVIaP2
         oT7792AOPWM3V2zXWp/EvcAyF4hCE71cCctLIoCu2zF/0hkjNutofp5QrHW0BxbUfJIe
         ddcn0opVB3hQy8wN/Wb7ZDDocGHZtN/HC/vDwF54HOtCBcHg8uesP3/2fF+X6osyqXlc
         7g9w==
X-Gm-Message-State: AAQBX9eiOGhluG0t4ZymJ91oopt7ceM54rffzJmtdYDeDfAt+5bXlP6E
	y5BiXdpsHX9mvlRp5/uFII2wUjQ0wdg=
X-Google-Smtp-Source: AKy350aB5SpUawuuaM1kNxTxi4xFOG+eQ0y3u6d0yjM2nctv1Vsgga/cwaDAosROAT7V6/bw5C4lrg==
X-Received: by 2002:a17:906:519d:b0:939:5398:768e with SMTP id y29-20020a170906519d00b009395398768emr11736026ejk.7.1679951017597;
        Mon, 27 Mar 2023 14:03:37 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id w7-20020a17090649c700b0093d9fddcd22sm5655119ejv.125.2023.03.27.14.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:03:28 -0700 (PDT)
Date: Mon, 27 Mar 2023 23:03:14 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] staging: rtl8192e: Remove wireless mode
 WIRELESS_MODE_N_5G
Message-ID: <fdefd4d706493fa3f080550d31eb5bea3f4e1a7e.1679949171.git.philipp.g.hortmann@gmail.com>
References: <cover.1679949171.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679949171.git.philipp.g.hortmann@gmail.com>

Remove WIRELESS_MODE_N_5G from equations as it is not supported by
hardware and to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 689a5e16eb4d..7506d7eb7b4c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -581,8 +581,7 @@ static void _rtl92e_refresh_support_rate(struct r8192_priv *priv)
 {
 	struct rtllib_device *ieee = priv->rtllib;
 
-	if (ieee->mode == WIRELESS_MODE_N_24G ||
-	    ieee->mode == WIRELESS_MODE_N_5G) {
+	if (ieee->mode == WIRELESS_MODE_N_24G) {
 		memcpy(ieee->reg_dot11ht_oper_rate_set,
 		       ieee->reg_ht_supp_rate_set, 16);
 		memcpy(ieee->reg_dot11tx_ht_oper_rate_set,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index d45808760638..b5f4d0230da7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -296,8 +296,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	if (pra->rate_adaptive_disabled)
 		return;
 
-	if (!(priv->rtllib->mode == WIRELESS_MODE_N_24G ||
-	    priv->rtllib->mode == WIRELESS_MODE_N_5G))
+	if (priv->rtllib->mode != WIRELESS_MODE_N_24G)
 		return;
 
 	if (priv->rtllib->state == RTLLIB_LINKED) {
@@ -971,8 +970,7 @@ void rtl92e_dm_restore_state(struct net_device *dev)
 
 	if (priv->rate_adaptive.rate_adaptive_disabled)
 		return;
-	if (!(priv->rtllib->mode == WIRELESS_MODE_N_24G ||
-	      priv->rtllib->mode == WIRELESS_MODE_N_5G))
+	if (priv->rtllib->mode != WIRELESS_MODE_N_24G)
 		return;
 	ratr_value = reg_ratr;
 	ratr_value &= ~(RATE_ALL_OFDM_2SS);
-- 
2.39.2

