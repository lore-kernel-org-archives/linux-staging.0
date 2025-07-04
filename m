Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163232F2366
	for <linux-staging@lists.linux.dev>; Fri,  4 Jul 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615701; cv=none; b=QYjXSSp74PoqbrbzRdyMX2gMMQinXCEci2R42nY8tgUYkv0zYfOI/KVE4JsMb05a7ZM7sHII2hZzA3ldKuFmqRge45E7m04p2rT/dDDZmp4ybUvHn0IiiRalepZPBzTLFfoxmvUUl2PY8McJ9uQapcKg42JINJ8OByvZQF7o5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615701; c=relaxed/simple;
	bh=mdM0fCBRCMeIMAVi7fqCrM0fXAuMJVicckxaZNS+bgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sIhkAnqHm3Ue4mnSt2yyooT+Ozmi3APb9O9H4kXESyQgHbi7m/XkxGH5iOG8vumrCYucADTdgfxV/wqoyfMtN1F5fNYM+LNDb6QSCvh9Zf0OqrXOWH633F/RPAXMZjqsaPoHlcaqXJbTefqTBWv/kXmh2M4JGAMCJGYVLwVJP8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoScNqlI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoScNqlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615699; x=1783151699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mdM0fCBRCMeIMAVi7fqCrM0fXAuMJVicckxaZNS+bgI=;
  b=GoScNqlI7To1vuNCY0AzHc6VxbNxsHmmgc0JTKKLefNKaJ6C4WmNHIOW
   e236Y/FeKJN8+OxAillIh2ZwMobzboBiUXvCfr/ynJ92YBLKiPHvEnGcm
   guvZJmYWkKe/2EhderWa/4PfX61+X8iq2NgaQ7iZESuKg1eFBG+zv/Hyt
   dLPZHrMHxQC8JyGWReRA8Qq7RH/rqvaO1N6nGx1xVnCs9/wtczgM8YAhe
   /cx5DbwOUqAVyzOHadCnsctyMkMoNpqc8qXoV/Dw/ud21CV468EWzGR2e
   AcCMkhkgvfXWmNrjHQ5CGYBi7+VMeW7Fa8hnkvifcpprOlQu6WchLQ8bK
   Q==;
X-CSE-ConnectionGUID: cjo77PuFQfydxBudvo05cw==
X-CSE-MsgGUID: ewD5yLBSRDmXXnByI8VcEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194262"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194262"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
X-CSE-ConnectionGUID: LhFiReD2SIile6uLjhnPyQ==
X-CSE-MsgGUID: o0jYIUk4SJePdq14auC1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616652"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:51 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 4B87844419;
	Fri,  4 Jul 2025 10:54:49 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 62/80] staging: greybus: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:48 +0300
Message-Id: <20250704075448.3221843-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/staging/greybus/gbphy.c | 1 -
 drivers/staging/greybus/gbphy.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6adcad286633..3068bd71cd98 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -53,7 +53,6 @@ static void gbphy_dev_release(struct device *dev)
 #ifdef CONFIG_PM
 static int gb_gbphy_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 	return 0;
 }
diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..4a4ebc7f2b98 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -85,7 +85,6 @@ static inline void gbphy_runtime_put_autosuspend(struct gbphy_device *gbphy_dev)
 {
 	struct device *dev = &gbphy_dev->dev;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
-- 
2.39.5

