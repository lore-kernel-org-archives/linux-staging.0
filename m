Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16B21E3AB
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729029196; cv=none; b=qVvR9M7jjIux1xtLNmEd60HIdilgZgB95AGVtm3wcTnnTfPUakvWIKLCRT8z9i7KKLUHaq1ywtGyd2w4vJ1RkKUQdddfarWbMGvyME13+cv52p7ddIljiE/UDU7XkhGUaGNzHJqGHlmasPsTKCYsH4Y+9DGfcB87d60tZjtECA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729029196; c=relaxed/simple;
	bh=33zh+FNJ8Pdz2z5fFtLbuLnDgMJRzb/PKTlMZr5vzNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehu7mGNCGIA5bUVGp18NmIrRvS0eF6GE82JUHcohoUEq3z+KfsN7MTsqwm+7BDHXCx+ZZYMUTLcs9hXVp2KQSHi3AbQn511Ds5sZy3SyV/6JIoPlKNNiMa4R+y3KEa01SEo3M/Ine+EVpRnV587mTKWBV3E9v0hXmql06623cgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=m4GC1s0y; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="m4GC1s0y"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso683679b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 14:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729029193; x=1729633993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgYy6Bm6ST3WMLvvW5zbLbX+E8lzENv9uLpgUUiRQbE=;
        b=m4GC1s0y+9faDvUckt80hod0xSkpVN/LFrt+IbH4IrtvG/mW0FXrxERPwF/pgRq/uC
         xDcVYFugt9MmhS2TD/8WfKHrGUmpOXevOXVhGfPuZNQqoXrzhN+bASNETLTi5BQX+4D8
         uUAnPY/IVu05M/Z+zwE+Rp0HudltNipkzROKyGDA4uPCNx/2GA9xjEmI8zgRjlQwiWd0
         q+OnBC10KPf6LWeua04mq8PJQPRcVuYTs5H1MM2+7lxPN6zRYTqbo59cUrg13BmutIP+
         8ItQxmBGfa2EaXIUPECeQDctPGV8wPxQDlT81LGUruw5Xc/u75xhc+5q7P7NfJfWZOhJ
         LOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029193; x=1729633993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgYy6Bm6ST3WMLvvW5zbLbX+E8lzENv9uLpgUUiRQbE=;
        b=cKE6mbm6YtUIN0PaT1SODzYlcCbAztc3Bh2nfyxWVmGdH4Il8jDZaw8dKpeGtPZeWV
         kToJzL6JJeJ2ZRjdrwtE+jV5YF4/fl38XuO/qo68s5NBDnN5w6K5vsaNjuMFXkClqCig
         MBJsrDsUunSdvOkk2uY4FC0yKXJahH8WnUqWu/TewRJ0kJRHpPeMf0Vl7nPPwUBrM9So
         x6LIsJ2gdi5wtrqJKpVg/ug5aNdyULOJN4nXOrCdw0uCCUMKgR7EQAsopZF0zgCNFwae
         LsiOVmAKTn/+RsT1bId4eKAymM+CBMTrDXS0QYDDe87xEpDrioycmvfkJhLbMoqBo+G+
         GyCg==
X-Forwarded-Encrypted: i=1; AJvYcCU+R1Llr0sNtkYI+p/zR7z+ZZzRmPuWS2MsXFbsS0vlTfGtw+eVE20DwW18YLndPSSVdZ1ae58JLuUFs50e@lists.linux.dev
X-Gm-Message-State: AOJu0YwUR/VQVX0v0bwAl1DwirsfF8eaZWvgffZQkMH2rHt4i+FTEywt
	9t2FmZ0Ntl37B0E80vhwpNypMW1+Uk3lMk0BSwziHHF3KqHd0kHTka4r7NXB5u8=
X-Google-Smtp-Source: AGHT+IHKRWB3I+w3ryMfWgsL3J2DCrxRJgLiiR2QKNjK8+DYFibDfVRHnxZR4m7tvrx4sHkzUbzeUQ==
X-Received: by 2002:a05:6a00:9159:b0:71e:cf8:d6fa with SMTP id d2e1a72fcca58-71e7da61f1amr2296785b3a.15.1729029192757;
        Tue, 15 Oct 2024 14:53:12 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71e7750a74csm1789969b3a.212.2024.10.15.14.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 14:53:12 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Move free after the variable use has been completed
Date: Tue, 15 Oct 2024 15:51:55 -0600
Message-ID: <20241015215157.18571-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable `in_data` is freed, but used later in the code.
Fix it by moving the freeing the memory after it use has been
completed.

This issue was reported by Coverity Scan.
Report:
CID 1600783: (#1 of 1): Use after free (USE_AFTER_FREE)
19. pass_freed_arg: Passing freed pointer in_data as an argument to
ni_usb_dump_raw_block.

Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 1da263676f2a..75f39e1f3ed1 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uint8_t *buffer, size_t length,
 		kfree(in_data);
 		return parse_retval;
 	}
-	kfree(in_data);
 	if (actual_length != length - status.count) {
 		pr_err("%s: actual_length=%i expected=%li\n",
 		       __func__, actual_length, (long)(length - status.count));
 		ni_usb_dump_raw_block(in_data, usb_bytes_read);
 	}
+	kfree(in_data);
 	switch (status.error_code) {
 	case NIUSB_NO_ERROR:
 		retval = 0;
-- 
2.43.0

