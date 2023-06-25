Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254418468
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 18:51:25 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-262cc036fa4so251415a91.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 11:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687719085; x=1690311085;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wkyFiQL0LMLlm6vDNBXN0hDgyxcnkHbsK3MjPnzklOk=;
        b=W28doUtd2dlijy0QGV6h/6J3SOjezt65kQ5VmAV4+ARGvRKrhQOuSDOufCHqQO9fpK
         m+MBGfEudzDl4LEpVGcn1vJvnD19hVKHXcsirCRGin7OZlPx9Jx1tJHMNOy/tYwUNyie
         6gkSeEYW2OrvONoUWYuvzezOkemdytGv+O/klCUqY19V7bYECgM/0GXcU+7jDxXrktq+
         KSmNpJXzKm/3tXqufDLSrhIyP1j0iK4gtNUE2GYbLo3sev4jJl9h//hgNlfz/RLWjH9B
         hMkrYjJPtCuHk2jQCuuI23e/QWIEJyD8b2enbsOxTLazi/5h/f445gluaFjgFmHQKAR1
         Q1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687719085; x=1690311085;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkyFiQL0LMLlm6vDNBXN0hDgyxcnkHbsK3MjPnzklOk=;
        b=Gn0ETvsY4gaiDLl5gISnEDTVNn312vCEVeyeN1z26Eki4xb1lTaZE3bksMjkw+M2xV
         45/Jb2Rts1Hikpp8zU7HRpvYyi3o1MzlyKQ2WrXb0GWj+juAcHoGiJH07OhGVcbpmR1v
         u0zTj1Lynqdh/oftNYacUZhSXleK0mKYQqDtTc9VKnVKxT3/zJjLHFIQrQFYMXfwQS6E
         c76OHgmJ5MjXdT0XNKIQRFaVazrg5xnXi9zpYUczwHbiHLur23VgdJwMZdSYb09pdS17
         pQVl5twLFGlwqXAyfTokRusFOTqT69Gr2xVG/VBIQr2hVAFRnBZmZVjIGUDyoaCrEZKj
         KPjA==
X-Gm-Message-State: AC+VfDyA9cqnciPhywED+bP45ZuDfts7azM1LeMW9dgarayvSOtSiYOw
	vgDkX2avv6gy9XMx7T5eAMFwkaG3mH+J60Va3rI=
X-Google-Smtp-Source: ACHHUZ5pDGUQ1/TP44+VyU6tpJ5rYd3i7I3W0S8JTeBpxvCH04V63sAfyIBNewDVzh1nfY64NYD4glP1efsJtY8DllA=
X-Received: by 2002:a17:90a:fb52:b0:25b:b4c6:d13e with SMTP id
 iq18-20020a17090afb5200b0025bb4c6d13emr17872825pjb.8.1687719085091; Sun, 25
 Jun 2023 11:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Uros Milojkovic <uroshm@gmail.com>
Date: Sun, 25 Jun 2023 14:51:13 -0400
Message-ID: <CAP=xWk67n_5jOvj7mM3KmxiaMn9Gm908MUU=Nrq9Tv1ASw4M2Q@mail.gmail.com>
Subject: [PATCH] staging: nvec: udelay to usleep_range
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, ac100@lists.launchpad.net, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Checkpatch.pl alerted that usleep_range is preferred to udelay. This
change was made in nvec.c file.

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
