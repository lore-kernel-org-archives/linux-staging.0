Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B723F38D68F
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753248; cv=none; b=mv5toACdn4wPDQ7Ks/pcTNKDCbNLELRAb43S/s+EJKpy3PMBifw1Yo7KHmdsFiFrUyqNDuhwpQDUvfWwcaxPlQuS7fceMmc99Di+9KTIJcIoj0xtQ/qUQfENDfzNsEtcLMlJsQQbiKDP8iOyz1A9MtJn3SeLOuG20VQ21e9i5aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753248; c=relaxed/simple;
	bh=nrczOfGVC80s+tKVDd3e9ohV6aT19hUDJHpFQ9xSAjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8kY2VYh2mUxvdX/sVkBh8EgjxfDAmoTnaUQZ6W38Q6DzTn4i2Nh36zKFBaAWj1mHabPokMeQOXG3N6Uj55lEbOtKdj35Fp6BUN40dv2+UAfLpRco2FKJgn/l8RXM+JNl2VoQriYPmrQou6/uyXsx/jXDLNJVFRJu2KndbpOdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nt5NAr2K; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nt5NAr2K"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-132830d8281so1447830c88.1
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 03:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778753245; x=1779358045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEDmPs3IEzkMNu9wS4D7y4et1HievtNnY5UColUpsPw=;
        b=nt5NAr2KmwgmGAL80YrLFL6TK0h+o4ihrpOgnq1aZ224yHrMIoU+KIKHq/l6VMU+Rp
         QwHR1grdKg0nUpTSuxDdKfwbL2nHZvPjj5WXJqdpfVWGnD/cbag3xkS6PEfjEUCDc0pS
         AClLgb7e0nrDpTtUm4h5/VM+rCX3l1m9HPTI8qxtwp+ROLhMXtkcm5bZXiBbnJPTpqb+
         iJ9awO6ZvVVDx7GKG5NAO2sRMD+KeoAMf4inKKrtIk4yJSsFK44nhKZHf45tNNejimao
         zPmqxN37CtYvNEfbeCP2ADjJdX4+W3rDe0oajxFQKYl8fr/enF5sl/RSElUT0PZZje8M
         5Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753245; x=1779358045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEDmPs3IEzkMNu9wS4D7y4et1HievtNnY5UColUpsPw=;
        b=C4z7gVRt1D6SN8PnjAe3nE/YfyxcDas6fkuuiyU0qcmsnrBa8t3cbUUPHz0NIdBzQo
         z3gx7gddwpFrvbd13H3z8xcNuS3qyT7u5rJaRdvFB2Dv3/CInbx11eOQRxbl/kCF/KYJ
         RdqKdN/4XoEOVhKsLrVZZLDxnvtKn0AaPYn6azWlaJLFJP4GXStU1dsijinbmds3AHpN
         19AidYPmv1W8aIZlc4O6VIE4KWlci7gohpmZ0pQwG8FYFlbEVVDlqO0REO7iDXHt41Ht
         UQuZqiEFiwa6DwmJnIuTnhVesO3jW1y4IFploQhUpyKxGXU0BmFZ5TxeyFwMBHSH9pjm
         WrSw==
X-Forwarded-Encrypted: i=1; AFNElJ9miPaK8mMiQQYc3deJUtSN8hBSsOZ0CgwXRQTjyxUHJSyqRqI48wy8dl1wYqhVKAwC7tvQELhRIWeoL6uj@lists.linux.dev
X-Gm-Message-State: AOJu0YzjbByj5mif4uwm7oZWgD55Q5e3dIzAVc1ehw4zBDC7C6oyMzu+
	WniJbI6A6w8WFdEFYeAU6Afzb71LL3ca05V0iK6NPRBaFGPWDWuTw74p
X-Gm-Gg: Acq92OGFwkLeV1mWrB5wiG0JO/rTfr3Y+D0m4vKX9aVt3T68jHlCWsa3Du6Yku7Ov3i
	qnM6s2dlAN0HSXdrlTNc37C/7kgPZ/YCpJUnFsPpr2emzrPkxL4Rufp4OGZaqprqHHGSTCmPt+a
	WG6fyRmae/sxUsL+P1VJCd50/lhgvM8+/1OAisj6UtG/LIIwvH+c9csu7RBwENJYocdf4TYzv2C
	Ow7cpGyVxgJoe2P6TqhvoXXnKS87uoKleHKd+eea8w5Nq5rn1nFT7BZFEJsbFko5NK8PqNflU7q
	PdZxpPLiFD17HCCx0wWfGGoA9FT256NEspLEf8lef2laG9U38vsX5L+bwAZI+keRGpc7/X8tBjm
	Fl8CFhZzdE9dRxGjAZ5GaD8Vy2ctRZRgJqwCbCoXGNCxHNog/vocvklWcZEpFTu69Yec/1BqreV
	7De+p/haE136dDUN0wJ1GdCR4h8riWShsTJo3T9PexfEY4crg6zZkjMTOmbFlktW+FJQ==
X-Received: by 2002:a05:7022:10b:b0:12b:f881:d8fb with SMTP id a92af1059eb24-1342ee3a2aemr4711893c88.3.1778753244970;
        Thu, 14 May 2026 03:07:24 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm3757921c88.3.2026.05.14.03.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:07:24 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 2/5] staging: rtl8723bs: make rtw_xmit_classifier static
Date: Thu, 14 May 2026 10:07:05 +0000
Message-Id: <20260514100708.25031-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514100708.25031-1-dennylin0707@gmail.com>
References: <20260514100708.25031-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_xmit_classifier() function is only used within
rtw_xmit.c. Move it above its caller and make it static to
limit its scope.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 68 ++++++++++----------
 drivers/staging/rtl8723bs/include/rtw_xmit.h |  1 -
 2 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 72e5dddfee5d..b3953bdedb04 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1821,6 +1821,40 @@ void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pfram
 	spin_unlock_bh(&pframequeue->lock);
 }
 
+/*
+ * Will enqueue pxmitframe to the proper queue,
+ * and indicate it to xx_pending list.....
+ */
+static s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
+{
+	u8 ac_index;
+	struct sta_info *psta;
+	struct tx_servq	*ptxservq;
+	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
+	struct hw_xmit	*phwxmits =  padapter->xmitpriv.hwxmits;
+
+	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
+	if (pattrib->psta != psta)
+		return _FAIL;
+
+	if (!psta)
+		return _FAIL;
+
+	if (!(psta->state & _FW_LINKED))
+		return _FAIL;
+
+	ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
+
+	if (list_empty(&ptxservq->tx_pending))
+		list_add_tail(&ptxservq->tx_pending, get_list_head(phwxmits[ac_index].sta_queue));
+
+	list_add_tail(&pxmitframe->list, get_list_head(&ptxservq->sta_pending));
+	ptxservq->qcnt++;
+	phwxmits[ac_index].accnt++;
+
+	return _SUCCESS;
+}
+
 s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	if (rtw_xmit_classifier(padapter, pxmitframe) == _FAIL)
@@ -1863,40 +1897,6 @@ struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *
 	return ptxservq;
 }
 
-/*
- * Will enqueue pxmitframe to the proper queue,
- * and indicate it to xx_pending list.....
- */
-s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
-{
-	u8 ac_index;
-	struct sta_info *psta;
-	struct tx_servq	*ptxservq;
-	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
-	struct hw_xmit	*phwxmits =  padapter->xmitpriv.hwxmits;
-
-	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
-	if (pattrib->psta != psta)
-		return _FAIL;
-
-	if (!psta)
-		return _FAIL;
-
-	if (!(psta->state & _FW_LINKED))
-		return _FAIL;
-
-	ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
-
-	if (list_empty(&ptxservq->tx_pending))
-		list_add_tail(&ptxservq->tx_pending, get_list_head(phwxmits[ac_index].sta_queue));
-
-	list_add_tail(&pxmitframe->list, get_list_head(&ptxservq->sta_pending));
-	ptxservq->qcnt++;
-	phwxmits[ac_index].accnt++;
-
-	return _SUCCESS;
-}
-
 void rtw_free_hwxmits(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index b0189a703d28..a2ff62182b97 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -440,7 +440,6 @@ extern void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac);
 extern s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 
-extern s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe);
 extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
 extern s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
-- 
2.34.1

