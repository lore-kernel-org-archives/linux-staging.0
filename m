Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF549259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id r14-20020a05600c35ceb029010fe0f81519so2973178wmq.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jqka6Hz1FxQMPoQbPXrc701wDNfbTNFu4/7wEF4BsEc=;
        b=TQjcour686d16OCEnU7dzqJHqOK1VtX15/eoUYHVrC81bfg+4vfGVLc1MpUxaqA7pg
         6kIeqdx+2HJ7v3hMKjEK7bz8cT9gyJkO6efbXDphaY+FjvYQx9hZZ4/PMZMnWz/CyXB0
         QqFWte69EQyuVk8Z9cNioTwL+f7C6to3e0RGhMluJGrXSqldFaWh6uO/rStL2fnGKhpP
         MXaxXkAbjiCSkZnp/4Mo2GinFLMhua2Ne34uh8meL3R5a/2EGxF2bdTyxQvIb8ap2yWn
         D0MvO7kSYUgtHPyhlS01OjR5nYSOf+b4PQVNsc7AJJXNZ0TJCqoykST895JM5FsmBHdL
         z99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jqka6Hz1FxQMPoQbPXrc701wDNfbTNFu4/7wEF4BsEc=;
        b=uUuHtxVtpkbY0ctdYB+I3ITYO4lVTdWCWb5qo7bIDJlKFfDMwjLtzPUpRraBiiUMhj
         azCZnQ3eYDrMKswmdtU53MD5bYwjibxbsdVauoi345Yep+eej8ysgiSsMZiJkddeKvvZ
         MzlcNh13LeJYSXB2D2pk+yQoRmiVAw6d7Bh4J3qkNYUFGPeQf6oSUrXGgm4HGIKuqtbf
         su/12jQjGSKTSCMoKzp1vNHp2meslcWfVLTGLXvX8lpS7jCU1mJUy4m6ri/obauSYXmi
         QACOIcWozDnYEWbfgg9EOId/9yUWKnxT486SYsDBRBY/OBootWiCdP4ECE9rnzU4L51z
         dn3g==
X-Gm-Message-State: AOAM532/O5NSfhiFQ1BE6e4w9BEVyUjMfSyyY9lc0dPsMmag62FdCSHu
	SAfaaducTRsuXVzPpugw9oc=
X-Google-Smtp-Source: ABdhPJxG0qSx0Frw0rtbLrxS+WVYWa9/zvgerIaRozheCVEYIDjoOyRfRtrGEgEY5mXxA+EvZiEI+A==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr6963814wmd.42.1617545418461;
        Sun, 04 Apr 2021 07:10:18 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id a14sm25640600wrg.84.2021.04.04.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 17/30] staging: rtl8723bs: remove RT_TRACE logs in core/rtw_mlme_ext.c
Date: Sun,  4 Apr 2021 16:09:33 +0200
Message-Id: <4f838d1ce3cd16fab8f05d1e0f80c2e7469701b8.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all of the RT_TRACE logs in the core/rtw_mlme_ext.c file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 39 +++----------------
 1 file changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8aadcf72a7ba..9855a77a5188 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -526,14 +526,8 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	struct dvobj_priv *psdpriv = padapter->dvobj;
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
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
@@ -545,10 +539,9 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 
 	index = GetFrameSubType(pframe) >> 4;
 
-	if (index >= ARRAY_SIZE(mlme_sta_tbl)) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("Currently we do not support reserved sub-fr-type =%d\n", index));
+	if (index >= ARRAY_SIZE(mlme_sta_tbl))
 		return;
-	}
+
 	ptable += index;
 
 	if (psta) {
@@ -2675,8 +2668,6 @@ static int _issue_probereq(struct adapter *padapter,
 	int	bssrate_len = 0;
 	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_, ("+issue_probereq\n"));
-
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
 		goto exit;
@@ -2743,8 +2734,6 @@ static int _issue_probereq(struct adapter *padapter,
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_, ("issuing probe_req, tx_len =%d\n", pattrib->last_txcmdsz));
-
 	if (wait_ack) {
 		ret = dump_mgntframe_and_wait_ack(padapter, pmgntframe);
 	} else {
@@ -4441,8 +4430,6 @@ void start_create_ibss(struct adapter *padapter)
 
 		/* issue beacon */
 		if (send_beacon(padapter) == _FAIL) {
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("issuing beacon frame fail....\n"));
-
 			report_join_res(padapter, -1);
 			pmlmeinfo->state = WIFI_FW_NULL_STATE;
 		} else {
@@ -4622,8 +4609,6 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		memset(country, 0, 4);
 		memcpy(country, p, 3);
 		p += 3;
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_,
-				("%s: 802.11d country =%s\n", __func__, country));
 
 		i = 0;
 		while ((ie - p) >= 3) {
@@ -4813,9 +4798,6 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 					break;
 
 				chplan_new[i].ScanType = SCAN_ACTIVE;
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_,
-						 ("%s: change channel %d scan type from passive to active\n",
-						  __func__, channel));
 			}
 			break;
 		}
@@ -6332,10 +6314,6 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 	#ifdef CHECK_EVENT_SEQ
 	/*  checking event sequence... */
 	if (evt_seq != (atomic_read(&pevt_priv->event_seq) & 0x7f)) {
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_,
-			 ("Event Seq Error! %d vs %d\n", (evt_seq & 0x7f),
-			  (atomic_read(&pevt_priv->event_seq) & 0x7f)));
-
 		pevt_priv->event_seq = (evt_seq+1)&0x7f;
 
 		goto _abort_event_;
@@ -6343,21 +6321,14 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 	#endif
 
 	/*  checking if event code is valid */
-	if (evt_code >= MAX_C2HEVT) {
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_err_, ("\nEvent Code(%d) mismatch!\n", evt_code));
+	if (evt_code >= MAX_C2HEVT)
 		goto _abort_event_;
-	}
 
 	/*  checking if event size match the event parm size */
 	if ((wlanevents[evt_code].parmsize != 0) &&
-			(wlanevents[evt_code].parmsize != evt_sz)) {
-
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_err_, ("\nEvent(%d) Parm Size mismatch (%d vs %d)!\n",
-			evt_code, wlanevents[evt_code].parmsize, evt_sz));
+			(wlanevents[evt_code].parmsize != evt_sz))
 		goto _abort_event_;
 
-	}
-
 	atomic_inc(&pevt_priv->event_seq);
 
 	peventbuf += 2;
-- 
2.20.1

