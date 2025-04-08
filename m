Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9B8256C7E
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 23:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154746; cv=none; b=lctJwvIQOooL47s8R/e1VC1g8sPWGzBl8OOlAw09nKe65LB2s17GUruKabZhdgefMUCQVtHSqc6BZuHbgVCtlUPMt/p/IfD8vDSZqPpr+13AMCxsz+rFXxIsoNMs1BefPaPtrK/ObA/HTkLoVQKtTDyrBIp1/qYaGd9UyB2mMuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154746; c=relaxed/simple;
	bh=FDFOGHV/HYl8cOAKTE3rLMEo4J1VwlRpC9YCdCus+Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNTXqznbeTbSnvTCc05RMPPXbl5pj+NKPtq8fzmA412vJrGQ9cG/zU3gwqsx8kVPySbpB9G5WtqT7n0jQla+pliUTHbhwWVFfG6zp26PQXCe4w+/E8orpGGIAqmJikD9xuAe3pelUqOXgftucL229PtRkmydkZMyP7+xV9rx4Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=JiS6cBDq; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="JiS6cBDq"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301e05b90caso5843175a91.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154743; x=1744759543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1EdrhX762+aQZGDuYJmIH7iXzqOTw2NeFL65oZJFnw=;
        b=JiS6cBDqd9H8wAuz4NYva7Pf5bZ64C1th4qSuCBrQfJqasesRQ1QvlX5O2ExLfwVEz
         G312uo2Y+VYaWbrCXjuIoXsgtiuCNVIpWWoLv+1jDT50musntZCw83gvlfWgNeEp2kcl
         U4634RoEWoVzUoIj6B/zjcEsap62l3Chg8P1v+mTYh4X2+h3EhrOuRVRKWyaIs7GTXnC
         K3nOY6/zCd4oIT8UMPB450q6urQv5txchpM17cfT2U/7uTYlkKFzXaOyZ2/50dvLOZpl
         RCANcRNvjWW+yeFeO2/OzjQWHTBDKtUcfDPELSgjUBfbS9fwU7PZeq4aGE9j0Xd40ukg
         Xf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154743; x=1744759543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1EdrhX762+aQZGDuYJmIH7iXzqOTw2NeFL65oZJFnw=;
        b=ZTkylE5p7d0Vlh9n5FRk4VtqMg4DKAJEla0WwdcOeE2PsBHtIjQR+PkxTUoLTO6PJy
         UqzEh0pund/K0UP+IoXjcGsJtLhVgRgadf7YWsVqTt+PdCck6A82FMOoW5E1LX/DoMj9
         0tTBeBhL+oJfiGJ0sm7ZgC2pVbcvy2WbYuWlKeILdyUdLGm0qUONYvVe/NBlQDnW5dkC
         0zcyzapPty8bokqqSC9ssDJX1TOrucvLezOInh7kueE/aMjuK1qs8jI3hhPa1LV7nI8W
         HNWmMhokZSMowLFezCknc5fTdqEDjgWL8zqgOOPvLAOF7Ro4POjMkQwN4BAd+eNLG313
         OSAw==
X-Gm-Message-State: AOJu0YwiCNdwih2HcaUCcPjkWPBo1ivsDQspMf8FvSq33HgeO/8CfSFG
	XZ6e/o1G9PyzDvEpdqmZoAhh/s1FNRvSWW81wFqHrOOcBn5NcAJgqoQsQAC7azhMFq+x/POZtFY
	=
X-Gm-Gg: ASbGncs256Gj6IMmsir1dGh/9bHHKkbmF6+2OmRoQrhwR6v+PKKyK9ZVvJv1A70eOVA
	DGsrgLbqBpyS02wAwBy9KS//oLQFPGaIIvZSBVJP9L6rnDeXA6if65vbcszQs7BieCaQ1ulH69q
	8ApNidWrGEZA6K15rfZs4QR4MLRjxXz7E0m7siagwr2z+Evp8YApxmN/SxdoX7+NZWgKjM1JLOo
	IUjHxwfJ+aD6mjAotXWvF9yKYrrMqTeBnIfbY/SLXECW279urgZb5kUev7f19b40p66nByB48A0
	yrpUBtDDx2varyUvA2UKwB9PNjRtY4Gvgb3+12N7Au4PPJy0VPxGscdcT06rvpBLpmolp/+4gjw
	ei/EnuK8uXA==
X-Google-Smtp-Source: AGHT+IFc204K2TYp6h8aLBiJH4lH8yVL10grX089yjIeuOukrTAmVCMbLIDpYKtPyQEQX7YkPnw65A==
X-Received: by 2002:a17:90b:5208:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-306dd529a7amr447376a91.17.1744154743432;
        Tue, 08 Apr 2025 16:25:43 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9804fb5sm11139056b3a.73.2025.04.08.16.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:43 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 4/7] staging: gpib: Removing typedef gpib_status_queue
Date: Tue,  8 Apr 2025 23:25:32 +0000
Message-ID: <20250408232535.187528-5-matchstick@neverthere.org>
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

Removing gpib_status_queue_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 34 +++++++++++------------
 drivers/staging/gpib/common/iblib.c       |  6 ++--
 drivers/staging/gpib/common/ibsys.h       | 11 +++++---
 drivers/staging/gpib/include/gpib_proto.h |  2 +-
 drivers/staging/gpib/include/gpib_types.h |  8 +++---
 5 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 575d9b65f293..a2138c7f641c 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -172,7 +172,7 @@ EXPORT_SYMBOL(gpib_free_pseudo_irq);
 
 static const unsigned int serial_timeout = 1000000;
 
-unsigned int num_status_bytes(const gpib_status_queue_t *dev)
+unsigned int num_status_bytes(const struct gpib_status_queue *dev)
 {
 	if (!dev)
 		return 0;
@@ -180,7 +180,7 @@ unsigned int num_status_bytes(const gpib_status_queue_t *dev)
 }
 
 // push status byte onto back of status byte fifo
-int push_status_byte(struct gpib_board *board, gpib_status_queue_t *device, u8 poll_byte)
+int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device, u8 poll_byte)
 {
 	struct list_head *head = &device->status_bytes;
 	status_byte_t *status;
@@ -214,7 +214,7 @@ int push_status_byte(struct gpib_board *board, gpib_status_queue_t *device, u8 p
 }
 
 // pop status byte from front of status byte fifo
-int pop_status_byte(struct gpib_board *board, gpib_status_queue_t *device, u8 *poll_byte)
+int pop_status_byte(struct gpib_board *board, struct gpib_status_queue *device, u8 *poll_byte)
 {
 	struct list_head *head = &device->status_bytes;
 	struct list_head *front = head->next;
@@ -245,14 +245,14 @@ int pop_status_byte(struct gpib_board *board, gpib_status_queue_t *device, u8 *p
 	return 0;
 }
 
-gpib_status_queue_t *get_gpib_status_queue(struct gpib_board *board, unsigned int pad, int sad)
+struct gpib_status_queue *get_gpib_status_queue(struct gpib_board *board, unsigned int pad, int sad)
 {
-	gpib_status_queue_t *device;
+	struct gpib_status_queue *device;
 	struct list_head *list_ptr;
 	const struct list_head *head = &board->device_list;
 
 	for (list_ptr = head->next; list_ptr != head; list_ptr = list_ptr->next) {
-		device = list_entry(list_ptr, gpib_status_queue_t, list);
+		device = list_entry(list_ptr, struct gpib_status_queue, list);
 		if (gpib_address_equal(device->pad, device->sad, pad, sad))
 			return device;
 	}
@@ -263,7 +263,7 @@ gpib_status_queue_t *get_gpib_status_queue(struct gpib_board *board, unsigned in
 int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
 			 unsigned int usec_timeout, uint8_t *poll_byte)
 {
-	gpib_status_queue_t *device;
+	struct gpib_status_queue *device;
 
 	device = get_gpib_status_queue(board, pad, sad);
 	if (num_status_bytes(device))
@@ -429,7 +429,7 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout)
 	int retval = 0;
 	struct list_head *cur;
 	const struct list_head *head = NULL;
-	gpib_status_queue_t *device;
+	struct gpib_status_queue *device;
 	u8 result;
 	unsigned int num_bytes = 0;
 
@@ -442,7 +442,7 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout)
 		return retval;
 
 	for (cur = head->next; cur != head; cur = cur->next) {
-		device = list_entry(cur, gpib_status_queue_t, list);
+		device = list_entry(cur, struct gpib_status_queue, list);
 		retval = read_serial_poll_byte(board,
 					       device->pad, device->sad, usec_timeout, &result);
 		if (retval < 0)
@@ -1092,7 +1092,7 @@ static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 
 static int status_bytes_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	gpib_status_queue_t *device;
+	struct gpib_status_queue *device;
 	spoll_bytes_ioctl_t cmd;
 	int retval;
 
@@ -1117,13 +1117,13 @@ static int increment_open_device_count(struct gpib_board *board, struct list_hea
 				       unsigned int pad, int sad)
 {
 	struct list_head *list_ptr;
-	gpib_status_queue_t *device;
+	struct gpib_status_queue *device;
 
 	/* first see if address has already been opened, then increment
 	 * open count
 	 */
 	for (list_ptr = head->next; list_ptr != head; list_ptr = list_ptr->next) {
-		device = list_entry(list_ptr, gpib_status_queue_t, list);
+		device = list_entry(list_ptr, struct gpib_status_queue, list);
 		if (gpib_address_equal(device->pad, device->sad, pad, sad)) {
 			dev_dbg(board->gpib_dev, "incrementing open count for pad %i, sad %i\n",
 				device->pad, device->sad);
@@ -1132,8 +1132,8 @@ static int increment_open_device_count(struct gpib_board *board, struct list_hea
 		}
 	}
 
-	/* otherwise we need to allocate a new gpib_status_queue_t */
-	device = kmalloc(sizeof(gpib_status_queue_t), GFP_ATOMIC);
+	/* otherwise we need to allocate a new struct gpib_status_queue */
+	device = kmalloc(sizeof(struct gpib_status_queue), GFP_ATOMIC);
 	if (!device)
 		return -ENOMEM;
 	init_gpib_status_queue(device);
@@ -1151,11 +1151,11 @@ static int increment_open_device_count(struct gpib_board *board, struct list_hea
 static int subtract_open_device_count(struct gpib_board *board, struct list_head *head,
 				      unsigned int pad, int sad, unsigned int count)
 {
-	gpib_status_queue_t *device;
+	struct gpib_status_queue *device;
 	struct list_head *list_ptr;
 
 	for (list_ptr = head->next; list_ptr != head; list_ptr = list_ptr->next) {
-		device = list_entry(list_ptr, gpib_status_queue_t, list);
+		device = list_entry(list_ptr, struct gpib_status_queue, list);
 		if (gpib_address_equal(device->pad, device->sad, pad, sad)) {
 			dev_dbg(board->gpib_dev, "decrementing open count for pad %i, sad %i\n",
 				device->pad, device->sad);
@@ -2147,7 +2147,7 @@ static void init_board_array(struct gpib_board *board_array, unsigned int length
 	}
 }
 
-void init_gpib_status_queue(gpib_status_queue_t *device)
+void init_gpib_status_queue(struct gpib_status_queue *device)
 {
 	INIT_LIST_HEAD(&device->list);
 	INIT_LIST_HEAD(&device->status_bytes);
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index 6cca8a49e839..136be22f7eb2 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -506,7 +506,7 @@ int ibstatus(struct gpib_board *board)
 	return general_ibstatus(board, NULL, 0, 0, NULL);
 }
 
-int general_ibstatus(struct gpib_board *board, const gpib_status_queue_t *device,
+int general_ibstatus(struct gpib_board *board, const struct gpib_status_queue *device,
 		     int clear_mask, int set_mask, gpib_descriptor_t *desc)
 {
 	int status = 0;
@@ -573,7 +573,7 @@ static void init_wait_info(struct wait_info *winfo)
 	timer_setup_on_stack(&winfo->timer, wait_timeout, 0);
 }
 
-static int wait_satisfied(struct wait_info *winfo, gpib_status_queue_t *status_queue,
+static int wait_satisfied(struct wait_info *winfo, struct gpib_status_queue *status_queue,
 			  int wait_mask, int *status, gpib_descriptor_t *desc)
 {
 	struct gpib_board *board = winfo->board;
@@ -626,7 +626,7 @@ int ibwait(struct gpib_board *board, int wait_mask, int clear_mask, int set_mask
 	   int *status, unsigned long usec_timeout, gpib_descriptor_t *desc)
 {
 	int retval = 0;
-	gpib_status_queue_t *status_queue;
+	struct gpib_status_queue *status_queue;
 	struct wait_info winfo;
 
 	if (desc->is_board)
diff --git a/drivers/staging/gpib/common/ibsys.h b/drivers/staging/gpib/common/ibsys.h
index 19960af809c2..a9fdf95cfa96 100644
--- a/drivers/staging/gpib/common/ibsys.h
+++ b/drivers/staging/gpib/common/ibsys.h
@@ -22,10 +22,13 @@
 int gpib_allocate_board(struct gpib_board *board);
 void gpib_deallocate_board(struct gpib_board *board);
 
-unsigned int num_status_bytes(const gpib_status_queue_t *dev);
-int push_status_byte(struct gpib_board *board, gpib_status_queue_t *device, uint8_t poll_byte);
-int pop_status_byte(struct gpib_board *board, gpib_status_queue_t *device, uint8_t *poll_byte);
-gpib_status_queue_t *get_gpib_status_queue(struct gpib_board *board, unsigned int pad, int sad);
+unsigned int num_status_bytes(const struct gpib_status_queue *dev);
+int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
+		     uint8_t poll_byte);
+int pop_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
+		    uint8_t *poll_byte);
+struct gpib_status_queue *get_gpib_status_queue(struct gpib_board *board,
+						unsigned int pad, int sad);
 int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
 			 unsigned int usec_timeout, uint8_t *poll_byte);
 int autopoll_all_devices(struct gpib_board *board);
diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 2c7dfc02f517..80046218c834 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -48,7 +48,7 @@ int ibwait(struct gpib_board *board, int wait_mask, int clear_mask, int set_mask
 	   int *status, unsigned long usec_timeout, gpib_descriptor_t *desc);
 int ibwrt(struct gpib_board *board, uint8_t *buf, size_t cnt, int send_eoi, size_t *bytes_written);
 int ibstatus(struct gpib_board *board);
-int general_ibstatus(struct gpib_board *board, const gpib_status_queue_t *device,
+int general_ibstatus(struct gpib_board *board, const struct gpib_status_queue *device,
 		     int clear_mask, int set_mask, gpib_descriptor_t *desc);
 int io_timed_out(struct gpib_board *board);
 int ibppc(struct gpib_board *board, uint8_t configuration);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 8ec89290523b..f85091b1bdf0 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -307,10 +307,10 @@ struct gpib_event {
 	short event_type;
 };
 
-/* Each board has a list of gpib_status_queue_t to keep track of all open devices
+/* Each board has a list of gpib_status_queue to keep track of all open devices
  * on the bus, so we know what address to poll when we get a service request
  */
-typedef struct {
+struct gpib_status_queue {
 	/* list_head so we can make a linked list of devices */
 	struct list_head list;
 	unsigned int pad;	/* primary gpib address */
@@ -322,14 +322,14 @@ typedef struct {
 	unsigned int reference_count;
 	/* flags loss of status byte error due to limit on size of queue */
 	unsigned dropped_byte : 1;
-} gpib_status_queue_t;
+};
 
 typedef struct {
 	struct list_head list;
 	u8 poll_byte;
 } status_byte_t;
 
-void init_gpib_status_queue(gpib_status_queue_t *device);
+void init_gpib_status_queue(struct gpib_status_queue *device);
 
 /* Used to store device-descriptor-specific information */
 typedef struct {
-- 
2.43.0

