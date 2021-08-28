Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537BC3FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 19:53:29 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id m18so7840291lfl.10
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 12:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fep7azk9ZbUUiIx4juaHhTmKAWR+H3XVQCklLWNkvJ8=;
        b=J5V9lPXbpmDHa654QCGCqu21+C+7ObrXswVcyLVCRa8jYBaQx7XZ+BK7d50jTppCN5
         RrWj9IgA9TVJHLRUsJ+WM5+LZq8dZNPLMlnSYfly6WsadMlBbOzAcFvELvRJRqvdxAx7
         bFoZh3Bc+LxeK05q4YKZcPUO4Z+t4K+mDAc+vWeD2z7bSRYna9RC0+xE/5ZjnNhX9hze
         ah4I/7upp+Qu5ORHGuqOaBKFv1CzydDSiYL5QUsXW7JMxszQF6nAkclq/DqRieHvOR+J
         dVIR8Tglhrz2gOvfF7hQH2Alr+TVpjJmXv4TbuAc6WXInpja9wBTZcmhbS9C6aU1oAXW
         S39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fep7azk9ZbUUiIx4juaHhTmKAWR+H3XVQCklLWNkvJ8=;
        b=OyOMmD/w9dSn1xgQOZmzG2bSWujIEjdq+5dYb9B9SoGHyYrbts9jLqhTKpiKZM+P4e
         Nyos9E6jIvH1SOJ4qRFRk8NB3ZJQZyW2xZpN5MHsj58AhkREb6RyyjmRkxwZnmeIDTz3
         iRTE6Ly9DRUMGeDYSAFuUPbKANrNvQihbnN5VQwxqhDww1xhykdpT7z/WA+M5qszBMk5
         dZgkCymL2xsUa3NJbHGqzVKMlm7YwlaGq+ExEGz9wO0PwEuhbBAGl7XLdN2nP2PABcVv
         e7gIS3TlPMGQZhd7HpXCUATQGGvHYXZZPr9cvfhSnQnmK2IFBAEuDkxCGhDVg1mMfR7K
         cnqw==
X-Gm-Message-State: AOAM533Jgt3E2UvNhg/CBYX2nG8bl3V/TvMiK4StLBClchECdoF99lVh
	S0dcAn4BoSpqATL7Hgo1qzg=
X-Google-Smtp-Source: ABdhPJz2wSevyMhgweanNe/bwlCrhr7AkUpu+Ee78NseUStZqcOsUWPriuF4T935QlDtE2PWZCApyA==
X-Received: by 2002:a05:6512:159b:: with SMTP id bp27mr7855884lfb.17.1630180407462;
        Sat, 28 Aug 2021 12:53:27 -0700 (PDT)
Received: from DESKTOP-5EKDQDN.localdomain (78-63-10-115.static.zebra.lt. [78.63.10.115])
        by smtp.gmail.com with ESMTPSA id br11sm944977lfb.89.2021.08.28.12.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 12:53:26 -0700 (PDT)
From: =?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
Subject: [PATCH] staging: wlan-ng: Remove filenames from files
Date: Sat, 28 Aug 2021 22:53:24 +0300
Message-Id: <20210828195324.68-1-aldas60@gmail.com>
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
 drivers/staging/wlan-ng/hfa384x.h      | 2 +-
 drivers/staging/wlan-ng/hfa384x_usb.c  | 2 +-
 drivers/staging/wlan-ng/p80211conv.c   | 2 +-
 drivers/staging/wlan-ng/p80211conv.h   | 2 +-
 drivers/staging/wlan-ng/p80211hdr.h    | 2 +-
 drivers/staging/wlan-ng/p80211ioctl.h  | 2 +-
 drivers/staging/wlan-ng/p80211mgmt.h   | 2 +-
 drivers/staging/wlan-ng/p80211msg.h    | 2 +-
 drivers/staging/wlan-ng/p80211netdev.c | 2 +-
 drivers/staging/wlan-ng/p80211netdev.h | 2 +-
 drivers/staging/wlan-ng/p80211req.c    | 2 +-
 drivers/staging/wlan-ng/p80211req.h    | 2 +-
 drivers/staging/wlan-ng/p80211types.h  | 2 +-
 drivers/staging/wlan-ng/p80211wep.c    | 2 +-
 drivers/staging/wlan-ng/prism2mgmt.c   | 2 +-
 drivers/staging/wlan-ng/prism2mgmt.h   | 2 +-
 drivers/staging/wlan-ng/prism2mib.c    | 2 +-
 drivers/staging/wlan-ng/prism2sta.c    | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
index 75ed8bc4bbc1..98c154a8d8c1 100644
--- a/drivers/staging/wlan-ng/hfa384x.h
+++ b/drivers/staging/wlan-ng/hfa384x.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* hfa384x.h
+/*
  *
  * Defines the constants and data structures for the hfa384x
  *
diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index 8c8524679ba3..59aa84d1837d 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1)
-/* src/prism2/driver/hfa384x_usb.c
+/*
  *
  * Functions that talk to the USB variant of the Intersil hfa384x MAC
  *
diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
index 59b25ca50d15..cd271b1da69f 100644
--- a/drivers/staging/wlan-ng/p80211conv.c
+++ b/drivers/staging/wlan-ng/p80211conv.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1)
-/* src/p80211/p80211conv.c
+/*
  *
  * Ether/802.11 conversions and packet buffer routines
  *
diff --git a/drivers/staging/wlan-ng/p80211conv.h b/drivers/staging/wlan-ng/p80211conv.h
index 63c423507fe8..dfb762bce84d 100644
--- a/drivers/staging/wlan-ng/p80211conv.h
+++ b/drivers/staging/wlan-ng/p80211conv.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* p80211conv.h
+/*
  *
  * Ether/802.11 conversions and packet buffer routines
  *
diff --git a/drivers/staging/wlan-ng/p80211hdr.h b/drivers/staging/wlan-ng/p80211hdr.h
index 5871a55e4a61..93195a4c5b01 100644
--- a/drivers/staging/wlan-ng/p80211hdr.h
+++ b/drivers/staging/wlan-ng/p80211hdr.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* p80211hdr.h
+/*
  *
  * Macros, types, and functions for handling 802.11 MAC headers
  *
diff --git a/drivers/staging/wlan-ng/p80211ioctl.h b/drivers/staging/wlan-ng/p80211ioctl.h
index 77e8d2913b76..b50ce11147dd 100644
--- a/drivers/staging/wlan-ng/p80211ioctl.h
+++ b/drivers/staging/wlan-ng/p80211ioctl.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* p80211ioctl.h
+/*
  *
  * Declares constants and types for the p80211 ioctls
  *
diff --git a/drivers/staging/wlan-ng/p80211mgmt.h b/drivers/staging/wlan-ng/p80211mgmt.h
index 1457a6def5a2..1ef30d3f3159 100644
--- a/drivers/staging/wlan-ng/p80211mgmt.h
+++ b/drivers/staging/wlan-ng/p80211mgmt.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* p80211mgmt.h
+/*
  *
  * Macros, types, and functions to handle 802.11 mgmt frames
  *
diff --git a/drivers/staging/wlan-ng/p80211msg.h b/drivers/staging/wlan-ng/p80211msg.h
index 114066526df4..f68d8b7d5ad8 100644
--- a/drivers/staging/wlan-ng/p80211msg.h
+++ b/drivers/staging/wlan-ng/p80211msg.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* p80211msg.h
+/*
  *
  * Macros, constants, types, and funcs for req and ind messages
  *
diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index 0905602ef8ff..2233f75854bd 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1)
-/* src/p80211/p80211knetdev.c
+/*
  *
  * Linux Kernel net device interface
  *
diff --git a/drivers/staging/wlan-ng/p80211netdev.h b/drivers/staging/wlan-ng/p80211netdev.h
index 25e5116b1590..5654dc54ae91 100644
--- a/drivers/staging/wlan-ng/p80211netdev.h
+++ b/drivers/staging/wlan-ng/p80211netdev.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* p80211netdev.h
+/*
  *
  * WLAN net device structure and functions
  *
diff --git a/drivers/staging/wlan-ng/p80211req.c b/drivers/staging/wlan-ng/p80211req.c
index 9f5c1267d829..809cf3d480e9 100644
--- a/drivers/staging/wlan-ng/p80211req.c
+++ b/drivers/staging/wlan-ng/p80211req.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1)
-/* src/p80211/p80211req.c
+/*
  *
  * Request/Indication/MacMgmt interface handling functions
  *
diff --git a/drivers/staging/wlan-ng/p80211req.h b/drivers/staging/wlan-ng/p80211req.h
index c04053f3b02b..bc45cd5f91e4 100644
--- a/drivers/staging/wlan-ng/p80211req.h
+++ b/drivers/staging/wlan-ng/p80211req.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* p80211req.h
+/*
  *
  * Request handling functions
  *
diff --git a/drivers/staging/wlan-ng/p80211types.h b/drivers/staging/wlan-ng/p80211types.h
index 3dcdd022da61..6486612a8f31 100644
--- a/drivers/staging/wlan-ng/p80211types.h
+++ b/drivers/staging/wlan-ng/p80211types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
 /*
- * p80211types.h
+ *
  *
  * Macros, constants, types, and funcs for p80211 data types
  *
diff --git a/drivers/staging/wlan-ng/p80211wep.c b/drivers/staging/wlan-ng/p80211wep.c
index 51d917c8cdc8..3ff7ee7011df 100644
--- a/drivers/staging/wlan-ng/p80211wep.c
+++ b/drivers/staging/wlan-ng/p80211wep.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1)
-/* src/p80211/p80211wep.c
+/*
  *
  * WEP encode/decode for P80211.
  *
diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
index 1bd36dc2b7ff..9030a8939a9b 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.c
+++ b/drivers/staging/wlan-ng/prism2mgmt.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1)
-/* src/prism2/driver/prism2mgmt.c
+/*
  *
  * Management request handler functions.
  *
diff --git a/drivers/staging/wlan-ng/prism2mgmt.h b/drivers/staging/wlan-ng/prism2mgmt.h
index 17bc1ee0d498..7132cec2d7eb 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.h
+++ b/drivers/staging/wlan-ng/prism2mgmt.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1) */
-/* prism2mgmt.h
+/*
  *
  * Declares the mgmt command handler functions
  *
diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
index d14f032a7ed6..24ba10d6bd0b 100644
--- a/drivers/staging/wlan-ng/prism2mib.c
+++ b/drivers/staging/wlan-ng/prism2mib.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1)
-/* src/prism2/driver/prism2mib.c
+/*
  *
  * Management request for mibset/mibget
  *
diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index f67b7405156a..1be43300052f 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MPL-1.1)
-/* src/prism2/driver/prism2sta.c
+/*
  *
  * Implements the station functionality for prism2
  *
-- 
2.30.2

