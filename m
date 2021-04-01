Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B533A5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:45 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u21so1802913ejo.13
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AMS2eCUz59fiquFDlIJ/2E2yFRWtG9lrxBM+k+Ru9/I=;
        b=UiljXqLzKvMDMON/F2VimYWNIAbgPIC1MFUCOWeYg9W7mCWl4zf4LjnMkC5h1qXZJv
         BOJqaFuADWAM6mWLq7Q7pd6FimMVsP7T2cV8sdqCV2fbQqvZfA1QF4SOcqsrLS7dlPmh
         eaaFndB8Z1m0FdW4mbQIA6m9MU1aZD1WK1aIjDeEowja7zlIZsxnDGdbS1UZrEHBXapa
         NmhSObpirXfHz5Kxr/IX917w8GDwfnAfIUPbpaIyBQFq9dO0JRjPdPMdhht3gZdEYkro
         YRXv9KWL8OMstmJGEgANYLap6W+gUKirP1AQDy5/lPPKCVOFLMmARvJB4C0LLqthyFAe
         NG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AMS2eCUz59fiquFDlIJ/2E2yFRWtG9lrxBM+k+Ru9/I=;
        b=mdLUXxEKEGhUFQ8r9mUDFFSUQNeN7RQX/qvGkEDgUHlAQQ4WqXm5HaGAti3Sk5vDOc
         non6z7Dob5sEpfq5ofiK2N64hmwYIDgz2ba2e2mi893NETf5zcfLwYqJE6ITuT17hhf/
         siy1Akv2jAxmudlH0Pkg7ya8VNQnE/IZ0GSKZ8e0IIhSWZYuLpx1hh7RhDpnY9+eJR2k
         QNEZ4NPQbTSBMsf2Fh5dhKqyXtV6z8MhS4l2aA3FQky6Fj9lJAs7vO30b1nlBT2EBu4+
         227Xp1IkJ+NEpU71ddbsPb+kvsVXIpMyeM7eNHq/5P+71fy8YcNQ7MvglWLyC35dXy2Y
         WOZw==
X-Gm-Message-State: AOAM532CAD4r2/ljKYU9bXfyD/pT8k2cdz+1uLaIpWRepkCnxmwFtTD4
	nsPrAZEKMBOm91ooJl+K325MFJmjccpGzA==
X-Google-Smtp-Source: ABdhPJy3Zxy2FQB3Y4ISqolWs3pU3mVxZNlZD1/ao9FqwZoLLL2sU+VwU8UM3w3eJznc35OiP22axg==
X-Received: by 2002:a17:906:edca:: with SMTP id sb10mr7899321ejb.398.1617268904296;
        Thu, 01 Apr 2021 02:21:44 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id m14sm3138936edd.63.2021.04.01.02.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:44 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 13/49] staging: rtl8723bs: remove RT_TRACE logs in core/rtw_mlme_ext.c
Date: Thu,  1 Apr 2021 11:20:43 +0200
Message-Id: <2585af265f479fdf2c0b41a106fdd4c09471b874.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8aadcf72a7ba..222d91773738 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -526,12 +526,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	struct dvobj_priv *psdpriv = padapter->dvobj;
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
-		 ("+mgt_dispatcher: type(0x%x) subtype(0x%x)\n",
-		  GetFrameType(pframe), GetFrameSubType(pframe)));
-
 	if (GetFrameType(pframe) != WIFI_MGT_TYPE) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("mgt_dispatcher: type(0x%x) error!\n", GetFrameType(pframe)));
 		return;
 	}
 
@@ -546,7 +541,6 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	index = GetFrameSubType(pframe) >> 4;
 
 	if (index >= ARRAY_SIZE(mlme_sta_tbl)) {
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("Currently we do not support reserved sub-fr-type =%d\n", index));
 		return;
 	}
 	ptable += index;
@@ -2675,8 +2669,6 @@ static int _issue_probereq(struct adapter *padapter,
 	int	bssrate_len = 0;
 	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_, ("+issue_probereq\n"));
-
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
 		goto exit;
@@ -2743,8 +2735,6 @@ static int _issue_probereq(struct adapter *padapter,
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_, ("issuing probe_req, tx_len =%d\n", pattrib->last_txcmdsz));
-
 	if (wait_ack) {
 		ret = dump_mgntframe_and_wait_ack(padapter, pmgntframe);
 	} else {
@@ -4441,8 +4431,6 @@ void start_create_ibss(struct adapter *padapter)
 
 		/* issue beacon */
 		if (send_beacon(padapter) == _FAIL) {
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("issuing beacon frame fail....\n"));
-
 			report_join_res(padapter, -1);
 			pmlmeinfo->state = WIFI_FW_NULL_STATE;
 		} else {
@@ -4622,8 +4610,6 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		memset(country, 0, 4);
 		memcpy(country, p, 3);
 		p += 3;
-		RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_,
-				("%s: 802.11d country =%s\n", __func__, country));
 
 		i = 0;
 		while ((ie - p) >= 3) {
@@ -4813,9 +4799,6 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 					break;
 
 				chplan_new[i].ScanType = SCAN_ACTIVE;
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_,
-						 ("%s: change channel %d scan type from passive to active\n",
-						  __func__, channel));
 			}
 			break;
 		}
@@ -6332,10 +6315,6 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 	#ifdef CHECK_EVENT_SEQ
 	/*  checking event sequence... */
 	if (evt_seq != (atomic_read(&pevt_priv->event_seq) & 0x7f)) {
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_,
-			 ("Event Seq Error! %d vs %d\n", (evt_seq & 0x7f),
-			  (atomic_read(&pevt_priv->event_seq) & 0x7f)));
-
 		pevt_priv->event_seq = (evt_seq+1)&0x7f;
 
 		goto _abort_event_;
@@ -6344,16 +6323,12 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	/*  checking if event code is valid */
 	if (evt_code >= MAX_C2HEVT) {
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_err_, ("\nEvent Code(%d) mismatch!\n", evt_code));
 		goto _abort_event_;
 	}
 
 	/*  checking if event size match the event parm size */
 	if ((wlanevents[evt_code].parmsize != 0) &&
 			(wlanevents[evt_code].parmsize != evt_sz)) {
-
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_err_, ("\nEvent(%d) Parm Size mismatch (%d vs %d)!\n",
-			evt_code, wlanevents[evt_code].parmsize, evt_sz));
 		goto _abort_event_;
 
 	}
-- 
2.20.1

