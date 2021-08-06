Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747122F80
	for <linux-staging@lists.linux.dev>; Fri,  6 Aug 2021 00:40:42 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id m19so4506839wms.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 17:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O8K+Cs71sd7blIy+gEGFnXd93wTxYMuMdv1Ved4XIe0=;
        b=kunf2SOVe7J2NNsi+kD4cord1Z8/xdmJ/ODhkRr+hn6jHU0OuoTOQ2XuHdRcgsh/MT
         eTEbwBSSmxCwjT2llVP327bWVesmW2gEQ7VErVcnI38Gy/hiBU7TknTXxIgeVlGmVZ4b
         c2QdRslyj15EPV2DXITqQY/MqRBqPCyJOZ50cfZiYbxpWKCzzUXaqsSgp9/6UnX9h2Xn
         BZOCjUEn/mL2PVOYffOlKWMUjvO2xKIEMz2vXX32pgh9jL/lDnQbT45wc7PQI1yH4X01
         r3W+luwkQSsLg1X6wA1jpABln61Wt6kFbYGAnhj4AZlJDxgm/QLvwdYl+0ykx75kQeTI
         BdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8K+Cs71sd7blIy+gEGFnXd93wTxYMuMdv1Ved4XIe0=;
        b=HoD6y4MXRiZp9k/DcFamsULSIdjkA/OhELTTohj01V+ZB3fhVnJD2TNmLR/5Yme0Nl
         4dTrjJ6o4ATJh/2WXoK0+9QS510a3RsiRG/74hgHgZQM+Gn8YzxWBiplu4+/wSW/Yc6i
         HFkOwKpdnRPIdzgO8kKHSsiotEEpm6tnWRLhkwmduFq0+Kfk6fzPNrtWwHf0G7GZDC4w
         fcKyXURhXJv8pIe05OwdReNTJ0hZQRFpwd+5M9MwhvOriCT2KmTtzcTl5or2ehji5uk7
         1KsCVzOepBW+kR78RpdOn9xUEMgjAgPn8HytWsbWoX7VDxj1IfvKc/sLw0xBc2tw/Z6u
         Zj+w==
X-Gm-Message-State: AOAM532ZxjnKdGKrdiP9QrB4piu088XoHREf7kvgjLAwI9Fc+Bc8wSq0
	vOh37qUZzaTOqgAzXXEJuQ7aiAnWSUIO6NP8
X-Google-Smtp-Source: ABdhPJywIGFKE5tXace8HR1TiGORTNLlSMLnkF/fsGCdMpkLTeI4dpgAYC5wNKYG/bnuGb4fDkp0lg==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr663158wmh.188.1628210440866;
        Thu, 05 Aug 2021 17:40:40 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id y19sm10727181wmq.5.2021.08.05.17.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 17:40:40 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH v2 04/11] staging: r8188eu: remove RT_TRACE calls from core/rtw_mlme_ext.c
Date: Fri,  6 Aug 2021 01:40:27 +0100
Message-Id: <20210806004034.82233-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806004034.82233-1-phil@philpotter.co.uk>
References: <20210806004034.82233-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from core/rtw_mlme_ext.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 39 +++------------------
 1 file changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index a9a4007ce063..40f7ef78a733 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -418,14 +418,8 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 	u8 *pframe = precv_frame->rx_data;
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-		 ("+mgt_dispatcher: type(0x%x) subtype(0x%x)\n",
-		  GetFrameType(pframe), GetFrameSubType(pframe)));
-
-	if (GetFrameType(pframe) != WIFI_MGT_TYPE) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("mgt_dispatcher: type(0x%x) error!\n", GetFrameType(pframe)));
+	if (GetFrameType(pframe) != WIFI_MGT_TYPE)
 		return;
-	}
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
 	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
@@ -436,10 +430,8 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 
 	index = GetFrameSubType(pframe) >> 4;
 
-	if (index > 13) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("Currently we do not support reserved sub-fr-type=%d\n", index));
+	if (index > 13)
 		return;
-	}
 	ptable += index;
 
 	if (psta) {
@@ -3743,8 +3735,6 @@ static int _issue_probereq_p2p(struct adapter *padapter, u8 *da, int wait_ack)
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("issuing probe_req, tx_len=%d\n", pattrib->last_txcmdsz));
-
 	if (wait_ack) {
 		ret = dump_mgntframe_and_wait_ack(padapter, pmgntframe);
 	} else {
@@ -4816,8 +4806,6 @@ static int _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 	int	bssrate_len = 0;
 	u8	bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_, ("+issue_probereq\n"));
-
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
 		goto exit;
@@ -4878,9 +4866,6 @@ static int _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_,
-		 ("issuing probe_req, tx_len=%d\n", pattrib->last_txcmdsz));
-
 	if (wait_ack) {
 		ret = dump_mgntframe_and_wait_ack(padapter, pmgntframe);
 	} else {
@@ -6644,8 +6629,6 @@ void start_create_ibss(struct adapter *padapter)
 
 		/* issue beacon */
 		if (send_beacon(padapter) == _FAIL) {
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("issuing beacon frame fail....\n"));
-
 			report_join_res(padapter, -1);
 			pmlmeinfo->state = WIFI_FW_NULL_STATE;
 		} else {
@@ -6822,8 +6805,6 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		memset(country, 0, 4);
 		memcpy(country, p, 3);
 		p += 3;
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_,
-			 ("%s: 802.11d country =%s\n", __func__, country));
 
 		i = 0;
 		while ((ie - p) >= 3) {
@@ -6929,12 +6910,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 	i = 0;
 	while ((i < MAX_CHANNEL_NUM) && (chplan_new[i].ChannelNum != 0)) {
 		if (chplan_new[i].ChannelNum == channel) {
-			if (chplan_new[i].ScanType == SCAN_PASSIVE) {
+			if (chplan_new[i].ScanType == SCAN_PASSIVE)
 				chplan_new[i].ScanType = SCAN_ACTIVE;
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_,
-					 ("%s: change channel %d scan type from passive to active\n",
-					 __func__, channel));
-			}
 			break;
 		}
 		i++;
@@ -8199,19 +8176,13 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 	evt_code = (u8)((*peventbuf>>16)&0xff);
 
 	/*  checking if event code is valid */
-	if (evt_code >= MAX_C2HEVT) {
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_err_, ("\nEvent Code(%d) mismatch!\n", evt_code));
+	if (evt_code >= MAX_C2HEVT)
 		goto _abort_event_;
-	}
 
 	/*  checking if event size match the event parm size */
 	if ((wlanevents[evt_code].parmsize != 0) &&
-	    (wlanevents[evt_code].parmsize != evt_sz)) {
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_err_,
-			 ("\nEvent(%d) Parm Size mismatch (%d vs %d)!\n",
-			 evt_code, wlanevents[evt_code].parmsize, evt_sz));
+	    (wlanevents[evt_code].parmsize != evt_sz))
 		goto _abort_event_;
-	}
 
 	atomic_inc(&pevt_priv->event_seq);
 
-- 
2.31.1

