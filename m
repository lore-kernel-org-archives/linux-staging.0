Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2EE2FAD
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 12:43:13 +0000 (UTC)
IronPort-SDR: OtIe0ZOreKYSS0TiD0eFcDnhA67Ho1h0iv5o30LuJn5DIuVG5dEwiyb8giHO1OJ0JcT8Ip6hxT
 iMxfOTasjP9w==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189574312"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="189574312"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 05:43:11 -0700
IronPort-SDR: 038J/aXIgYUgMzjXdUOq0rBwYrrC+EWtxkXo+NLB9nVFn7t2Kucy1TAZV7jcDzI6//+95reKQM
 eZ2d4o627/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="630717247"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 26 May 2021 05:43:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 702A36D8; Wed, 26 May 2021 15:43:30 +0300 (EEST)
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
Subject: [PATCH v1 5/6] staging: atomisp: Move MIPI_PORT_LANES to the only user
Date: Wed, 26 May 2021 15:43:21 +0300
Message-Id: <20210526124322.48915-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move MIPI_PORT_LANES to the only user of it, i.e. pci/runtime/isys/src/rx.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/isp2400_input_system_local.h    | 11 -----------
 .../staging/media/atomisp/pci/runtime/isys/src/rx.c   | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 21f11bdfc85f..2614b89b8e34 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -362,17 +362,6 @@ static const hrt_address __maybe_unused MIPI_PORT_OFFSET[N_MIPI_PORT_ID] = {
 	0x00000200UL
 };
 
-static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
-	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_2LANE_CFG},
-	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
-	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG}
-};
-
 static const hrt_address __maybe_unused SUB_SYSTEM_OFFSET[N_SUB_SYSTEM_ID] = {
 	0x00001000UL,
 	0x00002000UL,
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 4a18da6bf0c1..29486dcc9a04 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -20,6 +20,17 @@
 #include "ia_css_irq.h"
 #include "sh_css_internal.h"
 
+static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
+	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_2LANE_CFG},
+	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
+	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG}
+};
+
 #if !defined(ISP2401)
 void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
 {
-- 
2.30.2

