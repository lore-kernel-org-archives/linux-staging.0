Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8BE286409
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639423; cv=none; b=F5fv+o+aLGlFnz016VPJ1KTNDhnz0sW+aINUtV9EFfzt2o9YCgDKDO9o+SlXu2gAfIs1YhUP++yx+UdNfLIwABiXeSKEEM+M8PwdVtid/PahnlLXvlR7A8APGgfc31NPbW9ZSB2B2hYJuQKBjVCEoMLHaE/nTFgV+uyi0RXBJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639423; c=relaxed/simple;
	bh=PoNl5ra+f0U67tujIj1s8rXFEi7Km9LNlMg67/0AyWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=am48jx/r1OkX/2pkGg3jAGnHw3kfSzrVslHaJiofrOVcSnRwY1CBnzfvFI42Gxf1fOqxyKeQgXZQXlzSZul5TpsO+zTkTGLfixZyThLPkLoBstICqjWFpjCLNhczUUIxA6no0GEOsWlhSDp7kXx3AGnNctVrT/z3pjkpx2DNKqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZMADjeq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZMADjeq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so491500f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 03:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789639403; x=1790244203; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/J4Rp8eRnaPGbAZF8oVjd3+a9JLUxp/weesAB0KEsHI=;
        b=CZMADjeqOcXvKruGtNpgk6d5vrhKVTFIwERxRuh+UCpw6gbRo3EYOpcVL8dxTgnmRm
         cFl2Bzl7gGwjjhOLa+4zntpTioLVrUwT6hsTJ7OyihXgF//qds12w/9JI1b2y50cYd1P
         v1SXZUwG2MFWw6Wb/wjXjrrXRGOxNOe63ulMav/KyDTMUGz3WXxcQnB8A9ufy+zVk6Ao
         /WgomQlnBzh2qg0zCAK4OOe11I+Ftryu4CVBlQSGrI3BzTYzhIO5X4cupnsuHpOXb7HK
         qh6N0pW+Y94tyMoHzWMeEreP2miXdVs/Mzl0/aphCCFkQodj+4O873yOiWGWaz9TuOk7
         VoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639403; x=1790244203;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/J4Rp8eRnaPGbAZF8oVjd3+a9JLUxp/weesAB0KEsHI=;
        b=nnSixvvKaibJcKMDhjfYrRfwkhecMBz7w1fNVq7uyEXupOma+ErKVkO1FAfysR8PrD
         PSRxyJxqIsRESQ26ktiqW2xq/HL4V7jAeSJTlFkDmQZPl0NZlOIFgKEvlmNQ46126g6t
         aF0MeSBMl1yUgQZlfee4whFAGAoa0R7HVKZO0MpDnWLZDmxOsoKPLO30/8Fe2yb4nYZz
         yAuIMGRt4WGqmQoR12OY++FOywENIFAftZy3eKaIOZGFRMsyq0x2a5OmaVpXxC+6K/Up
         v5QPRwC5NLGkgEG+4ecAsbwoHhKf7Tg/fo9RlpzNTAdM4MduIgGSLPAMBMAA708BGhJx
         C5bQ==
X-Gm-Message-State: AFuF++nQDV/d7iBH/oQuwZqPg/CJH6TsbXg8Rj6HRWanoJpOxBDXOW+o
	ubXySbtsuLbH/rtbwsyjo+HRANpptstPT2anE48XpZ4q2Jy25yPhcw70
X-Gm-Gg: AYBFou2yi+LlRKFTnlYlWugWlRbNDK+eiDFBzngODGYXFAheelfTdPwMy4kwNz+BaTZ
	Z/wuylZBkVgmRcB1EEnM0vJkAEKBeuFukJzsh7jD3oMQHeR9CuYt7LdTucOaPxTESNuyVFMKL03
	Xrvxphjwx4uEtXjzwvIiEzeSLH6OLk6IwSbfqA0r3mdhukuw2U8+EnQAcayqFSu02udlbG0yHIx
	h0cLcv9nEzpG89tFnQ+lyIt5UzXevMoYr0eJIWSSg6Ju9Cb7ZwPNye7oHj7ASmHhmKFSSH8Mhhd
	j3DCQiNmGXYgJbx56RfGOvRp6lwGUADMKu22TvVl1ekqnzIs/UiWyQF+56yJ5wck6o0B+VnIWob
	Qe589yJGf8q11D43Q+qjMknqaZ4tSXtx9tmx0k3c+lPCikSN2oeU9CDUxwXiL2r6HzbtDyNF9tH
	uJqWN1Ogy85W1C4EdL5EDLkFpj3kuLoHcN6arXIGIddCcTn3uzQCMInrIxJvuX99uq9uy5kwBfF
	8t+iYwcdciU/zfelGbfJA==
X-Received: by 2002:a05:600c:1c0e:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49eb72f382amr79104485e9.10.1789639402386;
        Thu, 17 Sep 2026 03:03:22 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm27880785e9.0.2026.09.17.03.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 03:03:21 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in rtw_recv.c
Date: Thu, 17 Sep 2026 10:02:54 +0000
Message-ID: <20260917100254.1067839-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around arguments to list macros
and the address-of operator. Fix alignment to match open
parenthesis. Issues reported by checkpatch.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 63 ++++++++++++-----------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7568fc514..fbb223288 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -59,9 +59,9 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 	precvframe = (union recv_frame *)precvpriv->precv_frame_buf;
 
 	for (i = 0; i < NR_RECVFRAME; i++) {
-		INIT_LIST_HEAD(&(precvframe->u.list));
+		INIT_LIST_HEAD(&precvframe->u.list);
 
-		list_add_tail(&(precvframe->u.list), &(precvpriv->free_recv_queue.queue));
+		list_add_tail(&precvframe->u.list, &precvpriv->free_recv_queue.queue);
 
 		precvframe->u.hdr.pkt_newalloc = NULL;
 		precvframe->u.hdr.pkt = NULL;
@@ -161,11 +161,11 @@ int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_
 
 	spin_lock_bh(&pfree_recv_queue->lock);
 
-	list_del_init(&(precvframe->u.hdr.list));
+	list_del_init(&precvframe->u.hdr.list);
 
 	precvframe->u.hdr.len = 0;
 
-	list_add_tail(&(precvframe->u.hdr.list), get_list_head(pfree_recv_queue));
+	list_add_tail(&precvframe->u.hdr.list, get_list_head(pfree_recv_queue));
 
 	if (padapter) {
 		if (pfree_recv_queue == &precvpriv->free_recv_queue)
@@ -181,9 +181,9 @@ signed int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
 	/* INIT_LIST_HEAD(&(precvframe->u.hdr.list)); */
-	list_del_init(&(precvframe->u.hdr.list));
+	list_del_init(&precvframe->u.hdr.list);
 
-	list_add_tail(&(precvframe->u.hdr.list), get_list_head(queue));
+	list_add_tail(&precvframe->u.hdr.list, get_list_head(queue));
 
 	if (padapter)
 		if (queue == &precvpriv->free_recv_queue)
@@ -323,7 +323,7 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 		key_type |= NL80211_KEYTYPE_PAIRWISE;
 
 	cfg80211_michael_mic_failure(padapter->pnetdev, (u8 *)&pmlmepriv->assoc_bssid[0], key_type, -1,
-		NULL, GFP_ATOMIC);
+				     NULL, GFP_ATOMIC);
 
 	memset(&ev, 0x00, sizeof(ev));
 	if (bgroup)
@@ -352,7 +352,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	stainfo = rtw_get_stainfo(&adapter->stapriv, &prxattrib->ta[0]);
 
@@ -682,7 +682,7 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 }
 
 static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-			struct sta_info **psta)
+				     struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	signed int ret = _SUCCESS;
@@ -768,7 +768,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 }
 
 static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-		       struct sta_info **psta)
+				    struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
@@ -866,7 +866,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 }
 
 static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
-		       struct sta_info **psta)
+				    struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
@@ -1059,7 +1059,7 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 	plist = get_next(phead);
 	prframe = (union recv_frame *)plist;
 	pfhdr = &prframe->u.hdr;
-	list_del_init(&(prframe->u.list));
+	list_del_init(&prframe->u.list);
 
 	if (curfragnum != pfhdr->attrib.frag_num) {
 		/* the first fragment number must be 0 */
@@ -1378,7 +1378,8 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 	    adapter->securitypriv.binstallBIPkey) {
 		/* unicast management frame decrypt */
 		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
-			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
+		    (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
+		     subtype == WIFI_ACTION)) {
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
 
@@ -1420,10 +1421,10 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			if (subtype == WIFI_ACTION) {
 				/* according 802.11-2012 standard, these five types are not robust types */
 				if (ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_PUBLIC          &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT              &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_UNPROTECTED_WNM &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_SELF_PROTECTED  &&
-					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_P2P) {
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT              &&
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_UNPROTECTED_WNM &&
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_SELF_PROTECTED  &&
+				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_P2P) {
 					goto validate_80211w_fail;
 				}
 			} else if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC) {
@@ -1452,7 +1453,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
 	u8 *ptr = precv_frame->u.hdr.rx_data;
-	u8  ver = (unsigned char) (*ptr) & 0x3;
+	u8  ver = (unsigned char)(*ptr) & 0x3;
 
 	/* add version chk */
 	if (ver != 0) {
@@ -1528,10 +1529,10 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	/* convert hdr + possible LLC headers into Ethernet header */
 	/* eth_type = (psnap_type[0] << 8) | psnap_type[1]; */
 	if ((!memcmp(psnap, rfc1042_header, SNAP_SIZE) &&
-		(memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
-		(memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
-		/* eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) || */
-		 !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
+	     (memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
+	     (memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
+	     /* eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) || */
+	     !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
 		/* remove RFC1042 or Bridge-Tunnel encapsulation and replace EtherType */
 		bsnaphdr = true;
 	} else {
@@ -1593,9 +1594,9 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 subfram
 	eth_type = get_unaligned_be16(&sub_skb->data[6]);
 
 	if (sub_skb->len >= 8 &&
-		((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
-		eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
-		!memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
+	    ((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
+	     eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
+	     !memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
 		/*
 		 * remove RFC1042 or Bridge-Tunnel encapsulation and replace
 		 * EtherType
@@ -1670,7 +1671,7 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 	u8 *pdata;
 	struct sk_buff *sub_pkt, *subframes[MAX_SUBFRAME_COUNT];
 	struct recv_priv *precvpriv = &padapter->recvpriv;
-	struct __queue *pfree_recv_queue = &(precvpriv->free_recv_queue);
+	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
 
 	nr_subframes = 0;
 
@@ -1795,9 +1796,9 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
-	list_del_init(&(prframe->u.hdr.list));
+	list_del_init(&prframe->u.hdr.list);
 
-	list_add_tail(&(prframe->u.hdr.list), plist);
+	list_add_tail(&prframe->u.hdr.list, plist);
 
 	/* spin_unlock(&ppending_recvframe_queue->lock); */
 	/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
@@ -1812,8 +1813,8 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
 	struct sk_buff *skb;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
-	precvpriv = &(padapter->recvpriv);
-	pfree_recv_queue = &(precvpriv->free_recv_queue);
+	precvpriv = &padapter->recvpriv;
+	pfree_recv_queue = &precvpriv->free_recv_queue;
 
 	skb = precv_frame->u.hdr.pkt;
 	if (!skb)
@@ -1880,7 +1881,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 		if (!SN_LESS(preorder_ctrl->indicate_seq, pattrib->seq_num)) {
 			plist = get_next(plist);
-			list_del_init(&(prframe->u.hdr.list));
+			list_del_init(&prframe->u.hdr.list);
 
 			if (SN_EQUAL(preorder_ctrl->indicate_seq, pattrib->seq_num))
 				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
-- 
2.43.0

