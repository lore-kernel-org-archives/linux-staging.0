Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB6C221D94
	for <linux-staging@lists.linux.dev>; Fri,  9 May 2025 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790223; cv=none; b=p8qloh/3V64mhqmijrhf76E/8DuNRyi126JkxMeJLQCMCMNej1aScEPu3NZWrxDJiX+sEaj1Q5vunrK5zLUUzZR2QYC4eLXnXDOuZb7vAHQ7BLCFMhaVcIfBHUjHQb/PH7VsO6l17cV15ETDjFK+SLx4ZBO8zplVUF4t4NcP6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790223; c=relaxed/simple;
	bh=VdV008tfzG6KNU0S5Gsb+VG889BxfzCXyOCm56rnkUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrPd8CcqHQqo8JPJosArrGlvxtW+vMS7X6OW8k+fLuIgiqIz95DuspMwEQk3gpo6Pz7TtCH2+4Nmex1lSNaboM8Ej7udiUST+zXg50SiYhirCv+rasZoMqd6EkctZWvhD3+Tg4s5Lb7K6jVO0eUi5Nwu4HBWWAfFkvN75COz+xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlYXGuxh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlYXGuxh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so21186025e9.3
        for <linux-staging@lists.linux.dev>; Fri, 09 May 2025 04:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746790220; x=1747395020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmILc32KRA1sm99pcoMQ3XSkwuHQfRNl6IZq9ElsNb8=;
        b=hlYXGuxhzK+nb4Bkbb73QOpRe+GNiHmtsZC/+YrH8QTrDzwI7B5uE0FbDQRFv/SbNw
         XRaQRD2DrIWRpBI+OqkTs1TblxLokKR4gohaxgQ8hQkk9rCJj02w+/zVe7mtT2gLUk9n
         VhsiDn+Tysbho+8VASp+QYmpxG3rEr1VY0/fzZ+TDdM7vW31dnW9zt+j5C5kyfnCXPca
         OmQRz/9orRu+flOICLBeOcqiyrNqUhKXYrVDas94yL+82+A0i8Vh188rXMNoTJiAYn2J
         3jX/LGMqUU4u0g3lb1pSFJByapJDT9TV25vFjIz9Cir2KTNO3Ac7e9mlQKu11sBkOY19
         lH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790220; x=1747395020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmILc32KRA1sm99pcoMQ3XSkwuHQfRNl6IZq9ElsNb8=;
        b=uEBzHJBk8nropU7Wn5uMUcupjz7MZGgJ+VrjP5vKLTL324d2ix8Uthp7pq33TsbLI1
         +4cfQQkUyygWwIfDmQ3/+scA35FFGVbyMUiHIylkMTvNNPLXzUBQZxFJSxzpny27yusd
         uYvNAxIampb25kHeEXZcDVHiisXGD0bh9q5qOB0cOQZ0RCCRY0LsQtVvNXkBDZ6mmzFl
         MtrbUjBwp6+jAFORs6e0H9AnUXGSBC6kgMMN2/sGNsQLLcSNQ1WcK6QZvVDijCdLeqNM
         27JQYk56kMoYUAc0cLeLjLF4EZRn0f16fByhbvHv6ffMbysYGpE5zNlYlAMLS9cBMFUl
         wJFw==
X-Forwarded-Encrypted: i=1; AJvYcCV2uwhEzVf1tSlWDivKRz3OOhUBdm3wU16SmnkSie/I5kisNsmFM2f0gk/DwuIofcYxAAmPfNQ07BFKPFOr@lists.linux.dev
X-Gm-Message-State: AOJu0Yy50ERTL/6KSAjVehS3Qiz254lsta2ywxnQmEmxsUhlsyUuR85m
	uvuumDda79r4sEqRNJf2KqS5SJl1nDkvH/Z5IbHa/+S2zNEAnAWY
X-Gm-Gg: ASbGncsQgG+FSj7pEF+Teqvol0gUlbderk0IFxfKZdyKENMA6382IAy/YSDy/4n4/TL
	9S1cNtR55rId7d06iYdGlf/3ZZBqHaxczi3ckkvWesx5webx3BHDZORklxFVYmeO//3TBhBfV4c
	fl8th0+AuIZFo+2N42QRe8EqcFDwvSDu4w99iv0YqzmhKKyOb5LTr6UwOc1K6hEdsxjHzeCH4ty
	5ftixCYGCtjIQrfwqcizRSKfgbihxQp4KnF6NIL/+pTjWogGCw1QfTYc6InQb0BFzP7Ahl4ausI
	ab9NXUNnUko0DFrE3yjEzKIbHkMdLQG5GaS6Q2v34HR0hziUaA8CSA==
X-Google-Smtp-Source: AGHT+IEX3C473GG3Hwd+yaU0Wn+5NbsMlHdYzeasNLDJog+d2QxZs0QLEGr1LwYpGrbvvMKhFO5ZZg==
X-Received: by 2002:a05:600c:1c8f:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-442d6d1844amr24734045e9.4.1746790219313;
        Fri, 09 May 2025 04:30:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm35805465e9.31.2025.05.09.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:30:18 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix uapi include header guard name
Date: Fri,  9 May 2025 13:30:14 +0200
Message-ID: <20250509113014.9105-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When gpib_user.h was renamed to gpio.h the include guard name was
not changed accordingly.

Change the include guard name to correspond with the file name
and cleanup the comments after the #endif.

Fixes: c7184cbf5530 ("staging: gpib: Rename common include file")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index 4ca3cc9e0cd7..667e2fcc9130 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -4,8 +4,8 @@
  *    copyright		   : (C) 2002 by Frank Mori Hess
  ***************************************************************************/
 
-#ifndef _GPIB_USER_H
-#define _GPIB_USER_H
+#ifndef _GPIB_H
+#define _GPIB_H
 
 #define GPIB_MAX_NUM_BOARDS 16
 #define GPIB_MAX_NUM_DESCRIPTORS 0x1000
@@ -298,6 +298,5 @@ enum gpib_stb {
 	IB_STB_MAV = 0x10	 /* IEEE 488.2 only */
 };
 
-#endif	/* _GPIB_USER_H */
+#endif	/* _GPIB_H */
 
-/* Check for errors */
-- 
2.49.0

