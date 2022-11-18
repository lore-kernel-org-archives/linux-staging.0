Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC328E3
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 08:42:58 +0000 (UTC)
Received: from ideasonboard.com (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE823AF4;
	Fri, 18 Nov 2022 09:42:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668760975;
	bh=TCrYINWxM0LvCaPr72NP5lRPmCGfFoHIG7JjVzCGjrU=;
	h=From:To:Cc:Subject:Date:From;
	b=quBB7pfvSnnPccL7fq/8zUsbsX0sa6m7O7sFCS+qF3m4G8DQSEBatBqf8elaJXzA2
	 nRjuVgyy/4UiPLDUV4rOw4TWYE1d66St1DlBVZCxMp6KwcmsnKT5BNWEDSA37EnHFK
	 vHESTzMQK5E5BbL9YL/5YZ/SwL3pyROpmreA2DoU=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/3] staging: vc04_services: Promote bool usage
Date: Fri, 18 Nov 2022 14:12:41 +0530
Message-Id: <20221118084244.199909-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 7967656ffbfa ("coding-style: Clarify the expectations around
bool") the check to dis-allow bool structure members was removed from
checkpatch.pl. It promotes bool structure members to store boolean
values. This enhances code readability.

Changes in v2:
- Drop ':1' in bool foo:1 usage as mistaken understood as initization
  by me (apologies).


Umang Jain (3):
  Revert "staging: mmal-vchiq: Avoid use of bool in structures"
  vc04_services: mmal-vchiq: Use bool for vchiq_mmal_component.in_use
  vc04_services: bcm2835-camera: Use bool values for
    mmal_fmt.remove_padding

 .../bcm2835-camera/bcm2835-camera.c           | 30 +++++++++----------
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 18 +++++------
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  6 ++--
 3 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.38.1

