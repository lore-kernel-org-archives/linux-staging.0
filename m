Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B35F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:26 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id 61so16800558wrm.12
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zuuTtZWLDjYUgVayZF8/B4FNWpT3JgVryKZ1z5qp+m8=;
        b=nw7rsLpVDcpVZiMWK4lAFwaAwXp2pM6RYTuh+7gc+OQkJVXHE3JhxMmBLCMmsbP6zK
         S9WsRcvWA8MVKD1W3HKcJ6ouJE6xpwjcRk0HQlIelvgMUsgVpPRITZ+K8JcfcI56XUx8
         61qoTetmQ+kALHKNtVALjW5eSMthkMF+39NlVRBUms/1HxHgf6WSD81W3po3+ghVYxTa
         Gu78hq9GfnTAhS8qn9jbHYqWcUK4FNPv42qjK4o6c0lzRguuxKQouKi1thn0zRZVLKtW
         WOzSa3A51m+L4Ed4UkhAeIUESoIXEQ2AWkj/PQFR/dI++OB4GUuAHe7+LOJw2QluV3qS
         MU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zuuTtZWLDjYUgVayZF8/B4FNWpT3JgVryKZ1z5qp+m8=;
        b=AEt3uOhkBgyryminKRDsjVGvzIch9PGxyTmFpshA+0mlayT3OmelXPX6sOWChWsxyj
         WLrLoWTjlenvIvN4zK7o0vhP5ER/0micvBFTLFoigs7exZnCUescKkAxrVNBNIWXfdyC
         202aAo6VJ099ng0pXn7wj/dsRKGa855LliZDunA3X80iwNX63BNZRpx9fj2LZ3h1rh0D
         dwDUs3V7ewks9dukv3v2kCF0RLCa5IJgAX+AWWvRQtA5UH4RZi1RWBKUFRdvZgwDMpkC
         d23k+1MKgMtHAHq8MxVh+ES01wie5y1XnM6ZR17bJ/UfQSC0hno0DiDRJuLTB1d7G8r+
         mkLw==
X-Gm-Message-State: AOAM533GYPfzGsU0rJs3WvgyCHeB4ZUEP9ExnodXwUn5PRjP6bCwFX81
	ciLtonLbs/vfpQojL6+T83Kqhi4uEec=
X-Google-Smtp-Source: ABdhPJzUUObT60hjWG+zPRK50tJtzIMHN+CprU+ahH7+DCzkvVDHfvbRMA3O7kWKA6YjrgJutFevdQ==
X-Received: by 2002:a1c:a98a:: with SMTP id s132mr16667183wme.12.1616420245383;
        Mon, 22 Mar 2021 06:37:25 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:25 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 17/19] Staging: rtl8723bs: remove useless structs in ieee80211.h
Date: Mon, 22 Mar 2021 14:37:15 +0100
Message-Id: <20210322133717.17797-18-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct's in include/ieee80211.h:

	struct ieee_ibss_seq
	struct ieee80211_rx_stats
	struct ieee80211_frag_entry
	struct ieee80211_stats
	struct ieee80211_softmac_stats
	struct ieee80211_security
	struct ieee80211_header_data

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 94 -------------------
 1 file changed, 94 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index a7cbd04059f8..8a10bca876b8 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -266,14 +266,6 @@ struct sta_data {
 /* this is stolen from ipw2200 driver */
 #define IEEE_IBSS_MAC_HASH_SIZE 31
 
-struct ieee_ibss_seq {
-	u8 mac[ETH_ALEN];
-	u16 seq_num;
-	u16 frag_num;
-	unsigned long packet_time;
-	struct list_head	list;
-};
-
 struct eapol {
 	u8 snap[6];
 	u16 ethertype;
@@ -521,16 +513,6 @@ enum mgn_rate {
 /* NOTE: This data is for statistical purposes; not all hardware provides this
  *       information for frames received.  Not setting these will not cause
  *       any adverse affects. */
-struct ieee80211_rx_stats {
-	s8 rssi;
-	u8 signal;
-	u8 noise;
-	u8 received_channel;
-	u16 rate; /* in 100 kbps */
-	u8 mask;
-	u8 freq;
-	u16 len;
-};
 
 /* IEEE 802.11 requires that STA supports concurrent reception of at least
  * three fragmented frames. This define can be increased to support more
@@ -538,61 +520,6 @@ struct ieee80211_rx_stats {
  * 2 kB of RAM and increasing cache size will slow down frame reassembly. */
 #define IEEE80211_FRAG_CACHE_LEN 4
 
-struct ieee80211_frag_entry {
-	u32 first_frag_time;
-	uint seq;
-	uint last_frag;
-	uint qos;   /* jackson */
-	uint tid;	/* jackson */
-	struct sk_buff *skb;
-	u8 src_addr[ETH_ALEN];
-	u8 dst_addr[ETH_ALEN];
-};
-
-struct ieee80211_stats {
-	uint tx_unicast_frames;
-	uint tx_multicast_frames;
-	uint tx_fragments;
-	uint tx_unicast_octets;
-	uint tx_multicast_octets;
-	uint tx_deferred_transmissions;
-	uint tx_single_retry_frames;
-	uint tx_multiple_retry_frames;
-	uint tx_retry_limit_exceeded;
-	uint tx_discards;
-	uint rx_unicast_frames;
-	uint rx_multicast_frames;
-	uint rx_fragments;
-	uint rx_unicast_octets;
-	uint rx_multicast_octets;
-	uint rx_fcs_errors;
-	uint rx_discards_no_buffer;
-	uint tx_discards_wrong_sa;
-	uint rx_discards_undecryptable;
-	uint rx_message_in_msg_fragments;
-	uint rx_message_in_bad_msg_fragments;
-};
-
-struct ieee80211_softmac_stats {
-	uint rx_ass_ok;
-	uint rx_ass_err;
-	uint rx_probe_rq;
-	uint tx_probe_rs;
-	uint tx_beacons;
-	uint rx_auth_rq;
-	uint rx_auth_rs_ok;
-	uint rx_auth_rs_err;
-	uint tx_auth_rq;
-	uint no_auth_rs;
-	uint no_ass_rs;
-	uint tx_ass_rq;
-	uint rx_ass_rq;
-	uint tx_probe_rq;
-	uint reassoc;
-	uint swtxstop;
-	uint swtxawake;
-};
-
 #define SEC_KEY_1         (1<<0)
 #define SEC_KEY_2         (1<<1)
 #define SEC_KEY_3         (1<<2)
@@ -615,18 +542,6 @@ struct ieee80211_softmac_stats {
 #define BIP_MAX_KEYID 5
 #define BIP_AAD_SIZE  20
 
-struct ieee80211_security {
-	u16 active_key:2,
-            enabled:1,
-	    auth_mode:2,
-            auth_algo:4,
-            unicast_uses_group:1;
-	u8 key_sizes[WEP_KEYS];
-	u8 keys[WEP_KEYS][WEP_KEY_LEN];
-	u8 level;
-	u16 flags;
-} __attribute__ ((packed));
-
 /*
 
  802.11 data frame from AP
@@ -642,15 +557,6 @@ Total: 28-2340 bytes
 
 */
 
-struct ieee80211_header_data {
-	u16 frame_ctl;
-	u16 duration_id;
-	u8 addr1[6];
-	u8 addr2[6];
-	u8 addr3[6];
-	u16 seq_ctrl;
-};
-
 #define BEACON_PROBE_SSID_ID_POSITION 12
 
 /* Management Frame Information Element Types */
-- 
2.30.2

