Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F08970
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:10 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id x16so24301586wrn.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+vvBZkvuG1Jidiujb+2QqiKxdiWq12CWPsL08zKz4v0=;
        b=Ba3Q0wD6unb3irb4m8vnPMWq1w/jCk83kkbOuvEDhAnh5WV/739B8yQp56mg52Gj29
         mchWtrA6Ja0R3654qrGYDCE4MU+rTXb//FrPZne+Pg376Ovt8JBRV+SPohKqAwtG2JoD
         j0hC0iClT7tR2LFa3DLNpsiPtCvqpwTtlIK0waOyTG+hBf1Dw2NOb6oDwM3hzvnRSDlQ
         bmiuXGvcIblIQhWSNjE9/MTZrr0zV2KU1Qm8h7gLiL4ga+042JmWtmD9CoZViRJ9tbgS
         ATjEu16wKcgVeLvSY8iWIynqgChxSpuHJ4gSTvYlz33UK0NHSIv7TXc0fWnNHTKU6NsS
         WQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vvBZkvuG1Jidiujb+2QqiKxdiWq12CWPsL08zKz4v0=;
        b=ueSGcTwg7yz9YF9p9I93X5MnW+4+7RrXwR68vCl1h7nVC7QQBpHBg6dPu46qK5TE48
         0hEVfzDQn1n8r9eSyjhp5eF2rVWJJhtQjXZxQ4nAqI6GMwMy1yZH0sCgUpVzlVKzh9vO
         iaj9RfTUQhLzbqI15xoaqXy0qTfBqFRjM5T1JQlkk2t/HwUT3HpKIOofB8qWxIMeQ9Pf
         0TNhBGs6OAA1WODGN8whwYqtf3bCiYBBcBVf0zWsjo+iSiFRu0vRp6yjM46g05ytaWNW
         tipFtYEKpWpVCGKxb7kH/93NraWf0HtsieKB3aGoZi8KNXwTb7r+dY6ErbBiLl1mCVfr
         W5EQ==
X-Gm-Message-State: AOAM530HoHjZmCkMANByP43YMJLiQtiB9hHGCP/iGrX38+KVdjInRv+a
	d+SqW350OzWAVsJCV2bIEdRXWNif25o=
X-Google-Smtp-Source: ABdhPJxk2YgmGiN8PU7zQe0ywfUgksLMhRqksu4ZeJFBMVUU0ih+lMy2jux+D0Y0DmNmN4CBzovrwg==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr3265710wrt.133.1616589908846;
        Wed, 24 Mar 2021 05:45:08 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:08 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 24/33] Staging: rtl8723bs: remove named enums in ieee80211.h
Date: Wed, 24 Mar 2021 13:44:47 +0100
Message-Id: <20210324124456.25221-25-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
include/ieee80211.h:

	enum rateid_idx				[name]
	enum ratr_table_mode			[definition]
	enum eap_type				[definition]
	enum mgn_rate				[name]
	enum ieee80211_state			[definition]
	enum rtw_ieee80211_category		[name]
	enum _public_action			[name]
	enum rtw_ieee80211_back_parties		[definition]
	enum rtw_ieee80211_vht_actioncode	[definition]
	enum secondary_ch_offset		[definition]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 89 +------------------
 1 file changed, 4 insertions(+), 85 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 8a10bca876b8..6540c7a22938 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -125,7 +125,7 @@ extern u8 RSN_CIPHER_SUITE_CCMP[];
 extern u8 RSN_CIPHER_SUITE_WEP104[];
 
 
-enum rateid_idx {
+enum {
 	RATEID_IDX_BGN_40M_2SS = 0,
 	RATEID_IDX_BGN_40M_1SS = 1,
 	RATEID_IDX_BGN_20M_2SS_BN = 2,
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
@@ -415,7 +394,7 @@ struct ieee80211_snap_hdr {
 #define IEEE80211_OFDM_SHIFT_MASK_A         4
 
 
-enum mgn_rate {
+enum {
 	MGN_1M		= 0x02,
 	MGN_2M		= 0x04,
 	MGN_5_5M	= 0x0B,
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
@@ -687,7 +627,7 @@ static inline int is_zero_mac_addr(const u8 *addr)
 #define IEEE_MODE_MASK    (IEEE_A|IEEE_B|IEEE_G)
 
 /* Action category code */
-enum rtw_ieee80211_category {
+enum {
 	RTW_WLAN_CATEGORY_SPECTRUM_MGMT = 0,
 	RTW_WLAN_CATEGORY_QOS = 1,
 	RTW_WLAN_CATEGORY_DLS = 2,
@@ -705,7 +645,7 @@ enum rtw_ieee80211_category {
 	RTW_WLAN_CATEGORY_P2P = 0x7f,/* P2P action frames */
 };
 
-enum _public_action {
+enum {
 	ACT_PUBLIC_BSSCOEXIST = 0, /*  20/40 BSS Coexistence */
 	ACT_PUBLIC_DSE_ENABLE = 1,
 	ACT_PUBLIC_DSE_DEENABLE = 2,
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

