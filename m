Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1D327C160
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222215; cv=none; b=K8qj0SS8zfCcQ9fxKZvBUHWeBrn6HhIJPJx2tFmwoaCjh44I5QwYMNd4wq7oauggUVv+CK72duA7sec6VPlGFzrEm+U8aOOm8ELQL3pCDB0R/PqYMggQSE/zlGHYr3I4CLp7d+8oiadv8nnX4Gg/f01u43+DeUML9h3aCURv734=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222215; c=relaxed/simple;
	bh=iWVSSf+TpSw8Rneoj2znRVsY2B7CQDvvXidmWGGapFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djKBJQAgL1cHdOODqhN+Q8hFqPVKZIUv8FnOGnbb4CeBsyw3Jecm5XBPLCw+3wHJvfkNK6MbiH4SrACsFaEquLGGz1Mrzfm6iy2xhnCU1mW2ggyDzKrpaBeMgaWjMehfuGsFYcyeGsDmQA/nvmjWeqLZz2UN7EmPQr07YjIoMjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=V4vw8ioX; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="V4vw8ioX"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736aaeed234so6134938b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222212; x=1744827012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zs3nmp6bNInwEcGoHF3GJbe7f1ZKHiGtLyO1UFwX8eI=;
        b=V4vw8ioXl2knfKBuJkj9jB0BMdeXAQ90qT/yKXOGu9l8M1MWI4eQnQLheuy55D6NYf
         6JwD8pM8a9Kn5nmK8ntLyl5IvRRn1/Lr3ZDvzC+pFQn8WKuT0EJBAKKpPivTsO4EeZTS
         feWcrTMX1iZueo6m6Z9/7B8y5OuTSt/K87saKhIuHnDCzB3n1+jpHOE+QWcrHpdiJllI
         1HtK3Gz3/JvHhIRuZHxJDWnBb1kiZwO0E5AohPBV/Q6dHjPi1M5Zb40+1lbLdf6WcxVb
         NYy6O+xvBRd14UKhioWs/ReVhw0IBEG4crNpxXb913fREqalgVCG4SCV/uW8IjPaUQiM
         0hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222212; x=1744827012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs3nmp6bNInwEcGoHF3GJbe7f1ZKHiGtLyO1UFwX8eI=;
        b=E0U4G5ibu7UagbqbN/nRELRb7CGU+zN3siAnTS05aBlKoerJeXuTaVizaWofwDFarh
         lH9YNKxybuVWTmhsrT+yhHzADSanHnIoOPtR5Zm7/Mgm8VOM041bDMpLmznH4TVp6bbA
         EPvRJs2dJzrqXxq4eyQTiGx1mAeAKGUe/Pn9/xzkiV1r+wSaf9ZruIvco0XcpMKoNY5z
         n+VVQkZ2PaUSTbiJgnzriddf678nS5qRdkhg47a2+0HCcydOXRWgBiYP0M0fXfQttOMf
         slLji+x6xqSt5LReH24Ur+Qkf8AXENVDnDb9RoOzsIm2NQE0pzfkfdn6nPUK15fQYRFa
         6r6g==
X-Gm-Message-State: AOJu0YzwepRwGHFLw2tmHne5+iPsLUshW4eGdgEkWpIZmD1PRqToNhAk
	xnuzKYpTKHg4oAwdc1aE0MGeq5FkEFzBMYynBWUgwY2DdGVqgeMrlNDUUP6HhA==
X-Gm-Gg: ASbGncuNePRroFuckxgPo6v8f0QUp+BVYdzd2J8WxKNmchsEoxYf0GkZSjqdWwVca0A
	kd2kBRWdS8sLw+V7K+mgFI5UaeCMEI27YBOMeD4rdVdejovFzeYMDYIE6Eo+gVW7dd3yM0cj7WC
	rXEznJ6mdBfL+JC2QRw4k8LPzG5uZRYe++7bKXji+8J9/DBOj/TncZd46cmn/hZXgiyxmpgkEt+
	L2FGF6NbHHIVJ+niP3RcOtZKHzQEfHBLPaWM+v0GhKftPrW5Dr61l5LaGCIOu6z5YNWK27Uzk+u
	oQAsN4FZHxXf7UeCkn1BLaK8Sl/mB6NSC5xLcIJalmT5QjkPQxBFc2N//5Px69Sgydg8hfZBoGG
	XCmeO5v1VzrdnZuE5
X-Google-Smtp-Source: AGHT+IFgXXOdrl9fOh82u6pMjdXaCsAwnKkLGKii5e4bOy42s4jjP9CSVNZ7Fa1eaRYc1XrPVYdOlA==
X-Received: by 2002:a05:6a00:1909:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-73bae30a7e1mr4765168b3a.0.1744222212520;
        Wed, 09 Apr 2025 11:10:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b913sm1718533b3a.12.2025.04.09.11.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 14/23] staging: gpib: cec: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:44 +0000
Message-ID: <20250409180953.398686-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'
Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/cec/cec_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 1b02222881b9..737d78736ea5 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -45,7 +45,7 @@ static int cec_pci_attach(struct gpib_board *board, const struct gpib_board_conf
 static void cec_pci_detach(struct gpib_board *board);
 
 // wrappers for interface functions
-static int cec_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int cec_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		    size_t *bytes_read)
 {
 	struct cec_priv *priv = board->private_data;
@@ -53,7 +53,7 @@ static int cec_read(struct gpib_board *board, uint8_t *buffer, size_t length, in
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int cec_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int cec_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written)
 {
 	struct cec_priv *priv = board->private_data;
@@ -61,7 +61,7 @@ static int cec_write(struct gpib_board *board, uint8_t *buffer, size_t length, i
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int cec_command(struct gpib_board *board, uint8_t *buffer,
+static int cec_command(struct gpib_board *board, u8 *buffer,
 		       size_t length, size_t *bytes_written)
 {
 	struct cec_priv *priv = board->private_data;
@@ -104,7 +104,7 @@ static void cec_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int cec_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int cec_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct cec_priv *priv = board->private_data;
 
@@ -139,14 +139,14 @@ static int cec_secondary_address(struct gpib_board *board, unsigned int address,
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int cec_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int cec_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void cec_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void cec_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct cec_priv *priv = board->private_data;
 
@@ -160,14 +160,14 @@ static void cec_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void cec_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void cec_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t cec_serial_poll_status(struct gpib_board *board)
+static u8 cec_serial_poll_status(struct gpib_board *board)
 {
 	struct cec_priv *priv = board->private_data;
 
-- 
2.43.0

