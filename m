Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2A2D786
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QHb/qcPZ"
Received: from umang.jain (unknown [103.251.226.96])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA6C6552;
	Tue,  7 Nov 2023 17:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699376111;
	bh=fZdOsLuOsy4l3gpxjmBOY1RfLY8nQistmx8GqH4SDdM=;
	h=From:To:Cc:Subject:Date:From;
	b=QHb/qcPZp5UgTZdUC69scZdyVDuUyyjlZEcYsji+2vqOyOvumb1oI2/kwje+DCtbh
	 hytaUzumG67USOAslUpSCUMIZllz7oKX0D2IwrbZwUSGIVJvtnDeUfkNUMKtsgqyL0
	 b4id0MGBTcFxoX6zkj9WaO8d52/scDNpYGeUOt2Y=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/2] staging: vc04_services: Use %p to log pointer
Date: Tue,  7 Nov 2023 11:55:21 -0500
Message-ID: <20231107165523.638555-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

%lx is used to print the unmodified pointer address for debugging.
%p will print the hashed pointer address to avoid leaking information
about kernel memory layout to userspace. But when `no_hash_pointers`
is passed as kernel parameter, unmodified pointer address will be
printed.

Hence, drop %lx in favour of %p. For debugging purposes, one can
easily depend on `no_hash_pointers`.

This also solves the following smatch warnings:
service_callback() warn: argument 7 to %lx specifier is cast from pointer
service_callback() warn: argument 11 to %lx specifier is cast from pointer
service_callback() warn: argument 12 to %lx specifier is cast from pointer
service_callback() warn: argument 13 to %lx specifier is cast from pointer
vchiq_release() warn: argument 7 to %lx specifier is cast from pointer

Umang Jain (2):
  staging: vc04_services: Use %p to log pointer address
  staging: vc04_services: Use %p to log pointer address

 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 7 +++----
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.41.0

