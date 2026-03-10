Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E7A372B5E
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150435; cv=none; b=s5I7sqZUUgKUiaSiHBZZvGbSxF9luIXtlDSOL/CoBTrdLLrp7vSxge4utruImoj6m2NSZBnPwiRlXQBX90xHu23EEsH0DyzWDPqEbL9OHSzrSkLYaqKrYpkzku1X89Ncs+K7aBJAg5CcNSnGLThm3ML8jHKB0tIl2QvjcD8VEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150435; c=relaxed/simple;
	bh=mobH1Ec+j8kcge0oEKWxjEV9wiUStAx5b0yDsmpmIBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WxVwOhP1dDxixbVdTkOpechN77LsveJvo8CStEcoV3eJy2OEOFTjpm8Ea8pVFuPyhGraS9hisgL0GWvYDdPImzaJrFJOf1ty88kRMGuLVIivkAEr5UHevBtRDywzKNx/NNzBTf1Xt1p5xJ01BpUmSOh7FGblSfszMcHOfoLlKAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM/Q0kSH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM/Q0kSH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853589700fso2290935e9.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773150433; x=1773755233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XZEm2ZzscHKXGVHpZbGuj6qrGMIVJOVEiJ4FPiCd66c=;
        b=EM/Q0kSHFB7hjIbw7lTrIB1s2McAFFO8NCikglE4I46Bw/6CVb1j62iH1lgN1NsVy1
         GQmQwdGZ1nXPJt8Uerro/tpwkZ4Bjc7LxDKB8ED3QceonFY+bbJ0rfsSNhVeSzfBxcDJ
         pUXw8wO2q/UCRyR52m20kIqkW6it85XxwpwXd66JhSAOJNTxtf1BX90yn2Td22uN5cVZ
         fxYQrF9XykjPzY/k6/SkBtHE35MN5+Bmr0W5wZAJJV5rK6MzDLmfSjsbFRwVg9r56Ruz
         JbFt5bmc7FnMh/gJDKS+ixZTdbd5mEh2OUX2PZwAr/2LzTf97si9+CNQZiCeaLVu8Ij1
         lZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150433; x=1773755233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZEm2ZzscHKXGVHpZbGuj6qrGMIVJOVEiJ4FPiCd66c=;
        b=U3rOVw5NHW8a0okQxXIq4sandvh2XftGk0o39VTYTe4nEzY5n29L7V4PTN/U/uzUYk
         8ZxBn9u8zleKYwKAmFGcZjeMHLrI7cbO/FXsC2LcRMMzF0/hDJgA/2sJEnrI7VQXL4DX
         KLbybe9aIkae2NzEboHkLEBxpMhxq7xGV09EQGkJjlNV8YQPgjat+tt3ssdf5kgB13/b
         cRk+31eKA/LfZz2ZFNUqavYktyCrQszM1tIzk6R5Us5jNeCfyEH4lrgWsZvCHAGy/YTr
         1s/IzIyAlLgylebPMaYeISLKheUHf3LUHMlDGO9MOHK/9sh0h4j2P+2v/UUzio05tEec
         YIBg==
X-Gm-Message-State: AOJu0YzU9rBD2vT+E9GBAENtvLEbowKtIHT53T1jJpaXTHl9hXY6fLih
	sjfA0ZDCfw5xja3Q4PLKV5MrxO219vGOMK5qpJerIDC5HdwbcA2kKP1I
X-Gm-Gg: ATEYQzwvyqIFqTCYc3bcjB2lkHznWkTo8Bq95JTXD4qJ3LL3a8nrqcAwb3cjnC6Emvn
	mOI4M+qq6E+VS14m02MohMsGJ2J2P0CmXvouHMPVvDqoVt6RPL3jasE6620Gjuso9etaDGZvcT1
	ocMWdMZF466YmUKRqt3sh12ElUJnuSCC/FZVrkfb4IhuxkTPzrLFhWJlV9MeBM5kgLjxHAczw+J
	pDZoAifC5mC4kZsKR9XFMkuaBR5q+wQjuQZfpMjiNsHXWbQc4BReyIRJaK95yvNuG0KMX94Nqcq
	5TlTT91wbiLC7IdPgk/VrBzPryeO7QQh8Q5Zm4YLFHei05CyJFoxdEJ/K73GSccVUPJN1PU0WoY
	jxyZYjlJb48i8VizP8fUXigJ+Q8I8iUvgPrt78KR3FDFGtGY3Y2RHhnOTzmwWBx/tXjtOqsvviI
	lL/7TNWCztE4NxjQzAnmTxc/IainISROPX1XU0rhI36Vu6OZsfHyesA7npQYHJj0Ozrx83Lt8PM
	UN9TduJOvxlsyOBLdJtJVCZ089+49NigABidjhtHvdCoH/FtyZu
X-Received: by 2002:a05:600c:6208:b0:485:2fe9:33a7 with SMTP id 5b1f17b1804b1-4852fe93683mr103336695e9.3.1773150432698;
        Tue, 10 Mar 2026 06:47:12 -0700 (PDT)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm37159582f8f.13.2026.03.10.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:47:12 -0700 (PDT)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: sh_css_param_shading: Fix leading space indentation
Date: Tue, 10 Mar 2026 17:46:37 +0400
Message-ID: <20260310134636.65227-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix lines starting with spaces instead of tabs to comply with
kernel coding style. This silences checkpatch warnings "WARNING: please,
no spaces at the start of a line". Fixing line 323 also incidentally
resolved a CHECK warning on line 322 - "CHECK: Lines should not end
with a '('". 

No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_param_shading.c  | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 9105334c71b1..cbb6397be7f8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -197,10 +197,8 @@ crop_and_interpolate(unsigned int cropped_width,
 }
 
 void
-sh_css_params_shading_id_table_generate(
-    struct ia_css_shading_table **target_table,
-    unsigned int table_width,
-    unsigned int table_height)
+sh_css_params_shading_id_table_generate(struct ia_css_shading_table **target_table,
+					unsigned int table_width, unsigned int table_height)
 {
 	/* initialize table with ones, shift becomes zero */
 	unsigned int i, j;
@@ -318,10 +316,7 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 	*target_table = result;
 }
 
-struct ia_css_shading_table *
-ia_css_shading_table_alloc(
-    unsigned int width,
-    unsigned int height)
+struct ia_css_shading_table *ia_css_shading_table_alloc(unsigned int width, unsigned int height)
 {
 	unsigned int i;
 	struct ia_css_shading_table *me;
-- 
2.52.0

