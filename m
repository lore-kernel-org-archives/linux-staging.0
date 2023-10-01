Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6F17738
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:45:30 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9b2c5664cb4so144168966b.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167929; x=1696772729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4mpp0HTqoMB98qe9eiYEXks5rNRdwSriBgWOGd0HtU=;
        b=mgtfgdO/BuPt57cPwWSTtlhaalwGtf80xk9IVGtSzwqZjvB9kd0n02fJLD68Wx4TRn
         +y4mn+AArrRHriqhD9SwQyiF99Mhxl1SzCe/UQHeQfcHZCAmAONvXN0twR4nhYZGlaoZ
         BE549XFBWWSXRmHbwKVSpMcXTY5/ZTSJN/9khoCktKW+zz+phK/8ZvXGDCv101rfWec4
         xRP5oRc1ZuBPn38+QFaFc/SxeO27uQPL06l5l/qPMFpk4YckYQiL9hyD2MK863cm7sTo
         rs4IARjrUkovw2dSoQ2B3xEjKno0CFC4PwYqCYOdjZsb3HYCI/GnJ+R/0eyVNapLaEfa
         S37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167929; x=1696772729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4mpp0HTqoMB98qe9eiYEXks5rNRdwSriBgWOGd0HtU=;
        b=eDrpF4L6cReuwM5Ybxe838AI3hZolg9PkDcbn166tuyAAD+P29Yd+8JbEQc6F7ayiP
         syOcxFpgH0sJwuRfRObhA+O/P1pRYkP+K+41RrkTY6Lmy2masKWGtAdSiEosEErwQure
         BdDm+j9Gag0TC0PQvCOPwLN3ABC+DfuGFrWq5CG5IFQun5jxkLHeYGOOnCIpgqLQlYgI
         +17auIMKe7yvfYhvEspOR9iZ3h8F/CxQn1wIGs8+sGn5LWGCNIP6niqwMr1z/gRLk9BU
         ktlDrCSVadttCz3FG5lmivY1b8cFR5vKxSzXmjlWeQdVLbnHN5pCYGTo9dj5P5/xZoBg
         ilsA==
X-Gm-Message-State: AOJu0YyjyzISCPeCYzxB7ELKZnqTvoVSfW3SSGAF/BkxrzvGf50urdPq
	3N6xSEolmC0QvG3dCj89+II=
X-Google-Smtp-Source: AGHT+IGNkNqp55500Dar/9Z/ljUObrvuldAHFjlgKHrcz54z7M5xcd0kE8B6BUbPJYEtmdXyb+UF7g==
X-Received: by 2002:a17:906:2ce:b0:9ae:3f76:1091 with SMTP id 14-20020a17090602ce00b009ae3f761091mr6844214ejk.0.1696167928880;
        Sun, 01 Oct 2023 06:45:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id bn23-20020a170906c0d700b0099cd1c0cb21sm15429750ejb.129.2023.10.01.06.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:45:28 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:45:27 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] staging: rtl8192e: Remove r8192_private_handler
 _rtl92e_wx_force_reset()
Message-ID: <8447643122088ff03dab65ac15e5e5199603008d.1696165351.git.philipp.g.hortmann@gmail.com>
References: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696165351.git.philipp.g.hortmann@gmail.com>

Remove r8192_private_handler _rtl92e_wx_force_reset() as driver does not
reset. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 18 +-----------------
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 2b91c481df93..c4688c273f4b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -754,7 +754,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rfa_txpowertrackingindex = 0;
 	priv->rfc_txpowertrackingindex = 0;
 	priv->cck_pwr_enl = 6;
-	priv->force_reset = false;
 	memset(priv->rtllib->swcamtable, 0, sizeof(struct sw_cam_table) * 32);
 	priv->rx_ctr = 0;
 	priv->rtllib->wx_set_enc = 0;
@@ -1130,8 +1129,6 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 		check_reset_cnt = 3;
 	}
 	spin_unlock_irqrestore(&priv->tx_lock, flags);
-
-	priv->force_reset = false;
 }
 
 static void _rtl92e_watchdog_timer_cb(struct timer_list *t)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 0ebebb3c2c35..deb707dfa443 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -371,7 +371,6 @@ struct r8192_priv {
 
 	u16		tx_counter;
 	u16		rx_ctr;
-	bool		force_reset;
 	bool		force_lps;
 };
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 17e7fcc01f70..ec09066f2f32 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -141,19 +141,6 @@ static int _rtl92e_wx_set_rawtx(struct net_device *dev,
 	return ret;
 }
 
-static int _rtl92e_wx_force_reset(struct net_device *dev,
-				  struct iw_request_info *info,
-				  union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	mutex_lock(&priv->wx_mutex);
-
-	priv->force_reset = *extra;
-	mutex_unlock(&priv->wx_mutex);
-	return 0;
-}
-
 static int _rtl92e_wx_adapter_power_status(struct net_device *dev,
 					   struct iw_request_info *info,
 					   union iwreq_data *wrqu, char *extra)
@@ -1060,9 +1047,6 @@ static const struct iw_priv_args r8192_private_args[] = {
 	}, {
 		SIOCIWFIRSTPRIV + 0x2,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "rawtx"
-	}, {
-		SIOCIWFIRSTPRIV + 0x3,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "forcereset"
 	}, {
 		SIOCIWFIRSTPRIV + 0x6,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
@@ -1089,7 +1073,7 @@ static iw_handler r8192_private_handler[] = {
 	(iw_handler)_rtl92e_wx_set_debug,   /*SIOCIWSECONDPRIV*/
 	(iw_handler)_rtl92e_wx_set_scan_type,
 	(iw_handler)_rtl92e_wx_set_rawtx,
-	(iw_handler)_rtl92e_wx_force_reset,
+	(iw_handler)NULL,
 	(iw_handler)NULL,
 	(iw_handler)NULL,
 	(iw_handler)_rtl92e_wx_adapter_power_status,
-- 
2.42.0

