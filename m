Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4DC256C78
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151832; cv=none; b=fTFrbSALtU4VeLBAy6pWjm+dbPv4RqBI43BSrNvriv/yQDXSbUyXgFMRPcRrJxQATDEnOXJWf+prZDxFuZmBVYCGA+Ny/Iyw6wTUnqyKoOT9oWf/QyUHb5EMH8OsL8yX1QWOWR2Aps9TwtHrypzLfFXUICzfagS46Zm0x4+99oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151832; c=relaxed/simple;
	bh=9jnj8JCPLNJB7Y8bWf2v76OtUtjBvHVIvX7+JBZZ3HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8FzE6RZ4jdMSyT2aCv3VUVRexJ+SBA+sqENO4vWi1yl6NW/fCNmmHgZfqxGhli+dytSaQ1kBYB0WhwfkGT12Fn7Tq+yEyX/TWAQX27nmBLT+2OtX0IyY0eSImO+mxJGF/NX9lw6eKKWgI+qMXT61ssgrRe9nbzWBxvMKyOwKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=GgGPLDdC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="GgGPLDdC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736c277331eso114635b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151830; x=1744756630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWMnH0Did5XyzW5jfPrUxbx63YMfVnoGAwbN881GRAA=;
        b=GgGPLDdCBATPN8JFDy0w7MFbAswalR2y1HjikVLlhNlR8HgQTXm8U6HCe5IXSWP8Mr
         ei4G0K2ydhSjh2XY0lhZAjYVTya4gi/JsTe7nPaZxORFys/WOGroQF3lbY3N/xilHA41
         zTLEgyKj0Jq+KpEG6Mo47UTc2GFpmGiyYTX2ISRtFTgWxN2pzno/Lg0gTrRxYTIFYjyS
         Nid6cIG49uuWpOY/ETr7V/0m0vy7caftSUoSZ90Q7rlsZrRkUqW8jmTn5sIO/64qdZar
         CLHdK0dTmB1+lix71/6RQ4wx5q7UnJSoIqG59XUNgVlCQzw+M9nIM3uL5/uhrm4istvY
         kZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151830; x=1744756630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWMnH0Did5XyzW5jfPrUxbx63YMfVnoGAwbN881GRAA=;
        b=IQbz+YvNXPV5VCCgj8gKDtQkCUJnN4pERUltW6/pitv8fH8msMIt1oJVatt4fcDuAs
         RaC1s6KRUtuxxTBX3RETKTW2F+gdJlMiDyTfvczSX04RjgfLi75hEzbj44j5tDLFJEOu
         dwzsSCg/4oEF0S9yyRNUoXuiEhHrEVbiysGBFT96Qzv8k/zsgVcLPSJG++C5bAgeI4Kb
         WHcDLpwd582VYfn8qKO2eT/GQravjPo9tIHkWm2g0QEBBkmH0idB98qbz7BltGw5zg95
         v0I8dqvEZbbW7PIiVcUYyd8KOG5/zhTcwhhMNScUizIdu9u/xvTImipLlK6Hnvsd8dL0
         /wbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFKYBhMUtW3sLKOlDD8bIzJ+FwpgxDqfaYW4udT5sC1rSSsibeCuCRpzV0rdqfNEOjwJWaRTv76bZhEazq@lists.linux.dev
X-Gm-Message-State: AOJu0YyqQhDj9+yY5+7NoXeRY95QWNcnusWNbIdrftWV9cA9ZTHx24lF
	/mvd2Lujz1Lm3PfPu0SHpzA7Otxs1vrKfzshO5KNBGvIjP26daXYnEt3ywPiaf7x3b4XfNuHbc0
	=
X-Gm-Gg: ASbGncsuPbCN88z4LQ5iqk8jpCJGz0V55KUJgFDPAKs+ZNX62ASFlfy8h1QW7WZzcRo
	8xoGf9pRZOTy7ltmw3Jm//+8KjDMRHWf+LjRwIiEM/CF6AAxxbiihi0E3r0ApfojFK/n9IwV+nP
	Zu5nRR10th0NGyaheG75oe7Dy3utwieYLl5ZsNXyvuSw+52zehT6N7DBc3rXJ08WgqekWQlwYlG
	H9YNmqSGG31Geoj4RnToeE7VQugmppG5TP1KIXFcQyQTdMAIgtj4CykmdDN2AIPsFLj1yJu9Acc
	QIhXUHJCxuvDJ/kH/7bI8sBtrB/vGXwnb6+ssjEnd3ppzdWUTOTXG9Ab+5Qdcd7f3qKoZ44r6nd
	VcpYdxXDQRw==
X-Google-Smtp-Source: AGHT+IHYwI5R9KBRqVHiDJeq7AElYZCltjRwDzA4lymP8T/15XjM0s5gRterfVSjI9Y2OBeLz0wGVg==
X-Received: by 2002:a17:90a:f944:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-306d0d1d6e8mr7027966a91.11.1744151829879;
        Tue, 08 Apr 2025 15:37:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30584761e65sm11641716a91.13.2025.04.08.15.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 06/18] staging: gpib: common: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:46 +0000
Message-ID: <20250408223659.187109-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c | 28 +++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 940ea05ba478..f2216768d8bd 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -50,9 +50,9 @@ static int sad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
 static int eos_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_service_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_service2_ioctl(struct gpib_board *board, unsigned long arg);
-static int iobase_ioctl(gpib_board_config_t *config, unsigned long arg);
-static int irq_ioctl(gpib_board_config_t *config, unsigned long arg);
-static int dma_ioctl(gpib_board_config_t *config, unsigned long arg);
+static int iobase_ioctl(struct gpib_board_config *config, unsigned long arg);
+static int irq_ioctl(struct gpib_board_config *config, unsigned long arg);
+static int dma_ioctl(struct gpib_board_config *config, unsigned long arg);
 static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
 			   unsigned long arg);
 static int mutex_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
@@ -65,8 +65,8 @@ static int set_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long ar
 static int get_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long arg);
 static int query_board_rsv_ioctl(struct gpib_board *board, unsigned long arg);
 static int interface_clear_ioctl(struct gpib_board *board, unsigned long arg);
-static int select_pci_ioctl(gpib_board_config_t *config, unsigned long arg);
-static int select_device_path_ioctl(gpib_board_config_t *config, unsigned long arg);
+static int select_pci_ioctl(struct gpib_board_config *config, unsigned long arg);
+static int select_device_path_ioctl(struct gpib_board_config *config, unsigned long arg);
 static int event_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_system_control_ioctl(struct gpib_board *board, unsigned long arg);
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg);
@@ -1542,7 +1542,7 @@ static int request_service2_ioctl(struct gpib_board *board, unsigned long arg)
 		      request_service2_cmd.new_reason_for_service);
 }
 
-static int iobase_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int iobase_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	u64 base_addr;
 	int retval;
@@ -1561,7 +1561,7 @@ static int iobase_ioctl(gpib_board_config_t *config, unsigned long arg)
 	return 0;
 }
 
-static int irq_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int irq_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	unsigned int irq;
 	int retval;
@@ -1578,7 +1578,7 @@ static int irq_ioctl(gpib_board_config_t *config, unsigned long arg)
 	return 0;
 }
 
-static int dma_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int dma_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	unsigned int dma_channel;
 	int retval;
@@ -1793,7 +1793,7 @@ static int interface_clear_ioctl(struct gpib_board *board, unsigned long arg)
 	return ibsic(board, usec_duration);
 }
 
-static int select_pci_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int select_pci_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	select_pci_ioctl_t selection;
 	int retval;
@@ -1811,7 +1811,7 @@ static int select_pci_ioctl(gpib_board_config_t *config, unsigned long arg)
 	return 0;
 }
 
-static int select_device_path_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int select_device_path_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	select_device_path_ioctl_t *selection;
 	int retval;
@@ -2069,9 +2069,9 @@ void gpib_unregister_driver(struct gpib_interface *interface)
 }
 EXPORT_SYMBOL(gpib_unregister_driver);
 
-static void init_gpib_board_config(gpib_board_config_t *config)
+static void init_gpib_board_config(struct gpib_board_config *config)
 {
-	memset(config, 0, sizeof(gpib_board_config_t));
+	memset(config, 0, sizeof(struct gpib_board_config));
 	config->pci_bus = -1;
 	config->pci_slot = -1;
 }
@@ -2212,7 +2212,7 @@ int gpib_match_device_path(struct device *dev, const char *device_path_in)
 }
 EXPORT_SYMBOL(gpib_match_device_path);
 
-struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
+struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from)
 {
 	struct pci_dev *pci_device = from;
@@ -2231,7 +2231,7 @@ struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned
 }
 EXPORT_SYMBOL(gpib_pci_get_device);
 
-struct pci_dev *gpib_pci_get_subsys(const gpib_board_config_t *config, unsigned int vendor_id,
+struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, unsigned int ss_vendor,
 				    unsigned int ss_device,
 				    struct pci_dev *from)
-- 
2.43.0

