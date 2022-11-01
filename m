Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D757C;
	Tue,  1 Nov 2022 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667310643; bh=USjeNcCx3bKCWp1/y/3F0YEXlmi+d+xrsqntzQAAIuE=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=ltyc73j5xfmEKOmB0bE/6N77T+aYVv2O2BJYHvKj/RX8v+rGpa6W2dxcjISjgPIg+
	 rJH7N4/Trn8utK3XHYPqVUcqnyJfRXHHeKfwfERG4yn1bsu1yG3m4HJBweNHuuJQZm
	 H0CdcL3Kx2hOjfd8X2q/YPhE+ELBXk//kB4TnNGo=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Tue,  1 Nov 2022 14:50:43 +0100 (CET)
X-EA-Auth: oXOBPTbXohD6WcpPQ6XB0vpq2jc20zZGMZstWPBGQ1ywl9oI5zOEJoNMBDVYHgNIY9Di6kzuuT9L0+eg/2IoEyioeYgxNjrP
Date: Tue, 1 Nov 2022 19:20:40 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] staging: wlan-ng: Remove unused structure definitions
Message-ID: <74a79ea400ec26624e445692f3353424fb6fc29e.1667308828.git.drv@mailo.com>
References: <cover.1667308828.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667308828.git.drv@mailo.com>

Remove structure definitions that are never used in the code.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Changes in v2:
   1. Patch included in patch set.
   2. The patch changes are compile tested only on X86 arch.


 drivers/staging/wlan-ng/p80211mgmt.h | 232 ---------------------------
 1 file changed, 232 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211mgmt.h b/drivers/staging/wlan-ng/p80211mgmt.h
index da824bc36365..fc23fae5651b 100644
--- a/drivers/staging/wlan-ng/p80211mgmt.h
+++ b/drivers/staging/wlan-ng/p80211mgmt.h
@@ -217,236 +217,4 @@
 #define WLAN_SET_MGMT_CAP_INFO_PBCC(n)		((n) << 6)
 #define WLAN_SET_MGMT_CAP_INFO_AGILITY(n)	((n) << 7)

-/*-- Information Element Types --------------------*/
-/* prototype structure, all IEs start with these members */
-
-struct wlan_ie {
-	u8 eid;
-	u8 len;
-} __packed;
-
-/*-- FH Parameter Set  ----------------------------*/
-struct wlan_ie_fh_parms {
-	u8 eid;
-	u8 len;
-	u16 dwell;
-	u8 hopset;
-	u8 hoppattern;
-	u8 hopindex;
-} __packed;
-
-/*-- DS Parameter Set  ----------------------------*/
-struct wlan_ie_ds_parms {
-	u8 eid;
-	u8 len;
-	u8 curr_ch;
-} __packed;
-
-/*-- CF Parameter Set  ----------------------------*/
-
-struct wlan_ie_cf_parms {
-	u8 eid;
-	u8 len;
-	u8 cfp_cnt;
-	u8 cfp_period;
-	u16 cfp_maxdur;
-	u16 cfp_durremaining;
-} __packed;
-
-/*-- Challenge Text  ------------------------------*/
-struct wlan_ie_challenge {
-	u8 eid;
-	u8 len;
-	u8 challenge[1];
-} __packed;
-
-/*-------------------------------------------------*/
-/*  Frame Types  */
-
-/* prototype structure, all mgmt frame types will start with these members */
-struct wlan_fr_mgmt {
-	u16 type;
-	u16 len;		/* DOES NOT include CRC !!!! */
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	/*-- info elements ----------*/
-};
-
-/*-- Beacon ---------------------------------------*/
-struct wlan_fr_beacon {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u64 *ts;
-	u16 *bcn_int;
-	u16 *cap_info;
-	/*-- info elements ----------*/
-	struct wlan_ie_fh_parms *fh_parms;
-	struct wlan_ie_ds_parms *ds_parms;
-	struct wlan_ie_cf_parms *cf_parms;
-};
-
-/*-- IBSS ATIM ------------------------------------*/
-struct wlan_fr_ibssatim {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-
-	/*-- fixed fields -----------*/
-	/*-- info elements ----------*/
-
-	/* this frame type has a null body */
-
-};
-
-/*-- Disassociation -------------------------------*/
-struct wlan_fr_disassoc {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u16 *reason;
-
-	/*-- info elements ----------*/
-
-};
-
-/*-- Association Request --------------------------*/
-struct wlan_fr_assocreq {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u16 *cap_info;
-	u16 *listen_int;
-	/*-- info elements ----------*/
-
-};
-
-/*-- Association Response -------------------------*/
-struct wlan_fr_assocresp {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u16 *cap_info;
-	u16 *status;
-	u16 *aid;
-	/*-- info elements ----------*/
-
-};
-
-/*-- Reassociation Request ------------------------*/
-struct wlan_fr_reassocreq {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u16 *cap_info;
-	u16 *listen_int;
-	u8 *curr_ap;
-	/*-- info elements ----------*/
-
-};
-
-/*-- Reassociation Response -----------------------*/
-struct wlan_fr_reassocresp {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u16 *cap_info;
-	u16 *status;
-	u16 *aid;
-	/*-- info elements ----------*/
-
-};
-
-/*-- Probe Request --------------------------------*/
-struct wlan_fr_probereq {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	/*-- info elements ----------*/
-
-};
-
-/*-- Probe Response -------------------------------*/
-struct wlan_fr_proberesp {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u64 *ts;
-	u16 *bcn_int;
-	u16 *cap_info;
-	/*-- info elements ----------*/
-	struct wlan_ie_fh_parms *fh_parms;
-	struct wlan_ie_ds_parms *ds_parms;
-	struct wlan_ie_cf_parms *cf_parms;
-};
-
-/*-- Authentication -------------------------------*/
-struct wlan_fr_authen {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u16 *auth_alg;
-	u16 *auth_seq;
-	u16 *status;
-	/*-- info elements ----------*/
-	struct wlan_ie_challenge *challenge;
-
-};
-
-/*-- Deauthenication -----------------------------*/
-struct wlan_fr_deauthen {
-	u16 type;
-	u16 len;
-	u8 *buf;
-	struct p80211_hdr *hdr;
-	/* used for target specific data, skb in Linux */
-	void *priv;
-	/*-- fixed fields -----------*/
-	u16 *reason;
-
-	/*-- info elements ----------*/
-
-};
 #endif /* _P80211MGMT_H */
--
2.34.1



