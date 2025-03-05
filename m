Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8E253F22
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741203489; cv=none; b=gghzb4hHYyZvRtTBwNQ5e8xvSFVlJ+56OmprrRzUjC/P6ByDujfz3rqOn2pWqm1Wbwlkj+8X6WcHOPwcju4pTPZwJ7B2D5YFF8plAY49zHoQMfrQdYmFeuMPxDdOmFr2BXeg7XZhxL0VXhtKnULG/oyJos/z+xPIg6+xmU++Uko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741203489; c=relaxed/simple;
	bh=j/iTviw7PJPcpETuVwwtmw6HSTOe+M0fePl8x0v8b/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5kBcunKD7kgcLjKh0FyU3mjxSnyVZJDVjPE1DtS6e0P6bGax2wY6AEENnUKNAYwr9yl1fgnTkMgD3Fd5ocwfleis5ldwhd2vehk+qJwHC2VJsJPVhJWZMCfltJpRJ0hHuFPkHN07pMYdW+CYmEC4ogNpSK1VBc60qyCX4WlbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0pNpVTj; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0pNpVTj"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f74e6c6cbcso2024819a91.2
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 11:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741203487; x=1741808287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7sXbP8vy3+v83lKPy6uZAVEBdTCaE0ovfzAtTI97R0=;
        b=R0pNpVTjBdfzN5XhgfNh9xJHAgunwDtS2fCZYcfBdZydrFeV7d4CbNVggj6igPzBil
         Xc9O/ROySmTiDJTlG1iFKp6oDdJAFnKI/y67xVFnURJUiOSdxqqPBJEUQGrR5NrfNM4k
         eS1CSm+L9dr1ur8ldRZrbsBu/H1N5J8DJeEoY8G+aaXaaDgZ85wEHNOndhT8Yn1egfkr
         eJo3ICWKxUzqYSiyKWgY8jyU5ByfgAUpfwD3Sn8AvTj3P0L+bLbnJnJ7meNVy9S9i7/q
         blPvQqm5gPfszGzQ77z3xSFeWVSJQCsksj9cfGOuQx9cx7PNpXR80sOEokgCXWL3NZdN
         mdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741203487; x=1741808287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7sXbP8vy3+v83lKPy6uZAVEBdTCaE0ovfzAtTI97R0=;
        b=VB3wKKiUHwgm3A6lCvIhQiQspe3JU5ifEb2jLw2GCgG4UrZ8vr2AdtFNWoklNt9x5h
         SIC/qyH/qGZmrkoxqZ2aoa+HnDC2GspaiSOKy5GE1JKofruIqdsEBOOA9dZvU6XvL7SP
         zqHGPL7lrQH7PUqgi+FV81HorOtLNFO3JvugcrOa5kv/rkPh/UR/4mG4hGHDW33Juq3I
         tikplpuErfV1BIdEV/DHstdpSbiRhbtTsvSdFtee+JWFXLQ0aCSu1g86JM5nkSzGz1Ae
         RjBO1jg/pTzOozxOUuGCKwQ98Iry8tycjAXwU4SIP2cpWK1s61Pp7CvWDHi5zx1Zk/Bz
         zJxA==
X-Gm-Message-State: AOJu0YxcFAVXVaN2sFSUtv0d0E4LNXU50D1+IjvMFM8F1t5jSO7JpQyw
	uGaARtik4l1CbXbFOVebgIBN10FdDiLYncw3l9cKEcXSvmp7AFqmjt1asg==
X-Gm-Gg: ASbGncu/yrDV+I16k/EqCxXrHzoOU5w22SJvcMAl6CJJDzfEdNZVFVfcfXSGyx5YMUW
	euuYDEYMn6xlzEoCa/xBbj5DXhWihyHpY7OX9hVmFqMYHNlYQsviqoDvkb0B1wiZPO1SDaEKbxq
	6cfYbhUHzfUWZNz554cpW/7ybqx9VfRHzKOEWzaQ2UAXr8YPtHE+dXcIMSENU3YPWMPBrm+HvCy
	Uo8CLzK2D85ps6AspiqckCVAwmmQSUF/caiT2C5o8iYGkaTjFAIpY7sSrTMO5ljRjSqUQlHjVYR
	5m+3reCqZLQ6jQ5X4OFyIkTTMf6Dlt04MWW6TTrrB2jqgkDrIHQ0vew5b1Qf
X-Google-Smtp-Source: AGHT+IHsjbx1miPTQBNrX7ZjboroAqHyYvjM19R16VWGXNXNp7juxMRcFLx8vf3UD4OuEm12sLJK7g==
X-Received: by 2002:a17:90b:3a91:b0:2fe:b879:b68c with SMTP id 98e67ed59e1d1-2ff49824430mr2883031a91.6.1741203486654;
        Wed, 05 Mar 2025 11:38:06 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7a2bbesm1898148a91.37.2025.03.05.11.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:38:06 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH v2 4/4] staging: gpib: remove commented-out lines
Date: Wed,  5 Mar 2025 16:32:22 -0300
Message-ID: <20250305193614.39604-9-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
In-Reply-To: <20250305193614.39604-1-gascoar@gmail.com>
References: <20250305193614.39604-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out code in function write_loop().

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v1 -> v2: no changes in this patch.

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 4a8e5905daf9..08c64b111a1f 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -217,18 +217,7 @@ static inline int usec_diff(struct timespec64 *a, struct timespec64 *b)
 
 static int write_loop(void *dev, char *msg, int leng)
 {
-//	  int nchar = 0, val;
-
-//	  do {
-
 	return skel_do_write(dev, msg, leng);
-
-//		  if (val < 1) {
-//			  return -EIO;
-//		  }
-//		  nchar +=val;
-//	  } while (nchar < leng);
-//	  return leng;
 }
 
 /**
-- 
2.49.0.rc0

