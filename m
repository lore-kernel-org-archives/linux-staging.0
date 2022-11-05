Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C9D1FA6
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 10:00:41 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso10305825pjg.5
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WNb21Jb0qdnUTEVIzTSpsX7MkahQuwX4NfPZNy1VsM=;
        b=coUxiydd73lN9DqlJUDE3bnZQi0s8Zji7APuZcY2TlMjEgZ9kyKnxhmtgbI4TavDas
         OEwzfKyNa+pA/zFyp0BdnM/FudzJ1T/3I/klUwyLbkkRwJN/P6PzQOtNQoOI3OwUX/TZ
         rJXixGmeuy95VgYGi/+RzPsxpJECl7MBF/G304pbLfNEOYdIoZbEwJASYSxaJ+gTF38/
         pr4wUpC+S8D9YlvoEcfT5Q4dLmpU91KYWSaA/FqTa5DejQPmzEuSrH9MXmQ31YbmISPO
         v9MQGG/In+b2WGyTCt4B7/OIRQMlFwQYYkkfod0HvrrRa+1z5316cFjJ9PkjJ/5AW5Qa
         GEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WNb21Jb0qdnUTEVIzTSpsX7MkahQuwX4NfPZNy1VsM=;
        b=m+TZ0HranVTREWmYSAgLPmsEy6ivaiBR5mo3CRmw9vzDmgxsh8bN1gdconubmjNf90
         UJ6nHLlphhqbx7ain4vcMNmvh0S7Gz4zqQqUTEJ5OSE8B0lyKq5ZQVKMaNqEunVyu8V8
         M5YL2WavpmJvU4zyzffBs08a/cRnN8v3Fb4M0jUBP7vNtXr8DHtYxDsH0UdpiyeIeJj0
         KzQcmlbaHrVWWAAsGtKkdr+Pf+D6Ksz4j58PA6UfeohB4wDeqFLkJNBbH7sOTyZCGyJF
         aMUm0bKa4LFcdR6Skii3c3QBz29dNym7NS9dI1vUUhn8DPFEe8Z0CESoZ9v58GMuOgAu
         BbHw==
X-Gm-Message-State: ACrzQf3plxS/nhty78Uv4FwRpepz+w/siL8su9v5s01xkdOwMl5iSbr4
	Xt/SHKewu4RzaZWNpaxz0I0=
X-Google-Smtp-Source: AMsMyM6++hDGURvzzjN23uo1p8EaaFyn2W3q4gExU1BiJuxMzSVb+CVn7CYaUuWq2F+4/tX9gLVvGg==
X-Received: by 2002:a17:902:a606:b0:178:57e4:a0c1 with SMTP id u6-20020a170902a60600b0017857e4a0c1mr39760979plq.83.1667642441220;
        Sat, 05 Nov 2022 03:00:41 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id ij22-20020a170902ab5600b0017f36638010sm1261363plb.276.2022.11.05.03.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 03:00:40 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Bai <jacob.bai.au@gmail.com>
Subject: [PATCH 2/3] staging: rtl8192e: rename r8192E_hwimg.c/h to table.c/h
Date: Sat,  5 Nov 2022 21:00:29 +1100
Message-Id: <b3f6522959e665f4194764caed30050d7b728b29.1667641211.git.jacob.bai.au@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667641211.git.jacob.bai.au@gmail.com>
References: <cover.1667641211.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same as other rtlwifi frivers, use table.c/h.

Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/Makefile                    | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c                | 2 +-
 drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} | 2 +-
 drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.h => table.h} | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} (99%)
 rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.h => table.h} (94%)

diff --git a/drivers/staging/rtl8192e/rtl8192e/Makefile b/drivers/staging/rtl8192e/rtl8192e/Makefile
index 75e6ec510555..334d92efd4ba 100644
--- a/drivers/staging/rtl8192e/rtl8192e/Makefile
+++ b/drivers/staging/rtl8192e/rtl8192e/Makefile
@@ -4,7 +4,7 @@ r8192e_pci-objs :=		\
 	r8192E_phy.o		\
 	r8192E_firmware.o	\
 	r8192E_cmdpkt.o		\
-	r8192E_hwimg.o		\
+	table.o		\
 	r8190P_rtl8256.o	\
 	rtl_cam.o		\
 	rtl_core.o		\
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 58da2dab55bd..eabb4187d907 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -12,7 +12,7 @@
 #include "r8192E_phy.h"
 #include "rtl_dm.h"
 
-#include "r8192E_hwimg.h"
+#include "table.h"
 
 static u32 RF_CHANNEL_TABLE_ZEBRA[] = {
 	0,
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c b/drivers/staging/rtl8192e/rtl8192e/table.c
similarity index 99%
rename from drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
rename to drivers/staging/rtl8192e/rtl8192e/table.c
index 8920283f340e..2e75f40db874 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -4,7 +4,7 @@
  *
  * Contact Information: wlanfae <wlanfae@realtek.com>
  */
-#include "r8192E_hwimg.h"
+#include "table.h"
 
 u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN] = {0x0,};
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h b/drivers/staging/rtl8192e/rtl8192e/table.h
similarity index 94%
rename from drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
rename to drivers/staging/rtl8192e/rtl8192e/table.h
index a436c089a779..a80176c47127 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -4,8 +4,8 @@
  *
  * Contact Information: wlanfae <wlanfae@realtek.com>
  */
-#ifndef __INC_HAL8192PciE_FW_IMG_H
-#define __INC_HAL8192PciE_FW_IMG_H
+#ifndef __RTL8192E_TABLE__H_
+#define __RTL8192E_TABLE__H_
 
 /*Created on  2008/11/18,  3: 7*/
 
-- 
2.34.1

