Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D212EB872
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854336; cv=none; b=VRzAws4uC/8iJDuyLrgKxfSUT33RTPaSVyZcs++Xl1bOxsIZPEopv0sBtkBP6ZNCXzfgIQ3gmw7wlddlIqU0eRXeA/VhcbFTQLoJAbMpwoMttwZE1/hYzUCQ9oyCXVmyKMHEfv7YZvUSmnM/4WsXHW4vLCVXYwpfNS5yXXo+R08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854336; c=relaxed/simple;
	bh=IOMKATf4WlRptW6Eh2eCnd2gEghdfx2vgXIU4gGtjTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5eMq3Tky5rxeKwU2IztZG4BAlOhKMnfRV0KhRClg1n5nPa3ParIm2jymjlXglwJT1iIxh+PBMjmiKifQhPgikv8RlSG7zxwapMyxoN4LFcpj9OfEwzZGbEe7Vk/QFVU6PxL7u4X2KATUYSahyzHI1KEvhANtBJ8PPArMEi+TM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml7MGjFC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml7MGjFC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4710022571cso38098175e9.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854333; x=1763459133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFSFlISYEwJhzl0uBpsUYIAL1eAWoNbR9f/0OF3g05Y=;
        b=ml7MGjFCvhHUDherkt08vZkpN9749oOSpsCQlsY4kKDvVl7Qu6TQW3PAIlCZwGIEGQ
         OYDcO+bsSNHqEG2yhwRxjBH+g4HV6iqqprOqwA+66J8yGYXf/41rOntI3p1HtkKNBw9A
         GgTQThY31yUla1mnvJ8tI+Og8SDThbLEcZRr0/+G199/eY+hOFOMcnW9Xm6wzN0ME1rQ
         l4+6cH3PbHdI9uND98aejhmEndGiObraeHDWZzMb21m41joFWkjZmFXI9wQnlSnZ3Ulk
         8SHJjBEq8ZiVu1F3EDB0/Xj8zDPPHwiRFNpNPKzkYYFMAsLcKx6Cu738LSnbJHvp4moa
         tWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854333; x=1763459133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PFSFlISYEwJhzl0uBpsUYIAL1eAWoNbR9f/0OF3g05Y=;
        b=OuY7Sp+M/Oe9gXhveHtH8VkScqDWOxe6rL1tIrvJ2An5buePzF3Uy+Q5bcVV8x0GuI
         +Uai8QeHzGJqJUralj5xR9r4Cn+lmF8SCC5R3ZTeWejBnrN4Xovc5YFq3zdrcA22xZYw
         f14O3drP6V1yZkQhzJYlYRczJ/4SIDZXKxtsfz/1lNZ42eR0p0aBPaG+TfS16RcZGR3J
         Aiib8CFjCljR28qL3yaStWvkEKMbjSMC0jNRZnItoK4w2DFjQn3nHIAwFNGQ/4NNIPlp
         4Cpl0uU+PInvukGTbk0swxQ3Hj8Pf1be3xcPRaEqXaOD+8pTX5ZtFotv/18Jg/XZlQr0
         mNsg==
X-Forwarded-Encrypted: i=1; AJvYcCV9KzLydbYYc6KvjKalajyaZJ19dMl7uh6sS24ElQ8sHD/4W+CD/oIgmDGcxds+kgbkc7J25OboqUwRq3sF@lists.linux.dev
X-Gm-Message-State: AOJu0YxSKkgZ4huCZmjP/eSd9yg80Ua6UXWmbqje2Rt0eEAhtEPLvOC+
	kWh3auy5T9iqjzVyecdYxCg2i1l0R6lRfMpaT4A44ATfOs2XcidZ2htO
X-Gm-Gg: ASbGncvZMW8NMzbS/gcDwNGsr54KTK/QP/bIqLCFPoqny/1xG2EKbUWWGRH1oLfNGZj
	sqyHDQRkUVdtsTygCF9Mn+y4thH5GVwdeMRYnocMSD1QmTYYVz8D2Pp64+bvvdtZhkUP5V0BXWG
	LmryTSzooAVf1/e/1tQple2fi/2Ll3gH+aw9PnZd8yXv/KOe2JsnBB2DtZ4spEhZsFvxhGQCupu
	+6PPhVTq0Q7QDWPRO+MnKwaqdAbirlwZ/yzOI/BdA8h5PqE4mcejJRRv3mc+q3ekAW8qtCv6QNU
	3mk4Xoxiy1LjMMllXmsiLxGaM37GM9RP/dY3E7C6CXKfCEBntyvjGgpFnRkN5xUhUHzpwF0X++3
	1GHueKIEoFE0y3UiAVRpIAV69UAIZy4D5YG1Ic8TIxmba3vhCr9xcNMCc/IXEiyY1L9hqsJGze2
	glYnxWt6c1SP3lfJ0Soz7/Y9cTi6IyctSzWXmMpA==
X-Google-Smtp-Source: AGHT+IE5aGbmMnHqM8MTScuynQw3Hppb7/2xbS0m4OPM64yMVSpHkqblBrCPgqUqA9PyRU5r2+2CsA==
X-Received: by 2002:a05:600c:354c:b0:45d:d1a3:ba6a with SMTP id 5b1f17b1804b1-47773280fecmr122983135e9.33.1762854332737;
        Tue, 11 Nov 2025 01:45:32 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:32 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 03/10] staging: gpib: Change file path for uapi headers
Date: Tue, 11 Nov 2025 10:45:05 +0100
Message-ID: <20251111094512.6411-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111094512.6411-1-dpenkler@gmail.com>
References: <20251111094512.6411-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the gpib destaging process the gpib/uapi header files will be
moved to the standard kernel uapi directory include/uapi/linux

Change the include file path in the code for these files accordingly.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/include/gpibP.h      | 4 ++--
 drivers/staging/gpib/include/gpib_types.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 1b27f37e0ba0..e3938ada3e0d 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -12,8 +12,8 @@
 #include "gpib_types.h"
 #include "gpib_proto.h"
 #include "gpib_cmd.h"
-#include "gpib.h"
-#include "gpib_ioctl.h"
+#include <linux/gpib.h>
+#include <linux/gpib_ioctl.h>
 
 #include <linux/fs.h>
 #include <linux/interrupt.h>
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 998abb379749..5a0978ae27e7 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-#include "gpib.h"
+#include <linux/gpib.h>
 #include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
-- 
2.51.2

