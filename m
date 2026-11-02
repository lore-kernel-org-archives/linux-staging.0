Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639011;
	b=NoMHqzxfPHRPr+tR+hQ96+5dQ52+GxWk0gqV1S/776Dirw/z5T05YV+7UfTjThdrFlJb
	 5juGvCQveUFowaDsE1aDBiHyq2SP65mPkgHXrWAyilHBXH2dFUZmhwmdY5h+jw5c8ECGX
	 +0Ywj3vBSNuNZSKxdPzhfzHFWGLPAqf/d9tnGcq8nrJDVF8h9/PAw4fFuEbRzFYFDCAPv
	 mPuoxZ95NSw4+BodTKRF5/jIbpexG1TU/8zh5nYCEOUgqLvztGJj34SKRLBE01aDtX+YH
	 M4QvzYUUXvZuMao2XUGDpKvNXPAMSLLDKUBiqbLQCnyuQSZVLecnrzWQg71MJB3/oTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
	b=Ms0VDr+C7wxUJVroLr8Brh3U0PTQuTdj1y1qPc47jldQ25Tr0lsZi5F3i6D7sO7lzbx7
	 p+8dx7U+nhcc2onbKvtOOLduA3B8OaLb9/tPaVIr++u/8WE8qY2WqMyererLsG4SxpUAW
	 6SW8NbXbHxt4vhRFek4ST3osjIfynmbURJNnfXcUuC41MKyOkSO+4MNGf/EwDHQD5cJqt
	 Zi/DiRL8STHKIXSMz3jZSDIt84npWuM59B+qZ7JNrwOR5cWtXkWou1c6KNh8cpnFIXG8M
	 whpo/6clJk1ifv/6jginwO0S+e5EDzaNOuvgg27hC0yF28246RTWcHgSyQw98pqePGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuMz+6kZ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E1D607BDE6
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E1D607BDE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuMz+6kZ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3347107f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639010; x=1794243810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=AuMz+6kZt6Nf+EqDUIPuiKslI4znqLXhigvuaKxkb8u2kwH1LoUkWbPlsZvPgzeQJy
         QPDwUOB9m129XNyM/kMQgmJFrfoyGzlc+vW9Jk9G3x+OT4FOy4r7cgvl1h+2umoGA0Bs
         f8P3p4tAE0t4uzt/YYny4oEQ11UxNTCsURILzmMTSvnUsj4NgrMGsOqR4x7zloHLiIC1
         yJUdAgnZPo9vDyf+fbh/U7VoAMWkrl3Lyfe3d03XfBTnnCwNnI1nBR1vuoQfrmJn+i74
         s90wn3ETqxq/KzsbaSpsgClXpp5N1IMDL6kxg86ATGFv3bPi265kggbsmES94C8Ly4wE
         xMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639010; x=1794243810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=d4oAkhaHNzq3qYQ/YKen4+5OAVMnzMwjmAG80FToicl6oZO2YO+dBNDVgyoyqrmH49
         MLOG0jB6cWl1+0IHTxDYmaphBQhy9C37OgwphaQ1IS+pQpIcOGropNsaxOrlrqjGT8Pc
         CzTDMR/enPwpKRjRQDcNmOjMMwfCaFhTw4S9hdeBcAvxtT2jCUtfIrU4W20nEyOpe+lV
         fDQrz05SLFWkULbtrk4paBH7jF4oI1eOjREzGyftpS7NvP5FDhwZjZ5uKcD3fNX57n9k
         cB57bJ74f9ocgYC0iPCvcORCjuOxQ07CUlVAe7tZHMVs08X4AVdeMK8LnARkHSSy7iRZ
         Q3WA==
X-Forwarded-Encrypted: i=1; AKwUvBz6REWW1OaEaLlj0e4fQDhNzckGWMMNusK64m4MeOEJKBKix+9desua3c5gzok2HFxew5h6tzaQjDdlcACj@lists.linux.dev
X-Gm-Message-State: APuU4Z9TodeEVlM64VCsgr2OAkxDkx5rHaUk4F13Jl3HzWlq1MFxWo52
	Wru+vSYZnqFjM+Gv3RzRzNS6fq7BAE7rOJ58XIJpMaRWAiWnqKCnbzo/
X-Gm-Gg: AYBFou1O+/9MLXJn8sMiyEx/HenN6NxJbzpGzn8aL4Q7vgWBnzfYD1/hquyqsKs3yMX
	hrKep93/hyCdC4LcUztqfGrH4wq7p22s23KK7aWsTUg3gCaOEBJT6bp2HGWDVUXnj8C/ov17nHc
	v3p/UaBTUPBQ8WUsuxh5SuqP9FRFUk8hRuA8IB+/zAswsILqTBG/8Gk7EVWD5RVMai23FD1iPXj
	sEYk3eVwDxte3zlCWXQyX4ZYbfuho7VATVgI7NzMytwtPpukH9xIC7aDTbRbaz0EXOB+ukDphNm
	P0ldxa4eBmGCfjE0rS+J+IneS7FQ0yxebtRbLSVg9ME+WSr2M5+fInfTlb+hTJbfKMeHkHPOrcq
	Be/2OApsusy/s5p60ntAejs8O9RBnjbO28u2UeqiHYcRlc6qQi68KTBz7AqKubR2KH7tEHnvVBz
	x5XMZlauyDvhN7uRRL177ACwXiO6aVbW+Fa0EdCQHGu8NdZs1G0hAJz2r/JOsONX3pb4aG27+X3
	ALTGAN2T5yh5CuZaknUBV8t1Geh89kHGupU0+dcmQfBUBsCDwNCC3x1kwNESHoyEHT9oBUAGDRm
	VADa/h78oCU8OX2PtwAF5tYon+j6lUe81MdFls+Yy2CvpoHCCr2V576OD1QtjdvnHqimEDtxge5
	+CkfYYd//ygQ3k3sabPtJTTyZNHYbyRkHQf2rke3ysG7/Aahx3FDxutVM1sM9Xe3gLq17Ya6IC1
	YIMpUUgNVp9IwyH8gZOMqfI5wZxiNZP3ECd2Q9MVO9Yb/mAQ2DWBPdMtiPKb7dRf6udJTp8EXIk
	9KZeAlMePIpe8Ig1tfgjyLXrnqcc0/s3dI/RbdnTsfPyScHzw==
X-Received: by 2002:a05:6000:4b08:b0:48e:7508:bc20 with SMTP id ffacd0b85a97d-48e7508be83mr18919618f8f.2.1793639009894;
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 08/10] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  2 Nov 2026 18:03:01 +0100
Message-ID: <20261102170303.1973892-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

The driver allocates the VP8 probability table with 0x2400 bytes, which
is the size the old Allwinner A10 library uses. All newer vendor
libraries allocate 0x5400 bytes and never write the area past 0x11b0
from the CPU. The hardware uses that area as scratch space, most likely
for the segment map, and its usage grows with the frame size: a
3840x2160 stream makes the hardware access memory past 0x2400 and
causes IOMMU page faults.

Allocate the table with 0x5400 bytes, like the vendor libraries do.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..6b00efa77c22 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -25,7 +25,7 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
+#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
 #define VP8_PROB_HALF 128
 #define QUANT_DELTA_COUNT 5
 
-- 
2.43.0

