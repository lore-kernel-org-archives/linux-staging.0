Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE01B87C9
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562518; cv=none; b=S4/xX5ryQIssgmoptmFLzO5ZHpGprtI0TzaIZ5bu2vU/h2rHVY6gUmoRF5SSlEcOo0ey5Ie82qU56SfjmKdwu1XuPWHWUzcBR7yBjVF83CHvHhrYhD2WZgJwfwRXnZJXo/Yh61MvL9vxp2BvO1i4o1kFxMyfUssbPBVxOIoPwRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562518; c=relaxed/simple;
	bh=83LddXt6y9XsgGUPENIs/HyvLcB7pq36Dlo8ANwdI/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e1ugBEPMKwGJK1CtmUof1AE7oJSrDzN9dg0EvuEI8DBuA9oemrY45sgUwP2iGMPg8tYvkQ9qjSwdZ+ddv1Jm72RNiR0QwuM8sMdWTfSOn00egTxCdObhcf6gJYnefA3fXKupTeQJ5xpEBBjzqHZeHwEE/qQjoEWn+rghTMvl7Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnejTSj2; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnejTSj2"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c8f9846c8so7423016c88.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 22:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778562515; x=1779167315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dBwoxfNRgLrjQ0fBBhnPJbHvF1eN57dw8jk1dTBmQe0=;
        b=fnejTSj2HR1vtCgXowBY/scBDGh3HHpqofxcHBRgjVv8lCe1WXGLntlimaaWu8iS/n
         NvwX0WmLeb3WY//SnOshPqEf7IsgwZrtIgjmPHHCKKOsEdlOYRJiwunXlDTDLT7/Z2Lf
         MXg9HJDH3gl1QIEiIamBLAdZYj77EP2EhRHUbMek479SiBRWcVj865eC8jJwbWuIleVj
         GUfh2ODi0p4maVC/KToJGh5w89kNmr29IO8By049hBxVtwitvlzQSLyPidYsNJWnwmLI
         O+HXkNo8N4e56MKTynBKoB9u5GMuzu1IL4VaFhroU9s6kgGNK8ezGd92Yuh4KFTdgrxd
         9TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778562515; x=1779167315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBwoxfNRgLrjQ0fBBhnPJbHvF1eN57dw8jk1dTBmQe0=;
        b=rmd0xwOlgxeNMQOz+3IVaEck07Onnudww50yYdJJ2vWmWlBl773bUfQtm7eLV4VCsh
         u1AMM23p01DbubXFT8sfKEKgUEndQltzZ9ZMfV3UkfQrctyCkmxc0bHpBhaJnEUcCgc0
         cSud6nL83xk7tNhKfAishHTm1IFCbzL5DGPiiMxZgXWbAxTmdmxTZrDqycndsXBcAM1J
         z0uwxVPDhs9li5hTE0Esn1U4ppuRgugOKZIrbl1D2iLBZDqdBdJ5pc2dFbyI2vnhbIFs
         BPkapRXJvRdjHB90JNapVkz66C+yjVVmFBH3Glt006yWZqLb4iPC4jh4ELLPTn4OU/3V
         nVfw==
X-Gm-Message-State: AOJu0YwSlel75LSkWOP0y0ObdEojGKMKCdriooz4ia6ISWpQhV8jql+3
	seDKwJ7VGqEh2BjnNEUhrTQ/VEvGQK+Dal5mLF50KGrWPgKmauwQYdIJty1GYA==
X-Gm-Gg: Acq92OGYKelsRz2tlE3pSZ9msDRxtF26iNqtkq9AW+cTLyUOoko6+R/14LMXJW9Edte
	toVolBgDT2xdIoC4H2C7q4bJIR0bVYSJalGb6ieRs0jDWSEFHrTEJ9+1AzCw+SrEXJpwt68zSwc
	WeyWNyiZMka++TnhUw7Ml5M9TjUDzY5tq+mDPskkawne0hA5rToy0WdhtP49zYcj8oO9y4mzgts
	Yt9edKt4aJ6GkRiCVoACMLKx8sdA6RgN0/XoNXFcR2Ck9eIeX6+UxXMExjWmDf9bww8ayEwGaUt
	lft9heG1/To46nbICH5YlQUD8gPLbVCcIBHrELS7XGJmBS5L4OxKZ8MrO5f0WISwMZ2/GnjKm/8
	ROtGA7Fjnujvkrv3aqEQnFfc3/UnbSC1e0P7/VcY92K7hXmI65y1GOFoXmlfEXBkaNYxbVu/OHq
	xsyy5yFgnpvCmOU6KbhyyR6EgXVbt1ViBJkHNJsrsgdVQ=
X-Received: by 2002:a05:7022:611:b0:132:5db9:27b3 with SMTP id a92af1059eb24-13344fa52d4mr881931c88.29.1778562514995;
        Mon, 11 May 2026 22:08:34 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-132787673ffsm22405403c88.15.2026.05.11.22.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 22:08:34 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix unbalanced braces in rtw_recv.c
Date: Mon, 11 May 2026 22:08:26 -0700
Message-Id: <20260512050826.3117-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to if/else statements to comply with kernel coding
style.

This fixes the following checkpatch.pl checks for rtw_recv.c:
- CHECK: Unbalanced braces around else statement
- CHECK: braces {} should be used on all arms of this statement

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 30 ++++++++++++++---------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index e9ec6def7216..86c5e2c4e7dd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -115,9 +115,9 @@ union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 	struct adapter *padapter;
 	struct recv_priv *precvpriv;
 
-	if (list_empty(&pfree_recv_queue->queue))
+	if (list_empty(&pfree_recv_queue->queue)) {
 		precvframe = NULL;
-	else {
+	} else {
 		phead = get_list_head(pfree_recv_queue);
 
 		plist = get_next(phead);
@@ -276,9 +276,9 @@ struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
 
 	spin_lock_bh(&queue->lock);
 
-	if (list_empty(&queue->queue))
+	if (list_empty(&queue->queue)) {
 		precvbuf = NULL;
-	else {
+	} else {
 		phead = get_list_head(queue);
 
 		plist = get_next(phead);
@@ -471,8 +471,9 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 	if (res == _FAIL) {
 		rtw_free_recvframe(return_packet, &padapter->recvpriv.free_recv_queue);
 		return_packet = NULL;
-	} else
+	} else {
 		prxattrib->bdecrypted = true;
+	}
 
 	return return_packet;
 }
@@ -518,9 +519,9 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 			memcpy(&be_tmp, ptr, 2);
 			ether_type = ntohs(be_tmp);
 
-			if (ether_type == eapol_type)
+			if (ether_type == eapol_type) {
 				prtnframe = precv_frame;
-			else {
+			} else {
 				/* free this frame */
 				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
 				prtnframe = NULL;
@@ -539,8 +540,9 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 			/* else { */
 			/*  */
 		}
-	} else
+	} else {
 		prtnframe = precv_frame;
+	}
 
 	return prtnframe;
 }
@@ -746,8 +748,9 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 
 		sta_addr = mybssid;
-	} else
+	} else {
 		ret  = _FAIL;
+	}
 
 	if (bmcast)
 		*psta = rtw_get_bcmc_stainfo(adapter);
@@ -1144,10 +1147,12 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 		if (type != WIFI_DATA_TYPE) {
 			psta = rtw_get_bcmc_stainfo(padapter);
 			pdefrag_q = &psta->sta_recvpriv.defrag_q;
-		} else
+		} else {
 			pdefrag_q = NULL;
-	} else
+		}
+	} else {
 		pdefrag_q = &psta->sta_recvpriv.defrag_q;
+	}
 
 	if ((ismfrag == 0) && (fragnum == 0))
 		prtnframe = precv_frame;/* isn't a fragment frame */
@@ -1530,9 +1535,10 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 		 !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
 		/* remove RFC1042 or Bridge-Tunnel encapsulation and replace EtherType */
 		bsnaphdr = true;
-	} else
+	} else {
 		/* Leave Ethernet header part of hdr and full payload */
 		bsnaphdr = false;
+	}
 
 	rmv_len = pattrib->hdrlen + pattrib->iv_len + (bsnaphdr ? SNAP_SIZE : 0);
 	len = precvframe->u.hdr.len - rmv_len;
-- 
2.34.1

