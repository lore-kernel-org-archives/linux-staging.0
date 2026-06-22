Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA16346E60
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168263; cv=none; b=ZoDk7srjDGqWYBmy3gjSxSVxpv3MRFI9l6zUvVoLfxXWsTP1ZZfVwgYAgUkPoKFkn/2ID7uO85TaEv53suY5qt/DtUm6mUgynhaXFVBtZh8+33Sk1FwsDoXku+ijusFE0GMYZEWc/5OpHibSE7ZxWsEhddrzHfwi542atWr8Ydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168263; c=relaxed/simple;
	bh=eAQ4oMX0/Xkapoymki25CS2DNK7+/uNx6TNxx66H3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdD2r2BvmSbEfcgoDrHXc4AZ5zKzeR3e1HMJvGJJjh4L0UjIGUHIo+PtkERGeZgj2VsAMlqSqBgu2CnD2EeJVa+YPSMcqtmAzLyD5M5Knk0j4hWT/eRehl0khXTpKMTOxDJCzARua07t0X0jvWhGyBI1pnn3p6DnP6H8BDBw9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF4kTc8t; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF4kTc8t"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30beab3af9eso11908467eec.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168262; x=1782773062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=EF4kTc8tGWRi3z7LNA6LDyYGFcuQ37UHCDEO6xwhJ95Q0nyY5WEMvNeFN31ZPs7qFy
         pd273wSa8U7mc+aTT7eM83vcShD/7PBIiz8KRdLlp4m9m11frGK5kNfdm1olrc9M2JOT
         FEOPEV+K9Dd1GFjRMo3DetxM/iKoKkKd5on5zJL6RqkcqVvchK5LgqBf+Yyp6wY2hX2/
         ME5r1mM018b681IRdhvDh0mH4hPThxdtk4zwiglb4dOIZ7nEpungfjwJ7AmCVSVq6dzm
         I6sAX/M34kiy4A3jXNfp4sH02MnVGUJzYKkyiNTksbFT+tDuAbJC592BM75+OBDWYkUM
         XwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168262; x=1782773062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=RRempCHOBsnXnS+7jZmIKeOZwU+F8HkNQt8ABDdygcUY3YM4HXYl+2a+KO1xCEdaye
         Ttap9RtK8sokwMn6YwPqVv7+IvAJGpt/UZe2bQsCZzLb5qNIDZeFahgdVLAqeuG+sEgC
         9YZ80hGo2A9Pg0mpwxoBVthhXH2v5HNsqyhKcZsdTDauYLdWwqQVjx6FdrXjs9Ild9wD
         bOiT85dX6SxiuIKflfAkFZt4Cng0z0MIoFT5vIgyfhjhGM7jtOcRtGA67EPrqDs5HKbT
         TtptE/zuKeNYkKJMua+fw3WwbbGHWxZa+wAogEIWKMeuye0IfGRusDZ3Q7or2T09N6xo
         yutQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxFCGCHUgM/5jiD3VP1QuYdW0GyktQDgMjYaEL/cs3pw5T5U0FlT6pmc2MRPacwrj6+oF6B32D9uxSQJow@lists.linux.dev
X-Gm-Message-State: AOJu0YzZXg+hQHADFYBzXyhiyZejzmDnqvp+6L9u8GOBlyj19oVYJ7jI
	/NgVd7LSa/62KKjwQUXm4ImUhtd6pjIzqMwV6cQhZLp2GrVRv5PVit/jvemast6h
X-Gm-Gg: AfdE7cm+YmI/fU+CKD38q50QVDOyrVE79hmD7z6f3BBNmXwhhPc5HY39kvhCP0ns+6r
	jcTLiGVAnComEmAR5EMXFtw620dqpq+3RdvoCWx4ePEMVGLt3GUnocy0bEdsbfqZpjWgH0t8VvX
	eDk/rYqKTfhVaZrVn+Y3nISY06CTAG3bFEi8mPBIeIzELawYPB/5Y4ZDTrrhLXb/LTzA3tCXMuk
	HDs3GNglA2rc/ZEwYXHLrqI815PWd8+ipz2A1de2qQi0qxa63m6ricXcXbO/Py3eSNxUztFsVTa
	Yzh4oQ/rNkSzyNEfDjggn4VG0dEq2BlDIflEfj8swjdJFyQpObs+NNzSjLfvHnoDeEHidCebdtG
	gQQdogJdCAX15SrkwCyH+u3QcTYosTDK2qgaZpW37KrxDp0LTYyqzRmtjhWALag6xmCYOqg3ZoY
	VAHcmLkd6KYzfWhqg+OW+L0yHhByvDKfiK2JAMnSyg2s82SaJDGjfUKqZuRyAap775TqU=
X-Received: by 2002:a05:7300:80ca:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c06e3177amr12392623eec.11.1782168261837;
        Mon, 22 Jun 2026 15:44:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:21 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Mon, 22 Jun 2026 19:42:42 -0300
Message-ID: <20260622224402.34001-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
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

