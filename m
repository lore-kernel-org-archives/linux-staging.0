Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44493349AFC
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548509; cv=none; b=PYDif+30RFbv5Qq/MQrUEH6d6APc9FCcElP08sCpzu5B0SdH8rDxDtlQuK5M0+pjTiFKIAhYWWbWnezisu6hpAeRSvkxDADUHD6C052+A6fTu25NitjTh4iusIb0uGgMTFk4WRK+B8Tnv9sm21uGx8bPg14qXXtH+cCgJCUAQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548509; c=relaxed/simple;
	bh=jzBqcycqna+U5N1lpiyWbUwCRHxxFdgQIguCcwkwTxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/MvNaOSfVLuxYJLkevM+sTavq+4KHE+xwTZAOK2xZYDTqqpoS0/bS25Vp55TTmMflq/o6uR/ACLGldWohW/9oUMRAWyq4BuW6EvtWiQ8A56BCx9qvoSm5G+P9q9m5IFUdYyETyJzBQ2z47I5IxXXoLYsEvo0lczFzKqRjJ9ZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D/BMuNXy; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D/BMuNXy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzvOSzl1G9Mao9HuA20L4v2TRyJeuTyPYUd84kg/fBE=;
	b=D/BMuNXyF6UFdafX8MR1ys8+hwcMZO4bi538Xj5j2tzu/o30eVBGCBOZKqBEb2CSHDPyYa
	SZzdwI2bsN/lA3kJjYATsl2H4Jh8e/42KtmlDX8pYgD1lZLZQFgJzJelM+1CtEg2GP8wYQ
	o/8q+MLGLOvhkjNU1YpqsEISUhgFiy4=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 09/22] staging: rtl8723bs: core: fix line lengths in rtw_recv.c
Date: Sun,  8 Feb 2026 12:00:58 +0100
Message-ID: <20260208110111.46642-10-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 120 ++++++++++++++--------
 1 file changed, 80 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f..b71f3495d773 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -47,14 +47,23 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 
 	precvpriv->free_recvframe_cnt = NR_RECVFRAME;
 
-	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(union recv_frame) + RXFRAME_ALIGN_SZ);
+	{
+		size_t sz = NR_RECVFRAME * sizeof(union recv_frame) + RXFRAME_ALIGN_SZ;
+
+		precvpriv->pallocated_frame_buf = vzalloc(sz);
+	}
 
 	if (!precvpriv->pallocated_frame_buf) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	precvpriv->precv_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(precvpriv->pallocated_frame_buf), RXFRAME_ALIGN_SZ);
+	{
+		SIZE_PTR aligned = N_BYTE_ALIGMENT((SIZE_PTR)(precvpriv->pallocated_frame_buf),
+						 RXFRAME_ALIGN_SZ);
+
+		precvpriv->precv_frame_buf = (u8 *)aligned;
+	}
 	/* precvpriv->precv_frame_buf = precvpriv->pallocated_frame_buf + RXFRAME_ALIGN_SZ - */
 	/* ((SIZE_PTR) (precvpriv->pallocated_frame_buf) &(RXFRAME_ALIGN_SZ-1)); */
 
@@ -390,11 +399,15 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				mickey = &stainfo->dot11tkiprxmickey.skey[0];
 			}
 
-			datalen = precvframe->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len-prxattrib->icv_len-8;/* icv_len included the mic code */
+			/* icv_len included the mic code */
+			datalen = precvframe->u.hdr.len - prxattrib->hdrlen -
+				  prxattrib->iv_len - prxattrib->icv_len - 8;
 			pframe = precvframe->u.hdr.rx_data;
-			payload = pframe+prxattrib->hdrlen+prxattrib->iv_len;
+			payload = pframe + prxattrib->hdrlen + prxattrib->iv_len;
 
-			rtw_seccalctkipmic(mickey, pframe, payload, datalen, &miccode[0], (unsigned char)prxattrib->priority); /* care the length of the data */
+			/* care the length of the data */
+			rtw_seccalctkipmic(mickey, pframe, payload, datalen,
+					   &miccode[0], (unsigned char)prxattrib->priority);
 
 			pframemic = payload+datalen;
 
@@ -409,7 +422,10 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			if (bmic_err == true) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if ((is_multicast_ether_addr(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
+				bool is_mcast = is_multicast_ether_addr(prxattrib->ra);
+				bool key_mismatch = prxattrib->key_index != pmlmeinfo->key_index;
+
+				if (is_mcast && key_mismatch)
 					brpt_micerror = false;
 
 				if (prxattrib->bdecrypted && brpt_micerror)
@@ -463,28 +479,37 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 		}
 	}
 
-	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt == true))) {
-		psecuritypriv->hw_decrypted = false;
+	{
+		bool need_decrypt = prxattrib->encrypt > 0;
+		bool not_decrypted = !prxattrib->bdecrypted;
+		bool sw_decrypt = psecuritypriv->sw_decrypt;
+		bool decrypted_ok;
 
-		switch (prxattrib->encrypt) {
-		case _WEP40_:
-		case _WEP104_:
-			rtw_wep_decrypt(padapter, (u8 *)precv_frame);
-			break;
-		case _TKIP_:
-			res = rtw_tkip_decrypt(padapter, (u8 *)precv_frame);
-			break;
-		case _AES_:
-			res = rtw_aes_decrypt(padapter, (u8 *)precv_frame);
-			break;
-		default:
+		if (need_decrypt && (not_decrypted || sw_decrypt)) {
+			psecuritypriv->hw_decrypted = false;
+
+			switch (prxattrib->encrypt) {
+			case _WEP40_:
+			case _WEP104_:
+				rtw_wep_decrypt(padapter, (u8 *)precv_frame);
+				break;
+			case _TKIP_:
+				res = rtw_tkip_decrypt(padapter, (u8 *)precv_frame);
+				break;
+			case _AES_:
+				res = rtw_aes_decrypt(padapter, (u8 *)precv_frame);
+				break;
+			default:
 				break;
+			}
+		} else {
+			decrypted_ok = prxattrib->bdecrypted == 1 &&
+				       prxattrib->encrypt > 0 &&
+				       (psecuritypriv->busetkipkey == 1 ||
+					prxattrib->encrypt != _TKIP_);
+			if (decrypted_ok)
+				psecuritypriv->hw_decrypted = true;
 		}
-	} else if (prxattrib->bdecrypted == 1 && prxattrib->encrypt > 0 &&
-		   (psecuritypriv->busetkipkey == 1 || prxattrib->encrypt != _TKIP_)
-		) {
-		psecuritypriv->hw_decrypted = true;
-	} else {
 	}
 
 	if (res == _FAIL) {
@@ -564,7 +589,8 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 	return prtnframe;
 }
 
-static signed int recv_decache(union recv_frame *precv_frame, u8 bretry, struct stainfo_rxcache *prxcache)
+static signed int recv_decache(union recv_frame *precv_frame, u8 bretry,
+			       struct stainfo_rxcache *prxcache)
 {
 	signed int tid = precv_frame->u.hdr.attrib.priority;
 
@@ -669,7 +695,8 @@ static void process_wmmps_data(struct adapter *padapter, union recv_frame *precv
 	}
 }
 
-static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe, struct sta_info *sta)
+static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
+			   struct sta_info *sta)
 {
 	int sz;
 	struct sta_info *psta = NULL;
@@ -1149,7 +1176,8 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 }
 
 /* check if need to defrag, if needed queue the frame to defrag_q */
-static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union recv_frame *precv_frame)
+static union recv_frame *recvframe_chk_defrag(struct adapter *padapter,
+					      union recv_frame *precv_frame)
 {
 	u8 ismfrag;
 	u8 fragnum;
@@ -1257,7 +1285,8 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 
 	{
 		/* for rx pkt statistics */
-		struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
+		u8 *addr2 = GetAddr2Ptr(precv_frame->u.hdr.rx_data);
+		struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, addr2);
 
 		if (psta) {
 			psta->sta_stats.rx_mgnt_pkts++;
@@ -1622,7 +1651,8 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	return _SUCCESS;
 }
 
-static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
+static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe,
+					  u16 nSubframe_Length, u8 *pdata)
 {
 	u16 eth_type;
 	struct sk_buff *sub_skb;
@@ -1662,7 +1692,8 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 	return sub_skb;
 }
 
-static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, struct rx_pkt_attrib *pattrib)
+static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt,
+				  struct rx_pkt_attrib *pattrib)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
@@ -1812,7 +1843,8 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	return true;
 }
 
-static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, union recv_frame *prframe)
+static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl,
+				     union recv_frame *prframe)
 {
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
@@ -1894,7 +1926,9 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
 	return _FAIL;
 }
 
-static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reorder_ctrl *preorder_ctrl, int bforced)
+static int recv_indicatepkts_in_order(struct adapter *padapter,
+				      struct recv_reorder_ctrl *preorder_ctrl,
+				      int bforced)
 {
 	struct list_head	*phead, *plist;
 	union recv_frame *prframe;
@@ -2093,7 +2127,8 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 	if (phtpriv->ht_option == true) { /* B/G/N Mode */
 		/* prframe->u.hdr.preorder_ctrl = &precvpriv->recvreorder_ctrl[pattrib->priority]; */
 
-		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
+		/* including perform A-MPDU Rx Ordering Buffer Control */
+		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) {
 
 			if ((padapter->bDriverStopped == false) &&
 			    (padapter->bSurpriseRemoved == false)) {
@@ -2252,12 +2287,15 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 	u8 avg_signal_qual = 0;
 	u32 num_signal_strength = 0;
 	u32 __maybe_unused num_signal_qual = 0;
-	u8 _alpha = 5; /*  this value is based on converging_constant = 5000 and sampling_interval = 1000 */
+	/* based on converging_constant = 5000 and sampling_interval = 1000 */
+	u8 _alpha = 5;
 
 	if (adapter->recvpriv.is_signal_dbg) {
 		/* update the user specific value, signal_strength_dbg, to signal_strength, rssi */
-		adapter->recvpriv.signal_strength = adapter->recvpriv.signal_strength_dbg;
-		adapter->recvpriv.rssi = (s8)translate_percentage_to_dbm((u8)adapter->recvpriv.signal_strength_dbg);
+		u8 strength_dbg = adapter->recvpriv.signal_strength_dbg;
+
+		adapter->recvpriv.signal_strength = strength_dbg;
+		adapter->recvpriv.rssi = (s8)translate_percentage_to_dbm(strength_dbg);
 	} else {
 
 		if (recvpriv->signal_strength_data.update_req == 0) {/*  update_req is clear, means we got rx */
@@ -2275,9 +2313,11 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 		}
 
 		if (num_signal_strength == 0) {
-			if (rtw_get_on_cur_ch_time(adapter) == 0 ||
-			    jiffies_to_msecs(jiffies - rtw_get_on_cur_ch_time(adapter)) < 2 * adapter->mlmeextpriv.mlmext_info.bcn_interval
-			) {
+			unsigned long on_ch_time = rtw_get_on_cur_ch_time(adapter);
+			u32 bcn_intvl = adapter->mlmeextpriv.mlmext_info.bcn_interval;
+
+			if (on_ch_time == 0 ||
+			    jiffies_to_msecs(jiffies - on_ch_time) < 2 * bcn_intvl) {
 				goto set_timer;
 			}
 		}
-- 
2.52.0

