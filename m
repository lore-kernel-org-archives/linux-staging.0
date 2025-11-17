Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86523016F7
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403627; cv=none; b=rbqVNXa/aGegdPenE9m2r3TykQkqGkITXkopwjZ9DwXN0CNCZsmzPIAlPD8vhPgge6jkeWR74YGRWhoSs+vEIOLohI7VboiIi3Smji7KHKfzAlVB1vihf77f/XONVj5io+teLq8/8a028Xhn6g5Pmorc21f2uHq8Qa9yqImRJ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403627; c=relaxed/simple;
	bh=34qpfxZ43Yc0mMRCZrFslUOZ5yMB59tLDhzkTRLt1zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dkklr889EjTsjfBotCuk74ZY137gtPdtlkL7HBZcb3nGtqCRIg4kug9O4tLP7xkEi4239TQgyg8eqhgyEWJ/i1EIdWQ9TUZXXcKvMtazDEv5Q8gW+cOCl9zZtYvoF9TiP42PAaDHubydC64xToBM8pI0aXa3zly6Y8iGhvQO8ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WV/3ud3m; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV/3ud3m"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-299d40b0845so28788145ad.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403625; x=1764008425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1mB0CpFd+R5GNJI4Uir4mYrR+aByyYZc5gPF4SEOFw=;
        b=WV/3ud3mHh1d3AFjpJji6RpAuXEsYi/6EVuPXhYQW59qaZh1SLXCSSkTSoBNJu8DkJ
         A+jRa7RZuWxbVvgxoCQta2PpMfazxlixMZDwR3ZiUOPGHUGEjt4ym3nXGUCQdcLN71NP
         p/Swkmzp5JCZ4/hZPDZCx7XKUQLymX2sgBuLVFPdoxSWuXVKgfNu5QlSM/mju0xjajVX
         0OfnCO/0OhLNV/YHt+vju3g/AQimC1mGLfjjwtah4GsaeT1LLOs6yEiPrzBjC1kW3ygc
         1z5mzFSL/TwY58vHLTVNalRFTon9kACn/Ynw39rSxsh+dbLD+juI/9Axh+tNEIHzVDzP
         gYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403625; x=1764008425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l1mB0CpFd+R5GNJI4Uir4mYrR+aByyYZc5gPF4SEOFw=;
        b=f9y1kO5QkfSEh2bRL6L5cHyfjhn4d9/P07ZPmkFhsV243dNDaVLKNa8UFOnzL3EWCF
         jNIFeMvmq2luJez+EiRsRHjezfVNxiEqQ8DGeWzP0Qb8VAEGHAAbl6wmzLnMhYM1wToh
         Lh/eaf55YFeoo8DkyES07EBxDtsTRtsmLTt/zS95FYJoGY7zUEzr4RB4l1aRbDqu8rE/
         skOCTwsuH4RLfZx57IZSY2yKj6KfLc+i2EmvaHYDHCSqiCxKZAMK+JhXsiZfjIon/lX8
         abQw0+BEtRUM8a4+nHinrxrM5/5J4cmaiKt0FNV6/Je+gUhjqhb2BKRGTHSKhFNgvnCp
         CdbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwYjARmK8EV8doa9GA8xbGVs0ADT+PaKOthGCjNLahIa3/3BbqhTWI3Ze5anHMV7NY9i4A20pcEEOkUxm0@lists.linux.dev
X-Gm-Message-State: AOJu0YztkXW1IPPr2tFRPml4iI1vYoUB4ojDKMtZbaux3OSp3yUo3gQM
	LK98hyNIrL56Vh6DWy1DRUvk/VvoMQD2m08q24EbOmwxS1Es8cpxIVhJ
X-Gm-Gg: ASbGncsZbcFtK15UMQOMru0cPtkn+hifUTlnpC2iT1L0z/07bV349JS6dbr8m6PWBMW
	2R4xK0zJN2WgNrTSrT5lm6IiK7Km2ZSev+W/bxOHdWsInRpJCCjVEBMA50+0D4JCdxYRVBkFluL
	CBM9MYN9jo2CfvBjhqUmoT1GEBigcPbNlEJDfiR37ebF3tWhlbtEWGMvRR+b411vPqBDXFl/N+q
	sd/hSb92YvO2uAXTyfx5VcbOcMKJOqBBrtydy2a7rGoViwXDl4vprfno8ibgnd4EvajsjUW3m73
	zjOnOTmQW2VXARX/jnziVMBhxeAIfRPtJ8EpHkOkSdNtP+bm0K/DtBUzbw5yM3xpapsQNf5m0gv
	LMIC7a9s+G4ZDWGxfnEh4ZbOe9XvanZOc4LobGZdvXqa60qrU9ElR5l6FLL5hCqm9pQ0gJ2tOz+
	fQedlqvWSidw3CkxOdIR+QpzMCBS7CAQslB5UhghUZ2gkDJuGZWtLoJR7zLA==
X-Google-Smtp-Source: AGHT+IGiEWPxLbEgpjBHVrDGSz/TUvKwXuB+j47KfouqPtMB4OuRPOjWMzWj+ptVTlnSMzy+nKSnOA==
X-Received: by 2002:a17:903:2b10:b0:297:d777:a2d4 with SMTP id d9443c01a7336-2986a752800mr153002665ad.46.1763403625089;
        Mon, 17 Nov 2025 10:20:25 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:24 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 10/13] staging: greybus: raw: handle disconnect while chardev is open
Date: Mon, 17 Nov 2025 23:48:15 +0530
Message-ID: <20251117181818.118139-11-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The raw protocol driver destroyed its character device and freed its
private data even when userspace still had the device node open. This
could cause use-after-free access through active file operations.

Fix this by marking the device as disconnected, returning -ENODEV from
all file operations after disconnect, and disabling the Greybus
connection before destroying the cdev. This provides safe teardown
without redesigning the driver.

Remove the obsolete FIXME

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/raw.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739c..74818ca829c2 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -24,6 +24,7 @@ struct gb_raw {
 	dev_t dev;
 	struct cdev cdev;
 	struct device *device;
+	bool disconnected;
 };
 
 struct raw_data {
@@ -231,10 +232,14 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *raw_data;
 	struct raw_data *temp;
 
-	// FIXME - handle removing a connection when the char device node is open.
+	/* Mark device as disconnected so file operations fail gracefully */
+	raw->disconnected = true;
+
+	/* Disable Greybus connection before destroying the chardev */
+	gb_connection_disable(connection);
+
 	device_destroy(&raw_class, raw->dev);
 	cdev_del(&raw->cdev);
-	gb_connection_disable(connection);
 	ida_free(&minors, MINOR(raw->dev));
 	gb_connection_destroy(connection);
 
@@ -262,6 +267,9 @@ static int raw_open(struct inode *inode, struct file *file)
 	struct cdev *cdev = inode->i_cdev;
 	struct gb_raw *raw = container_of(cdev, struct gb_raw, cdev);
 
+	if (raw->disconnected)
+		return -ENODEV;
+
 	file->private_data = raw;
 	return 0;
 }
@@ -272,6 +280,9 @@ static ssize_t raw_write(struct file *file, const char __user *buf,
 	struct gb_raw *raw = file->private_data;
 	int retval;
 
+	if (raw->disconnected)
+		return -ENODEV;
+
 	if (!count)
 		return 0;
 
@@ -292,6 +303,9 @@ static ssize_t raw_read(struct file *file, char __user *buf, size_t count,
 	int retval = 0;
 	struct raw_data *raw_data;
 
+	if (raw->disconnected)
+		return -ENODEV;
+
 	mutex_lock(&raw->list_lock);
 	if (list_empty(&raw->list))
 		goto exit;
-- 
2.51.0

