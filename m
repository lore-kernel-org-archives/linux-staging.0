Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1198E6D18
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 10:23:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15030613EE;
	Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617791031;
	bh=7SlQDFpN8IwGX3V56eR2KHPnzDvhEiD1cEIzgKvu4jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOughuxls2IxSNAvOGOW4RgFjJO/oxySOIjgX55qO5J4rJvrpRK33TRl74bELp1DR
	 56O6u/mOUR0oZZambCRqbKy3SC42Q0TLiLbBjNXFLVeZB0yD9psN7rPUZN9VAJvRKL
	 Iqy8Ssm22UnY4k1CQk2/Q7opBnWRzmdlp23msYBjCwdL1hpxZcx2aP6bFIF9zNSwRA
	 W+uZUXNiYMn6Gomja3V3q4jWQ3XkLptwPhQlihFOD0V5G/BNQ/Y5Xny3WdeMCdR15a
	 hNEDN9j7EPoVZGtJ+5kBNNjeZWW/k4Hir2JwW6NLOt0YmO539h3CIYjyjPriyntsxa
	 Pj4/t1GIMuK2Q==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
	(envelope-from <johan@kernel.org>)
	id 1lU5Lb-0008Ri-SN; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 15/16] pcmcia: synclink_cs: drop redundant tty-port initialisation
Date: Wed,  7 Apr 2021 12:23:33 +0200
Message-Id: <20210407102334.32361-16-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The port close_delay and closing_wait parameters have already been by
tty_port_init() so drop the redundant driver initialisation to the
default values.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/char/pcmcia/synclink_cs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
index 2be8d9a8eec5..3287a7627ed0 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -530,8 +530,6 @@ static int mgslpc_probe(struct pcmcia_device *link)
 	info->port.ops = &mgslpc_port_ops;
 	INIT_WORK(&info->task, bh_handler);
 	info->max_frame_size = 4096;
-	info->port.close_delay = 5*HZ/10;
-	info->port.closing_wait = 30*HZ;
 	init_waitqueue_head(&info->status_event_wait_q);
 	init_waitqueue_head(&info->event_wait_q);
 	spin_lock_init(&info->lock);
-- 
2.26.3

