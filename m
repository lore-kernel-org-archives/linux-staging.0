Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09949264FB8
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739533674; cv=none; b=FL5eNFxJr17++xXjjuRo5hk0wQMrw8303UMahDo7iFX1sEc+qOYhMCIP2TgHnnFX8EHBNF2fIobG1gSRdjlfkoor5XnSN7R7SylfiwfQVu+oo5qOgTw+rfagfRg/6bH03hHnKLXfKazd0saH4j2QbpfQ8QXxN+m9/x3WsPnAZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739533674; c=relaxed/simple;
	bh=/4PdviiYt/uI2VjlPk045lO71+KN43mMIJ9DUGFAiYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ib5h+aPSeLacfyTyF5YL7c9pt0ytllBmf4ws68viu7xoIlQhNMjNplYMWozvvvCGNB7kF4V2OGz/gzUhb+barQUdQHjUGR9UsUkDJ9TCCsPFfO5d2JaLG1m70OC8yf/Dk06CeAcKMSKqnhT4WzxG4inCFGRTJBPByPED+m1qnIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnrJm5W2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnrJm5W2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-438a39e659cso13981685e9.2
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 03:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739533669; x=1740138469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POdK9nTH3A8yWd11yKaU9NucRt1pKsLdjFtHwWKgO1A=;
        b=ZnrJm5W2eDlejroNTymOziZecFNxdH6tbM0KDQHLkZdjqnxIg/TqntcxKOfPZR5/qS
         KIuteOAl8ztGhoqaf81wU2svOqTyaJ6sBp0XjrePs8x/av4MDrKvHp23gzWaLrOjV2oU
         kTERizvESH5erM0IrHIs2+IL6Msg5RyGexQgziZsup4TL0YXCyJhdgpzI0lfJNnGxMJP
         1EIY4RKRrCKoUCZDpLmHNLPgbsyYpReBTrDxEl6ff+CpI1PNsBAtT6JzepJUd98gAt4E
         VJ+aWvuARdMhYPmvbLD77VUhlHfOSbpE5kA3kx0N2Q3i4D0De22FFbcbCjTcU3k9rlS7
         Itdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533669; x=1740138469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POdK9nTH3A8yWd11yKaU9NucRt1pKsLdjFtHwWKgO1A=;
        b=RCDI34UIDRYtH4DLqzdLuBh6e5YC42AoaC+kTY9oqZ3fD7uiP+sa75Mxcafvwq+xZ5
         qnaWKSITgA4iFRHojXSTHsnA93HYx4B2dcLSFFbaze8IzMTYXDrxn25z1AG9+LSw0uIW
         5bje5MNKpmz0YYKXlmgWacMG4GIYCkN7Y+9cMgKJbMW0QKsEVfyjH8AoxVkQkAPFatD/
         ngp3Kevk7T5c9Vx5kSqcZYH5qzQybVHjunkjf4l+FcIHMGZ9pM2qRY2ezmtHRBcR8Jsw
         CkKVYvcYF0zFy+ogBBRfeRHSr7ZfL25kj1cqHbH/b/+Odwwk85ycJTiVNUXw4J/PpWmf
         JheQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwq/tnF+YKKvKpGyRRFWP9iw6YFZO1ER46LYjlqlJmXaw6pyMtfDt9rIdJiML259i+EtzqkWIGhYYLOIbZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyhMmQetPHJXDaQ75U3ppD72r0sC40N+LN/3rgwGgMtglBkrfRZ
	Z6SttxM27Ql2lbRf/l+/jC4Eplp0/LrSIWbxhVyJBT+aPGFL09VJ
X-Gm-Gg: ASbGncsL7ZK+aCwaDlomB2q4VEGXdnTSW3bssLiarc9oPy1sFKa+P2bWYmziwKif9E9
	MuQzufkT2vIhyjFUMZHGuu+2JinfLdLLQbZrh03tqoVji3IFJ6svpftwYKjDTU3b3fn+Ukjkso2
	sOM+WnNnk5iv3A+mxUBkKZN4gwjXR77nUezK4uEWOHLFfMzuVITT08n9bs6/d9go4+Hoj8Hk7T9
	0pKtdU3T8MF7P8qf43dOf+GQbm02iSgLNRBVMEp0QVqADDgQ0I0pZ7qAOOn5j15BUaKO/ftC1mU
	irT6M6xctzO6WVwwkXClSj1RJI9Cg1jwfjEABsR+Hs31NdlDnlQ=
X-Google-Smtp-Source: AGHT+IHJKG2K4YmU15vtspOIxqR+/Rpe0gwQ1KrB2sV6zBD3C0zeYy5iY/jXZhHptJawYq7FdwJo7A==
X-Received: by 2002:a05:600c:c15:b0:439:4db6:43ad with SMTP id 5b1f17b1804b1-439581b931amr105736125e9.21.1739533669060;
        Fri, 14 Feb 2025 03:47:49 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fccfesm41945245e9.11.2025.02.14.03.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:47:48 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 12/17] staging: gpib: lpvo console messaging cleanup
Date: Fri, 14 Feb 2025 12:47:03 +0100
Message-ID: <20250214114708.28947-13-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214114708.28947-1-dpenkler@gmail.com>
References: <20250214114708.28947-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable module name to be printed in pr_xxx and dev_xxx

Replace #define NAME "lpvo_usb_gpib" with KBUILD_MODNAME

Update comments about Diagnostics and Debug

Use dev_dbg instead of pr_alert in the DIA_LOG macro definition

Remove TTY_LOG macro and its uses. There are non-console applications
where this no longer makes sense.

Remove commented printk's

Remove now useless function printable().

Remove board parameter from SHOW_STATUS as it shadows
the variable in the function.

Remove the printing of the board pointer in SHOW_STATUS.

Change select DIA_LOG(0,... to dev_err where we need an error
message.

Remove loops for printing message buffer contents.

Remove dev_alerts for read errors.

Change dev_alert to dev_err.

Change some TTY_LOG to DIA_LOG(0,.. e.g. for attach and detach
messages.

Remove NAME parameter in dev_dbg as this is printed
with the module name.

Remove __func__ parameter in dev_dbg as this can be
enabled by dynamic debug.

Remove NOP message for unsuppoted functionality.

Remove "lpvo_usb_gpib:" prefix in register driver pr_err as it
is printed with the module name.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 255 ++++++------------
 1 file changed, 76 insertions(+), 179 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 85322af62c23..50faa0c17617 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -8,6 +8,10 @@
  *  copyright		 : (C) 2011 Marcello Carla'			   *
  ***************************************************************************/
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define dev_fmt pr_fmt
+#define NAME KBUILD_MODNAME
+
 /* base module includes */
 
 #include <linux/module.h>
@@ -31,8 +35,6 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for LPVO usb devices");
 
-#define NAME "lpvo_usb_gpib"
-
 /*
  *  Table of devices that work with this driver.
  *
@@ -55,10 +57,11 @@ MODULE_DEVICE_TABLE(usb, skel_table);
 
 /*
  *    ***  Diagnostics and Debug  ***
- *
+ *  To enable the diagnostic and debug messages either compile with DEBUG set
+ *  or control via the dynamic debug mechanisms.
  *  The module parameter "debug" controls the sending of debug messages to
- *  syslog. By default it is set to 0 or 1 according to GPIB_CONFIG_KERNEL_DEBUG.
- *    debug = 0: only register/deregister messages are generated
+ *  syslog. By default it is set to 0
+ *    debug = 0: only attach/detach messages are sent
  *	      1: every action is logged
  *	      2: extended logging; each single exchanged byte is documented
  *		 (about twice the log volume of [1])
@@ -70,9 +73,9 @@ MODULE_DEVICE_TABLE(usb, skel_table);
 static int debug;
 module_param(debug, int, 0644);
 
-#define DIA_LOG(level, format, ...)					\
+#define DIA_LOG(level, format, ...)			   \
 	do { if (debug >= (level))					\
-			pr_alert("%s:%s - " format, NAME, __func__, ## __VA_ARGS__); } \
+			dev_dbg(board->gpib_dev, format, ## __VA_ARGS__); } \
 	while (0)
 
 /* standard and extended command sets of the usb-gpib adapter */
@@ -135,7 +138,7 @@ struct char_buf {		/* used by one_char() routine */
 };
 
 struct usb_gpib_priv {		/* private data to the device */
-	u8 eos;		        /* eos character */
+	u8 eos;			/* eos character */
 	short eos_flags;	/* eos mode */
 	int timeout;		/* current value for timeout */
 	void *dev;		/* the usb device private data structure */
@@ -143,42 +146,23 @@ struct usb_gpib_priv {		/* private data to the device */
 
 #define GPIB_DEV (((struct usb_gpib_priv *)board->private_data)->dev)
 
-#define SHOW_STATUS(board) {						\
-		DIA_LOG(2, "# - board %p\n", board);			\
-		DIA_LOG(2, "# - buffer_length %d\n", board->buffer_length); \
-		DIA_LOG(2, "# - status %lx\n", board->status);		\
-		DIA_LOG(2, "# - use_count %d\n", board->use_count);	\
-		DIA_LOG(2, "# - pad %x\n", board->pad);			\
-		DIA_LOG(2, "# - sad %x\n", board->sad);			\
-		DIA_LOG(2, "# - timeout %d\n", board->usec_timeout);	\
-		DIA_LOG(2, "# - ppc %d\n", board->parallel_poll_configuration); \
-		DIA_LOG(2, "# - t1delay %d\n", board->t1_nano_sec);	\
-		DIA_LOG(2, "# - online %d\n", board->online);		\
-		DIA_LOG(2, "# - autopoll %d\n", board->autospollers);	\
-		DIA_LOG(2, "# - autopoll task %p\n", board->autospoll_task); \
-		DIA_LOG(2, "# - minor %d\n", board->minor);		\
-		DIA_LOG(2, "# - master %d\n", board->master);		\
-		DIA_LOG(2, "# - list %d\n", board->ist);		\
-	}
-/*
- * n = 0;
- * list_for_each (l, &board->device_list) n++;
- * TTY_LOG ("%s:%s - devices in list %d\n", a, b, n);
- */
-
-/*
- * TTY_LOG - write a message to the current work terminal (if any)
- */
-
-#define TTY_LOG(format, ...) {						\
-		char buf[128];						\
-		struct tty_struct *tty = get_current_tty();		\
-		if (tty) {						\
-			snprintf(buf, 128, format, __VA_ARGS__);	\
-			tty->driver->ops->write(tty, buf, strlen(buf)); \
-			tty->driver->ops->write(tty, "\r", 1);		\
-		}							\
-	}
+static void show_status(gpib_board_t *board)
+{
+	DIA_LOG(2, "# - buffer_length %d\n", board->buffer_length);
+	DIA_LOG(2, "# - status %lx\n", board->status);
+	DIA_LOG(2, "# - use_count %d\n", board->use_count);
+	DIA_LOG(2, "# - pad %x\n", board->pad);
+	DIA_LOG(2, "# - sad %x\n", board->sad);
+	DIA_LOG(2, "# - timeout %d\n", board->usec_timeout);
+	DIA_LOG(2, "# - ppc %d\n", board->parallel_poll_configuration);
+	DIA_LOG(2, "# - t1delay %d\n", board->t1_nano_sec);
+	DIA_LOG(2, "# - online %d\n", board->online);
+	DIA_LOG(2, "# - autopoll %d\n", board->autospollers);
+	DIA_LOG(2, "# - autopoll task %p\n", board->autospoll_task);
+	DIA_LOG(2, "# - minor %d\n", board->minor);
+	DIA_LOG(2, "# - master %d\n", board->master);
+	DIA_LOG(2, "# - list %d\n", board->ist);
+}
 
 /*
  *  GLOBAL VARIABLES: required for
@@ -236,8 +220,6 @@ static int write_loop(void *dev, char *msg, int leng)
 	return skel_do_write(dev, msg, leng);
 
 //		  if (val < 1) {
-//			  printk (KERN_ALERT "%s:%s - write error: %d %d/%d\n",
-//				  NAME, __func__, val, nchar, leng);
 //			  return -EIO;
 //		  }
 //		  nchar +=val;
@@ -245,13 +227,6 @@ static int write_loop(void *dev, char *msg, int leng)
 //	  return leng;
 }
 
-static char printable(char x)
-{
-	if (x < 32 || x > 126)
-		return ' ';
-	return x;
-}
-
 /**
  * send_command() - Send a byte sequence and return a single byte reply.
  *
@@ -265,7 +240,7 @@ static char printable(char x)
 static int send_command(gpib_board_t *board, char *msg, int leng)
 {
 	char buffer[64];
-	int nchar, j;
+	int nchar;
 	int retval;
 	struct timespec64 before, after;
 
@@ -280,17 +255,10 @@ static int send_command(gpib_board_t *board, char *msg, int leng)
 	nchar = skel_do_read(GPIB_DEV, buffer, 64);
 
 	if (nchar < 0) {
-		DIA_LOG(0, " return from read: %d\n", nchar);
+		dev_err(board->gpib_dev, " return from read: %d\n", nchar);
 		return nchar;
 	} else if (nchar != 1) {
-		for (j = 0 ; j < leng ; j++) {
-			DIA_LOG(0, " Irregular reply to command: %d  %x %c\n",
-				j, msg[j], printable(msg[j]));
-		}
-		for (j = 0 ; j < nchar ; j++) {
-			DIA_LOG(0, " Irregular command reply: %d %x %c\n",
-				j, buffer[j] & 0xff, printable(buffer[j]));
-		}
+		dev_err(board->gpib_dev, " Irregular reply to command: %s\n", msg);
 		return -EIO;
 	}
 	ktime_get_real_ts64 (&after);
@@ -337,8 +305,8 @@ static int set_control_line(gpib_board_t *board, int line, int value)
 /*
  * one_char() - read one single byte from input buffer
  *
- * @board:      the gpib_board_struct data area for this gpib interface
- * @char_buf:   the routine private data structure
+ * @board:	the gpib_board_struct data area for this gpib interface
+ * @char_buf:	the routine private data structure
  */
 
 static int one_char(gpib_board_t *board, struct char_buf *b)
@@ -360,13 +328,7 @@ static int one_char(gpib_board_t *board, struct char_buf *b)
 	if (b->nchar > 0) {
 		DIA_LOG(2, "--> %x\n", b->inbuf[b->last - b->nchar]);
 		return b->inbuf[b->last - b->nchar--];
-	} else if (b->nchar == 0) {
-		dev_alert(board->gpib_dev, "%s:%s - read returned EOF\n", NAME, __func__);
-		return -EIO;
 	}
-	dev_alert(board->gpib_dev, "%s:%s - read error %d\n", NAME, __func__, b->nchar);
-	TTY_LOG("\n *** %s *** Read Error - %s\n", NAME,
-		"Reset the adapter with 'gpib_config'\n");
 	return -EIO;
 }
 
@@ -406,12 +368,10 @@ static void set_timeout(gpib_board_t *board)
 		val = send_command(board, command, 0);
 	}
 
-	if (val != ACK) {
-		dev_alert(board->gpib_dev, "%s:%s - error in timeout set: <%s>\n",
-			  NAME, __func__, command);
-	} else {
+	if (val != ACK)
+		dev_err(board->gpib_dev, "error in timeout set: <%s>\n", command);
+	else
 		data->timeout = board->usec_timeout;
-	}
 }
 
 /*
@@ -451,8 +411,6 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 
 	if (config->device_path) {
 		/* if config->device_path given, try that first */
-		dev_alert(board->gpib_dev, "%s:%s - Looking for device_path: %s\n",
-			  NAME, __func__, config->device_path);
 		for (j = 0 ; j < MAX_DEV ; j++) {
 			if ((assigned_usb_minors & 1 << j) == 0)
 				continue;
@@ -487,8 +445,7 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 	mutex_unlock(&minors_lock);
 
 	if (j == MAX_DEV) {
-		dev_alert(board->gpib_dev, "%s:%s - Requested device is not registered.\n",
-			  NAME, __func__);
+		dev_err(board->gpib_dev, "Requested device is not registered.\n");
 		return -EIO;
 	}
 
@@ -501,13 +458,13 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 	DIA_LOG(1, "Skel open: %d\n", retval);
 
 	if (retval) {
-		TTY_LOG("%s:%s - skel open failed.\n", NAME, __func__);
+		dev_err(board->gpib_dev, "skel open failed.\n");
 		kfree(board->private_data);
 		board->private_data = NULL;
 		return -ENODEV;
 	}
 
-	SHOW_STATUS(board);
+	show_status(board);
 
 	retval = send_command(board, USB_GPIB_ON, 0);
 	DIA_LOG(1, "USB_GPIB_ON returns %x\n", retval);
@@ -541,8 +498,8 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 	if (retval != ACK)
 		return -EIO;
 
-	SHOW_STATUS(board);
-	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
+	show_status(board);
+	DIA_LOG(0, "attached\n");
 	return 0;
 }
 
@@ -557,9 +514,9 @@ static void usb_gpib_detach(gpib_board_t *board)
 {
 	int retval;
 
-	SHOW_STATUS(board);
+	show_status(board);
 
-	DIA_LOG(0, "detaching %p\n", board);
+	DIA_LOG(0, "detaching\n");
 
 	if (board->private_data) {
 		if (GPIB_DEV) {
@@ -573,8 +530,7 @@ static void usb_gpib_detach(gpib_board_t *board)
 		board->private_data = NULL;
 	}
 
-	DIA_LOG(0, "done %p\n", board);
-	TTY_LOG("Module '%s' has been detached\n", NAME);
+	DIA_LOG(0, "detached\n");
 }
 
 /*
@@ -733,8 +689,7 @@ static int usb_gpib_line_status(const gpib_board_t *board)
 	buffer = send_command((gpib_board_t *)board, USB_GPIB_STATUS, 0);
 
 	if (buffer < 0) {
-		dev_alert(board->gpib_dev, "%s:%s - line status read failed with %d\n",
-			  NAME, __func__, buffer);
+		dev_err(board->gpib_dev, "line status read failed with %d\n", buffer);
 		return -1;
 	}
 
@@ -773,20 +728,16 @@ static int usb_gpib_parallel_poll(gpib_board_t *board, uint8_t *result)
 	DIA_LOG(1, "enter %p\n", board);
 
 	retval = set_control_line(board, IB_BUS_EOI, 1);
-	if (retval != ACK) {
-		dev_alert(board->gpib_dev, "%s:%s - assert EOI failed\n", NAME, __func__);
+	if (retval != ACK)
 		return -EIO;
-	}
 
 	*result = send_command(board, USB_GPIB_READ_DATA, 0);
 
 	DIA_LOG(1, "done with %x\n", *result);
 
 	retval = set_control_line(board, IB_BUS_EOI, 0);
-	if (retval != 0x06) {
-		dev_alert(board->gpib_dev, "%s:%s - unassert EOI failed\n", NAME, __func__);
+	if (retval != 0x06)
 		return -EIO;
-	}
 
 	return 0;
 }
@@ -866,8 +817,7 @@ static int usb_gpib_read(gpib_board_t *board,
 		goto read_return;
 
 	if (one_char(board, &b) != DLE || one_char(board, &b) != STX) {
-		dev_alert(board->gpib_dev, "%s:%s - wrong <DLE><STX> sequence\n",
-			  NAME, __func__);
+		dev_err(board->gpib_dev, "wrong <DLE><STX> sequence\n");
 		retval = -EIO;
 		goto read_return;
 	}
@@ -907,15 +857,12 @@ static int usb_gpib_read(gpib_board_t *board,
 					retval = 0;
 					goto read_return;
 				} else {
-					dev_alert(board->gpib_dev, "%s:%s - %s %x\n",
-						  NAME, __func__,
-						  "Wrong end of message", c);
+					dev_err(board->gpib_dev, "wrong end of message %x", c);
 					retval = -ETIME;
 					goto read_return;
 				}
 			} else {
-				dev_alert(board->gpib_dev, "%s:%s - %s\n", NAME, __func__,
-					  "lone <DLE> in stream");
+				dev_err(board->gpib_dev, "lone <DLE> in stream");
 				retval = -EIO;
 				goto read_return;
 			}
@@ -934,8 +881,7 @@ static int usb_gpib_read(gpib_board_t *board,
 			c = one_char(board, &b);
 			if (c == ACK) {
 				if (MAX_READ_EXCESS - read_count > 1)
-					dev_alert(board->gpib_dev, "%s:%s - %s\n", NAME, __func__,
-						  "small buffer - maybe some data lost");
+					dev_dbg(board->gpib_dev, "small buffer - maybe some data lost");
 				retval = 0;
 				goto read_return;
 			}
@@ -943,15 +889,13 @@ static int usb_gpib_read(gpib_board_t *board,
 		}
 	}
 
-	dev_alert(board->gpib_dev, "%s:%s - no input end - GPIB board in odd state\n",
-		  NAME, __func__);
+	dev_err(board->gpib_dev, "no input end - board in odd state\n");
 	retval = -EIO;
 
 read_return:
 	kfree(b.inbuf);
 
-	DIA_LOG(1, "done with byte/status: %d %x %d\n",
-		(int)*bytes_read, retval, *end);
+	DIA_LOG(1, "done with byte/status: %d %x %d\n",	(int)*bytes_read, retval, *end);
 
 	if (retval == 0 || retval == -ETIME) {
 		if (send_command(board, USB_GPIB_UNTALK, sizeof(USB_GPIB_UNTALK)) == 0x06)
@@ -970,8 +914,7 @@ static void usb_gpib_remote_enable(gpib_board_t *board, int enable)
 
 	retval = set_control_line(board, IB_BUS_REN, enable ? 1 : 0);
 	if (retval != ACK)
-		dev_alert(board->gpib_dev, "%s:%s - could not set REN line: %x\n",
-			  NAME, __func__, retval);
+		dev_err(board->gpib_dev, "could not set REN line: %x\n", retval);
 
 	DIA_LOG(1, "done with %x\n", retval);
 }
@@ -1053,9 +996,8 @@ static int usb_gpib_write(gpib_board_t *board,
 
 	*bytes_written = length;
 
-	if (send_command(board, USB_GPIB_UNLISTEN, sizeof(USB_GPIB_UNLISTEN))
-	    != 0x06)
-		return  -EPIPE;
+	if (send_command(board, USB_GPIB_UNLISTEN, sizeof(USB_GPIB_UNLISTEN)) != 0x06)
+		return -EPIPE;
 
 	return length;
 }
@@ -1069,21 +1011,18 @@ static int usb_gpib_write(gpib_board_t *board,
 static void usb_gpib_parallel_poll_configure(gpib_board_t *board,
 					     uint8_t configuration)
 {
-	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 }
 
 /* parallel_poll_response */
 
 static void usb_gpib_parallel_poll_response(gpib_board_t *board, int ist)
 {
-	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 }
 
 /* primary_address */
 
 static int  usb_gpib_primary_address(gpib_board_t *board, unsigned int address)
 {
-	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
 }
 
@@ -1091,7 +1030,6 @@ static int  usb_gpib_primary_address(gpib_board_t *board, unsigned int address)
 
 static	void usb_gpib_return_to_local(gpib_board_t *board)
 {
-	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 }
 
 /* secondary_address */
@@ -1100,7 +1038,6 @@ static int usb_gpib_secondary_address(gpib_board_t *board,
 				      unsigned int address,
 				      int enable)
 {
-	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
 }
 
@@ -1108,14 +1045,12 @@ static int usb_gpib_secondary_address(gpib_board_t *board,
 
 static void usb_gpib_serial_poll_response(gpib_board_t *board, uint8_t status)
 {
-	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 }
 
 /* serial_poll_status */
 
 static uint8_t usb_gpib_serial_poll_status(gpib_board_t *board)
 {
-	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
 }
 
@@ -1123,7 +1058,6 @@ static uint8_t usb_gpib_serial_poll_status(gpib_board_t *board)
 
 static unsigned int usb_gpib_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
-	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
 }
 
@@ -1181,7 +1115,7 @@ static int usb_gpib_init_module(struct usb_interface *interface)
 	if (!assigned_usb_minors) {
 		rv = gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
 		if (rv) {
-			pr_err("lpvo_usb_gpib: gpib_register_driver failed: error = %d\n", rv);
+			pr_err("gpib_register_driver failed: error = %d\n", rv);
 			goto exit;
 		}
 	} else {
@@ -1191,8 +1125,8 @@ static int usb_gpib_init_module(struct usb_interface *interface)
 
 		for (j = 0 ; j < MAX_DEV ; j++) {
 			if (usb_minors[j] == interface->minor && assigned_usb_minors & 1 << j) {
-				pr_alert("%s:%s - CODE BUG: USB minor %d registered at %d.\n",
-					 NAME, __func__, interface->minor, j);
+				pr_err("CODE BUG: USB minor %d registered at %d.\n",
+				       interface->minor, j);
 				rv = -1;
 				goto exit;
 			}
@@ -1207,13 +1141,11 @@ static int usb_gpib_init_module(struct usb_interface *interface)
 			usb_minors[j] = interface->minor;
 			lpvo_usb_interfaces[j] = interface;
 			assigned_usb_minors |= mask;
-			DIA_LOG(0, "usb minor %d registered at %d\n", interface->minor, j);
 			rv = 0;
 			goto exit;
 		}
 	}
-	pr_alert("%s:%s - No slot available for interface %p minor %d\n",
-		 NAME, __func__, interface, interface->minor);
+	pr_err("No slot available for interface %p minor %d\n", interface, interface->minor);
 	rv = -1;
 
 exit:
@@ -1235,7 +1167,7 @@ static void usb_gpib_exit_module(int minor)
 			goto exit;
 		}
 	}
-	pr_alert("%s:%s - CODE BUG: USB minor %d not found.\n", NAME, __func__, minor);
+	pr_err("CODE BUG: USB minor %d not found.\n", minor);
 
 exit:
 	mutex_unlock(&minors_lock);
@@ -1267,7 +1199,7 @@ static int write_latency_timer(struct usb_device *udev)
 				 LATENCY_TIMER, LATENCY_CHANNEL,
 				 NULL, 0, WDR_TIMEOUT);
 	if (rv < 0)
-		pr_alert("Unable to write latency timer: %i\n", rv);
+		dev_err(&udev->dev, "Unable to write latency timer: %i\n", rv);
 	return rv;
 }
 
@@ -1369,12 +1301,9 @@ static int skel_do_open(gpib_board_t *board, int subminor)
 	struct usb_interface *interface;
 	int retval = 0;
 
-	DIA_LOG(0, "Required minor: %d\n", subminor);
-
 	interface = usb_find_interface(&skel_driver, subminor);
 	if (!interface) {
-		pr_err("%s - error, can't find device for minor %d\n",
-		       __func__, subminor);
+		dev_err(board->gpib_dev, "can't find device for minor %d\n", subminor);
 		retval = -ENODEV;
 		goto exit;
 	}
@@ -1439,9 +1368,8 @@ static void skel_read_bulk_callback(struct urb *urb)
 		if (!(urb->status == -ENOENT ||
 		      urb->status == -ECONNRESET ||
 		      urb->status == -ESHUTDOWN))
-			dev_err(&dev->interface->dev,
-				"%s - nonzero read bulk status received: %d\n",
-				__func__, urb->status);
+			dev_err(&dev->interface->dev, "nonzero read bulk status received: %d\n",
+				urb->status);
 
 		dev->errors = urb->status;
 	} else {
@@ -1478,9 +1406,7 @@ static int skel_do_read_io(struct usb_skel *dev, size_t count)
 	/* do it */
 	rv = usb_submit_urb(dev->bulk_in_urb, GFP_KERNEL);
 	if (rv < 0) {
-		dev_err(&dev->interface->dev,
-			"%s - failed submitting read urb, error %d\n",
-			__func__, rv);
+		dev_err(&dev->interface->dev, "failed submitting read urb, error %d\n", rv);
 		rv = (rv == -ENOMEM) ? rv : -EIO;
 		spin_lock_irq(&dev->err_lock);
 		dev->ongoing_read = 0;
@@ -1504,14 +1430,10 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 	if (!dev->bulk_in_urb || !count)
 		return 0;
 
-	DIA_LOG(1, "enter for %zu.\n", count);
-
 restart:  /* added to comply with ftdi timeout technique */
 
 	/* no concurrent readers */
 
-	DIA_LOG(2, "restart with %zd %zd.\n", dev->bulk_in_filled, dev->bulk_in_copied);
-
 	rv = mutex_lock_interruptible(&dev->io_mutex);
 	if (rv < 0)
 		return rv;
@@ -1527,8 +1449,6 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 	ongoing_io = dev->ongoing_read;
 	spin_unlock_irq(&dev->err_lock);
 
-	DIA_LOG(2, "retry with %d.\n", ongoing_io);
-
 	if (ongoing_io) {
 //		  /* nonblocking IO shall not wait */
 //		  /* no file, no O_NONBLOCK; maybe provide when from user space */
@@ -1569,8 +1489,6 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 //		  size_t chunk = min(available, count);	 /* compute chunk later */
 		size_t chunk;
 
-		DIA_LOG(2, "we have data: %zu %zu.\n", dev->bulk_in_filled, dev->bulk_in_copied);
-
 		if (!available) {
 			/*
 			 * all data has been used
@@ -1596,12 +1514,6 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 		 */
 
 		if (dev->bulk_in_copied) {
-			int j;
-
-			for (j = 0 ; j < dev->bulk_in_filled ; j++) {
-				pr_alert("copy -> %x %zu %x\n",
-					 j, dev->bulk_in_copied, dev->bulk_in_buffer[j]);
-			}
 			chunk = min(available, count);
 			memcpy(buffer, dev->bulk_in_buffer + dev->bulk_in_copied, chunk);
 			rv = chunk;
@@ -1613,7 +1525,7 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 			/* account for two bytes to be discarded */
 			chunk = min(available, count + 2);
 			if (chunk < 2) {
-				pr_alert("BAD READ - chunk: %zu\n", chunk);
+				dev_err(&dev->udev->dev, "BAD READ - chunk: %zu\n", chunk);
 				rv = -EIO;
 				goto exit;
 			}
@@ -1633,8 +1545,6 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 //		  if (available < count)
 //			  skel_do_read_io(dev, dev->bulk_in_size);
 	} else {
-		DIA_LOG(1, "no data - start read - copied: %zd.\n", dev->bulk_in_copied);
-
 		/* no data in the buffer */
 		rv = skel_do_read_io(dev, dev->bulk_in_size);
 		if (rv < 0)
@@ -1645,10 +1555,10 @@ static ssize_t skel_do_read(struct usb_skel *dev, char *buffer, size_t count)
 exit:
 	mutex_unlock(&dev->io_mutex);
 	if (rv == 2)
-		goto restart;   /* ftdi chip returns two status bytes after a latency anyhow */
-	DIA_LOG(1, "exit with %d.\n", rv);
+		goto restart;	/* ftdi chip returns two status bytes after a latency anyhow */
+
 	if (rv > 0)
-		return rv - 2;  /* account for 2 discarded bytes in a valid buffer */
+		return rv - 2;	/* account for 2 discarded bytes in a valid buffer */
 	return rv;
 }
 
@@ -1669,8 +1579,7 @@ static void skel_write_bulk_callback(struct urb *urb)
 		      urb->status == -ECONNRESET ||
 		      urb->status == -ESHUTDOWN))
 			dev_err(&dev->interface->dev,
-				"%s - nonzero write bulk status received: %d\n",
-				__func__, urb->status);
+				"nonzero write bulk status received: %d\n", urb->status);
 
 		spin_lock_irqsave(&dev->err_lock, flags);
 		dev->errors = urb->status;
@@ -1763,9 +1672,7 @@ static ssize_t skel_do_write(struct usb_skel *dev, const char *buffer, size_t co
 	retval = usb_submit_urb(urb, GFP_KERNEL);
 	mutex_unlock(&dev->io_mutex);
 	if (retval) {
-		dev_err(&dev->interface->dev,
-			"%s - failed submitting write urb, error %d\n",
-			__func__, retval);
+		dev_err(&dev->interface->dev, "failed submitting write urb, error %d\n", retval);
 		goto error_unanchor;
 	}
 
@@ -1831,8 +1738,7 @@ static int skel_open(struct inode *inode, struct file *file)
 
 	interface = usb_find_interface(&skel_driver, subminor);
 	if (!interface) {
-		pr_err("%s - error, can't find device for minor %d\n",
-		       __func__, subminor);
+		pr_err("can't find device for minor %d\n", subminor);
 		retval = -ENODEV;
 		goto exit;
 	}
@@ -1895,8 +1801,6 @@ static ssize_t skel_read(struct file *file, char __user *buffer, size_t count,
 
 	rv = skel_do_read(dev, buf, count);
 
-	pr_alert("%s - return with %zu\n", __func__, rv);
-
 	if (rv > 0) {
 		if (copy_to_user(buffer, buf, rv)) {
 			kfree(buf);
@@ -2015,8 +1919,8 @@ static int skel_probe(struct usb_interface *interface,
 	/* let the world know */
 
 	device_path = kobject_get_path(&dev->udev->dev.kobj, GFP_KERNEL);
-	pr_alert("%s:%s - New lpvo_usb_device -> bus: %d  dev: %d  path: %s\n", NAME, __func__,
-		 dev->udev->bus->busnum, dev->udev->devnum, device_path);
+	dev_dbg(&interface->dev, "New lpvo_usb_device -> bus: %d  dev: %d  path: %s\n",
+		dev->udev->bus->busnum, dev->udev->devnum, device_path);
 	kfree(device_path);
 
 #if USER_DEVICE
@@ -2029,14 +1933,9 @@ static int skel_probe(struct usb_interface *interface,
 		usb_set_intfdata(interface, NULL);
 		goto error;
 	}
-
-	/* let the user know what node this device is now attached to */
-	dev_info(&interface->dev,
-		 "lpvo_usb_gpib device now attached to lpvo_raw%d",
-		 interface->minor);
 #endif
 
-	write_latency_timer(dev->udev);     /* adjust the latency timer */
+	write_latency_timer(dev->udev);	    /* adjust the latency timer */
 
 	usb_gpib_init_module(interface);    /* last, init the lpvo for this minor */
 
@@ -2073,8 +1972,6 @@ static void skel_disconnect(struct usb_interface *interface)
 
 	/* decrement our usage count */
 	kref_put(&dev->kref, skel_delete);
-
-	dev_info(&interface->dev, "USB lpvo_raw #%d now disconnected", minor);
 }
 
 static void skel_draw_down(struct usb_skel *dev)
-- 
2.48.1

