Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF963D5C0C
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 22:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784325784; cv=none; b=JiIzNj/Drvpl0TGT/7V1+g8n2wvqQYI4GTCZ4xAt0hQFP6EdVh2JFFodIDajH0DAG637hOMQ8LerlaqHBXDPBB00NuxqoxzPXWh8fmIxvrw3WN5k7Fr80pfEI80643ut4XbdbIiKnS/P76WlS3E+237cUcbVtM2TXpht4CAWCHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784325784; c=relaxed/simple;
	bh=lMArcPFWWuRlk6z5NoBTp+gMqPtSbXq6NoyJ6ndpH9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvz8+jLGiuXaZM3dE0w8DX3coU6Vdia8Klq0cshaWIT8HQ8gHlwEVtKodBRTDe6plbS8CFLo7gYSRj/zCi5jCqogIIq/uIGXRn47c3xk0O3pSjCBZDAaSg3HBrsydzHv7oHK2t4LLyPZvgocGw7uLT0bEkpnK0QVEgNa4Qmyv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHBCxjrA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHBCxjrA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so101748465ad.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 15:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784325783; x=1784930583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEkd0sxNlznW0uG3RudvQnAJteJfNYHswB1Rjkp+2dI=;
        b=AHBCxjrARo3NUmNAQTPTZiS/2tGFnZo8ftZmgLmMdrWnu/EDfsQFbV+yGk8qiSBNFx
         MMWmu8GWnvEsQVDzvVB+cgtylh5Isz7hHiCvsqVC4ixexV/NVQeFXX3+O9cPgkjY7X6X
         KzV0dJHE5rrhw1clSJl/Z020Gc95/7frA5kueTqN5iljMWI7w2mv90mjjHiBtx3M4owt
         QQs99tMNy2vLMzvtZgnra9G4IK41vyshL0mKF89beIvk8GXE3icKbreJwKe73nDqukBm
         xl4ffnN8+cFupusDTTQhpamdnikI3iXsErbrNiMwkwyAfviQdd/IHEkU/KKtJeJq4PJf
         07bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784325783; x=1784930583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEkd0sxNlznW0uG3RudvQnAJteJfNYHswB1Rjkp+2dI=;
        b=NCfwPJFzl+0ugf+J2LWaWp9q2aV4hshwij2FMmGriqnJdP7ACnifvW1n4aFmJRrTXR
         RUV0LLzX0BfSiX04Sdl0ojoR4IJxC/ypHCgzyPoy8ja4Ns4GVHqO+w5+PoQOCM0Z4bTD
         Y5gVAhJErcf8CECu/DrkNo2NF6EslPySY3HKOsQ2I8gXuNHa11BnarNRCqiOt1KyB8OS
         X8Ym9GRZMCBcHA3ubRW0DyIaSIwFZTMVait+aK4TDi8BadmJOe+V8uivU8mc4CJCJ4Fq
         7KRIV8+C2JD/x9NHzSUPpByI+X2yc5+pFxoTxqYc/88xuBGH8QVWtwkQh8zGJSZ/mpq9
         Ijyg==
X-Forwarded-Encrypted: i=1; AHgh+RqABmUfw/EnD+N+BF5HWQtLC6xm7DGY1Kzi/Ep2G6ZYw18zhILviB5LcGJMokyeVYLk5DSto6apoLT1RD9I@lists.linux.dev
X-Gm-Message-State: AOJu0YyhfDedL5PUFiUm1AKFXxzvoFdBhpZwGucry7kFqevHpr0Eci2u
	VoSdSz2fmzGB5Dwg96J3jX+Xjk2CCCxl5Oj4E/zp34XEGZTwLb35/SCh
X-Gm-Gg: AfdE7clzWWniLfWV2kEdk7KnGg9gDMHhg/BAl0D9fOPdBBTUZjuh/w0LyO5CSYUNuMp
	We1AmbrSekjCEEmwZLu8iTZv4MdUbO4M+/E25Bp72JgXvgQgul7htB1q7DlWzPWM0pUpioqr+nL
	LaD66dcq95ie1gnF1nKhshivj35KvKOSk1xuHceK3+kTUZjM05mhz+xDzt1FPifEJB3VT0uLcdV
	2eovMr3AsUpMIrYFEEtme7IEx5QCMCABPvcNapy3PxbR+xCuVZkOOD/X8+2G66Ex7aT2XqDVYhD
	4bton+36wf/mkSltyN92y15qtzjVb5WXQ96bS7Ii77I5uoUbkvKqf2/xLK6wrchUY4nHEQtKuMy
	PAonywcFgJocVBfJs4qt1CwYiGA2Iur4pfR8wRFK/Xa/FqsNVZxCJzt95M1YyEQIkb74BYo+9Tb
	QQsXw0bU3jAsv7hgtw9Wlj752rCe9dZ6FQecISAcsMGLQdI/FzSwGNF4ivfMctnq0oyU8jSF3AI
	Q==
X-Received: by 2002:a17:903:8c6:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2cf3481941bmr48976245ad.6.1784325782345;
        Fri, 17 Jul 2026 15:03:02 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::9dab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3473ba1dsm17439205ad.65.2026.07.17.15.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 15:03:01 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key material
Date: Fri, 17 Jul 2026 16:01:35 -0600
Message-ID: <20260717220135.17836-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713233401.48262-1-skunkolee@gmail.com>
References: <20260713233401.48262-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The set_stakey_parm struct contains a 16-byte encryption key.
Use kfree_sensitive() instead of kfree() to ensure the key
material is zeroed before the memory is freed, preventing
potential information leaks.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---

 Changes in v4:
 - Add Fixes: tag
 - Previous versions had unrelated ftmac100 changes (now removed)

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5d63..a34ee407285b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -899,7 +899,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	if (enqueue) {
 		ph2c = kzalloc_obj(*ph2c);
 		if (!ph2c) {
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
@@ -907,7 +907,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 		psetstakey_rsp = kzalloc_obj(*psetstakey_rsp);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
@@ -918,7 +918,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
 		set_stakey_hdl(padapter, (u8 *)psetstakey_para);
-		kfree(psetstakey_para);
+		kfree_sensitive(psetstakey_para);
 	}
 exit:
 	return res;
@@ -958,7 +958,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 		psetstakey_rsp = kzalloc_obj(*psetstakey_rsp);
 		if (!psetstakey_rsp) {
 			kfree(ph2c);
-			kfree(psetstakey_para);
+			kfree_sensitive(psetstakey_para);
 			res = _FAIL;
 			goto exit;
 		}
-- 
2.55.0

