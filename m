Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF48F57
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 06:07:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id r133-20020a1c448b000000b003b494ffc00bso4492420wma.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Sep 2022 23:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=n0EYQvhTkUzjEdN/96fjQL5aVVrTsaf1kCvfKxjgmPo=;
        b=H10t6USf+0YJYN9ngkz/3VJrPosZWQMJc3hykBmusEWyq+Bsftq/KKEqeIGGhKpmm/
         6LBdNrhZKRiX6bHizcv/5mfNcAjR/LQN67rbdRqNUA5ss5MoGrRSOb9td/wpvV+v1lsm
         /oXy0sPvaeZ/uEtpQU15uLFCg0B3ZPhmOeQc+KuMcRRP5RtUQ8FLo0PX6vI0WijgihxS
         LM2zhW0Kb/V1vBxFh4v4bEKZ8DgBTxn4BY6zOavDE0Z0RbQZqNcWE9GfdI50uIXZPgPp
         CN65bFRX3NXRCUzvHmJIcZ0VXiN8cmNMzzvjBdFFJGqJ0OLPyGHgqN0dx2NptJSlh76S
         FmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=n0EYQvhTkUzjEdN/96fjQL5aVVrTsaf1kCvfKxjgmPo=;
        b=iitB+Kb+7pm2hjvq/jhZ5WJggxX68sdUSu6mUSR7aR27IVOSot7GjWj2e2oZYJbEdD
         OkhcC15AgnkJSMbJ2+lQmAZQOYzbb9laFY2MzZl0arsVOvmfCOLc1U31iaBb6RwfRExj
         qUPgj5Ibr219WCrjrc3CfiMjTbmhGxPMkmF/5lGxcQNkhJeW+ulR7wAv2u/yM8PQNHhf
         BNqwIqwPZsLeJMHN2616BOPVp/suXkd/7PSJ6ObeWGcPN5M8JZUkrV4U4hQndectVLQD
         RZhYnYK7jAJAsaaB6OBDcbApqUhEgW4khuBA/XFM3ZdAXVRhvpXtY58QuDfmEb+vGAGh
         2Q8w==
X-Gm-Message-State: ACrzQf31+bSC1WiTjqXCuVa8I+Ob4qciQiPYJy5M/cRWhu3BgsYC651m
	bmwCGg9Geoy9Zn9CJ3UeNF6sagGx6mP3kayuC61QaFU6AlwS/w==
X-Google-Smtp-Source: AMsMyM7QUlOPu0JeWk3JlovK+KwXTPX3BExiRHZ5kfnZwQn4r5/JXI6bBBL+LTuo9HhpiUAp2lpDVUz1FW/3N/0hK2g=
X-Received: by 2002:a05:600c:1c1f:b0:3b4:8330:5a46 with SMTP id
 j31-20020a05600c1c1f00b003b483305a46mr15044854wms.45.1663999646331; Fri, 23
 Sep 2022 23:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Hao Peng <flyingpenghao@gmail.com>
Date: Sat, 24 Sep 2022 14:07:14 +0800
Message-ID: <CAPm50aK8RZHJ1AJzhrFmKWBWAVhkPjcnAv20gGgqEwuwEn054w@mail.gmail.com>
Subject: [PATCH v2] clocking-wizard: fix a schedule during spin lock acquisition
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Peng Hao <flyingpeng@tencent.com>

when the interrupt is disabled and the spin lock is acquired,
calling read_poll_timeout will trigger the schedule, which should
be replaced by read_poll_timeout_atomic.

Signed-off-by: Peng Hao <flyingpeng@tencent.com>
---
 .../staging/clocking-wizard/clk-xlnx-clock-wizard.c  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
index 39367712ef54..e36a97a57f2a 100644
--- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
+++ b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
@@ -157,9 +157,9 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw
*hw, unsigned long rate,
        writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);

        /* Check status register */
-       err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
-                                value, value & WZRD_DR_LOCK_BIT_MASK,
-                                WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+       err = readl_poll_timeout_atomic(divider->base +
WZRD_DR_STATUS_REG_OFFSET,
+                                       value, value & WZRD_DR_LOCK_BIT_MASK,
+                                       WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
        if (err)
                goto err_reconfig;

@@ -168,9 +168,9 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw
*hw, unsigned long rate,
               divider->base + WZRD_DR_INIT_REG_OFFSET);

        /* Check status register */
-       err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
-                                value, value & WZRD_DR_LOCK_BIT_MASK,
-                                WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+       err = readl_poll_timeout_atomic(divider->base +
WZRD_DR_STATUS_REG_OFFSET,
+                                       value, value & WZRD_DR_LOCK_BIT_MASK,
+                                       WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
 err_reconfig:
        if (divider->lock)
                spin_unlock_irqrestore(divider->lock, flags);
--
2.27.0
