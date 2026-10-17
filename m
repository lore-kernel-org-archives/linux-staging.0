Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0862C3D88F5
	for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226700; cv=none; b=UcDR3OInI8J0grkxeCSD2CBifywThfmHZa1ftyKI6I3GTcpSQ2G/0uJT5IhWLax0+zZwSUJqC1VG5Pxh+/i8X9qoRdF/jTi7KMFacajhqrvxl5YalPpKlRvei4b34Tz7NN+ShYpDpS2F/yyhvlogWjlilKMSvO/qtd1B43evJ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226700; c=relaxed/simple;
	bh=8uSgPY5J4SRj7MOr1f/0kPNYNpJMtVZt/cJJlSdW0DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GiFedXNhPvy304H+UwP5plFIoZl0BTup8QrdBMbBAbkuLsiWRyavBHzqluQjGZjHf6Gl/AJPefkwmrxb+FWcKfH1fnoMGflavGqOyW4MzEjVJ4z/Pfm8ir/uatcc+jLs9cRAhasvdDRFU0aqyndY7Jk0QOGMUf5I4e4YKwJHpAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4MGebTo; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4MGebTo"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35943f55c06so904165eec.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 01:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226697; x=1792831497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDKDg1qqrPaeFL1JFANvjweHJRgsUSZoEsZ1Bk80NL4=;
        b=n4MGebToNGDHZdJGe1oowXPyzj63M6DUr/9CbaUqGBtcyMFzJ1bfVvJIW+/WztXUix
         WWc3PYt8yV+vuxo1OZVEufr1/wDxQgwJAQH34OsqyKqNUSop2uwCDeVsNH18NWXdbSPF
         u/65W8VedgPDvEjCCeaoeGybW18SkwjYlIbLhJjPkXVLPF1lswSZa3fnFSW9DMbk5WUg
         dQ3nmhmwz17mxstfdPlNHWkcpD4Mvw3OuZWqeci+yErwh+04MvE1JheW3UzgpSF8pxOq
         q5tnHP/cHllanPE9jNp6nqoShZQEGtCA/KVIOpuQt1/Cv70ia7zUCMYuG7TXyjzQLsTl
         r77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226697; x=1792831497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDKDg1qqrPaeFL1JFANvjweHJRgsUSZoEsZ1Bk80NL4=;
        b=fFxa2zxKNY+6YqzEIX+/270raYM5p7KDfvCMcKmpxQM/wO0leDr0gfeqr6fj2KoJiR
         53DUkv/MEWpk2jyPWG1FK6o//js6kKYxplQy5soaR5HLZVX4r7ikS0niKqaP6zBMyICn
         wUUlzp8nCh5mNbTS4LvcGQOeGQvzLYtDTpgyD5HGM9ly9glUFNKFjvx7QIqvyyExStSL
         siirx8Op3V/Vd3mR6/cvnaqQDdeuYs0c4YkRSa3HNoAl2d/+B6wobSEt3jdpYDNqZUCS
         iTVZPqQA7kbSX+je/Or6N/aGdlKklbMeB42tgOk3zuzMO3HS6Xt4iUD2FwR+tz2lvotJ
         Inlw==
X-Forwarded-Encrypted: i=1; AKwUvBxYNO2jp7eJRIV57vhT657oU/pIh7GBxv9fe8K8sT7umgDcrPDre9f50PlOngxWB4HYIkkiTuvnQ6TE9105@lists.linux.dev
X-Gm-Message-State: AFq9FYKmmBFT7U0RIwmJC1IwHlIsR439AuoCD/bE1PuqkdB/uqdr3z6u
	eVSUxN2tBj2YB9RFsFJhwFkSsorhw5H4O+DGVoRjzJ25T9m8jqkLPEYf
X-Gm-Gg: AYBFou3lwA2mqAJ2ZvGbDmkZ8sYk0s+1VjoEgCG1B+AtXSuR5/7xSUE/b/D31eBoWcv
	qAmU6p+UiEAU6Dr5O6v3UPxI3+4sIAM3oeKLx12askX4s84wQc0L0tRjJ1de48dozNOFPOVs+xa
	Y1ye/+iiN1xsa26ulAGrQ+3/Ts2pDki+VatrQK6+KwduzsEpkHnnfUxbmZ9RV/whKn/R5JxVwWw
	T+cNjO/FKCnYjXPGDqOi090t9IoLOg2E34DuixFhTmrM5MXTusDFrgg/5qKdZsIu8zuV7TVntZL
	8qee9/ydwRcwsn8hrZldM3NQPHFAhvf5ufae3Srbm57g1t2dCiNmgQgH1GqDWDu5rmOkIbPQ//h
	yXYcOwlgq5HRS/xaBjv7NzMWqPwytlapcb8q10jv9QFO4KezcT+8XykykysNOyGAKgQyx4dBvoO
	J/5O+0B3XyLobfdWSnkY6XZlsa3Tuxm5tw73YDTLXAIlY8q4stbDs0dEoENRVY6vvTSRdneKmCv
	xIjUgA=
X-Received: by 2002:a05:693c:65c8:b0:34c:6edc:f4d with SMTP id 5a478bee46e88-3619ed15f04mr2742791eec.1.1792226696671;
        Sat, 17 Oct 2026 01:44:56 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:8046:55b6:b0c1:1b0d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm13584872eec.16.2026.10.17.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:44:55 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	rmfrfs@gmail.com,
	vireshk@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH v2] staging: greybus: Align function arguments
Date: Sat, 17 Oct 2026 14:14:41 +0530
Message-ID: <20261017084441.12123-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Align the function arguments to follow the coding style and
improve readability, addressing the alignment warning reported by
checkpatch.pl

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v2:
 - Rebased onto staging-next.
v1: https://lore.kernel.org/outreachy/C560A15E-6F28-4FC8-8BE2-277B503340AD@inria.fr/T/#t

 drivers/staging/greybus/loopback.c | 3 ++-
 drivers/staging/greybus/spilib.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index fe48a687377a..efc69c10cffe 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -652,7 +652,8 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
 		}
 
 		if (!gb_operation_response_alloc(operation,
-						 len + sizeof(*response), GFP_KERNEL)) {
+						 len + sizeof(*response),
+						 GFP_KERNEL)) {
 			dev_err(dev, "error allocating response\n");
 			return -ENOMEM;
 		}
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index e4d1ae8308aa..c1982f3fb931 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -160,7 +160,8 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
 
 /* Routines to transfer data */
 static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
-		struct gb_connection *connection, struct spi_message *msg)
+						    struct gb_connection *connection,
+						    struct spi_message *msg)
 {
 	struct gb_spi_transfer_request *request;
 	struct spi_device *dev = msg->spi;
-- 
2.43.0

