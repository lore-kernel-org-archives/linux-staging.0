Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACCD70
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 19:04:24 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso7081158wmq.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 12:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oTE2yvgvW8glea98LSY/ffZ1b6poaqIV5ugiE4I/bJE=;
        b=lNNGt2hJtFLKaKfbRjcNF8QqPU6aHLbcEsKqIcUgkcBGaXt7+2Gc3JP83833YrWOIv
         7jlaYW6QhcblMUqhSdwb6y+Myp+VyNclNkEOqYgO2WYj/LLZvzv79PPIfufk5L6ZVNnS
         MSdFq1BZ3wz0ebR5WbqMUEcNA4+zP/6OV7D3dSQtXmcb6K5WlGGX0qpHJLHJX3N7sQOX
         gIJt3pV2aV/+tmX7rD0tIWBiz/gSxp/mANKC65ED/b/DurNYsao+j0pGMqqf1/n1sZY/
         Z4fa5X+QBDUhRVtgcpPrIjj2Aia7Q6ubvHXo36kvFKm+El3DLIOoGtnqcR3WsK3Mopk1
         2uvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oTE2yvgvW8glea98LSY/ffZ1b6poaqIV5ugiE4I/bJE=;
        b=sNrgNJXyFtCq4nOIccx0T47fS1NVY956zNJg0HiLBMIF2mT0eEH+uEE+6BTfNnn1kK
         RJ5wV0wGVYuIuOG8cv9EHJoH3sLfdO0J3g6wImfgm294TIteguf4d36cc+lIHtLh77pN
         bCh6n8qsDgDNQDoMHWf8sdlwz3ZHrbfiP0K83dB6CXI1X/N3hX/CBdmyyFEUc7GVhGUg
         tM6tlq7hsbrYNVKJGwMKnlrFoVB80EJp1dFUivEVOWXHphXSA56IAmHz1MCOjWuxOtMd
         Ocq2UkhUKDSxKxjCDs+phlstuxQNENsL6vequPLnErGCoVE99VSprEeLXhW/q50tOsuu
         7ISg==
X-Gm-Message-State: AOAM530Q9MePI/fHWXG7w9e/p2tt/fI7deEq/DmR9WwfOiHzWM/Y2ssg
	ZgJAtusvZT7C9q9SZ5SYbjk=
X-Google-Smtp-Source: ABdhPJwkC/YeGz/Dyo9+y84CiGmImn7JArYQpWwTejOvMX6UfS/2NsjkB1EpQntC8fZ8bP7wy08HGQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr6508448wmr.168.1628190263065;
        Thu, 05 Aug 2021 12:04:23 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id q7sm6329781wmq.33.2021.08.05.12.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 12:04:22 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@collabora.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	emil.velikov@collabora.com,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: hantro: Fix check for single irq
Date: Thu,  5 Aug 2021 21:04:16 +0200
Message-Id: <20210805190416.332563-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some cores use only one interrupt and in such case interrupt name in DT
is not needed. Driver supposedly accounted that, but due to the wrong
field check it never worked. Fix that.

Fixes: 18d6c8b7b4c9 ("media: hantro: add fallback handling for single irq/clk")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 8a2edd67f2c6..20e508158871 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -919,7 +919,7 @@ static int hantro_probe(struct platform_device *pdev)
 		if (!vpu->variant->irqs[i].handler)
 			continue;
 
-		if (vpu->variant->num_clocks > 1) {
+		if (vpu->variant->num_irqs > 1) {
 			irq_name = vpu->variant->irqs[i].name;
 			irq = platform_get_irq_byname(vpu->pdev, irq_name);
 		} else {
-- 
2.32.0

