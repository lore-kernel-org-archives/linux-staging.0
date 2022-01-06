Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB8C2C80
	for <linux-staging@lists.linux.dev>; Thu,  6 Jan 2022 21:33:31 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id w7so3352602plp.13
        for <linux-staging@lists.linux.dev>; Thu, 06 Jan 2022 13:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=WuKRGo9ecKyj+0SJ1Lg32Xx/ZEzcZuPmTJpgDjcU7uY=;
        b=AhRuXFF2ulHp/rvfG1I45ArchYIMXBwQfjay6KahHpQaAneqhy7iGqzYTfDEMB5wKc
         A8VmTa3Ix3Rzd1IaR20QG5S3yoTSnvgfJnTiFfL++7ziPLnM4ptRvE3MThwuZqoA08cB
         0ksjMdSB4B5ueb9BZLaQmzqh/3QxQF4a8j9MosJluV3/OOHaDxjTg9eGjmKjJOFMT4H3
         EiOUXptQrtjvD9x2/+29Vm+v873oz1nokdmIEdg9LNK3KjyBmL/pnF55IxP7QdMWHbyN
         2MxaBo4mox0G1Mbr/eUNIY4ylgmodkLBjLj7PCn6OmYCrskG74mFWuVwNagpqTIR7a22
         0IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=WuKRGo9ecKyj+0SJ1Lg32Xx/ZEzcZuPmTJpgDjcU7uY=;
        b=8E834o5wQplXLgTQP95r98Z34qlorzafn1pE04HXWSZ/Gu/TVGnIggaNi9L+zj5MVg
         YKDee5+3PJkHGd6T5u4L10xvG+qbs7y8dwgoZZDpEuSXNyhpEkh1hr8SL9ggcVNRCELl
         5HlEGPDqmKtkDCIIMVaR/zfdPy7Nnx36F2s0LB1KO8Su59e6lZC9/qs15DK6rV+DraI9
         RElauODPhJ/LxQqtN1lihWrCGxbZ9TVZxrLAbrS78xy+3u0alBnGT9zdGXRLthnKQP3O
         g7x7e0y8HjB0oV7pHMj8IxuwU8N5CKnX8/BJ+uIRMbUEzBmP3k3x1MVBO86sDAsPT7yK
         6VNA==
X-Gm-Message-State: AOAM532m8BrzO0UVLaEp3bLoAG/bYG0Z46da9xGQcqXoDjDaqVrX0HXt
	mtJehWW6ZI3AlEBIMuds5ZQ=
X-Google-Smtp-Source: ABdhPJxAkBpesp/+H7KaHoCKMNePmUsNKQ1ND3NiASQkIa2G2NvKPPF+Yz0sLtdNLD+Ok4OKSQzYRQ==
X-Received: by 2002:a17:902:6b02:b0:149:9c7d:3ae7 with SMTP id o2-20020a1709026b0200b001499c7d3ae7mr37369260plk.51.1641504811598;
        Thu, 06 Jan 2022 13:33:31 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id s12sm3683830pfg.148.2022.01.06.13.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:33:31 -0800 (PST)
Date: Fri, 7 Jan 2022 10:33:25 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: pi433: move get version func to where all other
 functions are
Message-ID: <20220106213325.GA10767@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106201430.GA3416@mail.google.com>

As a convention for the pi433 driver, all routines that deals with the
rf69 chip are defined in the rf69.c file. There was an exception in
which the uC version verification was being done directly elsewhere.
While at it, the Version Register hardcoded value was replaced with a
pre-existing constant in the driver.

This patch adds rf69_get_version function to rf69.c

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
v2: function names where altered to match suggestions given during code
review. Requester: Sidong Yang
v1: https://lore.kernel.org/lkml/20220106093110.GA20011@mail.google.com/
---
 drivers/staging/pi433/pi433_if.c | 4 +---
 drivers/staging/pi433/rf69.c     | 5 +++++
 drivers/staging/pi433/rf69.h     | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 68c09fa016ed..1372361d56e1 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1116,9 +1116,7 @@ static int pi433_probe(struct spi_device *spi)
 		spi->mode, spi->bits_per_word, spi->max_speed_hz);
 
 	/* Ping the chip by reading the version register */
-	retval = spi_w8r8(spi, 0x10);
-	if (retval < 0)
-		return retval;
+	retval = rf69_get_version(spi);
 
 	switch (retval) {
 	case 0x24:
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index d64df072d8e8..ee8c81d164e1 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -102,6 +102,11 @@ static inline int rf69_read_mod_write(struct spi_device *spi, u8 reg,
 
 /*-------------------------------------------------------------------------*/
 
+int rf69_get_version(struct spi_device *spi)
+{
+	return rf69_read_reg(spi, REG_VERSION);
+}
+
 int rf69_set_mode(struct spi_device *spi, enum mode mode)
 {
 	static const u8 mode_map[] = {
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index b648ba5fff89..c25942f142a6 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -17,6 +17,7 @@
 #define FIFO_SIZE	66		/* bytes */
 #define FIFO_THRESHOLD	15		/* bytes */
 
+int rf69_get_version(struct spi_device *spi);
 int rf69_set_mode(struct spi_device *spi, enum mode mode);
 int rf69_set_data_mode(struct spi_device *spi, u8 data_mode);
 int rf69_set_modulation(struct spi_device *spi, enum modulation modulation);
-- 
2.25.4

