Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3D33D7D89
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 23:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784159718; cv=none; b=HGtIJZ1B+58w/MbuDrn/vaV6Vv4S2BZkFWfwxwft9OhHacPA2Y/yWdcUGYWoDEscPp5dxh6gwONbT05xhpst+yoOg6XsPp8mWqhn+/Buwo8hwU6ktRC6gyuhkV6wsOtrDVxQiI/8UXtFKVhe847nvuhT3n8KQjK5su3hKlojF6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784159718; c=relaxed/simple;
	bh=is1pW2HuG81gcCJFv7FSgdB2gm4dZ36chPReSl96KrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/ERc/juaKRVf7omMFux5bkYlnc2e6gmbWvylxkul6aFz4aNDFwmCglfB6Gs84nfvAWOXJx2wdVFztDTvNPBQkTmZVMkugJefg40Zr/5GYiJrK6FQlQVrjzgSwzJ8hqWLntV2qeYslZA734oVvga+36rVbqzXvb+dsXORPKNzK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOECAmGy; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOECAmGy"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2294887a91.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 16:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784159716; x=1784764516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPaYRuKfVlAHIk2YkEvf4Nb9gfPYqcQWIb2PtQaeYYw=;
        b=KOECAmGy1Vjf3SWb0/tGio56z0Skjx8rYAy9kA+61iIctyTluSaiZbumPb3oC7tpYl
         GIzkbwYg6J+5/YGpFJhguQMWANFD07Dwe4rt2IhN0uHEAiMu1hRJfnZ+lSggSYzpmwH5
         PhBY/nuqJcDT8fo2Ho6YOLV7tws0SwMAk+NjGD98Ekr/fhMPX4BMIruCHObz0Biy1Y8e
         iVT5EXYurf1ReFz6uZAOw2ikuMIft9hboIUeTPBooJKU5b0kOxvAroYuO+D4hVJJBonv
         Z+Z6ArgG4FvGz/By4Gv+W2QC4m7ZNeyxQ0kHH1cZIX7T8Pnp7bbkR7Qv5HIrdo9rQUBn
         Iafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784159716; x=1784764516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPaYRuKfVlAHIk2YkEvf4Nb9gfPYqcQWIb2PtQaeYYw=;
        b=AfwjWoMY6nubbhBg9ylPRo1E/dFwuQlWsozxrdCGHFXZtUYXCPjo/8OJHeFY14WZxC
         U+V/X1WxJWpw1m6TdWZy1hWfac5qUlWbZiOAAsVCgUdbh9k0w5hCxIyy9KUZOt7WzRaW
         5aajkBIHr5Y/XbyR/KnNKSTSr7nH2BgG0wOFrJ2N2iVkk+bjkzv0WrJ1NKVnuNzr/+r6
         P+QOW8MGCxyz3PbCdD8N2Djqe6ZBqSOV7UoJECD7FbC8TXZVYRPUELHeXDbjeX3teJmw
         v8mnqdM3/X8vRFt/k2TVWN8j+kQ9ildOTkYSa93E18Z0NhUnsjydQ2Lg5n3JyJBNAyAf
         AH2w==
X-Gm-Message-State: AOJu0YyIjoj8nSk2CWBv70XcJicby+1jkG2uX3f6FpAH1dvCVzSOWvZL
	klJ3ZrUXxORa/tqbIchUR/lq0TfUUTbNsW9RpAAdFLlkTyWavgthWJ9dlG5nkE8qoH8=
X-Gm-Gg: AfdE7clNkIzQkpMg58H9S/KZ69J35HBo7KkwczkAiufqbWuRt5qtqCgzRJNdr3Fg/sI
	ZGXG/jznw/HuuZ5mHWGblRHnEVqAs9FvXI52sqknJJsrFT6t8kq1rdoBKLFeXZ8pQTs5wgHvuVr
	xARcidforxTUzNv5nCQ0tTVQY+gzO1qIJKc/bWJ0pZgg/JprZ0RtW+OsFxDdtVMXiS4qxm70sxA
	+TGEO4f0fhBVgf+SineAotVbLpAVs6LhmykO2++2Ec9y63U3gxD6pdJZzBVVPt5uiLlOtGPAgFQ
	s4t4nokHU1pzwZsmUGikiE974VoxCB9nmNajpnT5XMqwrnArK/zKe/WXN6XuYQtpChjYp9II1OZ
	GyoxYwSY5zdURyq1moCJtigs4vfW3BbguKMkBpQQR3S97HxUXOZDC2yI6FCa6Son2ErDvoAx+4Q
	sHIUG5Pc17BSRLtlz/2NtgpU17h0UC/+U+42SrpJsjp/j9bCFmpMO8J/5wAWcIpCvzdUvswyS71
	A==
X-Received: by 2002:a17:90b:2d4e:b0:387:e0db:bc29 with SMTP id 98e67ed59e1d1-38dc77d79e0mr18418496a91.41.1784159716059;
        Wed, 15 Jul 2026 16:55:16 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::9dab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e3946sm10223245ad.4.2026.07.15.16.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 16:55:15 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key material
Date: Wed, 15 Jul 2026 17:55:11 -0600
Message-ID: <20260715235511.7357-1-skunkolee@gmail.com>
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

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
Changes in v2/v3:
- Remove unrelated ftmac100 changes accidentally included in v1

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

