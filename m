Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07501142905
	for <linux-staging@lists.linux.dev>; Wed,  8 Jan 2025 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355962; cv=none; b=ikp2yfIOYrwm0PIgR7KkEBmqd3oteIg1WscQMsHCytMcTULTn2gMR+tWQyQcPAXuvOX8YZlNnnoc7cgbH7ejdua4zNVy8tlQ3eqaUVtoPDDeoeCOdHavtB/z1HHKx2fmsF+snL52+5sHwfzq8WMbrE5zRSEZG/D0p5ZM/qgeLRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355962; c=relaxed/simple;
	bh=OI68onKi6KoJtopdFkSsGF2khOUuq6xNaRWnaWzYi6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QEaVVv/FUbwoOKKF8f4ziq+jGOLd+tA/QQwr2LK3HEY4o26VWEnWtCid/g7g17J4SWKG39D4y/Bm+cOwO/j2Q/ZuTYDW1q0uXVxkg3Toi27P3EhzfRiXsPzwfbbDSsBnWVLw4AXfQTfCk59TVv54lFUWn58IfjNDTUUWBqYUC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KM/GuXrc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KM/GuXrc"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so11679f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736355959; x=1736960759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLNrcx9cjynqqzuzB4NpWA0HHiIsSv6AxtzMCkQZk1s=;
        b=KM/GuXrcSbyQzSlmpdoITU/WmLVvm2qRU99CPB/c6mGTe5f8UXFz6pDbA5OocyuXZC
         0N6UwkF52NpqBsY6TK/pW5onqcgUJL041hLWb98+vtmeJSxEcT6kovOt6jfUF0fLV0mK
         KjVMAokWgLFKti+HVhXfDAbiJ5OTEMptJiGt6vwf1BhfxwRJO2lcGSp/7zUy8+W7EaLI
         crBLU0pQybnm/z9QFAIAg3PL9fkHZm41jcsYy3qn78NAgj/WN/xpTTHePAFwCmUDYa4b
         ZPhAl5LEdJuqfccia9t22tIRS0Wz8Iou/vW/V+db9vvIUsK9WmIqO8FY9tBoo7FC+V1D
         4pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355959; x=1736960759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLNrcx9cjynqqzuzB4NpWA0HHiIsSv6AxtzMCkQZk1s=;
        b=KG8AQIzAWBny71I20yYu6OhVGu+MvFoFxqpqmyK00cXoVGqRbSPRmblxyCLORoGDfN
         wHzmmDjS4zs/P6K3m9ew8tLqo7V64/UWTzwQ006KNXHYuKT59vKPghcuWSUAeONteKuh
         k1AwW//6ET9bv5OoMgdLsNphYi5IeSJQ05n6ZBn49pe8M1IPOgcrM2K9lOZyAbI1x3Ap
         z4/nww52LLW7o5z74HJXkTfykBZTkS6qR+zROUJhsem83Ukx/051awbSCoxJyLN3xFV3
         5c/K6yLmBLl49TfAHaHoU7D9pc56Qq9E8Is2DyRrOMMppbtJWOjAjLkMfNzkbH8UPJVk
         FMxA==
X-Forwarded-Encrypted: i=1; AJvYcCX29jMG0oHh2nVHYHg1ELj2eFRzH2g60IiYLKrJXOWS281cl5shyTl7R5j4aZ1sntXuUHCLbavyCryisN6T@lists.linux.dev
X-Gm-Message-State: AOJu0YwRweiUsmb8YK5q8PBvUaLN2izx7tZoFDe2rvdt4a8ve7yxmgIB
	qIzmdhmKhFobDvDa+ly4qDVjS3ypXCK18CPpmlmawa1a+Nkwg0UP
X-Gm-Gg: ASbGncvNofc19PyiYjl/xTmQlgBoiMxwVcE16otD7mLEWuFPqTRFtwAWSOMLZaLwh4o
	knhp9UgYEFEbfQprzffYHyMwl3YEn5kr0j6B5O89F477JwQIKaQ4cOpqFNtL85E9AOS0NCzBGXq
	oicVWiIDFpZzEh9CEiV20vCxZqz6Vvudqacv2Cd1mc1go0b9lbGZQF8GUjxpGDwzYqtYBvGCXR7
	+5Ye8RXG8dtcePLsTfd+ixe1w85SCHqqagPZJCkguGov6X0lUevbcwd9y4JrMwq0S9K2Ml3CMID
	xJciLv2/E87+XrqX
X-Google-Smtp-Source: AGHT+IH2sB4x7lCWKBKIy07UrH/e0Eck9bmWFY4AOJGGv4IRCBbJ4OUaDYRnBvU/tjBGaVruFC9+NA==
X-Received: by 2002:a05:6000:1566:b0:385:f1f2:13f1 with SMTP id ffacd0b85a97d-38a87303e62mr2847892f8f.22.1736355959222;
        Wed, 08 Jan 2025 09:05:59 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da79c0sm27243965e9.6.2025.01.08.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:05:58 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] Add missing mutex unlock on early return in ni usb driver
Date: Wed,  8 Jan 2025 18:05:47 +0100
Message-ID: <20250108170547.21871-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the buffer allocation for return data in ni_usb_write() fails
we were returning without unlocking the addressed_transfer_lock.

Add the unlock call.

This was detected by smatch:
New smatch warnings:
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:837 ni_usb_write() warn: inconsistent returns '&ni_priv->addressed_transfer_lock'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202412201550.9NCO57Ye-lkp@intel.com/
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 2c0a0d7e36c6..d0656dc520f5 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -783,8 +783,10 @@ static int ni_usb_write(gpib_board_t *board, uint8_t *buffer, size_t length,
 	}
 
 	in_data = kmalloc(in_data_length, GFP_KERNEL);
-	if (!in_data)
+	if (!in_data) {
+		mutex_unlock(&ni_priv->addressed_transfer_lock);
 		return -ENOMEM;
+	}
 	retval = ni_usb_receive_bulk_msg(ni_priv, in_data, in_data_length, &usb_bytes_read,
 					 ni_usb_timeout_msecs(board->usec_timeout), 1);
 
-- 
2.47.1

