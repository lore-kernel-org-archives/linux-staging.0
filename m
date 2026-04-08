Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30F63B9DBC
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645126; cv=none; b=aS/GN95qlZLCZGJtNcp4P9fhbWW17AHMIBaTnHF8wVZKVZFl0Q4ej/L7d2O2W/JlNCURktREEvq27/SMvfovhHke9cVu9c5H9jw+foJzDaGOB54/M12OmygVNFrk8rPxy7+2LHycsEJMimq2nAONDadhj9h8AA2mWn81iV1GTLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645126; c=relaxed/simple;
	bh=gqL8rrjQX2MZJ8p18pobOq9oxiN6UV6V5gJJZGg5tWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DzH+E2+yutAfsxwuIyI9tEL0C/GxOA9C1jL+lokhh2HC4lE8Vd6i43V50Sydpz+Wy+yMjM20N7a/zZe3H1JOCs8jOdzw+qQ3BDd39Vi+8f/QxfzFg3Z+c9T+CX+DSHvIVagtDHz2tL/mkjdvtOPCXWSuyE8P/o/x6TyfsWUeh6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvmG/WO4; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvmG/WO4"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12c0b72dac7so3841451c88.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775645123; x=1776249923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIsVexSVozxHzKuRWPuXyHX6iHCp/uKgJC6PDZBrexU=;
        b=CvmG/WO4Hv1GOQsM7yMarMiU3YdWHfG/KaSB4bzDXLMJD7qKG0oRvBlSRfDM/lYPDB
         9Bs1MYd2JKSG5yeaLgmpW2MEtcb6Z3ZtrjQLADQP+C2/JhAM4gdgCdxrZSScyjSTsPVA
         BHjnJKPI+p53b78Rz15/VibUmfHtgQyK3m4MlMmk4SMbxgwqGdrFytq4MDye5x8mff1e
         FZg8bYsF5FkmXBljfOMY081j+QhwVL1bSLj29Ei+ExF77LWVaBokzIxxIZYTwrOP6W7+
         hy8IpFsiMJaVlmuqY8v8T4denPRpCfGLtBzh0hYa+3uu4exW5oBv6hYUdEvkxIMr5dvU
         ttNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775645123; x=1776249923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIsVexSVozxHzKuRWPuXyHX6iHCp/uKgJC6PDZBrexU=;
        b=JcpC0Lzv9jGjYFsy/vKM+HhN4fIwC1qwMTPWu1AuZF2+nlqSOJCwffjuILQBQtWP4y
         GUoD/nbQ77ZkzABBwgWT6YF0Kr2CcqzuM8q/lHWspJJp+vgODFoHgVQQvsIFVNFD63hv
         5Gkif7ZJjZsFiTQYprkPuOKKDh61HBuouw/EPdg+P2UdLNieri9NTwwkzHefTYB9p8uw
         PlqSuThGRypqmpFl91+UDoEHLUmyISqXyE/iq+K+EdqtI75FXE98TAGG7sGKf1Mf0OD/
         dxPUu0tdIK5n81OrLGCf+wnS4ZlL7lI3l2u86X4W6coZl1pISnOYoxRt3sa/n5NU3LCR
         T/PA==
X-Forwarded-Encrypted: i=1; AJvYcCVaYyZPhiddobRxLy/zPnkryH39h8zwjym83AvFXnG1DNf4mIRWaG005PyEn3ErybFy/HxzB5wiwSxWUdo3@lists.linux.dev
X-Gm-Message-State: AOJu0YwzZdo7KVEB35qMT+qvE3PJHMyaVSXofOKWWHGIjxypvGU0JB3m
	YDjjPptXAeLaeBLzkqsavymxfat894YEZvBxs3zXGvaBdhVVYEp1pYM7
X-Gm-Gg: AeBDiesZ+0XD8Bto1Y2v5OfWQhU3FfNjVFgVl/5hQtstPlVtA6kWDS4fl8bvDpOHIDU
	HDrNcmbPkBlgnLyJB0RQ4OFpiVltYxIvtsgsiSSojvQhPEeMVQdvtecV5EhteKONJsFFyagyBTA
	H4LJV9+arqOBhArbXjOOcOOBr4zuXJk825iURlkemyVoe04od7gv4cif/KxQRlCFq0lYR5CP+2H
	2EgTd9yTds2KAnnqdcnmne1JGFqh0nUWX5RrB8nIfEXab8j1nwwE1YK8PlzNtFXT7bFujY2l0Cx
	NPadfYoxI3ZvaMkzjEFtduQyTbj26Y9tVHHmOMYUSEmADvh3NAvqWpoEuVYpeR+XCKlz+2za6oC
	c7lSu/wDCGZ7SgIaXprDZUv1gFYGncgfhuAuIHdUOLL/iLgFMwHrGj38+Qv65wcQZoDKx85XlDs
	1k4Oc5u43+9GfIlkoaSk49NjKhml0wlNxpHBFHBooeIxvCidqlUzEAsGg=
X-Received: by 2002:a05:7022:260b:b0:119:e56c:18b3 with SMTP id a92af1059eb24-12bfb775a39mr9622935c88.27.1775645122888;
        Wed, 08 Apr 2026 03:45:22 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm24417783c88.0.2026.04.08.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:45:21 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 3/6] staging: rtl8723bs: convert rtw_alloc_hwxmits to return errno
Date: Wed,  8 Apr 2026 10:44:21 +0000
Message-Id: <20260408104424.18952-4-dennylin0707@gmail.com>
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

Convert rtw_alloc_hwxmits() to return 0 on success and
-ENOMEM on failure. Update the caller to check for
non-zero return values.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b86c9c2f3b93..befe74a1bc4c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -45,7 +45,7 @@ static s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	pxmitpriv->hwxmits = kzalloc_objs(*hwxmits, pxmitpriv->hwxmit_entry,
 					  GFP_ATOMIC);
 	if (!pxmitpriv->hwxmits)
-		return _FAIL;
+		return -ENOMEM;
 
 	hwxmits = pxmitpriv->hwxmits;
 
@@ -70,7 +70,7 @@ static s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	} else {
 	}
 
-	return _SUCCESS;
+	return 0;
 }
 
 s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
@@ -287,7 +287,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	}
 
 	res = rtw_alloc_hwxmits(padapter);
-	if (res == _FAIL)
+	if (res)
 		return _FAIL;
 	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 
-- 
2.34.1

