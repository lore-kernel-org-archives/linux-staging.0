Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081253AE
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cwMIhnm8"
Received: from umang.jain (unknown [103.251.226.9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BCBA669;
	Wed, 25 Oct 2023 08:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698214032;
	bh=6N7Z7hgd1/Qg61kV5UAnFtn2rr4bYNmxCxexbxy7XdM=;
	h=From:To:Cc:Subject:Date:From;
	b=cwMIhnm84IHVNFWeqWKz+cu8OGXMCEeq0sDy8OBzZulgqtVJyt74a9tkB0S3vzTzM
	 9vD7PS1A2BhigtH5HUPKSEVRr+ijlFif8hS9y0p/VCL8pJfC6lmY7vvpGNcC3e/eWg
	 fZtWOLB+S/rnydDeIvNaD2qV9J5c6xc6aHPwyztY=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/1] staging: vc04_services: Use %p4cc to print fourcc
Date: Wed, 25 Oct 2023 02:07:16 -0400
Message-ID: <20231025060717.71895-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following patch drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc
format modifier to print FourCC codes in the logs.

*Before this patch*
`mailbox: vchiq_core_msg debug: Sent Msg DATA(5) to AUDS s:1 d:62 len:20`

*After this patch*
bcm2835_vchiq 3f00b840.mailbox: vchiq_core_msg debug: Sent Msg DATA(5) to SDUA little-endian (0x41554453) s:1 d:62 len:20

The inversion of AUDS to SDUA as per usage of %p4cc
Does it hamper readability ? Feedback is appreciated.

As documented in the commit message, the 'entity' char array length is
increased to hold more characters for the log output. Not doing so,
causes kernel stack corruption at runtime.

Based on top of:
- [PATCH v2 0/8] staging: vc04: Drop custom logging based on printk

Umang Jain (1):
  staging: vc04_services: Use %p4cc format modifier to print FourCC
    codes

 .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
 .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  6 ---
 .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
 4 files changed, 33 insertions(+), 40 deletions(-)

-- 
2.41.0

