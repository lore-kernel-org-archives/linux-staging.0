Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96F2344D8B
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705036; cv=none; b=U5IM6UC2CdpaC4zU8icC77cHgi892bI6lnv/Zrcdq5pKUm/jQx/gse7B4PYP5LJtcUb9PSz8AVOiGn21FhlPai4KYRIU4pflYd8za3zowmivaEQO1A5ZLC4cNMSTzceLwHLqeXVGNuabkq9Z5/qBs7x8pfLLPqwsiYpXeQM1iso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705036; c=relaxed/simple;
	bh=xIYiZzBxSwMEIJ4C0RtoZaDxiJPYbMUccG9vgJreaXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GeQsUJzqgBGJu/tzZ4ghdcGTv6ob1QSCUU1D4DjmggcdkTyXEgci68KflkozM3nCTxYItaCmoNJgt+2T2x/tEqfdi86ejujyDknYUMFD8ipAnYye9MqeSQkWDVR81wa9IwD2xtvX/hP7LrmEcjhaPYAKxxQAtkoY3ckRFrc4DGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTiVFyxh; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTiVFyxh"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so9304905e9.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769705033; x=1770309833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhyBy0UGiy712lAFCHNNTHqAhsRO5EoRden9HyKwIMM=;
        b=GTiVFyxhqFp1y1KC1sx5+Y0dZYQDmdhD2X0mm8Wn2JjfyIqyDC1h+u07j5ppxJy4cn
         O2qDj1X06W+FrdZa0eM7p9oX0mo03r03XdrdW8g/44IHu+VuSEB6ayPi5MKYeqDM1uMR
         9g7SHxPNOsQmhyTiI07oVD65tQ58E+lyrTDIbo7e73KEwwjw//QI9Gq217DN85MBz77T
         1pmLstv4OYYcXtiABion9CEOQenT65rvyFFbGFaJQX2u9f+2wwOI4iE6DJyn7UufBU0+
         OLN01fPWrKeKa6nKDfTfUPwpRux1IEvp+n7pRJ9Owd6N9Bufwc/0cwWNbyQurxCgkkSD
         87Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769705033; x=1770309833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhyBy0UGiy712lAFCHNNTHqAhsRO5EoRden9HyKwIMM=;
        b=KrSFNYQKKO/cSiHO57q0s8+wwHJhwaHsmL+xG6+wxuIOX4tZfyRw56gw7K6/bWGvvR
         P4+zCblNz+7VXUkBOauW+BCCMZ7eAU4g1gDUn3BjZItVieKrOLACo6tSzeHc0bxAR++x
         smoPLyX3mBduDEUzNsZGzIWHOcfws7WwHbHfhbmkQtw/gIcUMdFt2KUcBE9YtsAwN9ml
         lGyd+KfvWsWNGO5+28TEpiTetfic4p/4rAqTODsydndVdoRVpCPhlXUAzAXryW0uepqo
         3RidWlpPF0aK5ng99RB6Ln6Ouzd3hsn2Fnm9KzhxIdPtxzpmVDhX5ttTLxTpYz5fQL1I
         9rpQ==
X-Gm-Message-State: AOJu0Yy3gJ9QwhMshyzogRnJBoNLS70miE8D8id0N7KR5ijy8wbYjTii
	v+975bQp2VTTmjySoHCuJFKKpcz8SVuCj9CLCy9tHd84XzPG45PneaLXN1QWpwoi
X-Gm-Gg: AZuq6aIfENAqujHL2XAE7fbTjCB84FYVJrQ+8fXBlLHxuJ40r7UX0nSwBJyZhq2zqK0
	QbVryf/2FOB0epH5hp0gqdMqe0+5zJ6QALkeR+fE+/1wfSfOtS69B0DIUWXqBeNlsWQx6dk/10r
	bwKLvI5f6sMKCpiSWtQmB/HmZjO3t3Usfx4QOMTvyFHf7jN3MU/npMj0XkuVetN7Q63LEOd3Wou
	7yJw4eMeVVq/cEi409EhYxcnkJ8G7c/4f2C87KRRCMfizqxK1ixXGtOV4+62Hu8dIRW0Ze7IA+f
	NbXh9UciMw1JRW5anNAnsf6hNhvl36vw7oXoR0XNHPdoQE/nmxJpll/BUsbhIzidMgOLu7o5URk
	0C9CX6wU4oi8xGnpem12POnlGoXyVOfU/oe7QmuhHJeUCOwqfbbST1H/9Kwmixf00NCKRVnVVaQ
	==
X-Received: by 2002:a05:600c:4f4f:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4806c7cc86dmr126373465e9.16.1769705032532;
        Thu, 29 Jan 2026 08:43:52 -0800 (PST)
Received: from desktop ([149.88.24.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56068sm132122215e9.13.2026.01.29.08.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:43:52 -0800 (PST)
From: Andrew Geyko <ageyko0@gmail.com>
To: linux-staging@lists.linux.dev
Cc: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Andrew Geyko <ageyko0@gmail.com>
Subject: [PATCH] cedrus: Convert bitfield macros to FIELD_PREP for clarity
Date: Thu, 29 Jan 2026 17:43:41 +0100
Message-ID: <20260129164341.104155-1-ageyko0@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use FIELD_PREP macros for VE_DEC_H265_TRIGGER and scaling list registers
to improve readability and maintain kernel style for bitfields.

Signed-off-by: Andrew Geyko <ageyko0@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 28 ++++++++++---------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc54..e8449859d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -344,8 +344,8 @@
 
 #define VE_DEC_H265_SCALING_LIST_CTRL0_FLAG_ENABLED			BIT(31)
 
-#define VE_DEC_H265_SCALING_LIST_CTRL0_SRAM	(0 << 30)
-#define VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT	(1 << 30)
+#define VE_DEC_H265_SCALING_LIST_CTRL0_SRAM	FIELD_PREP(BIT(30), 0)
+#define VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT	FIELD_PREP(BIT(30), 1)
 
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO0		(VE_ENGINE_DEC_H265 + 0x20)
 
@@ -424,17 +424,19 @@
 #define VE_DEC_H265_TRIGGER			(VE_ENGINE_DEC_H265 + 0x34)
 
 #define VE_DEC_H265_TRIGGER_TYPE_N_BITS(x)	(((x) & 0x3f) << 8)
-#define VE_DEC_H265_TRIGGER_STCD_VC1		(0x02 << 4)
-#define VE_DEC_H265_TRIGGER_STCD_AVS		(0x01 << 4)
-#define VE_DEC_H265_TRIGGER_STCD_HEVC		(0x00 << 4)
-#define VE_DEC_H265_TRIGGER_DEC_SLICE		(0x08 << 0)
-#define VE_DEC_H265_TRIGGER_INIT_SWDEC		(0x07 << 0)
-#define VE_DEC_H265_TRIGGER_BYTE_ALIGN		(0x06 << 0)
-#define VE_DEC_H265_TRIGGER_GET_VLCUE		(0x05 << 0)
-#define VE_DEC_H265_TRIGGER_GET_VLCSE		(0x04 << 0)
-#define VE_DEC_H265_TRIGGER_FLUSH_BITS		(0x03 << 0)
-#define VE_DEC_H265_TRIGGER_GET_BITS		(0x02 << 0)
-#define VE_DEC_H265_TRIGGER_SHOW_BITS		(0x01 << 0)
+#define VE_DEC_H265_TRIGGER_STCD_MASK  GENMASK(5, 4)
+#define VE_DEC_H265_TRIGGER_CMD_MASK   GENMASK(3, 0)
+#define VE_DEC_H265_TRIGGER_STCD_HEVC  FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x0)
+#define VE_DEC_H265_TRIGGER_STCD_AVS   FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x1)
+#define VE_DEC_H265_TRIGGER_STCD_VC1   FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x2)
+#define VE_DEC_H265_TRIGGER_SHOW_BITS  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x1)
+#define VE_DEC_H265_TRIGGER_GET_BITS   FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x2)
+#define VE_DEC_H265_TRIGGER_FLUSH_BITS FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x3)
+#define VE_DEC_H265_TRIGGER_GET_VLCSE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x4)
+#define VE_DEC_H265_TRIGGER_GET_VLCUE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x5)
+#define VE_DEC_H265_TRIGGER_BYTE_ALIGN FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x6)
+#define VE_DEC_H265_TRIGGER_INIT_SWDEC FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x7)
+#define VE_DEC_H265_TRIGGER_DEC_SLICE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x8)
 
 #define VE_DEC_H265_STATUS			(VE_ENGINE_DEC_H265 + 0x38)
 
-- 
2.52.0

