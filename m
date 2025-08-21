Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBBC257851
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759700; cv=none; b=HBxs8OOQ4c/ogwzhPde1Sb9l2v0oeDD7mxtke3oJPNFA26/eHvixC2OQUc+RKr/3xdfJz7SJ0ZSmGYmxxb9fR0aRD11zpDPtcaGN9Of12fQOdsFIdkor1KwDHHuSSFhTjp07tmn+p8i9LKgCZD9miQV/cPH+qFAU+lzdb3vFE0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759700; c=relaxed/simple;
	bh=Lwh49xgm8E8hyfnJwvscG8id7WBz9JOebvAR2zKXZl8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ms+qsnfbTVu9ezSOq+uodJyDOokbvGTSRW7ZYrAjasvvKAWaXZWXjTgyojtZBqdYZ0scqacxtg7Ji8e6OE5l0IUldBXeDnyMDi5O+M5AP2UpS3OBzMCVtcPi41h2St/3sTU6RQveDPa+8cKfboOmKXafqYjX1ReuDKGKgbZX5lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZtwqiL6t; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZtwqiL6t"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b9edf80ddcso242854f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 00:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755759696; x=1756364496; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWHak7BTTuUjCdYO75xAv1rLY7D54sU+2w+NwPKTwUE=;
        b=ZtwqiL6txpDXPmUc9NONMjjmKhZNYlCzHftAyQM/SBM03KJswxaAqZsU3PWBEtjvKw
         tyPYmPPfHutQ8Mo8Fuwv8jZeHLAVnVP8JHdaXnbVBP2wigaGfRIHBQHeEv1ssbbWsSxR
         wMXdXp17V7gRJCtO3DqJexAnwbC7WbcVtOwMreOyjq5UHqLbSjxlGtRzH3ZgnNMmgFya
         6nLJ1EOzNEp+axOjUB9C7iz8ct35Nek1U8+bCSV0YlPWWIGl0SxFLKyNm9rEFQMRqddM
         pIzaA0e0zDatHO5OYwPfFf049okiVll8JgS1Or0MrqCAtvWEXiyYUs76OKmrrHxp80G8
         Tr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759696; x=1756364496;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rWHak7BTTuUjCdYO75xAv1rLY7D54sU+2w+NwPKTwUE=;
        b=jiobcAVoSM4cQfxnnSvTGA3ZJpqW4tUlSlEZ3z5T9llojFLUTd2rQSMFprSJK7/hnB
         hHphggnTQKt/8fbcBGG9dJBUtm1H+Kcb06uZzN1E/POtFs6bkoTzVMbMlltIBGT8Zxo6
         LG0u/VE1LN72O9ouFQkMGSJi44Ww+DgIgLveGJkLCl2wSsK3cAvLyRYhCzxiPTLmyNiZ
         SGqdLh3QcZ61Fxe2Qk/aIF4Ul+O7Mnz9UeNv+NpchwgKo8/9rdgX7cNLvAomtYOlyPK+
         rl7wy7Fw/uOyvP0f5j9+VEx7l6dhxI+DbXsJJ/p2gkAzNzIptMXaMyBsXMC1mOXSuc/a
         qcgA==
X-Forwarded-Encrypted: i=1; AJvYcCXvbLwr48BXf6WZWzUM8VmzRulAAbk3yD8GPwKJ2E+fPVPfmwCzUnahkxr+69xM5fDJLo60+iGt8zAzhAq/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5p7Qf4oELKyw0rTfDgPND2G8FCVGuV7jBtJeDh3BR9f/uGllv
	GSg7H91X8eWff6fE38t07jP18e9ZUvgWg7FWxbkZVxhZeIIj2OJtXqeoiMm+YsoCKrWylqUnO8i
	4Ct93JhW2cw==
X-Google-Smtp-Source: AGHT+IF7hlrAjiNuM/KEHKAFY8yyo63CcT8LWrl4yHVQAKYWdCNBYFgKuNHYzShQe6cb3WgyW1zJUwj7YKrw
X-Received: from wrbdk16.prod.google.com ([2002:a05:6000:b50:b0:3b7:d75e:c4a7])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:250e:b0:3b8:d1a4:bab9
 with SMTP id ffacd0b85a97d-3c497369e98mr1055445f8f.45.1755759696323; Thu, 21
 Aug 2025 00:01:36 -0700 (PDT)
Date: Thu, 21 Aug 2025 07:01:29 +0000
In-Reply-To: <20250821070130.2581766-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250821070130.2581766-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821070130.2581766-2-abarnas@google.com>
Subject: [PATCH v2 2/3] staging: media: atomisp: Whitespaces style cleanup in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Clean up coding style whitespace issues
in drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c

Fixes include:
 - removal of unnecessary line breaks
 - correcting spacing around operators
 - correcting spaces between types and names

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/gdc.c        | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index bfda3cd13306e..bd44410729bb4 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -24,9 +24,7 @@ static inline void gdc_reg_store(const gdc_ID_t ID, const=
 unsigned int reg,
 /*
  * Exported function implementations
  */
-void gdc_lut_store(
-    const gdc_ID_t		ID,
-    const int			data[4][HRT_GDC_N])
+void gdc_lut_store(const gdc_ID_t ID, const int data[4][HRT_GDC_N])
 {
 	unsigned int i, lut_offset =3D HRT_GDC_LUT_IDX;
=20
@@ -34,15 +32,13 @@ void gdc_lut_store(
 	assert(HRT_GDC_LUT_COEFF_OFFSET <=3D (4 * sizeof(hrt_data)));
=20
 	for (i =3D 0; i < HRT_GDC_N; i++) {
-		hrt_data	entry_0 =3D data[0][i] & HRT_GDC_BCI_COEF_MASK;
-		hrt_data	entry_1 =3D data[1][i] & HRT_GDC_BCI_COEF_MASK;
-		hrt_data	entry_2 =3D data[2][i] & HRT_GDC_BCI_COEF_MASK;
-		hrt_data	entry_3 =3D data[3][i] & HRT_GDC_BCI_COEF_MASK;
+		hrt_data entry_0 =3D data[0][i] & HRT_GDC_BCI_COEF_MASK;
+		hrt_data entry_1 =3D data[1][i] & HRT_GDC_BCI_COEF_MASK;
+		hrt_data entry_2 =3D data[2][i] & HRT_GDC_BCI_COEF_MASK;
+		hrt_data entry_3 =3D data[3][i] & HRT_GDC_BCI_COEF_MASK;
=20
-		hrt_data	word_0 =3D entry_0 |
-				     (entry_1 << HRT_GDC_LUT_COEFF_OFFSET);
-		hrt_data	word_1 =3D entry_2 |
-				     (entry_3 << HRT_GDC_LUT_COEFF_OFFSET);
+		hrt_data word_0 =3D entry_0 | (entry_1 << HRT_GDC_LUT_COEFF_OFFSET);
+		hrt_data word_1 =3D entry_2 | (entry_3 << HRT_GDC_LUT_COEFF_OFFSET);
=20
 		gdc_reg_store(ID, lut_offset++, word_0);
 		gdc_reg_store(ID, lut_offset++, word_1);
@@ -83,8 +79,7 @@ void gdc_lut_convert_to_isp_format(const int in_lut[4][HR=
T_GDC_N],
 	}
 }
=20
-int gdc_get_unity(
-    const gdc_ID_t		ID)
+int gdc_get_unity(const gdc_ID_t ID)
 {
 	assert(ID < N_GDC_ID);
 	(void)ID;
--=20
2.51.0.rc2.233.g662b1ed5c5-goog

