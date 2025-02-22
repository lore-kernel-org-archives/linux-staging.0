Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4ED14F121
	for <linux-staging@lists.linux.dev>; Sat, 22 Feb 2025 20:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740257124; cv=none; b=VwZ06y73ee2V20rJEZzTXdhbuzos4yU+Ln0oUjGc6/q/0Z8oQcxZ1ypF/E/cXyN8F16gJkz2p54N44oH04qo5qiTW/XGO/trHupV59JIyjqk2CUv56rMNcXlnQT9EldtGNqrt11/Em7ULNX2qubbSEYOgbwKx0hvT4+Z+GNlq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740257124; c=relaxed/simple;
	bh=dGrVVFg7ISr/V8vZz+OTqtD0mPL1jaOQDzL5DVtlWOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aMgxz6Faqf7hU/nnpuC50WfBwd3jjlalMtgvwk/bAIMcmlPSQRKZy+esYfiWgS3OT3YUcqK7Zf8Jtz0BuFNeJUnvVfZU3spQ2JmwmCzWgUAhYrGcznfqZc8MTnyJKxn/QIRwpl4UZurtccHuOlV8IZ2zJ9Od1930Gg0BbIbCk+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z64c7l03; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z64c7l03"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4398738217aso28134485e9.3
        for <linux-staging@lists.linux.dev>; Sat, 22 Feb 2025 12:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740257121; x=1740861921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvT7dtWi6+ARu5un8G5FtK9nNIMwdG/GyzImr2AnEkc=;
        b=Z64c7l03OJcgP2xBFN3hioAPKqv+WmmQ7UWtFJ9PNQn5GD4/Y2brf9zf/jf2fqR5x2
         3xxoj9RqnHVHP2Uy/WrDMqfOyQXf06UyCgCe+/z0UDB18xK3CMqKZMPKSIAJopUk5dTM
         /YjwYRJhHw3BQxGcvfRkplfhnE1+FX3NkCq5P9sPKRpoD2Ygpo8gQZ8Fqbhw/PsQRDcm
         ysyZl0fxjgV/a49ogwX33EBn2Q8hUu7/fCiQdCw3OsfCBTE6ISwDWqSM8lCc29f2ekoo
         jg1FRZMMW5/rh7Ujw2yfezZujJdXYMWlqK9AumHe1sAPxJ9XLvREU7ATLsfCudpyJVU8
         syPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740257121; x=1740861921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvT7dtWi6+ARu5un8G5FtK9nNIMwdG/GyzImr2AnEkc=;
        b=FXh4st2pZnmhk3ykuOHsFiqWe45HV4lO+XkTvPKia4r7bNV9aHxYNxojIiGg0u4NYc
         myLxz7u1kqXGUad1lwe7YAisHkAS/pGJ+mTE3tb9+rgAJxVmLsBdJGcH3+hi8IWtVJcD
         ogm0V5kH9M+HklwNHIfHV6yKOh2WyJIKq7BZZqUjNl6oG7IiX6uZWLEV/HxTIG57cBZz
         INmYqiE0p4AtaCmLKebYOrKN0rJMb95WZFoU/zHv9pQq/GC7Qd/rXySe5anMXxSlHE75
         p4l01jwYAcVUHypxs7QaYkPxxX6kJwQ9X0OM1UvBAgQFBcc9R1y+DmgFLv1qKI4nTPeF
         XhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4FasMaMUZnpVVhYttu7LtD+PhyuCgr5gkGc1xRsJD0bzRU/mkj8FrcCG3lRnyilJTveJOUwIR9bcW7k8f@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7Ub8CyuEsRhK4wxYo8fb7X6UbLKHUsDZDanLmYkaU+PozuleZ
	kzpArekjrQCKuTWyjnQO9moIQDzoX4n4Se1BZOWpAwb6d0sDlDO2
X-Gm-Gg: ASbGncv62A64tv9g0ZJFCCgbdDFOiApAEyTFRwqQQFIpIB0kOhUqavB5G8PVKAoPGr7
	JeGlf/EmDDF9SP4aaPahTakwglrl26iOP/bsQ5SiWD5lBMPs1/swyz46YTTUHUeJpF5OkFpRNb+
	LtNvx1doW68GCB326FSwt3sw4+b9RBRL0AZht6Vd9pQSvS8BT3cy3HK5cdjLRAWOnBXc/6Wu0aC
	LieKHZ3E/0StuHMCPBghWY6ZmrH5KyYITKn+6/9y9H9GE5M1XcwGWuedsB3HL67zz1XwHNGe6+q
	HckBsZuZ1xQ8pgnTNQIEgcOF+RjffH20/0LqpDcW9gRyGHI73b1Zb0+ZU9oMVw==
X-Google-Smtp-Source: AGHT+IFg72/wH8hwyMZUIc/PuFZTgmxKlENVWdLU/TRzypJUgaSDKiqcUJeVbRCZRqLcyAMVXFnbJg==
X-Received: by 2002:a05:600c:5101:b0:439:65f0:c9ce with SMTP id 5b1f17b1804b1-439ae220a84mr56715795e9.25.1740257121120;
        Sat, 22 Feb 2025 12:45:21 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b031c5casm56553085e9.39.2025.02.22.12.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 12:45:19 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix Oops after disconnect in agilent usb
Date: Sat, 22 Feb 2025 21:45:15 +0100
Message-ID: <20250222204515.5104-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the agilent usb dongle is disconnected subsequent calls to the
driver cause a NULL dereference Oops as the bus_interface
is set to NULL on disconnect.

This problem was introduced by setting usb_dev from the bus_interface
for dev_xxx messages.

Previously bus_interface was checked for NULL only in the functions
directly calling usb_fill_bulk_urb or usb_control_msg.

Check for valid bus_interface on all interface entry points
and return -ENODEV if it is NULL.

Fixes: fbae7090f30c ("staging: gpib: Update messaging and usb_device refs in agilent_usb")

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 .../gpib/agilent_82357a/agilent_82357a.c      | 65 ++++++++++++++++---
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 7ebebe00dc48..e0d36f0dff25 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -427,7 +427,7 @@ static int agilent_82357a_read(gpib_board_t *board, uint8_t *buffer, size_t leng
 {
 	int retval;
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	u8 *out_data, *in_data;
 	int out_data_length, in_data_length;
 	int bytes_written, bytes_read;
@@ -438,6 +438,10 @@ static int agilent_82357a_read(gpib_board_t *board, uint8_t *buffer, size_t leng
 
 	*nbytes = 0;
 	*end = 0;
+
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	out_data_length = 0x9;
 	out_data = kmalloc(out_data_length, GFP_KERNEL);
 	if (!out_data)
@@ -534,7 +538,7 @@ static ssize_t agilent_82357a_generic_write(gpib_board_t *board, uint8_t *buffer
 {
 	int retval;
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	u8 *out_data = NULL;
 	u8 *status_data = NULL;
 	int out_data_length;
@@ -545,6 +549,10 @@ static ssize_t agilent_82357a_generic_write(gpib_board_t *board, uint8_t *buffer
 	struct agilent_82357a_register_pairlet read_reg;
 
 	*bytes_written = 0;
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	out_data_length = length + 0x8;
 	out_data = kmalloc(out_data_length, GFP_KERNEL);
 	if (!out_data)
@@ -697,9 +705,13 @@ int agilent_82357a_take_control_internal(gpib_board_t *board, int synchronous)
 
 static int agilent_82357a_take_control(gpib_board_t *board, int synchronous)
 {
+	struct agilent_82357a_priv *a_priv = board->private_data;
 	const int timeout = 10;
 	int i;
 
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+
 /* It looks like the 9914 does not handle tcs properly.
  *  See comment above tms9914_take_control_workaround() in
  *  drivers/gpib/tms9914/tms9914_aux.c
@@ -723,10 +735,14 @@ static int agilent_82357a_take_control(gpib_board_t *board, int synchronous)
 static int agilent_82357a_go_to_standby(gpib_board_t *board)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet write;
 	int retval;
 
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	write.address = AUXCR;
 	write.value = AUX_GTS;
 	retval = agilent_82357a_write_registers(a_priv, &write, 1);
@@ -739,11 +755,15 @@ static int agilent_82357a_go_to_standby(gpib_board_t *board)
 static void agilent_82357a_request_system_control(gpib_board_t *board, int request_control)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet writes[2];
 	int retval;
 	int i = 0;
 
+	if (!a_priv->bus_interface)
+		return; // -ENODEV;
+
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	/* 82357B needs bit to be set in 9914 AUXCR register */
 	writes[i].address = AUXCR;
 	if (request_control) {
@@ -767,10 +787,14 @@ static void agilent_82357a_request_system_control(gpib_board_t *board, int reque
 static void agilent_82357a_interface_clear(gpib_board_t *board, int assert)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet write;
 	int retval;
 
+	if (!a_priv->bus_interface)
+		return; // -ENODEV;
+
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	write.address = AUXCR;
 	write.value = AUX_SIC;
 	if (assert) {
@@ -785,10 +809,14 @@ static void agilent_82357a_interface_clear(gpib_board_t *board, int assert)
 static void agilent_82357a_remote_enable(gpib_board_t *board, int enable)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet write;
 	int retval;
 
+	if (!a_priv->bus_interface)
+		return; //-ENODEV;
+
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	write.address = AUXCR;
 	write.value = AUX_SRE;
 	if (enable)
@@ -804,6 +832,8 @@ static int agilent_82357a_enable_eos(gpib_board_t *board, uint8_t eos_byte, int
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
 
+	if (!a_priv->bus_interface)
+		return -ENODEV;
 	if (compare_8_bits == 0)
 		return -EOPNOTSUPP;
 
@@ -822,10 +852,13 @@ static void agilent_82357a_disable_eos(gpib_board_t *board)
 static unsigned int agilent_82357a_update_status(gpib_board_t *board, unsigned int clear_mask)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet address_status, bus_status;
 	int retval;
 
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	board->status &= ~clear_mask;
 	if (a_priv->is_cic)
 		set_bit(CIC_NUM, &board->status);
@@ -885,6 +918,9 @@ static int agilent_82357a_primary_address(gpib_board_t *board, unsigned int addr
 	struct agilent_82357a_register_pairlet write;
 	int retval;
 
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	// put primary address in address0
 	write.address = ADR;
 	write.value = address & ADDRESS_MASK;
@@ -906,11 +942,14 @@ static int agilent_82357a_secondary_address(gpib_board_t *board, unsigned int ad
 static int agilent_82357a_parallel_poll(gpib_board_t *board, uint8_t *result)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet writes[2];
 	struct agilent_82357a_register_pairlet read;
 	int retval;
 
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	// execute parallel poll
 	writes[0].address = AUXCR;
 	writes[0].value = AUX_CS | AUX_RPP;
@@ -975,11 +1014,14 @@ static void agilent_82357a_return_to_local(gpib_board_t *board)
 static int agilent_82357a_line_status(const gpib_board_t *board)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet bus_status;
 	int retval;
 	int status = ValidALL;
 
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	bus_status.address = BSR;
 	retval = agilent_82357a_read_registers(a_priv, &bus_status, 1, 0);
 	if (retval) {
@@ -1025,10 +1067,13 @@ static unsigned short nanosec_to_fast_talker_bits(unsigned int *nanosec)
 static unsigned int agilent_82357a_t1_delay(gpib_board_t *board, unsigned int nanosec)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet write;
 	int retval;
 
+	if (!a_priv->bus_interface)
+		return -ENODEV;
+	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	write.address = FAST_TALKER_T1;
 	write.value = nanosec_to_fast_talker_bits(&nanosec);
 	retval = agilent_82357a_write_registers(a_priv, &write, 1);
-- 
2.48.1

