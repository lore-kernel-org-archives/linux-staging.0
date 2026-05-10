Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C31355F49
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778396321; cv=none; b=kXR/tyg4ym/wOBmgBrO4khRRpnGGoQVVvIEuLsWYyDXJgVvPPvNid4j+vMDwMYnYWpMc6Aj8NiCyLO7MQG6GJOjK2okdekb/MbJfIamhawR/sIDJmrVyUU++JrBWH1mNOMwNZZdgEGkwHthqpD5FGC/12w1BGVHrs3Il7mPEYRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778396321; c=relaxed/simple;
	bh=WP6kKubO4pkSvkU87GIC83YxeNcjvwByUQFsMTA0Ly0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Iyi/Y136XnkdHt3uil3b+XcyHF1/Ry+VPL2t6U7aXx7FrCboEE+eQ/FzkjqlxkKd4Xefq9Nx1gti3vqYQuYyYgY09WRKMOwez3j+KVMp8sbToixELKaf960M0vssRjmzdDjdr3c/mHUMieN4bUqES62OVKH/cm8mw9YU2KFrLjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2Q9R9D9; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2Q9R9D9"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f30a4601bbso3439595eec.1
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778396319; x=1779001119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2HbnrXJ7yOcDRmQVG3hX5pdmrUoW3FaMYDlIYk+ofyY=;
        b=m2Q9R9D9hRWxFTkiCX1qgV7T7dCQHBxKxlsv85XIjpoIZXnGR5g7JiP++pQ8tYClUU
         xuSmZ9Z8TjqncLmeuMiMX0JdC2AZLcOZdgm7wS4yp53geF+9duFN7xZLTcuRMV8TjFER
         BkNM/O62347WkySqYW2sbys3eisDRdh2yTbltHebVCWBrb/QWOn0vXeuYqvUbtFyLLZ6
         QvfXcWgKq9dnnmfz4jL+UxFgLq3ZmSOiMTL66Kl2aqaf+Dj8obqSz3HNHt37+RxJwDAR
         DgU06Qvv0NDiKr48F1SsycBXHzhLcWHUsQ30oS6o8LnTIxQ62lQeWIsozUK9+dQMaWgr
         WFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778396319; x=1779001119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HbnrXJ7yOcDRmQVG3hX5pdmrUoW3FaMYDlIYk+ofyY=;
        b=QTB0EnO/mtrRHDcTFr0HFoCZnvm6FwRBOURTwzGpHSXXBVwJwgHDyQcrxYm/iK7XQL
         n/wvD3x2zSXrf4jl3OiHCeSOLbhRzP8NNDthSJdPB1rfQkBuiCucmMLR1bZJkjNBZZlR
         o/TjSwUs8+8N/B4lyQSsN9GhxgaNoGHxSqsczM2sL0AZfQiLA7d2y9TevO5jRjaDiiOI
         jqCahEV7Zv7C41dL0oTQm1lzOrgNrBOW3nhuS9v5Plf9IQBOBfUZ96dzadP3Lz8t1epT
         GmXjvdFR1YIDAMYsxggwk1TePUXI7hhELB73p+qIyKprg4PxCUtEi1hZ9t3vXHGeSZtJ
         ecmA==
X-Gm-Message-State: AOJu0YzDZvAzCi0uvZnWiMPc9iKvg6EhtLey3SJb44LkhAlQhjHMJETM
	xd7sxew/zgbukquvMaRg8x/GZGAUeegWR2As4wuc45huh5NCaKied7G35cTlOQ==
X-Gm-Gg: Acq92OHW2gfzVtRX8CMWOoAm8qNwEVCDZ/W4Q9OEg3laLyGvbLsuBXzTQK2AgKAz0JW
	9Rg15Cm5QrfNUpKCnRAORxX5m/xNLxbcIlPgH6z/l98uaVqlzZUUT/qYKjOLc4ABjUJnJ8Bp9/T
	UijwpHU4mXLZtlYDMxInKycdjpYuYvv47FKWut2pGVhgVXTv5HBfAkT3N3ALP/WcVwFs/SCaUS8
	EWUuTmC40ntG+LvW+xl6mL2jTLp23hrOkxulQgpdGHKUJhlYpbZWYVUZVbsAAhZwrmRzB4r61d+
	pYXJNcBgYvlpCXj9yLX/ADH/ag+fJlzafLJrRvJXJqw/KwC9/E0ZgXQzofPNV0Km5fEuZiAl90J
	T3Elphr4D9rIky6DY7VcDR/MKKTu83xp9hA2r8gglmXjQfMddkyfjn5w/2NQRgd5IxlxiYSJFpL
	GzrSVrqsditChj2u0CSrzz7+s3cx/IJYXHWcPsxw6gf5E=
X-Received: by 2002:a05:7300:a191:b0:2ed:e14:7f56 with SMTP id 5a478bee46e88-2f54e47ea02mr8359866eec.32.1778396318156;
        Sat, 09 May 2026 23:58:38 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f8884752ccsm8651226eec.17.2026.05.09.23.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 23:58:37 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary blank lines in rtw_recv.c
Date: Sat,  9 May 2026 23:58:29 -0700
Message-Id: <20260510065829.68957-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines around braces {}.

This fixes the following checkpatch.pl checks in rtw_recv.c:
- CHECK: Blank lines aren't necessary after an open brace '{'
- CHECK: Blank lines aren't necessary before a close brace '}'

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 38 -----------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index b3a38ffa6ef7..fc0397ad4741 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -69,7 +69,6 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 
 		precvframe->u.hdr.adapter = padapter;
 		precvframe++;
-
 	}
 
 	res = rtw_hal_init_recv_priv(padapter);
@@ -111,7 +110,6 @@ void _rtw_free_recv_priv(struct recv_priv *precvpriv)
 
 union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 {
-
 	union recv_frame  *precvframe;
 	struct list_head	*plist, *phead;
 	struct adapter *padapter;
@@ -178,7 +176,6 @@ int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_
 
 signed int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue)
 {
-
 	struct adapter *padapter = precvframe->u.hdr.adapter;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
@@ -270,7 +267,6 @@ signed int rtw_enqueue_recvbuf(struct recv_buf *precvbuf, struct __queue *queue)
 	list_add_tail(&precvbuf->list, get_list_head(queue));
 	spin_unlock_bh(&queue->lock);
 	return _SUCCESS;
-
 }
 
 struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
@@ -290,13 +286,11 @@ struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
 		precvbuf = container_of(plist, struct recv_buf, list);
 
 		list_del_init(&precvbuf->list);
-
 	}
 
 	spin_unlock_bh(&queue->lock);
 
 	return precvbuf;
-
 }
 
 static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
@@ -345,7 +339,6 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 
 static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *precvframe)
 {
-
 	signed int	i, res = _SUCCESS;
 	u32 datalen;
 	u8 miccode[8];
@@ -417,18 +410,15 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 		}
 
 		recvframe_pull_tail(precvframe, 8);
-
 	}
 
 exit:
 	return res;
-
 }
 
 /* decrypt and set the ivlen, icvlen of the recv_frame */
 static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *precv_frame)
 {
-
 	struct rx_pkt_attrib *prxattrib = &precv_frame->u.hdr.attrib;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	union recv_frame *return_packet = precv_frame;
@@ -573,7 +563,6 @@ static signed int recv_decache(union recv_frame *precv_frame, u8 bretry, struct
 	prxcache->tid_rxseq[tid] = seq_ctrl;
 
 	return _SUCCESS;
-
 }
 
 static void process_pwrbit_data(struct adapter *padapter, union recv_frame *precv_frame)
@@ -595,7 +584,6 @@ static void process_pwrbit_data(struct adapter *padapter, union recv_frame *prec
 				/* pstapriv->sta_dz_bitmap |= BIT(psta->aid); */
 
 				stop_sta_xmit(padapter, psta);
-
 			}
 		} else {
 			if (psta->state & WIFI_SLEEP_STATE) {
@@ -605,7 +593,6 @@ static void process_pwrbit_data(struct adapter *padapter, union recv_frame *prec
 				wakeup_sta_to_xmit(padapter, psta);
 			}
 		}
-
 	}
 }
 
@@ -706,7 +693,6 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
 	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
-
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
 			ret = _FAIL;
@@ -792,7 +778,6 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
 	    (check_fwstate(pmlmepriv, _FW_LINKED) ||
 	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING))) {
-
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
 			ret = _FAIL;
@@ -809,7 +794,6 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		if (is_zero_ether_addr(pattrib->bssid) ||
 		    is_zero_ether_addr(mybssid) ||
 		    (memcmp(pattrib->bssid, mybssid, ETH_ALEN))) {
-
 			if (!bmcast)
 				issue_deauth(adapter, pattrib->bssid, WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA);
 
@@ -859,7 +843,6 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		if (!memcmp(myhwaddr, pattrib->dst, ETH_ALEN) && (!bmcast)) {
 			*psta = rtw_get_stainfo(pstapriv, pattrib->bssid); /*  get sta_info */
 			if (!*psta) {
-
 				/* for AP multicast issue , modify by yiwei */
 				static unsigned long send_issue_deauth_time;
 
@@ -1052,7 +1035,6 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	}
 
 	return _FAIL;
-
 }
 
 /* perform defrag */
@@ -1123,7 +1105,6 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 
 		pfhdr->attrib.icv_len = pnfhdr->attrib.icv_len;
 		plist = get_next(plist);
-
 	}
 
 	/* free the defrag_q queue and return the prframe */
@@ -1195,7 +1176,6 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 			rtw_free_recvframe(precv_frame, pfree_recv_queue);
 			prtnframe = NULL;
 		}
-
 	}
 
 	if ((ismfrag == 0) && (fragnum != 0)) {
@@ -1216,7 +1196,6 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 			rtw_free_recvframe(precv_frame, pfree_recv_queue);
 			prtnframe = NULL;
 		}
-
 	}
 
 	if ((prtnframe) && (prtnframe->u.hdr.attrib.privacy)) {
@@ -1269,7 +1248,6 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 	mgt_dispatcher(padapter, precv_frame);
 
 	return _SUCCESS;
-
 }
 
 static signed int validate_recv_data_frame(struct adapter *adapter, union recv_frame *precv_frame)
@@ -1325,7 +1303,6 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	default:
 		ret = _FAIL;
 		break;
-
 	}
 
 	if (ret == _FAIL || ret == RTW_RX_HANDLED)
@@ -1454,7 +1431,6 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 
 validate_80211w_fail:
 	return _FAIL;
-
 }
 
 static signed int validate_recv_frame(struct adapter *adapter, union recv_frame *precv_frame)
@@ -1714,7 +1690,6 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 	pdata = prframe->u.hdr.rx_data;
 
 	while (a_len > ETH_HLEN) {
-
 		/* Offset 12 denote 2 mac address */
 		nSubframe_Length = get_unaligned_be16(pdata + 12);
 
@@ -1821,7 +1796,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			return false;
 		else
 			break;
-
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
@@ -1835,7 +1809,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 
 	return true;
-
 }
 
 static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1903,13 +1876,11 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 		pattrib = &prframe->u.hdr.attrib;
 
 		preorder_ctrl->indicate_seq = pattrib->seq_num;
-
 	}
 
 	/*  Prepare indication list and indication. */
 	/*  Check if there is any packet need indicate. */
 	while (!list_empty(phead)) {
-
 		prframe = (union recv_frame *)plist;
 		pattrib = &prframe->u.hdr.attrib;
 
@@ -1946,7 +1917,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			bPktInBuf = true;
 			break;
 		}
-
 	}
 
 	/* spin_unlock(&ppending_recvframe_queue->lock); */
@@ -1971,11 +1941,9 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 			    !padapter->bSurpriseRemoved) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
-
 			}
 
 			return _FAIL;
-
 		}
 
 		if (!preorder_ctrl->enable) {
@@ -2056,7 +2024,6 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 
 	spin_unlock_bh(&ppending_recvframe_queue->lock);
-
 }
 
 static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame *prframe)
@@ -2090,11 +2057,9 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 			retval = _FAIL;
 			return retval;
 		}
-
 	}
 
 	return retval;
-
 }
 
 static int recv_func_prehandle(struct adapter *padapter, union recv_frame *rframe)
@@ -2168,7 +2133,6 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 	ret = recv_func_prehandle(padapter, rframe);
 
 	if (ret == _SUCCESS) {
-
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
 		    !is_multicast_ether_addr(prxattrib->ra) &&
@@ -2236,7 +2200,6 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 		adapter->recvpriv.signal_strength = adapter->recvpriv.signal_strength_dbg;
 		adapter->recvpriv.rssi = (s8)translate_percentage_to_dbm((u8)adapter->recvpriv.signal_strength_dbg);
 	} else {
-
 		if (recvpriv->signal_strength_data.update_req == 0) {/*  update_req is clear, means we got rx */
 			avg_signal_strength = recvpriv->signal_strength_data.avg_val;
 			num_signal_strength = recvpriv->signal_strength_data.total_num;
@@ -2289,5 +2252,4 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 
 set_timer:
 	rtw_set_signal_stat_timer(recvpriv);
-
 }
-- 
2.34.1

