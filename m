Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D783FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:02:28 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id x12so25883993wrr.11
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iiH0QAta1EQrMPpCuR5gGeqObp4Krd4m3HvoNHVwjIQ=;
        b=rYb22mNB1yn3yPu469+092IchwHhkfzwonNdGbioZmZDMz5++FBW4M7xWgl/uivf8H
         V75qnVLE8pP6YiLzKdLhhUw1WmwtNfOGgw559Ty3Z3qYLKdQw2z4zxv/vHl7x/QXcJvo
         Es/YCVqVQy0R+Hnn+z+0VPBN8Se9p1CT2rcWB1qndhFVRdLiJ47Sj23TgmOLG9AkFyxa
         V/znLXnn7EmnRoeBgbc8EyedI+kYFPVvmRjFNtW0EMo6h+BDCRnXV2b6KwrqGNnmYW6K
         zuulQXMPlAunG63o7p+dh1K5tmEOp+Qwz3SLcF3vjr8AxGRFXN07mBn77Gt5hTvIE9aW
         Gf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iiH0QAta1EQrMPpCuR5gGeqObp4Krd4m3HvoNHVwjIQ=;
        b=c5pMva4INxstrnpPG3/OP2KcJO5Z797uM0Q984kM0gb5LMSISElwL4wwAbUQ0tg1wx
         yE7CkpcwryHfoCDiCg4icLW1XSl9EQv8qgN5usGNfn258x7+wOOi6dwkt6SUVPitXBNK
         m2K0t1rPVWMM2IjAUW39XNp06LGqh+JIobK9WcxtZaeYRCrl08QX9N7s77MixYAF5tCV
         rLtmX0AquHVAXUiKCoAMzXQ4LOWqyRnQx7DJ+Njpgu27q5LTlB3blKeIrQV+UrcNbDYc
         UvI/z4bq78OFFRZjmIFTxByerd59jEmOTxDj2MZbONboD3RZ+MwaVXX6bFRt1/2AEa1b
         DdZg==
X-Gm-Message-State: AOAM531h4rlrRThRQT18MQyRVkRi15qPg6q1TEjxb4RspJAgJUp3HLoy
	PQ2ybwDIHC+nwhAw9YHJnK0=
X-Google-Smtp-Source: ABdhPJyFVaMr1SQcTY6bNzpxZmuh7s7fkPH/cb0/O6BBqAojC4VvPN2sWwcV7uPH9sr+D5G3wv7b6A==
X-Received: by 2002:a5d:65c2:: with SMTP id e2mr13051492wrw.191.1629720147468;
        Mon, 23 Aug 2021 05:02:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id g5sm901332wrq.80.2021.08.23.05.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:02:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/8] staging: r8188eu: use is_multicast_ether_addr in core/rtw_xmit.c
Date: Mon, 23 Aug 2021 14:01:04 +0200
Message-Id: <20210823120106.9633-7-straube.linux@gmail.com>
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
 drivers/staging/r8188eu/core/rtw_xmit.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index f242f3ffca70..b901d4398f03 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -411,7 +411,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	struct sta_info *psta = NULL;
 	struct ethhdr etherhdr;
 
-	int bmcast;
+	bool bmcast;
 	struct sta_priv		*pstapriv = &padapter->stapriv;
 	struct security_priv	*psecuritypriv = &padapter->securitypriv;
 	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
@@ -472,7 +472,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	if ((pattrib->ether_type == 0x0806) || (pattrib->ether_type == 0x888e) || (pattrib->dhcp_pkt == 1))
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SPECIAL_PACKET, 1);
 
-	bmcast = IS_MCAST(pattrib->ra);
+	bmcast = is_multicast_ether_addr(pattrib->ra);
 
 	/*  get sta_info */
 	if (bmcast) {
@@ -597,7 +597,6 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct	xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	u8 priority[4] = {0x0, 0x0, 0x0, 0x0};
 	u8 hw_hdr_offset = 0;
-	int bmcst = IS_MCAST(pattrib->ra);
 
 	if (pattrib->psta)
 		stainfo = pattrib->psta;
@@ -615,7 +614,7 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
-			if (bmcst) {
+			if (is_multicast_ether_addr(pattrib->ra)) {
 				if (!memcmp(psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey, null_key, 16))
 					return _FAIL;
 				/* start to calculate the mic code */
@@ -715,12 +714,10 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 	struct sta_info *psta;
 
-	int bmcst = IS_MCAST(pattrib->ra);
-
 	if (pattrib->psta) {
 		psta = pattrib->psta;
 	} else {
-		if (bmcst) {
+		if (is_multicast_ether_addr(pattrib->ra)) {
 			psta = rtw_get_bcmc_stainfo(padapter);
 		} else {
 			psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
@@ -907,7 +904,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	struct xmit_priv	*pxmitpriv = &padapter->xmitpriv;
 	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
 	u8 *pbuf_start;
-	s32 bmcst = IS_MCAST(pattrib->ra);
+	bool bmcst = is_multicast_ether_addr(pattrib->ra);
 	s32 res = _SUCCESS;
 
 	if (!pkt)
@@ -1801,7 +1798,7 @@ int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_fra
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	int bmcst = IS_MCAST(pattrib->ra);
+	bool bmcst = is_multicast_ether_addr(pattrib->ra);
 
 	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 	    return ret;
-- 
2.32.0

