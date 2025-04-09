Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222971D9A49
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178349; cv=none; b=Pi1HSEJ5g2OI8spvft79KaMQbqIeZrHqIu6Hz35QMfm8WpiODQcfvH9CIG0FdjFEaouNYe5bvtj8HYgOjcPSCfdl2B34/vyeWmdlACDHZgla19gcNe7RG4y2PlDFum1k5IB5TCGlh1ZLefiKVBoWgpOYpzFoHO+v8H8eHuPrGrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178349; c=relaxed/simple;
	bh=nmZxXpYGtNpYNOhj5UOGoXLASWCzFprIfKCP3NbhVDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBRM1jhSfqllhdXEdUdJ2Scrn8fSol5CytTyYEAlwbLK4YlFIVFQxhKxbqjhGUhVY1fjj1vQjODmESxux7JsCX37XsUJuIpt0dFAgHuDb2ZdjtBz5Yav8StEXr3S9P9TEbV55oSAtm0EeMHOx9xoQ3XtVJhXiU7D6WbFKaTDXg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=hz6GoZDv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="hz6GoZDv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227c7e57da2so55081925ad.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178347; x=1744783147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C29l0P6mM8oN5IR0sSrgm0hjHh5+2F3vS6hbJExkJEA=;
        b=hz6GoZDv1jFRqCqW4RfdfltVJN1uNDnJasiRlJ4eBGPcN/VWjaLDA7n/f/TbRifD10
         3/aSVCdoM1k2ltnTf9KEawQYKQqZdH9IBzsh304zZ4/qq7WJ/joLOSoEbg9ag3CCinSh
         l3LBysaodTPQOMuOh2+kvxgD8aUqBjuUqAOoh/yiHMJjitMAS8SYOLJXqHwXNw+MUa6+
         7kltODbhGeprqRc0NgMrgsyb8e2kUiGN7Vm4FfpJ6T4E3rB4noEf+gjTyAls0iGPJOh8
         hHhheB8QEnMoLqzy/I5fa4xtziY6a2TTUVxjIXomVoVr00O89MGZe872+oTpQ2nkjkL3
         Ac8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178347; x=1744783147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C29l0P6mM8oN5IR0sSrgm0hjHh5+2F3vS6hbJExkJEA=;
        b=QRVDVd+DOjOP0zbSLPiuMCooKzWbMj+AR2z6noHfZir6n0Io6eiMojL9I6t+/sMgnB
         GXjOSKGEXlYjeObyUFAcFf/gNbS+GZBfLusG6RN02GNg+/DkivtvRT+aY5pKFtBv60rd
         FoSmT7W04GIEcYDLod5vNGtsjXfUUcS+luV7aB/k2sZxcZu2F42xpJ7G/7Acq5+5MEq8
         02fvhKuvX31UyEfrFumBA/PNVjgmkh4jkTSNGkuqWxgDPL6G6twhKL4MHP+capBwLrye
         nya/Y7+7ZILX4YXgPTT34NKfLUAMUDV8y5iNAIisM3gboKlfYbccuv8t7Rid3w+dgfsb
         rlNQ==
X-Gm-Message-State: AOJu0YxJf4YIZ6MiPE3IyLV5z+bqIEvPCdIR6DeRT12HU7HnU3hqUD31
	pD/8sfT3744Mi22qZCOE6bbBuKQEGbbw3HWABBIVFWikYywZGobropzxidWuaw==
X-Gm-Gg: ASbGnctbHe2tj6Nl7oW33sMgt9gvI9oPmqu8Eri1vqIpv8nkgkSDo/ZnK4Q1FRstM4b
	+iMTyjfOTNUyJurUWNURAI5ck6CmSWCnmzFMj+oDrSTRJPtN2KBA0/jx23XSTLVHLyUocYIYgqi
	MuxB+k9Ew5b+tZfxeJVJhv63nFRIMTQlutFVoOhOYRK0ZRIyBHKFOO+pOcxvlo0B2Ch/xkykgp7
	d5YjyLrF7x4TpXYfB/AI2uUOYQLP5Mtf5xI70hRdJaAvLD3L4XKLrNVAdZjIzuMJ3mXMKeXhNEk
	ZFAPxBSvCCjznKB5tA9LjKMo9xJ9nwVV0noR9falhTq9kg/U2/wEBcWzyvpBWwhnqQ6qi/k56O6
	x/VrqfA==
X-Google-Smtp-Source: AGHT+IHo6HMz82o6Ejey7aqKjvSwU8H+RJ9gcTvRcf1DGffCn2lIbToSTUUZE8jzXuEnGFk881+JlQ==
X-Received: by 2002:a17:902:f552:b0:224:c47:cb7 with SMTP id d9443c01a7336-22ac3e0ff99mr18324395ad.0.1744178347245;
        Tue, 08 Apr 2025 22:59:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b90d99sm3461165ad.99.2025.04.08.22.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 01/21] staging: gpib: Using struct gpib_board_type_ioctl
Date: Wed,  9 Apr 2025 05:58:43 +0000
Message-ID: <20250409055903.321438-2-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_board_type_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 5 +++--
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index a1992a2b06a0..e12a9e56d808 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -813,7 +813,7 @@ static int board_type_ioctl(struct gpib_file_private *file_priv,
 			    struct gpib_board *board, unsigned long arg)
 {
 	struct list_head *list_ptr;
-	board_type_ioctl_t cmd;
+	struct gpib_board_type_ioctl cmd;
 	int retval;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -821,7 +821,8 @@ static int board_type_ioctl(struct gpib_file_private *file_priv,
 	if (board->online)
 		return -EBUSY;
 
-	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(board_type_ioctl_t));
+	retval = copy_from_user(&cmd, (void __user *)arg,
+				sizeof(struct gpib_board_type_ioctl));
 	if (retval)
 		return retval;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 6202865278ea..4ddcbc2a81b0 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -12,9 +12,9 @@
 
 #define GPIB_CODE 160
 
-typedef struct {
+struct gpib_board_type_ioctl {
 	char name[100];
-} board_type_ioctl_t;
+};
 
 /* argument for read/write/command ioctls */
 typedef struct {
@@ -143,7 +143,7 @@ enum gpib_ioctl {
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
-	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, board_type_ioctl_t),
+	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, struct gpib_board_type_ioctl),
 
 	IBMUTEX = _IOW(GPIB_CODE, 26, int),
 	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, spoll_bytes_ioctl_t),
-- 
2.43.0

