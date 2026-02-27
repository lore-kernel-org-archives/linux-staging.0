Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B18344DAD
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184182; cv=none; b=tDfutrrI+nfHADJH1vNJ99t8wMNAONLkzwWhqWmLGfJarxlX2sivYBKEpu1T+Z8RfLD+xmGvUl2UL3fvPyXZ/l11/54bwL7VX7viEkJkr90WvSCWS1GzEMfnD4Qx++vih7hXfGshcsSSE2ZdjDsmASBANFLKrxMclEykmksApB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184182; c=relaxed/simple;
	bh=4YrjaVoyB0tr8XZsLCnIa7KSU/Jpi9Wdr4+cAAjTtDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SIikaMcRCgsvjm6XkaAua2jqiwf4yKVbAPuySYrkWJrn4PwQIv2ktwcKgFU8WoNejcGLHfIwJI3B82yJmZmZMHAsJHsf0R5sIQWQKciFH0W6oLK0CEwjbaDLjaSFrJtxD744mGs+gjMBTBzFzyCcCNNCfCFvqLpoBCNe5d+4TeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmQOui8W; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmQOui8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772184181; x=1803720181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4YrjaVoyB0tr8XZsLCnIa7KSU/Jpi9Wdr4+cAAjTtDA=;
  b=hmQOui8WUGlYSP9+klnKkGiuaO8eH502FZ6bmvxhLKNlUNY+GeEqhLh/
   HD9CY8vC1r+T14GsB2i2MEeUh7F8Aq2u9mEDatGK83RWSoWZj5L8/3iKj
   yjzItcUyDFG/biYSE9iCWXUlUn0GMoGEYYZdcUQvy6agGtnPHLLct6yzR
   VN7yhQbT4T5YPgG8fps73PZcnbj68ViWh8erdEhYpQErL7tBfhvefq819
   17AvvVNIgJ6cQ4+RRBDid9Y69nezFJSEgnr76ScfejqmvOM6udLBdgvnU
   4JKr3JYBJ2PMz1LoFXrNPfhm0m6VlfW4eu/UC/vYwO73wKu7dH7XlDLd5
   w==;
X-CSE-ConnectionGUID: 0JDwRQZ+Rl6dlFO98F5UNg==
X-CSE-MsgGUID: knCzlRF6QlWFjZjkIad5+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73135979"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73135979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:23:01 -0800
X-CSE-ConnectionGUID: i6kaykONQTSWbnlf4agzZA==
X-CSE-MsgGUID: gYJlGCf2Qiu5TiVrND9bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="213734322"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:22:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 73474121D1E;
	Fri, 27 Feb 2026 11:23:27 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vvu4F-0000000FKjP-0ec0;
	Fri, 27 Feb 2026 11:23:27 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLSs but S_PARAMETERS
Date: Fri, 27 Feb 2026 11:23:27 +0200
Message-ID: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disallow all private IOCTLs except ATOMISP_IOC_S_PARAMETERS. These aren't
quite as safe as one could assume of IOCTL handlers; disable them for now.
Instead of removing the code, simply check the IOCTL matches with
S_PARAMETERS and bail out otherwise, in order to ease backporting.

In particular, ATOMISP_IOC_S_ISP_FPN_TABLE is disabled by this patch.

Reported-by: Soufiane Dani <soufianeda@tutanota.com>
Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com/
Cc: stable@vger.kernel.org
Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index a7f22de1c889..78e14c9aeed8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1356,6 +1356,10 @@ static int atomisp_s_parm(struct file *file, void *fh,
 static long atomisp_vidioc_default(struct file *file, void *fh,
 				   bool valid_prio, unsigned int cmd, void *arg)
 {
+	/* Only allow ATOMISP_IOC_S_PARAMETERS for now! */
+	if (cmd != ATOMISP_IOC_S_PARAMETERS)
+		return -EINVAL;
+
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	int err;
-- 
2.47.3

