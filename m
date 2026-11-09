Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246678;
	b=QGoQ/+XobnE2swtWJLb0a4Q7JoRZ+TBq8jYqVK76JzutzjYnpNzCFRuZhr9/aRJWlbwp
	 Ftf30ylwYFJe2unLtynBFpF4RLl3IcTOub+Z9F7VGr3YIa8BlpRdFvs6j9OxT75Ee+1z8
	 YI8f82undsaSf4R8pijwCajoN/VmMBqg9Izwy05oyIbpjYkQU3Go+JU51K2xSoAgkIhiS
	 4gxFKaqurgkbIBxJn7yHdboeQQ+0bw+iR/BWg3a9Ag68/mq5OdVAzJGM05dlOvcpOfJI/
	 vGzjzKjbAhaUYjeA1VQiWenzkjZLddumJ9a3zAAyGCk0jAGrYfSeu8FYd96xslLY2Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
	b=ZPh1L6lm5fDXSTQkpIcszR0meQiz4xrkIYTdnTeJkeookRBlFtqRiksJ/m12c6yosE6d
	 yTSTa3I/KtC1NzY65vxAys0A05HfF5eqfFKQRlWMOgZCwMQ9Wz/v2cvjXAAnIgsq5khcV
	 IzOt3nXL6ijT7pz3wus9eJY87UOzJs5fVqehQRSCU4yw9eezmIke8cGu5HWTddeFDfzXw
	 UEKE0+y8e9B4k/JpDFujUEOzl62gylLvre73F2A9q0IryQiIJpUJ0x3TmYKzk4xAjCfr2
	 hKmhog1femySPl6Y42+ID0Plcbk3bG7VAc+YEIZjSYnJZhBAqZ2B9RcW+oOaJSN5vTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XJi/MBXn";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABB860A5BEA
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABB860A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJi/MBXn
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491aaed7565so739121f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246676; x=1794851476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=XJi/MBXnGCe40GQl48RSrpO7F+Ao8+HVX7X8VYpD/kxJBcmUZXQjg8fts+tCZL4b38
         qj0kkC5SdPKkxI7QKbNJMGFPaWfglIZDp/oWZpe9hvN5iIz6dS4R24CBRw4xPm8F3Vev
         Wge1et6miKlDeSj/x2q6/qtcZY9HXwmxyeQ0mTvPd5rKALTPb/JIVXJzAmUnz8YG7D8U
         hY7DcFMwqYr//BbyRz/wVjHfALn2ufWXbGCbjp5V31pF0lo+v+Q7b/5s+fFYDtKMH7vK
         WacitKxJLb6Kp34q+nYQUUnQ07TiCXopWrgo4z0w9G/s8VccolN337mp7+oJlHpjncKV
         gunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246676; x=1794851476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=yqehKadlDGXwlCxO2mMugtbCpe1stKBFLivQHZWVKAEoayWZjnb5+SxwpL37LeohWl
         1KfCbxFeQl9Ih8fhqeXAxZ8DXRKrHWBAsaoCKyMVV4lK23nn5BdzG836WlNZCyan6+E9
         gp888W9lTkiHUx8wHfPGj9/iXmhyzsa3Ag39vFEEDBOcKpB8Sx4cFmu16fH+fTmfKA9k
         WPOb9dbUA67eBlGv2sPEj8xTiirjA17c7L3c6AWuW3ILob5OFaexOJqP/n/ieagC3+RE
         UJyzp4Nponqc9T9ntWfHmiDVRuDQwZ3K31iZm3HqPS/gLu9t2HnQio6IPxxhjgUdqaiK
         8BHQ==
X-Forwarded-Encrypted: i=1; AL+hErF7nAGHfmu7W8aq4C3kox2rnnGGcbQMFs7ak6QCvokQ218Qb/zkL63T0P9yQXr0jhWWmvC6Xd2+Jvhw/63Z@lists.linux.dev
X-Gm-Message-State: APuU4Z/A+WW9z1z3C8hXgnW5KKDPZkeEPveKZFOyorQDDEoI3cpaPHpM
	QVocjqnHPpDmEYiVflOZNruzrYXGIuA3xmlONpQkg9ihL1nyoLpY8Vl8
X-Gm-Gg: AYBFou25z0SHvOQAoa07N8Ya8erXRHNLBorZWzP7pFvv0Nupfyl1SJss/AVAgBXAB7G
	faTodPMjApGyYKRpoXLgT/As8F8sIQfc2ghfmRCYDtxxbvOGdwB3OfuRGsn38J6ms5c0Ln2R6jU
	SKQq6xNKASHux10JrGLbxTmaYAHnqZQ6Hr7X12ZuINMO+D2kqxPaFwtIK7oer0MT1ZDsOCfMH2y
	99q6p1i9D8eyeiYtiSsKeqFQauxgMVm5E2DMhzvB1rhfZ/7auL5x51gxnC1h5EH6TjXiUNHwu8N
	2LUZGs2CpUwVYMD6VymmrEAhno+OgTUc6Jq5T9GFkPE7QwjE05ISJgg/fjbrBmeCfKmGaGaCq9X
	KD6UjFBkONleg2KSJB2rcD6BUymeXogI6e6sVeOo+h6KQUVZnCq9l+UZsDPTVm+avLury/YDzN3
	BagUKc3X9Sbe2+fp2ihUX/NgxvqspOBkz0aQjQJzI+hzj+a6uR0D1Fxw9udRFbLztt+X+BGt2pr
	KT9sOcU1YrfzH9F+OgyhXBPo2Zb3VfSVKdiqkWf69qq6DwO5JPTEk1eGboL6qncEa7A2IrWy9Zn
	9hm2lfJweIICn3Sd0uGgyVBOAeVsHW7rwg6Vc3VlkLSYEOVjrroSqFa7o/zPQVIe6pssZtJxo/y
	3bb5t6bEAgd2Uh8zdhPZaHrcOPw4HMCJIel29Ymzm92rG7ZqLXOs2q3BNJJbH49iFQOmt+D/H8G
	i+JIi1IUBivHVh9y9czuz67/IA/6c1Vo7Axba29X24uZzeQfXrkdkJaxKRcuLynpvP9jZwOUz4U
	TGXMaUGDP0nHcjrrb52gDPT6opoLz5XyKEiZyxzR9+mtHoakhA=
X-Received: by 2002:a05:6000:29d9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4982fd3e550mr237732f8f.26.1794246675934;
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
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
Subject: [PATCH v2 08/11] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  9 Nov 2026 18:50:13 +0100
Message-ID: <20261109175016.42061-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index fecca343bd92..84bf18fd231d 100644
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

