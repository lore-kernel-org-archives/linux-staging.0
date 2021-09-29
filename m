Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6E3FDD
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 19:27:08 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id s17so12494367edd.8
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/fwnYwdf+gSloKQem0f1nmecGc0W6TAldwAgaXP+9LE=;
        b=YdsK5adZfs1pptjmHG3tQd+dl0O6eYvBTpUHgxKQTfhbp4XSvXObyTR5ZpB0XaP1T6
         9htdTD2D6GyXmA3YoXcvwS6/aL92rlf8lKeGD0D2Xq/tgiQ2/OZltIus0h2JE/1ZaKe7
         0iOvfkvGOiOvXKdNTCI4CkIRNnvW2G9W1IYHgwT123u9dccYsjKcY7Q8lT1cEHnDRZUW
         MdzVjGo6lffrIf3gOAxjroFXnsiRHN82aNSYNG+IbfF4Rja/sARi8KGpKYjgTVpVXGjD
         d9ohRQDM7Ut75xX3wtmcIZdf4XT0cIA1PnmGSummRuZGxvCUBa21gF+7GfLEIWqbytWn
         5cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/fwnYwdf+gSloKQem0f1nmecGc0W6TAldwAgaXP+9LE=;
        b=eMuWeijWyJHurQNTrV2CKr5F1qgMEVzhoHcQF9xQ5vuiqexpLg6QpYgGcbi1iErPsJ
         vbEmQcPRANJqVfDKihurGLXJDVBh3nsvgRgHXy1W1HrbBj3ESYTFm8nrAaP9zlLAwYg4
         5BS2Gpe+lromZYzDAc7LEdgSn8mzMfNk0hzjdXZjHVvN+7SRdPSERGf7jAHiSiNjLC3L
         kRrYQFXBdNfm7TyHstUUkVOprhyIxYzb5Ade3KF/HSDKvIXpzOKbqIPcyFIxXKOEZW9G
         5Wp15sZBz/aH0pbliBseCpUH1/7SlaM2/gPpVyVksYsGdrHCa/hvjXb/ZHdY+/hswY09
         DLjg==
X-Gm-Message-State: AOAM533v0BZJN5tDCn4+rz9thG4zOsykAOlrLNJoeF7wFOxQlbnovrN/
	GOM26sQeIMT7jdJq4av06h4=
X-Google-Smtp-Source: ABdhPJzxK32lsQQHfd2MTCek9qYOPly+427Gx1Q6TddF2uP2v5i4e7zv9+T1soyHj2k1PTqOFm1NHw==
X-Received: by 2002:a05:6402:1291:: with SMTP id w17mr1989323edv.29.1632943627224;
        Wed, 29 Sep 2021 12:27:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::bfc8])
        by smtp.gmail.com with ESMTPSA id f10sm449019edu.70.2021.09.29.12.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 12:27:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/7] staging: r8188eu: remove init_xmit_priv from struct hal_ops
Date: Wed, 29 Sep 2021 21:26:53 +0200
Message-Id: <20210929192657.9569-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929192657.9569-1-straube.linux@gmail.com>
References: <20210929192657.9569-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove init_xmit_priv from struct hal_ops an remove its wrapper
rtw_hal_init_xmit_priv(). Call rtl8188eu_init_xmit_priv() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c    | 2 +-
 drivers/staging/r8188eu/hal/hal_intf.c     | 7 -------
 drivers/staging/r8188eu/hal/usb_halinit.c  | 2 --
 drivers/staging/r8188eu/include/hal_intf.h | 4 ----
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 896ed91d3814..bd11270a0c30 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -200,7 +200,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	mutex_init(&pxmitpriv->ack_tx_mutex);
 	rtw_sctx_init(&pxmitpriv->ack_tx_ops, 0);
 
-	rtw_hal_init_xmit_priv(padapter);
+	rtl8188eu_init_xmit_priv(padapter);
 
 exit:
 
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index f72978e384ac..ff06307f07c7 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -72,13 +72,6 @@ u32 rtw_hal_inirp_deinit(struct adapter *adapt)
 	return _FAIL;
 }
 
-s32 rtw_hal_init_xmit_priv(struct adapter *adapt)
-{
-	if (adapt->HalFunc.init_xmit_priv)
-		return adapt->HalFunc.init_xmit_priv(adapt);
-	return _FAIL;
-}
-
 s32 rtw_hal_init_recv_priv(struct adapter *adapt)
 {
 	if (adapt->HalFunc.init_recv_priv)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index cebad5590d15..93733c59ba58 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2153,8 +2153,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->inirp_init = &rtl8188eu_inirp_init;
 	halfunc->inirp_deinit = &rtl8188eu_inirp_deinit;
 
-	halfunc->init_xmit_priv = &rtl8188eu_init_xmit_priv;
-
 	halfunc->init_recv_priv = &rtl8188eu_init_recv_priv;
 	halfunc->free_recv_priv = &rtl8188eu_free_recv_priv;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 22a52d2ed477..915f16f3d452 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -128,8 +128,6 @@ struct hal_ops {
 	u32	(*inirp_init)(struct adapter *padapter);
 	u32	(*inirp_deinit)(struct adapter *padapter);
 
-	s32	(*init_xmit_priv)(struct adapter *padapter);
-
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
@@ -188,8 +186,6 @@ void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 u32	rtw_hal_inirp_init(struct adapter *padapter);
 u32	rtw_hal_inirp_deinit(struct adapter *padapter);
 
-s32	rtw_hal_init_xmit_priv(struct adapter *padapter);
-
 s32	rtw_hal_init_recv_priv(struct adapter *padapter);
 void	rtw_hal_free_recv_priv(struct adapter *padapter);
 
-- 
2.33.0

