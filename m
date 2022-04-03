Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F91FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:53:05 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id ot30so5513223ejb.12
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4eX3bcVXRctAIJWE0PzZknmJGr6Nu+7MDG6sRwBC8R4=;
        b=epsyyxWpxYd+pf8i8+w4cH0N6Kma/d1PJ2WVLDRIedX8TYhSdOz4NrhugWDDKuVrFP
         PfOnrxfPPquXd+VPi6LktGYXsoCDjgqGvgUSWiJAYggH1Ix636PAArSKZCw4En2Ul69m
         gPC1pHWSaJyMroWdh/cdzI5/k9/dUQ9mLdyVXYPL8S1xsT7U3Wl+JmgrXkQXVH6/c2v0
         RNXsfEoDFbw29CQSLf+fqGLR8QZkmYg5dm+gbp8ezYQJITBHbhLfQmQvOLsKDa68nsgC
         7l+8dXZn64/pggf+yvqf4URkkAynYGkwA18lX9a0Y4YwjI+A4L5EiETABHAQ2Vv8a2OW
         4Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4eX3bcVXRctAIJWE0PzZknmJGr6Nu+7MDG6sRwBC8R4=;
        b=c3smPlpwGtxp9tfgEarURjiinhTPQ4q6NC3v4Zu5VZf84NidhL5jemZzMPbC1mbaY+
         Y+Ni40u4hlNfq74/3KX1ejHMYDdd4efASFs2dWZy2T/auqD/mVa4L+bFgHOFAedbYI8z
         8YGIzySTn3++OQZsGKL9xFk5YW3we0toAwTzfn+//5yDwU7rqylVKGN3cwEUQ5b2Qdrf
         L5clMjiC/qYv2fKwVWOeUMjer42j4tmpZrAiwJ5zyxYvvbjG6oM8M6IW+5w/r7U1Czkd
         llC6P47uOYlFVz2QfwKTkaV9yFboAZrN4um0urH40BkQzdPltc7Hg84UJSzc+94cogqo
         NGug==
X-Gm-Message-State: AOAM5314RjhXkNF5SFSOQhxw7m34gk5CwGZPX52/cesA8ZJbfSNg9ejK
	R4rFgRnV5A26y1xhuiNkh+bFaaJkJok=
X-Google-Smtp-Source: ABdhPJyC75SVETDy5ohVbpOLgMyEY4yCaWXXexkaReT/gQ0Hu9tqBVZJT4YDpdmpMjr39j7mhJeZrQ==
X-Received: by 2002:a17:907:dab:b0:6df:e51a:b990 with SMTP id go43-20020a1709070dab00b006dfe51ab990mr7370885ejc.573.1649004784173;
        Sun, 03 Apr 2022 09:53:04 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id d4-20020a056402000400b00412d60fee38sm4018138edu.11.2022.04.03.09.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 09:53:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: use support_ant_div()
Date: Sun,  3 Apr 2022 18:52:52 +0200
Message-Id: <20220403165255.6900-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403165255.6900-1-straube.linux@gmail.com>
References: <20220403165255.6900-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use support_ant_div() instead of checking haldata->AntDivCfg directly.
This improves readability and makes future cleanups, e.g. removing the
hal_data_8188e structure, easier.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 8 +++-----
 drivers/staging/r8188eu/hal/usb_halinit.c | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 6d28e3dc0d26..d69327f361aa 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -33,7 +33,7 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 	int i;
 
 	pdmpriv->InitODMFlag = ODM_BB_RSSI_MONITOR;
-	if (hal_data->AntDivCfg)
+	if (support_ant_div(Adapter))
 		pdmpriv->InitODMFlag |= ODM_BB_ANT_DIV;
 
 	dm_odm->SupportAbility = pdmpriv->InitODMFlag;
@@ -102,9 +102,7 @@ void rtl8188e_init_dm_priv(struct adapter *Adapter)
 /*  Compare RSSI for deciding antenna */
 void AntDivCompare8188E(struct adapter *Adapter, struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src)
 {
-	struct hal_data_8188e *hal_data = &Adapter->haldata;
-
-	if (0 != hal_data->AntDivCfg) {
+	if (support_ant_div(Adapter)) {
 		/* select optimum_antenna for before linked =>For antenna diversity */
 		if (dst->Rssi >=  src->Rssi) {/* keep org parameter */
 			src->Rssi = dst->Rssi;
@@ -122,7 +120,7 @@ u8 AntDivBeforeLink8188E(struct adapter *Adapter)
 	struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
 
 	/*  Condition that does not need to use antenna diversity. */
-	if (hal_data->AntDivCfg == 0)
+	if (!support_ant_div(Adapter))
 		return false;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED))
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 31ec88b7a400..e5b352671ea4 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -492,7 +492,7 @@ static void _InitAntenna_Selection(struct adapter *Adapter)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
 
-	if (haldata->AntDivCfg == 0)
+	if (!support_ant_div(Adapter))
 		return;
 
 	rtw_write32(Adapter, REG_LEDCFG0, rtw_read32(Adapter, REG_LEDCFG0) | BIT(23));
-- 
2.35.1

