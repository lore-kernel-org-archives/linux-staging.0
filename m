Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5500827D767
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222226; cv=none; b=BZqMVV4SsTED/N16u3sDGwh33GVjLF+Z/4CfqLCzXhUqQB9Mngf4xdNQhAVM6hzIkr+v/qwxFLDDFKjuGpaytDrNpvjg1VcW5jeZZcrZZkZNtaSdzi52Fd4AwJ9QnhrnUA/BvSXUE7e9RPraD4BABLeWqwbmYiDk1R6/E7doxL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222226; c=relaxed/simple;
	bh=3Tspjz7wxGyMD0ERoZ4OefpIVgysaEDnq71Z9+37JeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdDh8ma24sMG1l6yiLA6Phc+/mIEQOVWiOuvKNIHE99seMGpq32qsDLZvOV3QbDqmOkKFHJeBH/IHmz5WTPOrnD5596WKVqwoB0lx0cfGknY0Neh+sglz7kdvyLnhmC2sKwOW0NUpccchYXZfriujlDvUoDxtCbqqQYDfY9Zl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=eU1tycuS; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="eU1tycuS"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-303a66af07eso5617685a91.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222223; x=1744827023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx5EY5NNpPB6MvS87zqGMc+jEI/M9Fei5OKN+WHLkj4=;
        b=eU1tycuSrKkQrcB2sgJVIOfVz4zIZBUuxLVqXvi8FYoAhlwN+D329tluZt7XsEdzkk
         u/ll3PzZeLgtcGneKn56s47ylcfjq0OYhWKSe6nOx4tYEKXvi19lgNzrXY4Y0Nwqiyti
         wY+p1TRUo+9XUcaEgz5Y1QNFjzRYox8vxMgB9GO8bi5JoV26FNFWCGKNfm5LpX9utlxl
         QO2DpnBh8wP4MxGktlZabMm77kGTO8hGcj/vPWPmMJIuWa2O6V/UjDer1AkHqOjkXxNN
         1tO9ZXBcnLJxSC5Q3MNFfCEeaV2zqj7S4WX9GSuwg0FnbWndY1yyePBnYrghzQw9Ozqv
         3OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222223; x=1744827023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kx5EY5NNpPB6MvS87zqGMc+jEI/M9Fei5OKN+WHLkj4=;
        b=nA80rqbyXUZmYeJNo3E6N3bBHhjy1EbKKsJKFCJ3DCp2rYBnEN6Apo4UI/mBdBacoJ
         oIDsqeZqcskctLz6HrUznOYPRKxuZCMsWwvqYJLiduWIpkB9KOOQmVJSvqscA8zhIAvv
         8uH22VFqEedO7hITUmnA1Qq50jBc//LFP0vbDCvH34u0Tsiep51iFul3LMxmMMNTwvbq
         xs3aBdK1Pv6T7p98vaEDx8uEtOCtRc8Qp7E7Vk7K8vPCVoXCtp9JtKNZONZQbuOOa70k
         E3irEgNb5afOO4fub7i1P8E+gWKikDSeiBhhiuLe7UkTE2PWQX6r+dV3oF+0YDXlotrD
         YnIg==
X-Gm-Message-State: AOJu0YxPOhr6WZb11HRns6GUVZyWmub7ofRYuWOfr34VRBLXYctYFKb1
	A4d1CLufi6jv1R5v1pdrSMAOZaMVwX5iiA/5HIcG9S26tWL+6R+9kD0STjQwfg==
X-Gm-Gg: ASbGncvZHfA5FPO7s1FOcn6+DpNo4m5Tcg5YnvjZNNNWF1p5TmZZKUaapY97nDtpvmd
	H3UmWOAAe0YBYv2p5myEOGxZSN9cbG3wRcDS4yu9FU2RzsGr4hwREAJdT73oqjZlyJ8aFuAxaLz
	nrWU0xeHS/aQllsvVwofhq3sADPZj/A72yvsDsiXcjuBFtNX5T9dkks0RG7oBkipscifS21ZnZ4
	1UYwan8I/hxn1+w3yVeHm17cSfBt1YQFY1SP7t8OMSdGAQ9fieYFasbYEDJNnQALqVjeCwLdySN
	4jTBKY6OLpL7R/fiDNgy0u/LVwpZEkhwLOnCPqMPoiuz1H92gP6PPtJna9EEXEarR6Lkgu01oyF
	qcKYUFQ==
X-Google-Smtp-Source: AGHT+IG6p1tZfFi8ilrumj+2WoOXmfGtk2AOoKK4B8lB22BJUdisIq1kvt7/UBFLJBTqtXu0iStG+g==
X-Received: by 2002:a17:90b:380a:b0:2ff:570d:88c5 with SMTP id 98e67ed59e1d1-306dbb8e6f7mr5021604a91.9.1744222223562;
        Wed, 09 Apr 2025 11:10:23 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10c42asm2163598a91.7.2025.04.09.11.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:23 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 23/23] staging: gpib: gpib_ioctl: u64 over uint64_t
Date: Wed,  9 Apr 2025 18:09:53 +0000
Message-ID: <20250409180953.398686-24-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u64' over 'uint64_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 2d2a268d8573..0fed5c0fa7f2 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -18,7 +18,7 @@ struct gpib_board_type_ioctl {
 
 /* argument for read/write/command ioctls */
 struct gpib_read_write_ioctl {
-	uint64_t buffer_ptr;
+	__u64 buffer_ptr;
 	unsigned int requested_transfer_count;
 	unsigned int completed_transfer_count;
 	int end; /* end flag return for reads, end io suppression request for cmd*/
@@ -59,7 +59,7 @@ struct gpib_wait_ioctl {
 };
 
 struct gpib_online_ioctl {
-	uint64_t init_data_ptr;
+	__u64 init_data_ptr;
 	int init_data_length;
 	int online;
 };
@@ -134,7 +134,7 @@ enum gpib_ioctl {
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
 	IBRSV = _IOW(GPIB_CODE, 20, __u8),
-	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
+	CFCBASE = _IOW(GPIB_CODE, 21, __u64),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
 	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, struct gpib_board_type_ioctl),
-- 
2.43.0

