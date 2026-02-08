Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C0823DD
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 08:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770538204; cv=none; b=lnxSvM6Fs+7HKcyIFnhz+jtVBCP3zGe6LoKtsZpepbafoVCrZEGdAq03nLtw1kBr8+XPqD51qOan07E2IUez2OyCGtXAkv0tmim1o92d53lmAveo99GzOL04vROwFLf/tUZ5yjyBuwgWJu0XOaKHOqd+XF/wayCa1emmWxzFBRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770538204; c=relaxed/simple;
	bh=apCo+NxQIJ125wGOxI491KpZ3M13EJ2F3C8Cf651zlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjA4UP/S4uk2NobXHk3ZX8M6jC6kyfPLkWNOqnCWrC+iYLumY3ZXajf6WIwxjDMQr3esgjVzn7x3hgWy9iz6swgaCGUCxTcGVFVfBNnL5dwsrMCWjOr8nhDTmQdqxnfvG7H2zwQkVfr5rl4FuwkntxJcRvbNWFi3BW+CJu0g/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0zGCw24; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0zGCw24"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c635559e1c3so1496960a12.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 00:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770538203; x=1771143003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0mYhTX1YmVJTNOOi9eBI44F+4WVfw5JHV/DAG/nKJY=;
        b=X0zGCw24PLd2nFDVBks4wnAvUFH2nGIIZ4OdQim6lcjq+nUJMJFPRiSyJ+NZwsIUIj
         MpCprjF7SL1sfvE1x7Ddla9v+CT6a+hz5aObI+KBFIV5npXLnf7gxkAF9HpDj3oBuvCI
         WhMeOHnm4AZr3L/gKnC4ke14VcqYSKa0S/cWFgtvWQe70iuj0xuGY8RQjxz4FVRxYHvb
         uGmZN/vF/yNrYdrIaLyRb+BOqXpJD5OLBH9hxkT/1sbcaQrRacK8Y31DdbqYn73uZgzo
         /VdI2lODfa2t9iC0ck0J4KxCGeA8TbRMZ4JdoLVkUI+qsI+i4eEyoDAECFtzZ14msmRm
         0iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770538203; x=1771143003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0mYhTX1YmVJTNOOi9eBI44F+4WVfw5JHV/DAG/nKJY=;
        b=IEUzVMA1cpoRFKVVXKERsRahEfnUtRbjU3uCU4isP3KlQd/O5rGsv3HeH3J72whZPl
         mAkjpcM6Pj9ef2gmsvgGkyIvl6//DRT2B0T7+xGKAEujKFslY2jZ3G2+pV3ssT+Bv+S/
         jRoBUh+fwXRchyUKTB0XmSG75x7B/UunLhMo8pUAQawIdi8DaqQidaM2Yyks6Fuw6B5z
         KmKVm6zNC1cZqUpvnzTumKZxFtM5YPo9gSlslDcEaTSOFPwM1NIb1vv1DvqCdxQrY6FH
         0+4SxZIviWGoF3ddDmWx9N369MmccGXrC8pcp6oYrB/DttdH2K4JuhC5NDh2JB5Ffo/v
         60hA==
X-Forwarded-Encrypted: i=1; AJvYcCXN3GNH+lybuvKQnA+P+aXp5BkaOLcEqoA/vasw6FHr+05tQWaYLSl+5BFKJ8wSL0c7ama+ZP5E2FJcyJHb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+KMkeMIIdSg0/ywViZ+e8H+GDlBkdgVCCkMvpFDsTA3tPsfbc
	ufZmDAmCcBX+ix8lMCIWau0oJtYnZAvb3vukmFKSc2zkTQyhXaNkWIb9
X-Gm-Gg: AZuq6aIVB3zQLMHyl4ranyVREtEoPPHa5CpxLkeJsTtjAYfmtVNY+qZWhOh/xuBBMvq
	JrHeNmzTxGC1tIjSvi+A/RhhQIM/JhXmKcVokmSgi2z+C+m43hOPwKbQ6beQyvUiCs+lo6ijSi/
	zFgDeyxV1EHz5nQZANKy6GVzqwtcmWMY9leoBpciVXu17kqWac0DDowohTm5OcKVypj5xFp29H8
	SFPcqd6WpR+hLO3hBR/RRCnU5EzypBCtDplDhCdbvDpK8LAtTO0JZwx5KhzRDheSeGNC2c8amnt
	GB5HgyEx6o8BfZKlugySP+vN8meOdJOaiGJiv35oCImKQweuBAYwdNgYiboNHlMXUtFWmX9eRGp
	JY0pGIvz8om2QVxPTo2+XYFQcITBCTpdqH0PyHIzKVKoeexh/ozY7T41PKiUwhZqKKxemlviXPz
	0H9WU2IFG0uNztuefS0wC/cajWsASsOW37KF1E6ApfQg==
X-Received: by 2002:a05:6a20:7347:b0:361:6411:fc2b with SMTP id adf61e73a8af0-3938f919e3fmr11570539637.5.1770538203216;
        Sun, 08 Feb 2026 00:10:03 -0800 (PST)
Received: from fedora.domain.name ([2401:4900:1c80:515a:e2d8:fc5e:e39d:5717])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb526610sm6910494a12.13.2026.02.08.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 00:10:02 -0800 (PST)
From: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: [PATCH v2] staging: most: dim2: remove unused header includes
Date: Sun,  8 Feb 2026 13:39:32 +0530
Message-ID: <20260208080932.124960-1-rajveer.chaudhari.linux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260207212354.51694-1-rajveer.chaudhari.linux@gmail.com>
References: <20260207212354.51694-1-rajveer.chaudhari.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused header includes from dim2.c and hal.c to
reduce unnecessary dependencies and improve compilation time.

Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
---

Changes in v2:
- Keep linux/kernel.h in hal.c as it provides DIV_ROUND_UP macro

 drivers/staging/most/dim2/dim2.c | 3 ---
 drivers/staging/most/dim2/hal.c  | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index dad2abe6c0c9..b406cc0415b5 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -7,9 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/module.h>
 #include <linux/printk.h>
-#include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
@@ -17,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/sched.h>
 #include <linux/kthread.h>
 #include <linux/most.h>
 #include <linux/of.h>
diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 6abe3ab2b2cf..cebde0ce2701 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -11,9 +11,8 @@
 #include "hal.h"
 #include "errors.h"
 #include "reg.h"
-#include <linux/stddef.h>
-#include <linux/kernel.h>
 #include <linux/io.h>
+#include <linux/kernel.h>
 
 /*
  * Size factor for isochronous DBR buffer.
-- 
2.52.0

