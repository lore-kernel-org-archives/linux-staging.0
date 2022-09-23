Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3113D90
	for <linux-staging@lists.linux.dev>; Fri, 23 Sep 2022 14:53:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id d12-20020a05600c3acc00b003b4c12e47f3so158584wms.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Sep 2022 07:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=0JvMaISz8Od+papj3wCFtSPBS7NF6QrC85869jRmULg=;
        b=boNZMICuW2VTNI6HNGkALOZd4Et36tWDeY6Kx1DDTM/pnzyGIu+FlG9IkbcbWiF1Dz
         ka2QZSSsRPlFZrZXYsfyKiNByHQ6yl5yt0O1f0eEQ/7T9lENxGIrvWGuCrIcLvwP07pI
         T3opwsLdS4JtJ+ZDv3LYwOvdm0ik4AgG204T0PJXQWfMv1KSiFk1A6Hcz5q0P1BKkFl6
         IDScUbnnUMPItsHG7p5o8E/IoE95/4o19/6Q/71WdytqzVqEdGdG/UxVxisymM3x61p0
         gQCgSIvPdcAv+csPob44wk+qxzrzvucSvr4SHP7zInR4XqQHyH4MfyXYs1o3ln4aWLwX
         RXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=0JvMaISz8Od+papj3wCFtSPBS7NF6QrC85869jRmULg=;
        b=6LmYi/+rUQeuT67ZvGM1/pS28s0J7B5bPv74t0Wu4XUX95vIoVdMq1kcsA+riwMJtG
         f5N80hGKLEcmqtO9LqbyVLZ4m8tIieiDxB7zNQJXHKcdiNNHfXe78qMLVXtdhRwahbz2
         yyZqrMt5x8MsjJxT6pWQa+P9Xi2PiOIB0xQhIuQhYI63+1hNCBNonRAaJ3fMaTxuF2+l
         sKLv68N6DbkZqmDpNuwmxel1HB4HGMVI5Pdtag50b+etM6RG83X3pFa0KI9nf7HNB/cA
         3XARbGgr2rmAdC8TzSnbWWtIJsnsEFI6sQI47VUN7q7iDabdJMSQYHIUCvjZHrYDJaP7
         aptQ==
X-Gm-Message-State: ACrzQf2L1Ic95ZWv0uqGNMmh32FyGwpW3yIwqtsnwbCWQatpg/VIgEIw
	HtARexOnHRxdobf2/iKRJgoB0VVHNhNLSOivTSlGG5QkQaPLzw==
X-Google-Smtp-Source: AMsMyM7XTubnLOQ5gJrrVKxtaxqo7JeSRlz//q5yBA9GMpWjeLkYdNtlsuIymvHAwLW0Kh5z3zhLb9cVfvuMimk5nd4=
X-Received: by 2002:a05:600c:1c1f:b0:3b4:8330:5a46 with SMTP id
 j31-20020a05600c1c1f00b003b483305a46mr13237731wms.45.1663944818485; Fri, 23
 Sep 2022 07:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Hao Peng <flyingpenghao@gmail.com>
Date: Fri, 23 Sep 2022 22:53:27 +0800
Message-ID: <CAPm50a+XqKGBEQC-8iS_3amnphL4LVcOYhBeHqaC_P+Ld_ddhg@mail.gmail.com>
Subject: [PATCH] clocking-wizard: fix a schedule during spin lock acquisition
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

From: Peng Hao <flyingpeng@tencent.com>

when the interrupt is disabled and the spin lock is acquired,
calling read_poll_timeout will trigger the schedule, which should
be replaced by read_poll_timeout_atomic.

Signed-off-by: Peng Hao <flyingpeng@tencent.com>
---
 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
index 39367712ef54..986af03b31c9 100644
--- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
+++ b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
@@ -157,7 +157,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw
*hw, unsigned long rate,
        writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);

        /* Check status register */
-       err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+       err = readl_poll_timeout_atomic(divider->base +
WZRD_DR_STATUS_REG_OFFSET,
                                       value, value & WZRD_DR_LOCK_BIT_MASK,
                                       WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
        if (err)
@@ -168,7 +168,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw
*hw, unsigned long rate,
               divider->base + WZRD_DR_INIT_REG_OFFSET);

        /* Check status register */
-       err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+       err = readl_poll_timeout_atomic(divider->base +
WZRD_DR_STATUS_REG_OFFSET,
                                       value, value & WZRD_DR_LOCK_BIT_MASK,
                                       WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
 err_reconfig:
--
2.27.0
