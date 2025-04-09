Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542E1E130F
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178356; cv=none; b=NC+GUVFi2tFGTf1dxEiu07cHjw7Y7sSidflhVgdKS1S3r0RHIjQ+/nMOEShXkRQYSfuagU7THZwsnaioS0sfq5bg7SLmpfz8dRnAunOqlSFqZpIXzKMzp9vpUlXPgOB7lHbjsfoAnUyUSEfn7vNIWwmd8eNSh7MYdvx3lx2lPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178356; c=relaxed/simple;
	bh=lTlngZeohT9fdDdZ+I8MYc+JvGejyLtyZin/uCn499c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YguxmAKMTfiHmRAxqcazScbA1SsLCshcnT63ertyj373zs7MOAV24umxW+0Gy5n3Y8JnGYHzYj318/N4/ShwRqSrsbAk1Ow7w6xHVEmTZ6m+ucaIEy6miLpCeu/I2UGFh2/5LdAWrGFua4dXiOynJfyLaI5LOXz38gy2FHUy7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=CwuSe4jD; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="CwuSe4jD"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af589091049so4266736a12.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178354; x=1744783154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgVArUjmqQF/mOeS/jCzJyhUSciVAhmS6WARTC27SMs=;
        b=CwuSe4jDEXQzOAuPugBPqoM+HCNfjFOuW78MEiFONOBnPGH3pJnS3gGgiNLY8UYaqP
         8swgmIwJfXQIrPr02pUZlt8zXSgnaI5cR3oWGzqMCtZOjhIr8kDE6Y2g1Ko8QNCYt69l
         ACZqiAcOhqyyvDCfHAs4ZhV/R4TF270B0f8k5blopMrzaXVnHyamhxCwrECFZu8wGLir
         DwMSzULZXdywbRQvZvlxY1IjKfv0lu1AhwcsVfFiE5jyEamNb7TYzxzDP24OAsRGzlSQ
         Bmbg9hEOjByHyPnv2bRTkQerEcG8kBXOPqa031xJvaNvT5dHXo787KlxpzRDGluXlwp5
         OuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178354; x=1744783154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgVArUjmqQF/mOeS/jCzJyhUSciVAhmS6WARTC27SMs=;
        b=lNNZb0g0iYJTwcMwy0Fu9nxToI5ocv4bAQpSj/U1aPYAvmk1yjdFskosA1wEEOVUSC
         D5owsWXrxI6HjVpMfOKb8nchU1bomZsPK1sQ33QfqoVGzu6Y1yPDClzMKI4EfKs/DzGJ
         0AxZXEhr2QGZuyJcolKjd/JuRR9nYGdnHhBVVa7Boz62iQWYf7GvsMWJAcWmbnSCos5L
         ru4W4N9IN5x5MrRZLt13j/PaSwA8WI6Kh3gh9R4kAF6Blc0yJ91bOtCxYlU/B9c9B3iu
         pj9BDtvEZCvHfAVbUMOMjMLLUwMDILGziT1iiWFj6hQMdJpL6g/7T52SguyWslXQDjeV
         MJnQ==
X-Gm-Message-State: AOJu0Yz+vUYfa3N/AjlJb6dPIELGoqZ5tPaEUihz1ze4xxDjMAhYUv4m
	QUhPnCwxWoCkBu0c3/WNB77B92uRkWV1p0uwr9mqAQwB8mRCi4Sk5MRWihVnbQ==
X-Gm-Gg: ASbGncvKj5+fdgdqHuc23+SL4itxdirk5jFf39MVzP3kZP9KpfpU2CVzHFZxH4IEqrx
	tt+mubr9BZsbapGmzln+C7y7S5hacdt0zn6mHRjk16rzjO1NIzIAy7ivYIx+YO+/Ij1Hp6Yoitw
	zGfu4JYJOV4xKey3iZtl+s7H51PM4gjkcflQ11vqiNVFeelSNOS1ejweE9VgPG3sidgclSZ/152
	FFkC45jq4UYYE5ab9yY6Nevfh1ssfaDMmGoVwvyW03EhO/sMuhbnxqTOfs+RZXF8OIZI8wm89A+
	57mvIFlc7O1Uq6Erpgl+V+Px/RXpcTV88DMwQOc0hKHoLRDT2DMw7FlU9/VLFAhLhFsyIJBSCLu
	gzDgqWA==
X-Google-Smtp-Source: AGHT+IHd+pzcdkjTbsAfnivLAC2JMI7PBA0a2cy6NXjGw1Py+x15ZQXxHq3GPkADOewRWkCU3EGd8w==
X-Received: by 2002:a05:6a21:2d05:b0:1ee:b8bc:3d2e with SMTP id adf61e73a8af0-2015915587emr2657905637.8.1744178354603;
        Tue, 08 Apr 2025 22:59:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e68059sm419768b3a.161.2025.04.08.22.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 07/21] staging: gpib: Using struct gpib_wait_ioctl
Date: Wed,  9 Apr 2025 05:58:49 +0000
Message-ID: <20250409055903.321438-8-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_wait_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index bbf8a60978d1..6d0191c9f730 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1311,7 +1311,7 @@ static int serial_poll_ioctl(struct gpib_board *board, unsigned long arg)
 static int wait_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg)
 {
-	wait_ioctl_t wait_cmd;
+	struct gpib_wait_ioctl wait_cmd;
 	int retval;
 	struct gpib_descriptor *desc;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 3f32eceaca93..71c5e3d020bb 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -47,7 +47,7 @@ struct gpib_eos_ioctl {
 	int eos_flags;
 };
 
-typedef struct {
+struct gpib_wait_ioctl {
 	int handle;
 	int wait_mask;
 	int clear_mask;
@@ -56,7 +56,7 @@ typedef struct {
 	int pad;
 	int sad;
 	unsigned int usec_timeout;
-} wait_ioctl_t;
+};
 
 typedef struct {
 	uint64_t init_data_ptr;
@@ -126,7 +126,7 @@ enum gpib_ioctl {
 	IBCMD = _IOWR(GPIB_CODE, 102, struct gpib_read_write_ioctl),
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, struct gpib_close_dev_ioctl),
-	IBWAIT = _IOWR(GPIB_CODE, 5, wait_ioctl_t),
+	IBWAIT = _IOWR(GPIB_CODE, 5, struct gpib_wait_ioctl),
 	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
 
 	IBSIC = _IOW(GPIB_CODE, 9, unsigned int),
-- 
2.43.0

