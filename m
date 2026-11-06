Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971667;
	b=qQQlcygrnBKG3U5hJKOJHhh+47hFTk0elWoyAXuwngMSbPPzt4FNrXE5/aTgYVfsR6yq
	 VeUO4BEOrUFHm+zuzirgr9UgtJk2Hk4ofl6H6IhAEnD0CssM5n0GE2l+zI4PKbqpoi08s
	 vxtkUAy286KewulbebFq8sEYiQpe4L5Xh2oCgxelH7Rut0dJmDsfNXMTpO8Ggw8zzAbbg
	 oLtabMxSQJc6vAAsOp5S099YYqbGbJxfv+KbeZzj/Xwf1esscvPQgWw/DGkoyCeg5N+sk
	 bPIiMbStC38vFjX4jIGOGPkX80hWbX2+6KTKUScHH5Onbps4Mt3QvbQLbND9JrN9org==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
	b=nUWdp1x91p1hhLdZG7iN1uY6nxjhfIQWMdY2a9Jh1d1FdeZXPwcFGYZfrDc2DTTdgNI8
	 V6oqAetmC6khj5btpHvHFVfzHbIRq+8Ke7uI+4oiOp1F2OGPb8h97EdxBKMf37Huxivu+
	 YkTlmC2WXrxT1T62CJORX/qolm8tiANijkRWkTyDHGwmTh9UERm6rvKz47aBT6WaeAEW7
	 LbrIMZ25Tj+LGMUWzpaGdf652CVaFfGipUx1SoipmJrZkgsZI8NSJA7bEgIoS6pfRrTJg
	 1iy9NwwfxK1o2wrDQfpE3cmZjGpnTYoFonN52TQVFNc1iBN+FgiZKvX/BMqri/emGuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HntITB57;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B250606A32E
	for <linux-staging@lists.linux.dev>; Fri,  6 Nov 2026 13:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B250606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HntITB57
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so340018f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 06 Nov 2026 05:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971665; x=1794576465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
        b=HntITB57eQK8IilSE89M2WT8uiXZIFrS5NGZvs4Axt3/LcGelhzDjPfKKOhCpmaAZ4
         MEuUVx1rQZQvY/UFKGXbclYF+I8vtR8xtzkrgYILXMkFylTG+cZXVFKV61V88XMcbGa/
         WGsrQAVyugUs3XdDPPPQgQTwvKEN1oZuWCAN2pwKQTI8QtREzekzKMIkZFGDU7qCjb51
         7kLiSTQ06pSIUzALhgq9HqWyxKRLbkqF7svX47wdZ1jqCiCnBXLCR8M2lV/ScB9SUGNP
         WDIDE9vTiDdAM46/YWNfCoLlA4qGzVllIg3P08b9L+ggNcoRp38hycBkAOgaT/XvYK8t
         lQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971665; x=1794576465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
        b=wCtdLQp/QS9aCDMrG9XhY82Sx6npmljhnKGHAJW/kCPUDiN4Ye919wbovYVN/9GGeH
         w184yN1mb6wD/95JmLL6ltKcqdqSvktmkCm4o6V9gekYWYosfvTa0Dsh+JRfbV0chTBE
         WbrbsiuIycVKI9xCE46rKyYFZ2GAIUHDduR7z0anwL0oQ0S7gTZRL8aejpEmOsGme8Hk
         ZURlnl4Q1ch2gFKwZv3jRIV6BDg9Ko15p4CPRkiDBxjIG0RxA06w5ub/TxjMRIjYdM4D
         /EDAHFP6BpUk2N9MAilk/k/xF9VqEDJ6t8Z4ip9sxfWd/5lLSHW++KI2FzZ3f0qunhKO
         /L6A==
X-Forwarded-Encrypted: i=1; AL+hErGoXB6R4MQ615CivvJ1DhzxYUozskQg4o75jme3cSBo9sfh/ttWfTbxvCrHAKTVK6csJ2xqOUlSWH/OiRhG@lists.linux.dev
X-Gm-Message-State: APuU4Z9TvFuhHEnmFT3JBa5AmkCroU4IJH7/g+wwnNZxkMP1/BVgvGM4
	AM4kxn1T1Mp+SKCXMVk0olbbnJmm8c5hHA8ViUBwuUl078Z635sJPqqc
X-Gm-Gg: AYBFou0EfZzUmkC9RcHORpj65zrOxS77B1scm6hANwM/W0JlV5H0EpZtASI1WmU4G8+
	aZgo/YOFOiz6Gl1GWsn+b4wCdUpk+7iElvYVxoi4sOXg8mW1cdXkfC87jUTqKcY0wruc4VYwgPx
	yOT8kF0O7suryWZStFJosNmdZSE6w0Yg/Jn9ZEKIaUx9nmqxrT7ZJaeMK4SJCJQ88h7feIJ+AyA
	9nHxwjuQg3ZtUhRnLcQ2EO34ZhFgHJ326K6CcJTyAxhKAYOaQ3XUMa0p6PlWxc6kfmj3QffwOQM
	FynpiVDXrzziN5HGquz6bYqnrGiGIM5IlAoUv/6T1hN21UYN8M6IMjKYDk1E7JN6oybzGhGe6WY
	zWgeLWBq53qasORUZREbskmYOX5lSXKn8Uq+/g+33rBtKcEc/Y0LUTpVf/RzsCFSuSwNJ0A9eGs
	KHVz9Z/iwq3Vbbvjw1bEv+8fgeGBtHXNaTXYgi9mooNWuabfL+8LRX4GJ5FvaF2ofncTuAAcjPz
	ioqDCpIDRdXzUPPh1FwaTzB3wtQ4VkoAisIvLS0KVsTVVLStaCm34HXAJvlC25sCot8QMY5gYbf
	ABWKkAtzpoUl7KsucylCrLqPIXro
X-Received: by 2002:a05:6000:240a:b0:493:1004:96f7 with SMTP id ffacd0b85a97d-49310049976mr3258508f8f.54.1793971664393;
        Fri, 06 Nov 2026 05:27:44 -0800 (PST)
Received: from salem.. ([141.85.144.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723310fsm3825733f8f.32.2026.11.06.05.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:27:44 -0800 (PST)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	matt@mattwardle.net,
	Lorena Tanase <tanaselorena3@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Fix double blank line
Date: Fri,  6 Nov 2026 15:27:36 +0200
Message-ID: <20261106132736.32837-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Removed blank line to ensure linux kernel coding style. Found using
checkpatch.pl script.

Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
Changes since v1: removed Cc line as suggested Andy Shevchenko
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 68b0ad27615d..66311ab4880a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -6,7 +6,6 @@
 
 #include "system_global.h"
 
-
 #include "input_system.h"
 #include <type_support.h>
 #include "gp_device.h"
-- 
2.43.0

