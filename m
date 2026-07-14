Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C34432E73
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 22:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069569; cv=none; b=FsNjdH6nj1sFx0EdakmTKu9VT+NPEQtEkljGAJw6wbjPF1nCnVF/pWu99LX4/crTZrdsLt3wYg3DbJab9jP4XTWY6yXl/GQvRJ9s8HzhlFJqd7RHw68Ol7sFEKsF+xS7gxE9xK8sENo9VuZNJxcStq5nRtsVsmolDvMoJXjgxXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069569; c=relaxed/simple;
	bh=A/qCooa4CX/pAneYM+GM5KmJMW5XYUBE0lCmM9t6q+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9rBzftZlzghl2zYTZMWsUTTExvOfowPUpLt4R2+Dfqx9DPkq3WJHU++11f84OyoG3i9HIrO5om0M++h3FYP+B8CKQvr5LDFN1r31C9nSG5NBwmctZykbNg0MmYte+dCb0G8Ba9UTFw6lJ2naOWrDtR8nrBxLFYprIkyKcqkNSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyXWsOux; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyXWsOux"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-80dc4a68e4aso39633277b3.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 15:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069567; x=1784674367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/WWXOiE2bPExBcg+mH0smayeiXsP/dreEIzKLTojxg=;
        b=JyXWsOuxo0fZeMUK2gNawvkKYEtxWnqTVZkIfjQfv3UWzjJ0bEuGsKOLrii1TafSK9
         2xoAypENHj102yC8knSIAEfswn9+uKsRlnhHJKHytpvVjUP0tLEINn+UJfsvlhdY63Q5
         B8kjqKrQ14fFkjYrs9q2LFRlthUnqs47p5jgpBqBbBXYXlsntcn0P366D2H90ysZSng/
         +3zdG+LZWIjQo02Gjldvc7bUIrmy3wAFdM/GmTKWqzKJWBs9nJJBVeQOskM1IlO7D51g
         R0lI8TVMpjCkETlEJ/Iv2jhuY2NlydPEdUsHF3fGxfs1wT6A4dP2WmgG1DCRT8aLhMHf
         OE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069567; x=1784674367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/WWXOiE2bPExBcg+mH0smayeiXsP/dreEIzKLTojxg=;
        b=j75GVZneAyK+1vTVwqpPVuCYekpA44djg7cuSgDU0Kq80KF3Wg+BXq6DG6FrAymuWg
         b+Kn+aWdSR7U0Mz7oJOKmHl0r8xF+hjXmFxMWFSbV+WrcNR+db3bDF8x+hCIPg2r8O7L
         nxizX/0LjIXLzIiNJOMx1TTBewfQVBO8KCFFvKTRLSWsJwJbexOFAq+7ZJbHL5jWupTS
         IzcAl8G/hC3ZblUTKkbJ7ocDGiUwYKtCOWQnCIRE4LIY+rLlU2pku1sWWZV+lSKct8vO
         JK4oy5ouo6gdeSVUEVNjOdTCC4j9yW5UjsMkf3sxyjbJ6vYrowQT5o8lJVUZytcyl1hA
         O1IA==
X-Forwarded-Encrypted: i=1; AHgh+Rpa1aCh1V9DCfVix7RY2bbHzIEUarAaEE5FKDrlNka8my8kZfykqVZ6WGFjLWlFsfd6vUVbZgTTs2Oe6a8c@lists.linux.dev
X-Gm-Message-State: AOJu0YyelUR5ByzfjJk2plv2ms5RKgiFj5R6nd40NVsiHfCTh2xfKrWp
	eA+bH1uBUPLIHDVXZKshGeqPixb6uA/fa6eoJJYh9IU3EQTF8zz44WYj
X-Gm-Gg: AfdE7cmpabDaI+vsovm0y+craHmsrF+L4tE/ET78u6e62S16t8goaxmJxSt2GgmOHq5
	wLej0fSO0vDp3SZETK4c2czzRtCxQs3cR9lgzbtU7+zKyleRn1b5Ng6nsGwn9kKMxGV14jLPSaW
	Vp3fHvrZH4LpSeFzD4a3XTyaULmzUwM5/5TNBXQBM2/dnVUD04Er5xv3CU9r9ivZshWE6TM1UwK
	3t9Y8kjYPQtp0nYmhsQqEC3JqirMcvvlVlGFWec+zu3iJ6x5qm9UBPwA3XeK9nZzI5QgODWI5t/
	Ypf0xgihjfTlEKe6++LDAqiCLwGNJgy3gkctyDwBQYruZMXWHaViyT0C6cHO8JnZCgOME/OeWoK
	oX/uhwM9M8Ccpgtw15umDtssZRRnz9OtQi21Y0d3+cxR9f9OwfbfZ8TNi2lqdTCvNMJS31MDUgd
	ibHsjHnAzcz80sZvJkbwsbSoPZs2grX/NW2YMKCJL4H4UW2KkzJ8f1DvM18z2MWfdWoH/Q3uHXW
	r65
X-Received: by 2002:a05:690c:6b86:b0:81d:2194:6c4a with SMTP id 00721157ae682-81ecfa39bdbmr4685007b3.47.1784069566934;
        Tue, 14 Jul 2026 15:52:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:46 -0700 (PDT)
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
Subject: [PATCH v4 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Tue, 14 Jul 2026 19:49:00 -0300
Message-ID: <20260714225235.47134-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

