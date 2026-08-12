Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACBA47DFBD
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 18:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557841; cv=none; b=UPETEZ2vz6h9CV8AQD1zbNk1fgq9gBsH8s8pSxt+F/B9NsRtc6HPncnnmvwip4WR6N844qIFZDnhlffvA1aJIorbGKiYurGrTtS+QYh70infq8GVAQGZvqT3MtYYhK6M9g2kaHluRkrOahDr2C6YSRCLpWT/f/9tC13eNMoDZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557841; c=relaxed/simple;
	bh=X4qZMzntQmtonEzW3xsFjGak19y1pukBZ/kbzssIuzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYCdqPP3K+z8aG9XMddyW8pJiCIM0moQVviWkev3+XA6JQkJED7VuvPxLq3CHtE3TdFtePwkwV4bw8UThllHrpZubJbqobiHoEJAmRD+ERsoZ/FeJFER6v1arA4xEjDD0kxUfiPtokIRv8S2iuWnbd/Itp6T/rXJvgpXIQ7gbFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwX+wwX5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwX+wwX5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f703a9d05so884574f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786557838; x=1787162638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIuK/QcVkGoQXMhHo6v6ZPZQneDigGFJyRUb3Qf9p8Y=;
        b=NwX+wwX5SKi1gv7e9zS4wPw6Qw/4SabNnhc7mmpWGvkjKbfphOLJdRtamwXgYx8j/R
         hV23EZ61wucFM6zeVcB+X5mNBfQJb1kcmFVn29egGkLwaGAlyS+Ys56zDv1WVhNevltb
         U2PFbPOI0jdW4x/+Oa1TsID6OwfXl5Xs8L0JsUH9o67TkJRQIfU7HuCjsWV4vmMrmGLh
         B8pQxy+18DL09FU1XVzkAqGQK/ibwqZCdPU1/JEy4+2u2HrO3uxqP2bYPOQ/ih+H8Ue+
         u6qwqjBOldCBjCEzpqYw9QRbbFuKN9YcFs1hzfr9dF23QgKK4HND0OXL/8+Rp4WE6g7F
         TtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786557838; x=1787162638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIuK/QcVkGoQXMhHo6v6ZPZQneDigGFJyRUb3Qf9p8Y=;
        b=JdtadJra/oKKKafC+pFGTvucOdW5oQEjOEqRXtePTLLDTEMrLj3SDqjc9QdDTgCdxb
         BHs4eOrrZo8qzAqxEqOnu6WaATpGSDzVTt2NmafMaoBNOoiFi7LaeXINAKEwInZSh5+Q
         J5gF0C/TBWe4OhDliYL55peIv0qkgMS9E0PrkYKbdEYi7khW3DIUurUr1TOJzVup74Zw
         DO5QFEan3zdsDeBIfAn2/EReAWdRWcDs1PQmu4kTHuKtX6AhiwqbgTbLeLYZg1xGlcQw
         2VLIx4gLbEWLI9hhSfr1ALZXjgcRD2FhUSkmZkz2OXY5tB1GNho75Fz3VB3uGciIk4oj
         1NZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFKUGuVG7okIB/7WMJPpdS9hetNXac+qMBg7ykbPOKg26bQttl7QHaznzgLkE+RzhvcIoxAF+W1XKl3dKQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwYe/4Jlc6sDRzf2pwgmQ2QFpo5+caq2jZ3Nba4EEqfth9KP3vA
	uv0+MI62Kk3kbiIHPRqNvOD2sjFLUXwTblnQP4224cJWh1LuAgn2tYR5
X-Gm-Gg: AR+sD10g9lwvfX/h/C6fOijDj5AOrLOqEG1LFO0DcXLWEAw2sbaXIZ+b9SJrN3YxLhe
	xCcJsMKMcwrhHNLSQtM7qV90enVpIHtFtPijibbdsXRfTVy6tsAd9fdpTbMdpzgP40ARt1No9bu
	zZOCtySRe5LPFxwwIWwFgZas2nYe/Ly6tbCQSUyxMFxF9IqE/H63hDgx9/+2ZfUMDRT9Hvl/7fL
	rhCKO5mbYkdTPZJXGARb9dTGbnRkL8I2IGIyCMIVv3hgHTuxTuY/8ukCuT64TcsgfH2LiJbFznR
	R+RRCkUE1yh7Pv4I1lwR4liHS9/JZgbQ/1nHADMTnkfs/DeAKSFFjL1v7AV78UNzLPyVFKRwzra
	KRHC8afJse/eo8jZ93qOgY72uaE6K2Dnyoii2t1kdLcnEg6wIwmP8GqVIirm/TSP80cmBD2tmmL
	6Z/kERU/CLXUQGgb1yIJscglJSKuuxKDNdmqeC8mBDnV2Lg9GK3oV6ad2G06nyKNhtnEbtktpnu
	k/aC8hNH7L4HidzNLievGqKcBJbaPsXvA==
X-Received: by 2002:a05:6000:25c5:b0:47f:91f0:9a8 with SMTP id ffacd0b85a97d-48152cc1d39mr9571784f8f.23.1786557837811;
        Wed, 12 Aug 2026 11:03:57 -0700 (PDT)
Received: from legion.localdomain ([176.88.100.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48157f1fbd0sm1935622f8f.28.2026.08.12.11.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:03:57 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: [PATCH] staging: greybus: loopback: remove unused includes
Date: Wed, 12 Aug 2026 21:03:54 +0300
Message-ID: <20260812180354.1968-1-batuadatutkun@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux/random.h, linux/sizes.h, linux/cdev.h, linux/fs.h, and
linux/workqueue.h are not used anywhere in this file; none of their
symbols appear in the source, and none are needed transitively either
(debugfs helpers come from linux/debugfs.h, the async worker uses
kthread_run()/kthread_stop() rather than the workqueue API).

Verified by removing the five includes and rebuilding
drivers/staging/greybus out-of-tree with W=1: no new warnings or
errors, and checkpatch.pl reports the same warning/check count before
and after.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
 drivers/staging/greybus/loopback.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index ea57b1f5d156..1169cfcd28c6 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -14,15 +14,10 @@
 #include <linux/slab.h>
 #include <linux/kthread.h>
 #include <linux/delay.h>
-#include <linux/random.h>
-#include <linux/sizes.h>
-#include <linux/cdev.h>
-#include <linux/fs.h>
 #include <linux/kfifo.h>
 #include <linux/debugfs.h>
 #include <linux/list_sort.h>
 #include <linux/spinlock.h>
-#include <linux/workqueue.h>
 #include <linux/atomic.h>
 #include <linux/pm_runtime.h>
 #include <linux/greybus.h>
-- 
2.53.0

