Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99FA238C2E
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836134; cv=none; b=GtFVxG1Pu4dzQryrooK5HTp9TJvlcJIOocpG1QuD0wvYQqNPn+fVubszTGu0j4XoL8wIHhwZXWJV9eeVWFJEh0iyIgTfVR/HDOKHc0ihG85KqF7xs4GKHH/qG3ES32H56uNK2TJSlapfQou7CFSkHMcVIR2sY5xyzbJTv7lFYu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836134; c=relaxed/simple;
	bh=pZUC4ylofhNxwo4hjzJ3ORj5g9m8tUYOPnTEG2mtgeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSUit58RygWE8jzQdBoLhwOQuUk4KVKup+xD5YuHjL7DtDvAu4Sdl/SQWfSDEpZWKGUdb8b6a0x/xX0l13uoVcGuQqBH3yWr91a/3TtPjr0yfl7UcoqAkEuxWlGvx8IdvMIQtTgyem+C8ApbTBQcIY+Ggt1m3/Fy80FEOi200xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=QlJeaLJ+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="QlJeaLJ+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2279915e06eso1194395ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836132; x=1745440932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oZK0xozCaFDbvJQEqimY0ELWSNsTb2XtNTRfDwp9c0=;
        b=QlJeaLJ+UFEmJRFt19Ga3SK35gN3CiRC0DKMWRvGctPIvZ/1YxxAcF5QpHS/060SCa
         35hv3AuPeMw7bL/M6HiKeuEBmZ7Y9sSIqni+14oEDuEnjErq+azL6zkXli4v0aqMCNDY
         gD9yUOFfx9/mUGlErEe3GpC3kc/iwMX7lY29c/med2I8KOrvzs5be/BwBRrWZ2Njkfar
         /w6HPzmYvwHOrESK30oduLp+aXRaxX+wqcDLTdDHm9MWGEj/PktOq/9Pzli+Wtd3Vsnk
         cs6OTul4CN6VRTnvQaV+KZfpfsyMFhAjqaDDWcK3VpOCZGLIpE7/pSic3wuWQG0QkAF4
         rotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836132; x=1745440932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oZK0xozCaFDbvJQEqimY0ELWSNsTb2XtNTRfDwp9c0=;
        b=BLg8oSZW3fDwbQyd4zneGLl18Ke4wGk+zbM6WQbAalEODSUwz6/qBVzowz/mMZ32lU
         8+ta1DHQ4CpWRE8HJRQbNPCNcVbeSZYr767ilZzp8LgKtMzGjhP+q/bqQmA67IH9XSvz
         8fMQp/Ot7bI8aya/0pEID5K2FPCWZZi/bsnlwXUnb+CyUh99RoxLkRNA1ZuhEw87ay+z
         vb6OlRn7DnUI86SBhYrdmZelBEr5xTY8naSb35ZrnR/bJEl7atDYcJx7jaR9EvtcN5kZ
         MoimbGqo/jS8CMK1C/uOAsDu2+AS/ZD3ApHwDAqlYnCDoZiBpO3FhVCqBOz0cuBvrIV5
         1nsQ==
X-Gm-Message-State: AOJu0YyFn3mSSKyrEpYcgcIkz8WZStOlMsRoK9jSTw4U6MdO8LAnxQOH
	HfORDsf95ZEquIPi54SaJtTlMIcgosDcbusOHXSSgZ/9As2xyROssmUmhGNrRQ==
X-Gm-Gg: ASbGncsAr296YrMPoeitxRZ0k0MtVd0b5XaWHc3h0Yzq17uU9fIQaggTMCIgBYiHzAg
	/+nfDbIU7YPLNAadfZNW06SO1WpKGjjOTVWcKy7N/RPNN+T2/1QMuuB6tcbHxtU4vs+oLmBzrdf
	vfUEulURxzIqtp+0DibAzysa7CyVzAETIaeQBqMLM2+0EHktPZbqPk8FBtFBzOKJHLblSseuqlk
	1OqtfJlg9Jd9pW7JxK5ij4CymG/DDhh/fKXpAcl2RQ2rdwUbDN9dEKuLpzKMA4yeWQHqbb6Hqfz
	lR5ybrcBEwRl2K4t6d0/4mn4wug1Py71AYy0XwA8DlRwRKi1blQk7euPLh0UbofgeBw2hg7P2BH
	ADAe3DA==
X-Google-Smtp-Source: AGHT+IH2QjEiF8BA9vRwv8cVExSmGxjUbazbC7L/d/yd17lt7vit8Gv45ZGPWCg39eE4HwM6SNwDSQ==
X-Received: by 2002:a17:903:3202:b0:21f:988d:5756 with SMTP id d9443c01a7336-22c3596b8d1mr54714755ad.42.1744836132166;
        Wed, 16 Apr 2025 13:42:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe6894sm18836745ad.215.2025.04.16.13.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:11 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 04/18] staging: gpib: cb7210: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:50 +0000
Message-ID: <20250416204204.8009-5-matchstick@neverthere.org>
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
 drivers/staging/gpib/cb7210/cb7210.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index b15ffc777c39..54c037aabc26 100644
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
@@ -1334,7 +1334,7 @@ static void cb_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&cb_gpib_cs_driver);
 }
 
-static gpib_interface_t cb_pcmcia_unaccel_interface = {
+static struct gpib_interface cb_pcmcia_unaccel_interface = {
 	.name = "cbi_pcmcia_unaccel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1362,7 +1362,7 @@ static gpib_interface_t cb_pcmcia_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_interface = {
+static struct gpib_interface cb_pcmcia_interface = {
 	.name = "cbi_pcmcia",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1390,7 +1390,7 @@ static gpib_interface_t cb_pcmcia_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_accel_interface = {
+static struct gpib_interface cb_pcmcia_accel_interface = {
 	.name = "cbi_pcmcia_accel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
-- 
2.43.0

