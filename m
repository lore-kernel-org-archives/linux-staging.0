Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E64B35838A
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613776; cv=none; b=qlpiJEX06HU3XgSo/KR9ln/10LEkqIKzeCbK7FolQprxp4irqGnFCLK91WeGYwRb7EqtHziEWRS4Y0jYcsXGRMFjyLzVeDq0VYSEE2YHSu7KlzPR1oMLOJioWpXEJp50p/Lz5tMUYCk+PCth21vCPu+rm0u713g4j6IaF/hxNt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613776; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FigqNdIBBbXKgWykQzt8Wq3pJbiP7ARVhUObUakjZrhV0J4CNbyIJ0EPVuZUQlhvIsf36Bwcb/BxB3EqCmzH0bJ4tiFWPfyFAXCvWpPAnggNyKzidR/pBMSsGnAhocikmIpdj8K6GaeKgzU3mCRUOZY26uLcqQUXUnTbOLxwBjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9mNZVxv; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9mNZVxv"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97ea7f0d417so586550241.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613773; x=1789218573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=p9mNZVxvx8EfcZ2vHYi6JfTz964bFSWPdcwjPlnF5L/h8rRItYaEooINDRmYthLkIy
         DytyQU8mVmUUwckfKr7BQ2cMhkcYPAuySRSQUqMw3AuKjbJrjXoOinxN1MP+FXP/rgRS
         2z9RoCfLBuLku1uQQtTYn619yTJTExqAnH6FFsKSek97vi9KmuZE0uNia21V2aN2e9jt
         CRDP36+s8e60XI6kIGh1j6Lq2yv2JWLHWqugFv+5nmh4UdTtUtDSa6yM7I7PNptAV8mp
         jIsFvsNb/kkT50G9MjPYRQ5tAwNz9DZVz0srP3tRl0ep9ThBKXp0ekzQx9UBr5VWEz7Q
         ymVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613773; x=1789218573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=P32p+Yumls20eCtl+WyXa2TWmMpK6ib1L715lsCrscWAJ29UBYVsrpSLcLScR+eRpX
         qXZQmHfdUNyjpHrTkjn/CZcXQ0r0c+a1JwH5cbyRdOQsTk3hSk9CAVAUAOwvu0vwsHf4
         PB1skhMPn5I/6k2ZUKtxslFZQ92b1dxEb88Yc/hVG8sdAOLYmHVNOeo3PIOTwlzHUMOZ
         DFj4X91HD0ZPHsU63H9ul75SS3k+ncGA9enuvPW3RyHF/d6jgaoErHiTqIa5Jv3TSPL3
         DgyvpeApy/YyIu6gNaDBPcyqaAbbflCUQk436ZzFmwggbrdHcxj3PAQb9Z/UIx7y5kbu
         6hlA==
X-Forwarded-Encrypted: i=1; AKwUvByEB/r6B+ol2yHVkd0o2RF9txRfTca2SlAXfzAVQQg/eQ2ZlRt5fiETtovxzSqS3tp/hPYWVmUNSzuoU6Uz@lists.linux.dev
X-Gm-Message-State: AFuF++lxY5aIjpYl+SaenNwgU+C+/y05Ubraq0uS1m/CzjN3gfY0+lov
	xb7zUo9xusFDPFCVWQtRVQyGRywtsjI5XVahe2fKFmhTcHJLtcOfNkqW
X-Gm-Gg: AYBFou0mm5pujx2bKFYBG0ceNc/hUtF4h19GQVFahu0EejndY6xk8bh2rdzfyf1C2zt
	9v6WP9JCPOgCPJjKuVwewrM0wvnBXjy5YFeVifaeWT0gwyQbz0jKp7g0WUp1/M3KhxUEA9W2RGo
	jtTZLD9qh1dDz2BsmEmImlM8QrBF4tVdtm/R+yY6vCuC4Dh+2s94z1Rl0ewk8MSDhb/NS/u4MsS
	SgWMXGbu9hQ0TE6flg/eN7oq1Bf5lQd3cPw6kntK7wwIgYZwCzRNH4AyjsOdAqPH0pIaX2GQ21B
	yFCFfQmKb5JXrnCM3Sq/AaZxRAM5trjj/daZpIZyZa8XsHZT1RfEDbFBL0lCyvojKs4zujcA7tW
	uKSme1UHvpQzHwdxl/W8rrcfUBs1Ih98SdV3o2tDGXA+dFwN6wLBBVa51RuWjyX9M4zsgEne9GZ
	cwnq4TQM8aZLsY+yuCq2Hw02HJwGC+DjPtpsL+D1Owd4LWKT9VXMFHF71Oh22UVeCaQmzXSY/Bs
	AoRzO6uoPNOK3xbAc//jhtH6FgfOYmR5Shv0UdEnAM=
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id ada2fe7eead31-78a4a880ccdmr3889707137.10.1788613773006;
        Sat, 05 Sep 2026 06:09:33 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm3719782137.5.2026.09.05.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:09:32 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v9 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 10:09:23 -0300
Message-ID: <20260905130925.7115-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

