Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53003822BF
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526877; cv=none; b=FwF+XrAC2N9BM4QJG8P4nW+XfNrKDUgGlonM7DBrxkJLLL6Mrtl/RfwAY0OzGOBuxpfevl7J/XWXSNPWfjl1R0yJTLU8+vjLd8OpPx0GzNS9kiBSjbqAsynUSztpFVJ3HCZUI5+pT3BOmYkP/lqftiunZGUHJqmck+jVMsdvRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526877; c=relaxed/simple;
	bh=sTWtD5SzQgvqS78bcuDm/xtsYEq+rjZSm4SHO40tiXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASXo++ky2cM1mwEjeDzgzEDbhlXZGXkkaAWou7NhHlmynCW1cLWiC+sUNU73ZElUZPxFyknIxfO7Bzja9BaUpZK9D7LdXy5G98w91+AKD2RmnoRF9pPZe4Ocu2D9Jl4wDOp/llIAwjJMZPfjMymS3wX7C9rhiFm8OXocbBbU4rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxvUVBsO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxvUVBsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772526876; x=1804062876;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sTWtD5SzQgvqS78bcuDm/xtsYEq+rjZSm4SHO40tiXQ=;
  b=nxvUVBsOnOvD3BX+MUUgTHf00ZNdj994P31IWHxeSyPrSqGDzbm0L7aG
   8JboKc2XlFvhfFPifDUDTB5No+yf38+A3bVd9jKGkhaEAvluPPE9Qmomi
   LiJFX8fg8UH/CHxHAoZfENUwpYft9Ed5e6PfmVUK/ko3/dY6TeQKrZb4K
   /rhQtH5+ofON1rTzsM3hzfCeAt8sQZN0vQY5wq35MwYiX1k0j33ww5JQi
   2JmK+iVkb1/xCkdjWKX13nHmUAYYXR/WT8rdC/iW5vzWUp6LKxMTQoYxb
   Du+YK4jm1AHZf7AKwXnVMhAifcOiQirGZ0lXPQhWyAWhdyddtT7163rn5
   A==;
X-CSE-ConnectionGUID: +NwfFl75Rl+Iil7EWPYfgA==
X-CSE-MsgGUID: yMlIDNzKQA6ixsMg3tqdmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73666473"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73666473"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:34:35 -0800
X-CSE-ConnectionGUID: a3Coc82mTbmMh0gj35teRQ==
X-CSE-MsgGUID: 0kGHl8PKQ12vLMdNT4iW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217168127"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:34:34 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71AA8121D1D;
	Tue, 03 Mar 2026 10:35:01 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vxLDZ-0000000GJAU-0puq;
	Tue, 03 Mar 2026 10:35:01 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
Date: Tue,  3 Mar 2026 10:35:01 +0200
Message-ID: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disallow all private IOCTLs. These aren't quite as safe as one could
assume of IOCTL handlers; disable them for now. Instead of removing the
code, return in the beginning of the function if cmd is non-zero in order
to keep static checkers happy.

Reported-by: Soufiane Dani <soufianeda@tutanota.com>
Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com/
Cc: stable@vger.kernel.org
Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index a7f22de1c889..50366bf10f32 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1356,6 +1356,10 @@ static int atomisp_s_parm(struct file *file, void *fh,
 static long atomisp_vidioc_default(struct file *file, void *fh,
 				   bool valid_prio, unsigned int cmd, void *arg)
 {
+	/* Disable all private IOCTLs for now! */
+	if (cmd)
+		return -EINVAL;
+
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	int err;
-- 
2.47.3

