Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3DA2550D5
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151116; cv=none; b=SZ+XRirfWR7b6BsKuMue8siJJvqcpuHBtpDKGSYvmzLLFW8eNarfKdZu17WYy1+HCGnHKrjzFlLEaNgDCt9g+s3+n2awQHci/o9ABh6CnA6OhvpQOybTZeZNmqDKVfVTfCDMlkGuTS/OPCju8I0edh1lZSMO6rYTFrz+zgASxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151116; c=relaxed/simple;
	bh=O5+RhG5ge74kMkJH0h6KdnV7xnNERQlJFnrKnXJqKg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfjgDkruDovQnEStQ0yOVlkCdS+62q+QFXOKY4F4bgCKpLttGmwowk9I2kCdh/EXM1liFBl/y+QdAq+5dnHqEWNmRBhOu6f0ttfC7yBXUgIsQDrB9jvl3SCFfKrjBpJYLZ+BgD7MGHL19aRZZHceT9YjsHfM4XZRR1b/s6Sp5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=CKpZRDF6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="CKpZRDF6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22548a28d0cso87005035ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151114; x=1744755914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFx9w/yMhxB8IB6NL0DBl9+YzkxzqjDcwxAFXBMcOfU=;
        b=CKpZRDF6iE0twrNWppYXgaldjRRpAfh7UxpdSOXZEIwHuyramXR6I7zupvEZx+aiJh
         vO9hhzP7JVsRithw1M9Iciz52Dxg3DlKDE78KRZmqEJeTXhxOI21qFq4RYlIplCZBBPh
         73ezJeqQH+SUXV8rNNzKQ/WFAlb55byxzz476O2XTRfE3IuHHtRCxZkMMH4cgHsYl4E9
         xU+rsxHta18eMG75UmV9g4Evv6998z/Vp8xDjxqoCbElAAAOgGudO1NF0H5zfckQ/Tl5
         MVzQPBcI2zsIs+wVk2Yr/LjbkuNcZeadUwzagzj88GgeF8ImeWtl47O2zPDvLeCMemnQ
         ncbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151114; x=1744755914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFx9w/yMhxB8IB6NL0DBl9+YzkxzqjDcwxAFXBMcOfU=;
        b=YbPvBl3ZLMQHN46ebRUtT9pIQR1sj4X2oy6HH9ZbVag1zMn/fn51X80VxFObULhOOO
         A69derpiRkpm/9tPxRdHy1wG06r5Ks31Iu68MKB1osTQv9rAMQlPeg5sgq0E+za4MHGD
         39TMahVQ6gTCQmLIiaYixmXPW2mGmu1zy/54pyrXyuxmzHkx+jdUZyFIPW+eP11IrZ6S
         mKPV8sbQd1E8MXcD0sL7CamlzVomsm+3kTM5DDin9WoW3Ed1t3lPa5NUN5QqN5eP8CCu
         CpEATzsG5shbJSwriFVR6DUyCE34M3ETS8ZI0q//qW+mnOi/CXMvPA7woCEUgkDqRNg+
         nr5g==
X-Forwarded-Encrypted: i=1; AJvYcCXvtQzzk2mg+tTJV9+355Lw3EtrsytogLKe7pbeLCrmiCKIPwH/wejeNcmTkn6z9K+cLGjzcdh1A5IfMnoq@lists.linux.dev
X-Gm-Message-State: AOJu0YzYRardL3riReh/dHo6oDfxPA/ZKqxwOcmKCRZfP8hpYuYmsRlg
	faTXMIyw4Ad2bJzMtKfOPtmTpa4s7UwnYGUlBsM1RvFhmjYplho7zCdbRudEaw==
X-Gm-Gg: ASbGncsUIudXfIenDKRhV/MziH4VSzYOKRDNCWuq+v5Ou3gaU0sOrgNH+BwYwg8nsEc
	AZ0AjVmXqRhxSpGb+uETVSkdd13+N4j02qFq5/cuPkKzQEQuYtotc/kYoFPbjz/9xAuE7IBhucI
	S93jPTJN6HyDhh+1Ml8yZKp09X+a8VuHFr6PFBM/bVjVR2ARahye4nj65pJbATLVdmkUEcNquh+
	0keESjDk/MgAfNJCZnIehshje/300GzbASHe5Lrkl3R+kPuTjWDoPOivp1kvJxJOSO9vLvYa9iH
	mNKye7vLuwuH/7CRaoYO5YWNB/KjBqCiW/Fj2StDQ4lm0/50RpwqplarnjbIbXDPB08dOeX7sKT
	FOkIzVKwLSA==
X-Google-Smtp-Source: AGHT+IHybuhz2+2wE/bIEAPIYc3Trj44vmkOCDCJUldt1nC/a5V165jljjhXhyKbx8BpNV7FK79R+A==
X-Received: by 2002:a17:903:2ecb:b0:223:faf3:b9c2 with SMTP id d9443c01a7336-22ac29b051cmr13402905ad.27.1744151113816;
        Tue, 08 Apr 2025 15:25:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea09a5sm11572355b3a.107.2025.04.08.15.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 04/18] staging: gpib: cb7210: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:50 +0000
Message-ID: <20250408222504.186992-5-matchstick@neverthere.org>
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
 drivers/staging/gpib/cb7210/cb7210.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 6b22a33a8c4f..20cea66d6557 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -686,7 +686,7 @@ static void cb7210_return_to_local(struct gpib_board *board)
 	write_byte(nec_priv, AUX_RTL, AUXMR);
 }
 
-static gpib_interface_t cb_pci_unaccel_interface = {
+static struct gpib_interface cb_pci_unaccel_interface = {
 	.name = "cbi_pci_unaccel",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -714,7 +714,7 @@ static gpib_interface_t cb_pci_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pci_accel_interface = {
+static struct gpib_interface cb_pci_accel_interface = {
 	.name = "cbi_pci_accel",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -742,7 +742,7 @@ static gpib_interface_t cb_pci_accel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pci_interface = {
+static struct gpib_interface cb_pci_interface = {
 	.name = "cbi_pci",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -769,7 +769,7 @@ static gpib_interface_t cb_pci_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_unaccel_interface = {
+static struct gpib_interface cb_isa_unaccel_interface = {
 	.name = "cbi_isa_unaccel",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -797,7 +797,7 @@ static gpib_interface_t cb_isa_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_interface = {
+static struct gpib_interface cb_isa_interface = {
 	.name = "cbi_isa",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -824,7 +824,7 @@ static gpib_interface_t cb_isa_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_accel_interface = {
+static struct gpib_interface cb_isa_accel_interface = {
 	.name = "cbi_isa_accel",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -1333,7 +1333,7 @@ static void cb_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&cb_gpib_cs_driver);
 }
 
-static gpib_interface_t cb_pcmcia_unaccel_interface = {
+static struct gpib_interface cb_pcmcia_unaccel_interface = {
 	.name = "cbi_pcmcia_unaccel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1361,7 +1361,7 @@ static gpib_interface_t cb_pcmcia_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_interface = {
+static struct gpib_interface cb_pcmcia_interface = {
 	.name = "cbi_pcmcia",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1389,7 +1389,7 @@ static gpib_interface_t cb_pcmcia_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_accel_interface = {
+static struct gpib_interface cb_pcmcia_accel_interface = {
 	.name = "cbi_pcmcia_accel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
-- 
2.43.0

