Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EFA1C82E3
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742625; cv=none; b=QCYRiyPxb5ezU2sWFo2mz56cDVgL44Ykf8snCw5BmKH3VoVdhkv78vQ6ErTUuy+OpfHaaIPGXgQFnYWAlwxLxdt03wPf3xoBS8CK/Z+HMSIbxxQ0YoJSldPrNOR3a9YvTteVWKU3+wv5/JX4/mQkhF4+fgCPJtDWXEyL9/XD7FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742625; c=relaxed/simple;
	bh=Yuzlz/gAXGepN585boJbCqwkRBFgUVeNpMhTrcpSlGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUEr8Dg2nbZwncHhLHLybPRVkzOeJec6BDIlW3AngAGIsQ5IM72Gv0z4vfN2rLmmNxKTUHSOiVxxCwWbU32DWolHBsq50Qi6VGw3KNZQEXRo/a4GD5UpAt7K9vvOqkIF9KPvo54hW9BvgWAHh8lEokeiu+BESPon34O8tbZGW/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYIctjEt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYIctjEt"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d50fad249so3302006f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742622; x=1731347422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM1Vc6LIKdr1UuGOL4gln8Hsis7ai+S2TMSH9A6g84A=;
        b=hYIctjEt4Gqt7WtmK5+59vCXnbg2n2MamK7X8VipGPqQGZJ5rz/qYUIQ5kiQmjRWX4
         KMCBUUO3AmHl49MmHcjUYxEG84He/xk3tgOP+HC3r09QTlpG3TBCJwu2+pvg+QeXuVFR
         Gopi5HYe65I+wPFIJHYB5zn5MeeX9m1M1oWghV/yDf/Msut/d/0uFMz4VtfDKdNwS1vi
         Z2UkfbFLBZk+Txvtq0n8tHmNDgHL/SpwM8pGN1hWHmAle8QxKD7L9GQ9O0UP/h+vgf21
         nnLQFp4xgywn7TvY7xOkicWtgTyJ8V0LbMGQ66p1yCS1/iQuxT3e2FITphfwCCVWXizb
         GNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742622; x=1731347422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tM1Vc6LIKdr1UuGOL4gln8Hsis7ai+S2TMSH9A6g84A=;
        b=GRFTF9ZqoelK1BfJfdHovC0KttCL859qAq4/h6TxOPwQsPltiNa6E+lpv4EKi8U+Il
         Xzih/B0gK5I3d8GxFhR41UlTSjw34OagYWPlxmqDs6i90x4Jss4NBLhtB4nDW4ioipmZ
         +AlQf95P8JqnJYAs7zAsK1JNuk6EyT3GlukT1V/wWzsublFsNMbtAU3TOMmEHyHZIfIJ
         kxt4Ph53fsptiiiPVo99Rw8Vifx3xT2GVTc520CsQ2+6hLOYtC2DIJlHgs7PVgcJKk0x
         WTkGCvfDwAWIXGgPx109fu4m5q2Mlxs8SPsTAdqlc21WyGlH15ky/4jCzdUBgWjGdI79
         1IwA==
X-Forwarded-Encrypted: i=1; AJvYcCXZRoTxr2FJEm8YEqiPrdWjDSm210blbLHWGxgnhb3hQeMQYJZFaO8QRbjyiZOBcubAou/GOxqg3SB3CdZy@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq7vQFvWhDQ8H4tqSh/85Kp9CTpnyAm354jem3yk704/sO1znU
	wHBVPwV4d9OQEC3biHAo5a1X5GjrOtx5V2uwbeY2vkwajU+0RHco
X-Google-Smtp-Source: AGHT+IEQm+bKTmeh2Hd6jsEfemnIjw5OPfstig+UCjqrc3WI3GQug0ImO83tQxckObu0zIV5Cwcnfg==
X-Received: by 2002:adf:ea43:0:b0:37d:633a:b361 with SMTP id ffacd0b85a97d-38061206c0cmr23241855f8f.51.1730742622242;
        Mon, 04 Nov 2024 09:50:22 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:21 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 01/12] staging: gpib: Fix buffer overflow in ni_usb_init
Date: Mon,  4 Nov 2024 18:50:02 +0100
Message-ID: <20241104175014.12317-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The writes buffer size was not taking into account the number of
entries in the array which was causing random oopses.

Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 571f07800c9a..b7550a937f15 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -1726,7 +1726,7 @@ static int ni_usb_init(gpib_board_t *board)
 	unsigned int ibsta;
 	int writes_len;
 
-	writes = kmalloc(sizeof(*writes), GFP_KERNEL);
+	writes = kmalloc_array(NUM_INIT_WRITES, sizeof(*writes), GFP_KERNEL);
 	if (!writes)
 		return -ENOMEM;
 
-- 
2.46.2

