Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA82139C9
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178373; cv=none; b=ecWo8caQ/6806SY8ptb0IWs9D+CjABdVdCewIs4EXBrb5d+BvrXP2FXQZYkM3B2DeTNkBnWZCH9YyKWdMroQwId6+G1fsw11GeKlrnwAHVRyRai0gQucbBrJUpgRve7QlaGageRmj4SfCduewXNCToaGvjUTV7yOEMG+vf5LJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178373; c=relaxed/simple;
	bh=aXPhtRhaMr1ilREq00flcnfwj9TVbFWLuAjTzeOl85U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h088orupGJO3NZeuwy6yaNy2NmhwuUdh6QDkff9ww+v/Zpx6kQv2E/V1/O8rI8Z0bzMaLxk4J46LT2uoIo0Tepe4GamGbczGKGRcrv/FI0mJaS6Zekb6cUg2+HttGL18Rp6p+tI1HG5fSbEJf6eYDwjpfScPlVTv8MtRveVPD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ZuHCgjlk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ZuHCgjlk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b0c68092so5274408b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178372; x=1744783172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIu1dXNTYwl5r+9cV5uhg1+tHlwwvRGyoned6m5udoo=;
        b=ZuHCgjlkCmjxoG+2Lt5WlFnYUhvaVrBerpym+3qDHHY5PGXFTtPfFgKVSvMElQ+eeW
         0qcvVoNgxPggAxISvQXUUUhmo0y8MIuy10TIvgs7UDee9zOW2TB0qKdz8R6HBM0iCVG0
         2yklkM7HSJvnknfxZlXmO/knXHkMgjIL1Dj9CojryiItYBz6lBvOwVWi5NXeRT3br9TN
         RQVX+AqZCrkaB2H1B/plt4PVw2nADUiQaIVfj1Tf+qh2Em74bs6gUiAX1FUI7g1xPCye
         drLcS5qqxS8iAU8LDewyZDEts689bvsEszHhyTnu3pONi3BGCCJf+F+QZCoNwNwj9PWt
         iloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178372; x=1744783172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIu1dXNTYwl5r+9cV5uhg1+tHlwwvRGyoned6m5udoo=;
        b=dwg6kmJAv/uLQsBeRPlrBJ3GkMDvClHdrCw7uRlCntQ19/31HPgagJku5iunttgkSF
         jYcCrD60Z6OIj1ASDptAYT06lNBA9SSfXF4uDyh2a9lA+ZkvJkC7RTNk6YEyugKmrp2H
         X9nqtTxNAvvMfISugCntoSHqsj+IkB5kEggnoRcNBZ+X27di/u5GUjNMvxh1+Ft+Kjpi
         FjJ+Vi8wzm6cnImXeu9sN0s3wqltbIuzzwOdUogjh1oozKa6LKfjEEVH/p5UU5D9GcfM
         MHhmFv+sLv+yPJsz+liVmLf/8orx1qeV4XMFjJfpbJyXi6ZLC9ghiKK91FESrIGpfUrB
         xFjw==
X-Gm-Message-State: AOJu0YxPnZcrlslGtBJQ+3qSIOh4PlhYS/LYQRQpy+PCUj117jRf9o+m
	rOnNw1q98/qlhEWcWDGAWVgdsPrmOMGd9j7KMiPqgE1OO9gDJU72f/+S3U8PFQ==
X-Gm-Gg: ASbGnctc+DwvBXAtz+m7Txsgzd/J9gZHZBKM1EjgupmPMBZg1euAYh1NarMIl05CeRd
	/upfpstpm+6KV4Xz7t6Z/gvROibRiWxlDBaZUrN8yjWTpsE3OPtR/X/X7z67c4eB4xojKKPgZxw
	i0HBhpbePmAWMzrmVmZhNXADj8pnDJsDU5X5tB7y/6drSccU1iDBCLAKI3K9NXAKVoRLwm44rcJ
	QExgx3nMPTaNI5s/MzLeZNYroTBdfFzHQ0GUDuY+SeLb38D610MqZkgKJ3zBK1+QkpsiVFO1l2d
	n5BwBERN5xghqkyxNrm8xeQ74GpRlslIzCMEuk148HG6QqE8uAmv8pu1+vJc7pfTmV00ENccBCF
	r3lsGQw==
X-Google-Smtp-Source: AGHT+IEo/rej9w7R9G6fsBL4lZri+tY36Xc58KKxG1xuULe4YRg62fI+jLm3m+YZ4Z6XWF9E9BAf/g==
X-Received: by 2002:a05:6a00:39aa:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-73bae49574bmr2559782b3a.3.1744178371587;
        Tue, 08 Apr 2025 22:59:31 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d516e9sm430158b3a.44.2025.04.08.22.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:31 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 21/21] staging: gpib: local_ppoll_mode_ioctl_t now short
Date: Wed,  9 Apr 2025 05:59:03 +0000
Message-ID: <20250409055903.321438-22-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style to replace typedef local_ppoll_mode_ioctl_t with
type short.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 4 ++--
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 6a92562ae39c..7d0c03ebe624 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1718,7 +1718,7 @@ static int ppc_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int set_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	local_ppoll_mode_ioctl_t cmd;
+	short cmd;
 	int retval;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
@@ -1735,7 +1735,7 @@ static int set_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long ar
 
 static int get_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	local_ppoll_mode_ioctl_t cmd;
+	short cmd;
 	int retval;
 
 	cmd = board->local_ppoll_mode;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index c66b8d59a46b..e903ec1fe274 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,8 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef short local_ppoll_mode_ioctl_t;
-
 // update status byte and request service
 struct gpib_request_service2 {
 	uint8_t status_byte;
@@ -155,8 +153,8 @@ enum gpib_ioctl {
 
 	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, short),
 	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
-	IBPP2_SET = _IOW(GPIB_CODE, 40, local_ppoll_mode_ioctl_t),
-	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
+	IBPP2_SET = _IOW(GPIB_CODE, 40, short),
+	IBPP2_GET = _IOR(GPIB_CODE, 41, short),
 	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, struct gpib_select_device_path_ioctl),
 	// 44 was IBSELECT_SERIAL_NUMBER
 	IBRSV2 = _IOW(GPIB_CODE, 45, struct gpib_request_service2)
-- 
2.43.0

