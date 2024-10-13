Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233F84A5C
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728809142; cv=none; b=OWIMeDyh8buIPw2kbz82dQw9D230EWgEzR22zYHiXwdP1PWgYKK4w7hMAUSQh/uwEQzXWzVUJgzkx9wFF4llh+2tQPmFlj88UmNHymVkZ2zZ47z7KuROPOMxkX9HnqT644EClvszMpi4WEUSv1Y2+RS3y/l6c4TALZBWaE73r1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728809142; c=relaxed/simple;
	bh=Iiy7xQXIT4ZGsO8md7Xqk0przPDBC9t9cmDGVGB3waY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1QWYgXNWaPdUIQ+AgKzB+9NLag9OI6760sseIxivMujfkOgBPBTehDs+9Hvpopxiv+q+f0nMfCIhxv+9Fr5G0g9ZUTuTGfxVunF00KZQmQOXSKDETkbbTs616UV07fJpBlxTFLOdXHW0bFha22RlcKvRHQtMFLU1hKKkkpoxh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TawpI1Re; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TawpI1Re"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8DFF9EC;
	Sun, 13 Oct 2024 10:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728809039;
	bh=Iiy7xQXIT4ZGsO8md7Xqk0przPDBC9t9cmDGVGB3waY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TawpI1RezAL0bY0jIwc9Gy4cFSJK26ljwdZ/HN99nAz2xc9o5svwoccIf86ZmoaWs
	 11r3bavuAUd/e94Qr4hY4IsiJvEhUES/a/rp6QFuIOPP7XNNZCTMGPl9xvyKjvWWUO
	 YOh5UsRLXaodsSgHTnpPO3AMCOsW6Z2GRWJOGcMw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] staging: vchiq_arm: Drop blank lines
Date: Sun, 13 Oct 2024 14:15:28 +0530
Message-ID: <20241013084529.377488-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013084529.377488-1-umang.jain@ideasonboard.com>
References: <20241013084529.377488-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary blank lines from vchiq_arm.c.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 27ceaac8f6cc..e780ed714a14 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -309,9 +309,6 @@ static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *
 	return (struct vchiq_arm_state *)state->platform_state;
 }
 
-
-
-
 void vchiq_dump_platform_state(struct seq_file *f)
 {
 	seq_puts(f, "  Platform: 2835 (VC master)\n");
-- 
2.45.2

