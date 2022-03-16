Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2338F8
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647449627; x=1678985627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=67HJ5xsUQCH77LSjNv9g0hLBWeBJ7D0jAoL2UnUtLbY=;
  b=HBh8ZL6gNJP29QMUJaedkNQo/9EWjfgtgxd9bgDEo894NUv13zYQa3Ag
   QSyNSSNb8Y0n2Uk8EwDUo5X6u2CqHMiA0o0PdVkXO6UZEyxq8qUaZA5ku
   CS8NfbJhT3rSdpT/vbecdZ0VAeF7nDxFAbN35OVnDCw4DO2e2QI0zINhg
   slaeeB9wG3RG2t7G/+dZsctN4mb480c8vlkPbMRrWxxYBaIV8COqeGUlt
   W9afWjrwYcnbJb4vbrw8Wvz2M0UiAxfhJvEl+fuPfBBlAo8vi8zmzD7MH
   1fu+6XE0LFzPLOA8/AVN+ZrZtlEXjXcAKIKCarePlzCf/C7+FjhLt49SJ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="281444467"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="281444467"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 09:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="513107709"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 16 Mar 2022 09:53:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7D8E3192; Wed, 16 Mar 2022 18:53:55 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] staging: fbtft: Consider type of init sequence values in fbtft_init_display()
Date: Wed, 16 Mar 2022 18:53:51 +0200
Message-Id: <20220316165351.58107-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316165351.58107-1-andriy.shevchenko@linux.intel.com>
References: <20220316165351.58107-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the fbtft_init_display() the init sequence is printed for
the debug purposes. Unfortunately the current code doesn't take
into account that values in the buffer are of the s16 type.

Consider that and replace the printing code with fbtft_par_dbg_hex()
call.

Fixes: b888897014a9 ("staging/fbtft: Remove all strcpy() uses")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes, just based on prerequisite
 drivers/staging/fbtft/fbtft-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 6dc77895a87c..3b182115bd6e 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1034,10 +1034,9 @@ int fbtft_init_display(struct fbtft_par *par)
 			for (j = 0; par->init_sequence[i + 1 + j] >= 0; j++)
 				;
 
-			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
-				      "init: write(0x%02X) %*ph\n",
-				      par->init_sequence[i], j,
-				      &par->init_sequence[i + 1]);
+			fbtft_par_dbg_hex(DEBUG_INIT_DISPLAY, par, par->info->device,
+					  s16, &par->init_sequence[i + 1], j,
+					  "init: write(0x%02X)", par->init_sequence[i]);
 
 			/* Write */
 			j = 0;
-- 
2.35.1

