Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB4A24167A
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836135; cv=none; b=LsTFNlSEzc3o8Vg24+BbHnHOY+aUzI8zp6kNLIAQS78zB9d/3ttq2rRLt2RvKQYx6QYTWVDC14+GA8Xsxf58UwNNqjmw9h1Jd5Me8g/DCCQml8SK9W4LdHL9TBdxe77CRSIOmxvhz0g6qyh3erAIHDR3DqV0lyByhvrtPTrkoQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836135; c=relaxed/simple;
	bh=QaMlya95zkc4MjQsjQDNT36UA9lQmCeo4nFFSkNr0Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtIEeROpt44fS93iEzN/PQMauixqdwaBY24TQ2ou1C6Lt9soQKT8XlQFJ7n7MyVxLveg5U4Rrfq5rrvEoLygTLc9Y3aaMfj4LJyI9d6iLOhidE7Cg86N/yYKYG5aXXihCAQkzD+QGkV7OhJdAIG6sj9uEClvfEsHU6xr1sGhRXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=M87uylK8; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="M87uylK8"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af548cb1f83so41365a12.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836133; x=1745440933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAwcN61khauGEX7eRicTPKijk8SHQIgYsxBV6pw5EIA=;
        b=M87uylK8DA28oYtlZ6nPYLgkZtceBpHrNgHpG4ezfXmcHaT7qppbLNK9WQxWFb2JH8
         EDW8M0ShYCwE5CcfhJhYfFSMovYKRL81IMTaDgTkYkPgm5bn1YuVmbU+Q4ITFeJ8jE+7
         a0xAt2KPS2ME3/Ad5lsaUmZuv4Jhwd5kmWyO3vqZDFLIWLDiNXPg49EGwx/WY6hdpJfy
         wvmCrGcIEPhRGglou/o5p2kFOrXKcwd0l52u1sxRe1v+Htm+zFw0Uak+/iOUXEEMSQug
         1P9Lc/G0xT5qC/iQM8m8AVqRujGHOlSgLMO85NUODvNTApj3HHpfRs0Z3R0OS43LywS5
         XOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836133; x=1745440933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAwcN61khauGEX7eRicTPKijk8SHQIgYsxBV6pw5EIA=;
        b=N9guU1Fu6U471jEk2OYquS3RvMOpXUNkOEszx23xBV5cZ7qPiiHMPzhl4JeTJumxib
         +UlYY/VumXNpZjQhWwObJSYk6Bdrl4U0+f2OB1+hRqONe8Co3dv8viSiyJ64cU46oeIg
         Z65ndEtn8fXBQuoZYCHpSEuSe9usseUJtTt3ZpmsG2w97o9Z/g8+0OAbJdc+TH5NXwjG
         FpyHq9Tweu2+5A+QNOy7pBv177rNAxfBYBTJ2qkH2QP8dXkaV5QnPlAUFvmUstpace9M
         sx4L59imRQLZqtZKhgj4T6c2abiC9sYpXqIpkaA4wDOq1TtU5rr0/cNmGz6tfOP9BtL5
         /UdA==
X-Gm-Message-State: AOJu0YxMI33198incWLOhOZc78KPH77FsfKg4/1SK8K+MI/ZzhjCNqNS
	GnhVNM7CUO9ard5aYh4+j3/eoX7piJuEuDWy5u2C532/D3k6kSxTTZy4wls/MuxA0SrVGLiTeGM
	=
X-Gm-Gg: ASbGncse9jecTlZ2E0Hnq3yJFlAOhRejqiEHKDCDB2keR3Al+s5Nk02ERVKr8b0L5g4
	9o1SFuF0Rbz8UXHzAZcY8ZuE4ArXK9nFIGXr9INxs+WCE0oVifRXgyBPFPlidf4r5pIv1uuRxjT
	CbHq5Tyw4rCInADzr03gY4uSlW02MoByZsEQnelahnytC700ik1N75oRUqfdSlMouhsBaUC2AES
	Vq2I7MoJ29f4Fa6Hh/zP8Z0FjdYTcQ9hlKsF2LI9t4wh0go+S2CoJePsmZMnlR2zns7QL6ewSar
	EgLV5qLmj83sydYdiqmUtksLou1zUH/6WWjXKouTyKL8nHXx+KDRFWjMO3slrRw/684aPtNc94J
	FZ+yQ4upFOa7fVVby
X-Google-Smtp-Source: AGHT+IEjTfZ/5+JWlyAL1MHSwYwfgw7tSppO+oNmQAkpsLIDlm3RVaShuEtrcoqhprEETHkbtgEhzQ==
X-Received: by 2002:a17:90b:570f:b0:2ff:6f88:b04a with SMTP id 98e67ed59e1d1-30863f2e213mr5180030a91.15.1744836133347;
        Wed, 16 Apr 2025 13:42:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5e92sm18911465ad.118.2025.04.16.13.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 05/18] staging: gpib: cec: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:51 +0000
Message-ID: <20250416204204.8009-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/cec/cec_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 03d5b6c4fd8c..1b02222881b9 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -188,7 +188,7 @@ static void cec_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t cec_pci_interface = {
+static struct gpib_interface cec_pci_interface = {
 	.name = "cec_pci",
 	.attach = cec_pci_attach,
 	.detach = cec_pci_detach,
-- 
2.43.0

