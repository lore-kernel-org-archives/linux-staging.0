Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99FF1389
	for <linux-staging@lists.linux.dev>; Sat,  2 Jul 2022 06:46:59 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id ay16so7598962ejb.6
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 23:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B2xZCau6Evf2BZjNgWltZHP5fbMXtXjkrl0nc2J1mak=;
        b=ppW6cHv+XOlCHWw1HLiFTNDsOimxS/UCYqHFM50VvMLjK/a2io7J8vN3pT/fYNltWq
         UmOEvCatvk2vrgAsGRS93UpnZHJzg9HRscha/tA5xGWY26njJy9mgYYJH+zgvdSdgTaq
         rVWBNv8vqx5kJUqTNcp5TjiVwMMMkN1YbF1zRJRpDbsmgfbnTaJjbq7BMALbRiMB3O9n
         jM49ftEBz80MFgZ0yMMb3uP8USOQ58ZMEtiIPU5eZacDW27nU4xbrnWTDtyGZIa5gGWT
         M3UzfZgsIar1ApvncT3og4JWT8n6G6E4fZsJP8mhej02W0ZamAwOUJfZgFrwh6MlNx+l
         xNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B2xZCau6Evf2BZjNgWltZHP5fbMXtXjkrl0nc2J1mak=;
        b=E9W6YgANzAXedJyA7f9Z/o6B5nHVlKpMXiKgNLWG+MR12vlrrZwzFhwdWWW0hOxUhb
         ojRrJzBxjawCLhVphGFdSGtdEskMrhoiWnNUybnMVCXDorHihF7fa1A9JBCqZkRIjODi
         cZGELx0Zg21MCMrGmLh+shh62Zs1Nz6qaE0XogfZKLaDLiTwP3BRJcVtkLobb4Efjs/H
         QXF1m/EfG923RfO04PxoP2jIYAxk6KU145/UveynhFohpM8K9NeoZL8Jv55DK3NNkpHb
         KWc3iS5Afx9SAmQx/N9U5WDRNwGwOdVADHDAFM3e/TN4RIROI6cDZ38kLn1BhLZMyHdC
         ei9w==
X-Gm-Message-State: AJIora+3HwCHRuh0NzMgKaA8LKQMF5dYBgf+OfuU4i0bEIfCv2oWuder
	5gw9jHPlX06eUpst2TqtDrKtBZx5kok=
X-Google-Smtp-Source: AGRyM1sxHzfBYCvE6k+BhyRNBjhMwMik3lBZyOA/igDKEpcTniCHFaK9TNbdl/nxMSBbb+k5TFfrZg==
X-Received: by 2002:a17:906:5053:b0:70d:a0cc:b3fd with SMTP id e19-20020a170906505300b0070da0ccb3fdmr18054178ejk.162.1656744418267;
        Fri, 01 Jul 2022 23:46:58 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba7.dynamic.kabel-deutschland.de. [95.90.187.167])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906538100b0072a55ebbc77sm3335811ejo.66.2022.07.01.23.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 23:46:57 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: make ffaddr2pipehdl() static
Date: Sat,  2 Jul 2022 08:46:26 +0200
Message-Id: <20220702064626.27506-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function ffaddr2pipehdl() is only used in usb_ops_linux.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/usb_ops_linux.h | 2 --
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c  | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
index 641f059ffaf7..966688eedf66 100644
--- a/drivers/staging/r8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/r8188eu/include/usb_ops_linux.h
@@ -26,6 +26,4 @@
 #define usb_read_interrupt_complete(purb, regs)		\
 	usb_read_interrupt_complete(purb)
 
-unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr);
-
 #endif
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 0269e602b217..220e592b757c 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -7,7 +7,7 @@
 #include "../include/usb_ops_linux.h"
 #include "../include/rtl8188e_recv.h"
 
-unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
+static unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
 {
 	unsigned int pipe = 0, ep_num = 0;
 	struct usb_device *pusbd = pdvobj->pusbdev;
-- 
2.36.1

