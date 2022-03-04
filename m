Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307CB7C
	for <linux-staging@lists.linux.dev>; Fri,  4 Mar 2022 19:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646422455; x=1677958455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=prSCg+P2w+6rp7GYMZxEjueC6DVV7pXYvo+J6n3NE1o=;
  b=a4n1r5+akRVzEN3L1Ds+eq323GesBNiVADB7DTxdSiOGGsWmV/Tq4tUB
   /CpWDMlN4XXaap/7Jx9XOjXqw260dJT5OCaQFDT+FlIyjyTOURqlD6gOg
   8g7RVfRka2490z17M7MWLN7OVfPvadbKhsioNlP4GDEeEyHFJQWrYAHRN
   V+Zsub4JcR91kP5hP6mSrFPdqcB8A6XwFC1Cyl9tZMWCg/Z1x+ZrM+RN3
   JGEnBfZDYyLTqi9zO6q6hnCINvP9mQo98GVxVbFxkmKBAENNHHD6BGiUv
   BywthkhqHWaVBJKhxFhjaFx6a/CSY71Yz95vYhhDJ1q5AloVlB5mI8toq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="234653450"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; 
   d="scan'208";a="234653450"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2022 11:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; 
   d="scan'208";a="511959167"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 04 Mar 2022 11:33:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4AD81A7; Fri,  4 Mar 2022 21:34:16 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence values in fbtft_init_display()
Date: Fri,  4 Mar 2022 21:34:14 +0200
Message-Id: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/staging/fbtft/fbtft-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4a35347b3020..b28a059ad3b4 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1035,10 +1035,9 @@ int fbtft_init_display(struct fbtft_par *par)
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
2.34.1

