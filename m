Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B61257448
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154749; cv=none; b=NLUJs8TI3vhUSPIK51XwKrcGkhH59bjN0yqDoTC8obiE9ZvMtrapoFxPtk2FvGKiGDIP5f7AZ9bDQJuFKkZT8GEdaB00ZoM5eoT+y8sTWGYEpsJ6NuF6IahRw7mAcELPFlwxuleC+u/akUxs+cXir/unfqdnflX1/F6N4N8xotA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154749; c=relaxed/simple;
	bh=Lmctd6vpHrfJUTj3ifUWKkU/sArZCAoIqbGi/Med02Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jL0KP/4uq2Z+kv3ZDrFHYSbwZFJBZHjNwRIjyiSxBHnhcVtW1pk3oijB248sm77w0Ms1UEbIAcejnQOds5rPkxi2pwSNZ0rt0OuakoCJAJqkiR9NzjaqNwAG/SePXIRRybONXkv53coh/w+9s15/9Y1ZiNwTNFOfMUBbw5DJLz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Qm+tyf9v; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Qm+tyf9v"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22622ddcc35so83020395ad.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 16:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154747; x=1744759547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MoK6FPlVFbuKd+bgN/UwDHVwPNikkjjLk9d6W5WBjg=;
        b=Qm+tyf9v+fNaaYWi+b2ZsZTxl2BAaerVDZjIoSEr2ASJTCKL7Y9Az/pcNOzQlcFv6l
         sge4dBzuMgjTgcwKJd7JDO3kIhv2jlzHGVYSGJfW5LMry0DULFHq+AyGV0p31iHiYw53
         1/zm3ENorP6ZJ+0582wArPEhUYFvpScfHjk5nDOzgNLWHS4DKEcAdyUcj+ucrEjcnXh8
         Osa2JH/ykrpM76aVTYFnBXh5TWXutSyMnvhuDaPCCviWQq1vdPyLbpqt4M9A+OOEWyQc
         u7iUeJIv+YFYdPWbzshAukLnt76Ie+xxLHj5Lf2UPkjDebHria5P8ulDrgP/W5kIGpmd
         mV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154747; x=1744759547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MoK6FPlVFbuKd+bgN/UwDHVwPNikkjjLk9d6W5WBjg=;
        b=ag3WbqNXIYww4BjwtRbkLZE0YEj5bvMF7DZyC1FOOD4z1/GiOM6cUpxd4h+ssc1nXe
         XJbgchwCFv2ZS/0wAuicv6zL1b+EFmnnX/O2u/3C7PBaWG2rRSsbmKj+JfPqmoXahm/g
         S7aCoTsUEvSH8e8B2mvi/I4Y/xXr1bsJGzdY+RXMimHJQsVLmPyAhm/Sb7pE0tLRPWaj
         Gq5EA5xAJUhdYw25n7L4oZoYi5gGqNAhziDunSyi7rcBScL4HXe22fkc12qEKoCiZaT1
         /cICLxGp/o5xm9BM3sMgEhdXSoEnNllR+To0iSG0O28ONlKuQesuhU1XgX+YVm+bFXgI
         gZKw==
X-Gm-Message-State: AOJu0YxiN/OTUDnNPVWklNG2EMK4HTlyVTbcPyK+HmiGwQh1yiLflOkU
	b231oMjUTIJScEq/AGOcn/KLld2+hboyeNA3dt9y7w2hzn5Vx1I9MPtH05OaHY9MAaB5o/l0Kls
	=
X-Gm-Gg: ASbGncvQ/j/V2/yx5EkfwvCmRva8vldXblzPuUOW/+2iuWKsJuRSBfxQztqEbwoNJYk
	dKCz3OcKM0n3bgq95+QbKCq416BjgpNS0E6ZP52Np8syC0xNnt35qD6USoXz6ph4ToDAhYKH0Xd
	oQ4OY4kk1TwqngOISHhs85EsRB/oXHd8r7NAXhUNqV0wktivEQdCDWoTbScRxy7IdMRNaKnjWbz
	ukdS5FtPzUwhvg4PA+C/s1hIRWiQHNvtAAIb7iYEDzZgpIIK5qyw4HDZQw1gbADXaVmu30T65Ow
	p8QaRc3JWZOkmBZbZZYKRO3pCAlUjm6+juQ0fqa/8+kwiN1bUgEIBQW3x7BGhadTqsZmLWPtNKR
	1tlU4sAU6gQ==
X-Google-Smtp-Source: AGHT+IFWX5QMJi9HBKsf6eI3URaf8Mln6NBm+b8Pqz2yg9dB+B2ryEhNl8VacoYUHHJvA2n82ZHxzg==
X-Received: by 2002:a17:903:248:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22ac29a69aemr12776565ad.17.1744154747108;
        Tue, 08 Apr 2025 16:25:47 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e066sm106849045ad.137.2025.04.08.16.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:46 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 7/7] staging: gpib: Remove typedef gpib_file_private_t
Date: Tue,  8 Apr 2025 23:25:35 +0000
Message-ID: <20250408232535.187528-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408232535.187528-1-matchstick@neverthere.org>
References: <20250408232535.187528-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_file_private_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 61 ++++++++++++-----------
 drivers/staging/gpib/include/gpib_types.h |  4 +-
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 6aaf15ffb02b..8365eb293d0b 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -26,26 +26,27 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB base support");
 MODULE_ALIAS_CHARDEV_MAJOR(GPIB_CODE);
 
-static int board_type_ioctl(gpib_file_private_t *file_priv,
+static int board_type_ioctl(struct gpib_file_private *file_priv,
 			    struct gpib_board *board, unsigned long arg);
-static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int read_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg);
-static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int write_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		       unsigned long arg);
-static int command_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int command_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 			 unsigned long arg);
 static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg);
 static int close_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg);
 static int serial_poll_ioctl(struct gpib_board *board, unsigned long arg);
-static int wait_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board, unsigned long arg);
+static int wait_ioctl(struct gpib_file_private *file_priv,
+		      struct gpib_board *board, unsigned long arg);
 static int parallel_poll_ioctl(struct gpib_board *board, unsigned long arg);
 static int online_ioctl(struct gpib_board *board, unsigned long arg);
 static int remote_enable_ioctl(struct gpib_board *board, unsigned long arg);
 static int take_control_ioctl(struct gpib_board *board, unsigned long arg);
 static int line_status_ioctl(struct gpib_board *board, unsigned long arg);
-static int pad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int pad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg);
-static int sad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int sad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg);
 static int eos_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_service_ioctl(struct gpib_board *board, unsigned long arg);
@@ -53,9 +54,9 @@ static int request_service2_ioctl(struct gpib_board *board, unsigned long arg);
 static int iobase_ioctl(struct gpib_board_config *config, unsigned long arg);
 static int irq_ioctl(struct gpib_board_config *config, unsigned long arg);
 static int dma_ioctl(struct gpib_board_config *config, unsigned long arg);
-static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int autospoll_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 			   unsigned long arg);
-static int mutex_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int mutex_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		       unsigned long arg);
 static int timeout_ioctl(struct gpib_board *board, unsigned long arg);
 static int status_bytes_ioctl(struct gpib_board *board, unsigned long arg);
@@ -71,7 +72,7 @@ static int event_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_system_control_ioctl(struct gpib_board *board, unsigned long arg);
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg);
 
-static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_board *board);
+static int cleanup_open_devices(struct gpib_file_private *file_priv, struct gpib_board *board);
 
 static int pop_gpib_event_nolock(struct gpib_board *board,
 				 struct gpib_event_queue *queue, short *event_type);
@@ -494,8 +495,8 @@ int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	return retval;
 }
 
-static struct gpib_descriptor *handle_to_descriptor(const gpib_file_private_t *file_priv,
-					       int handle)
+static struct gpib_descriptor *handle_to_descriptor(const struct gpib_file_private *file_priv,
+						    int handle)
 {
 	if (handle < 0 || handle >= GPIB_MAX_NUM_DESCRIPTORS) {
 		pr_err("gpib: invalid handle %i\n", handle);
@@ -505,7 +506,7 @@ static struct gpib_descriptor *handle_to_descriptor(const gpib_file_private_t *f
 	return file_priv->descriptors[handle];
 }
 
-static int init_gpib_file_private(gpib_file_private_t *priv)
+static int init_gpib_file_private(struct gpib_file_private *priv)
 {
 	memset(priv, 0, sizeof(*priv));
 	atomic_set(&priv->holding_mutex, 0);
@@ -524,7 +525,7 @@ int ibopen(struct inode *inode, struct file *filep)
 {
 	unsigned int minor = iminor(inode);
 	struct gpib_board *board;
-	gpib_file_private_t *priv;
+	struct gpib_file_private *priv;
 
 	if (minor >= GPIB_MAX_NUM_BOARDS) {
 		pr_err("gpib: invalid minor number of device file\n");
@@ -533,12 +534,12 @@ int ibopen(struct inode *inode, struct file *filep)
 
 	board = &board_array[minor];
 
-	filep->private_data = kmalloc(sizeof(gpib_file_private_t), GFP_KERNEL);
+	filep->private_data = kmalloc(sizeof(struct gpib_file_private), GFP_KERNEL);
 	if (!filep->private_data)
 		return -ENOMEM;
 
 	priv = filep->private_data;
-	init_gpib_file_private((gpib_file_private_t *)filep->private_data);
+	init_gpib_file_private((struct gpib_file_private *)filep->private_data);
 
 	if (board->use_count == 0) {
 		int retval;
@@ -562,7 +563,7 @@ int ibclose(struct inode *inode, struct file *filep)
 {
 	unsigned int minor = iminor(inode);
 	struct gpib_board *board;
-	gpib_file_private_t *priv = filep->private_data;
+	struct gpib_file_private *priv = filep->private_data;
 	struct gpib_descriptor *desc;
 
 	if (minor >= GPIB_MAX_NUM_BOARDS) {
@@ -608,7 +609,7 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 {
 	unsigned int minor = iminor(filep->f_path.dentry->d_inode);
 	struct gpib_board *board;
-	gpib_file_private_t *file_priv = filep->private_data;
+	struct gpib_file_private *file_priv = filep->private_data;
 	long retval = -ENOTTY;
 
 	if (minor >= GPIB_MAX_NUM_BOARDS) {
@@ -808,7 +809,7 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	return retval;
 }
 
-static int board_type_ioctl(gpib_file_private_t *file_priv,
+static int board_type_ioctl(struct gpib_file_private *file_priv,
 			    struct gpib_board *board, unsigned long arg)
 {
 	struct list_head *list_ptr;
@@ -860,7 +861,7 @@ static int board_type_ioctl(gpib_file_private_t *file_priv,
 	return -EINVAL;
 }
 
-static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int read_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg)
 {
 	read_write_ioctl_t read_cmd;
@@ -935,7 +936,7 @@ static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 	return read_ret;
 }
 
-static int command_ioctl(gpib_file_private_t *file_priv,
+static int command_ioctl(struct gpib_file_private *file_priv,
 			 struct gpib_board *board, unsigned long arg)
 {
 	read_write_ioctl_t cmd;
@@ -1019,7 +1020,7 @@ static int command_ioctl(gpib_file_private_t *file_priv,
 	return retval;
 }
 
-static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int write_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		       unsigned long arg)
 {
 	read_write_ioctl_t write_cmd;
@@ -1183,7 +1184,7 @@ static inline int decrement_open_device_count(struct gpib_board *board, struct l
 	return subtract_open_device_count(board, head, pad, sad, 1);
 }
 
-static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_board *board)
+static int cleanup_open_devices(struct gpib_file_private *file_priv, struct gpib_board *board)
 {
 	int retval = 0;
 	int i;
@@ -1212,7 +1213,7 @@ static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned
 {
 	open_dev_ioctl_t open_dev_cmd;
 	int retval;
-	gpib_file_private_t *file_priv = filep->private_data;
+	struct gpib_file_private *file_priv = filep->private_data;
 	int i;
 
 	retval = copy_from_user(&open_dev_cmd, (void __user *)arg, sizeof(open_dev_cmd));
@@ -1261,7 +1262,7 @@ static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned
 static int close_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg)
 {
 	close_dev_ioctl_t cmd;
-	gpib_file_private_t *file_priv = filep->private_data;
+	struct gpib_file_private *file_priv = filep->private_data;
 	int retval;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
@@ -1306,7 +1307,7 @@ static int serial_poll_ioctl(struct gpib_board *board, unsigned long arg)
 	return 0;
 }
 
-static int wait_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int wait_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg)
 {
 	wait_ioctl_t wait_cmd;
@@ -1433,7 +1434,7 @@ static int line_status_ioctl(struct gpib_board *board, unsigned long arg)
 	return 0;
 }
 
-static int pad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int pad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg)
 {
 	pad_ioctl_t cmd;
@@ -1469,7 +1470,7 @@ static int pad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
 	return 0;
 }
 
-static int sad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int sad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg)
 {
 	sad_ioctl_t cmd;
@@ -1595,7 +1596,7 @@ static int dma_ioctl(struct gpib_board_config *config, unsigned long arg)
 	return 0;
 }
 
-static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int autospoll_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 			   unsigned long arg)
 {
 	autospoll_ioctl_t enable;
@@ -1633,7 +1634,7 @@ static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_p
 	return retval;
 }
 
-static int mutex_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int mutex_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		       unsigned long arg)
 {
 	int retval, lock_mutex;
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2b4e98d1aa76..0dbe45894884 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -340,13 +340,13 @@ struct gpib_descriptor {
 	unsigned autopoll_enabled : 1;
 };
 
-typedef struct {
+struct gpib_file_private {
 	atomic_t holding_mutex;
 	struct gpib_descriptor *descriptors[GPIB_MAX_NUM_DESCRIPTORS];
 	/* locked while descriptors are being allocated/deallocated */
 	struct mutex descriptors_mutex;
 	unsigned got_module : 1;
-} gpib_file_private_t;
+};
 
 #endif	/* __KERNEL__ */
 
-- 
2.43.0

