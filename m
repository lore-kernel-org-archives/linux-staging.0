Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BD1F81AE
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026259; cv=none; b=AZ+xjPai1IylrBrY0IIGGO57vjnhwIYpR+bwMS8FnPgifwEWSuATCoxikBTs1uKyStdm0OmguVmKVay5nedzR8zo1wFHi0MTmjhfnchTOotkirgJAIOGqc5xuS7ad+kCxhV3UrHYoZMMcLYQ3pF2RNEAfRCoNNjJCE9WDQ2t7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026259; c=relaxed/simple;
	bh=Kkdd6ff+KpXBntfKkv85C/9BSpxOJGjkgUJDUsuh9wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B5NH3Zu5J8sXkAKEYpXmKtm+QatdHD3iuFCIKNE7lnBJ+eaBvM3Fge+9Hm19E1SxfTTZVMFizOTlwOz0Tcd5xyzqUPR92M7NQsT8Q8651M3ARFm9bkxz5rPgcBvN4Z110qVz3OI2MR9mctXYStDUjPSBSmUjTAdcy5ro5VSMCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=2kFuOa7W; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="2kFuOa7W"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso2330771b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 14:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729026257; x=1729631057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VyyCpmipSwY90kbSrIopf/4vKgm9p64A6xi8/YUkg8=;
        b=2kFuOa7W89TNZh8Hah10f6A6ppVycS4ocQ1WyTnCggh7p8fJBlDkNEVcxvgMTbsqXM
         gJ/WPKxF1kJBcYunL3Ege2+9l4+Cc15wj8A1ums8O95oOmFfFogW+hU9OnapucnrN6tV
         N1eV1lEJBTUWq/I4qDixnXCcrOAdkmhofsJsJ3MnSm0i6sIAG9oBJDVU7fcf97u/7qsy
         eOc4DO4TUIta+Th18YoC+8r1n+JGHh2LzPkt4MaDfKfT/DJWKVKBgHX58chpBckUUJjX
         clIk1ZK3SNQHVkrEThsUBxExpQ/QAQAdrcN6nENhJJ0zmCxrzfZXht0CHLUpoWjqRHYa
         VeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729026257; x=1729631057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VyyCpmipSwY90kbSrIopf/4vKgm9p64A6xi8/YUkg8=;
        b=GKcjwJO3BkMe39cqNo6Mq5sW0eI87YhMy+MSfQMayy7L1LQ2UyZELJsUG0xtLwNhv1
         +rghODy7f9iQhYg+4inwaoxzbRReGkzBWIIv54b1ec7AtSTWEBpZnRS9tb7FRPUmP5F4
         bW5pjjCRcbvzW5J1BnA7+Z16AzkF4g6ud3ebp4E0+Nwxat1JZIhn2ebi/ddeFXBXnm8R
         pRTx7xQsHqkckxQ4itY0Opy37KrDA2mh4idUBM4txZBumryl2xnIWjUg9xhBz2MiWdj/
         2CvGx4mOUlQ8xIK3ggMjaKyQyAYdwg0erjiTi1zR6vBpKcrZWKNCdZA3sWfEMDQ/T+t0
         d5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3miZ/Z0laKYqu0RJAL5lX0Ay3tNRYSGh9XHHuwxf0+WOtYlH1bMC+346wOzZeBTvUvtLMLrBbec3+pBuu@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo/P/KS/lz2Ho93aDGtSr4K4kAPFXa/jg5ktwkvN5gXl1d/09l
	20EHU80zOuyIaaOYc4NV7xBCo9X3SAYYi6n7+Flknfv8m6h0hTftsJLJjZpFhqk=
X-Google-Smtp-Source: AGHT+IGfXJn4tGXJ7k9K3+eze+dIDh/mipxp6am0cLYFj+vHhfSQfPILSNXol1LEa/ieRQEpX4UoLA==
X-Received: by 2002:a05:6a21:e93:b0:1d3:ba1:18f4 with SMTP id adf61e73a8af0-1d905f10178mr2320066637.26.1729026256833;
        Tue, 15 Oct 2024 14:04:16 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71e774cf5b0sm1755646b3a.167.2024.10.15.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 14:04:16 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Remove unused value
Date: Tue, 15 Oct 2024 15:02:57 -0600
Message-ID: <20241015210300.17941-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable `complement_count` is assigned a value which is again
overwritten in the next statement.
Fix this by removing the first value assigning statement

This issue was reported by Coverity Scan.
Report:
CID 1600790: (#1 of 1): Unused value (UNUSED_VALUE)
assigned_value: Assigning value from length to complement_count here,
but that stored value is overwritten before it can be used.

Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 1da263676f2a..e19e18892468 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -759,7 +759,6 @@ static int ni_usb_write(gpib_board_t *board, uint8_t *buffer, size_t length,
 	if (!out_data)
 		return -ENOMEM;
 	out_data[i++] = 0x0d;
-	complement_count = length;
 	complement_count = length - 1;
 	complement_count = ~complement_count;
 	out_data[i++] = complement_count & 0xff;
-- 
2.43.0

