Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3942C1B043C
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122370; cv=none; b=D5SJK6platRknXJNG2HUoK0nSsEFOAc1G575vVbvUsP9JMWIusqPH5FzIJvXu1cpu1ZE7JaF05SDLtqsjFCN7dztvDEiKaKz9imsaGzrHCJRtzLzr3i9rGy5RYqNUuIjeAuI/dXWlpdAXl0MCBRvjmfpmQpzMMTkr6CUI2wgws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122370; c=relaxed/simple;
	bh=IctizEPXNSK/dPLVaTJY+hCdacO/Yvul7Mp92gydV78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RmEbum1p27R/5/LeHyxNU6b0W0IizRLFBslwGnT3TNOjV0OxjI/qAMPTlVp2mnij43OfAXjbCqkuy7acB02lJlrvVFVvS22VchlUtByGKAoKL4C8G//ze3Rr7wSbKGw3xTd+0qlHmBPdSZUdhh87JVzQxEdx+U/N2eN2EBk5Kyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOii8f7J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOii8f7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744122368; x=1775658368;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IctizEPXNSK/dPLVaTJY+hCdacO/Yvul7Mp92gydV78=;
  b=gOii8f7J7TqFmA3Dm5VmY4FpmTPoB0NHmAkhp67n3ogB7aqz4KLXG/10
   rFCYU6K0wvs/MTk/ohWyIutA53mIXjSrAQqi6+GTFkx3XL6NdjY2nf+6s
   P/C3KSlCnfOoWH0+eyKCUFzA9Rj/GBgYj4536ByEloykWDvMniTXPEH+2
   aB8JpQgkX22W1I/FEA4OXvMvyhCaj6/FGRSIHaDlG3xt0pc2l/kZ2rNNA
   +6k93PQshzGc++eT2N3868Xvhr5Jb8Jq8/ms/unmzsS0c4SsXl6jWcl9K
   cAQzr1iKk0xVgiKWCqjyvv+lpieQm4vBszHZqeU2xm0WHVwblxMW1wUZ/
   w==;
X-CSE-ConnectionGUID: 0VbbJ7SKTfOiGS82ZUPY2Q==
X-CSE-MsgGUID: N6Os7l9VQBGm35e4hq6R2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45718268"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45718268"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:26:07 -0700
X-CSE-ConnectionGUID: nU8ZtxTiQ4Gb8Up/3LjOfQ==
X-CSE-MsgGUID: JMzrA4HXRiS+AzcJIrrY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128792790"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2025 07:26:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 63090398; Tue, 08 Apr 2025 17:26:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 0/2] fbtft: Unorphan the driver for maintenance
Date: Tue,  8 Apr 2025 17:22:24 +0300
Message-ID: <20250408142554.1366319-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I would like to unorphan FBTFT as it has a lot of drivers for the hardware
I have and DRM won't have them in the feasible future anyway (or never if
we talk about parallel interface).

In v2:
- dropped the move out of staging (no consensus here)
- removed more 'depends on FB_TFT' lines (Joe)
- added tag (Randy)

Andy Shevchenko (2):
  fbtft: Unorphan the driver
  fbtft: Replace 'depends on FB_TFT' by 'if FB_TFT ... endif'

 MAINTAINERS                   |  3 ++-
 drivers/staging/fbtft/Kconfig | 35 ++++-------------------------------
 2 files changed, 6 insertions(+), 32 deletions(-)

-- 
2.47.2

