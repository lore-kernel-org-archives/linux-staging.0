Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E556286428
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669836; cv=none; b=G+6G99HlXYoXCbvJgsnv2/tT4yS9izLbrc4+/bPLYbpz3YV/uirvhgEMFcrRcGC0kQwSth9oWMGtOmIKzNqkl7g7Yp6JV4rVkhlcKVaLbffYFIBO3CNQdYGrF7gRMrMayWOiqSrNEYT9vzPqBXr9V+FEd3eiWBBt5YJfAnWqgzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669836; c=relaxed/simple;
	bh=SbfybxeRa2xIWz0oHLGf8Yvut8GFTIY8+BPlypFLWTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O07ZvVH69Aq95YwhtnpXjFbvW/1d4ZOTL2uxU/X8jzAT4y0/gZEtf+uKWwvJEfCLSighjC+R6ovFuq6BKwubuQfk07Q8XJHcxcTAuRW5v5GHCKv7Trnn4B/D3AnJyL10SSob0VTi5M6zjxHs3bcVfRF9wruWDgwpQpEagpgP71A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/NOGT0v; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/NOGT0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669834; x=1779205834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SbfybxeRa2xIWz0oHLGf8Yvut8GFTIY8+BPlypFLWTU=;
  b=a/NOGT0vGdTp/hC3WW8dlf2YeseOyaFoXyJF4Zrm/xkqw2YkQut8ihsC
   16HeMaVlx2WhNooCmJBF7czM0fBDYTKERqGyXKtBr8qyvJ7Af7krApTKS
   9GErEukqEqq6jsOCcczZqm+TSidyODqGFip0OeNeuzPG44qqgwwcUb/2e
   ys50OHmyhdKRnf8ULfMUPcKLxEGBLBjfRualm0Vws01jGUsqYOEhtV6yk
   uhB78zkDxs1bIHiYq47ftf8OybB8SBDvKXpKvCKMOVZioarCAIBR7QpwS
   A1FRon1vGVKfvNJ4kDoF5FPevIw4hahAEUpBX2KEmqTXz0c/jv0ro4ql3
   Q==;
X-CSE-ConnectionGUID: ThwOCV04RZGnPvrxawHgAw==
X-CSE-MsgGUID: 6rJjXIprSGOyiOp5nPyYXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49480084"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49480084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:50:34 -0700
X-CSE-ConnectionGUID: wckLsARXQYeOsU1mU0Bc2g==
X-CSE-MsgGUID: 0ZynUHDmStqIIbmp7lMygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144405903"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 08:50:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7EF6526B; Mon, 19 May 2025 18:50:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 3/3] media: atomisp: Remove no more used macros from math_support.h
Date: Mon, 19 May 2025 18:46:49 +0300
Message-ID: <20250519155028.526453-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
References: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After recent cleanups the few macros become unused. Remove them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/hive_isp_css_include/math_support.h    | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
index 6d45d0d8d060..2cb5c986790a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
@@ -10,14 +10,9 @@
 /* Override the definition of max/min from Linux kernel */
 #include <linux/minmax.h>
 
-/* force a value to a lower even value */
-#define EVEN_FLOOR(x)        ((x) & ~1)
-
 #define CEIL_DIV(a, b)       (((b) != 0) ? ((a) + (b) - 1) / (b) : 0)
 #define CEIL_MUL(a, b)       (CEIL_DIV(a, b) * (b))
-#define CEIL_MUL2(a, b)      (((a) + (b) - 1) & ~((b) - 1))
 #define CEIL_SHIFT(a, b)     (((a) + (1 << (b)) - 1) >> (b))
-#define CEIL_SHIFT_MUL(a, b) (CEIL_SHIFT(a, b) << (b))
 
 /*
  * For SP and ISP, SDK provides the definition of OP_std_modadd.
-- 
2.47.2

