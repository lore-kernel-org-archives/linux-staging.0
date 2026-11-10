Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287101;
	b=hYT12Q0TOVBDyXL/t76+zqGF/qVjaqT2/smd8hqE8x5W+03+5zbRWfpEt2J7jhW/UIW5
	 zegXXP3GhPa3Ll8JViS5nuK/Iy99tf9nHfuP6QajjEJi1P9EwHHOQqjaTMTS8iUc66tGU
	 LofWbeXfsX2lD9BwmOw3wqeSmIJwNHF9xZQt4F/0zxBW96PEmiRWC41cUMRfhzM5e10qB
	 Zu4UcKLmVAQF0EvWWiIV9JmdLnpZAsh6UYoQ4X8Wv06ME0H0lJGvrkZQaxVrCxOcL/CJ3
	 J5TPYwnrweaVhc55F3GT+K4u5ZLdE7FsUcGouGIrTeB63QgMPl+FoaTK6ov/f7Z5f6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x28Xh8Kl636Xj0Syxm9iILHuaCS0bk0qyS/PVv+3B/0=;
	b=VEJXInjdDlij4Q7tCAvfJ6l4i9SX4vV0bZwATHBWp8NMNicPu9pBSx9/pJUWEa/VTOdq
	 jJ+m/6QFeiurG0USX/dbVzVTDkLwwZH4FIyPiKfiSAgV8GJdANklHsfp8vI4qKRetLwjc
	 keanuyAXHBpRXEoWhCFd7Xkr7VpwM3X9ZZ9wWnFhLnYRkZTxUHZ75enaNT6RUtYRRT+n5
	 Am00iSUMPxcwFBKCAbO/svK2FJgvH8rGgYYfxPs/wgocby4LjUBOg1HzhTPy4wovx10Rx
	 dBMUYUq1Jz4oIFh1Q60kTtujAAXUmWr78YM9kk9Rs/0rUtNh22N73QIP1wESuOA+0gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3gFn72e;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD8606D6B9
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 05:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAD8606D6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3gFn72e
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2858223eec.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 21:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794287100; x=1794891900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x28Xh8Kl636Xj0Syxm9iILHuaCS0bk0qyS/PVv+3B/0=;
        b=A3gFn72eurXMtrSluasD2njgHMGwLgyxSh20ZtNcUqWs0BRBVU3ar+8OtBWPmq9IUs
         k1y5U+rX9vMPxqY3gPzLxRnw6cqgEcfTxZIUsXY+q/Dyn5ouGwLUsm7W6p0xnqhrj9qT
         +D2mpMq59K2S3hR+5XnixLt+WPNBa9THhaaiRlOeNepI8OmTJKM3RPO1nCGh/I/Ck6BB
         WIxEJ1cFcbDyOwYOlrVlEpl+fUVnpa9H9ub3ZQr+apyw/e3zO42iDqA6g7gK18qAJBQ5
         J1Y16ZXC3rETcpbGHt+YaiutcUB1GRA7SJw816izH+Ow47R4kjJ57PIQuYCm3lxI6xmh
         ZTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287100; x=1794891900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x28Xh8Kl636Xj0Syxm9iILHuaCS0bk0qyS/PVv+3B/0=;
        b=pWHu6bdEjawQNAaQ0BjK3FYf3U9sDJScFrRIv2raTl3OjM9KKjXSrIPQ0q8RCsbXiW
         qhiPRRwf7EePGiifyEFnSW3/T+65dta5VIjHYlZVFgnY686RuBSNllnrMyymdFfsP/Jx
         QrPHRpt7hAlFu4F21ES33JlHkQ3bNxD6Oq6xH0N2mnSwBnAwc3MtOtruqRt6axLqBH++
         glnLZtpbMTjINrrwv7EQNnTbTKgb0BbE/5/8CnrPbrSBAq7OHuP8G/RY0jaS5HwRmgp4
         wtv02a3/F2LzztBe/6isP5/WWHBERhv79ul1ap6t/PBkBuBReIL0NIJM7sDZS7JpGG7S
         zKpg==
X-Forwarded-Encrypted: i=1; AL+hErFsD6JMJr/P3Ze4tdPDItD42yJE9g+fI86zVPtUqtyDb914jYGQBXyEby/kfv9fxl1uZ2+neRWyCK9thTut@lists.linux.dev
X-Gm-Message-State: APuU4Z9Ao1YyN1m9r7qGx4pYNHeYRIVUkg5LS6JAs92P4hWu8yuK5Xxn
	eNKfI6C2gFSh1bfVi2Q68BApMGO6ss494faUgZjtCLP1ffSO+zIpH/4+
X-Gm-Gg: AYBFou3ipY38T1ok/tW9p1D84hKcGjjGPM0wC3ZdIAxLzZnHeUEGg8qOrS36hNxlRld
	OVv4XFZi7McP7/G6IAnVUyc1rLtpG3VzfyH9geTvMUTCNX9kRw+A7rJdGlYFhx87w5fSIBtMn9O
	Y3FchmypSHeGa2vdDtOzhI+Wihokj07Izr0tDG/i9UNglYe3GS77xin72xYVOIHa1U+arN8tzvq
	tDtqx7JGzWiz9J3jKp6+2O57WwBjWWs5UmPJy2vugMufyzz1exSP6odwot64EBGk9E/vUYG1Kdi
	qiDTRp1DOyzggXbbalFtRWi+85L2uLjml9N1TcOKLKvrRKxZ72ABeJzPO/5aEpjan7kqSay6DTs
	mw4VfbF8+XgtaNuKgDQSf09/eWoJxWQklZD+KpTfq15XmsuG6CGVtjR/E5dOkMT83gSv4z88i3l
	anup3xN8fe3R1foCY8qyJBZka284JQM2Y4ESrfh9YkXMW/pgpA3KpqCSC8nAHgKND6L1WHpxGRN
	o4LVYbY4KLVGrUHbMgFLNV2Oz1b1Hj39Rckq5p2kB2hrXHwl5hDqUV//5pv0zvb5LuqxgjVVLEN
	r16kKm4dpKkBTak6l5ZdRk6D5qWxBNyZm0uIejtUn4rsxmaLf5yrqnVIxG8yGAr2lPzc9BP9fCd
	QJBngmiiaYLHAjDv6RXhVHog04XnRJfexxvozfgg=
X-Received: by 2002:a05:7301:4d14:b0:375:4f3e:643d with SMTP id 5a478bee46e88-3754f3e6572mr1368404eec.27.1794287099742;
        Mon, 09 Nov 2026 21:04:59 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm6550235eec.23.2026.11.09.21.04.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 21:04:58 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: outreachy@lists.linux.dev,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix leading space indentation
Date: Tue, 10 Nov 2026 10:34:48 +0530
Message-ID: <20261110050448.69521-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace spaces at the beginning of the line with a tab in
atomisp_find_in_fmt_conv_by_atomisp_in_fmt() function parameter list
to conform to the Linux kernel coding style.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index bdd2d9b18..773fcea56 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -96,7 +96,7 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 }
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt)
+	enum atomisp_input_format atomisp_in_fmt)
 {
 	int i;
 
-- 
2.50.1 (Apple Git-155)

