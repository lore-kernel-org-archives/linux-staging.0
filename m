Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB0BE6D
	for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 10:07:00 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-643ac91c51fso6087519b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683886020; x=1686478020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bem8jDoswsIx3LqKUeWVXu4IOKeZhVI23DjbNiD86cQ=;
        b=Lhcg+tsBS0zcH6bPFXMc7vXKGo0Adx4cYbOJbHWuzEJzwS15HeLps1wI3OrhTUWaJx
         SmKHaWIaizGmM5lwXznkTZb4DMX+AFgJHJ02THSMfRCh+CYxfwncT5qXEpkn/dd7SYkm
         NfaHwSDSjQ9ECQnUZJyqswLI6xNVyydOjlALuX7Mm8O8AL8fQN56FqYIbGf/bN4AIBBX
         CMU245xlISEzD6Z3ksQ8Zn++WTcGC7NL2EFKjSs+JRtCMh96AjKt+31yxKc4RPjl/we9
         YQlqcssAXeZS+YVuLzvzeZca+npyUHkZyjTU8EuUngo+otTY7Y0zx5aJA6eCLRJaP7oP
         BhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683886020; x=1686478020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bem8jDoswsIx3LqKUeWVXu4IOKeZhVI23DjbNiD86cQ=;
        b=LS5erxxs0I2XA1u1PoVeM4caq3H01YAyg1XbAho238W77O6EeYcsP+E+5d5QaysZxG
         gJ8Jh9Ec8VAeROCTNWuf8KVgB7ByaDex7Ld1KIBU0sgQbBC4ZwzgvsVJe2xeT/73iE3t
         5PwW/SSVgeXG+t00CWIKkFSYJDERPbEuGhahn4x+ETXbtQIv+UNQocNgVtZHVjyWdkql
         k0Yp1gmGZWLD7/ZHNfBxNmOJLyjOovEZIYUXtuUxNXRwVTyf7l9ZKGK4nhIhU/LcOZ9X
         qvRV8Qp8pv5uveUnnPU9vnL+t+evvxDe40TvcXeX6hcJXwnUF/JZ+Kh2TxoNa8gLtV49
         J/CQ==
X-Gm-Message-State: AC+VfDyIDrSujP7sv6fLIstu4qocP9AHjXS+5+LRQVSrQndg7w0kl6SN
	gc3mds6AFxB7bkIlLWl3Fwk=
X-Google-Smtp-Source: ACHHUZ6WGSKAIfGxAnEVHEzQApp2UgiCiA76V06pwKR3ytoEGn1X1r2QTpMagYcS63H7lNElT9sucw==
X-Received: by 2002:a05:6a20:7f83:b0:100:5ddc:c6a1 with SMTP id d3-20020a056a207f8300b001005ddcc6a1mr21528686pzj.15.1683886020037;
        Fri, 12 May 2023 03:07:00 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
        by smtp.gmail.com with ESMTPSA id k25-20020a63ba19000000b0050f93a3586fsm6141727pgf.37.2023.05.12.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 03:06:59 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id D9764101B84; Fri, 12 May 2023 17:06:54 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
	Linux Kernel Actions <linux-actions@lists.infradead.org>
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Kate Stewart <kstewart@linuxfoundation.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Airlie <airlied@redhat.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sam Creasey <sammy@sammy.net>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jan Kara <jack@suse.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Andreas Eversberg <jolly@eversberg.eu>,
	Karsten Keil <keil@isdn4linux.de>,
	Simon Horman <simon.horman@corigine.com>
Subject: [PATCH v2 02/10] mISDN: Replace GPL notice boilerplate with SPDX identifier
Date: Fri, 12 May 2023 17:06:13 +0700
Message-Id: <20230512100620.36807-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4211; i=bagasdotme@gmail.com; h=from:subject; bh=gDeWnuEEVweZ2+OADiOaGpHECUxDBZJJ7rTKBKg4aRc=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/NO7GIO2pwcIC1w4HXP6zJekhh8+eQ9ZNy61FHr4m efuNjmrjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExkbQcjwwqBz+uOHGlcvIf3 7uwffQ2H2zMfP5ZTUljb/XQ9z7MfUToM/xTvuqkbtJs+lxT6qKPze4aK35n5ypZCRm0toXd8Xh+ +zAAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Replace unversioned GPL notice boilerplate on dsp_* with SPDX identifier
for GPL 1.0+. These files missed previous SPDX conversion batches
due to not specifying GPL version.

Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Andreas Eversberg <jolly@eversberg.eu>
Cc: Karsten Keil <keil@isdn4linux.de>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/isdn/mISDN/dsp_audio.c    | 4 +---
 drivers/isdn/mISDN/dsp_blowfish.c | 4 +---
 drivers/isdn/mISDN/dsp_cmx.c      | 4 +---
 drivers/isdn/mISDN/dsp_core.c     | 3 +--
 drivers/isdn/mISDN/dsp_dtmf.c     | 4 +---
 drivers/isdn/mISDN/dsp_tones.c    | 4 +---
 6 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/isdn/mISDN/dsp_audio.c b/drivers/isdn/mISDN/dsp_audio.c
index bbef98e7a16efb..df86c0ce9cd8d1 100644
--- a/drivers/isdn/mISDN/dsp_audio.c
+++ b/drivers/isdn/mISDN/dsp_audio.c
@@ -1,12 +1,10 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Audio support data for mISDN_dsp.
  *
  * Copyright 2002/2003 by Andreas Eversberg (jolly@eversberg.eu)
  * Rewritten by Peter
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 #include <linux/delay.h>
diff --git a/drivers/isdn/mISDN/dsp_blowfish.c b/drivers/isdn/mISDN/dsp_blowfish.c
index 0aa572f3858da7..e161c092012653 100644
--- a/drivers/isdn/mISDN/dsp_blowfish.c
+++ b/drivers/isdn/mISDN/dsp_blowfish.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Blowfish encryption/decryption for mISDN_dsp.
  *
  * Copyright Andreas Eversberg (jolly@eversberg.eu)
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 #include <linux/mISDNif.h>
diff --git a/drivers/isdn/mISDN/dsp_cmx.c b/drivers/isdn/mISDN/dsp_cmx.c
index 357b87592eb48c..c2b24fdf234523 100644
--- a/drivers/isdn/mISDN/dsp_cmx.c
+++ b/drivers/isdn/mISDN/dsp_cmx.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Audio crossconnecting/conferrencing (hardware level).
  *
  * Copyright 2002 by Andreas Eversberg (jolly@eversberg.eu)
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 /*
diff --git a/drivers/isdn/mISDN/dsp_core.c b/drivers/isdn/mISDN/dsp_core.c
index 386084530c2f85..b9ec8489e690a0 100644
--- a/drivers/isdn/mISDN/dsp_core.c
+++ b/drivers/isdn/mISDN/dsp_core.c
@@ -1,10 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Author       Andreas Eversberg (jolly@eversberg.eu)
  * Based on source code structure by
  *		Karsten Keil (keil@isdn4linux.de)
  *
- *		This file is (c) under GNU PUBLIC LICENSE
- *
  * Thanks to    Karsten Keil (great drivers)
  *              Cologne Chip (great chips)
  *
diff --git a/drivers/isdn/mISDN/dsp_dtmf.c b/drivers/isdn/mISDN/dsp_dtmf.c
index 642f30be5ce249..746c210a6d2495 100644
--- a/drivers/isdn/mISDN/dsp_dtmf.c
+++ b/drivers/isdn/mISDN/dsp_dtmf.c
@@ -1,12 +1,10 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * DTMF decoder.
  *
  * Copyright            by Andreas Eversberg (jolly@eversberg.eu)
  *			based on different decoders such as ISDN4Linux
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 #include <linux/mISDNif.h>
diff --git a/drivers/isdn/mISDN/dsp_tones.c b/drivers/isdn/mISDN/dsp_tones.c
index 8389e2105cdcf6..16a47cc910c585 100644
--- a/drivers/isdn/mISDN/dsp_tones.c
+++ b/drivers/isdn/mISDN/dsp_tones.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Audio support data for ISDN4Linux.
  *
  * Copyright Andreas Eversberg (jolly@eversberg.eu)
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 #include <linux/gfp.h>
-- 
An old man doll... just what I always wanted! - Clara

