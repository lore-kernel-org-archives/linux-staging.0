Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5EA6D0D
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:52 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so1765355wmj.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mMW/UV+YatuUedxwG972OkiivTE7kAq66KgzFf7dIHs=;
        b=T0lV85e8NiDD1ND0CZPpphWkv08k+fhkY16IoNiF+Slw26xLS7TcfgWFXpRRMDRIyI
         iXBt2jwtXcHDyKyi7Ydu/X41GEqA6HQfX2rsF13mOokEpEkwuSLg2dcEf+dIwJZMAxtG
         c1W/pEaRYd25isewqu/H1NcrF0LhUzNL/1X/auB4VB+mpzHDGcCBqLay1HyJoH10puWv
         kbf1fv+QIiYTe6qnO0NGoInH78om3QE9MSp/9C8P2EGopHikeVTimwk4o2t9qVLcFSxW
         oi/iWoNJj3I1RnyuzNcRcTEbBL3LYef6F8V2AhfZQLGvKVyqL419jEhKeGYJTUOb7CCy
         PFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mMW/UV+YatuUedxwG972OkiivTE7kAq66KgzFf7dIHs=;
        b=MWp7RyGfJWYdpF+nkf+Cx7YPleyxamST0BqPHx2OrxIjanUce524FrnNbfZjA3HUn9
         T08InrAoVcWkL493PVW8kXRlPzcRl7kSiNp4YrWdrW88nkUOFLQHURmMB+c7t0VFDK+E
         vr+oeAgOAHjmI6Aoiss9xpq+Q33k8WOx/ot/GKNXuQKr+/GriLN8mR6YSV63RL/gLmI/
         r0xCDd9sOGYggnE50G68FvRqD3MINGvjl4Sxc4N6N6FodCcQBhgtMT491GjTGN11pIlE
         Q5tA7H7FSdEg5UEmaXWkJUbjLgok+RUJkGL4AWmKSCjOQGu378Lv0yYqQyPlh2soL+Wi
         YFpA==
X-Gm-Message-State: AOAM530W0lZDe8Z3QHmBVhwd6J37iGM5/Vy4S9lmeflRm2LFPPwAxAMC
	wwmwFy+Zko7JkX60CB6aN6JvKZ9CXRo=
X-Google-Smtp-Source: ABdhPJw6iUbQPh1peqEuQGxYrCihRGuwdHLFP9estFX6zMZXbJWjfVlacIMkR8wzHx2CpcMWS+W2Pw==
X-Received: by 2002:a1c:2017:: with SMTP id g23mr4189226wmg.126.1616611131197;
        Wed, 24 Mar 2021 11:38:51 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:50 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 15/21] Staging: rtl8723bs: remove enums in ieee80211.h
Date: Wed, 24 Mar 2021 19:38:41 +0100
Message-Id: <20210324183847.5595-16-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/ieee80211.h:

	enum ratr_table_mode
	enum eap_type
	enum ieee80211_state
	enum rtw_ieee80211_back_parties
	enum rtw_ieee80211_vht_actioncode
	enum secondary_ch_offset

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 81 -------------------
 1 file changed, 81 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 8a10bca876b8..2ff409cc7fe2 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -139,19 +139,6 @@ enum rateid_idx {
 	RATEID_IDX_VHT_1SS = 10,
 };
 
-enum ratr_table_mode {
-	RATR_INX_WIRELESS_NGB = 0,	/*  BGN 40 Mhz 2SS 1SS */
-	RATR_INX_WIRELESS_NG = 1,		/*  GN or N */
-	RATR_INX_WIRELESS_NB = 2,		/*  BGN 20 Mhz 2SS 1SS  or BN */
-	RATR_INX_WIRELESS_N = 3,
-	RATR_INX_WIRELESS_GB = 4,
-	RATR_INX_WIRELESS_G = 5,
-	RATR_INX_WIRELESS_B = 6,
-	RATR_INX_WIRELESS_MC = 7,
-	RATR_INX_WIRELESS_AC_N = 8,
-};
-
-
 enum network_type {
 	WIRELESS_INVALID = 0,
 	/* Sub-Element */
@@ -274,14 +261,6 @@ struct eapol {
 	u16 length;
 } __attribute__ ((packed));
 
-enum eap_type {
-	EAP_PACKET = 0,
-	EAPOL_START,
-	EAPOL_LOGOFF,
-	EAPOL_KEY,
-	EAPOL_ENCAP_ASF_ALERT
-};
-
 #define IEEE80211_FCS_LEN    4
 
 #define MIN_FRAG_THRESHOLD     256U
@@ -615,45 +594,6 @@ Total: 28-2340 bytes
 > 0: TID
 */
 
-enum ieee80211_state {
-
-	/* the card is not linked at all */
-	IEEE80211_NOLINK = 0,
-
-	/* IEEE80211_ASSOCIATING* are for BSS client mode
-	 * the driver shall not perform RX filtering unless
-	 * the state is LINKED.
-	 * The driver shall just check for the state LINKED and
-	 * defaults to NOLINK for ALL the other states (including
-	 * LINKED_SCANNING)
-	 */
-
-	/* the association procedure will start (wq scheduling)*/
-	IEEE80211_ASSOCIATING,
-	IEEE80211_ASSOCIATING_RETRY,
-
-	/* the association procedure is sending AUTH request*/
-	IEEE80211_ASSOCIATING_AUTHENTICATING,
-
-	/* the association procedure has successfully authentcated
-	 * and is sending association request
-	 */
-	IEEE80211_ASSOCIATING_AUTHENTICATED,
-
-	/* the link is ok. the card associated to a BSS or linked
-	 * to a ibss cell or acting as an AP and creating the bss
-	 */
-	IEEE80211_LINKED,
-
-	/* same as LINKED, but the driver shall apply RX filter
-	 * rules as we are in NO_LINK mode. As the card is still
-	 * logically linked, but it is doing a syncro site survey
-	 * then it will be back to LINKED state.
-	 */
-	IEEE80211_LINKED_SCANNING,
-
-};
-
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
 #define MAC_ARG(x) (x)
@@ -725,21 +665,6 @@ enum _public_action {
 	ACT_PUBLIC_MAX
 };
 
-/* BACK (block-ack) parties */
-enum rtw_ieee80211_back_parties {
-	RTW_WLAN_BACK_RECIPIENT = 0,
-	RTW_WLAN_BACK_INITIATOR = 1,
-	RTW_WLAN_BACK_TIMER = 2,
-};
-
-/* VHT features action code */
-enum rtw_ieee80211_vht_actioncode {
-	RTW_WLAN_ACTION_VHT_COMPRESSED_BEAMFORMING = 0,
-       RTW_WLAN_ACTION_VHT_GROUPID_MANAGEMENT = 1,
-       RTW_WLAN_ACTION_VHT_OPMODE_NOTIFICATION = 2,
-};
-
-
 #define OUI_MICROSOFT 0x0050f2 /* Microsoft (also used in Wi-Fi specs)
 				* 00:50:F2 */
 #define WME_OUI_TYPE 2
@@ -898,12 +823,6 @@ enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uint len,
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source, unsigned int *frlen);
 u8 *rtw_set_ie(u8 *pbuf, signed int index, uint len, u8 *source, uint *frlen);
 
-enum secondary_ch_offset {
-	SCN = 0, /* no secondary channel */
-	SCA = 1, /* secondary channel above */
-	SCB = 3,  /* secondary channel below */
-};
-
 u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit);
 u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, uint *ielen);
 int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 oui_len);
-- 
2.30.2

