Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8125A637
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151131; cv=none; b=mQ2JsDyHGpHea8nasFQOnb64KqI22p0G89p0Z7oG4nXHEKEculW0Q3l+o5dXyTAh1PWnBYwo1mwEAG+fFjWhTZIpI3Htp1R/6E81JiEwuFxx9B1cOWMSkUbmuvXp23ZuCzN64bxpTHavCzxqRQ1YhBte3xo0+nRmcyDGx7phExI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151131; c=relaxed/simple;
	bh=CTkuchpWwxVlAy9Q3huxyw74RcuiMEQlO21k2/y3xtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvENKn4zYcDz3L84qX5Pw80RS5BRqY6qAbLVJyC+Nab3XYSYbg6+/MA8npSKbEoRQww/KSou+HrpryyKj2jghf1C2ZeR7IdcZJbJOjjXI7WHZ+Q/9qvDXv9RaQ46AOLT7dmJqo/xQslLbJLY8OfGfFyh5utN0+zpYJgx/Xb+FvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ZsHyUdH8; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ZsHyUdH8"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af9065f0fc0so4118982a12.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151129; x=1744755929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpuF8/8p8vziE36GXyTG1Lw6cnZL+l12I1BHpvDEYzA=;
        b=ZsHyUdH8OQntgUrHWt58VqzjTX7nWsmCP314O2eP9H82544LWq08vzlXXXOjsG8mSH
         5lfa9vr4eniyhvnhevAxoJmrib53PkyNooKvaccMpDsyhYznZAhZR4Vkmq1kV2dAAmBA
         ZvRXDIOP+Sx4Zq/2j4TFAEczZ/3pEItR3ks5nG37J4F23fRHP5ra5aCVYOnSNycS0czy
         kakFHXLCqic+KAi5nmTkjv/oEw0QN+RCM739VGUzUmzvaa52wWq63WitGsn2nE/sy6xe
         aHDIU9W4e31wInAU1DZxZuFuNpRlTNdi5O0hrt4sTFYfCwOZlLymjcBvXB5LJqhvT5tN
         kJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151129; x=1744755929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpuF8/8p8vziE36GXyTG1Lw6cnZL+l12I1BHpvDEYzA=;
        b=oMVQ4SlEsFFHeU5Gpv9zsd1Qf1AoiC6hqYZI2W3HM7h/oaYH6wCyD7TfYqqQAvG82/
         8x6+pJNBvO8nf/KUQDUIuEnf9PRU6pSfPGtknG3BGiULaKAtMXHaJFQy8ET6BkuP1oqA
         ng8sY9MoVQThH4komeKxFbR0ZkODFnhcgzkOpMjwblMqIJo2fNVjCZ/AlgImkR7+XbG8
         +IPOK9CqUGXbv4TJdSOSGmFPs4ooeHJpXNSeongsWJwdp2BrFOJAYK/0zH8Ty2hk4myI
         t+s11kF/M6UxqrlBBpBmdWX6yl26b3eGiguyfEEV9Sscklh3Ihde8Kvhfqid/xVG24Qh
         IPsw==
X-Forwarded-Encrypted: i=1; AJvYcCU/QTP8Q36t5AjGdEEZwL//SOPQ0u4meeUIhneWcRIH4RtrJw3pCJ1pLNofKAhDcae4F9xn1dQKHNJqWjxc@lists.linux.dev
X-Gm-Message-State: AOJu0YwkF7X2F0s/gc2VW0dvdL+ubQG9xtC4f6Ok2bYnHSgXvK9vwV/a
	AGN1+BQfpqBK7sKnDmkjtXGu6PMygGhuCyn9ZHy6qb43q+80O0nGXkBf0AgzwQ==
X-Gm-Gg: ASbGnctvPKTp90aWIMSmIJvcnczii58LfawC7B8WJHiG8Qf4BhR3RrioVdTuni+iUzK
	ehVJvSCVhQky/nUP6c0kNK30TnIr1lIvKLXvqXcfaxJF/anOA3cwjQaoL+jtnWxLiJ0x9zQFtjJ
	RbfXAQAU/WImYZCFa9g3qYn42BtNbMFTvZWvXfHf13Qlxcd6RtZ8fGf6Z04oFBpH3fQxRVU0hpL
	iZ/QI6S+ai7ATeHRW1Aux2OxsmQzXermSn/xVJpSEN6AspvN8NqwCAgWDHyngZBu1aqRq2k5BR3
	MPRVD8DKhHbZJ4+0/GjOvj7EXoEpznvbXRqGRl/kIVDDQt8aVf4ClHJdOxADkm7b+KBKlKM8AuA
	DRSxyN2R5kA==
X-Google-Smtp-Source: AGHT+IHAwKj9OOar9R8OAylcpYrbMoIxJRIVpH7LfgstnadVPEuA6wrPm4E6cjggnU4E9R3aFZUfcg==
X-Received: by 2002:a17:90b:17d1:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-306dd51c13cmr275559a91.9.1744151129312;
        Tue, 08 Apr 2025 15:25:29 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3058494a3ecsm11592364a91.18.2025.04.08.15.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:29 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 17/18] staging: gpib: tnt4882: struct gpib_interface
Date: Tue,  8 Apr 2025 22:25:03 +0000
Message-ID: <20250408222504.186992-18-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
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
index 3b29f541fd49..596e2fa40dcd 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1116,7 +1116,7 @@ static int tnt4882_pci_probe(struct pci_dev *dev, const struct pci_device_id *id
 	return 0;
 }
 
-static gpib_interface_t ni_pci_interface = {
+static struct gpib_interface ni_pci_interface = {
 	.name = "ni_pci",
 	.attach = ni_pci_attach,
 	.detach = ni_pci_detach,
@@ -1144,7 +1144,7 @@ static gpib_interface_t ni_pci_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_pci_accel_interface = {
+static struct gpib_interface ni_pci_accel_interface = {
 	.name = "ni_pci_accel",
 	.attach = ni_pci_attach,
 	.detach = ni_pci_detach,
@@ -1172,7 +1172,7 @@ static gpib_interface_t ni_pci_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_isa_interface = {
+static struct gpib_interface ni_isa_interface = {
 	.name = "ni_isa",
 	.attach = ni_tnt_isa_attach,
 	.detach = ni_isa_detach,
@@ -1200,7 +1200,7 @@ static gpib_interface_t ni_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nat4882_isa_interface = {
+static struct gpib_interface ni_nat4882_isa_interface = {
 	.name = "ni_nat4882_isa",
 	.attach = ni_nat4882_isa_attach,
 	.detach = ni_isa_detach,
@@ -1228,7 +1228,7 @@ static gpib_interface_t ni_nat4882_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nec_isa_interface = {
+static struct gpib_interface ni_nec_isa_interface = {
 	.name = "ni_nec_isa",
 	.attach = ni_nec_isa_attach,
 	.detach = ni_isa_detach,
@@ -1256,7 +1256,7 @@ static gpib_interface_t ni_nec_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_isa_accel_interface = {
+static struct gpib_interface ni_isa_accel_interface = {
 	.name = "ni_isa_accel",
 	.attach = ni_tnt_isa_attach,
 	.detach = ni_isa_detach,
@@ -1284,7 +1284,7 @@ static gpib_interface_t ni_isa_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nat4882_isa_accel_interface = {
+static struct gpib_interface ni_nat4882_isa_accel_interface = {
 	.name = "ni_nat4882_isa_accel",
 	.attach = ni_nat4882_isa_attach,
 	.detach = ni_isa_detach,
@@ -1312,7 +1312,7 @@ static gpib_interface_t ni_nat4882_isa_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nec_isa_accel_interface = {
+static struct gpib_interface ni_nec_isa_accel_interface = {
 	.name = "ni_nec_isa_accel",
 	.attach = ni_nec_isa_attach,
 	.detach = ni_isa_detach,
@@ -1371,8 +1371,8 @@ MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
 #endif
 
 #ifdef CONFIG_GPIB_PCMCIA
-static gpib_interface_t ni_pcmcia_interface;
-static gpib_interface_t ni_pcmcia_accel_interface;
+static struct gpib_interface ni_pcmcia_interface;
+static struct gpib_interface ni_pcmcia_accel_interface;
 static int __init init_ni_gpib_cs(void);
 static void __exit exit_ni_gpib_cs(void);
 #endif
@@ -1769,7 +1769,7 @@ static void ni_pcmcia_detach(struct gpib_board *board)
 	tnt4882_free_private(board);
 }
 
-static gpib_interface_t ni_pcmcia_interface = {
+static struct gpib_interface ni_pcmcia_interface = {
 	.name = "ni_pcmcia",
 	.attach = ni_pcmcia_attach,
 	.detach = ni_pcmcia_detach,
@@ -1797,7 +1797,7 @@ static gpib_interface_t ni_pcmcia_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_pcmcia_accel_interface = {
+static struct gpib_interface ni_pcmcia_accel_interface = {
 	.name = "ni_pcmcia_accel",
 	.attach = ni_pcmcia_attach,
 	.detach = ni_pcmcia_detach,
-- 
2.43.0

