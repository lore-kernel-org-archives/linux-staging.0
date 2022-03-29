Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D32598
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:21:54 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id bq8so23469718ejb.10
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 13:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rm745D6xhclneBAjGr3VVkPQWEDVAMfJN6aO5oy/Yx4=;
        b=XWrTwpWwc6tx4JOrixKR++eET5FoOLIPUNU98mZounH+JyVXW/JA2DxPuCWY6QAjIy
         FoR1QyN8RiiMyWOvyAcD3ZI42e0tBW7EMVaOucIYOWPIotA4X6+pprt0WifmXxSmME4n
         O+XD2urLrbzI6/dzLc2oJ0zz4rgY4dLMPY45iE5BI2mPQVSt3C87UU8/wP0xDdSRWr/J
         9q/pHuhooyy63dz6MK9TvR5tdoZ/zICKUyhTIGAhIhFRLEl8Fog95CXJfmcZnE51vYoX
         QMnClf0/rGMyq+D3OeAHBC0KBUixpeH4XsxlHL4X+P4JjoG9Bj0QH4Clecfy43PpKTMW
         jLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rm745D6xhclneBAjGr3VVkPQWEDVAMfJN6aO5oy/Yx4=;
        b=pJA13kMH9zOi2sEjqdn9YsBD+KP2JBEtIHc23gTxz5FJvA9eJ0lCyBkWX3inmvwa+8
         wC4BI9+F33/NhRLJzkrrKJxJk1grY1dkrSQFis3v493Y+3s9ELXb5du/F7LSEbP8mFtK
         KJaefqremRr4ZYamxi/PKsIbNZiNATXECafY+XFLneGfIto1Otn+CoouB9S04jafWulC
         nOhgFDzQ7nPIf7jY8nv1x510lF4GwK7urlCTh026xuidBu2JqTBvroHpipUIf8yId/hR
         An0prDLg4l1ifPf/KeZuWmsstWUL2Cih39u9DEwcPkzmeJ9NTCbrgHin3Xg8t/N315d6
         9C3Q==
X-Gm-Message-State: AOAM5323itPIxASanPZYZumVv6CGshUMabibNvyjakbB1+nkgoYxHLt9
	zLe3RNkbHF98kItNi316r3M=
X-Google-Smtp-Source: ABdhPJxSWEuMjJjWnQiMZVz+zwSjoXL8OwJOedad+fGqqzzmL0mySxT/9s/fOSJUHghYbZv0iDlabg==
X-Received: by 2002:a17:906:3adb:b0:6b7:876c:d11b with SMTP id z27-20020a1709063adb00b006b7876cd11bmr36234623ejd.250.1648585312922;
        Tue, 29 Mar 2022 13:21:52 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id ss12-20020a170907038c00b006e0ec9e806dsm3938111ejb.136.2022.03.29.13.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 13:21:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 5/8] staging: r8188eu: remove HW_VAR_RXDMA_AGG_PG_TH from SetHwReg8188EU()
Date: Tue, 29 Mar 2022 22:21:38 +0200
Message-Id: <20220329202141.7028-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329202141.7028-1-straube.linux@gmail.com>
References: <20220329202141.7028-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HW_VAR_RXDMA_AGG_PG_TH case in SetHwReg8188EU() just sets a
variable conditionally and then calls rtw_write8(). Set the variable
in the caller and call rtw_write8() directly. Move the functionality
into a new static function to make the code cleaner. Remove the
HW_VAR_RXDMA_AGG_PG_TH case from SetHwReg8188EU(). This is part of the
ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: Moved the code into a function and included patch 6/9 of v1.

 drivers/staging/r8188eu/core/rtw_mlme.c    | 34 +++++++++++++---------
 drivers/staging/r8188eu/hal/usb_halinit.c  |  8 -----
 drivers/staging/r8188eu/include/hal_intf.h |  1 -
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index f1e1627641cb..086d64542082 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1787,10 +1787,29 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 }
 
+static void rtw_set_threshold(struct adapter *adapter)
+{
+	u8 threshold;
+	struct mlme_priv *mlmepriv = &adapter->mlmepriv;
+	struct ht_priv *htpriv = &mlmepriv->htpriv;
+
+	/*  TH = 1 => means that invalidate usb rx aggregation */
+	/*  TH = 0 => means that validate usb rx aggregation, use init value. */
+	if (htpriv->ht_option) {
+		if (adapter->registrypriv.wifi_spec == 1)
+			threshold = 1;
+		else
+			threshold = USB_RXAGG_PAGE_COUNT;
+
+		rtw_write8(adapter, REG_RXDMA_AGG_PG_TH, threshold);
+	} else {
+		rtw_write8(adapter, REG_RXDMA_AGG_PG_TH, 1);
+	}
+}
+
 /* the function is at passive_level */
 void rtw_joinbss_reset(struct adapter *padapter)
 {
-	u8	threshold;
 	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv		*phtpriv = &pmlmepriv->htpriv;
 
@@ -1801,18 +1820,7 @@ void rtw_joinbss_reset(struct adapter *padapter)
 
 	phtpriv->ampdu_enable = false;/* reset to disabled */
 
-	/*  TH = 1 => means that invalidate usb rx aggregation */
-	/*  TH = 0 => means that validate usb rx aggregation, use init value. */
-	if (phtpriv->ht_option) {
-		if (padapter->registrypriv.wifi_spec == 1)
-			threshold = 1;
-		else
-			threshold = 0;
-		SetHwReg8188EU(padapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
-	} else {
-		threshold = 1;
-		SetHwReg8188EU(padapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
-	}
+	rtw_set_threshold(padapter);
 }
 
 /* the function is >= passive_level */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 1bf867123c48..1b08346f2afd 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1193,14 +1193,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_RXDMA_AGG_PG_TH:
-		{
-			u8 threshold = *((u8 *)val);
-			if (threshold == 0)
-				threshold = USB_RXAGG_PAGE_COUNT;
-			rtw_write8(Adapter, REG_RXDMA_AGG_PG_TH, threshold);
-		}
-		break;
 	case HW_VAR_H2C_FW_PWRMODE:
 		{
 			u8 psmode = (*(u8 *)val);
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 5b4de29a2e10..8708675c3478 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -25,7 +25,6 @@ enum hw_variables {
 	HW_VAR_AC_PARAM_BE,
 	HW_VAR_AMPDU_MIN_SPACE,
 	HW_VAR_AMPDU_FACTOR,
-	HW_VAR_RXDMA_AGG_PG_TH,
 	HW_VAR_H2C_FW_PWRMODE,
 	HW_VAR_H2C_FW_JOINBSSRPT,
 	HW_VAR_FWLPS_RF_ON,
-- 
2.35.1

