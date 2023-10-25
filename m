Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE652266BC
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N+CB3tXy"
Received: from umang.jain (unknown [103.251.226.9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7845F669;
	Wed, 25 Oct 2023 12:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698229975;
	bh=qr18ghb+ItF+1AhxaAoJ6pixdlCURsSktU0qsiDuHC8=;
	h=From:To:Cc:Subject:Date:From;
	b=N+CB3tXyIiOkIXNE14s8qaYi8rH4CgmrDi/islQ4F6JIZ56x9eC3lk9Ez/2Re+ScO
	 +gF5F/6yCK+Ur18iduG96H41wE+zM93qw+gOYSBjxkD3zFR0YALkEb46wipkQbSVdV
	 FBDv3O+FHODfcMQi7loadTM4wh+/MzM12LXSVLrE=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/2] staging: vc04_services: Remove completed TODO items
Date: Wed, 25 Oct 2023 06:32:58 -0400
Message-ID: <20231025103300.340572-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per staging-next, there are two items which are completed.
Drop those two entries from the vc04_services TODOs.

1/2 drop the item which was addressed by vchiq-bus and struct
vchiq_device per device handling. All blockers have been resolved and
landed in staging-next as of today.

2/2 was already completed as far as I can see.
It was also confirmed by Stefan here [1].

[1]: https://lore.kernel.org/lkml/79cf6cc0-d071-f834-1db9-cb5411c1f356@i2se.com/

Umang Jain (2):
  staging: vc04_services: Drop completed TODO item
  staging: vc04_services: Drop completed TODO item

 drivers/staging/vc04_services/interface/TODO | 15 ---------------
 1 file changed, 15 deletions(-)


base-commit: 5d9f6f26ec6656b43bf90f12705dbe88ce77f8d5
-- 
2.41.0

