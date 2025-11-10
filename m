Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D7D30BF66
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770331; cv=none; b=siSINpadasIzy+/9qqHAi7rMSlYaHvNFoNnPTO1y6izh1kI1w6ypJ44YskuLQXEvsjuNlBjqTgV9tDAX+Yj8nexiW1TdVClp+7Y0o8dEp2hQdOJ2CN0PToSuiVvflrob7cGisydzZVnXLPEWEp+O7Vrhmu+ucOCEClvWa7Cg+sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770331; c=relaxed/simple;
	bh=+XnCO9qejTe4ztQ5le1uNUFmPXCcBG6FCCQyy4ErpsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+G4KzZhWiFbJpJZ3iUwGzD3S7qJmMt0luMIOwhU9CehYPaT0hseXYcWf8om194NkwXCynTEupmEOFQ4mQb248Zu9HcfwbJIoXLCoiOf5eiovcRwfwibZmajcoIuYCEpV4VdCDiMW8cZjgzfR7hPoZlKAcavL7TlF0cBodL+hHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6K3lpGY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6K3lpGY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47117f92e32so24635845e9.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770328; x=1763375128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCSGnpbgz0bliYKvoZoaZD9Q232D8JPebeahtnpVkpQ=;
        b=H6K3lpGYCdbX8mCQXmJtTpIu7zpfZe8RY1qmoDZRcXnfdLE1850ERvtADzazArektu
         o2h0146EOj5jFTP3jnRDB4zgh7eMk9Jo6jLn5ImXEPWWwF6BYwdCNi9RPPqwrpHstRCH
         Wgd17gD1qLv4G/RgW5ZowbB2onpZCM4IEMjhF6VMOWDOo7md36qWW+UUVA+1ITZdbWZh
         1tdDDUZ9lDKatohDzndARpM/LikEDp60cQnyGyCctnGvXtGkM7L9t8KUeXKFqwj7sa+P
         YDFclEOtM0DySZ9nR1t+PlOMa6Bh/afZ1t2tIGurvZ2nH5Qq0O23pI+JPMwxR4/i/t49
         XRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770328; x=1763375128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCSGnpbgz0bliYKvoZoaZD9Q232D8JPebeahtnpVkpQ=;
        b=eUd7eFUrH70zvdtESiyRU5cp3R6D2ojAMq/l1AGt+8TcdRjMtuVweMMWDM39t+OF4F
         61d5TnZkM4s8BpfIV3+6d+PMIgzkz70WKXFYWj8EyaerXS1XyO82hW/zKwFo30B1gLL5
         9BHENxUTFOulBgOyi04ZwAUy7FUU3mIjht9fkoB2AoJvgJLavqjC3sN5QPtQm6LoCA2Q
         X0qIyQpUZc/rGy3nkgLEM9Yrr4Ktumpu5OS5ctwoJPNEHA7ydP7W4MzqWY62Sc4utW5f
         QvOKEKPuS4TS3dHJtyedDo32JLZibaZ/np+ACSjlU6xSPWghZRuWfJlBXXgJYrYobw8U
         SQAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNaWBNGSiAbzt/7lDUXxzf7dCRvqBZqNsPJ7RaZJQlVnXyiCa6n49WFnWJHQiN2eBwu/PXBC8mgQz/Bdz6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw83s+E9SbpWHI+akJt17qNFVjFXFneFlAssOkSKO14l7gp5BN5
	q4EcPhYACIXxUnOgAi0uoOeoe7Fy5KB83YwqtUZrBHT92qcH4kk7bdDx
X-Gm-Gg: ASbGncv/hWXKy4ffoxq20zgVMCD6WlsgpUdWMhNu2u0ctzUiOuEFXSGE4Ea37PUCdsp
	R0RcYrX4GBkZ8cS771echpvB5gPSOxs0qH4GD8XcecNhg4vxX0HcHreBxE2RzUmRgXDhaNXtfWu
	y7eQ1a7dcLVkjdkBd2jqdDxKTXIN8DouUmKZM5CkMtq3xylDJBdTFQOtHZcL7m7FLUI5/T5y/nU
	17TDMicAZLUBiim0ZNNFjtAjUwB1jc1MKISIlGMGRfexeMeLF2MC5av7RCVTHo0SZfbqVoLuTvN
	yYS/klP5z/OnB2+RejLVB7jt9GCuLtp1h6ASLNMhYYaLfvKtOlHicj8c5FyntnRe8M8xXuU/IbQ
	4M0j3lOGtNC3z0KRrUby0spNI9ZFSKeJ17nsuEXKFzNvTXHsDbsM9c5dFj8gWqkev2aQG7zV9Rv
	SybWAB6SO2kc3Va013
X-Google-Smtp-Source: AGHT+IFQWYggozTgEs5FML4i05VMRBmgOOAruw2bEdH14yVGLRrDIfa5y2DG/WtVEIJXHugLGIkeOQ==
X-Received: by 2002:a05:600c:3105:b0:477:1622:7f78 with SMTP id 5b1f17b1804b1-47773293fd4mr61805175e9.40.1762770327949;
        Mon, 10 Nov 2025 02:25:27 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:27 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 07/11] staging: gpib: Fix SPDX license for gpib headers
Date: Mon, 10 Nov 2025 11:25:03 +0100
Message-ID: <20251110102507.1445-8-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part destaging the gpib drivers we need to add the
WITH Linux-syscall-note to the SPDX license in the gpib
common includes as these will be part of the kernel headers.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h       | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index ddf82a4d989f..2a7f5eeb9777 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 /***************************************************************************
  *    copyright		   : (C) 2002 by Frank Mori Hess
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 55bf5e55507a..50bb6e251e45 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 /***************************************************************************
  *    copyright            : (C) 2002 by Frank Mori Hess
-- 
2.51.2

