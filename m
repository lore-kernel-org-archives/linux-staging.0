Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AAD1D5CD1
	for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 16:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736873663; cv=none; b=rYnsRbP4D+Uh7GxpyWosljtINA0pV39Qs28WdxTssodAAMwd5vpi7X4S3qzuQxijGgq5Jgr6F0EfhM0zZFdUWS/jdkgFwotIf9xP7zFbQUoBPYTYncNbHfBL2Y3jy9lJXFYzzn4utBzh0Du60TxTs4wiS3fCddJiI+CfbP+w7mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736873663; c=relaxed/simple;
	bh=Be+bhLKy0crE6GQjdraRet5wldeI7lbH2MQYS0Ehcks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMKwnHxrujzrcP0pxcwItK711WbupH1R7+pk1uFXnRv7u5m/gOjZxuWTePhcBFW3Z5GYLSItM2uouxOkB74FOcF2b8Rn+AlI9/NsIhTNWuxHAuRZLmedkjPT3AClawmlfykgS6hcvPlcq2u1LCogsyFGkfUaMRVonPqe1hTshfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cxo0HNJ4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cxo0HNJ4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so65666075e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 08:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736873659; x=1737478459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJeBiGNKF3n1GikbnwHTwsdqGW+BvczoYjInXjW5HTE=;
        b=Cxo0HNJ4DQpNqp9JPwDVOW3otbH/0ZH1U/RTdp9oJ+kcd3iIxqbbNceWmZFLCwfBLd
         uADZd0zWqBRC6+rmCXdRCTCgc831CKTlpiH42njaVTZXUDL2Jg4TA4uPZnEb3Xcw3Bof
         qjem4k9YiADElgpP00Gs016V7SuuMNWDJGSmNZ2qNjZiPBDbMFKMstQWg/0mY99QLxpL
         M65s+PbncPo3Krb7aI8JR9WnNRUH4grGaAZPlegGrl7R6bSJ3XkVtGkE6Xtcr7KiQkyV
         JgUSuFbZQewabgBfAg9Vj5lllNDb7NURDSTZSVP26bBP89lcNSBic9IEU2961Jee+87R
         vucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873659; x=1737478459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJeBiGNKF3n1GikbnwHTwsdqGW+BvczoYjInXjW5HTE=;
        b=E9ArT9pd7KZ9s0oYqj8w2KJDsS/HRXjYGbdBhn6s3c3XUI58txn9PsmZ7Ry4E8IM1b
         xxjblPE19OB8KT0mbvayi+OD+YZfm4hxxOeEVteuw8uXVoV8CLOFsWFCz6DNqeoM1eYK
         NZIFN6TyDRjO+FSPkrk4y6Yo2Bb9cBRSzPJnV1C9kUTfKfjFsqWKe/X3B1Ov++6XTMZP
         OfIYQqGfKVq6t2EK28q+TO0NlanAb1WE4gkWKKRZJ7fxnIYFm+x2zafACFk4IIvvLVuf
         O2j12ZRuEIMqcYamHrcD0xxSfRh8tDUOED4RIK7e48LlIHU9J412yqpTdbuz/KBdajqk
         qQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCWZaJmyuFHXB00U5VXCRi36v8LfQXkjZ3dckjzd/20jciCz2mI3zFzPjXEomCx1mYJawz+eijFgh2nvfK6v@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4aKI6ac3gyE8KyHFosYIt/qIbLyDVxFIoEa+P5LQeSS1MHGKj
	XQ/hYOGD6FBGFjaIxCgEQQLzMCdvXvKfAf6IkhhPpWJ/Yxb8ai0n
X-Gm-Gg: ASbGncvGFy9iWx07hIWai1M+1vBer5nVfDnaNqwFlfr8bjK/LEdV4N8chVRnGumRRhr
	d/VNcsaWC4GH4Sw2WGWRCEno2Fc9H9SJN1jNIloSsbGrU1gUH2fvcOJt50MpYQRCSewOpNo6IUE
	tMOP/4kpmm63n5CfO9hCUeSImNmP/4z338ZD8bDtb7CWFI6gMTZNLNQzKPLsa1JYk7zFT45yvtW
	S8VD0bKWTppG5WncQqlYdZOx5kpvu0Ex/lnzzLpTmPCN6BG8TZ2BU5bFwMhZPQcuGhHX59hTWrp
	e8mgYgMtzqbCKryL
X-Google-Smtp-Source: AGHT+IFdB9MqijzvMQ5AZN705AacNdKytLYsKY/BtzcJq/+83dVI1n8c+vx49QEbbVjA9ZpB/+dcOw==
X-Received: by 2002:a05:6000:4617:b0:385:f220:f779 with SMTP id ffacd0b85a97d-38a873392e7mr21372723f8f.49.1736873659081;
        Tue, 14 Jan 2025 08:54:19 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03e5fsm179930495e9.18.2025.01.14.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:54:18 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/4] staging: gpib: Use __user for user space pointers
Date: Tue, 14 Jan 2025 17:54:01 +0100
Message-ID: <20250114165403.16410-3-dpenkler@gmail.com>
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

The user buffers in copy_from_user, copy_to_user and some file ops
did not use the __user address space attribute.

This led to the following sparse warning, for example:
common/gpib_os.c:838:40: warning: incorrect type in argument 2 (different address spaces)
common/gpib_os.c:838:40:    expected void const [noderef] __user *from
common/gpib_os.c:838:40:    got void *

Add the __user address space attribute where needed.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c         | 103 +++++++++---------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |   4 +-
 2 files changed, 54 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 982a2fe68cf2..69fe39aa0daf 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -835,7 +835,7 @@ static int board_type_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 		return -EBUSY;
 	}
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(board_type_ioctl_t));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(board_type_ioctl_t));
 	if (retval)
 		return retval;
 
@@ -879,7 +879,7 @@ static int read_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 		      unsigned long arg)
 {
 	read_write_ioctl_t read_cmd;
-	u8 *userbuf;
+	u8 __user *userbuf;
 	unsigned long remain;
 	int end_flag = 0;
 	int retval;
@@ -887,7 +887,7 @@ static int read_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 	gpib_descriptor_t *desc;
 	size_t nbytes;
 
-	retval = copy_from_user(&read_cmd, (void *)arg, sizeof(read_cmd));
+	retval = copy_from_user(&read_cmd, (void __user *)arg, sizeof(read_cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -901,7 +901,7 @@ static int read_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 	if (WARN_ON_ONCE(sizeof(userbuf) > sizeof(read_cmd.buffer_ptr)))
 		return -EFAULT;
 
-	userbuf = (u8 *)(unsigned long)read_cmd.buffer_ptr;
+	userbuf = (u8 __user *)(unsigned long)read_cmd.buffer_ptr;
 	userbuf += read_cmd.completed_transfer_count;
 
 	remain = read_cmd.requested_transfer_count - read_cmd.completed_transfer_count;
@@ -939,7 +939,7 @@ static int read_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 	if (remain == 0 || end_flag)
 		read_ret = 0;
 	if (retval == 0)
-		retval = copy_to_user((void *)arg, &read_cmd, sizeof(read_cmd));
+		retval = copy_to_user((void __user *)arg, &read_cmd, sizeof(read_cmd));
 
 	atomic_set(&desc->io_in_progress, 0);
 
@@ -954,7 +954,7 @@ static int command_ioctl(gpib_file_private_t *file_priv,
 			 gpib_board_t *board, unsigned long arg)
 {
 	read_write_ioctl_t cmd;
-	u8 *userbuf;
+	u8 __user *userbuf;
 	unsigned long remain;
 	int retval;
 	int fault = 0;
@@ -962,7 +962,7 @@ static int command_ioctl(gpib_file_private_t *file_priv,
 	size_t bytes_written;
 	int no_clear_io_in_prog;
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(cmd));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -973,7 +973,7 @@ static int command_ioctl(gpib_file_private_t *file_priv,
 	if (!desc)
 		return -EINVAL;
 
-	userbuf = (u8 *)(unsigned long)cmd.buffer_ptr;
+	userbuf = (u8 __user *)(unsigned long)cmd.buffer_ptr;
 	userbuf += cmd.completed_transfer_count;
 
 	no_clear_io_in_prog = cmd.end;
@@ -1016,7 +1016,7 @@ static int command_ioctl(gpib_file_private_t *file_priv,
 	cmd.completed_transfer_count = cmd.requested_transfer_count - remain;
 
 	if (fault == 0)
-		fault = copy_to_user((void *)arg, &cmd, sizeof(cmd));
+		fault = copy_to_user((void __user *)arg, &cmd, sizeof(cmd));
 
 	/*
 	 * no_clear_io_in_prog (cmd.end) is true when io_in_progress should
@@ -1038,13 +1038,13 @@ static int write_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 		       unsigned long arg)
 {
 	read_write_ioctl_t write_cmd;
-	u8 *userbuf;
+	u8 __user *userbuf;
 	unsigned long remain;
 	int retval = 0;
 	int fault;
 	gpib_descriptor_t *desc;
 
-	fault = copy_from_user(&write_cmd, (void *)arg, sizeof(write_cmd));
+	fault = copy_from_user(&write_cmd, (void __user *)arg, sizeof(write_cmd));
 	if (fault)
 		return -EFAULT;
 
@@ -1055,7 +1055,7 @@ static int write_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 	if (!desc)
 		return -EINVAL;
 
-	userbuf = (u8 *)(unsigned long)write_cmd.buffer_ptr;
+	userbuf = (u8 __user *)(unsigned long)write_cmd.buffer_ptr;
 	userbuf += write_cmd.completed_transfer_count;
 
 	remain = write_cmd.requested_transfer_count - write_cmd.completed_transfer_count;
@@ -1094,7 +1094,7 @@ static int write_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 	if (remain == 0)
 		retval = 0;
 	if (fault == 0)
-		fault = copy_to_user((void *)arg, &write_cmd, sizeof(write_cmd));
+		fault = copy_to_user((void __user *)arg, &write_cmd, sizeof(write_cmd));
 
 	atomic_set(&desc->io_in_progress, 0);
 
@@ -1111,7 +1111,7 @@ static int status_bytes_ioctl(gpib_board_t *board, unsigned long arg)
 	spoll_bytes_ioctl_t cmd;
 	int retval;
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(cmd));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1121,7 +1121,7 @@ static int status_bytes_ioctl(gpib_board_t *board, unsigned long arg)
 	else
 		cmd.num_bytes = num_status_bytes(device);
 
-	retval = copy_to_user((void *)arg, &cmd, sizeof(cmd));
+	retval = copy_to_user((void __user *)arg, &cmd, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1231,7 +1231,7 @@ static int open_dev_ioctl(struct file *filep, gpib_board_t *board, unsigned long
 	gpib_file_private_t *file_priv = filep->private_data;
 	int i;
 
-	retval = copy_from_user(&open_dev_cmd, (void *)arg, sizeof(open_dev_cmd));
+	retval = copy_from_user(&open_dev_cmd, (void __user *)arg, sizeof(open_dev_cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1267,7 +1267,7 @@ static int open_dev_ioctl(struct file *filep, gpib_board_t *board, unsigned long
 	atomic_set(&board->stuck_srq, 0);
 
 	open_dev_cmd.handle = i;
-	retval = copy_to_user((void *)arg, &open_dev_cmd, sizeof(open_dev_cmd));
+	retval = copy_to_user((void __user *)arg, &open_dev_cmd, sizeof(open_dev_cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1280,7 +1280,7 @@ static int close_dev_ioctl(struct file *filep, gpib_board_t *board, unsigned lon
 	gpib_file_private_t *file_priv = filep->private_data;
 	int retval;
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(cmd));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1308,7 +1308,7 @@ static int serial_poll_ioctl(gpib_board_t *board, unsigned long arg)
 
 	dev_dbg(board->gpib_dev, "pid %i, entering %s()\n", current->pid, __func__);
 
-	retval = copy_from_user(&serial_cmd, (void *)arg, sizeof(serial_cmd));
+	retval = copy_from_user(&serial_cmd, (void __user *)arg, sizeof(serial_cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1317,7 +1317,7 @@ static int serial_poll_ioctl(gpib_board_t *board, unsigned long arg)
 	if (retval < 0)
 		return retval;
 
-	retval = copy_to_user((void *)arg, &serial_cmd, sizeof(serial_cmd));
+	retval = copy_to_user((void __user *)arg, &serial_cmd, sizeof(serial_cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1331,7 +1331,7 @@ static int wait_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 	int retval;
 	gpib_descriptor_t *desc;
 
-	retval = copy_from_user(&wait_cmd, (void *)arg, sizeof(wait_cmd));
+	retval = copy_from_user(&wait_cmd, (void __user *)arg, sizeof(wait_cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1344,7 +1344,7 @@ static int wait_ioctl(gpib_file_private_t *file_priv, gpib_board_t *board,
 	if (retval < 0)
 		return retval;
 
-	retval = copy_to_user((void *)arg, &wait_cmd, sizeof(wait_cmd));
+	retval = copy_to_user((void __user *)arg, &wait_cmd, sizeof(wait_cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1360,7 +1360,7 @@ static int parallel_poll_ioctl(gpib_board_t *board, unsigned long arg)
 	if (retval < 0)
 		return retval;
 
-	retval = copy_to_user((void *)arg, &poll_byte, sizeof(poll_byte));
+	retval = copy_to_user((void __user *)arg, &poll_byte, sizeof(poll_byte));
 	if (retval)
 		return -EFAULT;
 
@@ -1371,14 +1371,14 @@ static int online_ioctl(gpib_board_t *board, unsigned long arg)
 {
 	online_ioctl_t online_cmd;
 	int retval;
-	void *init_data = NULL;
+	void __user *init_data = NULL;
 
 	board->config.init_data = NULL;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	retval = copy_from_user(&online_cmd, (void *)arg, sizeof(online_cmd));
+	retval = copy_from_user(&online_cmd, (void __user *)arg, sizeof(online_cmd));
 	if (retval)
 		return -EFAULT;
 	if (online_cmd.init_data_length > 0) {
@@ -1387,7 +1387,7 @@ static int online_ioctl(gpib_board_t *board, unsigned long arg)
 			return -ENOMEM;
 		if (WARN_ON_ONCE(sizeof(init_data) > sizeof(online_cmd.init_data_ptr)))
 			return -EFAULT;
-		init_data = (void *)(unsigned long)(online_cmd.init_data_ptr);
+		init_data = (void __user *)(unsigned long)(online_cmd.init_data_ptr);
 		retval = copy_from_user(board->config.init_data, init_data,
 					online_cmd.init_data_length);
 		if (retval) {
@@ -1416,7 +1416,7 @@ static int remote_enable_ioctl(gpib_board_t *board, unsigned long arg)
 	int enable;
 	int retval;
 
-	retval = copy_from_user(&enable, (void *)arg, sizeof(enable));
+	retval = copy_from_user(&enable, (void __user *)arg, sizeof(enable));
 	if (retval)
 		return -EFAULT;
 
@@ -1428,7 +1428,7 @@ static int take_control_ioctl(gpib_board_t *board, unsigned long arg)
 	int synchronous;
 	int retval;
 
-	retval = copy_from_user(&synchronous, (void *)arg, sizeof(synchronous));
+	retval = copy_from_user(&synchronous, (void __user *)arg, sizeof(synchronous));
 	if (retval)
 		return -EFAULT;
 
@@ -1444,7 +1444,7 @@ static int line_status_ioctl(gpib_board_t *board, unsigned long arg)
 	if (retval < 0)
 		return retval;
 
-	retval = copy_to_user((void *)arg, &lines, sizeof(lines));
+	retval = copy_to_user((void __user *)arg, &lines, sizeof(lines));
 	if (retval)
 		return -EFAULT;
 
@@ -1458,7 +1458,7 @@ static int pad_ioctl(gpib_board_t *board, gpib_file_private_t *file_priv,
 	int retval;
 	gpib_descriptor_t *desc;
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(cmd));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1494,7 +1494,7 @@ static int sad_ioctl(gpib_board_t *board, gpib_file_private_t *file_priv,
 	int retval;
 	gpib_descriptor_t *desc;
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(cmd));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1527,7 +1527,7 @@ static int eos_ioctl(gpib_board_t *board, unsigned long arg)
 	eos_ioctl_t eos_cmd;
 	int retval;
 
-	retval = copy_from_user(&eos_cmd, (void *)arg, sizeof(eos_cmd));
+	retval = copy_from_user(&eos_cmd, (void __user *)arg, sizeof(eos_cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1539,7 +1539,7 @@ static int request_service_ioctl(gpib_board_t *board, unsigned long arg)
 	u8 status_byte;
 	int retval;
 
-	retval = copy_from_user(&status_byte, (void *)arg, sizeof(status_byte));
+	retval = copy_from_user(&status_byte, (void __user *)arg, sizeof(status_byte));
 	if (retval)
 		return -EFAULT;
 
@@ -1551,7 +1551,8 @@ static int request_service2_ioctl(gpib_board_t *board, unsigned long arg)
 	request_service2_t request_service2_cmd;
 	int retval;
 
-	retval = copy_from_user(&request_service2_cmd, (void *)arg, sizeof(request_service2_t));
+	retval = copy_from_user(&request_service2_cmd, (void __user *)arg,
+				sizeof(request_service2_t));
 	if (retval)
 		return -EFAULT;
 
@@ -1567,7 +1568,7 @@ static int iobase_ioctl(gpib_board_config_t *config, unsigned long arg)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	retval = copy_from_user(&base_addr, (void *)arg, sizeof(base_addr));
+	retval = copy_from_user(&base_addr, (void __user *)arg, sizeof(base_addr));
 	if (retval)
 		return -EFAULT;
 
@@ -1586,7 +1587,7 @@ static int irq_ioctl(gpib_board_config_t *config, unsigned long arg)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	retval = copy_from_user(&irq, (void *)arg, sizeof(irq));
+	retval = copy_from_user(&irq, (void __user *)arg, sizeof(irq));
 	if (retval)
 		return -EFAULT;
 
@@ -1603,7 +1604,7 @@ static int dma_ioctl(gpib_board_config_t *config, unsigned long arg)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	retval = copy_from_user(&dma_channel, (void *)arg, sizeof(dma_channel));
+	retval = copy_from_user(&dma_channel, (void __user *)arg, sizeof(dma_channel));
 	if (retval)
 		return -EFAULT;
 
@@ -1619,7 +1620,7 @@ static int autospoll_ioctl(gpib_board_t *board, gpib_file_private_t *file_priv,
 	int retval;
 	gpib_descriptor_t *desc;
 
-	retval = copy_from_user(&enable, (void *)arg, sizeof(enable));
+	retval = copy_from_user(&enable, (void __user *)arg, sizeof(enable));
 	if (retval)
 		return -EFAULT;
 
@@ -1654,7 +1655,7 @@ static int mutex_ioctl(gpib_board_t *board, gpib_file_private_t *file_priv,
 {
 	int retval, lock_mutex;
 
-	retval = copy_from_user(&lock_mutex, (void *)arg, sizeof(lock_mutex));
+	retval = copy_from_user(&lock_mutex, (void __user *)arg, sizeof(lock_mutex));
 	if (retval)
 		return -EFAULT;
 
@@ -1698,7 +1699,7 @@ static int timeout_ioctl(gpib_board_t *board, unsigned long arg)
 	unsigned int timeout;
 	int retval;
 
-	retval = copy_from_user(&timeout, (void *)arg, sizeof(timeout));
+	retval = copy_from_user(&timeout, (void __user *)arg, sizeof(timeout));
 	if (retval)
 		return -EFAULT;
 
@@ -1713,7 +1714,7 @@ static int ppc_ioctl(gpib_board_t *board, unsigned long arg)
 	ppoll_config_ioctl_t cmd;
 	int retval;
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(cmd));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1739,7 +1740,7 @@ static int set_local_ppoll_mode_ioctl(gpib_board_t *board, unsigned long arg)
 	local_ppoll_mode_ioctl_t cmd;
 	int retval;
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(cmd));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1759,7 +1760,7 @@ static int get_local_ppoll_mode_ioctl(gpib_board_t *board, unsigned long arg)
 	int retval;
 
 	cmd = board->local_ppoll_mode;
-	retval = copy_to_user((void *)arg, &cmd, sizeof(cmd));
+	retval = copy_to_user((void __user *)arg, &cmd, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
@@ -1773,7 +1774,7 @@ static int query_board_rsv_ioctl(gpib_board_t *board, unsigned long arg)
 
 	status = board->interface->serial_poll_status(board);
 
-	retval = copy_to_user((void *)arg, &status, sizeof(status));
+	retval = copy_to_user((void __user *)arg, &status, sizeof(status));
 	if (retval)
 		return -EFAULT;
 
@@ -1796,7 +1797,7 @@ static int board_info_ioctl(const gpib_board_t *board, unsigned long arg)
 	info.t1_delay = board->t1_nano_sec;
 	info.ist = board->ist;
 	info.no_7_bit_eos = board->interface->no_7_bit_eos;
-	retval = copy_to_user((void *)arg, &info, sizeof(info));
+	retval = copy_to_user((void __user *)arg, &info, sizeof(info));
 	if (retval)
 		return -EFAULT;
 
@@ -1808,7 +1809,7 @@ static int interface_clear_ioctl(gpib_board_t *board, unsigned long arg)
 	unsigned int usec_duration;
 	int retval;
 
-	retval = copy_from_user(&usec_duration, (void *)arg, sizeof(usec_duration));
+	retval = copy_from_user(&usec_duration, (void __user *)arg, sizeof(usec_duration));
 	if (retval)
 		return -EFAULT;
 
@@ -1823,7 +1824,7 @@ static int select_pci_ioctl(gpib_board_config_t *config, unsigned long arg)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	retval = copy_from_user(&selection, (void *)arg, sizeof(selection));
+	retval = copy_from_user(&selection, (void __user *)arg, sizeof(selection));
 	if (retval)
 		return -EFAULT;
 
@@ -1845,7 +1846,7 @@ static int select_device_path_ioctl(gpib_board_config_t *config, unsigned long a
 	if (!selection)
 		return -ENOMEM;
 
-	retval = copy_from_user(selection, (void *)arg, sizeof(select_device_path_ioctl_t));
+	retval = copy_from_user(selection, (void __user *)arg, sizeof(select_device_path_ioctl_t));
 	if (retval) {
 		vfree(selection);
 		return -EFAULT;
@@ -1979,7 +1980,7 @@ static int event_ioctl(gpib_board_t *board, unsigned long arg)
 
 	user_event = event;
 
-	retval = copy_to_user((void *)arg, &user_event, sizeof(user_event));
+	retval = copy_to_user((void __user *)arg, &user_event, sizeof(user_event));
 	if (retval)
 		return -EFAULT;
 
@@ -1991,7 +1992,7 @@ static int request_system_control_ioctl(gpib_board_t *board, unsigned long arg)
 	rsc_ioctl_t request_control;
 	int retval;
 
-	retval = copy_from_user(&request_control, (void *)arg, sizeof(request_control));
+	retval = copy_from_user(&request_control, (void __user *)arg, sizeof(request_control));
 	if (retval)
 		return -EFAULT;
 
@@ -2011,7 +2012,7 @@ static int t1_delay_ioctl(gpib_board_t *board, unsigned long arg)
 		return -EIO;
 	}
 
-	retval = copy_from_user(&cmd, (void *)arg, sizeof(cmd));
+	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
 		return -EFAULT;
 
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index b0bde6c3458c..85322af62c23 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1880,7 +1880,7 @@ static int skel_release(struct inode *inode, struct file *file)
  *  user space access to read function
  */
 
-static ssize_t skel_read(struct file *file, char *buffer, size_t count,
+static ssize_t skel_read(struct file *file, char __user *buffer, size_t count,
 			 loff_t *ppos)
 {
 	struct usb_skel *dev;
@@ -1911,7 +1911,7 @@ static ssize_t skel_read(struct file *file, char *buffer, size_t count,
  *  user space access to write function
  */
 
-static ssize_t skel_write(struct file *file, const char *user_buffer,
+static ssize_t skel_write(struct file *file, const char __user *user_buffer,
 			  size_t count, loff_t *ppos)
 {
 	struct usb_skel *dev;
-- 
2.47.1

