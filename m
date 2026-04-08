Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118BB3806B8
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775646850; cv=none; b=so3JJIKs4M8LjUVO/7NKW9oJb88IFrbS+xN1vw3Xdx9VBJq5Y0rZABpq/7EgdQjnS+hTt9rKmWhtgBcXaqV6SXRxYVwKrbhd7wlB2lug0r/2Hf77+wUr/CwsiksdbVyTxZY4vfLaNIeo0NfP5+8DxlgBHMMXLuPq2/ecUXXwyfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775646850; c=relaxed/simple;
	bh=UKGoTvygU9/qk9ny9Ksdv4RHhLzICwFIrRSmxE3H/bI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p7Din3NtD85XVgqIVz81Vn4l086cWNco50N2+dC6X3eSnm1vHV8mXNoE01K2tUK5Qfz5eEiVx9HhZCoKPTgoLqbwOHUNHz+i0u9gClATiJjLHRwV0jlT9PNUhHpPRc1LL/swYhSYsIYJFCAN84jJcc2L8dinrB7LAelhJt+Gh2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIVWSEu+; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIVWSEu+"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2c15849aa2cso8386672eec.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775646848; x=1776251648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2u/ibJfkdJGWdmo2I009UtH6vmzi29RSvoCTFJTa1s=;
        b=aIVWSEu+vxFjewwfnuCMXtdORW3LjJHVB3+nVXr1uw11kKlafWD+xvKyBQKgVRp55z
         UFJ1vGG5YsoruIZdw8wTcmWVeazx2GGd8UZX8KGVZePjDHMLg9J+E3rzEHQd89FRcGPi
         pGkBQNrKDY73msjc00vzhfgrziFWoFik83oftgAaAIy7sf/6YjtGttkRO0RqTAMC8AR7
         TSo5r6EDpr1TDPJlohwoKYtzcep7HyhOLnvX93CVHfV+FfYvrz6wPFgPfj4auEW5P/h1
         y1eN6e2sqwmeW05feIVwSzOL2dVBvrqe1Y1oZ/wjdNiZ2KnO44592YHYvnHLtW9FL0eg
         JNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775646848; x=1776251648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H2u/ibJfkdJGWdmo2I009UtH6vmzi29RSvoCTFJTa1s=;
        b=JYPdDwJloGxnSU7stMw9egcJuD+Tq0s4GhPm7/OCSg5xBKv5er5ksgZ+crrH0xcTp7
         9hgl4NEPKw9DSqS/6SwHHM72NSDkYRvcnV1RBURZtAgsB8V41DkQbPiItxbbA5xnrzVk
         wQfhWj35UmnWEw2tqbsfC99zoqPhVQzl9lScuNkBnignNDaz4PHpSrhsxE2O96BdPbpY
         V11yxQuLQpAlav5zC7hGKnVis+ND6XymHXyI/YdBIqdJt7jFwjL95Dp7E1b/W0zr7kyP
         pHUnTY4s01BoF88lFrMEGBMiz3Dmg44iybtth+HC9nDXWAiVpSSYeje6t+5W7mqxYOlr
         K7yg==
X-Forwarded-Encrypted: i=1; AJvYcCW3mN1p/hRlRcOuaZkEwVWnIXJGI/mJjAz5DO2ZlKZxviHIGxsZ/0JAO/9wgOHnN4ZGuO5GjTbhZR5cJYAM@lists.linux.dev
X-Gm-Message-State: AOJu0YyxRbk0iKdR6w7fdostfh36yFicxT+r/YzlFTtyfwh6z5EayL30
	OfXlxegbYJh+oxiMpl4OD09u30+UVSLHMTugcsp9tSQCR7Ifk5lwQkmS
X-Gm-Gg: AeBDieuXJdsk6wfSx4u4nQu8VkarN5a6xtQl4LLt7f2naEJUrJ0JfKXjcypFPDgpq2D
	/8mpWsRuyce68ny6NqMP7jRmehQuRvJFLlgd/iRgibIt8QCWLgqsx4THZU0bZnbWz2acUwr5I8+
	P/lcCESIFHcEuLC69hG6UL73ldWfxTNrps1iaN8eMf+p5XS/6TEzC8OSpXnb2xyK8cbvWvqEoWo
	98H0R4XvmBRIJ6Xz+EcxJUB8YWMbY4mALtfotwtSvHSWgDda1NCf2bMQMEik9OMXm+mN00ba0gg
	FPRjpUdzFHgScj2cy8fqZ2WBXu543CLEnl5zwRp25SCQg9qJpch60i8coXJp7FWu6s2e43B54nN
	unt5rmCeg/JHHrpCyLikyVXVtLWdiQP4fkJ60ATp9WN9uDZhkY/XgkDEdyZzB3P5dcg5oqgs05f
	zEMZkXM4rG8kbvY+YKELcrfqwaedSmm8lBQjGubkJkJv7MSmHsWs0TgmQ=
X-Received: by 2002:a05:693c:2b14:b0:2c1:7a0e:394 with SMTP id 5a478bee46e88-2cbfa2d754fmr10735253eec.12.1775646848078;
        Wed, 08 Apr 2026 04:14:08 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm21228019eec.17.2026.04.08.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:14:05 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 2/6] staging: rtl8723bs: make rtw_alloc_hwxmits static
Date: Wed,  8 Apr 2026 11:13:10 +0000
Message-Id: <20260408111314.19329-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408111314.19329-1-dennylin0707@gmail.com>
References: <20260408111314.19329-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_alloc_hwxmits() function is only used within this file.
Make it static to limit its scope.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 80 ++++++++++----------
 drivers/staging/rtl8723bs/include/rtw_xmit.h |  1 -
 2 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index f64ec8e271ed..b86c9c2f3b93 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -33,6 +33,46 @@ void _rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv)
 	INIT_LIST_HEAD(&psta_xmitpriv->apsd);
 }
 
+static s32 rtw_alloc_hwxmits(struct adapter *padapter)
+{
+	struct hw_xmit *hwxmits;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+
+	pxmitpriv->hwxmit_entry = HWXMIT_ENTRY;
+
+	pxmitpriv->hwxmits = NULL;
+
+	pxmitpriv->hwxmits = kzalloc_objs(*hwxmits, pxmitpriv->hwxmit_entry,
+					  GFP_ATOMIC);
+	if (!pxmitpriv->hwxmits)
+		return _FAIL;
+
+	hwxmits = pxmitpriv->hwxmits;
+
+	if (pxmitpriv->hwxmit_entry == 5) {
+		hwxmits[0] .sta_queue = &pxmitpriv->bm_pending;
+
+		hwxmits[1] .sta_queue = &pxmitpriv->vo_pending;
+
+		hwxmits[2] .sta_queue = &pxmitpriv->vi_pending;
+
+		hwxmits[3] .sta_queue = &pxmitpriv->bk_pending;
+
+		hwxmits[4] .sta_queue = &pxmitpriv->be_pending;
+	} else if (pxmitpriv->hwxmit_entry == 4) {
+		hwxmits[0] .sta_queue = &pxmitpriv->vo_pending;
+
+		hwxmits[1] .sta_queue = &pxmitpriv->vi_pending;
+
+		hwxmits[2] .sta_queue = &pxmitpriv->be_pending;
+
+		hwxmits[3] .sta_queue = &pxmitpriv->bk_pending;
+	} else {
+	}
+
+	return _SUCCESS;
+}
+
 s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 {
 	int i;
@@ -1852,46 +1892,6 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	return res;
 }
 
-s32 rtw_alloc_hwxmits(struct adapter *padapter)
-{
-	struct hw_xmit *hwxmits;
-	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-
-	pxmitpriv->hwxmit_entry = HWXMIT_ENTRY;
-
-	pxmitpriv->hwxmits = NULL;
-
-	pxmitpriv->hwxmits = kzalloc_objs(*hwxmits, pxmitpriv->hwxmit_entry,
-					  GFP_ATOMIC);
-	if (!pxmitpriv->hwxmits)
-		return _FAIL;
-
-	hwxmits = pxmitpriv->hwxmits;
-
-	if (pxmitpriv->hwxmit_entry == 5) {
-		hwxmits[0] .sta_queue = &pxmitpriv->bm_pending;
-
-		hwxmits[1] .sta_queue = &pxmitpriv->vo_pending;
-
-		hwxmits[2] .sta_queue = &pxmitpriv->vi_pending;
-
-		hwxmits[3] .sta_queue = &pxmitpriv->bk_pending;
-
-		hwxmits[4] .sta_queue = &pxmitpriv->be_pending;
-	} else if (pxmitpriv->hwxmit_entry == 4) {
-		hwxmits[0] .sta_queue = &pxmitpriv->vo_pending;
-
-		hwxmits[1] .sta_queue = &pxmitpriv->vi_pending;
-
-		hwxmits[2] .sta_queue = &pxmitpriv->be_pending;
-
-		hwxmits[3] .sta_queue = &pxmitpriv->bk_pending;
-	} else {
-	}
-
-	return _SUCCESS;
-}
-
 void rtw_free_hwxmits(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 544468f57692..b0189a703d28 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -457,7 +457,6 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter);
 void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv);
 
 
-s32 rtw_alloc_hwxmits(struct adapter *padapter);
 void rtw_free_hwxmits(struct adapter *padapter);
 
 
-- 
2.34.1

