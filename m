Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BFF70
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 18:12:12 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id h18so6817526ilc.5
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=9sdevUXdH+N3MKgpmyJ0uuYWzaLPK/wTSy/wLrHVjl8=;
        b=LrBlLDFK9SjAKAIlpsdqQuLi27/nzz0Htshch9Ud+UGin+RPIjolujKY+S2k5M7VFJ
         uEZno8mjctrUSlMaxJdUPyAaqVFhl++DggUTqgLqDRmmTNP2OuMUNO90KCosjdQRPwfN
         XJ2L4DGs/GetU7KUF7nRTuH2+MBYhBoogL2h2jy7ZypP03cdUZzYMExzFZnapi9zptdS
         JhJ71O9rbbrAJXc+zG6UeK4+wSxjVVjlXwXZRJ/zPE0YzsgBCOu3gWaxddkkuP3Xl/e+
         lOTX0Y61nHnqkQUNCtlxIjfyDzxBEvomF8Fzkr/cnGs65JjAGO6sBMRlmlhYgn9MUXBM
         b55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=9sdevUXdH+N3MKgpmyJ0uuYWzaLPK/wTSy/wLrHVjl8=;
        b=LOqL8QxKtOuDVVWt3JnhzcEv94W/XVNcfDUWrEa1sDLcVMgRaPMKhsSCzpOjf17C9o
         AZwYJIz8GPgkbCGrF0mTsecCGwGJP38+wB4jnx7IsOgCaD6r1L/xi9iZuSwvZWWNp9E1
         SYLHHhXXWkwXhI1IGnnl+fzcGodfNimxXv5qA/kEQgGZNp4SB0F2+KSclKBXTTrrmZsu
         i7NOU9xruFzRvCaDAdeYcWSsaJDL00gAAQMAFD5E58vVKDuT/nAU0+x8D6NO6vrVqi73
         pZ10YuYzdC5Qd4LKt1xvrBCJUzg/E+LFz0oJH4xXNbMfO0HKdMDvwGQu1gKWnULAf+9e
         WnCg==
X-Gm-Message-State: AOAM531IsHytPys4E5YlLI3GoAQIdTRCzScb7a0LHBCRRaQkbUPGjMx8
	uIdoNtujQI1ZBSBtbgyh3NU=
X-Google-Smtp-Source: ABdhPJwBBLYzIuCuR89jLr3eHp4+lZIMPFZKNgT6IQ2uyWoCBdtrwJv3TXGGgxcL1FFYHLZeESDYLw==
X-Received: by 2002:a92:c5c2:: with SMTP id s2mr4665254ilt.180.1627582331952;
        Thu, 29 Jul 2021 11:12:11 -0700 (PDT)
Received: from Agam.localdomain ([2601:402:4500:9270::5e36])
        by smtp.gmail.com with ESMTPSA id q10sm2893988ion.3.2021.07.29.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 11:12:11 -0700 (PDT)
Date: Thu, 29 Jul 2021 14:12:08 -0400
From: Agam Kohli <agamkohli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Agam Kohli <agamkohli9@gmail.com>
Subject: [PATCH] Staging: rt18712: hal_init: removed filename from beginning
 comment block
Message-ID: <YQLveNI2UrnpeeAt@Agam.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed a coding style issue

Signed-off-by: Agam Kohli <agamkohli9@gmail.com>
---
 drivers/staging/rtl8712/hal_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
index 22974277afa0..dc138fe7d2de 100644
--- a/drivers/staging/rtl8712/hal_init.c
+++ b/drivers/staging/rtl8712/hal_init.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /******************************************************************************
- * hal_init.c
  *
  * Copyright(c) 2007 - 2010 Realtek Corporation. All rights reserved.
  * Linux device driver for RTL8192SU
-- 
2.32.0

