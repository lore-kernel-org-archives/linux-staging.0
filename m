Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2538A28F
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 17:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054646; cv=none; b=lgektpX6jrLaRvlPWjaerwNdsxHQO3oBeABqXzUxDNKJFbYMUwknoKoxedDdmbzswWs3seGCuRu2L+QL8sHUi/IPgp00lnDLt0LXlfYpxdJ/9HOP/SEIzEikD2btTYZ36xMYi7C6CTxAnytKDq1U4CSTptsunWK/i61xMEVJjlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054646; c=relaxed/simple;
	bh=n2buX5VudVRgU7PL7UJfJORunqQ2AVjMcYcWLb2KfbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJi6SmJuXE9+3Ze4gVTqvjR/0p/4pKkIkZxNM7g3kFBYKT1FKrC+hglvJ0O1thyIeIhGI11RWPjzv1MmGroQPe6uqifMTW8RUws+ScVvTNS0DuIEgyIlEFwXhT6ZhNmIokUEzjgtZucI5nTOKvTehuJhcp8N8Avdy0ZDWccO2Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNlT/r8y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNlT/r8y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso36312695e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 09:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054644; x=1770659444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rCAwVYKU83hcXqCu+Y7xeDCP8XJjgg0MwhJ+CwyuNk=;
        b=iNlT/r8y7hYnwtjS6Fv7tli8rzbQ8oFiMmV2jukZOcZtdwJ5Uw4CNoyC6gTHaP4tXJ
         lUMc2VgH6ukN3bqkE6agcOhv/IYhmO+dncIdxAfz3LJgRDB3ybtnzQaEeoiNq61WF9Jg
         JhX4WDogNLZqjnAHGAbkGrlR78pptmdcT+EnnNV2mX7xBdqh/RX8RKQ+o1ANx5czM80C
         TmnfLsyVzjQ7UNwM49kLIwybKpjLlA0K5WwF/BzqG7SQwpK2XVglvptdn84TX5cczJA5
         dghmss6TFvE8ieCZ80r8Dy2FSHgdxXIxcAJLHwfRIOw+YRv21hPbsU1+wx4P+2gOz+13
         go3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054644; x=1770659444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rCAwVYKU83hcXqCu+Y7xeDCP8XJjgg0MwhJ+CwyuNk=;
        b=F03uAUEmYP2c2GwUFv/j87nDDg8kNdq9XtK/gbnaF0E2IrkcPJKFDkriPAbG8NjSW1
         1jUfSlGT3mwSF3seEDDudU/4rz991ao5BZNpUHOq1EfnFpfm6J2+vakFs5z0KWxT30t5
         ecHAlFd4J4aB51IOAoSA2xf2AnF4cyTZ5OPSRUK/QpRknhoaW7Px8YPu+WLIoTS9edSu
         CkbrShY7q7qhLaNo0/OGAsIOIjL7ZLQsHBYvbtvGhXg5L92A4QsHd78JJWEpIsbRqR86
         cTROOOvaIdJWUEyxy6gIddaWPTmJkaomCkYjRndVioLaVQipB5v3TDLONRKAnd9VJj6/
         fT1g==
X-Forwarded-Encrypted: i=1; AJvYcCVANCAEKj2BmNO4Oi3PIyp4BYauPc8Ah7RHe5KvKEFq0YmXDYtKFh0Q4LRKkzLvA8qT+5VzmG+wmUb03pQX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx39u+htE6bZhWSSbROLpX50EplDbVLuSkGG93adQujip6OFunT
	WPr7MuJwmqcvmunIfJkq2df8++Y7sbmRz66gPDEm1dGYUNSl6zW+E0ys
X-Gm-Gg: AZuq6aLXZBUoUS9BejD2yxAzgLbdUpMFTkdI/Pv+wot3cSY9NrsZS55ps25/CXsz5hm
	+uqsEoUFazwbGBR+06OOSlLkl2MhX59fR78uJB0XQEGJaqKeEw2X+WspDlWRPbfVYVEIc7qEB/l
	0UR2SU8uQVrlv3tlEbHGxVuQSiUFkPeqH2dOLkzOwmZrr1M8c1q6Lgu6k1bsSF8VOJZQIfNGwB8
	3hfyx6V9eIeHJnGUfnft3B3CdHJ101rW5MhD6K4i0SGH4/CM+7aHgMzejTXv5s3jjIjzHBRmdyG
	rXgM9nQKxR6MUzojOgO1XJYlnMf+bS0KNa/oEnqlomVE4KgNzNd9PiUPQ7iiebIPr94EFQvzPu0
	+yPQBwaHOED3RhbAovc4YRu73OlEpDS4f1LDTdDUEEkhKBz87X9wcMwNpCyw41bKe0E8Pb1Wh0V
	9TP+sIiHRhCmxLGnbefUTvejpS/uZkV6j5wvjhdQ==
X-Received: by 2002:a05:600c:1548:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-482db45e124mr148875905e9.5.1770054643324;
        Mon, 02 Feb 2026 09:50:43 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:43 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 4/4] media: ipu3: use BIT()
Date: Mon,  2 Feb 2026 19:50:33 +0200
Message-ID: <20260202175033.8640-5-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer BIT() macro over manual bitshift.

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
 drivers/staging/media/ipu3/ipu3-mmu.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index cb9bf5fb2..95ce34ad8 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -21,7 +21,7 @@
 #include "ipu3-mmu.h"
 
 #define IPU3_PT_BITS		10
-#define IPU3_PT_PTES		(1UL << IPU3_PT_BITS)
+#define IPU3_PT_PTES		(BIT(IPU3_PT_BITS))
 #define IPU3_PT_SIZE		(IPU3_PT_PTES << 2)
 #define IPU3_PT_ORDER		(IPU3_PT_SIZE >> PAGE_SHIFT)
 
diff --git a/drivers/staging/media/ipu3/ipu3-mmu.h b/drivers/staging/media/ipu3/ipu3-mmu.h
index a5f0bca7e..990482f10 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.h
+++ b/drivers/staging/media/ipu3/ipu3-mmu.h
@@ -5,8 +5,10 @@
 #ifndef __IPU3_MMU_H
 #define __IPU3_MMU_H
 
+#include <linux/bitops.h>
+
 #define IPU3_PAGE_SHIFT		12
-#define IPU3_PAGE_SIZE		(1UL << IPU3_PAGE_SHIFT)
+#define IPU3_PAGE_SIZE		(BIT(IPU3_PAGE_SHIFT))
 
 /**
  * struct imgu_mmu_info - Describes mmu geometry
-- 
2.51.0

