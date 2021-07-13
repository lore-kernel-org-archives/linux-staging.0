Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C304177
	for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 15:28:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="271296488"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="271296488"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 08:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="412479666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2021 08:25:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 228725A1; Tue, 13 Jul 2021 18:25:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5/5] media: staging: atomisp: Remove unused port_enabled variable
Date: Tue, 13 Jul 2021 18:25:23 +0300
Message-Id: <20210713152523.19902-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210713152523.19902-1-andriy.shevchenko@linux.intel.com>
References: <20210713152523.19902-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused port_enabled variable in ia_css_isys_rx_configure().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added "media:" prefix
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 79475dc19eb6..af153c3fb86d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -490,7 +490,6 @@ static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
 void ia_css_isys_rx_configure(const rx_cfg_t *config,
 			      const enum ia_css_input_mode input_mode)
 {
-	bool port_enabled[N_MIPI_PORT_ID];
 	bool any_port_enabled = false;
 	enum mipi_port_id port;
 
@@ -527,8 +526,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 					_HRT_CSS_RECEIVER_2400_RX_COUNT_REG_IDX,
 					config->rxcount);
 
-		port_enabled[port] = true;
-
 		if (input_mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 			/* MW: A bit of a hack, straight wiring of the capture
 			 * units,assuming they are linearly enumerated. */
-- 
2.30.2

