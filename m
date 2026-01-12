Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1405137F724
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239773; cv=none; b=SOeHwkg8WAgIygRKeez2sN+GpyiIaLBaiXH4RHqitNYo5CR6ll87admdC7YoF6gKV1DW4nL4XPNHWdjZuMrb+gObzImP5uXO7EdYJjdi0FVuDc6vokNKlDJmLLqlr1ZQtzNErnie0pIQzJ/tqRgaAkQapcneCxj3nbvJFJAji8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239773; c=relaxed/simple;
	bh=4jTD6JTHImA06bOoatR81tKV6BXLjkd++ltnUovhuzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPCosHJ3b9KTraUQ9HijevRrjHNMuixJNHkBokki0bPwNsmyIyZJcdibHa4filV/EcEK7FDcSNdr6HjTW5yXDlsxOW1YfKkLfgoqtyrKvwqAIwJh/xcVC2ZCingufmnrtW/BOoZu1BdSbAaEy9NuEwBOnC4kXSDO9a5iNyhcA4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HF8IbJnI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF8IbJnI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430fbb6012bso5404085f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239770; x=1768844570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaJsKXk3sY/mSFLhiV3ka7dwJh9AihejKqeAgSQcIWA=;
        b=HF8IbJnIWYjf1TNAPVcCz7s7uKfOrUQ2amLs0/me5Zq9JB0yWoBW0DT7mDR5d/BYez
         QlNrVa1431WFwkEPm+qVGf3H/mup7yz49Vm4Tub6y+f4S7e0xmf10kz4c8FSaa/3Pg/A
         8I9a+83AmmVOf8mFbM/NIdmQ2VTqZYvwM5xvpRM6g3HGuhfKghoN7vnGVu6KhM+jrzZR
         Zzl3o39/89eOsh80Mt7NyqdtCdtWZsLLbm4rbRk13c6deHZkBSz03I5YvrgnevMXXX9A
         n2CWtgnETQTQsFm73gNRRJ/CAHrbwGUqO0ZXXInD369qCDRflzmAtguQ4SYVBykrq4MO
         dHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239770; x=1768844570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaJsKXk3sY/mSFLhiV3ka7dwJh9AihejKqeAgSQcIWA=;
        b=MwmrStwdJR5OfMcrk/TS9CRq7rHTvee1X09Kv2sxrjEfdOkaXa67uAc6/CrlUlE8Jj
         xLXiUy6gZuz77JBABhx17eZ1bwZLztxUNph/XB7o9OC9Fkg1xV+oSmE7Fh0BnMRZW4Nx
         aoDXQ/VZ+3RbQRFomdIwWKNDIpYWhhrejEoYgSZTUKpF8rQZ0ZGz7FWXVlHlw8l0DuOJ
         0FKOXcsBr8ft3D4atTcRrd0kxXvr7PLFejcl+AnKjefrWzlMw2j1eAPieyEamXHcuNPF
         cX8Ej0KAwxtM/3RAxy+q2ietCR1rFOKILYy+XZ6Od2O7TKZBR0p3GkqRDcGj0r6JB2IN
         tiOQ==
X-Gm-Message-State: AOJu0Ywtks/9tUHi9bpyNw9SPmj9v1KredK4Zmds/ngrEXnWxKeDMhP2
	+mZEzlus0ACWM8vK8Z7w5//2EHFXrDbUhXgVNuQ7CBNbqrRJ6AXJIWrt
X-Gm-Gg: AY/fxX6uh4y+yuO27IUTOlfnRJt8VnC2MyBRUOm0l1EhOmNgAxUqYkXQQqhu6TC+OV9
	bB+gjSsNjj8cHcIwRMGup3oZu8LFG62Tx5NkvMWTJsmWkH2l/Ir/aXtA0y+khU52fYySsP7VqPG
	lN1kpt2f3vIYim6D7fXP8bqVmMvATMlxN+kbNKd7tF7bZh+3CclijSVusmHerKGJNVgVO/z26qB
	ldgi7qJK+uHf+yG4mf1MzUOLdNCIN1GAFTCSlNyiglssdz6FDaajKjpVOkeltIjj1NrQGv75uWu
	AfKzS7qj1hW2o5lIEpEu64nqws38/6N0hbxTYKVWNxFZAbtUFwmLJyc6Xklx6zB2VZNHgAI77x2
	habghQ6Uxq7P6hDB62mF+gU2Q/kbUP8eIOoOgtJfWMHvkOnnZ16n4NjGyIxoWo7jYXWAqfzU1S6
	4QsbW9QexC9U1WKp5tfxEM/brjjJYRHKHisngzS5CKLIu8zL6YQw==
X-Google-Smtp-Source: AGHT+IEzCk0ONBw0hhzsDzUfBDPh/vk3sWat9581qdecWyyf+UgvgpP33omCfTYV3qYO2ulzcNiF0Q==
X-Received: by 2002:adf:fe8f:0:b0:430:f97a:6f43 with SMTP id ffacd0b85a97d-432c379f3c9mr19910190f8f.53.1768239770277;
        Mon, 12 Jan 2026 09:42:50 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:50 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 06/10] staging: rtl8723bs: Fix parenthesis and blank line issues in HalHWImg8723B_BB.c
Date: Mon, 12 Jan 2026 22:42:23 +0500
Message-ID: <20260112174227.14922-7-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks regarding:
- Fix line ending in '('
- Remove multiple blank lines

Remove parenthesis and blank line issues to adhere to the kernel coding
standards.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index 5fcb9420fb3d..988636a16112 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
@@ -8,9 +8,7 @@
 #include <linux/kernel.h>
 #include "odm_precomp.h"
 
-static bool CheckPositive(
-	struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2
-)
+static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
 		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
@@ -33,7 +31,6 @@ static bool CheckPositive(
 		pDM_Odm->TypeALNA << 16 |
 		pDM_Odm->TypeAPA << 24;
 
-
 	/*  Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
-- 
2.47.3

