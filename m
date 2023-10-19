Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53BA156EE
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZoPm3K6M"
Received: from umang.jainideasonboard.com (unknown [103.251.226.1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 016D625A;
	Thu, 19 Oct 2023 10:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697703713;
	bh=LzjQ3czQq/jljPSeb2fPZh9bsWvb3v3VA3S4TgVmnlE=;
	h=From:To:Cc:Subject:Date:From;
	b=ZoPm3K6MYry9ic6T6mlw9gXX07pOXBLn9wH3bn1TwQq1gDbLisQBmx7olqh7ujyKT
	 fpo0CVUXg7mhQJs01ysai4/oIfDt1AC32PDvjNHZhc4bB+7XyFShUyh11HnOjm60Pl
	 1CpF4MHL69ZCOnOTSVnOWCw77s5UYm3IRyL/YKls=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v1 0/4] staging: vc04: Drop custom logging based on printk
Date: Thu, 19 Oct 2023 13:51:43 +0530
Message-Id: <20231019082147.384723-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series address the discussion on [1], i.e. removing the printk
based logging mechanism and migrate it use dynamic debug.

Patch 1/4 targets migration of vchiq_log_error().
Patch 2/4 targets migration of vchiq_log_warning().
... and so on.

This series does not touch debugfs entries which are:
DEBUG_INITIALISE, DEBUG_TRACE, DEBUG_VALUE and DEBUG_COUNT. As far as I
understand from the previous discussions, those  too should be moved
to use dynamic debug as well (but is not part of this series yet), as
I found there are more moving parts involved. I will build a series on
top of this one, to move the debugfs entries to dynamic debug and remove
all custom logging remanants (like VCHIQ_LOG_* macros, *_log_levels externs)
because they do still tie into vchiq_debugfs.c.

[1] https://lore.kernel.org/linux-media/20230913185528.770634-1-umang.jain@ideasonboard.com/

Umang Jain (4):
  staging: vc04: Convert vchiq_log_error() to use dynamic debug
  staging: vc04: Convert vchiq_log_warning() to use dynamic debug
  staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic
    debug
  staging: vc04: Convert vchiq_log_trace() to use dynamic debug

 .../interface/vchiq_arm/vchiq_arm.c           | 143 ++++----
 .../interface/vchiq_arm/vchiq_connected.c     |   2 +-
 .../interface/vchiq_arm/vchiq_core.c          | 329 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |  53 ++-
 .../interface/vchiq_arm/vchiq_dev.c           |  59 ++--
 5 files changed, 307 insertions(+), 279 deletions(-)

-- 
2.40.1

