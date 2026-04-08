Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94837DEA0
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645123; cv=none; b=UbsZMv/lmXgxnBzgQuzd23mEz2eBFodm89ivMgzbkY23Oz35Z7Z468KWaCE8f5LOB8QoJGHDBbx2/Y94V92VcpjJLVaVNHfd3Sa3ox9OxbXfOsawNSq6ojXX5OwelYvm8xRkadvfliP5dYizXvb/9F+tADFru+GN3gCml1pCkDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645123; c=relaxed/simple;
	bh=UKGoTvygU9/qk9ny9Ksdv4RHhLzICwFIrRSmxE3H/bI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qPFgKTJjTI/bpy0WUbV9hUfUFggH2NOYMvELMKgbLoCmiW+DevG/xTE2kWnd2G/ILSGQnYYb7qfMKrQ3Srq7vvY3NtEV00FyhzS39/X35gprTK21j7zXj/V4EruNeTi78+ZaVFhYhfBC5gT59U7aUIz8Olye2+x7HyjjWDl+Q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG3cI/2T; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG3cI/2T"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-12c2575ff49so569962c88.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775645121; x=1776249921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2u/ibJfkdJGWdmo2I009UtH6vmzi29RSvoCTFJTa1s=;
        b=iG3cI/2TBRdtALBcJ3MpYiRZH3UhaJ3UtatmfNj5ayO9SaxHilpXai31aGi3r4E2aR
         i8qc/j+qHQ/KUdP6s6FGmTGhk3tGCkxl7us3HTYuXBWI7FRDkQRBPcdv2Sk91WRifgoW
         peLC0qylZZcP2qyW+1Xb2gl5Hv1RSKp0JWebddgrJOk9xyRClVtFGcBWYunJBN9BgGOR
         LBf/iB93J+hY/m+f7KS5Sqsj+3ii1oMsF8qiIEql4fXgzVKgdysNronDYUVyhKnwKUdZ
         ypJZ5iAomMXGdLnqHE0QCFIVd4iwaR5FQYpjURKDGQKeSxnBlaSlnrbovm/dmwaCDbMa
         b/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775645121; x=1776249921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H2u/ibJfkdJGWdmo2I009UtH6vmzi29RSvoCTFJTa1s=;
        b=XbEv9bByj3Af5h2kTIL5BQeNAbRJUUMldZVi2eaUYxZFDgrtbvirNEzacaH6BMPMW6
         2NznmSkV76/M3Ulsx0CA4lrtBrNvMIwx16OLAjGZr7freFJudZVZe26Fa3qoySrhpth+
         jUDplmEAN9pChAyp6RxjnAqc1hi8xB032EmwWCYSXa0CsUuQB/SlCS9fYjZE4wilNxZ0
         ZNf8TG8bv71orrT8b3ZzIpPyvArINyEQHQf32+0hnmLdcMpskVaMtSdPJycaR+PNJ5bi
         JHZGyeLWpYe6IwikmAofr9e1BuQdtn4by633igN07IdyxhknSROX4t32wersGQOmkuuw
         iUBg==
X-Forwarded-Encrypted: i=1; AJvYcCVGlBJLjy53YjFiVnpu2WyB5ytDx+jUHsBa+g9lJa1DEjOYdwxeBfUU0NAKdVWpzgj6vpicYY6R9LBYw79M@lists.linux.dev
X-Gm-Message-State: AOJu0YwX+yhehGA/UVw6tkCh9gazCKHVNxdw+apBrso1dZl775TyxypF
	V9gmyIwg3RT6+ptqHzLyXe+efzer/vN7JrBBjr9qo6M0pXbGd1/8Esu6
X-Gm-Gg: AeBDieu+wfPTbc35t9X1G8fc8er/SCYQsujoX+HiMUZfVCIu71gwh5xi6/roJqV1M1b
	Tzauy2dNBudFWtVYWhuR+ZyQ8GXj9EAOieaWUFfMorFnxKwm5JczU0EAvgeD1ljbFxy4Czzxhv7
	N79XP3kY78HuF8erqjGraHsoTjsS7aMOf4vi5+uHb+S4t07vYWSrmEwaAYVJZupe2sGlLCGPL2N
	3XhDOljCKtCY2YyEpBeb3QndqIWzLf+jStFsGBpBIxw5PEfC7Kcf0TqbwfrySKQXkZJWvYN34mn
	vMJ5cLy5EMfRqq/J4VV8d52rOSOqFQFWKupO5x1tJk5V68b39NB6JxBPhCt3aRe9t1nthDFOc4b
	EjBJJPDiiQKzbRGLV4fmeTOVvPd7YJDhElX/LIkk7dJ8akLzDlRwuop93EweYqUPhHc9IgAVmM1
	yt2FhUcPt7i8gO/t25aK5VtYPDy2HE5yYuzsgQj5W65cXar0Ccjc4BfnE=
X-Received: by 2002:a05:7022:10d:b0:12a:796b:7cf1 with SMTP id a92af1059eb24-12bfb7458c4mr10111211c88.23.1775645121118;
        Wed, 08 Apr 2026 03:45:21 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm24417783c88.0.2026.04.08.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:45:19 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 2/6] staging: rtl8723bs: make rtw_alloc_hwxmits static
Date: Wed,  8 Apr 2026 10:44:20 +0000
Message-Id: <20260408104424.18952-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408104424.18952-1-dennylin0707@gmail.com>
References: <20260408104424.18952-1-dennylin0707@gmail.com>
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

