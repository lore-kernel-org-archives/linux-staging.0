Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D879C5
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 18:55:46 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so1583067a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687719346; x=1690311346;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+KezNnGcb3cxAVG4ZYOxPdXLpxML8OUkwIxVcdPDfCc=;
        b=GFbnr+PTf0Y0M2eichqIUCZzASI7tJUMkTdnjhJaO73A6sCajSAzUm21FyKKnABpGn
         wT2xhQcHKwpU6RrPltxsu1HvqxveAkCNpfMbEgzlD5bjeUcgSpWRnelD171KHMqlHg7k
         HLXs2l4INTaYguk2z3M5sHpukAPGi/LgVvvcCEQvzJYPNsPGTbPVUYKJJ1n1QvniFI9B
         E413LL+p/kXJ8KM1KarAQh6n7y82TP4GTnJ40O4u/+GBOFJeedKCP1PDU7u3mjKSxDI1
         /gkboUugt+pw1qbkDDWrvm5y9XvAvqAJChaOXkYPH7xVR3ES1r/a9KQZ/JJXoDCk/1CM
         QCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687719346; x=1690311346;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KezNnGcb3cxAVG4ZYOxPdXLpxML8OUkwIxVcdPDfCc=;
        b=B0ocHGwck4Wgkp3B1AkCw/GRIyVo8heFCU3l0HFCqADuZN5JGOFwJ3+tmubozhEz8e
         UB5zNoD6kxisTRqTZdkqOFo/mfmleyprkSKYzbeiBsOtbiIx7XwLaW7X2b2PigNLYGvE
         q/s13U/kWdnhcwRrElt/KDOhg+tHPxRwOXBT/hI4CZTDXNlkS1FxsA3WD5WoQKy1dRis
         h0IeSN/dllcQ0uquIpOBuxmp2bVZEJGu8tPqVRsUUbeWzsUEa2DFsI/hUx4pVxjgYqmC
         8UheLhzZ96miduoYAxHtx/Lskn3c4W0U6knXKb/wpWsgjGZ2vGKU8zRrIQfhXx46yBml
         g7/Q==
X-Gm-Message-State: AC+VfDxJasDlW8/CYAKftvPsQwD/sb94OBI4b5nBG96EGYoxmrPH6omJ
	uHD4InxSSzkJBeesJ9ZL4/of/smz9rS1DmBHgfU=
X-Google-Smtp-Source: ACHHUZ64Zw+TZlko0Fyfe6ge9vjTWpBbW1JIvzPDMFlZfbIGVF3vx+whH886yalrOd5uQIs7Ne45Mxe/dahqlQqGGZ0=
X-Received: by 2002:a17:90b:113:b0:262:ec04:4ff7 with SMTP id
 p19-20020a17090b011300b00262ec044ff7mr1916194pjz.16.1687719346213; Sun, 25
 Jun 2023 11:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Uros Milojkovic <uroshm@gmail.com>
Date: Sun, 25 Jun 2023 14:55:35 -0400
Message-ID: <CAP=xWk6GvVQxzTJ6jS2pQ9dKvgoFFHc=m4yMma101MGKgdcm5A@mail.gmail.com>
Subject: [PATCH] staging: nvec: udelay to usleep_range
To: linux-kernel@vger.kernel.org, marvin24@gmx.de, p.zabel@pengutronix.de, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Checkpatch pl alerts that usleep_range is preferred to udelay. The
change is made.
Signed-off-by: umilojkovic <uroshm@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 2823cacde130..8bb3b691d1f5 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -627,7 +627,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
         break;
     case 2:        /* first byte after command */
         if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-            udelay(33);
+            usleep_range(33, 200);
             if (nvec->rx->data[0] != 0x01) {
                 dev_err(nvec->dev,
                     "Read without prior read command\n");
@@ -714,7 +714,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
      * We experience less incomplete messages with this delay than without
      * it, but we don't know why. Help is appreciated.
      */
-    udelay(100);
+    usleep_range(100, 200);

     return IRQ_HANDLED;
 }
-- 
2.34.1
