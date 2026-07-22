Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD973D9551
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734978; cv=none; b=pfhd8N6oH+8XZZu2M/LnGFHXo+8Vjbgm7xBKiEyVGIZ8+0Od+ZObqXxxDtlw97vRWZfum7ZykmMba9OrP+t2Yh3MetUbyZZGrxuN8AOpYZ8g4dUPX9N2Ruq7kGQYyuUdKVLTsvCEOAufV0ZW5QQiqaDBsDQZ/8AEOlvGU1Azn6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734978; c=relaxed/simple;
	bh=6U37pSBUsFqGwWSczzhAZcH+3PB93yJspCigulFbK00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVw8QGLFiiJG06n5DoruksuRpXECZATXQN1XJn2SwHhVv1jxRX56WeNLKzWeyiktR9p5EnJw5XFQxdJa6jOvJHJnIPxtkg1ix/LjlrdaA+cEFxa0NSTGVoRyBhI3yEMIt3sfFGuhfhVEHMyOP8SMQsLD2HZ/j0K6y4s2pgQLCTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcBOC628; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcBOC628"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso11935439f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784734974; x=1785339774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtaD+wctm/flHKZdG+eEG/nGmQRGwK75GvDz6KLeZjc=;
        b=NcBOC628BWqTqgoJCxGhlL3H6LU2tP+k8tuzAlnWNwhQIU9J8SEcWsKp/vsZsYipV9
         EHHplUH81vl2ESB11Qr9G6RO+KhNBcPc8ol0sCXcRHI1DBHDOxfFfmQt0O7ykNy8e1X9
         +sZ0Nk1z1bWkUSBMCu/tCD/y50i3GM4D9AAZf4gmnF6tD8Ma+voWSYXYbmsrg4S7MF7R
         PVPT7kE45frjxoqgArOrtYz7ea9UDQTp+NxEithwK982GQVsnDFJlK44i5b0UsXLvCd0
         QG6T7fdkZGQnVio0aYPMZSqFzfC5EZvJhYXs1H8LZ5+Jv6whSD605Nk46QJl4Eosxy2J
         JWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734974; x=1785339774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtaD+wctm/flHKZdG+eEG/nGmQRGwK75GvDz6KLeZjc=;
        b=s6zq8HRR7udUSwPVXHqEtLdzXy8R87k4RSIKV7bUOzZKIxkNtRvH1tpb4hBovk2X28
         ta/TVnGGMKrASIU6Iehjxhu0XWcS0Ko1/cPYtc8XOeHs6tWXvIrbX9nhCgQCXn1IFAeE
         P5mcds9VU/THEbu7FcSgh0yZtq4xLYXAD/C/JXJ7KUlxHWXELCE/2mUGRTc2/WhfmWdn
         XnyXoj2ne2cC+tZIIxgrlGPTHKNnlLBpEEXoSYnG05y9C4UDeab4EwdGkni1Hq6Fh/DU
         lTUFi304JqbrFFP/FX0efpIbLeXbh5WgKGMBZCo/wbVPE0K0AVDCz8uV3+yfWiOfFF8Y
         R5aw==
X-Forwarded-Encrypted: i=1; AHgh+RpmTKjUUwnR0Gp+f4mwff2mEzJpBzdyzTUiv89/vgnoTiWpcATuZCCZSPb+XjAGi4lG89vphGdJGtuxXHxC@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl32UhmJjZegpfuWtIRmsLi/x8lysfszZSO1hYEw/YVBE0cQJE
	tIdWgQAISaQPF18beQwyIdIh3l2ui70vEs5Yv4PSKwjyLbzhBnceaZfi
X-Gm-Gg: AR+sD10VMi51zLo8vNNO2fiXhcvSKHeiIO4Y6+CH/JqPHDY0A6LDTXSwlObSE3JwqaJ
	XLYdr7up7FBkIxdbn9KT0r3fFrQu3lM+jHBua8lg2EtfGyiMNUWITqePC6I6ci32zxDEq4gD4j6
	PswNWUck/FObdg+RRDENWBLu25pw3Zm38D/mcrjYdybBqd5cYdxdcNzv4bmToBUkiKU6JMSZVl+
	nntcn0gobm89MGduWhFLTdIszl+JXWc6yDugI8Q1bKRV9cHiyTpyXCyxhTRmhqtWP0ufrgFR1ux
	APVxn2KfuZWJgUhXebMXD0kTeuQXKH1Yn4XKhVFUBrrLATelp68a6UJqj367cq/gZpo+0Cm7SA4
	z8vlHilDCed6yH+OPaBbKmDS1AAHFDONT+zm2/LamaXTCuiTeCbwOe68bIG7SESm6TfU7z9ZcNf
	madMM=
X-Received: by 2002:a05:6000:41eb:b0:475:c946:36c5 with SMTP id ffacd0b85a97d-47f622fce56mr30653466f8f.9.1784734973852;
        Wed, 22 Jul 2026 08:42:53 -0700 (PDT)
Received: from ubuntu ([103.196.162.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm6889489f8f.18.2026.07.22.08.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:42:53 -0700 (PDT)
From: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: [PATCH] media: tegra-video: Use BIT macro in tegra20.c
Date: Wed, 22 Jul 2026 20:40:55 +0500
Message-ID: <20260722154055.385164-1-mukhtarfaisal03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings by replacing explicit
bit shift (1 << n) with the BIT macro, to better
adhere to the kernel coding style.

Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..cdfd9f276d11 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,15 +177,15 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
+#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
 #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
 #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
 #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
-#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
 #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
 #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
 #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
-- 
2.53.0

