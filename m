Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F060B3FC2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 07:23:25 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id p15so15676619ljn.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 00:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JoY33i5ftrish27nhktXchD0Lz1YLo/E0GHRGOrXtU=;
        b=S/bho+vY5JFqlvqTMWsyGgOezgAa4IU3NuEDdyiMjjdSMtq7rp+0NiD3IJmRnPzln+
         5EibOExblM3+HDchA+BvbNSE8AncznP18X0lqCv0i6uLDZip2KJsNl4cFvjgLQb4MKXg
         K+HtWJchhKUCs6apSlCAR39OBJZxHvFInwO7wi3UK44g2HbOM9IveP4y3LY0dkZV9v+W
         DrTtbc59GbSPVwUV6eXm+Xn2qed4fbGre59JE7FoayzLMfBzCGXjQpk00EGg+oQO6s8K
         sRLBFYAtlBlSKKnbpmMeAsAWpyLeLJh5y+SK8nkBS7vEpF7q+3uUwfbVsElQseHluV0A
         91dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JoY33i5ftrish27nhktXchD0Lz1YLo/E0GHRGOrXtU=;
        b=R0j7x8XAvkSsgrK5Uy1PNDwSZ9xg1cIkjzOZbNmxe4y2G86pW7XMhnMAOSp8ArXA3e
         NjQZaJ1ekY8jXImzSAjjOyVlu01grxLxXlY68I7I/oFMkItV4r50ct/iOXCwXbvx1a95
         ft0JjZtgBT7Y71FXx1Or5xAqwrSe8N3cqSiDDfmLCIy0emTIQ7O4N7avMJ16Qf/71fSf
         S0VjYGsFSV/AKJ+gHHbiUE8mBqS/0Zm5NdvFpI54z0ACw3cvyUZP+9KeAavTXOldQxtX
         shO7KCrjLgam+QZo77ejL/ffZaRU0f1hfE5B734GpYteHvmIdgpjWwVts2wnRKTaZh9j
         yS6Q==
X-Gm-Message-State: AOAM533vIO41UvMiO7yN/RDy1MkvGTYUKPYKcdeyETh8jGllmlA1TTuE
	gJroVIOzK4spzNF1/Xfgt6A=
X-Google-Smtp-Source: ABdhPJwwhhm+TjZLXhsqyguIRiUJCkMT2FVP5T8LUB/tdZCq+u9I6bCP8Do+wkWluaCdgI2EJaiIXg==
X-Received: by 2002:a2e:934b:: with SMTP id m11mr11593613ljh.284.1630135404058;
        Sat, 28 Aug 2021 00:23:24 -0700 (PDT)
Received: from DESKTOP-5EKDQDN.localdomain (78-63-10-115.static.zebra.lt. [78.63.10.115])
        by smtp.gmail.com with ESMTPSA id v10sm264552lfr.82.2021.08.28.00.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 00:23:23 -0700 (PDT)
From: =?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
Subject: [PATCH] staging: vt6655: Remove filenames in files
Date: Sat, 28 Aug 2021 10:21:19 +0300
Message-Id: <20210828072119.1395-1-aldas60@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch warnings about having filenames in the files.

Signed-off-by: Aldas Taraškevičius <aldas60@gmail.com>
---
 drivers/staging/vt6655/desc.h   | 2 --
 drivers/staging/vt6655/device.h | 2 --
 drivers/staging/vt6655/power.c  | 2 --
 drivers/staging/vt6655/power.h  | 2 --
 drivers/staging/vt6655/rf.c     | 2 --
 drivers/staging/vt6655/rf.h     | 2 --
 drivers/staging/vt6655/rxtx.c   | 2 --
 drivers/staging/vt6655/rxtx.h   | 2 --
 drivers/staging/vt6655/srom.c   | 2 --
 drivers/staging/vt6655/srom.h   | 2 --
 drivers/staging/vt6655/tmacro.h | 2 --
 11 files changed, 22 deletions(-)

diff --git a/drivers/staging/vt6655/desc.h b/drivers/staging/vt6655/desc.h
index d4572847b08a..17a40c53b8ff 100644
--- a/drivers/staging/vt6655/desc.h
+++ b/drivers/staging/vt6655/desc.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: desc.h
- *
  * Purpose:The header file of descriptor
  *
  * Revision History:
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 29f354ced563..2af769174e33 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: device.h
- *
  * Purpose: MAC Data structure
  *
  * Author: Tevin Chen
diff --git a/drivers/staging/vt6655/power.c b/drivers/staging/vt6655/power.c
index 6b0407694e54..aac021e983d1 100644
--- a/drivers/staging/vt6655/power.c
+++ b/drivers/staging/vt6655/power.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: power.c
- *
  * Purpose: Handles 802.11 power management  functions
  *
  * Author: Lyndon Chen
diff --git a/drivers/staging/vt6655/power.h b/drivers/staging/vt6655/power.h
index d1736c1cbfa8..060516f81f5b 100644
--- a/drivers/staging/vt6655/power.h
+++ b/drivers/staging/vt6655/power.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: power.h
- *
  * Purpose: Handles 802.11 power management  functions
  *
  * Author: Lyndon Chen
diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 747d79265a7c..0dae593c6944 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: rf.c
- *
  * Purpose: rf function code
  *
  * Author: Jerry Chen
diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index affb70eba10f..d499aed45c9f 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: rf.h
- *
  * Purpose:
  *
  * Author: Jerry Chen
diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index ff452067a617..5395c3a3e35a 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: rxtx.c
- *
  * Purpose: handle WMAC/802.3/802.11 rx & tx functions
  *
  * Author: Lyndon Chen
diff --git a/drivers/staging/vt6655/rxtx.h b/drivers/staging/vt6655/rxtx.h
index c3c2c1566882..a67757c9bb5c 100644
--- a/drivers/staging/vt6655/rxtx.h
+++ b/drivers/staging/vt6655/rxtx.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: rxtx.h
- *
  * Purpose:
  *
  * Author: Jerry Chen
diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
index df57d120ed30..5cdbc24e8c45 100644
--- a/drivers/staging/vt6655/srom.c
+++ b/drivers/staging/vt6655/srom.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: srom.c
- *
  * Purpose:Implement functions to access eeprom
  *
  * Author: Jerry Chen
diff --git a/drivers/staging/vt6655/srom.h b/drivers/staging/vt6655/srom.h
index d8aad3ff5f46..b03073ffa18a 100644
--- a/drivers/staging/vt6655/srom.h
+++ b/drivers/staging/vt6655/srom.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: srom.h
- *
  * Purpose: Implement functions to access eeprom
  *
  * Author: Jerry Chen
diff --git a/drivers/staging/vt6655/tmacro.h b/drivers/staging/vt6655/tmacro.h
index 8f4699f0d1f4..1582c03124c9 100644
--- a/drivers/staging/vt6655/tmacro.h
+++ b/drivers/staging/vt6655/tmacro.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: tmacro.h
- *
  * Purpose: define basic common types and macros
  *
  * Author: Tevin Chen
-- 
2.30.2

