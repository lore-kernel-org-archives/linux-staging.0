Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024712CA6
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 11:54:58 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id j2so9306475edj.8
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 03:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QHoOBbSAYAJOf9zU9cCvl7+FUKLExruc9/8HNa4NGeA=;
        b=bvvI2DogVfkcbhZuNLt/C/5P+bDasd5InizdUYO6DShjSqJExOgJTjhNMtQ7pr13iU
         LfxsVYL8xSkEDenRWCBWFrzt3ubKpnm6GuG3FzazLuOfC1YLOe9CX5prE+rYfeeO/KrS
         LFcSZn5/DcxSj2itCB8QEeUXLBWBkc1yzXWJXHeq8ddRIPKsLSEtqL5drfjZtcAE/Aft
         viANeMgj703RuuRIOvHLdCdqw6YrHf7PtakFKbTTG916UH49AefszhX3vbjTOgjceqcL
         7g4zj1BhZmjImIhll7Sgv30xkGb9zsEfOAb2866gBXR5WDdpHNo39IgMjLqLeugd43tw
         yjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QHoOBbSAYAJOf9zU9cCvl7+FUKLExruc9/8HNa4NGeA=;
        b=54ZcedkJlKvh0n1HAlbP0wZcXqFBx5iyE4E0gC+kReuTD1uUfJa0GV5wYMu/dQ47Gm
         wdcPf0QYFKMjDwMNNaF9oOSHjuCMHRKBPvjiyKMezjYHGuRAUiy/W+wayoO5fRzyxE+F
         hXTdmy5An7ktmDMxch91wxvbLYiHDHqSMovcO3erBsEpvWFWxCq0AoRAcMV/hCEBkISr
         wTrmz3NfItCveaP6opz+GxjHXlp/CnoGd62W4YO4qybU97DCEQD42Rsd+4D844vwytRm
         ERmQLSLO2vDmNUg1jejlDALgGqShpFL0ZhG7w9UtV2WRBg1COdDaZa1jt48yswYa5SOi
         Kjig==
X-Gm-Message-State: AOAM532UBOE7P22tFHunM9mrGwywl0RJy8X/BicMTjuCvXIzHzEDx2oT
	NyKwMWEX6xg7w6MVp00gA+Y=
X-Google-Smtp-Source: ABdhPJwsICRuyeoqKlVG10VZYzQudan9E0O8nNteZoJUxcNwIh/z6+3R+QeHENqE+5037PYbz5dztA==
X-Received: by 2002:a05:6402:1d4c:: with SMTP id dz12mr4906720edb.385.1643370896422;
        Fri, 28 Jan 2022 03:54:56 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9e.dynamic.kabel-deutschland.de. [95.90.187.158])
        by smtp.gmail.com with ESMTPSA id h20sm12494261eds.9.2022.01.28.03.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 03:54:56 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/6] staging: r8188eu: max_rx_ampdu_factor is always MAX_AMPDU_FACTOR_64K
Date: Fri, 28 Jan 2022 12:54:42 +0100
Message-Id: <20220128115445.6606-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128115445.6606-1-straube.linux@gmail.com>
References: <20220128115445.6606-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable max_rx_ampdu_factor in rtw_restructure_ht_ie() and
issue_action_BA() is always set to MAX_AMPDU_FACTOR_64K. Remove the
variable from both functions and use MAX_AMPDU_FACTOR_64K directly.

The case HW_VAR_MAX_RX_AMPDU_FACTOR in GetHalDefVar8188EUsb() is now
unused and can be removed.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c     |  4 +---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 20 +-------------------
 drivers/staging/r8188eu/hal/usb_halinit.c   |  3 ---
 drivers/staging/r8188eu/include/hal_intf.h  |  1 -
 drivers/staging/r8188eu/include/wifi.h      |  7 +------
 5 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 094885c80a1a..038bddc361c3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1894,7 +1894,6 @@ void rtw_joinbss_reset(struct adapter *padapter)
 unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len)
 {
 	u32 ielen, out_len;
-	enum ht_cap_ampdu_factor max_rx_ampdu_factor;
 	unsigned char *p;
 	struct ieee80211_ht_cap ht_capie;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
@@ -1930,8 +1929,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		AMPDU_para [4:2]:Min MPDU Start Spacing
 		*/
 
-		GetHalDefVar8188EUsb(padapter, HW_VAR_MAX_RX_AMPDU_FACTOR, &max_rx_ampdu_factor);
-		ht_capie.ampdu_params_info = (max_rx_ampdu_factor & 0x03);
+		ht_capie.ampdu_params_info = (MAX_AMPDU_FACTOR_64K & 0x03);
 
 		if (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
 			ht_capie.ampdu_params_info |= (IEEE80211_HT_AMPDU_PARM_DENSITY & (0x07 << 2));
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index aa5ed6ecc432..d60882983086 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5747,7 +5747,6 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	u16 BA_timeout_value;
 	__le16	le_tmp;
 	u16 BA_starting_seqctrl = 0;
-	enum ht_cap_ampdu_factor max_rx_ampdu_factor;
 	struct xmit_frame *pmgntframe;
 	struct pkt_attrib *pattrib;
 	u8 *pframe;
@@ -5830,24 +5829,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			pframe = rtw_set_fixed_ie(pframe, 1, &pmlmeinfo->ADDBA_req.dialog_token, &pattrib->pktlen);
 			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&status, &pattrib->pktlen);
 			BA_para_set = le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f;
-			GetHalDefVar8188EUsb(padapter, HW_VAR_MAX_RX_AMPDU_FACTOR, &max_rx_ampdu_factor);
-			switch (max_rx_ampdu_factor) {
-			case MAX_AMPDU_FACTOR_64K:
-				BA_para_set |= 0x1000; /* 64 buffer size */
-				break;
-			case MAX_AMPDU_FACTOR_32K:
-				BA_para_set |= 0x0800; /* 32 buffer size */
-				break;
-			case MAX_AMPDU_FACTOR_16K:
-				BA_para_set |= 0x0400; /* 16 buffer size */
-				break;
-			case MAX_AMPDU_FACTOR_8K:
-				BA_para_set |= 0x0200; /* 8 buffer size */
-				break;
-			default:
-				BA_para_set |= 0x1000; /* 64 buffer size */
-				break;
-			}
+			BA_para_set |= 0x1000; /* 64 buffer size */
 
 			if (pregpriv->ampdu_amsdu == 0)/* disabled */
 				BA_para_set = BA_para_set & ~BIT(0);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 4bb1812f5ae7..87382806774b 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1625,9 +1625,6 @@ u8 GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)pValue) = haldata->odmpriv.SupportAbility;
 		break;
-	case HW_VAR_MAX_RX_AMPDU_FACTOR:
-		*((u32 *)pValue) = MAX_AMPDU_FACTOR_64K;
-		break;
 	case HW_DEF_RA_INFO_DUMP:
 		{
 			u8 entry_id = *((u8 *)pValue);
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 231badaa9cce..f382b7fefb4a 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -77,7 +77,6 @@ enum hal_def_variable {
 	HAL_DEF_CURRENT_ANTENNA,
 	HAL_DEF_DBG_DUMP_RXPKT,/* for dbg */
 	HAL_DEF_DBG_DM_FUNC,/* for dbg */
-	HW_VAR_MAX_RX_AMPDU_FACTOR,
 	HW_DEF_RA_INFO_DUMP,
 	HAL_DEF_DBG_DUMP_TXPKT,
 };
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 0b0bd39a257f..e7083d721dae 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -569,12 +569,7 @@ struct ADDBA_request {
 	__le16	BA_starting_seqctrl;
 } __packed;
 
-enum ht_cap_ampdu_factor {
-	MAX_AMPDU_FACTOR_8K	= 0,
-	MAX_AMPDU_FACTOR_16K	= 1,
-	MAX_AMPDU_FACTOR_32K	= 2,
-	MAX_AMPDU_FACTOR_64K	= 3,
-};
+#define MAX_AMPDU_FACTOR_64K	3
 
 /* Spatial Multiplexing Power Save Modes */
 #define WLAN_HT_CAP_SM_PS_STATIC	0
-- 
2.34.1

