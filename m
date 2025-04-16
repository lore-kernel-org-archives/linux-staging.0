Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56E24E4A8
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836150; cv=none; b=RRyEsIdJ/LYwpYDKAHUIHJDw7hfH2N2bhkGMFBAQiLvf6E6grsRgZm+2svm3+26ycV4XPnVbUWlwWTZAZMLBMwoSrPzJQJWe22nDLFl2zuLE30wfrPZ1h9c1+UzxflXjj7ppiE7nL0/0qUvQH3BSEygho+GM/XRGX0JSkLyG4o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836150; c=relaxed/simple;
	bh=1+tRRy/nL01MPl0+5FS05H/L2lfuD8Vmz0fi46Q1xuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnFL40LeHqK9R4bs4Wfkr9DmfQtTyiWAjVRZYohLB/L+s+RGHgi7t54aZhuS46oQzmIAiFKOPd8ekr2pYCJovfyK5xR7iUV85JgSJweGlTUSuPYbxOSdcNrGoh0zKlXE4fIXt8KrUf6c1jYOeblikGM0k6ehuKHthsXmM4qEY84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=GYNZfYGl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="GYNZfYGl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7394945d37eso13624b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836148; x=1745440948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjTAiMO1GxG/PObrFdD9u5YrnCsI7HGevSexjRmDxRA=;
        b=GYNZfYGlx0iANYETAulQDmP/UTY39HhxMwVWyn+vsg/clDijR7e5lZJFkG9ONzSK//
         21CgQ7uYFdV9WyD5M1hs1zvP72pDGjQpYz64D5KTll+/vTL6uNMPwc2sjedaeCZ/8y9l
         d7nSlvx98Aca2ASg9yXoFe9KI5zVoW0pxJDHakk2u+n4/9gCqOvXXrn9xAsALeK1aUJM
         B8XVfT4c6GP3wxKYwmfw20ijqRHdi003HPwJiFTahIbZocP0+Z1NAkJMERP0kQx+j4f+
         e5cjkKuEpHEDD4k1VQQzSdXwj+98GjhaOkXMSEsG5jtTKBZ8GoMBJPQLZXX8mUvF1bI6
         MUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836148; x=1745440948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjTAiMO1GxG/PObrFdD9u5YrnCsI7HGevSexjRmDxRA=;
        b=qn10DiHNeqvGzbALUwIeRxIyKyRQG3yWynjiXKHDu4tp1G5XYqAEFop5EOd2h3O+FQ
         XWUNJ+Q8jqDtqxrZB+mIzx2kX++sPw5Rx614k59zrl0kBuRN0DC+LPFCkTGJYzYi4M+R
         py3dH+mK6b3AaIQRciUkWwZXYcy0/KNDUCV9zCf37rUOzfnAevwsB9/2hMR5PMPo043W
         b+w6IVXpDHObYKHKUBTvm6dZAIav02CdtTY4KKFTAykbjYxNq+cxTiDWGa/vQmnZ0xQz
         53PQAyEjuPXbAILxM3YDf4bsOgmz2DPDTq2k02XUpQ8VeJ7x4498V1FDe2mms6yUj6S/
         NJEQ==
X-Gm-Message-State: AOJu0Yx+b22nnMYrkR77tIMXBgu1FO+2jsp3IUI2hGW12tgr8S7pWxcd
	Uzf5tO9lOzpbpLM37NR098Plvvmd0P+3v1inOnCrRdoRe+qSymOE1iPzV3CLSw==
X-Gm-Gg: ASbGnctltGuSnUd/8rsEpVUMVzo353Ptzfs02/Yhgv1tECSUh/BRwBbkTY5vFq3FM8O
	tGalsIDsT02fxZOdQ+6N7K2/WpQH8+2C/rVeEWgYxHepBXeJn+Nub0nEXTUXfCgKa4WLi3O0MJ8
	NZEWk5Pc1lV7oboqcG7jN8qxAVfO55BVaefM6hx/78PGipjyiKieFdWd/x8rOab0smnljcTre2h
	B6Qoq8AJuCIhpwSBAeD/wNBraZn8EApUOhGe04XCCW2wHl1juLJj/4eVcuG1VSzyxfbyz4KienN
	BpwhDk7KURuoCOrHcHd+MVjVqEb9Yyv+e984Hp2ScIkw+X0PQiPANZxT7/l8PQc3WzlDtIsERv3
	T/pIMnbENVSH4d5Ca
X-Google-Smtp-Source: AGHT+IHpNWh/TvCbMhLIoPioSeKOQ3n/NrD1YbIxs/DRLH0xJAqpSQFycneeGM0Ao3h91UMlT6xyXg==
X-Received: by 2002:a05:6a00:3920:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-73c267ecd0bmr4332352b3a.23.1744836147688;
        Wed, 16 Apr 2025 13:42:27 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c2119sm10778264b3a.40.2025.04.16.13.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:27 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 17/18] staging: gpib: tnt4882: struct gpib_interface
Date: Wed, 16 Apr 2025 20:42:03 +0000
Message-ID: <20250416204204.8009-18-matchstick@neverthere.org>
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

