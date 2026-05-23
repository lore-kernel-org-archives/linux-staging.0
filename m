Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73922236FD
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 07:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779519641; cv=pass; b=d6sm+qGeTO/O0pVw2IdsirmJ6UGNG1huDOsf/UwAiFASkxvIJMh85vxno3PWNjv4FZB9t2URQT5r4I4rEuy2w1pZLT7G5DeP5Z+is9+H2p01EtOYNS8UkaIVnp05+IUf1eAGrJIzSLI4ZU5C96juElxHp63DP4fk8YNw7TgW47g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779519641; c=relaxed/simple;
	bh=NzGjdmXmB650qKL72and59meKOtDMY77L1Gq/vPiqQo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=fiUbfEmUtU5Fr1l+3ldvNc1P91rQdC/BCn8NHu14ANp4af0Mp5XFn7omPZp5UtJRg3XHMoei5WZSXOnnAzGtAr8rszBdv2HzWYF44KsXAuA1Zr+b29z+dClMzGoEL1VfPNHX719DWukACozDIHNqhY6mlLcrZ6y2/I2743CfDk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=b2lcopbh; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="b2lcopbh"
ARC-Seal: i=1; a=rsa-sha256; t=1779519621; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=WwNDykNZx0fl3xC1JpEloBINSVjyGDGYIUSSw08iWRoiQakjn9keQVxIqzaz8ceV2tfmcDVMKIdtx1cbD6x/Wdb9OAoW4NiWkPioRNbNWO5aZCN+yOGapVBD2oKK6SynpAEA++MOekdIi8m9D0u88uo7kH0zGRan6ypkl+5dfAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779519621; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1lAW2mBirdjQqvFIUiVzJki5ZZezTHsWf/WP8lMLB6E=; 
	b=VrcMQNp4T2ObEhL0zrRCAfyesD4OEV7vGFPw2fd6lDGFZnbpCtl0XtzvBgzW44vjwNJwzCk6maD0wgF+KV00yAwXypthK98WaErMKAr2kpHdIRh73yWp/sMeEot60cgmM+048oK6UfVt9MK92x2Oz/yez9uRa1IqHJGkidHl8a8=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779519621;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1lAW2mBirdjQqvFIUiVzJki5ZZezTHsWf/WP8lMLB6E=;
	b=b2lcopbh9RA1LrDpRhsUIsXLM+no8YsOJawGbKd6VD95sV2Wng9mMasW39qaiWkw
	RdPHuda+N7O1fK4vLSiIrCIRvOqa6B6tCW0mmV38NDQnzZrVYlml9OKU5IGnDRmux33
	YWlOoGXWZDTQ+Oj99Z+2HPi0hPAwymnTc/xFmzQs=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779519620033754.5316399912602; Sat, 23 May 2026 12:30:20 +0530 (IST)
Received: from  [106.219.3.73] by mail.zoho.in
	with HTTP;Sat, 23 May 2026 12:30:20 +0530 (IST)
Date: Sat, 23 May 2026 12:30:20 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-staging" <linux-staging@lists.linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19e53a283b8.4f2498e045168.7106069608127124839@zohomail.in>
In-Reply-To: 
Subject: [PATCH] staging: rtl8723bs: remove unnecessary boolean comparisons
 in rtw_recv.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Sat, 23 May 2026 12:28:02 +0530
Subject: [PATCH] staging: rtl8723bs: remove unnecessary boolean comparisons in
 rtw_recv.c

Remove explicit comparisons to true and false. Replace '== false'
with the '!' operator and remove '== true' entirely.

Found by checkpatch.pl --strict

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 59 +++++++++++------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508df..3289a925bd5a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -382,7 +382,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 				/* psecuritypriv->dot118021XGrpKeyid, pmlmeinfo->key_index, rxdata_key_idx); */

-				if (psecuritypriv->binstallGrpkey == false) {
+				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
 					goto exit;
 				}
@@ -406,10 +406,10 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			}
 

-			if (bmic_err == true) {
+			if (bmic_err) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if ((is_multicast_ether_addr(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
+				if ((is_multicast_ether_addr(prxattrib->ra))  && (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;

 				if (prxattrib->bdecrypted && brpt_micerror)
@@ -463,7 +463,7 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 		}
 	}

-	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt == true))) {
+	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt))) {
 		psecuritypriv->hw_decrypted = false;

 		switch (prxattrib->encrypt) {
@@ -713,8 +713,8 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	u8 *sta_addr = NULL;
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {

 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
@@ -736,7 +736,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 
 		sta_addr = pattrib->src;
 
-	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		/*  For Station mode, sa and bssid should always be BSSID, and DA is my mac-address */
 		if (memcmp(pattrib->bssid, pattrib->src, ETH_ALEN)) {
 			ret = _FAIL;
@@ -744,7 +744,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 		}
 
 		sta_addr = pattrib->bssid;
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		if (bmcast) {
 			/*  For AP mode, if DA == MCAST, then BSSID should be also MCAST */
 			if (!is_multicast_ether_addr(pattrib->bssid)) {
@@ -761,7 +761,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 			sta_addr = pattrib->src;
 		}
 
-	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -800,9 +800,9 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) &&
-	    (check_fwstate(pmlmepriv, _FW_LINKED) == true ||
-	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE)) &&
+	    (check_fwstate(pmlmepriv, _FW_LINKED) ||
+	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
@@ -847,8 +847,8 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			goto exit;
 		}
 
-	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) &&
-		     (check_fwstate(pmlmepriv, _FW_LINKED) == true)) {
+	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE)) &&
+		     (check_fwstate(pmlmepriv, _FW_LINKED))) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -866,7 +866,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		}


-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		/* Special case */
 		ret = RTW_RX_HANDLED;
 		goto exit;
@@ -903,7 +903,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 	unsigned char *mybssid  = get_bssid(pmlmepriv);
 	signed int ret = _SUCCESS;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		/* For AP mode, RA =BSSID, TX =STA(SRC_ADDR), A3 =DST_ADDR */
 		if (memcmp(pattrib->bssid, mybssid, ETH_ALEN)) {
 			ret = _FAIL;
@@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;

-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr + 1) = 0x12;
@@ -1841,8 +1841,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
-			break;
+		break;
 
 	}
 
@@ -1950,8 +1949,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if ((padapter->bDriverStopped == false) &&
-				    (padapter->bSurpriseRemoved == false))
+				if (!padapter->bDriverStopped &&
+				    !padapter->bSurpriseRemoved)
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1991,8 +1990,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 
@@ -2002,7 +2000,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 		}
 
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			/* indicate this recv_frame */
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
@@ -2013,7 +2011,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 			return _SUCCESS;
 		}
 	} else if (pattrib->amsdu == 1) { /* temp filter -> means didn't support A-MSDUs in a A-MPDU */
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
 			retval = amsdu_to_msdu(padapter, prframe);
@@ -2099,8 +2097,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2110,7 +2107,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if ((padapter->bDriverStopped == false) && (padapter->bSurpriseRemoved == false)) {
+		if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
@@ -2199,7 +2196,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
 			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
-			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt == true) &&
+			(!prxattrib->bdecrypted || psecuritypriv->sw_decrypt) &&
 			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 			!psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
@@ -2286,8 +2283,8 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 			}
 		}

-		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) == true ||
-		    check_fwstate(&adapter->mlmepriv, _FW_LINKED) == false
+		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) ||
+		    !check_fwstate(&adapter->mlmepriv, _FW_LINKED)
 		) {
 			goto set_timer;
 		}
-- 
2.43.0



