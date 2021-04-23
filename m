Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D842FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:14 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c4so9801465wrt.8
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=91fZeTranZX1H5Z/+RUWnPue6CJoyhVbwkd9ov6Mo+w=;
        b=C1QiuZJpNteY9tZZCizOWRpMwd80IY+0+Z6NNmx097Rbuyevz/HsVPYomD0nj1yGGV
         xRUM7KwMwk8DXll5y/IkQMrEu2cWhw9R7KyD2SbvOcK6IbCJt8I5D0Xr+OOCGtHALH/f
         /wJgs1FYvyIzO8DG7lelpdsAfL+aGjpyXqtlsxQMuynLzda1K2KU+0Lmwy1M5USbYb32
         qTMS5hfhOJKerkQJVxi5Q08zRxjrNxSpVyWXX9ddagMwOVnBxFSEZ4AGABUFwkKDCRhi
         2IGWptmluPp/5veZzU3k3rXfxCOISGA0MdWzI301XGPxUzd/DOJ9X7qx2Sx29UXEhycA
         D0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91fZeTranZX1H5Z/+RUWnPue6CJoyhVbwkd9ov6Mo+w=;
        b=Cp4XtByjAX2BpYOHLfLk6yNGs4ByTjXU5zmbWfEeaHV4aRgtM08ySrTB6jvrUciAVi
         ttNEU2rNOoVky5TPLi8mJq85D6aj+vASEs/iilTjL45gHLeOUWDrZgRM+YLbCEGy/6qA
         JKgi3nY6BLiqsIViVSalZbbLxNG5Glmyrc6UvmjkoRXKoOqTyhTILvee4bQON3nSMS3V
         vNcaQpKTiNwtqSv6NkCyKTYSVN3rwRLGtC2IG3iM39rx08c6gLNm7R76Tk3Z2u5mMKeZ
         v28MDxxWjThoiOvbA+LPJMgfeYJSH2ORUuMsvrR63NozfZPN1KEYDvYgUwejj75tJWt4
         e23g==
X-Gm-Message-State: AOAM531/V0KzWGk/p4PZUBzq30nvZBUUF3ayttZZT52CSdE4SU0hraJW
	wykMynjlP6qTYjLLIcgV8+DS2hGmIz4=
X-Google-Smtp-Source: ABdhPJycyL434Rk6JWRy0HuzuT841TQGtYHfJq9NmUm+NdUTP6qYhYzLOhOZnjH4y4ni0+FIeiYxOQ==
X-Received: by 2002:a5d:4bc9:: with SMTP id l9mr5475396wrt.242.1619189953033;
        Fri, 23 Apr 2021 07:59:13 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id z14sm11147916wrt.54.2021.04.23.07.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/49] staging: rtl8723bs: move static array definition from header to .c file
Date: Fri, 23 Apr 2021 16:58:10 +0200
Message-Id: <497353741dc5b9045d62218fed39f51c25859f45.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move static array definition from header to .c file.
This prepare removal of a conditional compile block
_RTW_MLME_EXT_C_.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 30 +++++++++++++++++
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 32 -------------------
 2 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9031cf7657ae..1ff2b3a28bab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5997,6 +5997,36 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 	return res;
 }
 
+static struct fwevent wlanevents[] = {
+	{0, rtw_dummy_event_callback},	/*0*/
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, &rtw_survey_event_callback},		/*8*/
+	{sizeof(struct surveydone_event), &rtw_surveydone_event_callback},	/*9*/
+
+	{0, &rtw_joinbss_event_callback},		/*10*/
+	{sizeof(struct stassoc_event), &rtw_stassoc_event_callback},
+	{sizeof(struct stadel_event), &rtw_stadel_event_callback},
+	{0, &rtw_atimdone_event_callback},
+	{0, rtw_dummy_event_callback},
+	{0, NULL},	/*15*/
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, rtw_fwdbg_event_callback},
+	{0, NULL},	 /*20*/
+	{0, NULL},
+	{0, NULL},
+	{0, &rtw_cpwm_event_callback},
+	{0, NULL},
+	{0, &rtw_wmm_event_callback},
+
+};
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 472818c5fd83..0248b91b4525 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -805,38 +805,6 @@ enum {
 
 #ifdef _RTW_MLME_EXT_C_
 
-static struct fwevent wlanevents[] =
-{
-	{0, rtw_dummy_event_callback},	/*0*/
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, &rtw_survey_event_callback},		/*8*/
-	{sizeof(struct surveydone_event), &rtw_surveydone_event_callback},	/*9*/
-
-	{0, &rtw_joinbss_event_callback},		/*10*/
-	{sizeof(struct stassoc_event), &rtw_stassoc_event_callback},
-	{sizeof(struct stadel_event), &rtw_stadel_event_callback},
-	{0, &rtw_atimdone_event_callback},
-	{0, rtw_dummy_event_callback},
-	{0, NULL},	/*15*/
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, rtw_fwdbg_event_callback},
-	{0, NULL},	 /*20*/
-	{0, NULL},
-	{0, NULL},
-	{0, &rtw_cpwm_event_callback},
-	{0, NULL},
-	{0, &rtw_wmm_event_callback},
-
-};
-
 #endif/* _RTL8192C_CMD_C_ */
 
 #endif
-- 
2.20.1

