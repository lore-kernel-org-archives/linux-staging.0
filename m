Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB6E7E0
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 23:00:58 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so27000046pjp.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 16:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680303657;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2mmMqFiAumzcpbbntPymlIf8Np9wiownjUZMtsJues=;
        b=Gf+pDUGM0BbEJ6NakQ2q0wy2cvDiJHEgSyfeWbWMUKRQCsK9uE/giv9fduE1LMyq8I
         9YATutxzd5ejWpOrABBqe87S3QZelq2baM11SXb4u54+iHpdVjLiNyVP9Lgsjni9EgNx
         FBI7pgBHk1ggfbBWDnlNXtb49wR1fj38ovCENgk1ObS/39rWgf6DJET/ibaEP3wvhdTz
         mMCx/gUCb70qmzfoVmO/sKO3/3zBLsT/Zglz0Z5WTp70gt7qogjxs6nuhMEy6RPqHuAG
         +ZF11wPtBaXIkjOBREHplrk9PLS50LGLrnAyfR/UddJPDhUwL98YGqnOdQs+FeMPIP09
         fvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680303657;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2mmMqFiAumzcpbbntPymlIf8Np9wiownjUZMtsJues=;
        b=EbOJnZaMKc3OObyoWn5LbpqM9dvXKQRYymlDR6irrkRSf/DbiqZxiW1uoMdquDQXDj
         S5MkWyOVJzMHwTOa0tnPP+H8HSaIRjOQBiHoohns144pMiq6/eVhlO7AnAaze1k/G2ok
         ZbdiSklaiHX5DMx8dPUScvVfJG1bpAAeyaroYyQLmAdVpnMLw0ybiqRxfqb+O3JE1MiH
         5Tp1dXNwg7qQPjiUX5c1sufKqxbYuz88E4ffm+ve9Cm75OAVhOsTT0AWJUU5MKiE7TKk
         QhzsVxv464F36rzPGP0w7nf6w0kx8DBbnXV7PalmBtGlNYhwY0peUQVFq+ss5s45P0ZS
         Q+YQ==
X-Gm-Message-State: AAQBX9eXCzOByUtTux0VK+kn1nHMF6KRBdYp4YRXfeF+5PiumL23Q9tR
	jnlKmUTuTgRHPz4biLlH8FM=
X-Google-Smtp-Source: AKy350bd8XnjczUSt5srF8tRLRsoHz3erZ4xCviClGGawdNEt0UtnGoZcmno2M2f/VtXRuQYJBc6bw==
X-Received: by 2002:a17:902:e74e:b0:19d:1674:c04d with SMTP id p14-20020a170902e74e00b0019d1674c04dmr32945454plf.61.1680303657395;
        Fri, 31 Mar 2023 16:00:57 -0700 (PDT)
Received: from trent-reznor (c-67-169-174-96.hsd1.ca.comcast.net. [67.169.174.96])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902768800b001a1a9a639c2sm2044288pll.134.2023.03.31.16.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 16:00:56 -0700 (PDT)
Date: Fri, 31 Mar 2023 16:00:24 -0700
From: Daniel Watson <ozzloy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: indent with tab, align with space
Message-ID: <ZCdmCBIdabBGqm11@trent-reznor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use tabs to indent code and spaces to align in order to make the code
consistent and easier to read.

Signed-off-by: Daniel Watson <ozzloy@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 49 ++++++++++---------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9041d8dc5fb1d..1098b02092003 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -174,7 +174,7 @@ struct ieee_param {
 			u8 reserved[32];
 			u8 data[];
 		} wpa_ie;
-	        struct{
+		struct{
 			int command;
 			int reason_code;
 		} mlme;
@@ -271,10 +271,10 @@ struct eapol {
 #define P80211_OUI_LEN 3
 
 struct ieee80211_snap_hdr {
-        u8    dsap;   /* always 0xAA */
-        u8    ssap;   /* always 0xAA */
-        u8    ctrl;   /* always 0x03 */
-        u8    oui[P80211_OUI_LEN];    /* organizational universal id */
+	u8    dsap;   /* always 0xAA */
+	u8    ssap;   /* always 0xAA */
+	u8    ctrl;   /* always 0x03 */
+	u8    oui[P80211_OUI_LEN];    /* organizational universal id */
 } __attribute__ ((packed));
 
 #define SNAP_SIZE sizeof(struct ieee80211_snap_hdr)
@@ -342,12 +342,13 @@ struct ieee80211_snap_hdr {
 #define IEEE80211_OFDM_RATE_48MB_MASK		(1<<10)
 #define IEEE80211_OFDM_RATE_54MB_MASK		(1<<11)
 
-#define IEEE80211_CCK_RATES_MASK	        0x0000000F
+#define IEEE80211_CCK_RATES_MASK		0x0000000F
 #define IEEE80211_CCK_BASIC_RATES_MASK	(IEEE80211_CCK_RATE_1MB_MASK | \
 	IEEE80211_CCK_RATE_2MB_MASK)
-#define IEEE80211_CCK_DEFAULT_RATES_MASK	(IEEE80211_CCK_BASIC_RATES_MASK | \
-        IEEE80211_CCK_RATE_5MB_MASK | \
-        IEEE80211_CCK_RATE_11MB_MASK)
+#define IEEE80211_CCK_DEFAULT_RATES_MASK	\
+	(IEEE80211_CCK_BASIC_RATES_MASK |	\
+	 IEEE80211_CCK_RATE_5MB_MASK |		\
+	 IEEE80211_CCK_RATE_11MB_MASK)
 
 #define IEEE80211_OFDM_RATES_MASK		0x00000FF0
 #define IEEE80211_OFDM_BASIC_RATES_MASK	(IEEE80211_OFDM_RATE_6MB_MASK | \
@@ -359,8 +360,9 @@ struct ieee80211_snap_hdr {
 	IEEE80211_OFDM_RATE_36MB_MASK | \
 	IEEE80211_OFDM_RATE_48MB_MASK | \
 	IEEE80211_OFDM_RATE_54MB_MASK)
-#define IEEE80211_DEFAULT_RATES_MASK (IEEE80211_OFDM_DEFAULT_RATES_MASK | \
-                                IEEE80211_CCK_DEFAULT_RATES_MASK)
+#define IEEE80211_DEFAULT_RATES_MASK		\
+	(IEEE80211_OFDM_DEFAULT_RATES_MASK |	\
+	 IEEE80211_CCK_DEFAULT_RATES_MASK)
 
 #define IEEE80211_NUM_OFDM_RATES	    8
 #define IEEE80211_NUM_CCK_RATES	            4
@@ -509,7 +511,7 @@ Total: 28-2340 bytes
 
 static inline int is_multicast_mac_addr(const u8 *addr)
 {
-        return ((addr[0] != 0xff) && (0x01 & addr[0]));
+	return ((addr[0] != 0xff) && (0x01 & addr[0]));
 }
 
 static inline int is_broadcast_mac_addr(const u8 *addr)
@@ -612,17 +614,18 @@ enum {
  * @RTW_IEEE80211_CHAN_NO_HT40MINUS: extension channel below this channel
  *      is not permitted.
  */
-  enum rtw_ieee80211_channel_flags {
-          RTW_IEEE80211_CHAN_DISABLED         = 1<<0,
-          RTW_IEEE80211_CHAN_PASSIVE_SCAN     = 1<<1,
-          RTW_IEEE80211_CHAN_NO_IBSS          = 1<<2,
-          RTW_IEEE80211_CHAN_RADAR            = 1<<3,
-          RTW_IEEE80211_CHAN_NO_HT40PLUS      = 1<<4,
-          RTW_IEEE80211_CHAN_NO_HT40MINUS     = 1<<5,
-  };
-
-  #define RTW_IEEE80211_CHAN_NO_HT40 \
-          (RTW_IEEE80211_CHAN_NO_HT40PLUS | RTW_IEEE80211_CHAN_NO_HT40MINUS)
+enum rtw_ieee80211_channel_flags {
+	RTW_IEEE80211_CHAN_DISABLED         = 1<<0,
+	RTW_IEEE80211_CHAN_PASSIVE_SCAN     = 1<<1,
+	RTW_IEEE80211_CHAN_NO_IBSS          = 1<<2,
+	RTW_IEEE80211_CHAN_RADAR            = 1<<3,
+	RTW_IEEE80211_CHAN_NO_HT40PLUS      = 1<<4,
+	RTW_IEEE80211_CHAN_NO_HT40MINUS     = 1<<5,
+};
+
+#define RTW_IEEE80211_CHAN_NO_HT40	  \
+	(RTW_IEEE80211_CHAN_NO_HT40PLUS | \
+	 RTW_IEEE80211_CHAN_NO_HT40MINUS)
 
 /* Represent channel details, subset of ieee80211_channel */
 struct rtw_ieee80211_channel {
-- 
2.34.1

