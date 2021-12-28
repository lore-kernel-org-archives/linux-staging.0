Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DFD2C80
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 12:18:11 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id v14so14111432uau.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 04:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=H2CQhpPOQPYC1wlhLfeQOOWTvZaobOuRChyTPvYY3O4=;
        b=cC0kZr6Dq4GU72EW/pAvA6w8GKOV0+qKP6DkeWrHQO2auE5RcMaoGOPYKveZJkskSS
         aju9WwQWU9IROnLiXmKGmAAEFi+xT6tukAtJN01Xji6tcKg0ByMyoqncUK9rpbWB5sYa
         hTvXHrYqqELR/kSPRPeQSIigFJpa9Q1VTPDDKOrsOCtVCxKiGnU4+ktQCWrB/rzkWCoz
         85x3TgKCUIP4ZOYzTHPvVq3HzSL1mOqWqt3Md6WfiOYTkbuc07LJtiHvA7r4ErLfbJN/
         ZKrKz+mcKAg1iVaEKdAHpBtM9zTlIEo2OKILvfeSLDoGOAQk/Dq/mRhgUx8MFhTaOSgb
         1wBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=H2CQhpPOQPYC1wlhLfeQOOWTvZaobOuRChyTPvYY3O4=;
        b=acXf5m6c411HEwtM2EuEMQqbKugTgMoAY/4sHEXCc9n7+ea7ZpeaaiDkIfOd2tW2n0
         TuYRJI2nn4CevpFIB6mtlgmy0xPmKsYNUU2kt7VXu0S+D6OtHmGRRd3YGpzoU54WY8Z+
         K79XZ0zlnj7XtJ02C1pY3TeRUdAgDvELaCpuuvqr9bM2Xz8OBew9G8mb7tk1tPCleXH3
         uk2EgbsInFJnVA5xb6zHOiVI19RYc7EVt4ASTgrSMZC6P5Vzoi7znxbcoCjVJA2WBuSi
         0TXuMzUvgba9rGv9Ka/brY/BxJ11YOgT2lxpphKcZhhRZDZn03kX3gP2wKfxnH5zTvGj
         LJvg==
X-Gm-Message-State: AOAM533FeI/UDV0H+wPv8jKmbKJzXtoM4kuNkGhUtdOYDQRYIXg9+3zZ
	flw+urCUB9KoIMwgrp940q91JgsFWk1VRcXzL8Lv9NL554fG4RMC
X-Google-Smtp-Source: ABdhPJyLKC3y+c21YtpltzAxvPzD6Wa4/dv8sa65ooaxLngQSasyHdTiFR7ncldqyDz+0f6bE4akqcjkTY5zV7wqC5U=
X-Received: by 2002:ab0:b93:: with SMTP id c19mr5815853uak.2.1640693890193;
 Tue, 28 Dec 2021 04:18:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Adam Kandur <sys.arch.adam@gmail.com>
Date: Tue, 28 Dec 2021 15:17:59 +0300
Message-ID: <CAE28pkP48Or4LhmuBd2CMamL3yZ1_ipjtEFWqXjuUunNU9bTSQ@mail.gmail.com>
Subject: [PATCH] qlge: refactor qlge_change_rx_buffers() in qlge_main.c
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Greetings. As I understand, qlge_change_rx_buffers() waits 4 times for
an outstanding reset to complete. And if it cannot, reports about
timeout. I assume this can be written using for loop instead of while,
wich looks nicer for me.

Signed-off-by: Adam Kandur <sys.arch.adam@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 9873bb2a9ee4..f36e43a85038 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4012,19 +4012,16 @@ static int qlge_change_rx_buffers(struct
qlge_adapter *qdev)

  /* Wait for an outstanding reset to complete. */
  if (!test_bit(QL_ADAPTER_UP, &qdev->flags)) {
- int i = 4;
-
- while (--i && !test_bit(QL_ADAPTER_UP, &qdev->flags)) {
+ for (int i = 4; !test_bit(QL_ADAPTER_UP, &qdev->flags); i--) {
+ if (!i) {
+ netif_err(qdev, ifup, qdev->ndev,
+   "Timed out waiting for adapter UP\n");
+ return -ETIMEDOUT;
+ }
  netif_err(qdev, ifup, qdev->ndev,
    "Waiting for adapter UP...\n");
  ssleep(1);
  }
-
- if (!i) {
- netif_err(qdev, ifup, qdev->ndev,
-   "Timed out waiting for adapter UP\n");
- return -ETIMEDOUT;
- }
  }

  status = qlge_adapter_down(qdev);
-- 
2.34.0
