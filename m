Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9211B3FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:02:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id x12so25883862wrr.11
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PB00Lpy9joYKlWKDQVmDs2awm0P1cRW+7rAzwh/6S8M=;
        b=jpjt1t4GAVNHQslDktpxV1i4kygnvCf3keiJ7T3tVqapgmgdtLM1oa2slNrOkoPyFG
         YVow8tPgEYKqueaa1Nu+o3C338Wp8ZaKrd2fTZgRsiueuBNDuPEo9BmYX4XmJLzhbwWt
         bOh/j2e1xMKI3NVUwIOzvacB8rzRRbyEF4irSf+8He2eeT+y5RQ/gdEepsSWGYK5NNrh
         VnGCvdkRYQpo7//fBZh5xLoVsmm4TRPZhC57w2l+qi1NUgKeC//tr/CsgD4bmXZSb1GA
         x2WyDKPU9JcHtk2j4nVeZlQso7lQu/uFye34azqQjxw63j6UPmTS1jX2otNHCc2GcTNk
         +vXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PB00Lpy9joYKlWKDQVmDs2awm0P1cRW+7rAzwh/6S8M=;
        b=lkCy21yasd/DQ/ntKG+oMwgIaumEuctf1frPPZ0QKPMAx01lLWRmcfekm8GtLEXcUJ
         ntLSqnblzB3WR/TWPlLpueODfFd88vK0imu8qXUvTKqaGaQfw3mAy5QuJIj4Hew7H8yf
         34uGgngWWZPgCovc+9csUxp+lpAt9UGF+lOzBcmTa6Db2LHIz+ThJqJSnAXdONhJ2LX1
         Mz0/8R7CPjzVgU12Wtbb1cexDjAAjpeJ84iYfRP6zLiqwOBbwcbAqUk13hL6GG2rkX+r
         XyzLivj9L0hJFS4JNvQMa4ajZb7SMb9GQWYkobHR9Oilq9HzgoE05p1o44PpZE66ph7v
         cDxg==
X-Gm-Message-State: AOAM530Wch0Re7/pnYBhDDNKqw3v5pryz1qHQKXGuJ/nLvAzwjxOzEhx
	4Uhold9GJAVaBd7GJMvZa+w=
X-Google-Smtp-Source: ABdhPJz1u27OA2MxE75BD8J4jJm4j7XEPpOkSho3kX8dy0b2UrjFgTv4p/TZatF/d0bBwjmwZTyNnA==
X-Received: by 2002:a5d:510b:: with SMTP id s11mr13597150wrt.63.1629720145061;
        Mon, 23 Aug 2021 05:02:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id g5sm901332wrq.80.2021.08.23.05.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:02:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/8] staging: r8188eu: use is_multicast_ether_addr in core/rtw_recv.c
Date: Mon, 23 Aug 2021 14:01:02 +0200
Message-Id: <20210823120106.9633-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823120106.9633-1-straube.linux@gmail.com>
References: <20210823120106.9633-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use is_multicast_ether_addr instead of custom macro IS_MCAST, all
buffers are properly aligned.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 52236bae8693..bc452420c119 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -330,7 +330,7 @@ static int recvframe_chkmic(struct adapter *adapter,  struct recv_frame *precvfr
 	if (prxattrib->encrypt == _TKIP_) {
 		/* calculate mic code */
 		if (stainfo) {
-			if (IS_MCAST(prxattrib->ra)) {
+			if (is_multicast_ether_addr(prxattrib->ra)) {
 				mickey = &psecuritypriv->dot118021XGrprxmickey[prxattrib->key_index].skey[0];
 
 				if (!psecuritypriv) {
@@ -361,11 +361,11 @@ static int recvframe_chkmic(struct adapter *adapter,  struct recv_frame *precvfr
 			if (bmic_err) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if (IS_MCAST(prxattrib->ra) && prxattrib->key_index != pmlmeinfo->key_index)
+				if (is_multicast_ether_addr(prxattrib->ra) && prxattrib->key_index != pmlmeinfo->key_index)
 					brpt_micerror = false;
 
 				if ((prxattrib->bdecrypted) && (brpt_micerror)) {
-					rtw_handle_tkip_mic_err(adapter, (u8)IS_MCAST(prxattrib->ra));
+					rtw_handle_tkip_mic_err(adapter, (u8)is_multicast_ether_addr(prxattrib->ra));
 					DBG_88E(" mic error :prxattrib->bdecrypted=%d\n", prxattrib->bdecrypted);
 				} else {
 					DBG_88E(" mic error :prxattrib->bdecrypted=%d\n", prxattrib->bdecrypted);
@@ -373,7 +373,7 @@ static int recvframe_chkmic(struct adapter *adapter,  struct recv_frame *precvfr
 				res = _FAIL;
 			} else {
 				/* mic checked ok */
-				if ((!psecuritypriv->bcheck_grpkey) && (IS_MCAST(prxattrib->ra)))
+				if (!psecuritypriv->bcheck_grpkey && is_multicast_ether_addr(prxattrib->ra))
 					psecuritypriv->bcheck_grpkey = true;
 			}
 		}
@@ -618,7 +618,7 @@ static void count_rx_stats(struct adapter *padapter, struct recv_frame *prframe,
 
 	padapter->mlmepriv.LinkDetectInfo.NumRxOkInPeriod++;
 
-	if (!is_broadcast_ether_addr(pattrib->dst) && !IS_MCAST(pattrib->dst))
+	if (!is_broadcast_ether_addr(pattrib->dst) && !is_multicast_ether_addr(pattrib->dst))
 		padapter->mlmepriv.LinkDetectInfo.NumRxUnicastOkInPeriod++;
 
 	if (sta)
@@ -650,7 +650,7 @@ int sta2sta_data_frame(struct adapter *adapter, struct recv_frame *precv_frame,
 	u8 *mybssid  = get_bssid(pmlmepriv);
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
 	u8 *sta_addr = NULL;
-	int bmcast = IS_MCAST(pattrib->dst);
+	bool bmcast = is_multicast_ether_addr(pattrib->dst);
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
 	    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
@@ -683,7 +683,7 @@ int sta2sta_data_frame(struct adapter *adapter, struct recv_frame *precv_frame,
 	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		if (bmcast) {
 			/*  For AP mode, if DA == MCAST, then BSSID should be also MCAST */
-			if (!IS_MCAST(pattrib->bssid)) {
+			if (!is_multicast_ether_addr(pattrib->bssid)) {
 					ret = _FAIL;
 					goto exit;
 			}
@@ -739,7 +739,7 @@ static int ap2sta_data_frame(
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	u8 *mybssid  = get_bssid(pmlmepriv);
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
-	int bmcast = IS_MCAST(pattrib->dst);
+	bool bmcast = is_multicast_ether_addr(pattrib->dst);
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
 	    (check_fwstate(pmlmepriv, _FW_LINKED) ||
@@ -1136,7 +1136,7 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	}
 
 	if (pattrib->privacy) {
-		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, IS_MCAST(pattrib->ra));
+		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, is_multicast_ether_addr(pattrib->ra));
 
 		SET_ICE_IV_LEN(pattrib->iv_len, pattrib->icv_len, pattrib->encrypt);
 	} else {
@@ -1957,7 +1957,7 @@ static int recv_func(struct adapter *padapter, struct recv_frame *rframe)
 	if (ret == _SUCCESS) {
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
-		    !IS_MCAST(prxattrib->ra) && prxattrib->encrypt > 0 &&
+		    !is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
 		    (prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
 		     psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 		     !psecuritypriv->busetkipkey) {
-- 
2.32.0

