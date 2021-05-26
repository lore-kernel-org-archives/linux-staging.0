Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C952FB2
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 12:43:16 +0000 (UTC)
IronPort-SDR: zIhUck5eOqZ8r78pAurFDaRiroDKqBY+7EbcqlR2BFKMNxmi14IvIZQ0SQDb+n/inOhYHtU9nM
 4CqgxLiYnqKg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182098648"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="182098648"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 05:43:15 -0700
IronPort-SDR: 1X5vo9M7VygZNZQSa1VCQhMAvfKUuQ+yiCMQhPP03UkoKZhzAY6Zy5Ytx6wke9sl7Ulb4tGi5O
 fBGx0etEZC4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="443019366"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 26 May 2021 05:43:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7B8E199D; Wed, 26 May 2021 15:43:30 +0300 (EEST)
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
Subject: [PATCH v1 6/6] staging: atomisp: Remove unused port_enabled variable
Date: Wed, 26 May 2021 15:43:22 +0300
Message-Id: <20210526124322.48915-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused port_enabled variable in ia_css_isys_rx_configure().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 29486dcc9a04..79e82fc08aa9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -490,7 +490,6 @@ unsigned int ia_css_csi2_calculate_input_system_alignment(
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

