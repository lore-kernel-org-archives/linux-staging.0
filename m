Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C6117D3
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 10:49:28 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id n6so11778343ejc.13
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zViYAUFQVHIRikDuX6j+iM/MlBPaBYxpO5JyU8YFMSI=;
        b=HX7FccOo5jAwIAyUPKPVfO1C7rM0P2OVxOou/QVrnJSIT8xcG1zyigtwztrhCwtuY9
         ZmM78DmWkl1jSmUf0/sqnlU3hvYkKN9lXcyisU0IZ+cgFmbjyuE1H5TyxDwTavTb0gvU
         CAAMscYuY3SiXo+X1RhtxqSoVeU+ebWghnPhMSFrs+TuvIccWK9kKjRO/5GCbSTy4F7y
         +UxAuJuGV8ergvjCPFOyk23JC+QdVT/B9jmn7GfWJh6TDjo3JMPE3KWskuzQ88jxubQc
         a/9s1mTkhxnFQatLwgT/tuwaZ3Wrr5t/5G1gAi+FFjSQADlhFcR6vjLeZySxdKf6L4bn
         nv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zViYAUFQVHIRikDuX6j+iM/MlBPaBYxpO5JyU8YFMSI=;
        b=3YNL2X6d0x0S1pXbCgC+aLsI0JCIdA9Sy5u3NbJy7pnQd6FX1GXEJARF9FDCmKBL4y
         rCsMBDdIHLi+af74marhjlnto1HZV3kMt31bsxNQsR01CUfLo613CHS5Mw2Obg2IDX8D
         pGSapB44vlCDOpshzseECjlZD9cjQ3O6kCWioEBROQUq4y+znHqreHz+2nOZcpS5AQD/
         fNb69MTmUGQlMmMd2QGPeJTFtpIqAl1ucotzxI4I1tIsDxhsTButiUaFyI1JDK9htHGu
         EgIPjuVAXzkLthpFUCsMksQZG33UFZVSEcIIEaY/CyB7y0CuWdU/jFzrZW67sOlcIb8a
         YjkQ==
X-Gm-Message-State: AOAM531tYU2EA9RL7RleXFPoKKM0eR4aoy9twk1SlE36BS6D7JdLkaxA
	5NOPzqbxB/dQdy95VvPhv4Y=
X-Google-Smtp-Source: ABdhPJz2XGP+0BiflWArPaHsDrJe6au9KfAeYxqej54AetrBlgpkuyRds+r5h/lm/oAs4/axf/h0FA==
X-Received: by 2002:a17:907:7f04:b0:6e0:39a2:79a6 with SMTP id qf4-20020a1709077f0400b006e039a279a6mr2775579ejc.243.1649155767360;
        Tue, 05 Apr 2022 03:49:27 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id j12-20020a50e0cc000000b0041cd813ac01sm2436702edl.28.2022.04.05.03.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:49:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/4] staging: r8188eu: remove HAL_DEF_IS_SUPPORT_ANT_DIV
Date: Tue,  5 Apr 2022 12:49:08 +0200
Message-Id: <20220405104910.9769-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405104910.9769-1-straube.linux@gmail.com>
References: <20220405104910.9769-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to get rid of the function GetHalDefVar8188EUsb(), remove
the HAL_DEF_IS_SUPPORT_ANT_DIV case from it and move the functionality
into a new function. This is part of the ongoing effort to get rid of
the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
- made the function static
- used a more obvious function name

 drivers/staging/r8188eu/core/rtw_cmd.c     | 11 ++++++++---
 drivers/staging/r8188eu/hal/usb_halinit.c  |  3 ---
 drivers/staging/r8188eu/include/hal_intf.h |  1 -
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 8b24330e97c1..66d4346a34ee 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1094,16 +1094,21 @@ static void antenna_select_wk_hdl(struct adapter *padapter, u8 antenna)
 	}
 }
 
+static bool rtw_antenna_diversity(struct adapter *adapter)
+{
+	struct hal_data_8188e *haldata = &adapter->haldata;
+
+	return haldata->AntDivCfg != 0;
+}
+
 u8 rtw_antenna_select_cmd(struct adapter *padapter, u8 antenna, u8 enqueue)
 {
 	struct cmd_obj		*ph2c;
 	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
 	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
-	u8	support_ant_div;
 	u8	res = _SUCCESS;
 
-	GetHalDefVar8188EUsb(padapter, HAL_DEF_IS_SUPPORT_ANT_DIV, &support_ant_div);
-	if (!support_ant_div)
+	if (!rtw_antenna_diversity(padapter))
 		return res;
 
 	if (enqueue) {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 4bc6b08fb282..805460bd6340 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1204,9 +1204,6 @@ void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariab
 	struct hal_data_8188e *haldata = &Adapter->haldata;
 
 	switch (eVariable) {
-	case HAL_DEF_IS_SUPPORT_ANT_DIV:
-		*((u8 *)pValue) = (haldata->AntDivCfg == 0) ? false : true;
-		break;
 	case HAL_DEF_CURRENT_ANTENNA:
 		*((u8 *)pValue) = haldata->CurAntenna;
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index e222ab89bfc5..6a80e517a7ad 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -28,7 +28,6 @@ enum hw_variables {
 };
 
 enum hal_def_variable {
-	HAL_DEF_IS_SUPPORT_ANT_DIV,
 	HAL_DEF_CURRENT_ANTENNA,
 	HAL_DEF_DBG_DM_FUNC,/* for dbg */
 };
-- 
2.35.1

