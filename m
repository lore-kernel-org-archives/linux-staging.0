Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DB01EB5D8
	for <linux-staging@lists.linux.dev>; Tue,  1 Apr 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517081; cv=none; b=E8+b3dUyHljMdzaQF4OH8HfZrk6an+F7+UD9QjwBvvwaWPPj3RxRXYmXsfbNZd0tFx0t7SqKP3kBMzA1qhXQ23i/FIVnPJivrUr+rrKaRKm2OoE7R2MeH6CyGXPl/S6AOuW0fAnEWBb8qJL2eP3Be4EhweAwu3kBSU7cavcYNMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517081; c=relaxed/simple;
	bh=JPDmnKUMglz+XsRlG2V69K0PwK6vqRugnwv8vO6nGUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0sl1lEiTm3BOHkovPhqF1ylH/UFCT6knqOwRl7dlYSCRqGk7CuNFCamVr4KPkF85Ccz30VCUqiAE3HAd6HV14UkKR5qOFrFvstq9LNCtI1TeQe9WS0jYE5fKX4jzVn8D8/DgXo+4iWcrWOJLGWzrQ3S1By12iVcOf+NgCA67gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nr8CONep; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nr8CONep"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549963b5551so5885722e87.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517078; x=1744121878; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=It3zznYp54Cp1R2/qjZYQRWQWBFmdplnsGjJ5JvUQS8=;
        b=Nr8CONepUtWdpjGWKaiGLEa1DoAJXZ7RIiyEByQ1eCLUbzgJDDviHuig0Fes0CKJCM
         qqOcFsvno0w9euKeHZsbe3SJ+jcJ+XTxsFZnoGyDrAX69ARELL4enkliMxxFfJ58MS5C
         QMgEpQ25xsylxt3S8iPY4GileLo+luwcaDyz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517078; x=1744121878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=It3zznYp54Cp1R2/qjZYQRWQWBFmdplnsGjJ5JvUQS8=;
        b=NNY6x6JQzBJhZRB9Csrk55Mz86BmUUXMAj37Lj4+rvUcwQtlUwMxx6qkeg/oE4zBNg
         egv4pjm/IvXLblxPOP7VPePiuSzTR8M6uLFz8buSE+EXvN3VbiQRhz1xDjU1SsdHhsI1
         brsAuPWOGCKnaKBLO4QXW6xfo2YIkU4IAqXAWeRdj9GmAO0FnCvtiaf5R+vUtbkMm0Gp
         KjYpEexp4v7Wifj5sqEB1PqYJ8cDAuZ9aXpIHDHyT5oxYWRGgVZyqg4xUzhMWZ+ddRPv
         kuCBLheVmmPtnw9XCW9RNdSPZT+Hcb+p0FGUG/IOFSyebw8p6NsKm3K5KJgd+sNp5qC7
         zInA==
X-Forwarded-Encrypted: i=1; AJvYcCWJPtXa5NppQCh86LH2BLrsND2nvrzcTaRiljvjW+fn/j00k3Z7dRyZguuwdRI+ICHb2aE99OPLTbDml3oG@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6VTPUo5F9uNMlmmbsTHRqr+yN0ccs7VbtIGfoNpMkZIEpitnE
	wi2YTpYCi6fVBbbzUaRugh5ubeZF+zFfczvvYIlKYbc4GupyPvh7EmfV9SyQYg==
X-Gm-Gg: ASbGncupTe6xh6ZxZreKIRvhrHSSqtx3YEUyGD+9FQdeCATpY7Ms8/Cttf6Ql4tRAc6
	x/lnHPk1UvuuxCIcBaKJaGbU7GC37cL6+n0x8LL1lSWGQ/pNc1+t2cvoxYyLaC0Nfefnq/d2bVt
	RWftzzCXiLPWs4Xra8YK3rj6/9TqZKrS1aSZfIG9fgoZxyXlsv8Qu4QkgguIQkjxxaQ70fBy45k
	IDICyi70Z06o40dOpv20d+LTf6lgvYYAmQ2F3aqQEyX70LDt/sGFJ7odjSmkSqHy/GpVY4MjAGZ
	0WqgrKETLl1zfuR0GrBxK20NfLUB+W231rsc+H+VG/8SbKPnca6A7N7AJ0KgDk9nvjXZ5XkUlSg
	wVI+QaTfZqtO+7yTQxuY0hZJl
X-Google-Smtp-Source: AGHT+IFdyRka7MweflyBv5DeiJjMiC9PFaRXPwmxIKfE2/7XtM+eY+SzHCu4lHsET0WaqtAqx0xBlg==
X-Received: by 2002:a05:6512:3090:b0:545:2ab1:3de with SMTP id 2adb3069b0e04-54b10dc7b75mr3430994e87.13.1743517078196;
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Apr 2025 14:17:54 +0000
Subject: [PATCH v2 1/2] media: atomisp: Fix Wformat-truncation warning
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-v614-v2-1-53024c4fcdc7@chromium.org>
References: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
In-Reply-To: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Gcc8 is convinced that we do not have enough space in dot_id_input_bin.
Extend the variable 17 bytes which is just used for debugging.

drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1336:9: warning: '(pipe' directive output may be truncated writing 5 bytes into a region of size between 1 and 74 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 9818771a35e550c0ce98da826caff5f834867e7c..84220359c9576b0021ea7ac7ba13548bd77e49fd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -121,7 +121,8 @@ static const char *const pipe_id_to_str[] = {
 	/* [IA_CSS_PIPE_ID_YUVPP]     =*/ "yuvpp",
 };
 
-static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 10];
+/* 27 is combined length of _stage%d(pipe%d)\0. */
+static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 27];
 static char ring_buffer[200];
 
 void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)

-- 
2.49.0.472.ge94155a9ec-goog

