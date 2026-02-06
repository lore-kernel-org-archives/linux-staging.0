Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C6348883
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364517; cv=none; b=s5zmdjByl/7G6fy2z/eLZFp1Rdgpvi4digerMnlBOQlbzlWzbvHhFa1ocus5gdcVHxoIENcTMu21ToNHSyKzcExU9f3LJWjbGejJEPPjplXEimpQ0ktUyoyPZYCB4lL+spNwCJQBR8PzRG0iXat6SKwQN7sSAGkC7UwpIut9mvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364517; c=relaxed/simple;
	bh=apGCEg41N/2hmADje7Vq1oBVnf5A9ngqojDtCDVvYL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahK3sN3+6imuim8EYCX9jJECNvBipdm4K9NyJaPJeHhMzwVMmKKwSdMnjDgOOQwMopwwGRuXeiLOZdXGCppTSTXjf0bTVYcsA3gqkFb6RTeNYsn78mLjWTGArpmpDqZ0+6cbaNSZDxotj8BG9MRa22ImVUXC0BBlxLi9Zy/9E+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNK2DatQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNK2DatQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43596062728so2007853f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364516; x=1770969316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uG18KWWpeVRGE5n/fllYKO4ZAPukL1WCC2h6WbjieA4=;
        b=QNK2DatQeifLuo4IsoJRT6BygjpZL5TsEuskYwIIyMqqG1+12dHeigsXjtJMu2Sg7q
         PauTK3UICSCYpcoco9NPGLObr5xL8PdwKsLbUnA94LmDzMtrfveqyETKvF8kGmie67pV
         7mf1DQ/2204kf51fq8p8977IyaQnYtR3BcW2ectoR6kNCQZcQl/Ec1wIHBzoTpbcTUDi
         V+4tvYroPlTfYV1lcP9Y7Q6q/5oe7n6rNwvHLEuSr35m1FEirGogHwOl8bVHHD52a/R9
         Q/NDcYCBoqnq0zz8TCYiWtEiExEr8HbzchtHioadR1l7rYaaLBjtGAYXICBncwxkGSaL
         mZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364516; x=1770969316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uG18KWWpeVRGE5n/fllYKO4ZAPukL1WCC2h6WbjieA4=;
        b=xA0hkdAkIYq5jC+/wHeOps3w0BZRI2CTofFJpTaaBB4b5qRyOTQNBiI5St9cf8QO4O
         /zDdIG3Qrck9c9s/Li5O2LppO4JKWz2ZE48hVHf7ca5k/bts9svYNsr89Hnytrwbcj/i
         ifDRRoTu9xN34vcz9YIUaBuwnlP6saMw1RPFt9NYZbACiPLsQ5zqPZS809gT5PdhwH88
         zBtIPfPNxES+fi3e2hBefTH6nngQQmQx/TwumU8xQbQWglW3++me3C4NMVVPBBBcQuSU
         KnAeiy3v0CFFYmtJ0aJ6hrbI8+9Gm69xNeVboCZFAwCmwCv0SDYOBEDor6U6psU6lVYn
         d1wA==
X-Forwarded-Encrypted: i=1; AJvYcCV5nHTnCZgQol3ZRblIZMYqY1YLKBddeE5TFzOQJgivmQaiRi7QsGLwa234qK+UckkawblLHerHTwj9F9xy@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd2XfxeQ44WrhHRw96bZyOG1rzImRjCds/etYxCA0cbZt5JSAJ
	i+iZsJwqUgWAVP6YDJEnBvjWMySAgLDIk8NzUvROAFMiXIUsdnr8DDpyk0f4dig=
X-Gm-Gg: AZuq6aJTtXkNAmKAiEZFrQXNFC0x0YMZVWKSUmsiaKdTcTzAWpO1rY0TGewvcF9KEOO
	DsW9HfuqDbwFJy2HZ/AOXIp/FosN7aooYSZmBVAK+vn34br+RCdBgGH7GMvGEWkth2VbcbSMVi7
	nHY5/62tXXM6F5xpNNw1SA4x6KxtAo+aQEGeD7yWUpF0/vHHrxGSuTYiD2c0sdAgBYwE99c5jUv
	MT6QOgOZdxZuS5ok5jyBpJB3CulFXCKdlvBwcohPE3sLU+QiiIkYVLidSRPXTchx8oex5XDRVvJ
	tfsW886UMGMLpjv6cwFYfzNN68B5SCXujSI7/eqbCS45aB6uYgitnfv/iuGUFy22RVMC7e6EjCg
	epykUIr1aeZ/PqJnnsQj1dCuwOifnZT0hebH468PA0puk+c9zj+n1h9sUmhRqlRpvQl0bOzumad
	saLTjGil0KLE7OKCg+3oVVFs1QGXqgntJ9OxxF1FJ4pH86dlL8sxZbQvR9HAAWMFmhOIGXw2+lb
	w==
X-Received: by 2002:a05:6000:2902:b0:435:9e81:105e with SMTP id ffacd0b85a97d-4362933ed0fmr2710216f8f.19.1770364515681;
        Thu, 05 Feb 2026 23:55:15 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:14 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 13/26] staging: rtl8723bs: core: fix line lengths in rtw_recv.c
Date: Fri,  6 Feb 2026 08:54:26 +0100
Message-ID: <20260206075439.103287-14-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 123 ++++++++++++++--------
 1 file changed, 82 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 0a8725686721..d69906a21b74 100644
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
 
@@ -1816,7 +1847,8 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	return true;
 }
 
-static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, union recv_frame *prframe)
+static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl,
+				     union recv_frame *prframe)
 {
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
@@ -1861,7 +1893,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 
 }
 
-static void recv_indicatepkts_pkt_loss_cnt(struct debug_priv *pdbgpriv, u64 prev_seq, u64 current_seq)
+static void recv_indicatepkts_pkt_loss_cnt(struct debug_priv *pdbgpriv,
+					   u64 prev_seq, u64 current_seq)
 {
 	if (current_seq < prev_seq)
 		pdbgpriv->dbg_rx_ampdu_loss_count += (4096 + current_seq - prev_seq);
@@ -1907,7 +1940,9 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
 	return _FAIL;
 }
 
-static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reorder_ctrl *preorder_ctrl, int bforced)
+static int recv_indicatepkts_in_order(struct adapter *padapter,
+				      struct recv_reorder_ctrl *preorder_ctrl,
+				      int bforced)
 {
 	struct list_head	*phead, *plist;
 	union recv_frame *prframe;
@@ -2115,7 +2150,8 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 	if (phtpriv->ht_option == true) { /* B/G/N Mode */
 		/* prframe->u.hdr.preorder_ctrl = &precvpriv->recvreorder_ctrl[pattrib->priority]; */
 
-		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
+		/* including perform A-MPDU Rx Ordering Buffer Control */
+		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) {
 
 			if ((padapter->bDriverStopped == false) &&
 			    (padapter->bSurpriseRemoved == false)) {
@@ -2274,12 +2310,15 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
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
@@ -2297,9 +2336,11 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
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

