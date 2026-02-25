Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A441C2AD37
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 03:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771990179; cv=none; b=YObKKs9j80aiJKjT5EpNSAOC0qr/7rbIjvF9lyExtDiCikJWkH1hjqtJXg9PBwwdZMP1+f7I8H8xmNzdBgwxQSOzfZj5DBbAZsxuTSmoj6zOb/0S3UfA/NP5fByKb6FMmIx8Iqd9+72sbtetw3Blvic6cgmmvK3Kr3ndaBbTKuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771990179; c=relaxed/simple;
	bh=0pENj3kpmoZkOxGd73Co905mbq4ov6G1rnS6nkF9McY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uLmJFLZFRFtrhoLDyZFixvJjt28wXX+RRWvbA6kRksO6eoZYLOu9dV+zuSkZmtsnUgK6gDQmwXn8rcWalkL6E82K5IHBrhQ/2bt0UOi/Y/raBFzs9QNBM7wzIpuCg0LBGCsJY0IHxFSHjKljvS9rYMEEV4y8AZJjsegQF9lR1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cte8zx7w; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cte8zx7w"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-463d81452abso4023889b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 19:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771990176; x=1772594976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ym//VKiVdZTJN+N7aKu6L8qmFilBtsa2w/zPtIyLW88=;
        b=cte8zx7wNFxZTvc0oLM3oYxsbW84TF1Ojj5ACzZhk2sSDZ33O+2+/AIKGApKcOBANR
         fMW9QCLpFBGy7OWDeZJjdqHW2PVBmtJrVC4VujK7CX5XJyGzany0QIvWD0xzYRredMjL
         kL+IX1Li9R57wrqW23EiUHKKhPXbm4LrmjqK8xog1zqfTNyV6aFEaa1EvS1XP55W4JtM
         bZ58J0tJRZ5+PIbjb+lpt2w03XrkQgYMbNGi5vNuQvTcnZHAHttlfghJrHpqAN0ehu+X
         XngWyIaRzxaeosdzsLGZ9o/ZDJ98Eu8cIvFFqQELx5y1ig6LIFCI5T0klRGDSfZ429Ud
         tkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771990176; x=1772594976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym//VKiVdZTJN+N7aKu6L8qmFilBtsa2w/zPtIyLW88=;
        b=j66XnBnKHBc+TxDN3LwqikpqtDl/8TrTjzsrr8FbmqlYQRpMc9ES8fTPioAowZZW5s
         QyBxCzUAJQr6FszsUl9IH7m7V/X6yV63omZ91G96/679auGXnH/ExCHufPG8G1BzR8+B
         +NoSsBO4vW9RJeG0ynk+SI6SLEgnuxCrbr0oz9GAzV6677yKNV85tu38uCLsHpzLSh7q
         u0XePZYzJaZKiXlTU23ThazvvUeW5/oVZLoRC4geFa9OsrjtgsVUR9QbADHVzybQrV7+
         iTugeC2+fptNI22g4/8hgh98RfSBZVfn44c9VcQBa80wzyvh5Esa+nWQMMrge8mV7nNF
         pNjw==
X-Gm-Message-State: AOJu0Yxr47d+raw7YyXCjpeQ7sp2Iivn6g5zDczir6SaKasTSouHa0BN
	jyjYGNDAAcvfv7hSmuwUQSY6JsPu7U5s+rj4Su221fSr2f/F4rUWfkrPkrYaKuY3
X-Gm-Gg: ATEYQzzTv+Lgu1TEYBQGqdoBLlgP/phPwluhxp1ABGfC92+gc0H5u/QVi5wGKqbV4SA
	R0DMvXdgzeBGoMsQ4ZWaVcBEkokS42QGnN0n5NfpEMNS2h6wB+7ctGLhPTqnHUc7SU/QOf1OOaP
	czcQRKa49JkMnVlRsLC22ARexa+O9PZbuP/IvZ7Pdg0XqXnf51OanV3ASOwiJFkHmDxvFd2GzfL
	tIo1sGvrLKlaj2QXe/kWA4Y+LrWNc46bG25unx8IUhkHeHJ/NyZMEZJvOGt0stX7qtDeASun7E9
	1cnHx7wmxRqLkQahKKueBC/j01ABfOyUD8Qe4bumI4n3KpeAdN1DugBD1XpKtR9jQzg9nBZ9Bah
	nmk/zv8bbcTPjlKfr4ezRp9o8MN6Kh7xGE15/4wLyJe6SAyQMAVGeT+ledE8mIVaoyLVCo18etJ
	Gz
X-Received: by 2002:a05:6808:318e:b0:45e:e52c:8dd0 with SMTP id 5614622812f47-4644638c3ecmr8670037b6e.48.1771990176488;
        Tue, 24 Feb 2026 19:29:36 -0800 (PST)
Received: from deskmog ([2601:280:c801:83c0::915b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157d2d320fsm11671040fac.11.2026.02.24.19.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 19:29:36 -0800 (PST)
From: Khasar Munkh-Erdene <02khasar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Khasar Munkh-Erdene <02khasar@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix spacing around operators in rtw_recv.c
Date: Tue, 24 Feb 2026 20:29:09 -0700
Message-ID: <20260225032909.72799-1-02khasar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style issues by adding missing spaces around binary and
ternary operators, as reported by checkpatch.pl.

Signed-off-by: Khasar Munkh-Erdene <02khasar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 84 +++++++++++------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index beaadcaff967..1a52d3e1d285 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -322,7 +322,7 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 	} else {
 		cur_time = jiffies;
 
-		if (cur_time - psecuritypriv->last_mic_err_time < 60*HZ) {
+		if (cur_time - psecuritypriv->last_mic_err_time < 60 * HZ) {
 			psecuritypriv->btkip_countermeasure = true;
 			psecuritypriv->last_mic_err_time = 0;
 			psecuritypriv->btkip_countermeasure_time = cur_time;
@@ -390,13 +390,13 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				mickey = &stainfo->dot11tkiprxmickey.skey[0];
 			}
 
-			datalen = precvframe->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len-prxattrib->icv_len-8;/* icv_len included the mic code */
+			datalen = precvframe->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len - prxattrib->icv_len - 8;/* icv_len included the mic code */
 			pframe = precvframe->u.hdr.rx_data;
-			payload = pframe+prxattrib->hdrlen+prxattrib->iv_len;
+			payload = pframe + prxattrib->hdrlen + prxattrib->iv_len;
 
 			rtw_seccalctkipmic(mickey, pframe, payload, datalen, &miccode[0], (unsigned char)prxattrib->priority); /* care the length of the data */
 
-			pframemic = payload+datalen;
+			pframemic = payload + datalen;
 
 			bmic_err = false;
 
@@ -444,9 +444,9 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 	u32  res = _SUCCESS;
 
 	if (prxattrib->encrypt > 0) {
-		u8 *iv = precv_frame->u.hdr.rx_data+prxattrib->hdrlen;
+		u8 *iv = precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
 
-		prxattrib->key_index = (((iv[3])>>6)&0x3);
+		prxattrib->key_index = (((iv[3]) >> 6) & 0x3);
 
 		if (prxattrib->key_index > WEP_KEYS) {
 			switch (prxattrib->encrypt) {
@@ -568,7 +568,7 @@ static signed int recv_decache(union recv_frame *precv_frame, u8 bretry, struct
 {
 	signed int tid = precv_frame->u.hdr.attrib.priority;
 
-	u16 seq_ctrl = ((precv_frame->u.hdr.attrib.seq_num&0xffff) << 4) |
+	u16 seq_ctrl = ((precv_frame->u.hdr.attrib.seq_num & 0xffff) << 4) |
 		(precv_frame->u.hdr.attrib.frag_num & 0xf);
 
 	if (tid > 15)
@@ -632,29 +632,29 @@ static void process_wmmps_data(struct adapter *padapter, union recv_frame *precv
 	if (!psta->qos_option)
 		return;
 
-	if (!(psta->qos_info&0xf))
+	if (!(psta->qos_info & 0xf))
 		return;
 
-	if (psta->state&WIFI_SLEEP_STATE) {
+	if (psta->state & WIFI_SLEEP_STATE) {
 		u8 wmmps_ac = 0;
 
 		switch (pattrib->priority) {
 		case 1:
 		case 2:
-			wmmps_ac = psta->uapsd_bk&BIT(1);
+			wmmps_ac = psta->uapsd_bk & BIT(1);
 			break;
 		case 4:
 		case 5:
-			wmmps_ac = psta->uapsd_vi&BIT(1);
+			wmmps_ac = psta->uapsd_vi & BIT(1);
 			break;
 		case 6:
 		case 7:
-			wmmps_ac = psta->uapsd_vo&BIT(1);
+			wmmps_ac = psta->uapsd_vo & BIT(1);
 			break;
 		case 0:
 		case 3:
 		default:
-			wmmps_ac = psta->uapsd_be&BIT(1);
+			wmmps_ac = psta->uapsd_be & BIT(1);
 			break;
 		}
 
@@ -979,20 +979,20 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 		switch (pattrib->priority) {
 		case 1:
 		case 2:
-			wmmps_ac = psta->uapsd_bk&BIT(0);
+			wmmps_ac = psta->uapsd_bk & BIT(0);
 			break;
 		case 4:
 		case 5:
-			wmmps_ac = psta->uapsd_vi&BIT(0);
+			wmmps_ac = psta->uapsd_vi & BIT(0);
 			break;
 		case 6:
 		case 7:
-			wmmps_ac = psta->uapsd_vo&BIT(0);
+			wmmps_ac = psta->uapsd_vo & BIT(0);
 			break;
 		case 0:
 		case 3:
 		default:
-			wmmps_ac = psta->uapsd_be&BIT(0);
+			wmmps_ac = psta->uapsd_be & BIT(0);
 			break;
 		}
 
@@ -1004,7 +1004,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 			psta->state ^= WIFI_STA_ALIVE_CHK_STATE;
 		}
 
-		if ((psta->state&WIFI_SLEEP_STATE) && (pstapriv->sta_dz_bitmap&BIT(psta->aid))) {
+		if ((psta->state & WIFI_SLEEP_STATE) && (pstapriv->sta_dz_bitmap & BIT(psta->aid))) {
 			struct list_head	*xmitframe_plist, *xmitframe_phead;
 			struct xmit_frame *pxmitframe = NULL;
 			struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -1048,7 +1048,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 				/* spin_unlock_bh(&psta->sleep_q.lock); */
 				spin_unlock_bh(&pxmitpriv->lock);
 
-				if (pstapriv->tim_bitmap&BIT(psta->aid)) {
+				if (pstapriv->tim_bitmap & BIT(psta->aid)) {
 					if (psta->sleepq_len == 0) {
 						/* issue nulldata with More data bit = 0 to indicate we have no buffered packets */
 						issue_nulldata_in_interrupt(padapter, psta->hwaddr);
@@ -1430,9 +1430,9 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 				goto validate_80211w_fail;
 			precv_frame = decryptor(adapter, precv_frame);
 			/* save actual management data frame body */
-			memcpy(mgmt_DATA, ptr+pattrib->hdrlen+pattrib->iv_len, data_len);
+			memcpy(mgmt_DATA, ptr + pattrib->hdrlen + pattrib->iv_len, data_len);
 			/* overwrite the iv field */
-			memcpy(ptr+pattrib->hdrlen, mgmt_DATA, data_len);
+			memcpy(ptr + pattrib->hdrlen, mgmt_DATA, data_len);
 			/* remove the iv and icv length */
 			pattrib->pkt_len = pattrib->pkt_len - pattrib->iv_len - pattrib->icv_len;
 			kfree(mgmt_DATA);
@@ -1488,7 +1488,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
 	u8 *ptr = precv_frame->u.hdr.rx_data;
-	u8  ver = (unsigned char) (*ptr)&0x3;
+	u8  ver = (unsigned char) (*ptr) & 0x3;
 
 	/* add version chk */
 	if (ver != 0) {
@@ -1526,7 +1526,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 		retval = _FAIL; /*  only data frame return _SUCCESS */
 		break;
 	case WIFI_DATA_TYPE: /* data */
-		pattrib->qos = (subtype & BIT(7)) ? 1:0;
+		pattrib->qos = (subtype & BIT(7)) ? 1 : 0;
 		retval = validate_recv_data_frame(adapter, precv_frame);
 		if (retval == _FAIL) {
 			struct recv_priv *precvpriv = &adapter->recvpriv;
@@ -1571,8 +1571,8 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	if (pattrib->encrypt)
 		recvframe_pull_tail(precvframe, pattrib->icv_len);
 
-	psnap = (struct ieee80211_snap_hdr	*)(ptr+pattrib->hdrlen + pattrib->iv_len);
-	psnap_type = ptr+pattrib->hdrlen + pattrib->iv_len+SNAP_SIZE;
+	psnap = (struct ieee80211_snap_hdr	*)(ptr + pattrib->hdrlen + pattrib->iv_len);
+	psnap_type = ptr + pattrib->hdrlen + pattrib->iv_len + SNAP_SIZE;
 	/* convert hdr + possible LLC headers into Ethernet header */
 	/* eth_type = (psnap_type[0] << 8) | psnap_type[1]; */
 	if ((!memcmp(psnap, rfc1042_header, SNAP_SIZE) &&
@@ -1586,37 +1586,37 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 		/* Leave Ethernet header part of hdr and full payload */
 		bsnaphdr = false;
 
-	rmv_len = pattrib->hdrlen + pattrib->iv_len + (bsnaphdr?SNAP_SIZE:0);
+	rmv_len = pattrib->hdrlen + pattrib->iv_len + (bsnaphdr ? SNAP_SIZE : 0);
 	len = precvframe->u.hdr.len - rmv_len;
 
-	memcpy(&be_tmp, ptr+rmv_len, 2);
+	memcpy(&be_tmp, ptr + rmv_len, 2);
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
 	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
 		ptr += rmv_len;
 		*ptr = 0x87;
-		*(ptr+1) = 0x12;
+		*(ptr + 1) = 0x12;
 
 		eth_type = 0x8712;
 		/*  append rx status for mp test packets */
-		ptr = recvframe_pull(precvframe, (rmv_len-sizeof(struct ethhdr)+2)-24);
+		ptr = recvframe_pull(precvframe, (rmv_len - sizeof(struct ethhdr) + 2) - 24);
 		if (!ptr)
 			return _FAIL;
 		memcpy(ptr, get_rxmem(precvframe), 24);
 		ptr += 24;
 	} else {
-		ptr = recvframe_pull(precvframe, (rmv_len-sizeof(struct ethhdr) + (bsnaphdr?2:0)));
+		ptr = recvframe_pull(precvframe, (rmv_len - sizeof(struct ethhdr) + (bsnaphdr ? 2 : 0)));
 		if (!ptr)
 			return _FAIL;
 	}
 
 	memcpy(ptr, pattrib->dst, ETH_ALEN);
-	memcpy(ptr+ETH_ALEN, pattrib->src, ETH_ALEN);
+	memcpy(ptr + ETH_ALEN, pattrib->src, ETH_ALEN);
 
 	if (!bsnaphdr) {
 		be_tmp = htons(len);
-		memcpy(ptr+12, &be_tmp, 2);
+		memcpy(ptr + 12, &be_tmp, 2);
 	}
 
 	return _SUCCESS;
@@ -1754,7 +1754,7 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 		pdata += nSubframe_Length;
 		a_len -= nSubframe_Length;
 		if (a_len != 0) {
-			padding_len = 4 - ((nSubframe_Length + ETH_HLEN) & (4-1));
+			padding_len = 4 - ((nSubframe_Length + ETH_HLEN) & (4 - 1));
 			if (padding_len == 4)
 				padding_len = 0;
 
@@ -2004,7 +2004,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 			rtw_recv_indicatepkt(padapter, prframe);
 
-			preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1)%4096;
+			preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096;
 
 			return _SUCCESS;
 		}
@@ -2014,7 +2014,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 			retval = amsdu_to_msdu(padapter, prframe);
 
-			preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1)%4096;
+			preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096;
 
 			return retval;
 		}
@@ -2200,7 +2200,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 			!psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
 
-			if (recvpriv->free_recvframe_cnt < NR_RECVFRAME/4) {
+			if (recvpriv->free_recvframe_cnt < NR_RECVFRAME / 4) {
 				/* to prevent from recvframe starvation, get recvframe from uc_swdec_pending_queue to free_recvframe_cnt  */
 				rframe = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue);
 				if (rframe)
@@ -2289,19 +2289,19 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 		}
 
 		/* update value of signal_strength, rssi, signal_qual */
-		tmp_s = (avg_signal_strength+(_alpha-1)*recvpriv->signal_strength);
+		tmp_s = (avg_signal_strength + (_alpha - 1) * recvpriv->signal_strength);
 		if (tmp_s % _alpha)
-			tmp_s = tmp_s/_alpha + 1;
+			tmp_s = tmp_s / _alpha + 1;
 		else
-			tmp_s = tmp_s/_alpha;
+			tmp_s = tmp_s / _alpha;
 		if (tmp_s > 100)
 			tmp_s = 100;
 
-		tmp_q = (avg_signal_qual+(_alpha-1)*recvpriv->signal_qual);
+		tmp_q = (avg_signal_qual + (_alpha - 1) * recvpriv->signal_qual);
 		if (tmp_q % _alpha)
-			tmp_q = tmp_q/_alpha + 1;
+			tmp_q = tmp_q / _alpha + 1;
 		else
-			tmp_q = tmp_q/_alpha;
+			tmp_q = tmp_q / _alpha;
 		if (tmp_q > 100)
 			tmp_q = 100;
 
-- 
2.53.0

