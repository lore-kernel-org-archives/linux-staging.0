Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5DC338F52
	for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030757; cv=none; b=Wq1eEifIzWNRFewjLyrGiAzWA39382m2xDch6OKfffMDBSKRGjk/m2z85HtYIewAxJQaECdnl9utDp4emGJ6kVxaT3N7wh4eKznNPd0EzJnksRAfbd19mDDYD1UpDNSGqkDol9Q1mDrmE5T1rqD4YybK5Fm2tPWAcrxbTFToUJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030757; c=relaxed/simple;
	bh=+XnCO9qejTe4ztQ5le1uNUFmPXCcBG6FCCQyy4ErpsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFmHZ8Up6yht2xKlpbfEJChTticonCdJAh1JP/JOb9Xxd6i6Yjv7Fv5hQDWLNviMkqZUjvVejxWoNf2h0I+vpMgvyh8xLfLl7LXP5VXajLEakrYKP73/+m//hmEShvqEtFDqy6hOjJfXS+y2wlqJXQmQolz3gIxrbhqlit4P52c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DroZCxu5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DroZCxu5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477770019e4so7943835e9.3
        for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 02:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763030754; x=1763635554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCSGnpbgz0bliYKvoZoaZD9Q232D8JPebeahtnpVkpQ=;
        b=DroZCxu5ofk/xnPUwrmLjWoRyR0dOk9lNA0/CzewN1wp9+M/q4PozHXK6WVZqMUJ9B
         QyXyf+MU9YyDHE5znp5B7nJaZ6UyFHV0LTxW3LEFyvcjY21wgfFAtk4bmE84O0tgOBM0
         3JdOMxVSsbDs3QKgK3WnwSFGnUZHeT++EikTo4uInitgdiVJOctZyomdZf9xrC5ZFly/
         f2Gtz+M+0fUFig1qFmV2OZpOjpFzxXREbXiPvQFNXVYjBaiQKKlObkvP1girZSYWFrYU
         uzY+zl4gzYAYgAqGzl6nfU/OPqjFdv3cSAIF637pp8TnFVdx/zzgn3mqSFHRcvkZyFNX
         2uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030754; x=1763635554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCSGnpbgz0bliYKvoZoaZD9Q232D8JPebeahtnpVkpQ=;
        b=j4T3fvgnfodUS3stjxGpvItUWoPpSo49psBGF7uPYq4BVK8G98qrL27WoT9loNs3sC
         llliEWOO8YD/TB+YPRzEbCsl68CEQ/wyYW3lYdMcfMJ3ntBFLdPxXKGWGKTPrnqhI5gK
         jLvVw2P/gIVllIS1PIdYekTA4403A1JqBTuRcrmHrEJoxMy/IW5tAiU2XFYil6CTKxW7
         uOgb/OXvzZAp+a/0a3O5vYgeraj0FjySFa89E9xaP051qT3anhGIwrtigCLGWubytXDW
         TKrp1eLYjjHPISr+zBQOVCLlX2KWZvokgFU5NTXt5DOapWxmZ2sNC4A3hjG4mCFbfgx3
         NYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmPdyf0E5A5HbHQHTqApDJpXJjsQoQ70sdBAndC6c5gz04nXM+yN0Sgzy5NIfmDE9uDM7Vnf4uv3XzoByP@lists.linux.dev
X-Gm-Message-State: AOJu0YxvDsmy8tJeCa9/1TDdZTTs3SINSBRuJ1Tt37nsi0aEx9UQHb6i
	RbogRDtbkBAbLg1nSsmhYcpJSm7nE5y8fy4LkoeGZMPBZyz5YFQZ4go/
X-Gm-Gg: ASbGncttnkNsHfakA/fJ3HuzMxhI3tjWA9n4HFEuz4ytSuc7OGfuCFOb9zK4FCV88Bv
	B4wGUM0kuFldyZnswfzSz9rXKUm8rwNMavtyvcmfnBYOczy05CfodCqqq2YcPTSbcZ6qNST8LR1
	PJ5UIL4Fv/pV28E9tBVoFkbRLwTWrIyCilzE2yLoM6U56ObDKC/5n1mMULEKe70l/NL54+pRTNc
	wap56myqxzPBBvm9bPg+tN+ZXP2tyKNo3VtHEppBoLKyzMJnADUqCqpGOs89bok6MAWYa75cCWz
	smRbywxwRTX4sA7d1acMsBp+Chn/qWZIHqLO7au98I0KFpy3u5FqUnQE8g1V3JoeedDLiVqx46C
	zHIHEhiGkZOF63NWtNS2t34R4gZzAmnFJOevNkE7v0jz8NIRPJQmAIhTPyvmOZVNmA0/cwye1Ia
	cIQ5Y6Vyce0t34liCS
X-Google-Smtp-Source: AGHT+IGxCRedSaI36k9CRMkIT2YTFsd0v2RcTU3A4+H7h0fGyHbkMBGCmGgXRMW69Cuef9l7bByDWg==
X-Received: by 2002:a05:600c:45c4:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-477870a9fc0mr66657735e9.32.1763030753468;
        Thu, 13 Nov 2025 02:45:53 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm1444975e9.5.2025.11.13.02.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:45:53 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V3 5/6] staging: gpib: Fix SPDX license for gpib headers
Date: Thu, 13 Nov 2025 11:45:42 +0100
Message-ID: <20251113104543.5875-6-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113104543.5875-1-dpenkler@gmail.com>
References: <20251113104543.5875-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part destaging the gpib drivers we need to add the
WITH Linux-syscall-note to the SPDX license in the gpib
common includes as these will be part of the kernel headers.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h       | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index ddf82a4d989f..2a7f5eeb9777 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 /***************************************************************************
  *    copyright		   : (C) 2002 by Frank Mori Hess
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 55bf5e55507a..50bb6e251e45 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 /***************************************************************************
  *    copyright            : (C) 2002 by Frank Mori Hess
-- 
2.51.2

