Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150CF168
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643142075; x=1674678075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6zue4ppucen/ANYQA3c/xAkoOYydv3PMPDvmLNWSzoI=;
  b=nsV58APYFMsYlHgblddwf5MqiHYKWiQNonqI34/cr5cqWknxNtehj4o5
   sYQoUxRb2g7GOqBZLYjgdkqjtq8RV72i/M09d7thUg5obZqJnXfOGPZtC
   7a7/yfz/fdt2ljPLpv+t6xAmOIV+Q5QQMRWgTafiahTGDMNhdQQu5nO+V
   8joG1B7WZuev68zV18Ld1ARpGuejH7oHv5/n6xLT4AsX+AqhsE48kiikK
   qItS2qgMEYrqasWabKLXPQwn17q61Lahj5CQ8ZLFyK6eptObxBVnXwCSv
   DvIvtjHgqU0VYYKtjVdE/li+rB85Lt5TPOafRUZyVgBM5caLpxbQ0t4sR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227082860"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="227082860"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 12:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="495130326"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 25 Jan 2022 12:21:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 67655B9; Tue, 25 Jan 2022 22:21:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Carlis <zhangxuezhi1@yulong.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v1 1/4] fbtft: Unorphan the driver
Date: Tue, 25 Jan 2022 22:21:14 +0200
Message-Id: <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's maintain occasional fixes to the fbtft driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..16e614606ac1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7372,9 +7372,11 @@ F:	Documentation/fault-injection/
 F:	lib/fault-inject.c
 
 FBTFT Framebuffer drivers
+M:	Andy Shevchenko <andy@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-fbdev@vger.kernel.org
-S:	Orphan
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git
 F:	drivers/staging/fbtft/
 
 FC0011 TUNER DRIVER
-- 
2.34.1

