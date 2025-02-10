Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A0222575
	for <linux-staging@lists.linux.dev>; Mon, 10 Feb 2025 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200236; cv=none; b=Oe/jnafZSiQpGguOhUckjPVnnon6vE1M47ebk7DsLTWV70bKQV+2I9aYkHpPXlxFPFWn3tLrmLMffJnnXkE1v1+JncCw/HceQTAc30ver9DIJNBRrYl8TvmQAOif+oZ7vmBirx7c2sQiZiYXA5c/fye29QRbxevCYg9JqDylBgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200236; c=relaxed/simple;
	bh=f1cUq1UU1acaXrytvJEwuasE5bEnYhx5cwjqMWLkEMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwODmq5dB8YqxlZNszF44Tzo0DjiLjqMC6s+UDJOi+2p8oiMNcRU95H66q8GtAkgDLz8xHg3XN72Ad1KvYlZ5fmenK6PW3YHGvuFrqrdBtj9Tv9lwo+YbK2aEFY/6VkOIAsWyAbJ36XEckrxWKA4WcPBWyYAIq9ebXDDpXcZt2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcpYx4s8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcpYx4s8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dc8b5bb0bso1843740f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Feb 2025 07:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200232; x=1739805032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl2nJlOCFZTAIC1OoXJAI/OcnqLnmeZQqMPsY2a6JMo=;
        b=WcpYx4s8vgAMN+X3cUZeG9ylvff/0t8a+DkuTC8b4IZYCcwFWZdhEjn+3PvjyuxjnF
         EPrl9lEV3ye1pP6a/SYtKGkVBLINP5Dp/B8PZWN06KK+L+M3G5y6kEf+jW8NYxeNb12a
         qML1eqShCukQRN8MMmWEuA988GmFoPtwg/igBfDeKNrCAKoxdXwGEK0Am8jPj9bE2c78
         i/rJC+Pi9XBnrZJ6JrVDzXrF4CeMUsJXg/Cub+c7qcRYwZ8FDwfXZOZPqUIt/N95Iw/z
         ysDqUkbkxZMNO5TBBk+zQUpL4EiQA9TU8crC0DR3o3w4jAdyx5SLJigrekGHMrE/q/pe
         MaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200232; x=1739805032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl2nJlOCFZTAIC1OoXJAI/OcnqLnmeZQqMPsY2a6JMo=;
        b=KVM+Ha9qmfwrFQ1CwwJqt0qy9pGgqaoygR3Jd3WnAqwVt234kc/Chv1oPeLwQkzYLE
         EDshE4cm//OPaQUynm5cNX/h01ZjE6H64nqBdTH9n1CtjfgnQP8CrcKKUALAcCqejVXg
         Mm83XXUyxJWR6izDKZz0hQ9R8ZaOjwTMGMibm/0oaNJtJ5otvyaWJuET1VH4p4uw0KhB
         rd8kZpRpwdeUBhRISAkLzaS/5JK82ejt77X2P238cP+Ou1njSGwdT/lXrbIf+WUE1adE
         SDxMJITWFL1wyOMqzqRMRl29/0Qzub4W57ZnIn2PkdmK8/yERbd13WtCOHIu2NgLWzzZ
         uo0A==
X-Forwarded-Encrypted: i=1; AJvYcCWaSsgqSZGnDrgF4bXusWE+GLmQQ7SJnZdst8uxUIRHm8sT70yNeDmuoN5CvDAnDgQU1g6aRQ7OpCvfa9Rr@lists.linux.dev
X-Gm-Message-State: AOJu0YwppIR5ZuwneA164teuTHddqTI0PQOo99VdtYp5qUe43LEOdaWC
	nVoOie5zgSdxhA4Be3WDwat6/G1DgeSm5hxxd2m7meQWLRFz4/zO
X-Gm-Gg: ASbGncsDIB2rzKZ8MewQ+1P1Pe72V8jCVdZeV2jpKGAeMGxNY0r5dH5eTvWgCRyc0Mw
	QYti9W6fxHsZFVuaELv7EDMAPSH+4OBf6mGSioXLHtO20S1QlSqLQv5pxQcup1k8afWjBdiv1pe
	kS+AJfHdIFnF9kcHP9rWP7Z2Ok+nOPtzJ0ZCsw3oN4cJV3KnkJfDd8pDRRgc+n4df7QddN5Cjxt
	TadoTRwybm21SaN0m4jZ9mOwxGFqwJmdvkms0UQFcsxlxi3uLED1cgT2m/pY+G+/BmbmOJyAOdY
	+u071gsP5blfUbRpdiPSLobDzeo4EnUK2i+6p8PAh/OYI4kMqos=
X-Google-Smtp-Source: AGHT+IEHu5etgn+A71oVAkdO4/2R9sTH3Y7763cMKXHK3U/jOMtFLHoAyQ/xNkUp4HQgu48VhWZ9CQ==
X-Received: by 2002:a5d:5f4a:0:b0:38d:cfff:c0d9 with SMTP id ffacd0b85a97d-38dcfffc217mr9125602f8f.39.1739200232299;
        Mon, 10 Feb 2025 07:10:32 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8881sm146834645e9.28.2025.02.10.07.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:10:30 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/2] staging;gpib: Use Kconfig PCMCIA compilation symbol
Date: Mon, 10 Feb 2025 16:10:21 +0100
Message-ID: <20250210151022.4358-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151022.4358-1-dpenkler@gmail.com>
References: <20250210151022.4358-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drivers supporting the PCMCIA bus were using an intermediate
symbol GPIB_PCMCIA for compiling optional PCMCIA support.
This symbol is no longer needed for the in-tree drivers as the
Kconfig symbol is available.

Use the Kconfig symbol CONFIG_GPIB_PCMCIA directly for conditional
compilation of PCMCIA support.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c        | 10 +++++-----
 drivers/staging/gpib/ines/ines_gpib.c       |  8 ++++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 12 ++++++------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 381c508f62eb..7785d674f397 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1111,7 +1111,7 @@ static struct pci_driver cb7210_pci_driver = {
  *  pcmcia skeleton example (presumably David Hinds)
  ***************************************************************************/
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
@@ -1501,7 +1501,7 @@ static void cb_pcmcia_detach(gpib_board_t *board)
 	cb7210_generic_detach(board);
 }
 
-#endif /* GPIB_PCMCIA */
+#endif /* CONFIG_GPIB_PCMCIA */
 
 static int __init cb7210_init_module(void)
 {
@@ -1549,7 +1549,7 @@ static int __init cb7210_init_module(void)
 		goto err_isa_unaccel;
 	}
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	ret = gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
 	if (ret) {
 		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
@@ -1577,7 +1577,7 @@ static int __init cb7210_init_module(void)
 
 	return 0;
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 err_pcmcia_driver:
 	gpib_unregister_driver(&cb_pcmcia_unaccel_interface);
 err_pcmcia_unaccel:
@@ -1611,7 +1611,7 @@ static void __exit cb7210_exit_module(void)
 	gpib_unregister_driver(&cb_pci_unaccel_interface);
 	gpib_unregister_driver(&cb_isa_accel_interface);
 	gpib_unregister_driver(&cb_isa_unaccel_interface);
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	gpib_unregister_driver(&cb_pcmcia_interface);
 	gpib_unregister_driver(&cb_pcmcia_accel_interface);
 	gpib_unregister_driver(&cb_pcmcia_unaccel_interface);
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 22a05a287bce..73dafbe68acb 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -977,7 +977,7 @@ static struct pci_driver ines_pci_driver = {
 	.probe = &ines_pci_probe
 };
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
@@ -1410,7 +1410,7 @@ void ines_pcmcia_detach(gpib_board_t *board)
 	ines_free_private(board);
 }
 
-#endif /* GPIB_PCMCIA */
+#endif /* CONFIG_GPIB_PCMCIA */
 
 static int __init ines_init_module(void)
 {
@@ -1446,7 +1446,7 @@ static int __init ines_init_module(void)
 		goto err_isa;
 	}
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	ret = gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
 	if (ret) {
 		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
@@ -1474,7 +1474,7 @@ static int __init ines_init_module(void)
 
 	return 0;
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 err_pcmcia_driver:
 	gpib_unregister_driver(&ines_pcmcia_accel_interface);
 err_pcmcia_accel:
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 2e1c3cbebaca..3118fe7613f6 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1396,7 +1396,7 @@ static const struct pnp_device_id tnt4882_pnp_table[] = {
 };
 MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 static gpib_interface_t ni_pcmcia_interface;
 static gpib_interface_t ni_pcmcia_accel_interface;
 static int __init init_ni_gpib_cs(void);
@@ -1461,7 +1461,7 @@ static int __init tnt4882_init_module(void)
 		goto err_pci_accel;
 	}
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	result = gpib_register_driver(&ni_pcmcia_interface, THIS_MODULE);
 	if (result) {
 		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
@@ -1486,7 +1486,7 @@ static int __init tnt4882_init_module(void)
 
 	return 0;
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 err_pcmcia_driver:
 	gpib_unregister_driver(&ni_pcmcia_accel_interface);
 err_pcmcia_accel:
@@ -1524,7 +1524,7 @@ static void __exit tnt4882_exit_module(void)
 	gpib_unregister_driver(&ni_nec_isa_accel_interface);
 	gpib_unregister_driver(&ni_pci_interface);
 	gpib_unregister_driver(&ni_pci_accel_interface);
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	gpib_unregister_driver(&ni_pcmcia_interface);
 	gpib_unregister_driver(&ni_pcmcia_accel_interface);
 	exit_ni_gpib_cs();
@@ -1535,7 +1535,7 @@ static void __exit tnt4882_exit_module(void)
 	pci_unregister_driver(&tnt4882_pci_driver);
 }
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
@@ -1889,7 +1889,7 @@ static gpib_interface_t ni_pcmcia_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-#endif	// GPIB_PCMCIA
+#endif	// CONFIG_GPIB_PCMCIA
 
 module_init(tnt4882_init_module);
 module_exit(tnt4882_exit_module);
-- 
2.48.1

