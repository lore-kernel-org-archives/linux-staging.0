Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38552741B6
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425841; cv=none; b=j9q2GJq/SvLO9wOq7B7b91u5jgvgWM515yAY5hWPRyVN7e/auw3XdZEQkFzBQhUCnfh6AH437Bzt9/6d2OIP3MF7jnfiECmx9oqLPbIa9TM1y3jZN+FHer6bXL2h0N2Sp847R0dex0NPYjGbvAnf++VhEEG2FYYkt560mhTqGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425841; c=relaxed/simple;
	bh=1PC1+sAQ5+RudOHFOyziJUj9BmNGyBE9j6UashNsZzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FKF1D6CQV2M/ikxpjGjx1GXcchTHhq1yvQ9ruqD6fAYIpuOfkeYAr30/S17Ux8UVltDfDxQ3qi2H9CaNMmkKfLEGMvZfSsie4mOZNwWvoo4Lfb5v9nxiwnxVDPOO48XTXn1O8WuSqL36RqqvhRnq8SNQnzgxUjQQ4hMaoZa1fFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWbGUmWv; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWbGUmWv"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4df0467b510so17248651cf.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425839; x=1760030639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvBFaRtjx461qob9bhD15oHTSRVQ6nYQZ4Qc5hYd+vg=;
        b=iWbGUmWvUEhh0b25ZV3eYxkWeQciyKUeiHl8SQ28LQDojVIbG8PtEUaToOM4e0WuZT
         ZpTHys/35qpGvQf2g8Bg9NE8E7KD9XoN7IVdrZUKLjLRHPGFUuJfRziGKMRqo+3lKry0
         jN23h9MtddiCj/yY7ugGBdN5eCqA0lBzF476rnn4IWz2u2RBdT3C5tGLoGYjXT7zBjQ3
         enx0ejaxOl5jjVZgKoiSBvmbW5nH6nNj7/2C+3Dg1NLWQ0SIXgwvU769x+4RmkQ4ynAO
         svganGCoP3ZvzrzQcEfbAIgDPyCGSz4425h4GBLEbsaj+meSq22PkXI2tzHk5xwRqT0d
         YZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425839; x=1760030639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvBFaRtjx461qob9bhD15oHTSRVQ6nYQZ4Qc5hYd+vg=;
        b=hmkatanSvGcTovbwUaZ2J5w8ZOnLOnUNDyKl/qmwsFCd+4iHcWKGLE7WGFvTljNFuD
         tfGO31Fjnhpui08YCTA8gi4iNdVQskHvUaNlUgfi6pRC03zpLWU1jNFUHaaioV92ZAf5
         58u5FVCI7IbRhqu+fik0oiStq3hcTvCw+nb6Xw0FW+Llb1GRGiJplDfuCQBAFYHThA/s
         9vla4vbpFneB5beAN3AyrRgdWSmvSsx8amV37rGkmhFW7skjTBgXqZqAWISgMK4SdhUz
         KPy3VrP3GSd4/E9mvl0Ga0vjmUS5J6TOAonEoJpaOkcQ9TcE0Hsf9K9CFfou51gO4mzx
         GG2A==
X-Gm-Message-State: AOJu0Yw/nDBVaHoZ3gNuai2w2Kh/aNIg52YLga0W5NucnKM97y63namf
	dPVQUrL6uJRWtzJLxl+SFpTseX07NTnldq729K75aky+yez5BllFM6O1
X-Gm-Gg: ASbGncsuAMd8n1w44fL9s9AzGTUwoM+SWdVLU32ZrUPStKzNiAByfiEocdvlmsKZY1S
	U6rwccjhzxj7fho6AJ81Kn9Ku7ScE7D6ZFauWRYEJzcIhsSl2lqfFPVBMAxACaV8iLwYsTFTpO1
	mEULPKVg0XWmgnrS0W5eFpgnauYYkv5ped8hO7awJtQTj3ghkfGCrQZwhx/l0qb64yz1FMzb8F4
	D+936wadiPGjtiYZezTC8Zv/5A0JkGmos3VRthycdkmyFo1Kn3l+u3WueXMQCYtpbUa+YHy1uG2
	obVCmSQmFwM83P0PV5a+dbgFlMLshqZ9yx0drnYYaA4SvzRt8HInDgHyQhCz3uXpmSotGo4NtGM
	Hjlnxg373vj61AEXp6e3u/YUaxgfW9Ag7NE8vF7BRZ7uqZy2t1VpCM/81y5kXxKGEN1oC0xEINj
	PoEGmVw2atHJ3kURE76QZL
X-Google-Smtp-Source: AGHT+IE+jU7SzzEavOn5JZUH3ibDHJskYyMLSKshCzyAsOgcjXufZCQx7zNwRQEQ34HAOXQjM0rYQA==
X-Received: by 2002:a05:622a:5a19:b0:4d8:1f72:ba60 with SMTP id d75a77b69052e-4e576a453b6mr1489481cf.14.1759425838559;
        Thu, 02 Oct 2025 10:23:58 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:23:57 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 06/16] staging: rtl8723bs: fix indentation to align with open parenthesis
Date: Thu,  2 Oct 2025 17:22:54 +0000
Message-Id: <20251002172304.1083601-7-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust indentation of function arguments to align with the opening
parenthesis, following kernel coding style. This improves readability
and maintains consistent formatting.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0296c2e9a7e1..ba77040a8d8d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -183,7 +183,7 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 		return;
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
 		lifetime = 1;
 
 	if (!isfreeall) {
@@ -270,7 +270,7 @@ signed int rtw_if_up(struct adapter *padapter)
 	signed int res;
 
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
-		(check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
+	    (check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
 		res = false;
 	else
 		res =  true;
@@ -339,7 +339,7 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
-		    (pnetwork->network.privacy == 0))
+	    (pnetwork->network.privacy == 0))
 		ret = false;
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
@@ -420,7 +420,7 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-	struct adapter *padapter, bool update_ie)
+		    struct adapter *padapter, bool update_ie)
 {
 	long rssi_ori = dst->rssi;
 
@@ -474,9 +474,9 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	rtw_bug_check(&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network);
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network);
 
 	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) &&
 	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
@@ -1438,7 +1438,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	spin_lock_bh(&pmlmepriv->lock);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
@@ -1537,7 +1537,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {
@@ -2107,7 +2107,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 
 	for (i = 0; i < NUM_PMKID_CACHE; i++)
 		if ((p->PMKIDList[i].bUsed) &&
-				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+		    (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
 			return i;
 	return -1;
 }
@@ -2694,8 +2694,8 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 signed int rtw_linked_check(struct adapter *padapter)
 {
 	if ((check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true) ||
-			(check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE |
-			 WIFI_ADHOC_MASTER_STATE) == true)) {
+	    (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE |
+			   WIFI_ADHOC_MASTER_STATE) == true)) {
 		if (padapter->stapriv.asoc_sta_count > 2)
 			return true;
 	} else {	/* Station mode */
-- 
2.39.5

