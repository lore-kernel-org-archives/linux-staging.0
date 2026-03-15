Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A32A1A2392
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773580674; cv=none; b=mTLUs4It+24D2a1hhMKx7lFtIxf0rh346maX3AjnHrLdUkWaVWK6iEjZGQrFvooUuw+PJCpVOyj0SRa9C6QjGQxMuY6Js0F5cJc74N1vZkLBZsyW2rU5h+3cocFzErYeqpoopHL4+fETUK8M/t1ey6T2FzMBe78QSqhqi0+UYnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773580674; c=relaxed/simple;
	bh=hV+O4O0pRp3nN+TgLtOJ+G44oZrJurwt9YXvxkDsxIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMoqpaLQ7MHf1c+KJtYfz2SHj4SipnBK6zKhEKy24mwQ8Ax0E8zUvKAnMq+CQwYkxK9/zm1naQZLJv4PfVEjOVm5HlrQwpFYdVvlrofkAxKYovVIFNZvbJsYbAu+rQGY1HRAg/bZlbWCgujq+llr6CTo1nX5hUM8sSYe7gcU1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMkn3nNg; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMkn3nNg"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986e538decso29012707b3.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773580672; x=1774185472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LZ8NRo6Txzz55QbEXPFWR+KZ7mc3WURP4Ivw7xqEdLU=;
        b=LMkn3nNgN8WgxjOcux7m8i14YNnN5imdcRjxZcfyGeWIphSo/kznaTu1nM0NYnOZLC
         DBZTat8PQ/GPnbx4RjcZYt5sp2chEtJK2/Rkard9lCOb8Hq8hOEcA6vPW1mJrWuKsPYm
         APsO2pA6uTyVUKeIaZo2SyZBFIsFjDcMEqobH9eYBjTUhOjTRYReeLVyNcL2uOqJId5f
         2taPGyNiuH1PjCNtJyqFniM7Rf5nGnR0NIJxwgXZF+2R8w0X4p1qTusoNAlpKrUZl0T3
         jMP12VFQgglZzIlm6Ph9chic0U0qY+MhaZ6D26TTEejd/nVGVjAFf4psj0BvvNN1wJva
         3HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773580672; x=1774185472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ8NRo6Txzz55QbEXPFWR+KZ7mc3WURP4Ivw7xqEdLU=;
        b=nnQ+04CNtsGsYM9k8R7XkYX/xwfa0xTR8eG3fsa+VPIoUPpS6tq61f1opoTlw1P4My
         G097kOzTRzUjORQXjYFIWF8+EMKCCMtf+AdhizvCz/pqAL5ZfKXIOyS0I265uJ2rmgdf
         EuITrpvyIbfctbETKh6fT7pCHIbOn7FLM4WtAPn8kSvYwHAPW7zMT5gU9fQ9/7vnoo95
         vqjDzSFcTJBzp0s2f3IDYLVn2IUzrVfvlq8O+z7dJCuuSq0OSf25n0/5/6F5u31TH5zO
         wNiNoj8OjWcDjHS/VQ/NuYj+enKvGebkE54dfHNZtY2BzXsNCIcJAR9IAC8YTfth2S8J
         rWbA==
X-Gm-Message-State: AOJu0Yw+oieuKn2bQHvwRe4YwcH/y3s6HwuZHTk7zQufX8BysCwng62f
	XGXF8mdX2Otm3oyaJv72Jdb2xusP4V8WZX9sVPf7bCnnIQq/ZVIYKa1M
X-Gm-Gg: ATEYQzzmXEXrnDkeSXafl1yPp/FH5Co3DRaUp185KI10415gk0PZJES5Ue8mVpF0xlv
	OhYNQvCclb1FgA8QvSL+hChetfxFjjoKGYsOGIY9jWYxtqazSWzA3Dq0D0SgbgXkATIU0GNEnRY
	MTZ2nvr2X2q060CTeSMNEpAtVQL4/CjdYuBKlTp4JhAb+iNwmlS6JwPdlpmS29PfS0UB/vbXiNc
	85LyUUDCFKRvaOWaM+VtOsp1ir8/XfdFvd4TlTnqO9I6A6RAsgxhkc1DJWZO8XZ+yHWTcNpmSUG
	lJAtdqtNMDxunvkDPKXh1C1iFY7ddyUKgu7zHXtOh5/cOLiE9LGy0ZWg0+/nB8RdRWOTIWP/3Ur
	Vq3TCzbiD8qlQ0MBXYQNb2hFx7oa8dyIujViuhmgk/KhEnRAKXcX7jdU8x00h3twaMzzUKvwkfm
	4i81Mzi5A5PYZpeI5sw3wMwQ==
X-Received: by 2002:a05:690c:7405:b0:79a:2e6a:1b90 with SMTP id 00721157ae682-79a2e6a3c12mr57759627b3.24.1773580672004;
        Sun, 15 Mar 2026 06:17:52 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a381fc2cesm16020657b3.24.2026.03.15.06.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 06:17:51 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary 'ETH_ALEN' definition
Date: Sun, 15 Mar 2026 16:17:24 +0300
Message-ID: <20260315131734.25054-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ETH_ALEN macro is already declared in the Kernel headers, so there
is no need to redefine it here.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 8ec14e8d4c89..14c806a22b38 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -11,7 +11,6 @@
 
 #define MGMT_QUEUE_NUM 5
 
-#define ETH_ALEN	6
 #define ETH_TYPE_LEN		2
 #define PAYLOAD_TYPE_LEN	1
 
-- 
2.53.0

