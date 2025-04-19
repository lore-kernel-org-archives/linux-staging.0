Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D050D17CA1D
	for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745059982; cv=none; b=t1vZXX1ISwyfWqBRZB+1gP7+N39PZHK5lf/WHs6f/64TJAdHLpONzr+wJBdebpu1PdbV3U0LhO2x6SPSNtYtoc7tw5RCF0DTeJPRo7cowC1MSZrFuV9eERHr4w5HJ85+2KL3B7PjaRmyqOJjLZKoxRYBAq1L+Uo5pQiv30ycEHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745059982; c=relaxed/simple;
	bh=pFV8+APZ4afiOUH9jKEl7rLalv/bvsUYNtAAe10IZIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkcMWyKQxqFCRk25TaGnrfePZStjEsMUJblrx3u5+dHDaVt5UEikLHsncJy4h+vMBnuWofKuUIiPaVXKWre/ZP3n9vZ21VqKmqI61fI73DBRYt2j/qc0vWxqFzmiUn3nKq6AnUxe9lSjcJSfoN3vv67siTH3zn4IBwF8gz0x8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwEih/l/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwEih/l/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so17124665e9.1
        for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745059979; x=1745664779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFWYZupELLcAGnpt4Vy83r92Wa9TGPIc4ZEGsiqHyQ4=;
        b=QwEih/l//kCilhqc0tyTQ7oUYyN2UpWlsiYU1caoDriZceli2D3y5gf/Un3oKQuOpF
         C6dPVLECIrH2aKl+lKhkTdCyWP5vNhIOvXcuSziXdW2DRF71uMC67cZUy3pJo4pZpaDb
         p4/TYA/d+DnULkQjDcVpuBOvGohxJKQv98nZUmMIaD10Di91Jbd12UKI4/NJuIt/K1ge
         5h2jNoB8LzDEd3FWDdQ+aPJJiW0LiTzyp1ihQGoh+3HmBZcGjUP+WLWYs500ZyQXu2OM
         Xy8gykaJoyXwiUSrLq7fIjCqKIfF0zJw/067p1OU13jXZt6BDrnXtxnvL6V2u53Rtjtj
         +T/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745059979; x=1745664779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFWYZupELLcAGnpt4Vy83r92Wa9TGPIc4ZEGsiqHyQ4=;
        b=IxfkYPN6PH/Le2XI9mwrpkxU+PgMUDqtflO+cIrCKOGifkTXAjZOprIMefIVFcegz6
         WqfghnFuSbxIE9R+u0iexE8ocMR0GifAXTkN2b9M75MsmwqgjGp9tRQIIewvPZD7XDDy
         mVlxjZyJaObR42Obpzr/eWfu2PDdW+LRUP4P15OtfbPiy9hl0axmPmlD2K6VIP45zhpl
         ENc6Gx1vU5toNXNWqhYnGh0w7b2TuBC8T1TR5bTBwMFs0tITaS4CNObtLUHwlttMVmNM
         f9+7KpELgv0dne3om6C2jFJDe4FkZhUPG5ljfcFAgfxkgKBzmU4klbQg04WlW5GC1nIJ
         w+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUl5ipcqymLpAARBdW78vnhb10EanC9Lq+HsDRUOJfzRnhACI7PhOJzsllRDE1shZqSli/mk9y/gFvV/U5m@lists.linux.dev
X-Gm-Message-State: AOJu0YwW7mUHNfgM/47IMGQ6IE9+kHhmFuyeLwH+YUxhmPP8NegYWEnG
	JgZkvqmZHadEJTeQz+DQh8C+T88p1YfDFGByKDTmqtvWozdUag6k
X-Gm-Gg: ASbGncvP4GsXXCkMz8RHFlvRww1lE3y67PhaTbZGbV6XPy69W9e/cwZLtbuudpMT1Mr
	cxxUX4z9NscKZP1a8r4Igl9MI771uYtzZ9Z5Ti3rDjhiebai7HTifMtRyEJC52y/kJinasxlHUT
	byWssR+PykUeToa4uiPFJhpA/Ow1eqobphAoELnXqipfcHx6d0lXtEHgYfTzwOk21vl9FsjfNea
	QMQTNqLdOh347ckZg+1haROppSVLidD9Allg2W3XTyYeX8Bey22v8N6ZMv0XzEU7Ucmk2UaEWCO
	Oz2C6RiXzz9skmMIs/B1UhVc5dbAjWNT2X3gQTX8j7mP8n30NMscDK0rNU/iHZ3pPKa7GvG+qEO
	16cRfuTv17Q4=
X-Google-Smtp-Source: AGHT+IHQ+MXguJN8Aa1j3IBdwBDm20XnrgHtQh87ohXGPTj1gd8ZpivxPZL5sQXTV0FZDXnAg3v/nA==
X-Received: by 2002:a05:600c:13c3:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-440697104f3mr46649965e9.5.1745059978924;
        Sat, 19 Apr 2025 03:52:58 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44034fd8f37sm99471545e9.0.2025.04.19.03.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 03:52:58 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix lpvo request_system_control
Date: Sat, 19 Apr 2025 12:52:54 +0200
Message-ID: <20250419105254.28359-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board should not set the controller-in-charge status in
request_system_control. It can only become controller-in-charge
by issuing an interface_clear.

Remove the setting of controller-in-charge from request_system_control.

Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 2e315c7756c4..3cf5037c0cd2 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -916,7 +916,6 @@ static int usb_gpib_request_system_control(struct gpib_board *board, int request
 	if (!request_control)
 		return -EINVAL;
 
-	set_bit(CIC_NUM, &board->status);
 	DIA_LOG(1, "done with %d -> %lx\n", request_control, board->status);
 	return 0;
 }
-- 
2.49.0

