Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5291366
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 09:23:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bq8so10397896ejb.10
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CMIGyrKRIzwf4OHg6GTOimV0qeMIV89zyETvl4jfxmY=;
        b=qxQXERQUhKHA33AWb96zh4x7gi+dTC4uVeO3P3erxfJ2ccnYvDzhjP5huNYaPBOBRd
         fQdQabkT0ag+GwT8B0R4Acjj9czvZrHsz8N1mt4C0Jt/NrAlLbn03MfjBKfjk9+EcjWY
         usTkX1yPbrpibhSJx3ns5XWXpsht6H4ke5Qb0XWiJK1Idj+tchfrrKggfd2Tydyoztj4
         G3L5ECeoHdZTTbs0KY5KEzaC3jToPu1Flk1v7ZOIRpB4sktbTx5HxwIhsLq8ajgH9a3X
         Ex5RXC/2qMV93cxc1ppYPRnXzwDOC9cBTOQsYa9Qfd0rx44/ZfAIRTT2rojXl0YK3w3P
         APrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CMIGyrKRIzwf4OHg6GTOimV0qeMIV89zyETvl4jfxmY=;
        b=GFWuBPe4Ai0VGgQ4iR1l1exj+mRnqyN5yGd3qTKjN31NKCB4rXg8dS2xAgOS5/EW93
         LDeJoHkIcfpX29/TrsHTCmVBylRvYGhZ6j6Xty8UtpsxMAE0lusB9PqBdTCXtwpLHCej
         Q+mkdMxHxDwq1YFzQQC8TMn88Wg2wbMl+Qbg3vVtVMsEAyhkF/4OFuMWYGpNLZVmACkD
         rOwWhI5DLhsco+1nf0csTtsEfJowq5tzJuA4sr40bqgTARMB+U8KsTGQyO26if1c0rcJ
         JcHcSVyVrLyyb3Zc9H135LZvrJAyFAW+BtrrVUwUc1tqUFrx2zL1E+WOUkdrCkTXPYRc
         fTPA==
X-Gm-Message-State: AOAM530MmXjVf6QOmjHdpzazjSAiq4G5YhhtacD2Nh5FNedb2oItNdcW
	R3NxczuvwYsNXmH2vlZH21jKr16k81E=
X-Google-Smtp-Source: ABdhPJy9n3o43+IUFCWkr8QOG0kXNRC5rP/SV0HLxLjedxpaT50XikzqJIhW3CHWwV2Q+jTScXgZ6Q==
X-Received: by 2002:a17:907:2d2a:b0:6df:c027:a3ac with SMTP id gs42-20020a1709072d2a00b006dfc027a3acmr3075835ejc.179.1648891419319;
        Sat, 02 Apr 2022 02:23:39 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id jv19-20020a170907769300b006e095c047d6sm1897679ejc.109.2022.04.02.02.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 02:23:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/7] staging: r8188eu: remove HW_VAR_ACK_PREAMBLE from SetHwReg8188EU()
Date: Sat,  2 Apr 2022 11:23:27 +0200
Message-Id: <20220402092332.6627-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402092332.6627-1-straube.linux@gmail.com>
References: <20220402092332.6627-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HW_VAR_ACK_PREAMBLE case from SetHwReg8188EU() and move
its functionality to rtw_wlan_util.c where it is actually used. This
is part of the ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 20 +++++++++++++++-----
 drivers/staging/r8188eu/hal/usb_halinit.c    | 12 ------------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index f005bd3c9ff2..acc554627adc 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1304,26 +1304,36 @@ void update_IOT_info(struct adapter *padapter)
 	}
 }
 
+static void set_ack_preamble(struct adapter *adapter, bool short_preamble)
+{
+	struct hal_data_8188e *haldata = &adapter->haldata;
+	u8 val8;
+
+	/*  Joseph marked out for Netgear 3500 TKIP channel 7 issue.(Temporarily) */
+	val8 = haldata->nCur40MhzPrimeSC << 5;
+	if (short_preamble)
+		val8 |= 0x80;
+
+	rtw_write8(adapter, REG_RRSR + 2, val8);
+};
+
 void update_capinfo(struct adapter *Adapter, u16 updateCap)
 {
 	struct mlme_ext_priv	*pmlmeext = &Adapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
-	bool		ShortPreamble;
 
 	/*  Check preamble mode, 2005.01.06, by rcnjko. */
 	/*  Mark to update preamble value forever, 2008.03.18 by lanhsin */
 
 	if (updateCap & cShortPreamble) { /*  Short Preamble */
 		if (pmlmeinfo->preamble_mode != PREAMBLE_SHORT) { /*  PREAMBLE_LONG or PREAMBLE_AUTO */
-			ShortPreamble = true;
 			pmlmeinfo->preamble_mode = PREAMBLE_SHORT;
-			SetHwReg8188EU(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
+			set_ack_preamble(Adapter, true);
 		}
 	} else { /*  Long Preamble */
 		if (pmlmeinfo->preamble_mode != PREAMBLE_LONG) {  /*  PREAMBLE_SHORT or PREAMBLE_AUTO */
-			ShortPreamble = false;
 			pmlmeinfo->preamble_mode = PREAMBLE_LONG;
-			SetHwReg8188EU(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
+			set_ack_preamble(Adapter, false);
 		}
 	}
 
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index cf34645b3de5..9326a6080819 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1094,18 +1094,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_ACK_PREAMBLE:
-		{
-			u8 regTmp;
-			u8 bShortPreamble = *((bool *)val);
-			/*  Joseph marked out for Netgear 3500 TKIP channel 7 issue.(Temporarily) */
-			regTmp = (haldata->nCur40MhzPrimeSC) << 5;
-			if (bShortPreamble)
-				regTmp |= 0x80;
-
-			rtw_write8(Adapter, REG_RRSR + 2, regTmp);
-		}
-		break;
 	case HW_VAR_DM_FLAG:
 		podmpriv->SupportAbility = *((u8 *)val);
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 591322c20f7d..c2b97fa4e372 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -15,7 +15,6 @@ enum hw_variables {
 	HW_VAR_MLME_SITESURVEY,
 	HW_VAR_MLME_JOIN,
 	HW_VAR_SLOT_TIME,
-	HW_VAR_ACK_PREAMBLE,
 	HW_VAR_DM_FLAG,
 	HW_VAR_DM_FUNC_OP,
 	HW_VAR_DM_FUNC_RESET,
-- 
2.35.1

