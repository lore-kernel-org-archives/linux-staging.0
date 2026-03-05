Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB2B14AD0D
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 02:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772677880; cv=none; b=mbt2X2j5VYmUyVXfVjyhZG7g7uiZjBuWt5FPzSv+H5E6toIJi1NPuvHU6Ljo0926jQpPFyxieVsQKbb11RzjabWo2mcc2RYiqPlhRIG2EV49OkyEd5LBcAfsozRXRNciF/dCcPpAdHDjkXA90qq/fyF2Goch+ZzbAfaksvpPCNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772677880; c=relaxed/simple;
	bh=9l0/XipQrxsbkRm7IDBSkJeZiJ4NS3hF0ZYewVOXuMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MB5/+aDGy3u2GWuGbhqvJD4k6cXP/s7+gFM8BSbPhOOaJf6aUctHQgaaklAo8iuXsTACIG06xkH6wPaXNqL/wss2BJpfEHm4YEUp5UxeXc4FX1jBxNRZX/H0FThKVzSvyEgfv8DMspHa5G1xK4vE2eXsTBSYCF5orgAA3MIEwXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETvzxGnd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETvzxGnd"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae5636ab04so39403855ad.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 18:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772677879; x=1773282679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUqfJMcx9L5FQGh+J7MuKrbiXz0RwhhP1+HSMePaqII=;
        b=ETvzxGnd2UGhm0psMON5JbPRZlbl5KaYW5XEOFYUKLmfcEGspU52Y9XFoxteygUvUy
         tSUVpMvory5X4m23fBJnfBeFbgLBv7Vtqcecn9Sh9jtZy/HrL4Tf6d96luQM60uVJYqy
         P4P40oyeegS/kczAG+xyzRghUdBwh6cKfu29h1SH0eJszqgIxao6XKqatxRld5qkb3SN
         EUWaYdiivUghRBW3zCmcOgWNELz4B6OA6lkh/kR3ekwGeaDVjRDM2ewgxOhFuqrf9OY/
         inROisui158G+twqi2QqOA+wUEVcuxXyxippcuOMUfRHsiSBYvMsonKd2RFj7QldCQdX
         0rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772677879; x=1773282679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUqfJMcx9L5FQGh+J7MuKrbiXz0RwhhP1+HSMePaqII=;
        b=n3UPaLVE/kJnot08ojNbmyrOZhWd3KlvRecu8la/+Xj4IQ91aZrpZRigY+IV8mb2Hc
         6zLptWEPA4tfuh/GlOTdO0AdAuGYPk8SbHrH9qGcxumItT0IM6iCpD25m1+uYJbqf5Ps
         RR4Kb59x2IWxgmOOvfUfYAPVlJzEvhujpLOaMhg5ZZQw5ZXgxwit7Na4p4p5+1IEpthG
         cj1WQWJ0sYfiGdL05nACd4yD0qPEhJxuMJQCqLkXqq1AeBDbqIDb6MpEikj3iV9u9UUE
         wh3zaVNGy3NYyvL+24AODKPm8HEp8jGVrHI1rzjeIge3MYAFJWM+XngHX3V8CWeGFTqq
         J22Q==
X-Gm-Message-State: AOJu0Yxqv0cv037fOQEVXuafOLftBdsh7o0cKhto137p8w9jAQgZpLWw
	AUpXKATpiipGMm/u5q3mRdh/JPKhcxbooGnu12ZRb+UNWW+WUeif1DdFnpO7i8h8NuE=
X-Gm-Gg: ATEYQzwJ/moCFpfcE4fc8uQva5/o4wVOFsIU/JPUM/ivgBP5bs/lX2uZY3ryEubskEY
	NNUOMCf9IJdjTycS8V8jXbgjUIxXZ+49XB5hiks8RoGQVMq6vf6CbfXcif1tXFN5yF57pqnIKPI
	Vo1tZp7LGwE2h/DNRohRrX4YzhTUA8vzRudQ+WWZHTFkU6tvn0Ol4ydQbxkcUlAgLmPrwVJCatC
	DaRecCBXhrK5lHfHMya469gtGF5xXvrK9XRvoc/8Hc/onW+dIK8FgKKetZeKj4ha3b9sHnbjBTv
	Bpql6RCH3QjcDp9dphXgsP4NRl7FL+PiEqRz83svMUZafoLLOsU5+tR2/Byz3g3GxE6WKbJjJMC
	bhmn9aH732ao6Y6jBgbKvEZAAyvK0wTWJEwPUoA397uUEfDzB+Ikgrh+Gr7+3Vkm8A+VjJ36HHO
	FP66tZtxkDL79UgT5LVIqJfkBz5Ac/s3y8YdgdFAhzm0n7SvDmxoOVHnPN5+huuRM7uetEZFL9b
	+qL5kHc8aXgkHuz
X-Received: by 2002:a17:903:b50:b0:2ae:489b:496e with SMTP id d9443c01a7336-2ae6aae7ddemr36615175ad.27.1772677878590;
        Wed, 04 Mar 2026 18:31:18 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4bbdec99sm145009405ad.64.2026.03.04.18.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 18:31:18 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: most: dim2: convert ROUND_UP_TO macro to static inline function
Date: Wed,  4 Mar 2026 18:30:00 -0800
Message-ID: <20260305023000.64609-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROUND_UP_TO macro reuses argument 'd', which can cause unintended
side effects. Replace it with a static inline function.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/most/dim2/hal.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 6abe3ab2b2cf..53a3af9e9fbb 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -45,7 +45,10 @@
 #define DBR_SIZE  (16 * 1024) /* specified by IP */
 #define DBR_BLOCK_SIZE  (DBR_SIZE / 32 / DBR_MAP_SIZE)
 
-#define ROUND_UP_TO(x, d)  (DIV_ROUND_UP(x, (d)) * (d))
+static inline u16 round_up_to(u16 x, u16 d)
+{
+	return DIV_ROUND_UP(x, d) * d;
+}
 
 /* -------------------------------------------------------------------------- */
 /* generic helper functions and macros */
@@ -758,7 +761,7 @@ static u8 init_ctrl_async(struct dim_channel *ch, u8 type, u8 is_tx,
 		return DIM_INIT_ERR_CHANNEL_ADDRESS;
 
 	if (!ch->dbr_size)
-		ch->dbr_size = ROUND_UP_TO(hw_buffer_size, DBR_BLOCK_SIZE);
+		ch->dbr_size = round_up_to(hw_buffer_size, DBR_BLOCK_SIZE);
 	ch->dbr_addr = alloc_dbr(ch->dbr_size);
 	if (ch->dbr_addr >= DBR_SIZE)
 		return DIM_INIT_ERR_OUT_OF_MEMORY;
-- 
2.53.0

