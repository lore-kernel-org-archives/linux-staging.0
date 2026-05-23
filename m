Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98785314B73
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779533068; cv=pass; b=eKNuLbrOwuu4Gi5OzS6XvU6KajOhV3UdqZUr+4OUnfNIfSKCsSIKySW/IX4Py3xquxlCbAhh50vzUK7YfOUiDL/ZXUL03fntd/Oocqh1jAlwNO8SHfUSkz8ZoW6HcAycG7bNUN6Ga95wMRLXLHLQxegXtOFQQLcFj90+0ybdCYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779533068; c=relaxed/simple;
	bh=sVRDp1+5sOqHjrUou6x9bU1mPlbxlV4Cs1rquE71OOE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=C5mpVnZ++AqqMR9osuZolfnD+Th4ioPdRJqUVD58MXNUtrxtxFk1xhNEJ1XPaj9ODCA/NxtALO0i35+9xpOHbF8VCRy6UeJLwtD5TU1fwklRC4mFRiLnNfixuOnp+kpB2OXr6+2eB18n92dgnbEFVqFPvSkVI30N5c+HaaV8e0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=GTV80apa; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="GTV80apa"
ARC-Seal: i=1; a=rsa-sha256; t=1779533054; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=aJXB1UCbF7d4iYIY4aiKc1h1asFQGEbDDVPyCt+wqxyt7X+UMnwJm4HKh4R9A7RHY7lz9Jy70U3X6EudAwHepbzOAk/EG5ad3JnN8k9r9WVpXJswI5LAtPn2sdXtmzgWEFt+e4sDbzUJP4LK06qRaeESH3EdfTLfSVVANOdUJ0w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779533054; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QPAfujFQXRT4FXHj+F7zrHmL/zglAT1nT2MR7yAkTS8=; 
	b=AjqmbSrSFOJqBOVtDUOu+2Rb7HDvREtujo2BIZv1ZCLwwSnItTnYrxjoII/PL8fiX/SoImUk+TqJqKsAYSXNFLY9d7a4cwadb8f4JIeI9qyCJcZMVgJL6bIdO1WLJhLQey8a5yRy7Fmv3OGEvrntK5bQVD1S8etGeSefdOSDlAU=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779533054;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QPAfujFQXRT4FXHj+F7zrHmL/zglAT1nT2MR7yAkTS8=;
	b=GTV80apamoqLmwnSZQGzWcQsan2wBcwd/+jPss+3X/r4YOwdGbReBPw+8MV4Vg1+
	dj62JWsatHaVSFnKGT9O5ngv3Vz3hT4sC99ctdUY3rw078c910j4tRsyYo9oFx8bFDP
	jdHCr79cnzKZk70h8SVNN208GHyMse8nTm2x0Ezs=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779533052807530.9651488997646; Sat, 23 May 2026 16:14:12 +0530 (IST)
Received: from  [157.35.75.45] by mail.zoho.in
	with HTTP;Sat, 23 May 2026 16:14:12 +0530 (IST)
Date: Sat, 23 May 2026 16:14:12 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e546f7b7d.2192aa4a49317.2370843901367566351@zohomail.in>
In-Reply-To: 
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary boolean
 comparisons in rtw_recv.c
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

Remove explicit comparisons to true and false. Replace '== false'
with the '!' operator and remove '== true' entirely.

Found by checkpatch.pl --strict

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v2: Reverted unrelated else/break change as pointed out by Dan Carpenter.
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 56 +++++++++++------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508df..011dbd8e2a77 100644
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
@@ -1950,8 +1950,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor

 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if ((padapter->bDriverStopped == false) &&
-				    (padapter->bSurpriseRemoved == false))
+				if (!padapter->bDriverStopped &&
+				    !padapter->bSurpriseRemoved)
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1991,8 +1991,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 
@@ -2002,7 +2001,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *

 		}
 
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			/* indicate this recv_frame */
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
@@ -2013,7 +2012,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 			return _SUCCESS;
 		}
 	} else if (pattrib->amsdu == 1) { /* temp filter -> means didn't support A-MSDUs in a A-MPDU */
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
 			retval = amsdu_to_msdu(padapter, prframe);
@@ -2099,8 +2098,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2110,7 +2108,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if ((padapter->bDriverStopped == false) && (padapter->bSurpriseRemoved == false)) {
+		if (!padapter->bDriverStopped && !padapter->bSurpriseRemoved) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
@@ -2199,7 +2197,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
 			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
-			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt == true) &&
+			(!prxattrib->bdecrypted || psecuritypriv->sw_decrypt) &&
 			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 			!psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
@@ -2286,8 +2284,8 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
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


