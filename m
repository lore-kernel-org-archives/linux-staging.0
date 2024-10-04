Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3F14A0B3
	for <linux-staging@lists.linux.dev>; Fri,  4 Oct 2024 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034913; cv=none; b=uiATA/IS18qYNq4uF499O2VBYVlrDULRwFa5lWVZV+Bh5cNrcWJ/0KFEiELNZh61PEcIOoPTEGZm4Hp0VUFrYbc/dozvsAiAOOGDzpe7sLzV0Bw95jCBP6Oxy2Vp642DLqqU8+TGEJtdcdV8Xq3+BGQFYwQaxW3EHUozmPQNIQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034913; c=relaxed/simple;
	bh=T7UxU4p5GUU0R8QUQqUhO1GmL5eGB3g4pm7kyjBvI68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P6IzSwh+NLWd1WQpLF4x7gFhfa6kq3y51COWSXNbaMsYmeNCdML39ocqNkoSeb0xUxRBv1OntAF72j9lW4OJ4+fMbFjTy+0nT6o3hY0NEZLrJq2bA/6WuC5O+72o+cjgFnMUItrwJyz4RpyjJsmeexcrykHJJUHoZe/GS0mVsZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5hPzmw2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5hPzmw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034912; x=1759570912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T7UxU4p5GUU0R8QUQqUhO1GmL5eGB3g4pm7kyjBvI68=;
  b=H5hPzmw2E505shxAkhgH1MHr4oevgQbSPs+u12zQ0si4xC4hUpJK2DQp
   NgvujiDSzq9SuDkXl0yByMbhDgDnAVUhXea6wfFNO2erH8lAGeexAhdab
   S3Jl32hooDW/Qdsy3GN/QG+PDbHcYBv0Ysq9Rl18H2sgRZk+uO26Lhx9L
   xtQAFFdjZppmE7dludZvEB3SJ+goOeceaSSswuwGImXO2Ht5eYfWtTHEY
   ngNZJmEKncTrupDoXhNrW49RiwPHoseBpVRWjMrQwzArjeZV3nnDhjB5o
   K9y90/MC+arhcdUgl4iBFmSaJkFuAfN4xAtztcAE9J1ZvKs37EI02YY2e
   Q==;
X-CSE-ConnectionGUID: sOdhqHfvRN2OpbLv2onsMg==
X-CSE-MsgGUID: iANEwbBKSEilo8saHJAI8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136203"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136203"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:51 -0700
X-CSE-ConnectionGUID: XIHl9puaTPitVWw3DxXE2w==
X-CSE-MsgGUID: xabiGmZPQeuxe0aLB/1RZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492087"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F3869120C57;
	Fri,  4 Oct 2024 12:41:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoi-000Tfz-3B;
	Fri, 04 Oct 2024 12:41:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 42/51] staging: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:44 +0300
Message-Id: <20241004094144.114065-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/greybus/gbphy.h       | 2 +-
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..afa0c2a1e683 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -86,7 +86,7 @@ static inline void gbphy_runtime_put_autosuspend(struct gbphy_device *gbphy_dev)
 	struct device *dev = &gbphy_dev->dev;
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 }
 
 static inline void gbphy_runtime_get_noresume(struct gbphy_device *gbphy_dev)
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index ac398b5a9736..91c565f9a446 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -660,7 +660,7 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
 	pm_runtime_mark_last_busy(rkvdec->dev);
-	pm_runtime_put_autosuspend(rkvdec->dev);
+	__pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }
 
-- 
2.39.5

