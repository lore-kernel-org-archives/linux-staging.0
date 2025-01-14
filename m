Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055F1F9F5E
	for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 16:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736873665; cv=none; b=h7CcBWR4/mfliU7qzXziNXu23LofRU5P3Sa109keokalybVasSL0molZahhQy/gWfuRGIjx4jOyFAiz8Cnx5kTxK9x29gwqpK9lZrGPbaxY4pofA6mJypZKSFBKtP/sjTC6eXhMqLuaNQBBoIaM/2m22F+kDQGJuFoiM5nh75Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736873665; c=relaxed/simple;
	bh=iTaMM5Gc8cE/zFss0CIcXQ2NJCA+B3AaPq4iH2muYEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBCIUwhIqcgH5U/ULWleqDj5rnHRSs/Ce2URkfi5zwVki/9WSSchNFKT1HbXXNTNWTe2HGO1dAdHarT384Sw96Wf/r3dn1ezbtQbZbrX4jCvKkf5/9LmZnJGyrTXzCNs0G2s9oJeH8RYXbfa/UYo5eHnT5DTOYlYxTeti3eFDIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZSg1P4+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZSg1P4+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so59386815e9.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 08:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736873662; x=1737478462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCkJII/Z289jBCVlF0/SpypHP9K98YDfC6qDaxWRNJ0=;
        b=DZSg1P4+GdrDuOQpaxoxOHhPuQE8FoxfjpGpgQNf4o/gBBxIWPGW5DRKVpAxPrL0/9
         T8pQhEsI+X485O7eu0EG91zKv07IgFhcxwMYOYmpKmmFVwPojLqaAxE60gIZNbEmXPiH
         78ZMEs3j7EtAASLr9Luwj873Hs9wgI3MsX4OBCtXSTty0a0qlNifWEKAD5sDPlXcJEF0
         /cM7Y705o04trOY+zuEnRGyi962rMwUUt0C8aO9+KFC6pSMk5il0pGwPJ0m+PIiFw+Dg
         HWyByRJQTl9AclTJx4sEkSUW3JAIBe4rF7yYn15Hrzo/GkpSozEhjS5VLPy+IidLfn1q
         Hr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873662; x=1737478462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCkJII/Z289jBCVlF0/SpypHP9K98YDfC6qDaxWRNJ0=;
        b=vahRZD9EL9Hsp60CxknIVxhti44BJbMea8VeBlO0SfKOfHoEN8OK8ED0Rbinu6WcGJ
         T3eUPLQ7u3CrPEUt/+RP+MmVU6OoxE/hX3XlYSm86z77ZKHgvOD2b5jNhLnuk/erCGsn
         rCxZQ+REA6yPd4t7MRbqVhKErOoHRHA0xcjxXtgi2f1wnGmuQNTkooGKxNhenQxJZiFl
         mk1g1pbOwH9dQ8MDgclbFnje3dr1q9X5uub4lGEPxs7CaJZPlGbH9iq0GIFlyGcpt4ML
         mMRQInpMJm+Lfibwm9e8HAunf1sW9c7pehRSm/dZoDhM3Kv7CQycJm27xMYzgrwS1p6I
         JzAw==
X-Forwarded-Encrypted: i=1; AJvYcCXy2URKMaWA31UEiRhhhpeKbBwlVrj05ipxlbjEnZ0p7sO4oHVB2vde1mXtF/3T24lT/NymdpLLkpr+Kzeg@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl57MSzXWL3aD9vNXQU8PHyAQCGZphnd83vSYUGSmDqvsDAvIS
	qdU9G5AMWdSn01NozGQ+Soa4fUDwoIeOKVuqcFkQq7Tj4I1LHHTB
X-Gm-Gg: ASbGncsmuxLtpxbVlYjE9ahYOulpgkQJXqEyb/R2sVAJJ7nUsx0YsuLedlPkkD63bxs
	eSnE797ru8FdF/8LwcGXxIAeLoPBZPj3ccVTb8ng251ERf1oP1C+NqQJSFnQmr2Cuec8HL0lblr
	QoBs7rVcPCg3Po9YogsoQxLNvcHoxEmUlAlEiL4siu92SgBgbzEta4M7ILXv5QymE5BXoDSDCfA
	FaKmLiqv27kjgRDIgpp9NAY9IhGsiBwAt4qfCHfVkn77sGL/rPAgV2eCr0r57w+PBY19S+Uy8yU
	i0gaLUYcSVdh6v9Y
X-Google-Smtp-Source: AGHT+IHQbdBUM78ZysVC9e7i/BdRe1dhw6JCoJrcjqgUJphKlfigT3PjpUKIMKwbKf6DskHjqtxRXA==
X-Received: by 2002:a05:600c:444d:b0:434:f739:7ce2 with SMTP id 5b1f17b1804b1-436eedef4e5mr157077725e9.8.1736873661537;
        Tue, 14 Jan 2025 08:54:21 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03e5fsm179930495e9.18.2025.01.14.08.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:54:20 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/4] staging: gpib: Avoid plain integers as NULL pointers
Date: Tue, 14 Jan 2025 17:54:02 +0100
Message-ID: <20250114165403.16410-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114165403.16410-1-dpenkler@gmail.com>
References: <20250114165403.16410-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A number of drivers were comparing request_region() with 0,
others were passing 0 instead of NULL as a pointer argument.

This led to the following sparse warning, for example:

cb7210/cb7210.c:1043:72: warning: Using plain integer as NULL pointer

Use !request_region() to test for NULL return and use NULL instead
of 0 as pointer parameter.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c        | 6 +++---
 drivers/staging/gpib/common/gpib_os.c       | 2 +-
 drivers/staging/gpib/common/iblib.c         | 2 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c    | 4 ++--
 drivers/staging/gpib/ines/ines_gpib.c       | 4 ++--
 drivers/staging/gpib/pc2/pc2_gpib.c         | 2 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 4 ++--
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index e5436f55c630..ae373005389b 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1040,7 +1040,7 @@ int cb_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
 		return retval;
 	cb_priv = board->private_data;
 	nec_priv = &cb_priv->nec7210_priv;
-	if (request_region(config->ibbase, cb7210_iosize, "cb7210") == 0) {
+	if (!request_region(config->ibbase, cb7210_iosize, "cb7210")) {
 		pr_err("gpib: ioports starting at 0x%u are already in use\n", config->ibbase);
 		return -EIO;
 	}
@@ -1459,8 +1459,8 @@ int cb_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	cb_priv = board->private_data;
 	nec_priv = &cb_priv->nec7210_priv;
 
-	if (request_region(curr_dev->resource[0]->start, resource_size(curr_dev->resource[0]),
-			   "cb7210") == 0)	{
+	if (!request_region(curr_dev->resource[0]->start, resource_size(curr_dev->resource[0]),
+			    "cb7210"))	{
 		pr_err("gpib: ioports starting at 0x%lx are already in use\n",
 		       (unsigned long)curr_dev->resource[0]->start);
 		return -EIO;
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 69fe39aa0daf..3234d4348957 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2197,7 +2197,7 @@ static int __init gpib_common_init_module(void)
 		return PTR_ERR(gpib_class);
 	}
 	for (i = 0; i < GPIB_MAX_NUM_BOARDS; ++i)
-		board_array[i].gpib_dev = device_create(gpib_class, 0,
+		board_array[i].gpib_dev = device_create(gpib_class, NULL,
 							MKDEV(GPIB_CODE, i), NULL, "gpib%i", i);
 
 	return 0;
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index db1911cc1b26..5f6fa135f505 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -695,7 +695,7 @@ int ibwait(gpib_board_t *board, int wait_mask, int clear_mask, int set_mask,
 
 	/* make sure we only clear status bits that we are reporting */
 	if (*status & clear_mask || set_mask)
-		general_ibstatus(board, status_queue, *status & clear_mask, set_mask, 0);
+		general_ibstatus(board, status_queue, *status & clear_mask, set_mask, NULL);
 
 	return 0;
 }
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index ad49a5644ab8..16e2d0c5642e 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -265,7 +265,7 @@ static struct gpiod_lookup_table gpib_gpio_table_0 = {
 static struct gpiod_lookup_table *lookup_tables[] = {
 	&gpib_gpio_table_0,
 	&gpib_gpio_table_1,
-	0
+	NULL
 };
 
 /* struct which defines private_data for gpio driver */
@@ -1119,7 +1119,7 @@ static void release_gpios(void)
 	for (j = 0 ; j < NUM_PINS ; j++) {
 		if (all_descriptors[j]) {
 			gpiod_put(all_descriptors[j]);
-			all_descriptors[j] = 0;
+			all_descriptors[j] = NULL;
 		}
 	}
 }
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 2c970bab6545..846dafc85c11 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1342,8 +1342,8 @@ int ines_common_pcmcia_attach(gpib_board_t *board)
 	ines_priv = board->private_data;
 	nec_priv = &ines_priv->nec7210_priv;
 
-	if (request_region(curr_dev->resource[0]->start,
-			   resource_size(curr_dev->resource[0]), "ines_gpib") == 0) {
+	if (!request_region(curr_dev->resource[0]->start,
+			    resource_size(curr_dev->resource[0]), "ines_gpib")) {
 		pr_err("ines_gpib: ioports at 0x%lx already in use\n",
 		       (unsigned long)(curr_dev->resource[0]->start));
 		return -1;
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 2fb2b51fbb0f..c0b07cb63d9a 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -426,7 +426,7 @@ int pc2_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	nec_priv = &pc2_priv->nec7210_priv;
 	nec_priv->offset = pc2_reg_offset;
 
-	if (request_region(config->ibbase, pc2_iosize, "pc2") == 0) {
+	if (!request_region(config->ibbase, pc2_iosize, "pc2")) {
 		pr_err("gpib: ioports are already in use\n");
 		return -1;
 	}
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 2fd1a29f0c8b..b39ab2abe495 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1896,8 +1896,8 @@ int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	nec_priv->offset = atgpib_reg_offset;
 
 	DEBUG(0, "ioport1 window attributes: 0x%lx\n", curr_dev->resource[0]->flags);
-	if (request_region(curr_dev->resource[0]->start, resource_size(curr_dev->resource[0]),
-			   "tnt4882") == 0) {
+	if (!request_region(curr_dev->resource[0]->start, resource_size(curr_dev->resource[0]),
+			    "tnt4882")) {
 		pr_err("gpib: ioports starting at 0x%lx are already in use\n",
 		       (unsigned long)curr_dev->resource[0]->start);
 		return -EIO;
-- 
2.47.1

