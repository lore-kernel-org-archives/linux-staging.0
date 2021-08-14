Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EC82FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 16:56:11 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q10so17608401wro.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CuFF1XRj1ccxohvvCGWKXvne2UStQOkNmnbqQ6AQ8dw=;
        b=oW9QzXZbnPxcZ5wN2iedQALHl7Su4nJLXiSXARLOiOV7Uj0g981iA2gsfX2YfstyPC
         jnTTnsOXccgo3gSTdE/8EuO5WxQAwrnzLVFk0slX5hXpESimtF6cMK8Zkw71TT4EbRH2
         Rn6l+FlT33SjxAvOyoyJP8aURIDTL3dHGxsrcGq6HnRtnZYscw2mqralplErbO+tb5xc
         /zWYPSIgE4oR5VT5mVAMkJIw9znrmihj7um5R3gGGIeUzIlnOHOrR/ZBwgMI3psPUGoN
         iqkU2weaCGZM27GjHoV+e45jPj7+h1eO3GFswjSevqui8hboK43/ExCpWunEe3hO3HOm
         tYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CuFF1XRj1ccxohvvCGWKXvne2UStQOkNmnbqQ6AQ8dw=;
        b=iKkeVweTbyB3PaU4GPDMMn6WVM4wAa2le8LYGeFt6+G6lwiQd/g9y3pD67CIg2GFbu
         CYf7FCaKrlnZBZLNJWHsmxmJVlvP940TwqFPx8fSrLoz3RUGvr44PfUCcIyLf/MzvpXO
         Xlh30WfUtZ6EMd/321OR1ZKQNUTw2tBSi1zUz+xFMNp5m+wrrw67+LCaviuidysVBDdy
         GIsYmYHScAYIY4QAEf++gVFAxXnBr2xKDxYiMDJ1F02i12SPb42ckthZ6IP10wtwtj3O
         pw1/QSRPtt+UrOrmyDgD9Q9fT67PsoO96XeCckQPePZPrMwyM3Ggt09LMEebPiXDGJUD
         JwrA==
X-Gm-Message-State: AOAM53216D1Z0PSKYyRx5lrz87KchW8BfYC8pkRY/8F80SHUHG7Hk5n7
	5vxteMEN9rznwMjpITQi/GY=
X-Google-Smtp-Source: ABdhPJyxvOy3yc6BJQwYfWnzwNX62vct+Iln8nBlkCLAQoSU1CyZso9vGDENRSd8qeJh8ufY8ean5A==
X-Received: by 2002:a05:6000:1864:: with SMTP id d4mr9612164wri.250.1628960169850;
        Sat, 14 Aug 2021 09:56:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id w14sm5079229wrt.23.2021.08.14.09.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 09:56:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: use common ieee80211 constants
Date: Sat, 14 Aug 2021 18:55:18 +0200
Message-Id: <20210814165518.8672-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many defined constants in wifi.h are unused and/or available from
<linux/ieee80211.h>, some with slightly different names. Remove
the constants from wifi.h and use the common ones. Rename where
necessary.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c        | 12 ++---
 drivers/staging/r8188eu/core/rtw_mlme.c      |  8 ++--
 drivers/staging/r8188eu/include/wifi.h       | 50 --------------------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  2 +-
 4 files changed, 11 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index bc4c6dbd5aa3..f1b519d20989 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -630,7 +630,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 			phtpriv_sta->sgi = true;
 
 		/*  bwmode */
-		if ((sta_cap_info & ap_cap_info) & IEEE80211_HT_CAP_SUP_WIDTH) {
+		if ((sta_cap_info & ap_cap_info) & IEEE80211_HT_CAP_SUP_WIDTH_20_40) {
 			phtpriv_sta->bwmode = pmlmeext->cur_bwmode;
 			phtpriv_sta->ch_offset = pmlmeext->cur_ch_offset;
 		}
@@ -1015,12 +1015,12 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		if ((psecuritypriv->wpa_pairwise_cipher & WPA_CIPHER_CCMP) ||
 		    (psecuritypriv->wpa2_pairwise_cipher & WPA_CIPHER_CCMP))
-			pht_cap->ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&(0x07<<2));
+			pht_cap->ampdu_params_info |= (IEEE80211_HT_AMPDU_PARM_DENSITY & (0x07 << 2));
 		else
-			pht_cap->ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&0x00);
+			pht_cap->ampdu_params_info |= (IEEE80211_HT_AMPDU_PARM_DENSITY & 0x00);
 
 		/* set  Max Rx AMPDU size  to 64K */
-		pht_cap->ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_FACTOR & 0x03);
+		pht_cap->ampdu_params_info |= (IEEE80211_HT_AMPDU_PARM_FACTOR & 0x03);
 
 		if (rf_type == RF_1T1R) {
 			pht_cap->mcs.rx_mask[0] = 0xff;
@@ -1447,7 +1447,7 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 	    (pmlmepriv->ht_op_mode & HT_INFO_OPERATION_MODE_NON_GF_DEVS_PRESENT))
 		new_op_mode = OP_MODE_MIXED;
 	else if ((le16_to_cpu(phtpriv_ap->ht_cap.cap_info) &
-		  IEEE80211_HT_CAP_SUP_WIDTH) &&
+		  IEEE80211_HT_CAP_SUP_WIDTH_20_40) &&
 		 pmlmepriv->num_sta_ht_20mhz)
 		new_op_mode = OP_MODE_20MHZ_HT_STA_ASSOCED;
 	else if (pmlmepriv->olbc_ht)
@@ -1597,7 +1597,7 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 				   pmlmepriv->num_sta_ht_no_gf);
 		}
 
-		if ((ht_capab & IEEE80211_HT_CAP_SUP_WIDTH) == 0) {
+		if ((ht_capab & IEEE80211_HT_CAP_SUP_WIDTH_20_40) == 0) {
 			if (!psta->ht_20mhz_set) {
 				psta->ht_20mhz_set = 1;
 				pmlmepriv->num_sta_ht_20mhz++;
diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 5088b555f55d..9189f5c845f3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -2001,7 +2001,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 		memset(&ht_capie, 0, sizeof(struct ieee80211_ht_cap));
 
-		ht_capie.cap_info = cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH |
+		ht_capie.cap_info = cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH_20_40 |
 						IEEE80211_HT_CAP_SGI_20 |
 						IEEE80211_HT_CAP_SGI_40 |
 						IEEE80211_HT_CAP_TX_STBC |
@@ -2019,9 +2019,9 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		ht_capie.ampdu_params_info = (max_rx_ampdu_factor&0x03);
 
 		if (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
-			ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&(0x07<<2));
+			ht_capie.ampdu_params_info |= (IEEE80211_HT_AMPDU_PARM_DENSITY & (0x07 << 2));
 		else
-			ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&0x00);
+			ht_capie.ampdu_params_info |= (IEEE80211_HT_AMPDU_PARM_DENSITY & 0x00);
 
 		rtw_set_ie(out_ie+out_len, _HT_CAPABILITY_IE_,
 			   sizeof(struct ieee80211_ht_cap), (unsigned char *)&ht_capie, pout_len);
@@ -2072,7 +2072,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len)
 	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fixed_ie), _HT_CAPABILITY_IE_, &len, ie_len-sizeof(struct ndis_802_11_fixed_ie));
 	if (p && len > 0) {
 		pht_capie = (struct ieee80211_ht_cap *)(p+2);
-		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
+		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_AMPDU_PARM_FACTOR);
 		max_ampdu_sz = 1 << (max_ampdu_sz+3); /*  max_ampdu_sz (kbytes); */
 		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
 	}
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index f4212c4f4ada..0b3fd94cea18 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -597,10 +597,6 @@ struct rtw_ieee80211_bar {
 	__le16 start_seq_num;
 } __packed;
 
-/* 802.11 BAR control masks */
-#define IEEE80211_BAR_CTRL_ACK_POLICY_NORMAL     0x0000
-#define IEEE80211_BAR_CTRL_CBMTID_COMPRESSED_BA  0x0004
-
 /**
  * struct ieee80211_ht_cap - HT additional information
  *
@@ -662,52 +658,6 @@ enum ht_cap_ampdu_factor {
 	MAX_AMPDU_FACTOR_64K	= 3,
 };
 
-/* 802.11n HT capabilities masks */
-#define IEEE80211_HT_CAP_SUP_WIDTH		0x0002
-#define IEEE80211_HT_CAP_SM_PS			0x000C
-#define IEEE80211_HT_CAP_GRN_FLD		0x0010
-#define IEEE80211_HT_CAP_SGI_20			0x0020
-#define IEEE80211_HT_CAP_SGI_40			0x0040
-#define IEEE80211_HT_CAP_TX_STBC		0x0080
-#define IEEE80211_HT_CAP_RX_STBC		0x0300
-#define IEEE80211_HT_CAP_DELAY_BA		0x0400
-#define IEEE80211_HT_CAP_MAX_AMSDU		0x0800
-#define IEEE80211_HT_CAP_DSSSCCK40		0x1000
-/* 802.11n HT capability AMPDU settings */
-#define IEEE80211_HT_CAP_AMPDU_FACTOR		0x03
-#define IEEE80211_HT_CAP_AMPDU_DENSITY		0x1C
-/* 802.11n HT capability MSC set */
-#define IEEE80211_SUPP_MCS_SET_UEQM		4
-#define IEEE80211_HT_CAP_MAX_STREAMS		4
-#define IEEE80211_SUPP_MCS_SET_LEN		10
-/* maximum streams the spec allows */
-#define IEEE80211_HT_CAP_MCS_TX_DEFINED		0x01
-#define IEEE80211_HT_CAP_MCS_TX_RX_DIFF		0x02
-#define IEEE80211_HT_CAP_MCS_TX_STREAMS		0x0C
-#define IEEE80211_HT_CAP_MCS_TX_UEQM		0x10
-/* 802.11n HT IE masks */
-#define IEEE80211_HT_IE_CHA_SEC_OFFSET		0x03
-#define IEEE80211_HT_IE_CHA_SEC_NONE		0x00
-#define IEEE80211_HT_IE_CHA_SEC_ABOVE		0x01
-#define IEEE80211_HT_IE_CHA_SEC_BELOW		0x03
-#define IEEE80211_HT_IE_CHA_WIDTH		0x04
-#define IEEE80211_HT_IE_HT_PROTECTION		0x0003
-#define IEEE80211_HT_IE_NON_GF_STA_PRSNT	0x0004
-#define IEEE80211_HT_IE_NON_HT_STA_PRSNT	0x0010
-
-/* block-ack parameters */
-#define IEEE80211_ADDBA_PARAM_POLICY_MASK 0x0002
-#define IEEE80211_ADDBA_PARAM_TID_MASK 0x003C
-#define RTW_IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK 0xFFC0
-#define IEEE80211_DELBA_PARAM_TID_MASK 0xF000
-#define IEEE80211_DELBA_PARAM_INITIATOR_MASK 0x0800
-
-/*
- * A-PMDU buffer sizes
- * According to IEEE802.11n spec size varies from 8K to 64K (in powers of 2)
- */
-#define IEEE80211_MIN_AMPDU_BUF 0x8
-
 /* Spatial Multiplexing Power Save Modes */
 #define WLAN_HT_CAP_SM_PS_STATIC	0
 #define WLAN_HT_CAP_SM_PS_DYNAMIC	1
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 38ee41f9d2ba..0f82ed1b4469 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -195,7 +195,7 @@ static char *translate_scan(struct adapter *padapter,
 		pht_capie = (struct ieee80211_ht_cap *)(p+2);
 		memcpy(&mcs_rate, pht_capie->mcs.rx_mask, 2);
 		bw_40MHz = (le16_to_cpu(pht_capie->cap_info) &
-			    IEEE80211_HT_CAP_SUP_WIDTH) ? 1 : 0;
+			    IEEE80211_HT_CAP_SUP_WIDTH_20_40) ? 1 : 0;
 		short_GI = (le16_to_cpu(pht_capie->cap_info) &
 			    (IEEE80211_HT_CAP_SGI_20|IEEE80211_HT_CAP_SGI_40)) ? 1 : 0;
 	}
-- 
2.32.0

