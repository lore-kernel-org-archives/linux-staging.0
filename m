Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A7D381EB9
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786990720; cv=none; b=k/yOElGZMemv7Jw3TNCCrOSrH+fcV/XIX4u5ibdK5Hp8HfuuzEY3cvGXgFSrzejkbK0FBY9OAI6zjZLn6kpz1B6sF4udEzXrMK/5ICZ8cCb2Bqj+4A3/xs2X2gW1RRTcU8BOtWhYVuoQ6GYC/XdUnPs3Qoj+snnJPfZYr61giJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786990720; c=relaxed/simple;
	bh=rdkeCajBmMZTADKBFQPi1sTSPywVV38C1ZpRdepyzzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRCHI6mTjHwMLWpJcRYeinGK2a7wqKI9PGUaIv9B/2nPFujrgtqWEgtl6yxrLnCqtnN5CD/OgrazDzqi2z+3AzBK6YJy/L3EeJ91nYFR8gDG8IAhHkHnziOMyUiuTif4CoNKzAoMz202A1j6ZjTE5tiYjZb8WjWIlFQg1vkfyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l99qo5JQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l99qo5JQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so3072695f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786990717; x=1787595517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cD9GKsaIpfB68UOVDKe7TxZniKmZ3ROWSluB24QwKC8=;
        b=l99qo5JQ5FstMbY2ttHnxp0JTFFttoetRpTufHTv184o6osClJI4dauQe+2vk3xzRr
         UVGMn/l3+/DrO9+DEa09RjD6hdLxbo+fXPtICSWupfFivwOYGy3OZCpxyh4375MkfamE
         mq5m5DrdkLdtiL5xMqN18HdItU1x6+dV0jDLkcxPEYcGMeUeFb8JOP8Z/RFpqJgQY+qO
         5FNhrZMD29nEz4EryMgooKUe4JI6KwB0TXNCY2JBdUF0GqOaUg3mHG0mmh3ZHH1+Sjyi
         pOCvavC7Hxn4ZubdC14Z3fpme2IxDBSUSUXhmbp9lthx22RT9hfPhjHc7/2kfZ22dBJ+
         H1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786990717; x=1787595517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD9GKsaIpfB68UOVDKe7TxZniKmZ3ROWSluB24QwKC8=;
        b=OqBwMRDwLzOsa0Xmi/nK6pvLJ3lKKphtQjHO0Dyno/6Fto7cuFgG4UPNWzYoFRJlA9
         YmPKia+N6aKkzX+7aIXy5+y2QfbFms3h76Mwv0buVH19boKJo5qUTojK9s14tG1BIbQC
         HLlZqXJ13TcVQJNFjIhhw38ScJ+c2wU5VNPvLeJLdr7qNRT8mNgdEzzB2X9qYiPnS0hN
         ETy0QdYZoR4OnSSVwRPwOXjYjGy55Nx1IXtNP4Z6inzmh7PoiqXDTtUZTr7flvbftYe3
         E+IBz1aPeN0W6N8d9gZvMCN92s23OBGFrZkeM9IuXeNSdBJrwUzv2i9LSuZ3d5qBHL9h
         OnCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl9cIFtsSJs0pGeXOcVN5aAdl9iOwTwN1B++wk9w9TUtbZ20YlkljO5861DlUbYD91nOSpOpGibZP8a9GZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwKNtqb7qohCIdr31XDD6b0grmik4aduxDwsZ4I8bM5mmdsWXpP
	he7C2ABzlDlbOfmNopawFGCGHV9anGkSi3Jgq4HftJz96Q7hnNb+hvqF17KK6A==
X-Gm-Gg: AR+sD13go21GyaN/0mhGNyx43TBtKcjDgRKLYxD/4JG4bwPmHbgi6SvgHJdASR/KwEc
	vJfEfiaxGlB8R3N7Tx//qG6YuyNFvcKdi9Ig7vYlH5s5By7WwQ/NAOalQqG0KkQ2s2g3pJ/cO3l
	wpQcuysx5ZvMkZNEkh0+SsXIJfzRtLZ7noXXIMGrcU6ly9OykPd153fv8iip5S1cfb0iC2npiXH
	0Nrzr+4XQ6eRNpRRHDgKe3DP/xNWWdVQoTMm9AWlQULnC37bLGiXDY4MlfgS6+7jeFb8WoEjY6j
	OgknuBg027EHdklElB+rTN/j5ekypTopA/iTT1A8oi27YudZNnr5tVdfW3h2H9n5Vr9BJVs1BgS
	O+R/crRitn8vlzwDPYeKbnyqeurxIE57Qcfr9K0BNJhPYxArL1hc8T7zV/Da4XzlcnVTk86O8w8
	VOVGJ1aGHR9kY9RxJt2llC19ywLdRuXUle2FroJx2BF+4IJI2i18r6x0KM8An0pcJeuu54jgOTf
	G32zEZwHtn72QUoPVtDTDK/MOibjPCRpoUv6jcsVB5PglnvC0zmxPIkwnFILPtj2wva777O2Rbc
	isgwUVdw
X-Received: by 2002:adf:e00e:0:10b0:482:aa2a:52f7 with SMTP id ffacd0b85a97d-482aa2a53ebmr714531f8f.6.1786990716864;
        Mon, 17 Aug 2026 11:18:36 -0700 (PDT)
Received: from koolguy.fritz.box (dynamic-2a02-3100-2d9f-0300-53dd-d4ea-3fef-ad87.310.pool.telefonica.de. [2a02:3100:2d9f:300:53dd:d4ea:3fef:ad87])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a7168bbesm4375307f8f.0.2026.08.17.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 11:18:36 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Removing unnecessary whitespaces
Date: Mon, 17 Aug 2026 18:16:13 +0000
Message-ID: <20260817181613.9431-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary whitespace to improve readability and coding style
consistency.

No functional changes are intended in this patch.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 46 +++++-----
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 12 +--
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 69 +++++++--------
 drivers/staging/rtl8723bs/include/sta_info.h  | 88 +++++++++----------
 4 files changed, 105 insertions(+), 110 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7568fc514d7c..3428f4ee0fa7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -29,7 +29,7 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 {
 	signed int i;
 	union recv_frame *precvframe;
-	signed int	res = _SUCCESS;
+	signed int res = _SUCCESS;
 
 	spin_lock_init(&precvpriv->lock);
 
@@ -89,7 +89,7 @@ void _rtw_free_recv_priv(struct recv_priv *precvpriv)
 {
 	signed int i;
 	union recv_frame *precvframe;
-	struct adapter	*padapter = precvpriv->adapter;
+	struct adapter *padapter = precvpriv->adapter;
 
 	rtw_free_uc_swdec_pending_queue(padapter);
 
@@ -111,8 +111,8 @@ void _rtw_free_recv_priv(struct recv_priv *precvpriv)
 
 union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 {
-	union recv_frame  *precvframe;
-	struct list_head	*plist, *phead;
+	union recv_frame *precvframe;
+	struct list_head *plist, *phead;
 	struct adapter *padapter;
 	struct recv_priv *precvpriv;
 
@@ -138,7 +138,7 @@ union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 
 union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 {
-	union recv_frame  *precvframe;
+	union recv_frame *precvframe;
 
 	spin_lock_bh(&pfree_recv_queue->lock);
 
@@ -213,10 +213,10 @@ signed int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *q
  *
  */
 
-void rtw_free_recvframe_queue(struct __queue *pframequeue,  struct __queue *pfree_recv_queue)
+void rtw_free_recvframe_queue(struct __queue *pframequeue, struct __queue *pfree_recv_queue)
 {
-	union	recv_frame	*precvframe;
-	struct list_head	*plist, *phead;
+	union recv_frame *precvframe;
+	struct list_head *plist, *phead;
 
 	spin_lock(&pframequeue->lock);
 
@@ -273,7 +273,7 @@ signed int rtw_enqueue_recvbuf(struct recv_buf *precvbuf, struct __queue *queue)
 struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
 {
 	struct recv_buf *precvbuf;
-	struct list_head	*plist, *phead;
+	struct list_head *plist, *phead;
 
 	spin_lock_bh(&queue->lock);
 
@@ -298,7 +298,7 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 {
 	enum nl80211_key_type key_type = 0;
 	union iwreq_data wrqu;
-	struct iw_michaelmicfailure    ev;
+	struct iw_michaelmicfailure ev;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	unsigned long cur_time = 0;
@@ -340,7 +340,7 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 
 static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *precvframe)
 {
-	signed int	i, res = _SUCCESS;
+	signed int i, res = _SUCCESS;
 	u32 datalen;
 	u8 miccode[8];
 	u8 bmic_err = false, brpt_micerror = true;
@@ -977,7 +977,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 		}
 
 		if ((psta->state & WIFI_SLEEP_STATE) && (pstapriv->sta_dz_bitmap & BIT(psta->aid))) {
-			struct list_head	*xmitframe_plist, *xmitframe_phead;
+			struct list_head *xmitframe_plist, *xmitframe_phead;
 			struct xmit_frame *pxmitframe = NULL;
 			struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
@@ -1045,12 +1045,12 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 static union recv_frame *recvframe_defrag(struct adapter *adapter,
 					  struct __queue *defrag_q)
 {
-	struct list_head	 *plist, *phead;
-	u8  wlanhdr_offset;
+	struct list_head *plist, *phead;
+	u8 wlanhdr_offset;
 	u8 curfragnum;
 	struct recv_frame_hdr *pfhdr, *pnfhdr;
 	union recv_frame *prframe, *pnextrframe;
-	struct __queue	*pfree_recv_queue;
+	struct __queue *pfree_recv_queue;
 
 	curfragnum = 0;
 	pfree_recv_queue = &adapter->recvpriv.free_recv_queue;
@@ -1262,7 +1262,7 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	u8 *psa, *pda, *pbssid;
 	struct sta_info *psta = NULL;
 	u8 *ptr = precv_frame->u.hdr.rx_data;
-	struct rx_pkt_attrib	*pattrib = &precv_frame->u.hdr.attrib;
+	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	signed int ret = _SUCCESS;
 
@@ -1509,13 +1509,13 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 /* remove the wlanhdr and add the eth_hdr */
 static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 {
-	signed int	rmv_len;
+	signed int rmv_len;
 	u16 eth_type, len;
 	u8 bsnaphdr;
 	u8 *psnap_type;
-	struct ieee80211_snap_hdr	*psnap;
+	struct ieee80211_snap_hdr *psnap;
 	__be16 be_tmp;
-	struct adapter			*adapter = precvframe->u.hdr.adapter;
+	struct adapter *adapter = precvframe->u.hdr.adapter;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	u8 *ptr = precvframe->u.hdr.rx_data; /*  point to frame_ctrl field */
 	struct rx_pkt_attrib *pattrib = &precvframe->u.hdr.attrib;
@@ -1523,7 +1523,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	if (pattrib->encrypt)
 		recvframe_pull_tail(precvframe, pattrib->icv_len);
 
-	psnap = (struct ieee80211_snap_hdr	*)(ptr + pattrib->hdrlen + pattrib->iv_len);
+	psnap = (struct ieee80211_snap_hdr *)(ptr + pattrib->hdrlen + pattrib->iv_len);
 	psnap_type = ptr + pattrib->hdrlen + pattrib->iv_len + SNAP_SIZE;
 	/* convert hdr + possible LLC headers into Ethernet header */
 	/* eth_type = (psnap_type[0] << 8) | psnap_type[1]; */
@@ -1664,7 +1664,7 @@ static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt,
 
 static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 {
-	int	a_len, padding_len;
+	int a_len, padding_len;
 	u16 subframe_len;
 	u8 nr_subframes, i;
 	u8 *pdata;
@@ -1844,7 +1844,7 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
 
 static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reorder_ctrl *preorder_ctrl, int bforced)
 {
-	struct list_head	*phead, *plist;
+	struct list_head *phead, *plist;
 	union recv_frame *prframe;
 	struct rx_pkt_attrib *pattrib;
 	/* u8 index = 0; */
@@ -1855,7 +1855,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
-	phead =		get_list_head(ppending_recvframe_queue);
+	phead =	get_list_head(ppending_recvframe_queue);
 	plist = get_next(phead);
 
 	/*  Handling some condition for forced indicate case. */
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 179fae4d8fcc..0f6112d6b7d3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -207,22 +207,22 @@ enum {
 };
 
 struct mlme_handler {
-	unsigned int   num;
+	unsigned int num;
 	char *str;
 	unsigned int (*func)(struct adapter *padapter, union recv_frame *precv_frame);
 };
 
 struct action_handler {
-	unsigned int   num;
+	unsigned int num;
 	char *str;
 	unsigned int (*func)(struct adapter *padapter, union recv_frame *precv_frame);
 };
 
 struct	ss_res {
-	int	state;
-	int	bss_cnt;
-	int	channel_idx;
-	int	scan_mode;
+	int state;
+	int bss_cnt;
+	int channel_idx;
+	int scan_mode;
 	u8 ssid_num;
 	u8 ch_num;
 	struct ndis_802_11_ssid ssid[RTW_SSID_SCAN_AMOUNT];
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 9c32d480a20a..5c197bd6915f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -70,26 +70,26 @@ struct phy_info {
 	u8 rx_pwd_ba11;
 
 	u8 SignalQuality;	 /*  in 0-100 index. */
-	s8		rx_mimo_signal_quality[4];	/* per-path's EVM */
+	s8 rx_mimo_signal_quality[4];	/* per-path's EVM */
 	u8 RxMIMOEVMdbm[4];		/* per-path's EVM dbm */
 
 	u8 rx_mimo_signal_strength[4];/*  in 0~100 index */
 
-	u16 	Cfo_short[4];			/*  per-path's Cfo_short */
-	u16 	Cfo_tail[4];			/*  per-path's Cfo_tail */
+	u16 Cfo_short[4];			/*  per-path's Cfo_short */
+	u16 Cfo_tail[4];			/*  per-path's Cfo_tail */
 
-	s8		RxPower; /*  in dBm Translate from PWdB */
-	s8		RecvSignalPower;/*  Real power in dBm for this packet, no beautification and aggregation. Keep this raw info to be used for the other procedures. */
+	s8 RxPower; /*  in dBm Translate from PWdB */
+	s8 RecvSignalPower;/*  Real power in dBm for this packet, no beautification and aggregation. Keep this raw info to be used for the other procedures. */
 	u8 bt_rx_rssi_percentage;
 	u8 SignalStrength; /*  in 0-100 index. */
 
-	s8		RxPwr[4];				/* per-path's pwdb */
+	s8 RxPwr[4];				/* per-path's pwdb */
 	u8 RxSNR[4];				/* per-path's SNR */
 	u8 BandWidth;
 	u8 btCoexPwrAdjust;
 };
 
-struct rx_pkt_attrib	{
+struct rx_pkt_attrib {
 	u16 pkt_len;
 	u8 physt;
 	u8 drvinfo_sz;
@@ -170,22 +170,22 @@ accesser of recv_priv: rtw_recv_entry(dispatch / passive level); recv_thread(pas
 using enter_critical section to protect
 */
 struct recv_priv {
-	spinlock_t	lock;
-	struct __queue	free_recv_queue;
-	struct __queue	recv_pending_queue;
-	struct __queue	uc_swdec_pending_queue;
+	spinlock_t lock;
+	struct __queue free_recv_queue;
+	struct __queue recv_pending_queue;
+	struct __queue uc_swdec_pending_queue;
 	u8 *pallocated_frame_buf;
 	u8 *precv_frame_buf;
 	uint free_recvframe_cnt;
-	struct adapter	*adapter;
+	struct adapter *adapter;
 	u32 bIsAnyNonBEPkts;
-	u64	rx_bytes;
-	u64	rx_pkts;
-	u64	rx_drop;
-	uint  rx_icv_err;
-	uint  rx_largepacket_crcerr;
-	uint  rx_smallpacket_crcerr;
-	uint  rx_middlepacket_crcerr;
+	u64 rx_bytes;
+	u64 rx_pkts;
+	u64 rx_drop;
+	uint rx_icv_err;
+	uint rx_largepacket_crcerr;
+	uint rx_smallpacket_crcerr;
+	uint rx_middlepacket_crcerr;
 
 	struct tasklet_struct irq_prepare_beacon_tasklet;
 	struct tasklet_struct recv_tasklet;
@@ -194,10 +194,10 @@ struct recv_priv {
 
 	u8 *pallocated_recv_buf;
 	u8 *precv_buf;    /*  4 alignment */
-	struct __queue	free_recv_buf_queue;
+	struct __queue free_recv_buf_queue;
 	u32 free_recv_buf_queue_cnt;
 
-	struct __queue	recv_buf_pending_queue;
+	struct __queue recv_buf_pending_queue;
 
 	/* For display the phy information */
 	u8 is_signal_dbg;	/*  for debug */
@@ -212,7 +212,6 @@ struct recv_priv {
 	/* s8 RxRssi[2]; */
 	/* int FalseAlmCnt_all; */
 
-
 	struct timer_list signal_stat_timer;
 	u32 signal_stat_sampling_interval;
 	/* u32 signal_stat_converging_constant; */
@@ -224,13 +223,13 @@ struct recv_priv {
 
 struct sta_recv_priv {
 
-	spinlock_t	lock;
-	signed int	option;
+	spinlock_t lock;
+	signed int option;
 
 	/* struct __queue	blk_strms[MAX_RX_NUMBLKS]; */
 	struct __queue defrag_q;	 /* keeping the fragment frame until defrag */
 
-	struct	stainfo_rxcache rxcache;
+	struct stainfo_rxcache rxcache;
 
 	/* uint	sta_rx_bytes; */
 	/* uint	sta_rx_pkts; */
@@ -238,7 +237,6 @@ struct sta_recv_priv {
 
 };
 
-
 struct recv_buf {
 	struct list_head list;
 
@@ -257,7 +255,7 @@ struct recv_buf {
 	u8 *ptail;
 	u8 *pend;
 
-	struct sk_buff	*pskb;
+	struct sk_buff *pskb;
 	u8 reuse;
 };
 
@@ -278,11 +276,11 @@ struct recv_buf {
 
 */
 struct recv_frame_hdr {
-	struct list_head	list;
-	struct sk_buff	 *pkt;
-	struct sk_buff	 *pkt_newalloc;
+	struct list_head list;
+	struct sk_buff *pkt;
+	struct sk_buff *pkt_newalloc;
 
-	struct adapter  *adapter;
+	struct adapter *adapter;
 
 	u8 fragcnt;
 
@@ -290,7 +288,7 @@ struct recv_frame_hdr {
 
 	struct rx_pkt_attrib attrib;
 
-	uint  len;
+	uint len;
 	u8 *rx_head;
 	u8 *rx_data;
 	u8 *rx_tail;
@@ -306,7 +304,6 @@ struct recv_frame_hdr {
 	struct recv_reorder_ctrl *preorder_ctrl;
 };
 
-
 union recv_frame {
 	union{
 		struct list_head list;
@@ -328,7 +325,7 @@ enum {
 
 extern union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
 extern union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
-extern int	 rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
+extern int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
 
 extern int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
 extern int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
@@ -438,7 +435,7 @@ static inline signed int get_recvframe_len(union recv_frame *precvframe)
 
 static inline s32 translate_percentage_to_dbm(u32 SignalStrengthIndex)
 {
-	s32	SignalPower; /*  in dBm. */
+	s32 SignalPower; /*  in dBm. */
 
 	/*  Translate to dBm (x = 0.5y-95). */
 	SignalPower = (s32)((SignalStrengthIndex + 1) >> 1);
@@ -452,6 +449,6 @@ struct sta_info;
 
 extern void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
 
-extern void  mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame);
+extern void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 0f53e77c110c..bc78c32192c0 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -28,50 +28,50 @@ struct wlan_acl_pool {
 	int mode;
 	int num;
 	struct rtw_wlan_acl_node aclnode[NUM_ACL];
-	struct __queue	acl_node_q;
+	struct __queue acl_node_q;
 };
 
 struct rssi_sta {
-	s32	UndecoratedSmoothedPWDB;
-	s32	UndecoratedSmoothedCCK;
-	s32	UndecoratedSmoothedOFDM;
-	u64	PacketMap;
+	s32 UndecoratedSmoothedPWDB;
+	s32 UndecoratedSmoothedCCK;
+	s32 UndecoratedSmoothedOFDM;
+	u64 PacketMap;
 	u8 ValidBit;
 };
 
-struct	stainfo_stats	{
+struct stainfo_stats {
 
 	u64 rx_mgnt_pkts;
-		u64 rx_beacon_pkts;
-		u64 rx_probereq_pkts;
-		u64 rx_probersp_pkts;
-		u64 rx_probersp_bm_pkts;
-		u64 rx_probersp_uo_pkts;
+	u64 rx_beacon_pkts;
+	u64 rx_probereq_pkts;
+	u64 rx_probersp_pkts;
+	u64 rx_probersp_bm_pkts;
+	u64 rx_probersp_uo_pkts;
 	u64 rx_ctrl_pkts;
 	u64 rx_data_pkts;
 
-	u64	last_rx_mgnt_pkts;
-		u64 last_rx_beacon_pkts;
-		u64 last_rx_probereq_pkts;
-		u64 last_rx_probersp_pkts;
-		u64 last_rx_probersp_bm_pkts;
-		u64 last_rx_probersp_uo_pkts;
-	u64	last_rx_ctrl_pkts;
-	u64	last_rx_data_pkts;
-
-	u64	rx_bytes;
-	u64	rx_drops;
-
-	u64	tx_pkts;
-	u64	tx_bytes;
-	u64  tx_drops;
+	u64 last_rx_mgnt_pkts;
+	u64 last_rx_beacon_pkts;
+	u64 last_rx_probereq_pkts;
+	u64 last_rx_probersp_pkts;
+	u64 last_rx_probersp_bm_pkts;
+	u64 last_rx_probersp_uo_pkts;
+	u64 last_rx_ctrl_pkts;
+	u64 last_rx_data_pkts;
+
+	u64 rx_bytes;
+	u64 rx_drops;
+
+	u64 tx_pkts;
+	u64 tx_bytes;
+	u64 tx_drops;
 };
 
 struct sta_info {
 
-	spinlock_t	lock;
-	struct list_head	list; /* free_sta_queue */
-	struct list_head	hash_list; /* sta_hash */
+	spinlock_t lock;
+	struct list_head list; /* free_sta_queue */
+	struct list_head hash_list; /* sta_hash */
 	struct adapter *padapter;
 
 	struct sta_xmit_priv sta_xmitpriv;
@@ -87,19 +87,18 @@ struct sta_info {
 	u8 hwaddr[ETH_ALEN];
 
 	bool ieee8021x_blocked;
-	uint	dot118021XPrivacy; /* aes, tkip... */
-	union Keytype	dot11tkiptxmickey;
-	union Keytype	dot11tkiprxmickey;
-	union Keytype	dot118021x_UncstKey;
-	union pn48		dot11txpn;			/*  PN48 used for Unicast xmit */
-	union pn48		dot11wtxpn;			/*  PN48 used for Unicast mgmt xmit. */
-	union pn48		dot11rxpn;			/*  PN48 used for Unicast recv. */
-
+	uint dot118021XPrivacy; /* aes, tkip... */
+	union Keytype dot11tkiptxmickey;
+	union Keytype dot11tkiprxmickey;
+	union Keytype dot118021x_UncstKey;
+	union pn48 dot11txpn;			/*  PN48 used for Unicast xmit */
+	union pn48 dot11wtxpn;			/*  PN48 used for Unicast mgmt xmit. */
+	union pn48 dot11rxpn;			/*  PN48 used for Unicast recv. */
 
 	u8 bssrateset[16];
 	u32 bssratelen;
-	s32  rssi;
-	s32	signal_quality;
+	s32 rssi;
+	s32 signal_quality;
 
 	u8 cts2self;
 	u8 rtsen;
@@ -125,7 +124,6 @@ struct sta_info {
 	/* unsigned char 	ampdu_txen_bitmap; */
 	u16 BA_starting_seqctrl[16];
 
-
 	struct ht_priv htpriv;
 
 	/* Notes: */
@@ -186,7 +184,7 @@ struct sta_info {
 	u32 assoc_req_len;
 
 	/* for DM */
-	struct rssi_sta	 rssi_stat;
+	struct rssi_sta	rssi_stat;
 
 	/* ODM_STA_INFO_T */
 	/*  ================ODM Relative Info ======================= */
@@ -254,14 +252,14 @@ struct sta_info {
 
 #define STA_PKTS_FMT "(m:%llu, c:%llu, d:%llu)"
 
-struct	sta_priv {
+struct sta_priv {
 
 	u8 *pallocated_stainfo_buf;
 	u8 *pstainfo_buf;
-	struct __queue	free_sta_queue;
+	struct __queue free_sta_queue;
 
 	spinlock_t sta_hash_lock;
-	struct list_head   sta_hash[NUM_STA];
+	struct list_head sta_hash[NUM_STA];
 	int asoc_sta_count;
 	struct __queue sleep_q;
 	struct __queue wakeup_q;
@@ -319,7 +317,7 @@ extern u32 _rtw_free_sta_priv(struct sta_priv *pstapriv);
 int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta);
 struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int offset);
 
-extern struct sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr);
+extern struct sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
 extern u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta);
 extern void rtw_free_all_stainfo(struct adapter *padapter);
 extern struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
-- 
2.55.0

