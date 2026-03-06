Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021030C63B
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 02:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772763633; cv=none; b=GNz8tYVHa5NVDLj292W0UsBHXivcLud2m4V9yltU1Z5Vs8PGHRVsAJ/obCU+Xvzk0/4WAwkPKrAJAOj304zTN4bigl0HYHpRdF1kTzZ1q8s6XgF0M67ohZSf5yTxvLacbCUCHQ8OXZZFX+xoHzT3ZdHiP+zyfgOk0qOtTVMNa3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772763633; c=relaxed/simple;
	bh=uZRKbT3SjhNNYEYDt7XlpMBx0rMKFxLHEXfOQi+gT90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EiPZFgaCh6r9JFRa7LHjVkYAYlhoip9lJRMhWnJrTUvLmJM5q54WSbpPRMEGzUTz6ZAI5mKopk34PgjRMoG1mFZtlLRMigsjft2mEKNYju8SGhOdXEX9zP1fN8yN5d8qpoV7B6d3Sv3t+Ese8iU0WnTnfuHJNI8dl4qsFz62iCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gywx5abB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gywx5abB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad9f316d68so38128355ad.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 18:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772763631; x=1773368431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i66SgGXPjJO9xBGQeTASy3BWXPThStmeVv/sCYzE5ls=;
        b=Gywx5abBbpzLHSP/UhK0nXuRYt6hJuX9pI3PTtWbko5v78x8luorzgn1uGuBDf40eU
         7PASo9sGRgJ4JofPdr/vmo61qYftOI9xb+pKGYiRyzfAeVGpk6OpSRZ6T+Q2QTLje67V
         TNsSYZcdGpUI+nq02HU3nu0TJ9dZVhpsuSaVv1lQMCcIx3/EXKb7mkfnr8EzKy0pB8ad
         Pw9DPkl1g1MP65ISVyNiDnQ6MDdZgW2rMoBQIFT7ZS9YwSVd027h530lOyNP7h6PTtTn
         h21iRmpquwc1wDi37YfK4cyusiMElgTBqPvV6q+2dgADrMA+ShQOVQZ8EOOlgOpU1B+y
         Hjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772763631; x=1773368431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i66SgGXPjJO9xBGQeTASy3BWXPThStmeVv/sCYzE5ls=;
        b=t8cAPcJ6ljZfUUaioiN9OEbQMMgO7GRrV1GoyD7dvhlrab8nzfanqUUTF0Lab+B/an
         nFCHYzuqc0xSGCPcEnsT7GEi/Q9jyaLUD5BFpCCTcywqVYfrOmK28MfoGMOLWaUuRnns
         pRFTgTZX05QapJG1SB4shKduOKDNAbS2If4xApAVhBC3dDh3e0KlQyhns/FNMBVBfm9i
         mcGwH4ghN2KUD1bdtgVTJcPGxRbqwf185kzMakwLIoXrFAwTZ5J0fDJdTIo5Ihhnj196
         UuCOY5DYaNhOrnlhVFShr/cboO70y3Ahz71614z9TZOpVoDhpSJyFJXvbP2zfXVU3k+p
         jtoQ==
X-Gm-Message-State: AOJu0Yyc6625J/Qd/WVJODp1b9jcfsENMAMl6HJ7DHz1NJNSHE/n+xUK
	ZE06tDeUuugQQohEmOHi6f06JH1h9wULVIqLwDyiYZ8oUmF6W+E8/E6TuyKCZAx9jfg=
X-Gm-Gg: ATEYQzwY+Mt4/kuOW0O/JydNCzpdcV/ZPNkb9z0B6AtCjTu3Am3wmWVFIg7u44oe5xk
	v+3JToVT7aIq4bwLN9mctInIuItM1G+7HeOwSbjm49fRiofyFm829nvteBK8jT44m3qB+bmEGPc
	0Bd8btK42OVSfl5dlF6N5XupX6xHF8sM7w6nc8e+KvfcUlU7bQ+BDWe09odb1K0W70E7QJTL7MR
	OSn+9WqL1XApSqeyonHuRfu2i2DrsgdwWq3i0P9nuKMjzixIdPK6+0qDUJhiOWnE/dp1gBJylLm
	5gORQkJ1mW75SoJ0Zc4EhPDXxkseoPfS66i0X98yBM2g/T0CiGIMn8ZbcPKKT4RETtdND5HQCoi
	lhFAfpvbfQIOh1mJ9v9sgGF0blb4JjIYVo9dxFYq7qyZ/E9enSc/VFt1nfCil8zHt7oaMK+CZFK
	/np3yfg18zzNFZciBhCaGJyXqhj57j38DU4n+aNFpwhZu4Vlsd6QUiizfoDGVTYH++yfZYlZvFE
	OWm1UNs8tGYkAhw
X-Received: by 2002:a17:902:db0c:b0:2ae:8288:9122 with SMTP id d9443c01a7336-2ae828895cemr5327775ad.5.1772763631313;
        Thu, 05 Mar 2026 18:20:31 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840adb42sm829755ad.81.2026.03.05.18.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 18:20:30 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH v2] staging: most: dim2: replace ROUND_UP_TO macro with round_up()
Date: Thu,  5 Mar 2026 18:19:26 -0800
Message-ID: <20260306021926.7475-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROUND_UP_TO macro reuses argument 'd', which can cause unintended
side effects. Remove it and replace the macro call with the existing
round_up() function.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
v2: use existing round_up() instead of a custom inline function
---
 drivers/staging/most/dim2/hal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 6abe3ab2b2cf..ae9006703f23 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -45,8 +45,6 @@
 #define DBR_SIZE  (16 * 1024) /* specified by IP */
 #define DBR_BLOCK_SIZE  (DBR_SIZE / 32 / DBR_MAP_SIZE)
 
-#define ROUND_UP_TO(x, d)  (DIV_ROUND_UP(x, (d)) * (d))
-
 /* -------------------------------------------------------------------------- */
 /* generic helper functions and macros */
 
@@ -758,7 +756,7 @@ static u8 init_ctrl_async(struct dim_channel *ch, u8 type, u8 is_tx,
 		return DIM_INIT_ERR_CHANNEL_ADDRESS;
 
 	if (!ch->dbr_size)
-		ch->dbr_size = ROUND_UP_TO(hw_buffer_size, DBR_BLOCK_SIZE);
+		ch->dbr_size = round_up(hw_buffer_size, DBR_BLOCK_SIZE);
 	ch->dbr_addr = alloc_dbr(ch->dbr_size);
 	if (ch->dbr_addr >= DBR_SIZE)
 		return DIM_INIT_ERR_OUT_OF_MEMORY;
-- 
2.53.0

