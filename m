Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3409F27CCE0
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222225; cv=none; b=BgMXO9iRR3DVYf4zqZwuvXwEDvLrTnBO5c5bLVbhLKrfb/fLkXFwvR10l61O6DpULFo4G9RPBBZhz+2+B7NQU3RjgdQaxQ9At5reSGGAvGSAV/TdS1HNDPIe7YZXsVpCsMxg7IVjUoC88zFLS+gC94iRKZD7saVQyegljfII8pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222225; c=relaxed/simple;
	bh=heLv2BrU53GaTy+A/cnx1uyIrI3xYfKZCn0fDBen1s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIZtpjRiOTZhcCP0d1di+AkBQwv1Lq4kDXvP4n3FL19I7oaQKzd1G1E6Cu1uAgFJipeU/P3mnzrJ9cQhXCG2Klc12sCV68mrIM0y2upnCivPjCsyXiFhTLacBFYih6kYRZQuXfsZghcfDNERa0vBrrcKxVF//NVitV3Ohp8TPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Sk4XgwG6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Sk4XgwG6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7396f13b750so7218958b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222222; x=1744827022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38edrlY0+fe0F8svEiRpze9+JSsT5C2v7XxklLezuhg=;
        b=Sk4XgwG6ehqZqP27OMBQZ11Z+wBUMvxG1tG0qXU442ZSrjE9mcLT1yZwa5i7xwJD/9
         aEdBL6Y8yWBdbXUcGpNoqVephV1BKGRn4Rmuxx/VIw986r/0Ez9NT8m1yii5MXoKCCDl
         Hmzd0FqT1M6ag9/xWFr77SKYgsGxwmPwAl9s5dGgr2UFekKB3RIBZ7hinFSeR+OAkwGE
         yGnn5oLOIvfWx4CSVHFdrrlo45dz92hL7NFKFJqkrV3Q/xL1+WsZj604bEzvjuVAexHc
         nc5mivGH03pnIuhicF+64Cup52B/KNCflBl7thmqTEI5nRH1rWIbFpeUz2i6KTieef+4
         3ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222222; x=1744827022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38edrlY0+fe0F8svEiRpze9+JSsT5C2v7XxklLezuhg=;
        b=api+drLtAScYZlVUC0Ht0MsreNj8+q/MWIT6wLmy5axYhJ0vUGofxE+aJjBwNplT91
         GR7klNyowYVLIDiHvAYra2RoscJYB7Yo3Y3QSJjAkA9WxHuSw4HuqGS21N+iZVYJ/j8D
         62GcouHnCQdCbYpgxNogotcStPrTJ8CzrLeAlD0Ji7CPBbUS4GhvgpkM6Ir4rypmEmQO
         H0o3lIBGQV9tl+lNcjs80QADHgMQs1pR2RmMFjyjdqsZnKnFPQrVH40Y6dr3IMfXeLLr
         ESTJMx6tzApdxzZldfzVPrxKyaMLJdB6/m8BJ7iIgvsL3sE+pEWLbQxruejoAoO6wRnI
         VwwA==
X-Gm-Message-State: AOJu0YyN9SUUVDme+FiJb+UoOG2dPViqXC+nqCud+XW4MjbsFNcr+4Wp
	Xu3en0wT2E9qurC/91eg3kvSpvCxRjFUL2mAB4e5NUnX9cvC1RJOI8PNpz4SmA==
X-Gm-Gg: ASbGncv400TVBKGjPxyV8DxtpuSeXIqTjh+DkVPvTjRb4kMr4SsK4fSx+4p0Ic8Scbe
	kcEREVQkWZ4Rn0ycDRPnE6mOSPiBrn5VFfKXNl53CRjAsy2bDbm646Z3f5qRGsWMS5DJ7Hv1TeZ
	brYDCNDHn/In7QRgCOhTaZftoUT2D7H6wHAPhBqeqYYfYa9imyE3VtMKUtKsotKtePVCeagoLoX
	pugM1bGiqbc3bRVkW9KnBvTaCfjuNw5ngxFT3XSxaBmpJnCfJfps7dd3dtja1PqBHRmHYvXq80e
	6LBKPiAsP3vOInqIAOVB0hxBklKVLL1uVQ46kjn+v/ujxyQIKeKcHuJvnPCBS1mRq6logfyJM4t
	SrkCo5A==
X-Google-Smtp-Source: AGHT+IGsDXVWrZkD5gojboocvpfp/EzMRYtO/bs6qHclqg8s1RcUpu0icEHcFOIg2h3bPvGcpLE9Rg==
X-Received: by 2002:a05:6a00:2284:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-73bae4b9277mr4012868b3a.6.1744222222347;
        Wed, 09 Apr 2025 11:10:22 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d469b9sm1653631b3a.48.2025.04.09.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 22/23] staging: gpib: tnt4882: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:52 +0000
Message-ID: <20250409180953.398686-23-matchstick@neverthere.org>
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
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 28 ++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index f123d427f835..3e87129c6d53 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -236,7 +236,7 @@ static int fifo_xfer_done(struct tnt4882_priv *tnt_priv)
 	return retval;
 }
 
-static int drain_fifo_words(struct tnt4882_priv *tnt_priv, uint8_t *buffer, int num_bytes)
+static int drain_fifo_words(struct tnt4882_priv *tnt_priv, u8 *buffer, int num_bytes)
 {
 	int count = 0;
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
@@ -274,7 +274,7 @@ static void tnt4882_release_holdoff(struct gpib_board *board, struct tnt4882_pri
 	}
 }
 
-static int tnt4882_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int tnt4882_accel_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			      size_t *bytes_read)
 {
 	size_t count = 0;
@@ -448,7 +448,7 @@ static int write_wait(struct gpib_board *board, struct tnt4882_priv *tnt_priv,
 	return 0;
 }
 
-static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int generic_write(struct gpib_board *board, u8 *buffer, size_t length,
 			 int send_eoi, int send_commands, size_t *bytes_written)
 {
 	size_t count = 0;
@@ -539,13 +539,13 @@ static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return retval;
 }
 
-static int tnt4882_accel_write(struct gpib_board *board, uint8_t *buffer,
+static int tnt4882_accel_write(struct gpib_board *board, u8 *buffer,
 			       size_t length, int send_eoi, size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, send_eoi, 0, bytes_written);
 }
 
-static int tnt4882_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int tnt4882_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, 0, 1, bytes_written);
@@ -592,7 +592,7 @@ static irqreturn_t tnt4882_interrupt(int irq, void *arg)
 }
 
 // wrappers for interface functions
-static int tnt4882_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int tnt4882_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			size_t *bytes_read)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -612,7 +612,7 @@ static int tnt4882_read(struct gpib_board *board, uint8_t *buffer, size_t length
 	return retval;
 }
 
-static int tnt4882_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int tnt4882_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -620,7 +620,7 @@ static int tnt4882_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int tnt4882_command_unaccel(struct gpib_board *board, uint8_t *buffer,
+static int tnt4882_command_unaccel(struct gpib_board *board, u8 *buffer,
 				   size_t length, size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -671,7 +671,7 @@ static void tnt4882_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int tnt4882_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int tnt4882_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -718,7 +718,7 @@ static int tnt4882_secondary_address(struct gpib_board *board, unsigned int addr
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int tnt4882_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int tnt4882_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 
@@ -735,7 +735,7 @@ static int tnt4882_parallel_poll(struct gpib_board *board, uint8_t *result)
 	}
 }
 
-static void tnt4882_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void tnt4882_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -763,14 +763,14 @@ static void tnt4882_parallel_poll_response(struct gpib_board *board, int ist)
 /* this is just used by the old nec7210 isa interfaces, the newer
  * boards use tnt4882_serial_poll_response2
  */
-static void tnt4882_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void tnt4882_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static void tnt4882_serial_poll_response2(struct gpib_board *board, uint8_t status,
+static void tnt4882_serial_poll_response2(struct gpib_board *board, u8 status,
 					  int new_reason_for_service)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -804,7 +804,7 @@ static void tnt4882_serial_poll_response2(struct gpib_board *board, uint8_t stat
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static uint8_t tnt4882_serial_poll_status(struct gpib_board *board)
+static u8 tnt4882_serial_poll_status(struct gpib_board *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
-- 
2.43.0

