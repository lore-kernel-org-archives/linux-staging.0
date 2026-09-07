Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B63382F35
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802401; cv=none; b=d4RkuwplaVphkRlURllH06+u7rbvDXv0BRAJqt2QkcZAHYNfwc21B2M+E7ANkAc9eFugxtkWDTKMwqtvVPou9Tkmm6ZEiiyLcdqtFXCNc0/+dXgEIxwBFYWfyeP2bSQAqehnask3rDTizjrdobJ7/OFbeSH7cb+jFVf9BOXT6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802401; c=relaxed/simple;
	bh=WBdR+Pa9MECsVH2zWYA4pufWwidowE/sGBM4Qspyv6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4+83JmZDM2MYhmTu9n4gKyFEb8PaLaKopz3ftea+Mpvl5EXkFf39CmenL6NqMGQqBqhHiCJXfJ+Eu7Z7drOUSgIvuO1k0l9kz64gUYNEmlc9Lv2Tur+YHV3cvaFsJo5ekxXFb0rtgWk95YxffOCnC+X+qj9W9lROjmZTu0J6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLjiyjfc; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLjiyjfc"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1978360a12.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788802399; x=1789407199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHpQ550r1xJVd5hJxlbP/ggPyAbrP04jIcC0YlMdAkE=;
        b=LLjiyjfcq/MWb6J2XC6M/CtJ5VVDEUH4TXDnbkYhGeihOrbvl7+NfE1uvPn1HMsniA
         /OoGkz/la9SbrtEd1bvSfXX3iLNlCuiuwxZvps9037FMHWzDazfL0mkcwu0q/SxRTg7n
         lQlF6XuVo7Ihxnh1Aq2Kj1+2XsbHLhW9OE5RyWJNcxC3aNYOCYqNcqWRCV1wHCEAKMiB
         Ed71otGGVTZbUcLqeSUTsflmiMn3lv2AI024Dx9PMAPClLRBcpDkksnvssy5z0/KVDIC
         d55KEMc8KR9HuiRvqqFoTXaZTzyhxVJDosw7ePX2ILr9BM4Rw08h0EC1Zp1jzH1+dP39
         2+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788802399; x=1789407199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHpQ550r1xJVd5hJxlbP/ggPyAbrP04jIcC0YlMdAkE=;
        b=OFdr6BGq47O4df+/Jsf8yMiYuCX1f9sy0Ra2yuEZG5V9+Ox+Au1ItcUYh9oSYQnGPW
         vlidzWJyzVUq2S0jwpwwRXgshQ+ppzjZc54e8cA6LvI+L0LfKI8NKrmx/Uv/fslTWVwV
         6ab4gStsYWUZPZfXkRdfSk+BblZb9bDUUS7Tqc1wbVHDxAYaSt+4tf0OI9YfnOS9ktUZ
         bYCD0SbtgyGtlBZFvpV1uYSAf4XMJDkBErS7iZRsCeNOvjauVHV9uppPEtXqyAEnVuMK
         61vRQoUldsIeQ9FKm/RUcxjmZTH/JIiTOaLnzJ2yKyfpWtJvO4qKo1Xvn6Lnylv0xvZo
         9bDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcD5+SnxTZxUaN8UixgujNdx+qIm/iLVklri7PxBSILz6Rrmzmjy4OYKcosglNSkWsHKI7Y2Fl954OauhG@lists.linux.dev
X-Gm-Message-State: AFuF++lcY9flP2VZBACrvOnCLVytZpEaNAnLIXCtvk3WvLWfx36FIVd0
	fOf6agHUAoOMc0I4KuWwitChsfJv7u7ttpndSESEkqko/ZDrdm83xxZY
X-Gm-Gg: AYBFou1D2PXLB+viTYqUt2M8YU9dxFuWYNiS/xn5vr8fgFzbc+BrEBxKf9zXDhIxs7/
	mPOBTMZ6gwM4ZKdrirkUt6vjtIlhCgA21PXKOZ+6Jkyb+Hop2elDZI2va21Gfs/MOg2042Zw4OQ
	OF365fvGaTYE+Syj8fqpO1ChTbwYedzR83eKKAVkUd1HY3OFawWVcq5dt2YJzTtLFDCCRvuv073
	/jgsbXiR/fcLi6qsZ3S0J6IA8191xmRfXSzZUUx37jHLvI+P7kqKh6U39q76Xiyg8TM9yYJitTH
	PTRb/+8HKgoTGsyBjLKB39JDDprIuydbvvU3jZQxamjXcePAWVLKefoFR9s1gvC5A+JvhTYqJcb
	u6XQ4VhcEqJpSqdZJVNFL6mJsE1mP9Jz2/HSNEGvUOLVrzS3LrRNdtM+ebQOfhFnbHv2b85OkSf
	JvlbMP4GwAHdkIDEH8JtCsQAmPypb4yfVmi0pYl8qeJm2EpY6bu7gfy0ZrWcNzi4ZZ
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39b25f78ab8mr34395694a91.0.1788802399187;
        Mon, 07 Sep 2026 10:33:19 -0700 (PDT)
Received: from G15-5520 ([103.246.195.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm33581587c88.15.2026.09.07.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:33:18 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org (open list:TEGRA VIDEO DRIVER),
	linux-tegra@vger.kernel.org (open list:TEGRA VIDEO DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] staging: media: tegra-video: use BIT() macro instead of bitwise shift
Date: Mon,  7 Sep 2026 17:33:02 +0000
Message-ID: <20260907173302.23053-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining instances of (1 << X) with BIT(X) to follow the
kernel coding style guidelines.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index eb1fc5b7e2cd..2586a137d9da 100644
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
@@ -214,7 +214,7 @@ enum tegra_vi_out {
 #define       CSI_A_PHY_CIL_DISABLE			0x2
 #define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
 #define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
-#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
+#define       CSI_B_PHY_CIL_ENABLE			BIT(16)
 #define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
 #define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
 #define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
-- 
2.53.0

