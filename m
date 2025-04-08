Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2620255E37
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150851; cv=none; b=fYeYZJaxKUk7OMRNEOh1yz9R9asl3inPHFhHAyN/6dkmMJbj2xbl/U5RtVmAY9VESYcsqBFm4Cwo2e9bVyRbXYGg43EpCiWeBglABee8B7rywTt116Kr7r5J8JIpsikEYamG4yGJaPiNMYj+XOMFjG2kvCh/CivgZNEv5GisQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150851; c=relaxed/simple;
	bh=KRCyOiCnfMB6DmzNznNaSnaXxvzd7/NRTC8KizHmU9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q74ZFYvdrP/mtQUhqbi6TDXKZhr+BHOG4botuM6YBUUw+Yu2VgqKl38YsFXXSLcnICeYVBIpuq+/ArQhueyg0SNcnSkr5ndpNtU1smJaow1NVG5iE2GCGKfXESBT0CJWtJLKD+OnldI0ggh5mf4tnEke4ZAar3+/oKbNFZGCsX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=eva0Ayhz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="eva0Ayhz"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7398d65476eso108767b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150849; x=1744755649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmfBcj4SMkVq55nUBWDQARkSK+7rsSdCFgt9mDe+mU0=;
        b=eva0AyhzO45t5jFrLRltVCLKjeIcpBW+3UtACbedX+z8Mfn1kVuz+Mgwu/LI2BAUY8
         t5pyvwh9EQC2NmJV/AKe0JMs3OU5zuW7bOlLSeMLvCY6kZyGSdDl6kxGfJR+/86BmP1l
         u5cWkksM2UMeYp2TL0hJbJ4+7zuFHyJcCUoTexaZ/ZVHLtFQ0jT4vOiHk0EMNnB2OoI5
         yFjnnRzaBAkK3YyCtygLt8KsAxWnsPPjTub/9WSNM6ORZHU4MYf6L5vDt+mY5enQeUsu
         QOkgNDudDBQ4o8RIcPfdTz6RKKX6eBOK4rs5bPq+negwN8j4sfWr/qXMJtZsAV8PRoXy
         Y/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150849; x=1744755649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmfBcj4SMkVq55nUBWDQARkSK+7rsSdCFgt9mDe+mU0=;
        b=CmNggWsCadB9cmCGAqOVAo8uCRD1k3ltLU0BQo2IORGcb16q5vgMahF1IAU5AE3FaN
         Hc/nISZjGV2LVxT4PLvf/NnIN6LrdnH5j/TL3cldnwBh3upqI7I6Mq2w2WSWl+sTRQGR
         KrIzr0j6nl2OR2UwHtLqgaw7QTIUfr8Ojp31x3mchvDviFKEIfz87wWDgIJ62oQBfTIH
         FvrjqaOMX3UKD/r/44YDearUmoWGo0Im1QVaszJ93mmzgtlbvMAG3xFPS+Z0MOUXPLlc
         s1ftsyBNhDabCafn+eJa2NQjiSF3qCvHN3uicCTmCD2I48+87VQv6za/UkfD1XGHJ2UR
         I4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSaK4igMCGhXHrzPHXwHYzWGN1BmzvKF+8QwX9IVnzrqPctmJXYy9dSLCIavcQnzOYhp4w4j+e/4ytyAED@lists.linux.dev
X-Gm-Message-State: AOJu0YwVrATwvwAvwZGIPpuOal9wYrEQBUFnt6ydaFKxrZYnKnJRixKn
	pYo2frpKNg8HmsfqMdywSmO8oKjeQezRg3VODqNL5PhptWiXtwH91i2rAjCFEw==
X-Gm-Gg: ASbGnct0Fv6r5xZ8VX0TNjBrXg9m28sTzrXzd/3QUaNziAIy5+yxWEfhjIiBs162oJw
	V3wrtUkXS+v4H2ShgZi6lifcbC6VQ175ue4pi722KIOmaWawWs7IibQAGWFn1azNxPkfElUxbkk
	y3R/XGRlAOyDjrxhoIpVM3EWX40LgSk7xnKinTAkZG37/10EXrINbLoNO63vbsmbdCa2ciClcFd
	A9wvs/eD+N13YABrpqC52mq2U52rPuzOddc5gUxDuLZziJXLU3f6IuEZHBUO26MJAFXuPjZYfMq
	Rw1a0G41Tsx8Q281b0oDPe8hgGwWXrcQ8rUSpX2EuIqREUsjE8uW1vIhG2jgC6sHJ5V5YyzFo3/
	GM6fPLSYDMg==
X-Google-Smtp-Source: AGHT+IGCYm3RnBPyNELvijsQmawFwLjN9JANvMZJ/jwrT9v88delcMRiaJndTvvJoOwt5eYI3z19uA==
X-Received: by 2002:a05:6a00:2e05:b0:736:476b:fccc with SMTP id d2e1a72fcca58-73bae4cc310mr996029b3a.8.1744150849090;
        Tue, 08 Apr 2025 15:20:49 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1a62sm11148336b3a.32.2025.04.08.15.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:48 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 04/14] staging: gpib: common: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:30 +0000
Message-ID: <20250408222040.186881-5-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 8d2f2a663958..711e99b1581a 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -26,7 +26,8 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB base support");
 MODULE_ALIAS_CHARDEV_MAJOR(GPIB_CODE);
 
-static int board_type_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board, unsigned long arg);
+static int board_type_ioctl(gpib_file_private_t *file_priv,
+			    struct gpib_board *board, unsigned long arg);
 static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 		      unsigned long arg);
 static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
@@ -72,7 +73,8 @@ static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg);
 
 static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_board *board);
 
-static int pop_gpib_event_nolock(struct gpib_board *board, gpib_event_queue_t *queue, short *event_type);
+static int pop_gpib_event_nolock(struct gpib_board *board,
+				 gpib_event_queue_t *queue, short *event_type);
 
 /*
  * Timer functions
@@ -258,8 +260,8 @@ gpib_status_queue_t *get_gpib_status_queue(struct gpib_board *board, unsigned in
 	return NULL;
 }
 
-int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad, unsigned int usec_timeout,
-			 uint8_t *poll_byte)
+int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
+			 unsigned int usec_timeout, uint8_t *poll_byte)
 {
 	gpib_status_queue_t *device;
 
@@ -806,7 +808,8 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	return retval;
 }
 
-static int board_type_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board, unsigned long arg)
+static int board_type_ioctl(gpib_file_private_t *file_priv,
+			    struct gpib_board *board, unsigned long arg)
 {
 	struct list_head *list_ptr;
 	board_type_ioctl_t cmd;
@@ -1897,7 +1900,8 @@ int push_gpib_event(struct gpib_board *board, short event_type)
 }
 EXPORT_SYMBOL(push_gpib_event);
 
-static int pop_gpib_event_nolock(struct gpib_board *board, gpib_event_queue_t *queue, short *event_type)
+static int pop_gpib_event_nolock(struct gpib_board *board,
+				 gpib_event_queue_t *queue, short *event_type)
 {
 	struct list_head *head = &queue->event_head;
 	struct list_head *front = head->next;
-- 
2.43.0

