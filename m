Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9163C20DD52
	for <linux-staging@lists.linux.dev>; Wed, 23 Jul 2025 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753244429; cv=none; b=LQg2Gt7iqRHpj5XGOPEeatqbzIZN8nMQNf/A72pAXN0ZnzFGBWaS3Hqo9Xf952r/Y6h31xiFHhiRdgsu7nPAoofoAp1Oe5Ty/ALx803AynE05OklGLuxYgFaqROiKAuiNaDmtsbVPhVEfRr02cdtOHKWR5YPhdTkQ7ewUoOEaeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753244429; c=relaxed/simple;
	bh=nUybmxEjUgZoFF8qKzweqegM7JvT+hk9E8RYEVIYVwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afTTLGmzlCNSTHFpe5V5X+zIQW3bTRn3FsfFR+ySSdnJ0x7f+xRKfCjnjzOr8EgnjPL7okBH4PCt8AtM0+EgmR3qsSm7s3L8zvcX0YDZ1wdZ6ypNik1EUtxxLRv1msuXUlSQfEdKVJicpm4oj4rRk0ARTwYWxOtxJYKS5Voh+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7nN1Bos; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7nN1Bos"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so28275765e9.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 21:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753244426; x=1753849226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=En7KJtyJSwnrZsH4lDeg9kMr8qGpBkZWwaCC2J8P8Xs=;
        b=C7nN1BosawZNLEx7oObr1DDSYIM3rolYFx/fX+BiFlIxn22+mIw0HfwFgT1wKxaCpx
         tWLASlDgkU1kzuqsY5E4DehlcV0uN4v5ZX61HPZ5pK8ABPxXnevf2FeG25C+JCWlnEd5
         Fx166hBLdfS8mzrCwhUdd46q8yiCtnEGwMV8Pkhxq+QEIyL/8QA5Jg88yoAcd/T3yXSM
         c5+MO+qlVN8dqZUzIseiCPm4UJQqzOrrYYYMh/gig8CslT79XhEL9qiQZcYzkpmV7yPu
         HPbeYMlDvZOQc4GTB276gZ6QTvHGNfSkHwBzrnu1iVB/pwlD1lOR8rs2ztbf0vxRATTF
         AH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753244426; x=1753849226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=En7KJtyJSwnrZsH4lDeg9kMr8qGpBkZWwaCC2J8P8Xs=;
        b=vwjL47irgAjcMklW8+q6/xjqIjL01TtyDEiNoPkB5sQQla0q2x1xUBXfMGWfL9tIYD
         sFuyZ2McpRfw3uZuIYlRhErY+4k7WjcUSC2t/4K/8uqVMbibkOO4OKHvgUNr0IxV3MH7
         ISSbPHhkKI40J9rwr/4pBHzKfpC1LfH8kkUqc5UMNIviAN3mRJnAseyIG6tL+XNHPxck
         0fDXPJ8itqn01EXgzL+Z/0DVBfzvdRCoOG805/1WI0uoNWfeg5AxfgeOUcw0JcdKRqOn
         nwpqQaxIU/UOZxBMVVU7ts0hyOPzkI9qkK/6vwcAB0hLvYMUMLo1ZKLuf/jK2BxhWm9d
         XY2A==
X-Forwarded-Encrypted: i=1; AJvYcCU1K24FE9K/YlerrpmbxmTG+02YW16ab9i9xCIE27VtGcMNOCMa8WMyAuX1kzuYQk9tO9BKPbTUI8Cdlc6w@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr0touMYfGWM9EuFDl0zvDWEBhiAMgOzegW9jiS5QOxgN9gHr/
	2cHUpnfSrc8QDMZZylKG0A/i8C7vr66Jdm6ohLzCouxk+VYv0xBherDF
X-Gm-Gg: ASbGncsUc24r5cyeelfeCkhftatAVGhVTaNswefEHH3kWMleu9YNB5bvrdug85Bkwza
	4cAZymxssdeBkuqY7rDkUZ52qQUNLplKFHlXFiQ7zBKQ7Fo5xSOgFJzdM1k3ajE56sCgefJzfXQ
	+m50fiyChX+ANNv257hdkHeS0yfctFF0PUCZ6syohYp+5JXp3euOzVGl46YKQD+xe3isDsRSnb9
	GFiqwWvmdqpaHObBwgzmh79aB4hqPcu7yrC/xWy+vGqLRA20nB738WEMtgCJNteZrdO061BgRgS
	mCioEK6li10aT6Rpc0OVUOe4SjAYEJwEWN2P7L/eTm4tMVhxse1zMbHyt9F8GqocDMiCixVUj82
	RBCRQQA6xREZHgsfEZXxjoS2DVj53P2c=
X-Google-Smtp-Source: AGHT+IH+7wJvVSiGwJccW+P53ZiuQE9AatDgb9VpNpO6qzD7aOLdZazB+3EAT3qo9QKAG9L9CG0USw==
X-Received: by 2002:a05:6000:250f:b0:3b5:def6:4f7 with SMTP id ffacd0b85a97d-3b768ef96a5mr1079669f8f.30.1753244425754;
        Tue, 22 Jul 2025 21:20:25 -0700 (PDT)
Received: from zephyr ([31.130.177.100])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b762bb4f6csm4747577f8f.4.2025.07.22.21.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 21:20:25 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove redundant semicolon in basic_types.h
Date: Wed, 23 Jul 2025 07:49:21 +0330
Message-ID: <20250723041920.9623-2-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro SET_BITS_TO_LE_2BYTE ends with a semicolon inside its definition,
which can lead to an extra semicolon when used, resulting in inconsistent
formatting or potential warnings.

This patch removes the redundant semicolon to comply with kernel macro
style guidelines and improve readability.

Detected using checkpatch.pl.

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
Changes in v2:
- Rewrapped commit message to follow 72-character limit
- Added explanation for removing semicolon
- Thanks for the review and feedback!

 drivers/staging/rtl8723bs/include/basic_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index e2f203910be..640db1e79e7 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -162,7 +162,7 @@
 		(					\
 		LE_BITS_CLEARED_TO_2BYTE(__pstart, __bitoffset, __bitlen) | \
 		((((u16)__val) & BIT_LEN_MASK_16(__bitlen)) << (__bitoffset)) \
-		);
+		)
 
 #define SET_BITS_TO_LE_1BYTE(__pstart, __bitoffset, __bitlen, __val) \
 		*((u8 *)(__pstart)) = EF1BYTE			\
-- 
2.50.1

