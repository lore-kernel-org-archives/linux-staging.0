Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837396AA2
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 16:00:30 +0000 (UTC)
Received: from ideasonboard.com (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3F26929;
	Thu, 17 Nov 2022 17:00:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668700827;
	bh=I80Tp79qaCwo6ciskJK+YDceactFw/U1YNWBgPsEn2A=;
	h=From:To:Cc:Subject:Date:From;
	b=t8O5JmSt0OkQpDdVs4jVRkYSElAtfH7sVJKhEZ7lcLmrpYADbJgA4QchJb8m/f8Y0
	 bRZcXDV/uaZTZPwE1INty6jpQCXgB2Sna5lICJs+6L080mrtNpgW4ZFm2hPS3unqYP
	 KOJeBEOCrbdwHHF+zQWaHxOHOevnc/S8oNM/L+ds=
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
Subject: [PATCH 0/3] vc04_services: Promote bool usage
Date: Thu, 17 Nov 2022 21:30:12 +0530
Message-Id: <20221117160015.344528-1-umang.jain@ideasonboard.com>
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

