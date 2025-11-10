Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFF3064A0
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770324; cv=none; b=mmbWKndxzVyxPxobQdmwfJ4il93kCTcbDoFOs9iQZcsiCVYvOxEAWq9e6SHbuxEvJhmiwdvTd/wmLWnJkQWdN6mziLGXsN+f6wdgc7aa7Jhs+FSg+ii0uP4IUsctHx1qafsFf4b1vWv25XtoEfsecAq1yP0F8KFNZyUa4qx+7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770324; c=relaxed/simple;
	bh=IOMKATf4WlRptW6Eh2eCnd2gEghdfx2vgXIU4gGtjTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1RbEoiN07SMrA/vQ0RjckXDzsEglFk6qXpQED7wD22j9rm92KmEK7SUtb20VkLHJRrfr3U6DVl2JBKM6nBFkuUaZ4uf5ne1FwtWF4wESUJlMpXj2PB5YkLDK9HvBUYbZxjMgdtqbujTwvvI/koA2y/y61MFTOhME6IK1UmEEKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JB5TcrNr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JB5TcrNr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47778b23f64so6218575e9.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770321; x=1763375121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFSFlISYEwJhzl0uBpsUYIAL1eAWoNbR9f/0OF3g05Y=;
        b=JB5TcrNrtDtB7qG+HVN1XUQU18oFsQlc/4WWJD6ZTigYFOQ/HqB7BylknwP5gw/+az
         8zYGbCWeS4M8X12Uo4bhllDJQqt2hfA29poRGTL8yGNRkCsikUo/SvScr3scHTn9ZzT1
         seThmUzRqJ0LY/4GF5TPfoAJGETuTtaJgXTxK+RLveXkI2k3WE8AnVbdisaOPe6xlPNz
         B8tYE/dM1RMh2Q9jBYIrVGHtq0OBeKiQGzLPtgfE4yrJySgCE8x1Q+gwrhyCFDJJL/0i
         K3LIv2ryzjQxx1zZawq99bMBbFoT0M2Hah2aKl42U4TRhh/YB8Iu0TKVsplM2m3gUaTR
         OzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770321; x=1763375121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PFSFlISYEwJhzl0uBpsUYIAL1eAWoNbR9f/0OF3g05Y=;
        b=C+Ow+9i3utLg8qbE9zMV0gjvquh3e0QDBB7srJvEGPZz2ztLVxZHnqauEoD1P2Odd3
         A2a9YApUqe3hH9Xas/zbR9LVqLHPulJwM016KCQ1H9eyu9Wo7AedwBGswIM7VQkBvMFz
         qkYmaDmkcR3uOl9V3lW3WXG8muoU54jQZ4JIp+Ki3/5w4rQSYzUZU/Cv3In0QujLBYdm
         7bAskhT7ggifGZFlhGRlzSgy6hA0PfEWPcQP8vGH0wXLIkfqLpWwu4x/bLNORvtgg6PG
         gO0++6+TitseM6We60qhuZq3DgzR5AbZikmN7+TtdhPDJuYIJvkgMhaAQ6gqKcXtVI11
         QlAA==
X-Forwarded-Encrypted: i=1; AJvYcCWptrBEw2cRxLbFUyegTxF5yuUy4WFREvV7b50YtW6WhP3jiRyr8DC1VIic2AsxtPv3TZC1Cytn29m3JAbl@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+HKt/5m1/huJsPhaYoa6E0lelilD+gxD5IGY9i6ELv8cCqSVo
	591IXxR0/dGuQIeWQZ+swBwnFo5OYrC/1EgJwcSdp0KAhWPtXxnaS6ecaRvlLJ3U
X-Gm-Gg: ASbGnctZ87eMqvATUVoRpBoLsG0pbJB8FYEm5zLQHhwJ4EXk+/kucBdZekVyjV+Pg2h
	Pun8l2UqANIOiAoIk6+L64WK9hyQV0tsAC/h4vJljWSJiK7Mv3Bw5MuK6RSi1tEAMxS9YQMlLLm
	9hi2cojvQiHdxSNprTJpJ/N2cOkQoSGbb07Q9ztRkruiz4gDe+V1aXneAqAtj4NhQadj+vHVEcg
	FyhJzqPKZOqDSnzLQX6h5WYNfpjNkNO5cExtOytm01sTgjlownfKhOmFJ9M8sWhe3cvmkwk5BQB
	sVZE1EDwPMwxyD1c/tVTrE5ruWq+tzeN7NtODqcp+XgrQO/Cw+bQAjp9Ikq5W3pyoSA+eqRg3K6
	+9NkkMLcYfdH59iZjLnu5tEIStDBmnS9iIH3qwuAwp5BA3buwUQC9EQc+ypLUpetKbzW95gcMod
	VtRiuWL7bnECq39sbQ9/Umbm4uKrM=
X-Google-Smtp-Source: AGHT+IENGoi+2Lljzvtl1dUUzsqoI4mfqoY8VewVD7RbWHS3meOUSd3hc/m0a9FFVRJX0mFwtOhZLg==
X-Received: by 2002:a05:600c:3b0f:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-47773236f61mr67331675e9.4.1762770321259;
        Mon, 10 Nov 2025 02:25:21 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:21 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 04/11] staging: gpib: Change file path for uapi headers
Date: Mon, 10 Nov 2025 11:25:00 +0100
Message-ID: <20251110102507.1445-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the gpib destaging process the gpib/uapi header files will be
moved to the standard kernel uapi directory include/uapi/linux

Change the include file path in the code for these files accordingly.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/include/gpibP.h      | 4 ++--
 drivers/staging/gpib/include/gpib_types.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 1b27f37e0ba0..e3938ada3e0d 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -12,8 +12,8 @@
 #include "gpib_types.h"
 #include "gpib_proto.h"
 #include "gpib_cmd.h"
-#include "gpib.h"
-#include "gpib_ioctl.h"
+#include <linux/gpib.h>
+#include <linux/gpib_ioctl.h>
 
 #include <linux/fs.h>
 #include <linux/interrupt.h>
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 998abb379749..5a0978ae27e7 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-#include "gpib.h"
+#include <linux/gpib.h>
 #include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
-- 
2.51.2

