Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7E43FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t7so20003730wrw.13
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/zLW5/q9hznY+XgxCCcCfBzxU/PyaF17WOIkChCx4sE=;
        b=qFS8mSKuV+hhm9BXS2Xmv3gKHj81OhKA7zEvWOmnf6MsBHuJSu5pfEqewPlSYTeB2y
         RaGnH6BDsSS2LF6WTONxjJwuZHgzoDanq70OFzcH6Ael68kaVVB/1wXXZHtFsQvKA/Fc
         3wDF0UFQtSmBoOAMd+stfuyTjFe3KypNoxSjdA/CxuvrjFKT2cvwTW8vcO4/bZryja1Q
         gNI2XmSNNXfWisvlWGqnwg9c5cPSLQJcJxaEZw7+htqdSFcVDvIP6Ge8vht/L27WmvJy
         Wu1pFpqhURLP10MY79qkcutEwZAkvOb7JQ7Z9gr0mGw+yjjoGU7WxkqBAbqYddCgIejf
         3Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/zLW5/q9hznY+XgxCCcCfBzxU/PyaF17WOIkChCx4sE=;
        b=spSrPSNVSYoSdjlaeYLlLyI5qTgU8PCoCUPvIRmVVd15F0ifDJmqGoSgvY6hxzPYwH
         893866Bkb2EddbfQwsCiWDY4S4cl910fdg9lrXV+WZxxsBPhXsMBhJ/J1MLj/c8zdALv
         b3Q9SOTiAI0mj/SOc22K49HXd9irUJJmRrBlH+79FdEJaKvjtiATkS3UKcDIGuU6I65F
         +DRtMQGslLXrnqoLsaoT+rN4Xr1b5ANcV81B7iSHQtj+WPFAEVezgBBNC22wN2rxv0Cm
         Cz7yY8Zr7mi8w2UKhLIMrpOz5M7Dcx5uPzvHcE4iFcjuIe30J2k93jY0Ftw67mDVOX6g
         BahQ==
X-Gm-Message-State: AOAM531YyyXSD1yekusDy6Iv4ZVFMaGGjLQEt+pg33IrJsigxnHNdUN4
	vFk2IKzoEDMyjBMz85HANKI=
X-Google-Smtp-Source: ABdhPJyejryliBu6e6AiSWQfvg5+/9qzatH+0aD9U35uLbmR82DaM0hR+D082pQ0ARbfcv88Rk/zBw==
X-Received: by 2002:adf:fb50:: with SMTP id c16mr7247580wrs.120.1632424182491;
        Thu, 23 Sep 2021 12:09:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 16/17] staging: r8188eu: remove rtw_setstandby_cmd()
Date: Thu, 23 Sep 2021 21:09:19 +0200
Message-Id: <20210923190920.3580-17-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923190920.3580-1-straube.linux@gmail.com>
References: <20210923190920.3580-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_setstandby_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 32 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 33 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index d8acc6701248..8173756fdeb8 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -334,38 +334,6 @@ int rtw_cmd_thread(void *context)
 	thread_exit();
 }
 
-u8 rtw_setstandby_cmd(struct adapter *padapter, uint action)
-{
-	struct cmd_obj *ph2c;
-	struct usb_suspend_parm *psetusbsuspend;
-	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
-
-	u8 ret = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!ph2c) {
-		ret = _FAIL;
-		goto exit;
-	}
-
-	psetusbsuspend = kzalloc(sizeof(struct usb_suspend_parm), GFP_ATOMIC);
-	if (!psetusbsuspend) {
-		kfree(ph2c);
-		ret = _FAIL;
-		goto exit;
-	}
-
-	psetusbsuspend->action = action;
-
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psetusbsuspend, GEN_CMD_CODE(_SetUsbSuspend));
-
-	ret = rtw_enqueue_cmd(pcmdpriv, ph2c);
-
-exit:
-
-	return ret;
-}
-
 /*
 rtw_sitesurvey_cmd(~)
 	### NOTE:#### (!!!!)
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 8895874a654b..6ae0499cd81f 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -744,7 +744,6 @@ struct TDLSoption_param
 #define H2C_CMD_OVERFLOW	0x06
 #define H2C_RESERVED		0x07
 
-u8 rtw_setstandby_cmd(struct adapter *padapter, uint action);
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 		      int ssid_num, struct rtw_ieee80211_channel *ch,
 		      int ch_num);
-- 
2.33.0

