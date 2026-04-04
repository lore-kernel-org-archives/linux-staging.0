Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0B370D6E
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775297409; cv=none; b=ZjkLavau1p7eCq6krv5xc82suDkkp2kQFONqNttvBBEsPUgXO4UvZOZT9y118dpVnRs+y/lFMk4SJ6z7g9EPbgNG36P8o3BqfGnjseI1rrdXG+R2V4zdCMIzCeutAfu6syoSHvJIiHbMitR2oTUqB3v+MbyF4K2z7YdPmb8hbaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775297409; c=relaxed/simple;
	bh=kGdzjNKChw9a93zcTrVjsPWvms1Vj9qFAFmv9YflOWM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n5gn9W2Pzx5HwS5yY40gAPt2S+87F8MSgds9tU0eDXQzpi6KlhMrkrZCXxVtNq5DmgP0CTGzDBQBcYgSGn6HsHSoiqI1HAiS98IaJTUiYEF0J0y1JwDLSuysuXWxUtawHdcDdHxRaPIRAQmOADz/z2f13+Edl7K+HScFOZcFmRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAwMETqa; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAwMETqa"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-126ea4e9694so4699844c88.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 03:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775297407; x=1775902207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1N0jwTmIBAkK80GMXMRCtLqUArvCFjyImESGdQuqgM=;
        b=ZAwMETqaUPVfL06MNoMXGm+pyVbsrpuV0DhbZaNBZ9u9yuec+9WDnYuEEPbla4Bg8e
         T661Ff/rdHu6BuDU70afpe1CwDTmm/euYR/hXxU2gprhJHpppcJI5J5G50WUV0ZOrE2U
         ESHY2V75OdlWitkCqnm7eHzjI6tX5eUeRY4Q/av/oFsqZ/QzYpYVdlj4ec0FZJ1g9gV5
         M95kBha2ZGyFRdmY6OLokGHpdgzp1mv+5hqAHUxxb64nDweOozLwA0jbHNK1c/fxHsHa
         TH3izq8HpsJbyj84iB6owVB2m1+eL0R20PyFieZGnvzb5Uei/AQ6BhCJTLq96j0X7syA
         f18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775297407; x=1775902207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1N0jwTmIBAkK80GMXMRCtLqUArvCFjyImESGdQuqgM=;
        b=ENhNDjdubmnAA+CVMSzoBJ3pNaklnqFPOd6Zkjmm4p8Q7GvvhoLgelzFaDKkF8o/2P
         KU/8GcM2/A8QHuQObY6BBK46z7aqFdK0AxoJxk1KNMrgR9D445yrWISFc62AnMVr+/dX
         Jkn7vkbHObvVnFH2JbY9DMat7kYFd5qmmjCOKPnKHl+LUIezW34IZcCW8cO3AVmN2wij
         b0orq5O55wrM+oguLd/LFl2gZ/TM/E6uBF6LRbOnMj4njzHXdDKDkAtYjKidiB5J/J/C
         1kVF+e/1FWcL1GZYvJooFYVEb1u0qjMXwzLy8XnyHCJFiPuL5AjWNizJ+lXl23kr07n+
         vWlw==
X-Gm-Message-State: AOJu0YweZRLzp5jHd6oRpbOp986tULNMoYZpJvvQpF0idGyeaEx1D4eZ
	6EyVWIvEci4xzZds5dC3aXsGdY9VB+5CGWc7OFBGo497O2W8IQjDjt4af+xIheae
X-Gm-Gg: AeBDievelPZqk6a9cznwNScUvP3ZyiVdWd2qmwLIBv+V1VY8Q7SpdZyu3EeBWhkta2a
	Y50CBwzLxi5v2C4grjt3PBOAf9y3xr90F0iUN48jouHiwX9b/hoqHtX6tmqX28B79lUpaSmdM4o
	IFuWFVP3TZ7FL5amuyb8oVyW62ILnHFNZW1kPKHJmlA/WgTMGgAIYb+y0wEmOcNYnQ4Gz5YqyHJ
	MyUkI3Ag15LDqFIj6OJ2lSfYtChauM2CCU5JY6ieigDyrv/HaMRC0lK7YeQpwsASumQiN8FhHBz
	1Ib40obuh3CKFl4EbcASxIPt78IA4ctcr6IG1tCnNkj69YfRwJKRRnDMyu9rfVkxTPcBP61/+u8
	Aa2fG0Pe7n8SoZSli3x66lMK9vKMnSz9jZnzMVdFWfL3zTzmumoe1c7iIEdVwxOxzdomCIwbjxs
	EQiUff9w0qKP1SiTtoeBjrtLqhMdjJudYQ4fOl1djxfMtu7nMv7ufgGbA=
X-Received: by 2002:a05:7022:1005:b0:11b:f056:a1b3 with SMTP id a92af1059eb24-12bfb6fb217mr3309937c88.11.1775297406824;
        Sat, 04 Apr 2026 03:10:06 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd6901esm5925929c88.5.2026.04.04.03.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:10:05 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant assignments to res
Date: Sat,  4 Apr 2026 10:09:33 +0000
Message-Id: <20260404100933.7911-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable res is already equal to _FAIL when the condition
(res == _FAIL) is true. The assignments inside the if blocks are
redundant and can be removed.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be8912e6..ea1923023caa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -209,10 +209,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
-		if (res == _FAIL) {
-			res = _FAIL;
+		if (res == _FAIL)
 			goto exit;
-		}
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMIT_EXTBUF_SZ;
@@ -241,10 +239,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
 							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
 							 true);
-			if (res == _FAIL) {
-				res = _FAIL;
+			if (res == _FAIL)
 				goto exit;
-			}
 
 			pxmitbuf->phead = pxmitbuf->pbuf;
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
-- 
2.34.1

