Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE1C51476B
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885591; cv=none; b=lJJrWILXY2fnXGMUPki9BuTzJWHmTq9bWyfzb8YNH++qNmrnwLDtp55WRnDA4/X8E1Xg7iJpk/GhZdbCbywQP18VyPoCPrqXgOsyExnTGRCZTtKEKemowo1PMogcyLsI5mMa3Wc4oVnBGwHBuunh1uj4XXRsZ2XURf3EY4fCLhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885591; c=relaxed/simple;
	bh=YPeIJsbR11gV3XfhcGkIq+UCiqTOp/TdtycL02N7M5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bdh3r8JuFwa/UvWzG2HL9w0zsMLg8SigRJ9/nGqxpY3edQjqcJcQrQvHRT8i5CFOONdAhZuKd/qemwPuiTv9ojBn7+xon1Cc566qtgd5BwbFk2qITV4d2m9hSOIHPDvDdlOXRIXxiOZUu3M1dnA0gfLljfT+8OOOnqSV1lbTUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1jpyZXT; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1jpyZXT"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-395cf2535acso4833534a91.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885589; x=1789490389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzmWyJfpYoWlN2+UrsWP8FcbMUlPlOokN0Ecxog6OEM=;
        b=W1jpyZXTrgR9DNTA1624yvtLPnO+7Pweg2SdHnacYjs/aplDR7KmT8n2xR1gKCJk/Y
         ru66tI7cJP5DYlWLn0/cvrAIX2hc7Ejg3fiD8kM1J4IDZTGoL8S8uBOHY/U/EW9GehfR
         9Xb7cJE2DUNwLqui2v1C8LxlWonAoR26h4YZmMun4J7gLvv1ZGq3lxjw87uiuRl+xiwN
         RHF9dlBfGQVqFAI3heOT1O3AMcx1RB1pm3eMsb1lm1DFLr9mQ07QS1QlN5cLgaGgFfe8
         ApVC7zz4lXcObUau9cC6Xb0/Bm6MRElCKXrr3XiioJnDZ1vMI33gwm9bxE8S59PWIrDy
         9rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885589; x=1789490389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzmWyJfpYoWlN2+UrsWP8FcbMUlPlOokN0Ecxog6OEM=;
        b=PKxx6/9Ej43f4bWPm1eAMiUPdltBe2mLQ0lKifcVN+Comw+q2XdXWk5SBfHAbRu6+z
         eP/P1FHFgjs84a+dXT3sFSvzwXv+Frct/oX9mz2cFXjbwYU799hogcxc1JuLE/Ty8T90
         hLWy/wrT6RrKfR9k6Vi/WZm+7BS9yCwPVkttt+GlvGbk81Ul3i2qrwVrZZRVaI9WO99c
         dnYqrhyl/h8R7rsmveBFiNcbNbR9p4Xi0aza4HBGPwdexOi3ReBpe5TbFRDqed3MXhhg
         xWzaTRcJ45VD96nuBhnfLWnoB7HtIiYD0vyud68i+C0F9cUd0j+NTmCxgplvuSKEKdzf
         iHgQ==
X-Gm-Message-State: AFuF++l2TgCKIgYSku4Lo7PIgPe0boocr1CgEgNJaJHLrCWMRubP4Uoh
	NdYOAl3dVh2QcESUO6mPMSieLcTitaOHzC2wR1U15+/PpxEkO+nQuZHNeFBzwA==
X-Gm-Gg: AYBFou3J/5tBL1dLyiw7fAxAaxG2GxfaHEKHTuT2N/51GmMG9wzXHOAXtgXLmQaThpM
	McSqVKCNwcUXrHeMQrhUxEucLn55u862yU7yPL6+wHpE9XlmqmnqG6yE+pWget3QRvmqU49Wo8g
	XVmRiW+jqnJdi2ayxY5uEb5tbV5MXJRorwn0JfO5gcAx3eFCA9L1DR6CWrV6qO+hTLlKmFsnuba
	wMnVWCkfumFIAW9YNyWSvJim9j7xpA22ZjYbbWAfDrN68P6020urh1vOZSfeIuZz5Y/bdjSGyBe
	9ydmJNbpufchIDytMoWIEMF6MlWBaJih/qxmIRtaqj3dGx38cuVi4oJBvrAFRNOt3V43tDoq/6o
	iPRahh3+A50m+HVd1LBCBVC5LYOnuM/h31vCjgWPgtwANKYn9lG5bQJdsmjIQF+9BphwPwjY74B
	xA4DsI3GkP0ywEVZsQs6ZEwq29lYAmB6VcO54lwXwcXOJsqSxPJcXqK6la4uOajqZG3VGQeos=
X-Received: by 2002:a17:90a:7784:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39b2b1f52c4mr21130210a91.26.1788885588642;
        Tue, 08 Sep 2026 09:39:48 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm5672357eec.29.2026.09.08.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:39:48 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 1/3] staging: rtl8723bs: remove commented out code in rtw_recv.c
Date: Tue,  8 Sep 2026 09:39:17 -0700
Message-Id: <20260908163919.72100-2-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908163919.72100-1-guojy.bj@gmail.com>
References: <20260908163919.72100-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all commented-out code in this file.
Remove adjacent comment where applicable.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 69 -----------------------
 1 file changed, 69 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3c82012fdc6c..dde66b68d5e3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -54,8 +54,6 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 	}
 
 	precvpriv->precv_frame_buf = PTR_ALIGN(precvpriv->pallocated_frame_buf, RXFRAME_ALIGN_SZ);
-	/* precvpriv->precv_frame_buf = precvpriv->pallocated_frame_buf + RXFRAME_ALIGN_SZ - */
-	/* ((SIZE_PTR) (precvpriv->pallocated_frame_buf) &(RXFRAME_ALIGN_SZ-1)); */
 
 	precvframe = (union recv_frame *)precvpriv->precv_frame_buf;
 
@@ -181,7 +179,6 @@ signed int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *
 	struct adapter *padapter = precvframe->u.hdr.adapter;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
-	/* INIT_LIST_HEAD(&(precvframe->u.hdr.list)); */
 	list_del_init(&(precvframe->u.hdr.list));
 
 	list_add_tail(&(precvframe->u.hdr.list), get_list_head(queue));
@@ -197,10 +194,8 @@ signed int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *q
 {
 	signed int ret;
 
-	/* _spinlock(&pfree_recv_queue->lock); */
 	spin_lock_bh(&queue->lock);
 	ret = _rtw_enqueue_recvframe(precvframe, queue);
-	/* spin_unlock(&pfree_recv_queue->lock); */
 	spin_unlock_bh(&queue->lock);
 
 	return ret;
@@ -347,7 +342,6 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 	u8 bmic_err = false, brpt_micerror = true;
 	u8 *pframe, *payload, *pframemic;
 	u8 *mickey;
-	/* u8 *iv, rxdata_key_idx = 0; */
 	struct sta_info *stainfo;
 	struct rx_pkt_attrib *prxattrib = &precvframe->u.hdr.attrib;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
@@ -361,13 +355,8 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 		/* calculate mic code */
 		if (stainfo) {
 			if (is_multicast_ether_addr(prxattrib->ra)) {
-				/* mickey =&psecuritypriv->dot118021XGrprxmickey.skey[0]; */
-				/* iv = precvframe->u.hdr.rx_data+prxattrib->hdrlen; */
-				/* rxdata_key_idx =(((iv[3])>>6)&0x3) ; */
 				mickey = &psecuritypriv->dot118021XGrprxmickey[prxattrib->key_index].skey[0];
 
-				/* psecuritypriv->dot118021XGrpKeyid, pmlmeinfo->key_index, rxdata_key_idx); */
-
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
 					goto exit;
@@ -531,16 +520,7 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 		} else {
 			/* allowed */
 			/* check decryption status, and decrypt the frame if needed */
-
 			prtnframe = precv_frame;
-			/* check is the EAPOL frame or not (Rekey) */
-			/* if (ether_type == eapol_type) { */
-				/* check Rekey */
-
-			/* prtnframe =precv_frame; */
-			/*  */
-			/* else { */
-			/*  */
 		}
 	} else {
 		prtnframe = precv_frame;
@@ -584,16 +564,10 @@ static void process_pwrbit_data(struct adapter *padapter, union recv_frame *prec
 	if (psta) {
 		if (pwrbit) {
 			if (!(psta->state & WIFI_SLEEP_STATE)) {
-				/* psta->state |= WIFI_SLEEP_STATE; */
-				/* pstapriv->sta_dz_bitmap |= BIT(psta->aid); */
-
 				stop_sta_xmit(padapter, psta);
 			}
 		} else {
 			if (psta->state & WIFI_SLEEP_STATE) {
-				/* psta->state ^= WIFI_SLEEP_STATE; */
-				/* pstapriv->sta_dz_bitmap &= ~BIT(psta->aid); */
-
 				wakeup_sta_to_xmit(padapter, psta);
 			}
 		}
@@ -924,7 +898,6 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	struct sta_info *psta = NULL;
-	/* uint len = precv_frame->u.hdr.len; */
 
 	if (GetFrameType(pframe) != WIFI_CTRL_TYPE)
 		return _FAIL;
@@ -982,7 +955,6 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 			struct xmit_frame *pxmitframe = NULL;
 			struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
-			/* spin_lock_bh(&psta->sleep_q.lock); */
 			spin_lock_bh(&pxmitpriv->lock);
 
 			xmitframe_phead = get_list_head(&psta->sleep_q);
@@ -1010,15 +982,12 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 					pstapriv->tim_bitmap &= ~BIT(psta->aid);
 
 					/* update BCN for TIM IE */
-					/* update_BCNTIM(padapter); */
 					update_beacon(padapter, WLAN_EID_TIM, true);
 				}
 
-				/* spin_unlock_bh(&psta->sleep_q.lock); */
 				spin_unlock_bh(&pxmitpriv->lock);
 
 			} else {
-				/* spin_unlock_bh(&psta->sleep_q.lock); */
 				spin_unlock_bh(&pxmitpriv->lock);
 
 				if (pstapriv->tim_bitmap & BIT(psta->aid)) {
@@ -1032,7 +1001,6 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 					pstapriv->tim_bitmap &= ~BIT(psta->aid);
 
 					/* update BCN for TIM IE */
-					/* update_BCNTIM(padapter); */
 					update_beacon(padapter, WLAN_EID_TIM, true);
 				}
 			}
@@ -1171,10 +1139,8 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 
 			/* Then enqueue the 0~(n-1) fragment into the defrag_q */
 
-			/* spin_lock(&pdefrag_q->lock); */
 			phead = get_list_head(pdefrag_q);
 			list_add_tail(&pfhdr->list, phead);
-			/* spin_unlock(&pdefrag_q->lock); */
 
 			prtnframe = NULL;
 
@@ -1189,10 +1155,8 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 		/* the last fragment frame */
 		/* enqueue the last fragment */
 		if (pdefrag_q) {
-			/* spin_lock(&pdefrag_q->lock); */
 			phead = get_list_head(pdefrag_q);
 			list_add_tail(&pfhdr->list, phead);
-			/* spin_unlock(&pdefrag_q->lock); */
 
 			/* call recvframe_defrag to defrag */
 			precv_frame = recvframe_defrag(padapter, pdefrag_q);
@@ -1320,8 +1284,6 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 		goto exit;
 	}
 
-	/* psta->rssi = prxcmd->rssi; */
-	/* psta->signal_quality = prxcmd->sq; */
 	precv_frame->u.hdr.psta = psta;
 
 	pattrib->amsdu = 0;
@@ -1527,7 +1489,6 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	psnap = (struct ieee80211_snap_hdr *)(ptr + pattrib->hdrlen + pattrib->iv_len);
 	psnap_type = ptr + pattrib->hdrlen + pattrib->iv_len + SNAP_SIZE;
 	/* convert hdr + possible LLC headers into Ethernet header */
-	/* eth_type = (psnap_type[0] << 8) | psnap_type[1]; */
 	if ((!memcmp(psnap, rfc1042_header, SNAP_SIZE) &&
 		(memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
 		(memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
@@ -1638,7 +1599,6 @@ static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt,
 
 				if (psta) {
 					struct net_device *pnetdev = (struct net_device *)padapter->pnetdev;
-					/* skb->ip_summed = CHECKSUM_NONE; */
 					pkt->dev = pnetdev;
 					skb_set_queue_mapping(pkt, rtw_recv_select_queue(pkt));
 
@@ -1773,9 +1733,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	union recv_frame *pnextrframe;
 	struct rx_pkt_attrib *pnextattrib;
 
-	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-	/* spin_lock(&ppending_recvframe_queue->lock); */
-
 	phead = get_list_head(ppending_recvframe_queue);
 	plist = get_next(phead);
 
@@ -1787,22 +1744,15 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			plist = get_next(plist);
 		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
 			/* Duplicate entry is found!! Do not insert current entry. */
-			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
 		else
 			break;
 	}
 
-	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-	/* spin_lock(&ppending_recvframe_queue->lock); */
-
 	list_del_init(&(prframe->u.hdr.list));
 
 	list_add_tail(&(prframe->u.hdr.list), plist);
 
-	/* spin_unlock(&ppending_recvframe_queue->lock); */
-	/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
-
 	return true;
 }
 
@@ -1848,22 +1798,16 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 	struct list_head *phead, *plist;
 	union recv_frame *prframe;
 	struct rx_pkt_attrib *pattrib;
-	/* u8 index = 0; */
 	int bPktInBuf = false;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
 
-	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-	/* spin_lock(&ppending_recvframe_queue->lock); */
-
 	phead =	get_list_head(ppending_recvframe_queue);
 	plist = get_next(phead);
 
 	/*  Handling some condition for forced indicate case. */
 	if (bforced) {
 		if (list_empty(phead)) {
-			/*  spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
-			/* spin_unlock(&ppending_recvframe_queue->lock); */
 			return true;
 		}
 
@@ -1886,9 +1830,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			if (SN_EQUAL(preorder_ctrl->indicate_seq, pattrib->seq_num))
 				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
 
-			/* Set this as a lock to make sure that only one thread is indicating packet. */
-			/* pTS->RxIndicateState = RXTS_INDICATE_PROCESSING; */
-
 			/*  Indicate packets */
 
 			/* indicate this recv_frame */
@@ -1914,9 +1855,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 		}
 	}
 
-	/* spin_unlock(&ppending_recvframe_queue->lock); */
-	/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
-
 	return bPktInBuf;
 }
 
@@ -1971,8 +1909,6 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 	/* s3. Insert all packet into Reorder Queue to maintain its ordering. */
 	if (!enqueue_reorder_recvframe(preorder_ctrl, prframe)) {
-		/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
-		/* return _FAIL; */
 		goto _err_exit;
 	}
 
@@ -1986,7 +1922,6 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	/*  2. All packets with SeqNum larger than or equal to WinStart => Buffer it. */
 	/*  */
 
-	/* recv_indicatepkts_in_order(padapter, preorder_ctrl, true); */
 	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false)) {
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 		spin_unlock_bh(&ppending_recvframe_queue->lock);
@@ -2024,14 +1959,10 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame *prframe)
 {
 	int retval = _SUCCESS;
-	/* struct recv_priv *precvpriv = &padapter->recvpriv; */
-	/* struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib; */
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
 	if (phtpriv->ht_option) { /* B/G/N Mode */
-		/* prframe->u.hdr.preorder_ctrl = &precvpriv->recvreorder_ctrl[pattrib->priority]; */
-
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
 			if (!padapter->driver_stopped &&
-- 
2.34.1

