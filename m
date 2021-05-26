Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011742FB3
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 12:43:15 +0000 (UTC)
IronPort-SDR: A3vZtEeFsKfEf75bI+aF1cnFSVo+XWYmI+VRAMVPJuyh/n+gJT9KSyHdGVI+DHIALdOJhOppaX
 4MJflDaWST6A==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202210438"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="202210438"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 05:43:11 -0700
IronPort-SDR: Dzk5EFsP7fJJVT6B3lf0dHwP7+a4bLImdwCySiTE43cfCefcEez/XVuQAqRbDuMXGa17s9VgWU
 VXQt1BZPP0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="409246040"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 26 May 2021 05:43:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 53E645B6; Wed, 26 May 2021 15:43:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 3/6] staging: atomisp: Remove unused declarations
Date: Wed, 26 May 2021 15:43:19 +0300
Message-Id: <20210526124322.48915-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a few static declarations that are not used anywhere, remove them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

