Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FE6217677
	for <linux-staging@lists.linux.dev>; Wed,  5 Feb 2025 22:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794706; cv=none; b=YjGlC9celOsYQTa4/Q+iIkZvXhy04q+oL4LRtepzFMT5j6tVEiERoOCQwH9POAHMPY2oBTQBg6GQGhQAod/OC4ZLPoS3gvY7nYDVUyNSVyUI2pm5dogsOBk9JiT1LJrALmIY8vx9UZxUoIdPoUyJwRQW95CGqbLYoYzVMv+gBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794706; c=relaxed/simple;
	bh=L/ZLQnvq8ON99QQgaYS9Ll1Ire4rLTwQz8wQU2/tYDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOje6kmBQKBUetl7A7Ew1Nu21CfWRZH1TSYED6PVYPUX4Z3l/GFfZyNiPqVzCjxLF6wHcO9seGveREWI/vUy6nWnOLXvw35T1UdSioHIamOnhuUCzjdsG7NEuXGm+m0p1IsdyGowqOkqOOj7Tq4ax2oPPvbISfQJ/LB5FGy12rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7QHilb/; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7QHilb/"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e58a7e02514so255324276.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Feb 2025 14:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794702; x=1739399502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1RjIz6ycpA1/mFgQBJ++DLhi2HFSy95IVVfgRuxs60=;
        b=C7QHilb/9DkJ56pb88IPPQFTruBH94r7b/Qbjnj7sg8Tx+ejM9FHhzsQ8A7qTVaDl/
         nIjb80zfbU5rvhgFcW/ajbkE1XRQ6WgRaNIBIC7/BaSQiloEaFC8dsXwbjWH7oSZc296
         3gkh4NOSxsrowIlJoBaI/wfo5LQkqNLommbupe9fm8tgY2xWgtQVBrbskuVjhCoQc+Jf
         3TxbBkRZkmo8O2ACohtaZedAfDo8+XZgOoFuSxHxvEmaPeZ3CL+ojW56kbC9pClaQ4oJ
         Bm95nb96WYcAUWGMK5mjiTVmXQnaIoi6saopOarPXVk2MFZjZyHm0KOWsIIgMslDCsWO
         pNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794702; x=1739399502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1RjIz6ycpA1/mFgQBJ++DLhi2HFSy95IVVfgRuxs60=;
        b=MN1RWZ1LAjsUAVxzLsWXEW/blLPaNlq5LLpknE7GHFYVb1Udd93W40mI7bZkRLfoTD
         Vn/wJ3YZwP/fZvzTpNYj2dLyfPiI3TRSzid7IumHgnDlQn74E46ghK024NuwIX2VuUYX
         hWKTBuA2COMy73HXHd6kMbwb9tJ2PNkUqQ8QFckwOBJ5M1ORVvvLjTsAudIBN4W8OuhK
         m8dUjv+Kjj0qm8gG6Jf2POH02UkuMikNh0Q9acQyYNMDKK0yWHWxunGUZCFyGCxDlirX
         ZhtofTSCSbKMI+WuJFd2epuAtZiF4VVkyuDjkQTMFGQbffKmPpMyKEBK+m/JeD5NkNdT
         d8+w==
X-Gm-Message-State: AOJu0YyaAas/mm2iLsPv8jLB5y1K78rrVvPCe7URXZpXC6yWOlac1Vbi
	Y0+xX5GcCu6donfbMabpXfoYA8IiSxF3zxptvDeBhv4kP2luW6s9
X-Gm-Gg: ASbGncv7Y2Q+0dP8ROhVQuosRNu6HgLtHasXxuHNzysijyj2dyQJ1OL8B5M0EP1M5PF
	DelcnlZr5bTD3IJYX6eWMaueNbm8sk/9HpDaJ6WJH5NWJ6NyaULFPz2g6fga6phqy4TrHBb8NBx
	8Ohq0iKRtoT6xfwq9xqynTv4bm4aYIlRW+WY9GJu7KIuKggafQrIOwSQb+HZgg0wBxqwadyh4tG
	D3mHWXOMld0TnmdBdZfbpQRha1JMu+prF9PM97r8HsnYFeNaMUtU6YB0r0taWtGz6NxruPkR6j/
	Emy3LWKcF/CUdZVngAQ4
X-Google-Smtp-Source: AGHT+IHajV+UfA/BnBC4aCVYrDuQfX7Z202gTTu2KYcXOIcV4WKNy1BMBHPooEWQbHIGlw/TVNOvKg==
X-Received: by 2002:a05:6902:240d:b0:e57:f841:949f with SMTP id 3f1490d57ef6-e5b25bb7d02mr3428272276.19.1738794702558;
        Wed, 05 Feb 2025 14:31:42 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.22.94.73])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb3d946bsm3252790276.47.2025.02.05.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:31:42 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: fix spacing and placement
Date: Wed,  5 Feb 2025 14:31:35 -0800
Message-ID: <33093feb782c8cfd14c49825197fa7f46ed965ac.1738794631.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738794631.git.onlyian4981@gmail.com>
References: <cover.1738794631.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spacing issues were present, as well as operator placement. Reported by
checkpatch

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index a6dc88dd4ba1..b6459efd4c6f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,10 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+			    ((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2)
 			)
 				wakeup_sta_to_xmit(padapter, psta);
 		}
@@ -438,7 +437,6 @@ void update_bmc_sta(struct adapter *padapter)
 		spin_lock_bh(&psta->lock);
 		psta->state = _FW_LINKED;
 		spin_unlock_bh(&psta->lock);
-
 	}
 }
 
@@ -1497,7 +1495,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
-		pwps_ie += (wps_ielen+2);
+		pwps_ie += (wps_ielen + 2);
 
 		if (pbackup_remainder_ie)
 			memcpy(pwps_ie, pbackup_remainder_ie, remainder_ielen);
@@ -1619,14 +1617,14 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 {
 	u16 cur_op_mode, new_op_mode;
 	int op_mode_changes = 0;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv_ap = &pmlmepriv->htpriv;
 
 	if (pmlmepriv->htpriv.ht_option)
 		return 0;
 
-	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
-	    && pmlmepriv->num_sta_ht_no_gf) {
+	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
+	    pmlmepriv->num_sta_ht_no_gf) {
 		pmlmepriv->ht_op_mode |=
 			IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT;
 		op_mode_changes++;
@@ -1832,8 +1830,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_preamble_set) {
 		psta->no_short_preamble_set = 0;
 		pmlmepriv->num_sta_no_short_preamble--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_preamble == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_preamble == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
@@ -1851,8 +1849,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_slot_time_set) {
 		psta->no_short_slot_time_set = 0;
 		pmlmepriv->num_sta_no_short_slot_time--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_slot_time == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_slot_time == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
-- 
2.45.3

