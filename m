Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817308;
	b=rrUapLw5qRzW1UGYrFdwQlLlH2ZgP3RQfgWAmy6tz8AggTELtzL1hZr2E3aVSaPXCN7l
	 MJw7AH9ciW/eyk24r648i429/wpXoL15cZe2YiTnie4LV0iLOsLm77BxIJEWiOd8haS1I
	 0cy0tm1ISKBRtShjxEw6UVSIDBvH4rfY5S+WlvsL2O4MHa6Bl4/tySfI8XqjAWQDLGGwE
	 6CAs6mGWEmU+JLCUK935+fL+603AfbGDL+NFe3WEPX1KD8La0MM82cxkEy6gsN1NWQ8lm
	 j1FZHom/dDM7/qqPcz8k3R5lHmDShcWMuxUk+2sgYRXKTvDpzItvv+PyKBSV7yqqmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=78AvqKs+xm6byH5E/GIRqHO2qPkCvfeiknurCnM2rCY=;
	b=DGMUwWTSCALkjDq+Kp4aptr3575CFY1ls8jiNdSa5HIHVchI7LuNL9DJmaF2zCrdKRI+
	 4HS6A7ldoX9Dh4cbES6t9yfnIkbO4iXjgRN689kU4xiih+oLlbTC71zvMFEZwUlDZBlQD
	 TUQOOPBb55aH8MCr10TNdj/VQHIqrDksW6CthpVqhECNztta2y75hEJVxDSHkCHUOZggJ
	 PLooFuHE70LHyeB5QHlMuF31NqUvIM77UM9zJVxJOziUsFPddH8z5CaBjQi7IejkLqOM+
	 PbaAgxTXBVHNPE6ck/Og48SRQNtwqEg/aQ4mKfKMa59gs7pYyNAnRmAx1fIBYuh+Kig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOdClCar;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688E606A329
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 18:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1688E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOdClCar
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso7210835e9.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 10:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817306; x=1794422106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78AvqKs+xm6byH5E/GIRqHO2qPkCvfeiknurCnM2rCY=;
        b=GOdClCarPvPoghaI+3vU/b0tYy+X/d2zmkaoR3IwACpFFYbDhq2HkokenUNFR2mqSd
         WSq/ujCZlMpG39BZOGaf4KGaOmEXwmKR6R+q36co+KXv1ILXZtdW3EJBuaUt4WS/b3cp
         2dBXfVXqd82eFQ15fVhA294PaYfMZt8nDQ4Gd2madeB63k2M6sECsuZ8YqEBSK7jw7jQ
         PjUqJeutFqMU90y1jnsQ0ApKD4yEcXtza3bs/bLknFqNSFGMceH1BeaSujo8psOrvMks
         TlmFMs1cQSjeh7Bk4QzAhIV+2KZpfHL98ZFmPfvcM409VM8knrXd8XyXWwcgQA5sqsTf
         rj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817306; x=1794422106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=78AvqKs+xm6byH5E/GIRqHO2qPkCvfeiknurCnM2rCY=;
        b=nh0PoW97FBlHA9QIkECOz/K6OwHdaws0OkkqEVYidlgubp5sQQQXztsRSKZZrR5YTN
         cEauIgY8Bk5ZZ74TkAVD88KZ4WdoKOZTv2P32wwwtiwMDbOLsL6sDkJ5g3VYenxSDzq2
         vu19EC5wl7CpF/KXZFX8SaIDyykTgzBFWp9BudhhVWEoxawJEsm08AoSySoVJxKRt2QC
         gPLtCm9emXvZDx9AABos8/QF7yHKN9d8LUcbbJKv/yqFlShiPlS2Jvu4CLnYeCCFQzs1
         vucW7ELz+Ugy99zhZ0+v+UT42uZkjuGrDW2iaRFYHLcpDUQ9Fb3Wmuo/zzAIujR3ZBPT
         MZSA==
X-Forwarded-Encrypted: i=1; AKwUvBwLqKEVx7tUr41rlClFTSz/cfkaU88KPSD6BnOQQ2FJrQCjw23cN1gxAERauyaklerR/fHmJmS7LA4pWzM6@lists.linux.dev
X-Gm-Message-State: APuU4Z+Eubra51nwBjIbGuluPMxEOhpzVOnUIMtSTVCp4qFOQ7MkxMnZ
	RvpD5FYO7n9YXxERwX46m6hn3ksO3Lzyfj/vSxFCiRVgMaAV8Uv2MniZ
X-Gm-Gg: AYBFou2DqDwi8rA0K5Hcl+g7O1iD442N7NnUVD4+n7a9yqopz9uAE7SxT0O4yAAP9g1
	rrFD+h9suz7SeSlRSbCiizBNCRr0xyn/CeYSu7fIzPFlGReZ5leOaVuOPRcNN8Xc73KykQVv9pw
	ulvLvZxDT5EEq/bkdHQ7IvFrL30yBvMhG0hSeWfOE+pjdjj+Gs0iTebskSgQMPsvhUH4U6yW/V8
	pVgRKw+FWGAAjvenzEc9KVU4NJn3V0qLTb+siqHtW3OoxYPjmtCai+H88rty6EbB+EweVfuDxBZ
	SAfqIri9p2TtUMyCFVq6da6NwzTGaNzV9UPlTvqSOJmV1a/10VwpfI0+FaJqFhSm+TL17XJrVYl
	DVSDDVgmEFKAgr+YJmIdZTm/a2KNztTYuSDy8RqCUkSOEL6QLXIy9j4mpl/uhbVR3KuRuksaRT0
	kxn61VOtVZEPP911Ir8T1Z3jDnOXp6WFvqCraZG+Hd0N5H0Rxi05J+2W5nB1kJMR5+++GFXeW9T
	dXPNC4fQnnQmSolKPzkmYao+W/q9q/51dInIEon5Z10oAT11i69ubrGI4HDlmcbBtyRaZLSdKYq
	ymdImE5qlVP111i4y+9lMVba5Sr97YiCCd8I1Q==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr409797395e9.6.1793817306434;
        Wed, 04 Nov 2026 10:35:06 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b432a883ffsm31404915e9.3.2026.11.04.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:35:04 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 1/2] staging: iio: addac: adt7316: sort headers alphabetically
Date: Wed,  4 Nov 2026 20:34:28 +0200
Message-ID: <20261104183429.20125-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104183429.20125-1-abdelnasserhussein11@gmail.com>
References: <20261104183429.20125-1-abdelnasserhussein11@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort included headers alphabetically without altering the list of
inclusions. Keep the <linux/iio/*> subsystem headers separated from
the <linux/*> group, and add a blank line before the local "adt7316.h"
header.

Reviewed-by: Joshua Crofts <crofts@kernel.org>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..515f1fdae46b 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,22 +5,23 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
+#include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/i2c.h>
-#include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
 
-#include <linux/iio/iio.h>
 #include <linux/iio/events.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+
 #include "adt7316.h"
 
 /*
-- 
2.56.0

