Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398732135BC
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849990; cv=none; b=RT3mXXgJqQqHOn/cUl/9Q+pu6O95gY4g6IP0LLZds/0OIigZUdCMk6K99HdCP1ZVzvuXdom9TLa8gXBMAjuY3JVM3JoGs+GZBntJrBKzROixZhPMUSjkRQNnNT7EOule6A8UjuTwKPjNVyD/YMJQ7+ArR21YpwR6d1F7lTUqCYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849990; c=relaxed/simple;
	bh=1+tRRy/nL01MPl0+5FS05H/L2lfuD8Vmz0fi46Q1xuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+VcheYxdH0ODhPZymdgMw1xEEY0616OJ1stWGFTHH+r6X9QkLY0nj4LBbzbU+am2A26jorQy0AcfORcnsd/5DohPaEPWjLROFKq/Qon6oGYJvl1hnBfoqdIf+2mAU6f+j+x3u9CJbWQ+Mvzirv+VVW5n6Oul0iqs804NMicWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=jVTGloiG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="jVTGloiG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2260c91576aso1849615ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849989; x=1745454789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjTAiMO1GxG/PObrFdD9u5YrnCsI7HGevSexjRmDxRA=;
        b=jVTGloiGlzU31QnytlorllCY7ZCOdvsPPAUIAadwVGaUqbj30IwvRZmqP3Kw3l61mR
         AjSJ5d42OeS87NOay/Pc255gdLiKdwKomkBAZi76liJPGA/tvh3j4qwVkgnrck4en100
         NWrBuYmbXXUz38bWEy59Ya7LPswGeRpvV88TP5NoOLI1EiSXrvLfBivuSjDA0XqlF4j8
         1tTqBzInTDaA/vQ+y3HL8q0G06HjDjE9aBWn7k92FXEAz2/WvURvgaWw4/KJ3FSOzUAg
         2UauKKnv05jFz1HNQZNUI1vv1xNpZstVTPmuV2lk18ld8RaH9YMcwipXiexPnXRb36bb
         925g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849989; x=1745454789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjTAiMO1GxG/PObrFdD9u5YrnCsI7HGevSexjRmDxRA=;
        b=G6tPEEfbzeQY8kNOUiPiuCu8bmv7q90QTsDnvYtUY8hAz8xlJE11iyfT7iFvMEbD1L
         2Onx17X8QsBK0qzJxL4KwtBMAX1PNc70ZpaxP0F3znEzUjJVjlyu23QfEfNdB/LeEgMd
         QLir3jUVbeaQActYiPwZXjxRNq+oX8aZvbpvw5q2Da/macGjbU0Uz/IJsC8leZvDnvCx
         kVJtfz4AKajNuQ0DTDf7bG7IOqVAvYXIvOWH464iA00WifsRPv7yPHby7xGEXb2rTAKV
         igfoutOXoVp3FF09G8PFsQTRdvRUbV99ebqzhnpFMWjXkBABTj0wVMm90KmZV9RgTyis
         7i2A==
X-Gm-Message-State: AOJu0YzW3XEfiurqwXbzX/Qz2S04AbW2KWuHRUcn/vExT/kTPBlGm6WG
	cjS1GrefX3Sj7bdnS+T4kKIKFOe3Pp0qLvm+4RTVn6oQFCf7f0RY381qDZiDD33rG+66DK36RdU
	=
X-Gm-Gg: ASbGncvVkGWbu3NtitceM7eE67nTzn9hABue7Z3mXLR3wEjFZnlFs2OEX471Y3WFje5
	6adHiyz6P5aWG1+mQR4/9WUWeeJwgDd12FC0uRyYIzozYfRCzxBKi0olEqgPhh+3qDDEO6hF95l
	oa99z2qiDBS4ht6NMNvQfduZIH0buTWi/VC4Sx/oE22dXLioz91zsBESQfVOA4F27VV4hiB/pSi
	QN5+4eJyg2UF864IicgmRKE5EUfFuLheIUv1VKHwhyc4ZXOVQGIhwXCBnB0VZMPvnqOWl9jxkWC
	eE6D0pqoj7k9vnlXgXUzE0cmfllU+davXJ6EQSxOg5bHHSNut8m6932ppeCLsLh6edgeOm8/mdy
	WKTpJXw==
X-Google-Smtp-Source: AGHT+IGtattHZ09c4gb6nvSUWNpyqJF6hIUIld7H8Mz7/Cjzoa1xoA2Pz5AmbuZO8KzC1cpc2DXyyg==
X-Received: by 2002:a17:902:e743:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-22c3596bbc6mr54055505ad.32.1744849988737;
        Wed, 16 Apr 2025 17:33:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0fbasm20797095ad.19.2025.04.16.17.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 17/18] staging: gpib: tnt4882: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:45 +0000
Message-ID: <20250417003246.84445-18-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 24 ++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index da13d11c20bd..d26a388912c9 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1122,7 +1122,7 @@ static int tnt4882_pci_probe(struct pci_dev *dev, const struct pci_device_id *id
 	return 0;
 }
 
-static gpib_interface_t ni_pci_interface = {
+static struct gpib_interface ni_pci_interface = {
 	.name = "ni_pci",
 	.attach = ni_pci_attach,
 	.detach = ni_pci_detach,
@@ -1150,7 +1150,7 @@ static gpib_interface_t ni_pci_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_pci_accel_interface = {
+static struct gpib_interface ni_pci_accel_interface = {
 	.name = "ni_pci_accel",
 	.attach = ni_pci_attach,
 	.detach = ni_pci_detach,
@@ -1178,7 +1178,7 @@ static gpib_interface_t ni_pci_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_isa_interface = {
+static struct gpib_interface ni_isa_interface = {
 	.name = "ni_isa",
 	.attach = ni_tnt_isa_attach,
 	.detach = ni_isa_detach,
@@ -1206,7 +1206,7 @@ static gpib_interface_t ni_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nat4882_isa_interface = {
+static struct gpib_interface ni_nat4882_isa_interface = {
 	.name = "ni_nat4882_isa",
 	.attach = ni_nat4882_isa_attach,
 	.detach = ni_isa_detach,
@@ -1234,7 +1234,7 @@ static gpib_interface_t ni_nat4882_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nec_isa_interface = {
+static struct gpib_interface ni_nec_isa_interface = {
 	.name = "ni_nec_isa",
 	.attach = ni_nec_isa_attach,
 	.detach = ni_isa_detach,
@@ -1262,7 +1262,7 @@ static gpib_interface_t ni_nec_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_isa_accel_interface = {
+static struct gpib_interface ni_isa_accel_interface = {
 	.name = "ni_isa_accel",
 	.attach = ni_tnt_isa_attach,
 	.detach = ni_isa_detach,
@@ -1290,7 +1290,7 @@ static gpib_interface_t ni_isa_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nat4882_isa_accel_interface = {
+static struct gpib_interface ni_nat4882_isa_accel_interface = {
 	.name = "ni_nat4882_isa_accel",
 	.attach = ni_nat4882_isa_attach,
 	.detach = ni_isa_detach,
@@ -1318,7 +1318,7 @@ static gpib_interface_t ni_nat4882_isa_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nec_isa_accel_interface = {
+static struct gpib_interface ni_nec_isa_accel_interface = {
 	.name = "ni_nec_isa_accel",
 	.attach = ni_nec_isa_attach,
 	.detach = ni_isa_detach,
@@ -1377,8 +1377,8 @@ MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
 #endif
 
 #ifdef CONFIG_GPIB_PCMCIA
-static gpib_interface_t ni_pcmcia_interface;
-static gpib_interface_t ni_pcmcia_accel_interface;
+static struct gpib_interface ni_pcmcia_interface;
+static struct gpib_interface ni_pcmcia_accel_interface;
 static int __init init_ni_gpib_cs(void);
 static void __exit exit_ni_gpib_cs(void);
 #endif
@@ -1775,7 +1775,7 @@ static void ni_pcmcia_detach(struct gpib_board *board)
 	tnt4882_free_private(board);
 }
 
-static gpib_interface_t ni_pcmcia_interface = {
+static struct gpib_interface ni_pcmcia_interface = {
 	.name = "ni_pcmcia",
 	.attach = ni_pcmcia_attach,
 	.detach = ni_pcmcia_detach,
@@ -1803,7 +1803,7 @@ static gpib_interface_t ni_pcmcia_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_pcmcia_accel_interface = {
+static struct gpib_interface ni_pcmcia_accel_interface = {
 	.name = "ni_pcmcia_accel",
 	.attach = ni_pcmcia_attach,
 	.detach = ni_pcmcia_detach,
-- 
2.43.0

