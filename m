Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896972FE078
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775941896; cv=none; b=CA+uPcev2Kg/IvOrHu2bAQYAl/+2DDT2lORlzgn1GFVGd8KTYD0eZ4d9L8zRSYcaWREXzcqgcRPdS4Mex/1M+fulF+C3M2W4aEumxjdsmGQLSlQrtAHA9CQa1wzoroot5eDlXmoH9EosdLsZ5iFsJm4eIlDbm9/Y4ExAeAeWCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775941896; c=relaxed/simple;
	bh=nhMSujJJRVBmSCprErQbzFzUxp1Z3dBMo2c0e3hpQHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdHywH5+4sD9QryaHqPz0l+chFrt5m6ezfww+TStrsEvFyLCNAmrQ+PQd0nC1IWNnDB+DqKUK0Vc99havU0hlVSh2LMgtqhn9RaIiT+Suzl4bt8jvMXx1RNiqSeNkKBummfN25sNqv9xxvwmCZReCbb1wZavZIoPTKbzSC3FLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCrqMIMC; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCrqMIMC"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6711d701d9bso491974a12.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775941894; x=1776546694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwSw6IsbUHDab63/LFAeDKthmZW0BMxAR2iJQycE4LQ=;
        b=CCrqMIMCAtD8wbXm6CI7yKPZLYGLuIakKNzv82I3ZWGEFa6CgmSz/Yy8hvZ0whB8LO
         O3sd0g41AoI0MdtqFzgcdTitJtXciIXOTh85FXoNi85/00OsZanJG9kiAlrWgvQ8O/Yk
         gdK49kJVNnU01OuuOPfhpUt1bSdcj2yq+HoloQgnEL3DeturAhnr6gDE9+ksW8wc2i1R
         iSntBFHqL206coNvWy9DKGA2YzWR+EMh0JzUmEkvu72UmP1EgfLunT5XqP0RuT1lhZJc
         hXFlSFVIbIuOaf0aduJrJfjMjmcpx4zgWf/bvJ/uaLOVwRZzlb5FSze/wBsDIM597iFk
         yiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775941894; x=1776546694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jwSw6IsbUHDab63/LFAeDKthmZW0BMxAR2iJQycE4LQ=;
        b=CzR/TAInLuk9YJD2pbxz0jMTgnEB/gm8v/9j2hMvcJ2737CjvbXZ39JO8nbj5IEYu6
         WdLXz1SALLRgRnQgBW4gXsU66hJpVV4wAuPwqTFScMmsSpNpD3yjoiWZpzBAINJzvg6Y
         Dsi+Fb5MMq2MXCWRfZsIUNUWVqZQLEo7hHp8fcLw9xU7t3/ggr17O8n/48fQqZFw1Zae
         DZadSRnGixhIHIoGm7ufFD9Y45H1bx7gv3Iuwl+5i33GO2BdZNZqEe0WulCV3YhnmkE5
         N6B7OZ06XYcAJjraYaQaYlsBElHmNYhD8BKg2LpvBrgMGErLjQ4HBXWfLo8go+SCmE/t
         QLWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSKLhwEtwOrkNDUwII7JYKBmAUhlu/sFjuvMdtxqWl9NjeG2ipoYEHdBA9xtH9LdI0AgWPNBVF7F/sPaDQ@lists.linux.dev
X-Gm-Message-State: AOJu0YysQA1Q5JiYVS2h410tyw5+vZ9kRufERB2bgfuCL73issk7jRIO
	uPKkGukzIOWQwl6U1j6Zo/H5tIj3BvNWsQI/YqRdAu25DNrxqYrKHYcY
X-Gm-Gg: AeBDiesJLAF7Pdibx9uqe7b3aOKjMeCNqr6zFCTnEaSUpXUq3eouT7bcxJPqoCIWoq1
	iEqONnUqaaxppvHC/NAPM5n/CGWClYd6NodezNXCBd7STwsc7QCdj8YI/4RdiMK8tcXTWBa/TFc
	ixe19EaLXDm0LFQvUTS3AcDXZeUZHyLBNnpQijwe7fq36BYUYZti9IQvvT0G2ZGfrb60G85vpA9
	rxyb3shgb5KCGki1tPg0eG8Zp8EJflUntlALAFErLXYN5dlLn0tZQl7OXTZ2+O1l4iwYuFQPNuk
	mJdQKs62INbtIZCBvpRvxGFoOe9jzKtLgjh8rn55Nz4sl8VxoAJ4ar9o4sljjMWrw272XD7fkQ4
	pCdepZZ7u4SjD8YSrEZhK9dEBGRcfLZeq2AjG72bHvlpKLIPi3+50ll0yG9HuWP9W1/5Uk7ye/H
	255bEODJobxjHOfQGV74GYgpRLDGM/5i9PhFV6bdMDcJ/coWgk+fbsKtlH1POiotwdzpAGRlXFu
	eKD1d0JOf1WJbcKF52pL+WaDSeWtP7LeqbzZfAfaHjU6Vc0V4I3WQB3unC/kW9cORFLAkUul0bK
	Tqw0GA==
X-Received: by 2002:a05:6402:1f4d:b0:670:a401:c977 with SMTP id 4fb4d7f45d1cf-670a401d3fdmr3133815a12.25.1775941893972;
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec8asm1511110a12.2.2026.04.11.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/2] staging: media: tegra-video: add missing error checks in vi_tpg_fmts_bitmap_init()
Date: Sat, 11 Apr 2026 23:10:05 +0200
Message-ID: <20260411211006.150782-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411211006.150782-1-hossu.alexandru@gmail.com>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_idx_by_code() returns -1 when the requested format is
not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
check this return value before passing it to bitmap_set(). A negative
index converted to unsigned would result in an out-of-bounds memory
access, corrupting adjacent kernel memory.

Add WARN_ON() guards so that any future SoC addition or Kconfig change
that exposes this path fails loudly rather than silently corrupting memory.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index afc7327ef318..e6416ea8503e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1025,11 +1025,15 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
+	if (WARN_ON(index < 0))
+		return;
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
+	if (WARN_ON(index < 0))
+		return;
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
-- 
2.53.0

