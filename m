Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D472
	for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 15:28:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="271296495"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="271296495"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 08:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="412479665"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2021 08:25:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F1A3EB9; Tue, 13 Jul 2021 18:25:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/5] media: staging: atomisp: Remove unused declarations
Date: Tue, 13 Jul 2021 18:25:20 +0300
Message-Id: <20210713152523.19902-2-andriy.shevchenko@linux.intel.com>
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

There is a few static declarations that are not used anywhere, remove them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added "media:" prefix
 .../atomisp/pci/isp2400_input_system_local.h    | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 072a92199e05..27f3c8a45730 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -362,23 +362,6 @@ static const hrt_address MIPI_PORT_OFFSET[N_MIPI_PORT_ID] = {
 	0x00000200UL
 };
 
-static const mipi_lane_cfg_t MIPI_PORT_MAXLANES[N_MIPI_PORT_ID] = {
-	MIPI_4LANE_CFG,
-	MIPI_1LANE_CFG,
-	MIPI_2LANE_CFG
-};
-
-static const bool MIPI_PORT_ACTIVE[N_RX_MODE][N_MIPI_PORT_ID] = {
-	{true, true, false},
-	{true, true, false},
-	{true, true, false},
-	{true, true, false},
-	{true, true, true},
-	{true, true, true},
-	{true, true, true},
-	{true, true, true}
-};
-
 static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
 	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
 	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-- 
2.30.2

