Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42E12F3C36
	for <linux-staging@lists.linux.dev>; Fri,  4 Jul 2025 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615705; cv=none; b=HT0ZEjSEJ/+HQKWW2zrPHvwK6ev19dqLfqjJVHuMarotelPAWgqv4m21WHH0gn6iyC06L+Zz8bykswZCZInv5ePHpwMebEUAUAa752pudewISc4vvI8j0Wf0UlLPwTELclkR1WDsaMsyy/4i7Y0exMYekp3tTpRNhH+83vvnIl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615705; c=relaxed/simple;
	bh=jYjiHNs7+nnRhnxWuagXuOKoGclwye4obrP5Szc2NG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uXrjgLWXNfPaIAP/7fGbrJud7+D8VyzwP04OYDaQIuMVzxB27z9B4ORM3Qzt1TvFiNQHeE8uo+AblkD4VS19DI8ExSSKtHnUrGST3RV1rbPq1I6HZTUp1SqhIXs1F+VDF+R5oRl0t6wWB5UTWjKeDgBrcWZqk2q7B0RNNXTEOqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKkpoiG2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKkpoiG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615703; x=1783151703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jYjiHNs7+nnRhnxWuagXuOKoGclwye4obrP5Szc2NG8=;
  b=KKkpoiG22uySWWGI5Jl2D3qqld27e8UPj0kIlEe7ehMP5x0i2tfRydBx
   kW9xIFieaks/0OaixP/dwo8keGk9zVHgppwcz3Bqhtmch2CWu7qvhEy4E
   sEhOFUC4NSqpWRek7Vf+PZQg0DzqFecZX4EGpA9Zyr+G1AZr1GppzUqzY
   jNkKIpiMNMh2Z+ZetOP5WH8uEAZ9zIcD9U2s4Cygz17+88EpOlIgQ1t28
   MynUVf+fd/HhQc6FIyYHjfqlagLvgj4V3UCB+o09GJ4AVjTTWESI3Tvm2
   TWs+HEuBNqo6k9piGIGODGzPFAmokZiGcY4orInnoRM2dG52XcEIj8cO8
   Q==;
X-CSE-ConnectionGUID: dPqx69/xTqO/LQBPT7StjQ==
X-CSE-MsgGUID: R6NOGmOLRS6QpVKhIZeEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194267"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194267"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
X-CSE-ConnectionGUID: yk+YfJ50SW+r/4KA71Ve/g==
X-CSE-MsgGUID: l2mPlxxSSpS0B9pgrJDDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616671"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:55 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 3937244433;
	Fri,  4 Jul 2025 10:54:51 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 64/80] media: rkvdec: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:50 +0300
Message-Id: <20250704075450.3221972-1-sakari.ailus@linux.intel.com>
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

 drivers/staging/media/rkvdec/rkvdec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d707088ec0dc..445f7c92eee3 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	pm_runtime_mark_last_busy(rkvdec->dev);
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }
-- 
2.39.5

