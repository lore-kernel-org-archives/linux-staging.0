Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAC0207DE5
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968684; cv=none; b=YHUFjfvKBc5DTWKdasdwdevzoyPiGXN8GbA4MfxwNFZ510yUMOw1klqMHX5VWQOES7JMCcb6t6kxHb2VVMi5Yi+0Hl9wUXx+vV3V7BMf1/i9mgm+tT8Jv4N2hq7AwPgk23klJ69PFDaqXV1rytXzcm1oC0OaX+bzPcSgB9xbrkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968684; c=relaxed/simple;
	bh=l+WljZ0LGkGY9pZ4SVmav7N6ZTsbRQhbYlws62pX6Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLXmsSLcMLlcXBplvGw4gpjVd9jRI7TyeWisagstctKjx5lyCKQIl0w25BqiUTyjSZmimGbhiYZ4hE6kRK6iXUUus09p1EzwjCmYDYsIS4Z8npgS8uT+Q9pDW+/RorczZMzfFrJVBfcSq7MPIO9XJN4CjCcrbCEhhFSiEM/YW6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IElBJlkY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IElBJlkY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so20673575e9.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744968681; x=1745573481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px4/dWG/1BChOQoCLuKfo67Qup2FH4WwdOjfR/Zid4k=;
        b=IElBJlkYcX/S6q6vN9AcJ0gmmvVpyT/bOeSKNsHFqsG+0WqULkYkZBYxhDtcpaGxJS
         dK34Y1T68Hztzv55oX5mcj+idGKY3MKyPW5yCYivCOwrr165aIkBWJWLdyYwquemGKqa
         SRDgWt5V8bLsBYvIME+BnPd8dSs2srV5AF1GTR0xjPe+5GS8cr2euPwH6yhTp6JN7FC/
         jH8y+8bT5Y/P3waq2CFnJymjwrgz02L2jFo/HCSJWsHBE6wDH4G7J0y1sT8RrCLqlCtd
         X7s3Ta2x7Do1P2yUIkyqu3/cwRbEah1QZaQmIFTuMdWTtfzVDHBm7tMgdeHbTG8rzOnK
         nCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744968681; x=1745573481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Px4/dWG/1BChOQoCLuKfo67Qup2FH4WwdOjfR/Zid4k=;
        b=XAem8uXgq8m4+ZuxoL5QSllgqH8YMVa+qB4KKRo4zZp9JAthcsLNVDmpMMxrmQgzjy
         6Fv6AWEoqrzECwl4ypgakZk1KljUVE8T88yLTJS8fRzzstlhfTOr62lIzWIWIekBNe2r
         n7WEJdwcEOVkfEFB1MZ9WphwoLu08FPWDWUIjZ4BhBFGZ/3v/bs1VFpG2JlW837Ym/NT
         zIYOair3NSdeh7ci2KlWpVjzDj9ruOrSV1FBJEoyjIs5ZSEb+AijhWqQeA348wh3eham
         /2sMJY5xUXwZWoGS8H1lqp++SWY3Y739NnyYKxQmoTh0MXfMUoklQTF4W1lnb4e1zHCA
         gEBg==
X-Forwarded-Encrypted: i=1; AJvYcCVcEoJqs2OOXqYoPftEBq304eCXgZBd1QGqNOJrYGnBc8/lFNCIm8cB3F9zxBZO+n47cEXj+cKaiVzj8PhP@lists.linux.dev
X-Gm-Message-State: AOJu0YwCND35GG/ZE1FjIxhwqCpBM/xbYLNou9is7YnrxwZtqpGBEvDB
	EtzYlVAfPqLJzABR52Ln92RLsoSsdUxR1gYQc4VDIBMpC7r6MMGb
X-Gm-Gg: ASbGncsK800eKWOV9KLmDegktO1TjKpX1bRDFNvBSJHtL0WCNItsVR61J90nehv8QRp
	mp6dRZjcCtPxksojjeee3yrIIn8MuNZ7KFWo13eDB7dA9wQQK8LHFn39hpafTcA/Wz7KlYgG3Ye
	2kfSZIB/u/+RUTUJq1Hlbpc2/MzusepQVFqXv9RoG96ms63IwGytIFNHy7qkd/tvQHj5Xr3SydQ
	yKdS/g26wOY2b6z0dxoIM/Rv7Gol7Xf5V/QbESe+/Zq4ykw+hdlQWxek1ySs08Kn6IF2QFjvBeg
	xNu6oq3e7qamnS1M1AkcRGh41iLv4ZhxOTECx6Y5u6q6mXOXwiUQpPpfOBqughrp/3LgLCdVsnO
	wyKTJ/6GeXAo=
X-Google-Smtp-Source: AGHT+IGvT2L6R4gKC8SQZl2Q7Ui3G/sarkbp8axY6Tt74sRDgzk+GXwJP4+oDoqieWz49mouZJzTkQ==
X-Received: by 2002:a05:6000:1448:b0:391:952:c74a with SMTP id ffacd0b85a97d-39ef8ba59b9mr2610225f8f.8.1744968680694;
        Fri, 18 Apr 2025 02:31:20 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9df6sm15599595e9.1.2025.04.18.02.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:31:20 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/2] staging: gpib: Remove unused enums from common include file
Date: Fri, 18 Apr 2025 11:31:10 +0200
Message-ID: <20250418093111.8820-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418093111.8820-1-dpenkler@gmail.com>
References: <20250418093111.8820-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error code and timeout code enums are not used by any
of the gpib kernel code.  This patch removes them.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib_user.h | 42 ---------------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 1cb6b6219e67..4ca3cc9e0cd7 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -53,48 +53,6 @@ enum ibsta_bits {
 		EVENT | LOK | REM | CIC | ATN | TACS | LACS | DTAS | DCAS | SRQI,
 };
 
-/* IBERR error codes */
-enum iberr_code {
-	EDVR = 0,		/* system error */
-	ECIC = 1,		/* not CIC */
-	ENOL = 2,		/* no listeners */
-	EADR = 3,		/* CIC and not addressed before I/O */
-	EARG = 4,		/* bad argument to function call */
-	ESAC = 5,		/* not SAC */
-	EABO = 6,		/* I/O operation was aborted */
-	ENEB = 7,		/* non-existent board (GPIB interface offline) */
-	EDMA = 8,		/* DMA hardware error detected */
-	EOIP = 10,		/* new I/O attempted with old I/O in progress  */
-	ECAP = 11,		/* no capability for intended opeation */
-	EFSO = 12,		/* file system operation error */
-	EBUS = 14,		/* bus error */
-	ESTB = 15,		/* lost serial poll bytes */
-	ESRQ = 16,		/* SRQ stuck on */
-	ETAB = 20	       /* Table Overflow */
-};
-
-/* Timeout values and meanings */
-enum gpib_timeout {
-	TNONE = 0,		/* Infinite timeout (disabled)	   */
-	T10us = 1,		/* Timeout of 10 usec (ideal)	   */
-	T30us = 2,		/* Timeout of 30 usec (ideal)	   */
-	T100us = 3,		/* Timeout of 100 usec (ideal)	   */
-	T300us = 4,		/* Timeout of 300 usec (ideal)	   */
-	T1ms = 5,		/* Timeout of 1 msec (ideal)	   */
-	T3ms = 6,		/* Timeout of 3 msec (ideal)	   */
-	T10ms = 7,		/* Timeout of 10 msec (ideal)	   */
-	T30ms = 8,		/* Timeout of 30 msec (ideal)	   */
-	T100ms = 9,		/* Timeout of 100 msec (ideal)	   */
-	T300ms = 10,	/* Timeout of 300 msec (ideal)	   */
-	T1s = 11,		/* Timeout of 1 sec (ideal)	   */
-	T3s = 12,		/* Timeout of 3 sec (ideal)	   */
-	T10s = 13,		/* Timeout of 10 sec (ideal)	   */
-	T30s = 14,		/* Timeout of 30 sec (ideal)	   */
-	T100s = 15,		/* Timeout of 100 sec (ideal)	   */
-	T300s = 16,		/* Timeout of 300 sec (ideal)	   */
-	T1000s = 17		/* Timeout of 1000 sec (maximum)   */
-};
-
 /* End-of-string (EOS) modes for use with ibeos */
 
 enum eos_flags {
-- 
2.49.0

