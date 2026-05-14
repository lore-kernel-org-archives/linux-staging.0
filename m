Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3F39656E
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753250; cv=none; b=rF8/3fRUx5QjRTogzF7AYmoMKPev6fnMaZi1WWMmE1/qmm9i3zQRMgfgx9OkJrcdOcQhb2gzsS5RzOi3FZzglXR1NnwM5w+KcFpMDnKnMroJ7pqj7m79KNXdethnET14Thds2W9+xsHQ0634VP4+yofCzLB6p1dSRBUNbVmZIs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753250; c=relaxed/simple;
	bh=Lx8tjc2hi/BxnlTzuA9QV3HwAbmze/Wwgnxtiq84N/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sWmpa3JDtHS7rLV12fzurxxrQQatLmdh69X46W1FfSb4ZZ2h7m6rCMjuwmKpwndduC9HNgpYf2vLDqMfF84pIiPPZS8SXf/9RL0Ru5NnDOW02VfLFvmZ4uo5YxoTTLjeqq8XTlDt5wkVWSifqW0zgQvr5RIwKkgq5DDRS91hdgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZgzj5f9; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZgzj5f9"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12c1a170a50so10862542c88.0
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778753248; x=1779358048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JlJ+zwzmXqUTxE6mP3nEpdnrhD+xyjOREjmHfGZCMw=;
        b=MZgzj5f9S8YmwBG4XIECm9nZHIeMcQLMm8a8PJQjynG1hmJbGP2q7HrQYc/updnfql
         AcjMfr+YYFKG+v229lXi7cvxaO4Lwoi4viXEW+ROyzkJg82pWhUlzGJZw9Vb+AZW52YS
         68D201LtEDC5seWDKgOuMA3DgINMYLi2XF8ZPMftwTCbjmoS63MuA1fVHfxpVswZhxis
         PDI0nItUi7m9nqmpBNdTGQSELBvO7Fh7kXbcm02YsxXklh+ErEsS0SSUkiggH+3rxImc
         DeQYKLN4gz8eKSqAPVtn5xSdj9IEGIXUkF6RUN/cem5gAwEIuqHUywU4PJdoaNzt9q5g
         fz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753248; x=1779358048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4JlJ+zwzmXqUTxE6mP3nEpdnrhD+xyjOREjmHfGZCMw=;
        b=raJdrZcdMZcC8s16jRAnnJ+XLMYLE9eI4h1OlQZuM5cnl8B2EbOVRjCvKgoF4pffiG
         oWP2VBgusrNCvypmmpJYLKr9lzWKWxEOe1+OkjrFmgi9ZMdkNBdoZ3jG4BmktEfXnj5U
         CNLIUOpBhQAyY2SGQhnAGs5Z4bjUTkzxtfh8Upf45MIYSLsHSZxCnERrx/tVvh7wuI3p
         9hpgkCy89caVg4D621w3h2MUWM8aIeMqvNdk7zMoXcgg+9nMUNs3ONY/e8fQRIrv4zre
         P3isgMJAmMh2elYAwbATvEydre5tXr57Cg4hm48KRpaapZbfOQQF4w047nzmMnkwfzQN
         P9KQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SEC9Nx7nVoMeQgkBMDj9xBTAtFwcXEeQaDv3wf+a6ShqJNOpZrw0bqhpg0oYFa3nTN3AR7LMnnLrHLXAg@lists.linux.dev
X-Gm-Message-State: AOJu0YwtZfDpAAgHjreQ9/EY2vBBwzWL6JCAS3eMZsOkWxhkM2eJUllT
	5K0PyAqow3tZAzDLaa4HV2i0MB59viUBDjleH4ayTn7Cnu4vFRkHs8wM
X-Gm-Gg: Acq92OFqTtHyr44hCrkfnAJUG2CM40SotugdEie/qHNmFwos6+74JQfiF68cbGyADwB
	WsGDwXK0ztZfLDpnJKPrn95hN5v/QRvjUKzRcpUfQIdKx6gyFmzZgqg/xQ3lTo/83VCSVFImnoH
	p6ZWdQXGYbIPEzAeDYz9f7bqCBtDqUPtXuQ+JgWTwy9zS/qlEWnoHAKrV55MHDV4Xmruo2cXSIq
	DcZNa/No9IzFlLUwqR+hHKLbHEXHl2tA9lfpZ6oWSGLvon53zFfXXAJ98WY15N4ckkkG3/yeMC0
	kx6GpMzBAwj6mTpR8rjElwQtTrBvEDqG5XbqBxg1AGOCcMggqyDiKQoUj9JyQ/kbihPm3pwtIm3
	MEnRLJJsL8lS2Eobv0P6PjPhaDP38WdPHsygI8zJjEEzd7rauCaY1xS0nIC0J2z5H+SEWDYYFq1
	d1EZFvhSKRMeoIu0E7LO3vXC9rqqLLmN+8SKU12vLxJvEPDQSzBjl4eeg=
X-Received: by 2002:a05:7022:e984:b0:128:d450:bc76 with SMTP id a92af1059eb24-1349ac708damr3929784c88.26.1778753247541;
        Thu, 14 May 2026 03:07:27 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm3757921c88.3.2026.05.14.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:07:26 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 4/5] staging: rtl8723bs: propagate errno through xmit enqueue path
Date: Thu, 14 May 2026 10:07:07 +0000
Message-Id: <20260514100708.25031-5-dennylin0707@gmail.com>
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

Propagate errno values from rtw_xmit_classifier() through
rtw_xmitframe_enqueue(), and update the local enqueue caller
to check for non-zero return values.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c      |  6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 10 +++++-----
 drivers/staging/rtl8723bs/include/rtw_xmit.h   |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 80f3dfaf793d..054cb4c9d1de 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1855,15 +1855,15 @@ static int rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmi
 	return 0;
 }
 
-s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
+int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	int res;
 
 	res = rtw_xmit_classifier(padapter, pxmitframe);
 	if (res)
-		return _FAIL;
+		return res;
 
-	return _SUCCESS;
+	return 0;
 }
 
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a7f23335cdd9..ff82b6efefc7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -464,8 +464,8 @@ s32 rtl8723bs_mgnt_xmit(
  *Handle xmitframe(packet) come from rtw_xmit()
  *
  * Return:
- *true	dump packet directly ok
- *false	enqueue, temporary can't transmit packets to hardware
+ * true      dump packet directly ok
+ * false     enqueue, temporary can't transmit packets to hardware
  */
 s32 rtl8723bs_hal_xmit(
 	struct adapter *padapter, struct xmit_frame *pxmitframe
@@ -491,7 +491,7 @@ s32 rtl8723bs_hal_xmit(
 	spin_lock_bh(&pxmitpriv->lock);
 	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (err != _SUCCESS) {
+	if (err) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
 		pxmitpriv->tx_drop++;
@@ -511,7 +511,7 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 	s32 err;
 
 	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
-	if (err != _SUCCESS) {
+	if (err) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
 		pxmitpriv->tx_drop++;
@@ -519,7 +519,7 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 		complete(&pxmitpriv->SdioXmitStart);
 	}
 
-	return err;
+	return err ? _FAIL : _SUCCESS;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index a2ff62182b97..b13f16716e98 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -438,7 +438,7 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv);
 extern s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe);
 extern void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue);
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac);
-extern s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
+int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 
 extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
-- 
2.34.1

