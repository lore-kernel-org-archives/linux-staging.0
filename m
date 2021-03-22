Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B046F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:12 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v4so16817735wrp.13
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YQueFC4iUXA/8lwE9paRqua151q9BRFwTxr3RS2rJUY=;
        b=MXgHnlPnVBESN/W8n0cQlLaAAefOkEztKMDHNSnTRUEXu4HaCGoAjfjnKPjU2qrPUF
         TAdrcpXDkbGbAlXbnufhFR4M4Ce6Rp2Ja1VwKjMqtKJD2DZ7y9Wcm3XHNg8seIcxwQ5U
         QKwfc4zBRPDw5MouNUvxDhTGNkSA8d0J9QM5/dz4c+WanY8pfnHOELbeTFGUjRK6bPzv
         IFj/T7/sndZlVySgaNP0nbQovAqO4s7usZp45nwDJCYM68kh4iH2EPQTFmHU01KZ8qQz
         chSyFVV2j/bcztdpWL9nBS+nU+jppPwhbPsli2/YtSs9s5d4nlERvjeQT9lCJjReGLox
         9gXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YQueFC4iUXA/8lwE9paRqua151q9BRFwTxr3RS2rJUY=;
        b=kika7A5NmMS6ALVUgIjURp274egC5ORlT3BLUyCHi9usy2d1+w/SYvgYbaW65TwQ+/
         4Mb9EVix1pdqXUYMg/tKt8TrJx8/x+gt2pV9eErYNug/YtpZHsNeL1dgVTivXRenOijX
         AWCtAUgfwT32mzaB4HQU6qelxPAKsDXXj5TOsbp8oWek1R71yvhqdqhL1HzKf3AbMjqR
         Nz3wpRZmZ7/+s8hIIZKCslYzPsquK9BR82ssV4nxN3WzY1qVklOTc4FJy1e/Ir1nB5wq
         vTyd3onXPkpiwvtF4lamFaO9KZQq+7GNBimko0uqfWy5is1O3Nc9G0qUrMO0Bqm+T1Pz
         lZJg==
X-Gm-Message-State: AOAM531fWmgOT2NWe84Ym+MrG2l3P78QxjALzjSJY1ruajp5GT6I2snq
	grAn/05UEcprzSWO8FZd1qg=
X-Google-Smtp-Source: ABdhPJyU+znVVK2/U+DzWoYK75BWdrP/igh1GxSX5Y7cq5CSSPamnjojvFv7loPZjKaL+rB1Szyp1Q==
X-Received: by 2002:a05:600c:4caa:: with SMTP id g42mr10024307wmp.2.1616420231019;
        Mon, 22 Mar 2021 06:37:11 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:10 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 01/19] Staging: rtl8723bs: remove useless structs in rtw_mlme.h
Date: Mon, 22 Mar 2021 14:36:59 +0100
Message-Id: <20210322133717.17797-2-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct's in include/rtw_mlme.h:

	struct cfg80211_wifidirect_info
	struct tdls_info
	struct tdls_txmgmt

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 38 --------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 02d973a5aed2..25cfb4cc021b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -202,16 +202,6 @@ struct scan_limit_info {
 	u8 			operation_ch[2];				/* 	Store the operation channel of invitation request frame */
 };
 
-struct cfg80211_wifidirect_info {
-	struct timer_list					remain_on_ch_timer;
-	u8 				restore_channel;
-	struct ieee80211_channel	remain_on_ch_channel;
-	enum nl80211_channel_type	remain_on_ch_type;
-	u64						remain_on_ch_cookie;
-	bool is_ro_ch;
-	unsigned long last_ro_ch_time; /* this will be updated at the beginning and end of ro_ch */
-};
-
 struct wifidirect_info {
 	struct adapter				*padapter;
 	struct timer_list					find_phase_timer;
@@ -292,34 +282,6 @@ struct tdls_ss_record {	/* signal strength record */
 	u8 is_tdls_sta;	/*  true: direct link sta, false: else */
 };
 
-struct tdls_info {
-	u8 			ap_prohibited;
-	u8 			link_established;
-	u8 			sta_cnt;
-	u8 			sta_maximum;	/*  1:tdls sta is equal (NUM_STA-1), reach max direct link number; 0: else; */
-	struct tdls_ss_record	ss_record;
-	u8 			ch_sensing;
-	u8 			cur_channel;
-	u8 			candidate_ch;
-	u8 			collect_pkt_num[MAX_CHANNEL_NUM];
-	spinlock_t				cmd_lock;
-	spinlock_t				hdl_lock;
-	u8 			watchdog_count;
-	u8 			dev_discovered;		/* WFD_TDLS: for sigma test */
-	u8 			tdls_enable;
-	u8 			external_setup;	/*  true: setup is handled by wpa_supplicant */
-};
-
-struct tdls_txmgmt {
-	u8 peer[ETH_ALEN];
-	u8 action_code;
-	u8 dialog_token;
-	u16 status_code;
-	u8 *buf;
-	size_t len;
-	u8 external_support;
-};
-
 /* used for mlme_priv.roam_flags */
 enum {
 	RTW_ROAM_ON_EXPIRED = BIT0,
-- 
2.30.2

