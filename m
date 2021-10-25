Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A362A2C8B
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 09:42:44 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e4so11714128wrc.7
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 02:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+Z8QswGGJCsabXMOKG3gspjqoJwtDOj3+Y1Gg6rw6Y=;
        b=lLF1XIy2gmou/0F1aDarf8kjlh2Px35n4OPUF7YcQlSOB/2ng0lyIjn+BHoMz4D4DJ
         DZIKaAoTVpa4wgBuFyPvqGFfcpmEwdHURFnHw4pN/PREL5oTdxWk2VUiX+0GVkD6HQap
         tb0A2eowUDibIma66W8GTRFgq+ULsfeWokOPBPbKv5hY19AlwkypUF95olC/woVqQ0as
         zIkSf/gfSEJ/fd2sTBKRPKFJNpYUIa3+jU+a+Eb10ly/JzYdq6DX4KKEKLK0MSZcNTky
         cj1HdclncvAlHu+PR/3ki+B3datcNcR0QePTj10b8JmYk9epo3/fNrFGa4Vkc08te+yr
         mByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+Z8QswGGJCsabXMOKG3gspjqoJwtDOj3+Y1Gg6rw6Y=;
        b=Alrekd/A75uHwewIbV0yyIJKjHpGIYEycGLFGMN9I0BYwptxM4NJHRsH7BX0h5ONph
         l07Qs9qlL6+FFylKNiJxubZcVitHEY/hIYTtJOxGOjhfB7WQ91BHk+cPQGgonHm8LGzP
         KTNYjVS6fgzakBXbZEzJ3pIogDZz3mjSxjIVts8LvVD9t5XSky9ys8bixZlj5XgYeIje
         zbELD/WAZTXarUwOOk8kmU+8bsc9lBsege/34gk4T/0VeZ8c+/9hrLAgOKphYGcB44TA
         6DFREin6e009dHdDPd4CQqQv66z+tHn3wdI+aRmvCejYsP3S7X3neNdapJf/4WNLWFCk
         8MQw==
X-Gm-Message-State: AOAM5334yFNVGhWRz9LtmY/PViduOrSFiABrH/0yxJYm4yX0i+hTy6D0
	r555LjiofzLNYC1vbCyI7ifjLw2dykc=
X-Google-Smtp-Source: ABdhPJxOr8pHAApwutsjJ2JW1f/swEREiBYyC5FkqOPJ7PbUglnn/vWvQ1NRMfXK4gbwCNlqobpLWg==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr22751832wri.62.1635154962676;
        Mon, 25 Oct 2021 02:42:42 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id g14sm1939469wro.12.2021.10.25.02.42.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Oct 2021 02:42:42 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH] staging: mt7621-dts: add missing SPDX license to files
Date: Mon, 25 Oct 2021 11:42:40 +0200
Message-Id: <20211025094240.4356-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device tree files included here haven't got SPDX license header at all.
Hence, add it to all of them.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/gbpc1.dts   | 1 +
 drivers/staging/mt7621-dts/gbpc2.dts   | 1 +
 drivers/staging/mt7621-dts/mt7621.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index 36e1e507f241..e38a083811e5 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /dts-v1/;
 
 #include "mt7621.dtsi"
diff --git a/drivers/staging/mt7621-dts/gbpc2.dts b/drivers/staging/mt7621-dts/gbpc2.dts
index 52760e7351f6..6fe603c7711d 100644
--- a/drivers/staging/mt7621-dts/gbpc2.dts
+++ b/drivers/staging/mt7621-dts/gbpc2.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /dts-v1/;
 
 #include "gbpc1.dts"
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index f5c0df78fa6b..6d158e4f4b8c 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/mt7621-clk.h>
-- 
2.33.0

