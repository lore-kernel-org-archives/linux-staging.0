Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B237F331A53
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607771; cv=none; b=jk4P8XDjW0oRzKUUioVNxOYw2zf1jY9jEOoaFiFamVFn1cUtr9W6gy/fmP23djXLh9AG5ywLZkwUtJ9Wp0rx0AGvIVf5TGt6yrxuQ/ddkF1L+XNM4KyrLliKz2vMUJzRPl7s+QsIadRKYGZD0aNccwfdQL9IckTgHnRbmCDlz14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607771; c=relaxed/simple;
	bh=VK4j+xu08h1wN3/o+FlfHYnuyc2SkPv12s7ZOs9MMjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXpKV77AaJE9PXd3Me+QlSDirTIgmk0ttGk/il/IY2zysU5tBjbDBxBifrzbAugtL+eOdYTcnEFvtIHfsi9sZqoxmUgMzuppDEoqr1QTz3xpCTWGw1ExAtB0v0Hxqp214PsMnQr55NkSVIRYW7l+YFkBiif0q6otSo7OwyEvQzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnniollx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnniollx"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc73e322dbso5506365ad.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786607769; x=1787212569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YI19pGDcKtgcxpd8zZLgfvky7dUvBcCdOVpIkb/C0Ow=;
        b=dnniollxlbhjUtbUPq0emAQhepV5cHvbwWOmrfEdrLYaczQpM14V2Rsa5QQb5Rsndp
         2v78yYP3OL4RVR0bh6fSbZYV18DshT7bOViqTCH2JvYOpqgoUpsg+Oc+GNx50yI5w1YW
         mmzpSoQ755wwCIE5Kg1ScUvd/U1PdFeneyjjv+xFz+Q1zNfdYnRr8TJSFuUNRvASEosW
         2mzJj5wfJVoGHVN8UbW+iJNTKUJshfwQHBko1ISZcrBlIHLVHP388wEu9bXl39lzlgas
         5qdfX+F9y7qEePmCzS40qK3yPEZEncZfLRp8vax9dX+1fcUmK4Ek1HGMSDhohuiMFAmW
         OBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607769; x=1787212569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YI19pGDcKtgcxpd8zZLgfvky7dUvBcCdOVpIkb/C0Ow=;
        b=U+4dpwQae4474xYG8bdfd/tUMsT3MfGI4CGfmTpecGmM76Ou/GpXG1lMt/XYzPlavN
         PP3ReM+Cl/0hbjrJJGQ1+menXHlKHxb0QKpBFf6h2rMjMETsxG4kG+1O4gq+l8GfWHhL
         5ZBYEnCyKpQoeL18cfmpzHpVzz4S5hJudmzjxyJZzMvrrjrQ32izPbZdfg5y/svVddwA
         zOW043u2rTKP36WXzCK4UINX539BXQJpdCi4w1lPx9vYkWdbXhEU5pML+7Jd+G1fDgsy
         I7ddk2vUN09d/tsv/Dt082UxObRtloEo5M0jldrtMdAHvcM8b8HVlkR52aXBug9NoXks
         IzZg==
X-Forwarded-Encrypted: i=1; AHgh+RoonN4cUxlEe6dpN1+HbHSaMvMyUPQhSqPyanZDoFweIGrQ6qJa2HYUjzUTkHYrYv9rGIcg8gbkanCOTo3b@lists.linux.dev
X-Gm-Message-State: AOJu0YzokMRL+wnqxSSiTMxkq9SQuGObTSs4MS9p7qpu2/01v1Zmgidp
	8+YBzTOYpJQFMWqjngqT4GuW1jZwO67eTLXC450uENEA9qSMVbL5EpQu
X-Gm-Gg: AR+sD13RzibDGKRNh2RVHrmCjfGLwu3CbTXO3+Uk9S8AeNemr99Zb8qeP2GbpPyLAu3
	MIXwuY54/t6yehVkX8pCMbv4W7o5pjDPbqfo327sGOF9TR0bb4LfqTAcYekoZLZa5re2SUL33OJ
	AIznFtubjAq4+ThF3NpOUQ4LgkbLRY4cEmGeTxDErp15AXnNgKRj19hav6pSbNSozFPU6OU7o3U
	1AZhK8cGntgFG4ihr+Stge54lR9L9yl6kG9O5Nvjjiv0YGBXmK2nW24zIfAeZpBaHrQzz38hTK/
	ud6E/vD1zVivz6jbIlSQ5OcK0Yo3MKwJZEBvcz1HXOSLDIeT9WXsLCt0Ty+pI41+jnQKtpIxnNT
	IdGE0N+GX2FKvH+5kbntmt12svwuJnov0ix1mtaDLPNOVi05rNb/NvO1+dn3TNlEArDmMxkOunL
	59FtsW1+6XruxEmeFLNji6PF5DY28puCODC69BRYHTr6Nks9Wa2A+OYYaqMCizeA0JLVz3K/tnq
	/9CvtRoE570wcBd03jyPvH0pkujWtf+bGP7vbWb184e+w==
X-Received: by 2002:a05:6a21:3397:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cc5533a206mr5508818637.25.1786607768959;
        Thu, 13 Aug 2026 00:56:08 -0700 (PDT)
Received: from ubuntu-vm.. (c-73-189-122-63.hsd1.ca.comcast.net. [73.189.122.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d961e39sm9545397c88.11.2026.08.13.00.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:56:08 -0700 (PDT)
From: Rishab Madhugiri <rishab.madhugiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishab Madhugiri <rishab.madhugiri@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Use ARRAY_SIZE macro
Date: Thu, 13 Aug 2026 07:55:29 +0000
Message-ID: <20260813075529.153217-1-rishab.madhugiri@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <an1vaFk4UrhQPkSu@stanley.mountain>
References: <an1vaFk4UrhQPkSu@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up loop bound calculation by replacing sizeof(bds_factors) /
sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
to improve readability and maintainability.

v2: Move loop increment to the same line as the for statement as requested.

Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637e..e8734ca1a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2160,8 +2160,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	bayer_ds_out_res->width = effective_res->width;
 	bayer_ds_out_res->height = effective_res->height;
 
-	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
-	     i++) {
+	for (i = 0; i < ARRAY_SIZE(bds_factors); i++) {
 		if (effective_res->width >= out_width *
 		    bds_factors[i].numerator / bds_factors[i].denominator &&
 		    effective_res->height >= out_height *
-- 
2.43.0

