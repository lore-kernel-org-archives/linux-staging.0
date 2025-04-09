Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE121DE892
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178353; cv=none; b=K3ZGPLN0kUoqQW1MiLGVl2tzNF/CSz5pzodOpENmLXx5FWyDM/QnJ0Pgm227Ttts/mi5e4m0WIhvjLB8EV4rvEt+Qm4O1DJd3S4C5LteD6xOXJTin9vsSknW0HP0ri+qaSyoKntIgNIQSKDKrsKc40oiW+iKLhR7vh9UMHjVeRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178353; c=relaxed/simple;
	bh=rYU9rxDJJ2uDKTInwUMU9me+tIhO5gmqoCpSL5Svm1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eA6+L+4lJ1Cvrgr0XS3f2l4ifAGb8Gxpi+jwcRMIwE+7tc8KDb50yXzapCRmU/r/pi4NWlWWkigZmY/3hQLskmIMt2gd2LCoyE2fncSe1aA5ofuNJDsOooV3DR4B+A3A0KXTl70gNEJnQiX5DnGGV02k3/oWg0tGgH0R/Uhn2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=IOGDcF55; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="IOGDcF55"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736b0c68092so5274246b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178351; x=1744783151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mAQ8kl+cTK2tRaTYd6zwbiiWMnl/2y5YjUtdkyYstI=;
        b=IOGDcF55hJ9nDxnV2d/bDpedulEGmK6R/Y4C15y8YB9Av6Yz9ggd8rJEgzNqgJUuM1
         kbjigLL0/YRDfPIakl07rLvWBhri03BIlPm3aY/IKTwqJwnwQzT+ZUpAvgLw+h/kpWlr
         iMeLvdF2MGCcap2uuqhJlfS2dODEhHdjx4bS7tAs5lrrlAvKOTk97FGBByavgM3psl7W
         emc4kjmnFh71gnbKxS8M1+7NqeFoebgBMELwT3ItHH30GqSHRWJNXAkUztws1sQaE68z
         0m02+aPjW83N8M7ry3W1YH00RPvGO+aVUBNfuBz9bYef0cPCDvB/GZ5ndk824uS3kuJh
         U7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178351; x=1744783151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mAQ8kl+cTK2tRaTYd6zwbiiWMnl/2y5YjUtdkyYstI=;
        b=dfJKRQ9XlugBS+/Lq9B6jr/krarmFqZCjWKewpgEQ1F8NN+vXp1TUiEpaUqkxuPMRQ
         e0vYBJ9T/dbxLD3ty1ywIVSHDIlqqSR9/Ypg0M0fto9qjPSmY5Nig3O6B+WmucK14IPd
         b3nzpf3IGp02kmehDUzPx5caO+ZmjSW+FyZlqU7EzBtmjFuuu9WXBYpo9HCJXKjN4n2T
         mBT1bR65ACZEne1OXT8LPv+Jj0b6bADvexiw7QUFDRhSP8hFc0OENB6inCfi1zQnTR2l
         uQqjv9AdBk1FYMlw02BVr0QMdgQcQdSIkml/vxxl2ugwCdEmmcK3Z9tFPWTA99dV0soL
         UUfw==
X-Gm-Message-State: AOJu0YwQ5XSq8+l9CM+jvVkQOhvGAnPwBVuoAEqj4CWp7MvmHFhJnh5U
	OIoBw/A+gqCjSrcCQr23r1YUcuTdR1SZKg7WkDbQFiW42EL2AqL9fOo6sJt9C+flI4ZQGPRbKig
	=
X-Gm-Gg: ASbGncv5ASH6CYUGSbm8jY91DsRDysccu9MIPvVzHwMqPZZAsI2PVxcc/OqsCkup26u
	3sUTGR92gtl9VhEkLTa1w+u319X7rgTJzjwHO4SZMthhbyy1xbXNmsdMog3DVOKMb9ZmR8EgNjN
	uxXLqkUis+a0i7FSKE/WdefAtwqFsrAxLxI9zlJLPDGY5V2IO50BjoWv+9bFEdAuyrG7pGi58Cw
	IpLGoTCcIjictiS3UFg4I9EoKlS8TlOJ4vUNcTA0diL5+7EKUhvHrR1jL10RnQ3UmLzdsUlts8v
	MyJxS4ekR/1SAtBKH4pmMBkn9Ma3w3tAxflQo9gkgCXhqpUOiOpq0+aOXCVBwfoVRk27aSl7xVP
	T5DGVIA==
X-Google-Smtp-Source: AGHT+IE2RtAw3/qX0PW4HvonMFrMBAZYWdvOPoyJKwwxRUxSdjdRh3JQUX+7LZy+KpAlhCuSeBtkBw==
X-Received: by 2002:a05:6a00:ace:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-73bae495740mr2220686b3a.2.1744178351063;
        Tue, 08 Apr 2025 22:59:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3833asm421408b3a.85.2025.04.08.22.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:10 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 04/21] staging: gpib: Using struct gpib_close_dev_ioctl
Date: Wed,  9 Apr 2025 05:58:46 +0000
Message-ID: <20250409055903.321438-5-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_close_dev_ioctl' to remove typedef.

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
index a0a9a07dab5d..4d105db18447 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1262,7 +1262,7 @@ static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned
 
 static int close_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg)
 {
-	close_dev_ioctl_t cmd;
+	struct gpib_close_dev_ioctl cmd;
 	struct gpib_file_private *file_priv = filep->private_data;
 	int retval;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index cfd1afb36e4f..6ea6114ae78a 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -32,9 +32,9 @@ struct gpib_open_dev_ioctl {
 	unsigned is_board : 1;
 };
 
-typedef struct {
+struct gpib_close_dev_ioctl {
 	unsigned int handle;
-} close_dev_ioctl_t;
+};
 
 typedef struct {
 	unsigned int pad;
@@ -125,7 +125,7 @@ enum gpib_ioctl {
 	IBWRT = _IOWR(GPIB_CODE, 101, struct gpib_read_write_ioctl),
 	IBCMD = _IOWR(GPIB_CODE, 102, struct gpib_read_write_ioctl),
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
-	IBCLOSEDEV = _IOW(GPIB_CODE, 4, close_dev_ioctl_t),
+	IBCLOSEDEV = _IOW(GPIB_CODE, 4, struct gpib_close_dev_ioctl),
 	IBWAIT = _IOWR(GPIB_CODE, 5, wait_ioctl_t),
 	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
 
-- 
2.43.0

