Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E652E1C7C
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928889; cv=none; b=cJnzZBqajIE6vWJJQjMneCd3rCkJFchieObt6Uf3N7ICx0xOMmMNEg9vQKoCfFUSaYtzf1uV/JT3bXavFKufEp1PnNVhff46pNBX7mPlMGlnVcPdk3l7vV/ERmIfu1klIy1Uim8E3oAgSAlv5BJ3FP8/x6FumfmbKoHBPRPoIPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928889; c=relaxed/simple;
	bh=TVUmmcEGpWyuwDQqSCraoxd2R9SWXANWLHXdECuOFG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZLL4MT9J7wou9mQ3HFP6KL3ppaMoXkcK4FMjhY1udcPIJAnnkzbQNPzl9P3yVG7d1jpmfQtQNjK9dfHUrNYGzbInMvF95JWQa9yFtrYvITEUOj9l2uRoczMKleaThglqu6Z7zI7w2pgNL2VgYHX8dQfaXrptbC0ccjzMkiGRhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl7RLVC5; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl7RLVC5"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c76b9efc299so1297716a12.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775928887; x=1776533687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjJYUGwxxGgqwtKOdyqSDtrzAYZSru7BIzGMtnuqExI=;
        b=Jl7RLVC5PVNM9/ZVuY4INPgx8xRH3dWWe7lfV8PeytdIcYKEFeSwTFQEGofgKIVHU4
         Tpob6/yawJG5CH3whgr1GpMsPXbQ0NGpzTbzjbo9IPIySjSehV+MGYvfXqdpLAfPeHoW
         xwlC8qIGUzq0Sk9EL+57jkaNNNKuedRyZvmdlwYA6fedcJ0EPxhglMDUQ+Yg/AoQoq2U
         Qg6hFYL/gupiwwMNBld7q9NoYSDGdye99KuX7bMOw8kDmAP8WzxOwtinAD7a2QWtGFh3
         VBcS4tpXTi4rFMAhZo5T0tbOc0yAoqg6lDQRdxiGS+AFJm6/7w1hny37BR+Bm9TouKyN
         4QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775928887; x=1776533687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjJYUGwxxGgqwtKOdyqSDtrzAYZSru7BIzGMtnuqExI=;
        b=OADDfcQHi+JzJ/0t+z6BepHV824p1GQOp/lIX4poiazMBqiZbnTFs5/l/D+kaDJLbk
         LSnu7YpZXWwFQmGSlP5Yk0cAspFM09xHXh5ndZuOXtUNLl1vu9X697TuOXQXl9X/Zcg6
         i8Q9B0klnuu722yAYDTdlNcnbcaq22vuEX2xbONn1BaXP5O42ld0/niqmyxcC3tk/bVU
         H+vOVqB4ZKsMTP0y0cz66b/sqwY9lyE/B/xx3ULBkrzyj0kMhutWgak3mKE1gUkHBmqG
         4QeB7kJTBybFHCkspoMneNkKisqvH9smiz/RyBZnc/W3Z4/qrq2BQvLnzGkjrnM1f+lN
         RX7g==
X-Forwarded-Encrypted: i=1; AFNElJ/p6ZUz4w27FgTpW42l1FL2yE72YClcHk8Y0Bz8tUmI2j0zilLiTL7d/2U7zUpsp0rE14duuL7CbefknQuB@lists.linux.dev
X-Gm-Message-State: AOJu0YzO6y0axpkKz1oMFF1ZnEOMF8kJjNVmfpXKgGIU8lfEzwgssVex
	K73zbdnrAIs0R0YDxShj5Q+/3q7EWXUryzP6YtPk7+k1GmKhdA9b9+Td
X-Gm-Gg: AeBDiesMLtQUeK15qd0Wf50gCPQCy3xxMQjtvyjx8N6vUkcNGwWQEvwFtzj1y3/+Yiz
	W5XuHCAfRZh3OKCqlCs11kMtTNnPqA4IEo65r7yedtnRROiGICXXBhHfeZGSxfPsZfUyiv4IqPm
	DknLyn+AWfBKONtTetL2fJt/rZsfXIC5m2uf7JDP85JUcl1jFAkFmvpkkP/n/HtLs//n7HPfXdj
	7YkgZOJiIcV67yc4y3ew9FqoBQL98NZE3fiTSFmUjhxiBgIQQqIQfKe2dkOq361aGTJoBQu/5fe
	ooUlUWAzewBXMNOX+/ne/GQg+MNpa4H/Ef50ZfvWVzvhEM11/284YB60JHDFaZEpwEKyjqYgMuN
	ujHEGTnz78LZ2gjasoy8dRPpr3Vwn62ILWW2wTF4GPMZkSx4+WDZ+WAZBYFG/As1Ua01mR6NMxj
	eW7WDO1RN0z67yCbwwp7OTy4TJYhmfvPR1Qz9kz2KuhsdDBc9SytQvn9UZ8F+BhpYbAVp1nDocZ
	fEuiwQ36ozPmV1/gdZUoXMfFvqtMM8B
X-Received: by 2002:a17:903:144e:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2b2d5a7773emr76956635ad.36.1775928887277;
        Sat, 11 Apr 2026 10:34:47 -0700 (PDT)
Received: from michael-mint.tail2556e3.ts.net ([50.47.84.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dd67ecsm67009125ad.21.2026.04.11.10.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:34:46 -0700 (PDT)
From: Michael Ugrin <mugrinphoto@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	Dan Carpenter <error27@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael Ugrin <mugrinphoto@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: use umin() for strscpy size arguments
Date: Sat, 11 Apr 2026 10:34:05 -0700
Message-ID: <20260411173405.14485-1-mugrinphoto@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411005512.46142-1-mugrinphoto@gmail.com>
References: <20260411005512.46142-1-mugrinphoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded ternary min expressions with umin() in
strscpy() calls, as suggested by Dan Carpenter.

Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
---
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c      | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e0..60bb10dac5891 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1256,8 +1256,7 @@ ia_css_debug_pipe_graph_dump_stage(
 				while (ei[p] != ',')
 					p--;
 				/* Last comma found, copy till that comma */
-				strscpy(enable_info1, ei,
-                                        p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
+				strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
 
 				ei += p + 1;
 				l = strlen(ei);
@@ -1268,8 +1267,7 @@ ia_css_debug_pipe_graph_dump_stage(
 					 * it is not guaranteed dword aligned
 					 */
 
-					strscpy(enable_info2, ei,
-						l > sizeof(enable_info2) ? sizeof(enable_info2) : l);
+					strscpy(enable_info2, ei, umin(l, sizeof(enable_info2)));
 
 					snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
 						 enable_info1, enable_info2);
@@ -1280,8 +1278,7 @@ ia_css_debug_pipe_graph_dump_stage(
 					while (ei[p] != ',')
 						p--;
 
-					strscpy(enable_info2, ei,
-						p > sizeof(enable_info2) ? sizeof(enable_info2) : p);
+					strscpy(enable_info2, ei, umin(p, sizeof(enable_info2)));
 
 					ei += p + 1;
 					l = strlen(ei);
@@ -1303,7 +1300,7 @@ ia_css_debug_pipe_graph_dump_stage(
 						while (ei[p] != ',')
 							p--;
 						strscpy(enable_info3, ei,
-							p > sizeof(enable_info3) ? sizeof(enable_info3) : p);
+							umin(p, sizeof(enable_info3)));
 						ei += p + 1;
 						strscpy(enable_info3, ei,
 							sizeof(enable_info3));
-- 
2.43.0

