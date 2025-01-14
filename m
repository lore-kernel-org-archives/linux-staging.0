Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2621FA256
	for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 16:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736873667; cv=none; b=frLb+6uIjiM/E+H4ZF/ljoLfQb6nyWIQCkJo9zgLU/nohhaoEa1veutAxqStLmB21cKxaZsF/aPnmHxU0YxtSPysfk3NLRHu67OddaZ+PHOJH2TULX7p3D9puotySlWuSg2KS2UsYMQVbd//iqj4oMIcXjkSP+glkZIzfFa1Zgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736873667; c=relaxed/simple;
	bh=fv7VV+yGDdcKNZq/NRuMFgzCIGDrl6Myef6TMgc5mC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRyi7MipiaCKY0pYjzY4emELQEWK+Yho3m8n/PlhGVLTfudwf8GQcnT+4g/ioY2jpSzy0XIjOBCPcypVU6/8tLDarIvgLGE7PQKbyJJcLODmE+7S47IMz1CrDu7Cm+Y+1ssYTx4a/ciwDZwCIl6E1ozJtIc1ugfPw7tceLDt1UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSAZU9e9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSAZU9e9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43622267b2eso59785735e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 08:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736873663; x=1737478463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKxtdUb/cXgrIfHVWWlkiuhy6A7in5OGActCzYSUH9o=;
        b=iSAZU9e9xXBQ+3KrEasrV8GEzhRaklcmHCI4Xz+HKZKRFLFqmYwKRNATLV+1MHDzwi
         kZzsp6IHNuyYQoTXKjwtwNY6m5dRZzPClIvnBGCcrCts3MIBQ6o3BEfwEhheR7+nJ3ac
         ktDDe85t7YvXaBfFIt54Wg4H6iyy7zREa3rnicdFc8lDXG8kyWGfD7+pSyZr+BvR1UUX
         EPbPMKfEXw2EbdKBjWsb8YdWTOD161OeP41FGq4mtP/RcfEkl4dFP1UbhVFtTbhOawAI
         Ua/RX6VAWqKSyxEg3vIiuSNDkDO+DE9z2WYs74yrAtc3+f+mTKlN2NMGUayvATmAF2KW
         Ybwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873663; x=1737478463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKxtdUb/cXgrIfHVWWlkiuhy6A7in5OGActCzYSUH9o=;
        b=mIfY1EnNiU7HkN9JlD5HryxCUxlSwL8dtWUNyDhHiW4HtPNWFBILKe6WQ4jcaVakPK
         BBSfO63JnNPrKeTIIFoFNXZ2nDqX199sL2mYUjiNTf8vpHzaYbhE3VKUTVaRYIY8ZD39
         QQWKsKGf3B679IAAWleDbPMzgCTw7R62esC9AFFoA7RQiQXCvoxBvXihPrF0ZW6pvarq
         tnY/i9qNlYwRD6sJ05EEH4uLjjtyMHaBmi/0zrJu0SDrkuABoQPVUfNKMf+mDjXOV1B2
         Hh90LsshXIU3Jm/LIZ07LOVomQl9RGBYLqp0lpnQw52XIwuhNzgj7IfQc+AkXnGf//zf
         UEiw==
X-Forwarded-Encrypted: i=1; AJvYcCVMS0/FokeuTuiyJ2yYKgrPGLKNqgrmWJM+IHYz0tV4SXaUbe0pZUlEykrP/fL1MKw0mJ6hqCP5PpF9A2lL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9WoBIF/UvhsmxGzdX48vDMOrd7wL25/OdGGdqWFnT4wpkFZ8Y
	p28OraYJQ2pYI8zShs1TVfgsUk+ZZjRApunKJG/S+fWS6P/hxHQS
X-Gm-Gg: ASbGncuvHyd6gNo5+hNrZ9JKn1CvrmoCeaMP/qYRLcY7RY7m6olDT2qBNl74xyAJX64
	WKodgMjjJkAV1NtVPPYawRHbw0nzIFYmO1lHouPNteGyCnL4W1prCCfflC0FHwv0J+JLXYt8j2Y
	vYECKXDlWgqMzJm7SWJLFKnZWjiWyTJx0ZqzLkNknJZ5k61dua7EI2t9I235+A1QScIIdc7Lbuz
	j6ZJ6H/an0rNaTfE0uWWJYWRC0tZhAMkFe55/+nL0DvpXnyWT8V+FeKo+eQdQlRZ+d+naszakJv
	yw0N2AiZZyACcAnl
X-Google-Smtp-Source: AGHT+IHNNlWwCNRkFj3/gobGekOr/p7PqVWwRud7phxrhkbmHshASpA/cVN4a670kMbSs+kQSHQqcw==
X-Received: by 2002:a05:600c:3c94:b0:434:fd15:3ac9 with SMTP id 5b1f17b1804b1-436e26e2563mr205625445e9.22.1736873663355;
        Tue, 14 Jan 2025 08:54:23 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03e5fsm179930495e9.18.2025.01.14.08.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:54:22 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 4/4] staging: gpib: Use C99 syntax and make static
Date: Tue, 14 Jan 2025 17:54:03 +0100
Message-ID: <20250114165403.16410-5-dpenkler@gmail.com>
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

Some drivers were still using the old syntax for initializing
structs:
field : value;

This caused sparse to emit the following warning, for example:
common/gpib_os.c:2026:1: warning: obsolete struct initializer, use C99 syntax

Use C99 syntax:
.field = value;

Some local structs and arrays were not declared static causing
sparse to emit the following warning, for example:
warning: symbol 'ib_fops' was not declared. Should it be static?

Declare the local structs and arrays as static.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 .../gpib/agilent_82357a/agilent_82357a.c      |  2 +-
 drivers/staging/gpib/common/gpib_os.c         | 14 ++---
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  4 +-
 drivers/staging/gpib/ines/ines_gpib.c         | 58 +++++++++----------
 4 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index c22c6bb30776..34d85a1bdb37 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -19,7 +19,7 @@ MODULE_DESCRIPTION("GPIB driver for Agilent 82357A/B usb adapters");
 
 #define MAX_NUM_82357A_INTERFACES 128
 static struct usb_interface *agilent_82357a_driver_interfaces[MAX_NUM_82357A_INTERFACES];
-DEFINE_MUTEX(agilent_82357a_hotplug_lock); // protect board insertion and removal
+static DEFINE_MUTEX(agilent_82357a_hotplug_lock); // protect board insertion and removal
 
 static unsigned int agilent_82357a_update_status(gpib_board_t *board, unsigned int clear_mask);
 
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 3234d4348957..4901e660242e 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2023,13 +2023,13 @@ static int t1_delay_ioctl(gpib_board_t *board, unsigned long arg)
 	return 0;
 }
 
-const struct file_operations ib_fops = {
-owner: THIS_MODULE,
-llseek : NULL,
-unlocked_ioctl : &ibioctl,
-compat_ioctl : &ibioctl,
-open : &ibopen,
-release : &ibclose,
+static const struct file_operations ib_fops = {
+	.owner = THIS_MODULE,
+	.llseek = NULL,
+	.unlocked_ioctl = &ibioctl,
+	.compat_ioctl = &ibioctl,
+	.open = &ibopen,
+	.release = &ibclose,
 };
 
 gpib_board_t board_array[GPIB_MAX_NUM_BOARDS];
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 16e2d0c5642e..828c99ea613f 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -147,7 +147,7 @@ DEFINE_LED_TRIGGER(ledtrig_gpib);
 			led_trigger_event(ledtrig_gpib, LED_OFF); }	\
 	while (0)
 
-struct gpio_desc *all_descriptors[GPIB_PINS + SN7516X_PINS];
+static struct gpio_desc *all_descriptors[GPIB_PINS + SN7516X_PINS];
 
 #define D01 all_descriptors[0]
 #define D02 all_descriptors[1]
@@ -175,7 +175,7 @@ struct gpio_desc *all_descriptors[GPIB_PINS + SN7516X_PINS];
 /* YOGA dapter uses a global enable for the buffer chips, re-using the TE pin */
 #define YOGA_ENABLE TE
 
-int gpios_vector[] = {
+static int gpios_vector[] = {
 	D01_pin_nr,
 	D02_pin_nr,
 	D03_pin_nr,
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 846dafc85c11..22a05a287bce 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -357,38 +357,38 @@ struct ines_pci_id {
 	enum ines_pci_chip pci_chip_type;
 };
 
-struct ines_pci_id pci_ids[] = {
-	{vendor_id: PCI_VENDOR_ID_PLX,
-	 device_id : PCI_DEVICE_ID_PLX_9050,
-	 subsystem_vendor_id : PCI_VENDOR_ID_PLX,
-	 subsystem_device_id : PCI_SUBDEVICE_ID_INES_GPIB,
-	 gpib_region : 2,
-	 io_offset : 1,
-	 pci_chip_type : PCI_CHIP_PLX9050,
+static struct ines_pci_id pci_ids[] = {
+	{.vendor_id = PCI_VENDOR_ID_PLX,
+	 .device_id = PCI_DEVICE_ID_PLX_9050,
+	 .subsystem_vendor_id = PCI_VENDOR_ID_PLX,
+	 .subsystem_device_id = PCI_SUBDEVICE_ID_INES_GPIB,
+	 .gpib_region = 2,
+	 .io_offset = 1,
+	 .pci_chip_type = PCI_CHIP_PLX9050,
 	},
-	{vendor_id: PCI_VENDOR_ID_AMCC,
-	 device_id : PCI_DEVICE_ID_INES_GPIB_AMCC,
-	 subsystem_vendor_id : PCI_VENDOR_ID_AMCC,
-	 subsystem_device_id : PCI_SUBDEVICE_ID_INES_GPIB,
-	 gpib_region : 1,
-	 io_offset : 1,
-	 pci_chip_type : PCI_CHIP_AMCC5920,
+	{.vendor_id = PCI_VENDOR_ID_AMCC,
+	 .device_id = PCI_DEVICE_ID_INES_GPIB_AMCC,
+	 .subsystem_vendor_id = PCI_VENDOR_ID_AMCC,
+	 .subsystem_device_id = PCI_SUBDEVICE_ID_INES_GPIB,
+	 .gpib_region = 1,
+	 .io_offset = 1,
+	 .pci_chip_type = PCI_CHIP_AMCC5920,
 	},
-	{vendor_id: PCI_VENDOR_ID_INES_QUICKLOGIC,
-	 device_id : PCI_DEVICE_ID_INES_GPIB_QL5030,
-	 subsystem_vendor_id : PCI_VENDOR_ID_INES_QUICKLOGIC,
-	 subsystem_device_id : PCI_DEVICE_ID_INES_GPIB_QL5030,
-	 gpib_region : 1,
-	 io_offset : 1,
-	 pci_chip_type : PCI_CHIP_QUICKLOGIC5030,
+	{.vendor_id = PCI_VENDOR_ID_INES_QUICKLOGIC,
+	 .device_id = PCI_DEVICE_ID_INES_GPIB_QL5030,
+	 .subsystem_vendor_id = PCI_VENDOR_ID_INES_QUICKLOGIC,
+	 .subsystem_device_id = PCI_DEVICE_ID_INES_GPIB_QL5030,
+	 .gpib_region = 1,
+	 .io_offset = 1,
+	 .pci_chip_type = PCI_CHIP_QUICKLOGIC5030,
 	},
-	{vendor_id: PCI_VENDOR_ID_QUANCOM,
-	 device_id : PCI_DEVICE_ID_QUANCOM_GPIB,
-	 subsystem_vendor_id : -1,
-	 subsystem_device_id : -1,
-	 gpib_region : 0,
-	 io_offset : 4,
-	 pci_chip_type : PCI_CHIP_QUANCOM,
+	{.vendor_id = PCI_VENDOR_ID_QUANCOM,
+	 .device_id = PCI_DEVICE_ID_QUANCOM_GPIB,
+	 .subsystem_vendor_id = -1,
+	 .subsystem_device_id = -1,
+	 .gpib_region = 0,
+	 .io_offset = 4,
+	 .pci_chip_type = PCI_CHIP_QUANCOM,
 	},
 };
 
-- 
2.47.1

