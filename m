Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914DB2C21C5
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860511; cv=none; b=JdXLqU0VU+eUbK4n1yCn0WYvZ1ieW8WD1I35D/GqEAylZO1qWBjbnAt5qk1ZlfSxA0Y2UmyxX8Ag3TFOvzgjktKHm1fWuacCL/7VNS7RhrO2MG4juUeABLjET1+jndo6h1G3f7WkT7IvKAdLpQ6m8PIxNndUjym6+jjfI8BArrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860511; c=relaxed/simple;
	bh=dRPFUVBTP1zpukb+JhI6LnO7y/jjwCnNcwxyPNz3Ntc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RYisMeYRIexXlE5RWpcWdOUL+v6GY3dFo6i6xLOlA62fZiybsOFzKCM5+hVdnMpkzCy4ptl/qv0y7aFZOR48Ml8DpHd/22GTl1Zc2YJikZIvtzxm9OydTm2w1kcnxdIPRldQ4m2R8is8K4qHFvT78OK0h92aTaFhKTFxfAufnbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMPW+bjd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMPW+bjd"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so916850a91.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764860505; x=1765465305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DW8v7DW6yQeogEEtYfiP42HqoFREpZw6xuPE1MYVj4M=;
        b=QMPW+bjdKF77Nc07qiAa/oIlcZjkfVmenIepOfTEyDPQi8MpXr6trEGP6vmKwg0hSH
         1bBVvvW2MEpwSH/WjfgH28pPit+pN1ZMoU2ZndZN/3+1vFnUMmffEXKJ25sBiTy+p0zw
         KPMe5MI/aMiR4Cof/zVhzkgbC81wMJHn9JV6EzubBvME/+pMweoQwcPLEDdKsFsjbFHe
         Kzn1gaiweUqMGCkBEH+sDAWdCLXtW+VcQV393TquxIDCpj4rJ0Df+Z94jb4C81WqfAPB
         MO3dw/Mra++ZWDAx5nS9fCGJfrCuTqBLvvSngSqVJLn21F9z1z+NCjKfxWUK9XmXusaH
         +J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860505; x=1765465305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DW8v7DW6yQeogEEtYfiP42HqoFREpZw6xuPE1MYVj4M=;
        b=g31vFDEcrlbyE4qk/KLj3nE5vTvvPHzecRD+h6lyZGstwh/+ADWAbeoD+3xMUgM2BA
         HvZWgYfqSN9dWKCE8e74cpwov4YxLSDa4RZCRFdvk/vxIhxnIO02c+ll403kEQgM/2dd
         340EPWnWPsgONEVJWGyZ/t7dl7UadUgmFW00ktSMQncmj6TunJJ0+meMtiYqsHRMFwq6
         fTXjXo9mtDIuydShtVdgr2jCGXO5MH87Sxjqizi0eQlVZs3PLUJ4pa62OwOs+1vlLHae
         ORFtP0MpY52H2PkzUb+gBHF5RwYi0NojGfyCTQzUr9Xdk7WhW7KsODs59QXks+O9p/RH
         D9wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw14wULVsmt9Ef1JY/t/vuuqgIDXRZjYtOGI4BZ3Dxv4HpdpevJapx3PJ3RgMXPiAbLBZSTsGuTBN6E7uV@lists.linux.dev
X-Gm-Message-State: AOJu0YxaXdLuALj1Z8D/vnIjZDobsyNWDOUpXm3gwDEeOrkTR1hhG9uO
	kFfT0aZDdpjQ+o9U3BpGLDxe1CcxfDw0ufCX7v3m9iEyEeWWTiP5uCQM
X-Gm-Gg: ASbGncuScNKkK0QFiBUP+ZWvlWTf+Xg9AMJRlUWvU7KUC06B0Qgm++6ZrRMKoER+pTO
	/tBtmLyapOWFZj1jU1KjdlXk6L0sl+GbxvBdUAuQYItjqhREuQnDIAQu6v1NLncxYY7xpy15UBx
	kTCQO8hS7UhtTFalJUeImBexjztD8adLIiuHoJwoOYgpN7sBUvPOKsQHKCQRjH1vPkInlPS8qDE
	xhr2eXnA8SNBSCa0JP3+gV974lDb7u8kDUe2AWh8qZncHKKx9T74PVRDLESoCAdauR41gPmioXP
	6BI5YWBzKgLi0M76Lg98mqpYt9zI0NUVVNOUMk7APQvWdD01Y5UPl/wY2o+iqBPPCgSZEbHoYZp
	MX4VY4EA0v2zn0WDwaEM68Z3KB7UNZtvGBD3PPfc5yLtbExILu0sSNxToXUMxVqck2iIMNSQMa6
	JS1ptyPoT0AgioA7xRCm0zdcvH+/Rrk561ljFDcyW7dUTHb8nKtxLQ
X-Google-Smtp-Source: AGHT+IHgRMuz5a6ZG+U2TTogSANcKnvcXgKJkNaITbT+aeWK7j8M6ROpFCS4SD4HvmKwzxlcm6GQbg==
X-Received: by 2002:a17:90b:3e45:b0:343:6611:f21 with SMTP id 98e67ed59e1d1-349125ac880mr6023964a91.1.1764860504446;
        Thu, 04 Dec 2025 07:01:44 -0800 (PST)
Received: from fedora.tailfd33a8.ts.net ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf68155047asm2142009a12.7.2025.12.04.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 07:01:43 -0800 (PST)
From: Karthikeya <garagakarthikeya2007@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikeya <garagakarthikeya2007@gmail.com>
Subject: [PATCH] staging: sm750fb: Fix alignment in sm750_hw_cursor_set_size call
Date: Thu,  4 Dec 2025 20:31:26 +0530
Message-ID: <20251204150127.10844-1-garagakarthikeya2007@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the arguments of the sm750_hw_cursor_set_size function call
with the opening parenthesis.

This fixes a checkpatch.pl CHECK warning:
'Alignment should match open parenthesis'

Signed-off-by: Karthikeya <garagakarthikeya2007@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 3659af7e5..9740f2705 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -121,8 +121,8 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
 		sm750_hw_cursor_set_size(cursor,
-					fbcursor->image.width,
-					fbcursor->image.height);
+					 fbcursor->image.width,
+					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
-- 
2.52.0

