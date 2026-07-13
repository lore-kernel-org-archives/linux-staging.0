Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6424368D5F
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926358; cv=none; b=fyoSV14z3BEF2JhhpLACFTGs6qRhhWhbvnXYOs7RujaHEFtHtWUQ5nt0xImUrpaV3gitEguoNWCcmJZjDk98b+X+nBMaj/pyviavRIM7Cw+ZBxuZuD/7Bwpg3ZO4PRuv7yhTwwuWaVffS4FEi26gwkLHm7/85jSk7LCkxkpG3WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926358; c=relaxed/simple;
	bh=XzfgW/QIAC3UIidbn9HJWxF8wgWeSp6iQuDvdi+K8hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lH4WblbAf/xE0XcaZyT5rSaD7Lt2dhIMnMoCcJf+3q/8/38sR00yRA48QSjTusfy6GwtziAOKnC428I922Z8Wxx0prCNkA/BUURAQmY/cV8ijqPoFYx4E3Jf9+wmUU0mLbCuB89C/RR+h69u+PJ4sRQu04Jf7vIjq4ndxgXy7rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqBDlxte; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqBDlxte"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-388b404ea89so2291401a91.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926356; x=1784531156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkIMlCQQAnln+Op2DNgA0UlpbuYk4uUCoqJrhtqHg84=;
        b=dqBDlxteR/TwsaSaMumVUde8C/lg5Z2LFzw47Wivb/Lr7Y5J7IoMn4prirAsWmjmAQ
         XnQyx4QTmdshMZgbEQjgjsb3J5RWFzW0bOMz+z2b3zrw8t+mr9Jtkc4QQRMx5PMMtBm2
         t/DLmjgIJ/zREPTijrp7FJKRXgQ6ykZBeeY26eIP1O0ZtqTQScCIjTt2roqGMoHy6SrS
         nUhkSiy4FS/ZdLZvFmqb1RMs9zLnI2HYGE5ev6JtR8B3qwBOXTTxuz7h9Ne344vCCLc/
         kmT2QI9J/c6WCkI+JjkYi7hCnaQfxNBHEQauo8G4aYoaL35lRTIr/PJTswarNYJNzYJl
         6okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926356; x=1784531156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkIMlCQQAnln+Op2DNgA0UlpbuYk4uUCoqJrhtqHg84=;
        b=k2jfuuzNmLDxpm8Dr9S5EhqZ+s0beWLTIAdxIHkCx+VuhhMuRxMuVYPp7VjcJceuIU
         vc9E/T66JDFg3jx7Dh1mQu1uauojtKWnwSVcPWWVqiZDhU5mS6stzUlclKToD9kzcEiE
         Arkb8baXsBNK+nDhxbJkemAwv6K9+D0drjME/U0Jbxc2tzUkDvIs2T6KGnStij9dx/yy
         Zdt5Pjgeq/k5Pd/i0fbSXgz/Q3mSroeVsBKHy1jnK9nC7W2jr7MmumovJOvbE3JYWi7k
         sCT40C3AAgFhi4BGe0G5vD5Pb5duswJbUNf6KNj6OKfNIoUwFNf9p+MVXo9d2dXegx50
         9X0A==
X-Forwarded-Encrypted: i=1; AHgh+RpFX6CCVh5HuHfMwRrYrsSviGm5p1bUKKYEHahSnP/RiVp9RGxkeQGf8WUHnjSVzUZe5tJdx1N/dBLn199D@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz70cwnIH3eLZbDAx+79IYjy6L3DOJs/KPdOXzTtdqNKDVQ5sB
	/JUBlXbuncMFrm0O6yjxf0hprkf6r8R4R2Id5/rtfbhsCeCs/rra+UBt
X-Gm-Gg: AfdE7cmzlqzZd7c9+WtzispC+d+gi2tU2LdJaCeR+I5KX/hrjEi0zIEEe53XOk3ZsGG
	cmToDpqke3MrKlrGH3k2S+v/GV+pqt/agr6W00Tfxc4yHxrtcX0gGPggEiL4xEnptjXABThQaO7
	5GHjTnE5bezlmbo63hMctcZybch50Dd0J1eZE3+w2yqmhGkWlKfi7M1pXEQh57dBYfhVYZrdO+k
	GuMDkBqkMvT63usjQwK3bmUjrbU2i3/CHTHZY51tGNa9z8azGLWBjQd50toKczjwfgmAalVXtqC
	i6BxlnQdpcYdNo66K7JarpBqivcQtHeIsHqNdLe1xCFFrayayGUZKawptsrVIv0o3He4iC8KFuT
	tzjQ6ghCf5jJh/5jbgSia4S2bXLGxEyOGzPhv8mjCg5t5UjkQj5znutm8v0Teph2T1/OH0gYiEu
	cgg79P8GTS/EaNkLtpI+G3e5gKh5LCBqboBkhSzTDBoL9vwF/xltqD89/lphdjzhlL6g==
X-Received: by 2002:a17:90a:d2c4:b0:38d:d9a7:a4e9 with SMTP id 98e67ed59e1d1-38dd9a7aa3amr3766897a91.11.1783926356166;
        Mon, 13 Jul 2026 00:05:56 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm33971943eec.28.2026.07.13.00.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:05:55 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: convert rtw_make_wlanhdr() to return errno
Date: Mon, 13 Jul 2026 07:05:34 +0000
Message-ID: <20260713070537.15903-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713070537.15903-1-dennylin0707@gmail.com>
References: <20260713070537.15903-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rtw_make_wlanhdr() to return 0 on success and
a negative errno on failure.

Update the immediate caller to handle errno return values
while preserving the existing _SUCCESS/_FAIL semantics.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 15 ++++++++-------
 drivers/staging/rtl8723bs/include/rtw_xmit.h |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index ff67e2576b31..98b886732646 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -903,7 +903,7 @@ static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmi
 	return _SUCCESS;
 }
 
-s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib)
+int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib)
 {
 	u16 *qc;
 
@@ -950,7 +950,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (pattrib->qos_en)
 				qos_option = true;
 		} else {
-			return _FAIL;
+			return -EINVAL;
 		}
 
 		if (pattrib->mdata)
@@ -978,13 +978,13 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 			if (pattrib->psta != psta)
-				return _FAIL;
+				return -EINVAL;
 
 			if (!psta)
-				return _FAIL;
+				return -ENOENT;
 
 			if (!(psta->state & _FW_LINKED))
-				return _FAIL;
+				return -ENOLINK;
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
@@ -1024,7 +1024,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	} else {
 	}
 
-	return _SUCCESS;
+	return 0;
 }
 
 s32 rtw_txframes_pending(struct adapter *padapter)
@@ -1093,7 +1093,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	hw_hdr_offset = TXDESC_OFFSET;
 	mem_start = pbuf_start +	hw_hdr_offset;
 
-	if (rtw_make_wlanhdr(padapter, mem_start, pattrib) == _FAIL) {
+	ret = rtw_make_wlanhdr(padapter, mem_start, pattrib);
+	if (ret) {
 		res = _FAIL;
 		goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index f67cb22e3396..303b50051274 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -410,7 +410,7 @@ extern s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitb
 
 void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe, int sz);
 extern void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len);
-extern s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
+extern int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
 extern s32 rtw_put_snap(u8 *data, u16 h_proto);
 
 extern struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv);
-- 
2.43.0

