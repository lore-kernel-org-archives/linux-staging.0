Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42323D970
	for <linux-staging@lists.linux.dev>; Tue,  5 Dec 2023 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QGow/qTC"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66E244DB;
	Tue,  5 Dec 2023 09:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701765687;
	bh=A2HMUlMpMWnq+VJUq1eO7totGVlfWFugZ78W6RBfgkI=;
	h=From:To:Cc:Subject:Date:From;
	b=QGow/qTCqw0q4H1VUKO7rD5hAPJ+I6nL/k2P7TiAmiR+pj4h0kVgNFkDXFeAiF7xH
	 KEpzm+lrvNQ1YwQDQlKUpD1ANGgdTkymi4u3FGRu04R4yyRfwMx5kI1bS6CBItbM16
	 cm+XJbWwPAfBjYYkl3pjEWpFGjaACrpctBgv0a3w=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 0/4] staging: vc04_services: Drop custom logging
Date: Tue,  5 Dec 2023 14:11:53 +0530
Message-ID: <20231205084157.73819-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series also removes the vchiq_log_* macro and makes use of dev_*()
logging helpers directly.

Patch 1/4 removes vchiq_log_error() macro
Patch 2/4 removes vchiq_log_warning() macro
Patch 3/4 removes vchiq_log_trace() macro
Patch 4/4 removes vchiq_log_debug() macro

This completes the following TODO item:

```
* Cleanup logging mechanism

The driver should probably be using the standard kernel logging mechanisms
such as dev_info, dev_dbg, and friends.
```

Changes in v3:
- vchiq_log_error() will log to dev_err
- vchiq_log_warn() will log to dev_warn
- vchiq_log_trace() will log to dev_dbg

Changes in v2:
- Separate out one fixup patch from v1 (Patch 1/9)and send separately
- Drop usage of log_type() and log_category() helpers. Directly use
  dev_dbg() as suggested by Greg KH.
- Drop __func__ annotation from all logs. Dynamic debug has 'f'
  decorator flag which can be used instead of manual __func__
- Reword commit messages.

Umang Jain (4):
  staging: vc04_services: Drop vchiq_log_error() in favour of dev_err
  staging: vc04_services: Drop vchiq_log_warning() in favour of dev_warn
  staging: vc04_services: Drop vchiq_log_trace() in favour of dev_dbg
  staging: vc04_services: Drop vchiq_log_debug() in favour of dev_dbg

 drivers/staging/vc04_services/interface/TODO  |   5 -
 .../interface/vchiq_arm/vchiq_arm.c           | 178 ++++----
 .../interface/vchiq_arm/vchiq_connected.c     |   6 +-
 .../interface/vchiq_arm/vchiq_core.c          | 403 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |  38 --
 .../interface/vchiq_arm/vchiq_dev.c           |  92 ++--
 6 files changed, 314 insertions(+), 408 deletions(-)

-- 
2.41.0

