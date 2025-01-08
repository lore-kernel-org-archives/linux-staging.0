Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051D200120
	for <linux-staging@lists.linux.dev>; Wed,  8 Jan 2025 17:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736358167; cv=none; b=pZDxgwCrxOY7QYozakirnspd69bFDmOTA1ljcQmFZJbOY0iOBlO6JBtYsacT/YBOaVb9WcRTaLbIiNdUZ2hgLgHGauZSttqdFtav4CXDtJ9yKkjQP9623OpqFV8UtPxdnb1T/myPsi69PkBNmNLIKRMVux0gElv1hnq0WkqqngM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736358167; c=relaxed/simple;
	bh=OI68onKi6KoJtopdFkSsGF2khOUuq6xNaRWnaWzYi6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLRcAKzjGMNXEsx+JSvx+MUK8JWG5tbRERL4JwgU+x9yYdRDzvTg/174CAHZWNvgt8pbrrNXWZYET8AZaeLhoHfLdhuyKuod0dAnQWWBPI3GSK+FIMKrtrOzQtkMe7tO2LvVQEE6MU1hlOXs6tEb2DPSY4JcirwXVSGl/xm7E/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkQR407r; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkQR407r"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso668855e9.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736358164; x=1736962964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLNrcx9cjynqqzuzB4NpWA0HHiIsSv6AxtzMCkQZk1s=;
        b=HkQR407rtqlSGkbdelMeV7lnOUsFBANZUJyWASrv40VpDNUedR7c7Ct5gb13446vAs
         P/gPlb+MtHw6He1rUXBkPAzijo0rJJBT7LPB5PX5f8wFxOtpAyxMJiwDyZ58CGqWSZuV
         +J7m6NRnqH+QdtyUSJ1MkiGn2tdtggi+HTTMQ4li5535Z1dLqZjUi9Sh/LPc2XqljcOL
         jX7lxIga4vYxTx2fm2y3CW+azqelyVq5YFY3RxoqNcwEEXnBVEUhvffsk/Z0ihiyevfV
         nNasDEgYBvGIEFBE0ctOJHpYh6d6laNdIFKbRbtpPHJAFKoGmC7saw67zE0RLMVuLfOT
         8/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736358164; x=1736962964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLNrcx9cjynqqzuzB4NpWA0HHiIsSv6AxtzMCkQZk1s=;
        b=EipbFkpRoBb8F5n2O2Nr7V/NsLPdSwRgYdHCKCu/byjb2ncysQSWsreQxdO0YZtoJ+
         UC3k29oNB78PhBfDc2qiHmzmGjxASNNZTLq5UhSElL6ao/HhkhEqaHxI/3vacIQdzVHM
         zRc1ufYm8DfbtSswtMUesnfqUmrp8bpTEVqAFammphJH184xflk1xiH4ADj6g8IjP/1m
         YLpX9IX6uTVvoChGfK3NK0TQlaYvvi0Jt5gjlp76ZKyCDrTu/nJjq7owvmIPgNKmFPv1
         rrI/1nrIINdCn26uhBlf8i+KtPBS/Bh40G5yDjHkK1Aqk5uHl8wbfrPHGScbyYnbXHU9
         zEHg==
X-Forwarded-Encrypted: i=1; AJvYcCXuzKiWXKEl0hOOJQqZOc0h7rCfNVud9kJjimIqG6ZC3arpeDBvUcQIaz7BmbL8UoRq0yhJcL4LtUjc57vg@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo0mh364Ux7/sraCMtGGbSeqgST3A4c/HSkijd1sd12ApgCO7F
	IJzFK77+Tztzm4YtK+Qlr7qkZmyVkOC2wNXgt0PYnh38tM2XfCEQ
X-Gm-Gg: ASbGncuyDqP1AP9xdE8hxa+z6LJZlJ3qEqJbsBGDg/ETTR2azxDmWH5UTZosvp+xpCI
	YROYYVAOsCKbHlVDaBsGd7pMlb311QqhXwdAi7EGCMXVBitZGtOWOIEiGkOjtAqhAY10v3M9ZNB
	LXbUdS0F3L577Ddo87V4s+i7CHoFD56Wu3xNol6RVr9/zLGp7oFE2XnJRq+Vcelw7DzsjCJDDGQ
	pTGl55eiB6RchemRb1nF1h0hImbaR8+kv7sQb7Qh+F7O5a+4rrVIdqp3iAPixrQT2REocwMM/p0
	uUU46BHFc33rmYHA
X-Google-Smtp-Source: AGHT+IFIqOkXUuSgc9JKaMiuRTstnOzHRkJFALhHX7goFQuCNxa9l/nz6ltCkfChAn3oKQpG4qp99A==
X-Received: by 2002:a05:600c:1c14:b0:436:1ac2:1ad2 with SMTP id 5b1f17b1804b1-436e26c0400mr33509375e9.19.1736358164437;
        Wed, 08 Jan 2025 09:42:44 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd15766fsm28869345e9.2.2025.01.08.09.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:42:43 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] staging: gpib: Add missing mutex unlock on early return in
Date: Wed,  8 Jan 2025 18:42:24 +0100
Message-ID: <20250108174224.23096-1-dpenkler@gmail.com>
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

