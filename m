Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F86D83CD3
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730669191; cv=none; b=H8P4cpOxN2WiEOUwPEdn4YfPxkkXBeONKX3ONQwbtOOytDEek/u54ae3/0w5dsutB0NwmXBHcpCb0LghpfAMPR4czJGwQJlJWe/2+PoONHuEB8PuuKSwLacH4IFGkDK37TLZU4c/cOBZBU5p17nKK7yOPXYguNeT7DhKpAp9+IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730669191; c=relaxed/simple;
	bh=Yuzlz/gAXGepN585boJbCqwkRBFgUVeNpMhTrcpSlGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okGiBUKP+WDzZnD3OF6rVHbP6X9J6KrFiI0sckukbqxI40PpMs4SLOgsa3J4+1whm/aAfne6Mz5aUqPAzF5OrcC+UdMqs4+3P1DSjDcWzXkVqPFCFNcgUiZglq0exn/3p5TKa6MUWCBovNLT3T1VL/akG+LeafAUMaFaTFm9ius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2OLOCYa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2OLOCYa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so27821875e9.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 13:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730669188; x=1731273988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM1Vc6LIKdr1UuGOL4gln8Hsis7ai+S2TMSH9A6g84A=;
        b=X2OLOCYagT/4vDTq9IUY2Cp2+2WGynBi3llYCMnbnBjjHDV+3d6OF2fc3rLZOerUks
         bCsaKsIN/MbnHKHSY/tr52QYShelLEmRaGn5VfeBoVg1lRtKDNg3GIa4Fsg3UNE7G5JD
         OwzT/42lcdII9GPORIgZ/8mCo69rqIIYjsRTKD4TpJYAuLhz9rn+udi+VFoYRnMsmEt/
         I1MhxXD48ZV1byREtos4B62X8EtMNBODDUWPnZJO5PvuCKw6fteh+4DwPxYvaG3+plMs
         Io7//doI9O5tgX996Llp1g//JBtGXeSmCvtfzgyN2WPixdB1ltDlE32GukX1NQSImQPF
         F4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730669188; x=1731273988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tM1Vc6LIKdr1UuGOL4gln8Hsis7ai+S2TMSH9A6g84A=;
        b=OvmSKTI8SJXYPWM9HyO2YzEpssocIB794iQnpmfWEEV8I/ErzNuhD1sQogk3x42nAx
         0XWT9nd7oBT922eTmTIqIW2bJ14292MUfvZ1BRx3ikyqrzlvkCGfOSXR95Ctwp7cGVy8
         +VfoOqYO/XsW2iHZxkj2WNoLF6+Y4EYVBCeKbQfKLE+Q7tZGlmCJPqtQuP9LyAADQ0AQ
         dhqqL1UVJopQikUPc1l8X/5TmTg54gLfVInLuZlJNOl3o1PXyKeiEleP2i1h8JhrFvPN
         Orl+wYiRPuUqDQym/eiCtSnZdYD2hEIiioKR8HQauK3oN+lh0U7kvfXFSfAYbWLQIzcJ
         kqwA==
X-Forwarded-Encrypted: i=1; AJvYcCVY1s14DuoNakPnboaX7HDT9JDBLOJugKny79IhY/rhyh3IX/icKlVOjSRC4rkWN8klG4661l4AK3B/wRkc@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw/ePfuDZHHZ5/SJkcXIdqvmjDBQtPqdbJHLSvHqsqqDkAGjFt
	wAmEL/EY0Uj8Q807IHdTJIhaj1oKzticPSymsXWNDL+Mr1mi55Rc
X-Google-Smtp-Source: AGHT+IFojVtE41iWXpVMT2O1EgAjvXjJ70TlGkI7FFNeVh9Mpf2fdD8FqQqpW+PVFuNXtKxlk02OCg==
X-Received: by 2002:a05:600c:5250:b0:42f:8ac6:4f34 with SMTP id 5b1f17b1804b1-431bb9e6047mr144722865e9.35.1730669187553;
        Sun, 03 Nov 2024 13:26:27 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910718sm166150385e9.12.2024.11.03.13.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:26:27 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 01/11] staging: gpib: Fix buffer overflow in ni_usb_init
Date: Sun,  3 Nov 2024 22:26:07 +0100
Message-ID: <20241103212617.13076-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241103212617.13076-1-dpenkler@gmail.com>
References: <20241103212617.13076-1-dpenkler@gmail.com>
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

