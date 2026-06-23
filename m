Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E4D3C3453
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 22:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252642; cv=none; b=OW/imrvmSvsL9jliV2oCYbzFE6nnSUCLV1Zsr8I8wu9VP9jkOb4oow3CjxuGVl9X2uCoiv3QpeSoMIUYzP1Crc9PuTAuBGixzAVDQkIFnc21mlLKjt3CpeqvP1+LKbjCwbrSJpeBfAxh3pewfPvR9a4dFhop513vh99tHaVRGM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252642; c=relaxed/simple;
	bh=eAQ4oMX0/Xkapoymki25CS2DNK7+/uNx6TNxx66H3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ag/I+I8Go7VR5m+pVmWOdD9INw5HB36x06czJxInHgKrRHp9z7iUoNZldO3OmD6iyVgywK+N76WWsQxvoFyZ4M18wNTfbTRMArX0sysmBu0KNGTQBO0chfgQCIg6tXIfbXG0AVBE85Z3mRWD3d8x53acGJGni2fUK1GZ0Y/h4tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK4Auq6i; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK4Auq6i"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30c6c8d7503so37242eec.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252640; x=1782857440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=jK4Auq6isFqPU6cYmIGfEgioFQb7On7TxSDtkAehsZiupJTizqhNKaXeB1WmguDNsZ
         anl2UniP10VEC5vCbUNZQo5IO5poYasMc4ZFvyeraHw++EdO7MjwnfClUmYiNMHMnXhb
         Pb0yjBiw+rm1Ag/40hzO/0i4ZfAeOf34mvMPtqIlj+NQwt3UKqFnxAWOgap+MfhqSzBf
         VmdwXoQvRWAtuSizth8tYEy7ODkCDNrrEdAAV89Ebd6y+z+5lytoWgBwQEk1CmKhGqua
         kOkaC7wK3E/y2+TInQCCzBC3nh7dz7qQtsIhZyqOFkWCEEqqdETbIAbD9vOWS5ExC1l/
         PmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252640; x=1782857440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=B3bd95p2SQuSR1TnpOjnPpoZ8y6u7CVcQPqrHESYabVDAxZgFq0Tlb+/f8KxXF+q5c
         TjpgnoTHCQ44MliIENa19htFqXNnEUBzAheAM9MMmQKHzlj4tHvTZjgF+IFr6UqxSdg4
         QQybssZmX+zWApvvD1H6I0n845g+rQstdXokwO/+KYfwIru3tsrCCAVv0q+kwfXCLLIb
         +PUJsC9s1XTyYXXjH6q6fzTDyLCKdf7fbMywkuI6dzCPaq8G68qffE9RBezZdhfuQ37N
         NYdos6VzKTSY7wL7/XiM5l+IElVag6zX0XY8PkMeuj8wkblP1fu4MjaDiwI9WYH0dRhH
         2eSg==
X-Forwarded-Encrypted: i=1; AHgh+RoypVGy5mfnAblSrNNbVFHi7SHSTFT4L1WX2dIRgxNVH7yjZwyXx/VNw4tADyU86ublADjiUPipQD+2jpJX@lists.linux.dev
X-Gm-Message-State: AOJu0YxlG00Vfd6uBccHiZ5kQEzKg8UmlljQVjZcnExduSJcCzEaMuNU
	I5GFiTNRj7Wot/Jn1wM0mdgSJglTg1cLoX5NOrdsN/cbG60dQcBt9mJP
X-Gm-Gg: AfdE7cmAqsqsX8WHKHuQGWz0Wyt+x3e6PjTobr5ehxEQpUiXtI8lR1ofCt5OAGXbnyg
	YFcAc4l8DN0nZoTayKkRDgbpUQsT9qqE1NKHpY92q+1muLdUQpQV4M9uFzwqlpfLnJtY9spPzrY
	rKAe1XV3/xtfdpWLXkNuCtjEKsu8u2HL5tjAsT9WCkk9f3H4Yy4XTFER96yNtLjbesWkdzWIPrs
	J8wd5zD5VTg4Nmq3f1PbmjjAozrLXgHMcuf1uaMJjxQ6bFjm6A4WT1kMVyYOz6eone6H5m+Ee13
	HDXFol/mpmLJQ2gn9Af1CDhhpG726b1tIHxAnLK6HR1u5kU09jrXp65VEVvuvJ7ehCqQqRXXBu2
	8glEpPaCugD5OmiGIPNGDCYdLrabUdC5rv/8UBwQNMu0RsCf7vVFedcBY8erTpk+leArS/FA6/W
	UQVyvQ9aX285geXUrMpACayv3s+aSCA3d0GS7fgflpG7+imUTxpu2sshhC/EVjF0UvrVLcNlr/0
	8n1pQ==
X-Received: by 2002:a05:7300:f191:b0:30c:5a7b:ae2a with SMTP id 5a478bee46e88-30c69343b90mr948131eec.24.1782252640508;
        Tue, 23 Jun 2026 15:10:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:40 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Tue, 23 Jun 2026 19:09:26 -0300
Message-ID: <20260623221028.40238-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
References: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
the size multiplication internally with overflow checking, silenting
checkpatch warn.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_metrics.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..90d92ab8d52b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include <linux/slab.h>
+
 #include "assert_support.h"
 #include "sh_css_metrics.h"
 
@@ -59,16 +61,13 @@ make_histogram(struct sh_css_pc_histogram *histogram, unsigned int length)
 		return;
 	if (histogram->run)
 		return;
-	histogram->run = kvmalloc(length * sizeof(*histogram->run),
-				  GFP_KERNEL);
+	histogram->run = kvmalloc_objs(*histogram->run, length);
 	if (!histogram->run)
 		return;
-	histogram->stall = kvmalloc(length * sizeof(*histogram->stall),
-				    GFP_KERNEL);
+	histogram->stall = kvmalloc_objs(*histogram->stall, length);
 	if (!histogram->stall)
 		return;
-	histogram->msink = kvmalloc(length * sizeof(*histogram->msink),
-				    GFP_KERNEL);
+	histogram->msink = kvmalloc_objs(*histogram->msink, length);
 	if (!histogram->msink)
 		return;
 
-- 
2.48.1

