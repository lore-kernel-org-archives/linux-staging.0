Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573982E7376
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617722; cv=none; b=mh0XJFChcyhpp41tdWS6OImapw102ypqqLLLq0PE7EFpnMqHYlcpR/asvjxo2yUKjzB7nCDt4fg7oQ+54vpzfWLtR+RWbZAX8TnjLwKTQHyzPwT91sfd1e+zPcd785vXd/rGDB3AIanAAANxixaD5XIfumUKyApm7ov9izEypk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617722; c=relaxed/simple;
	bh=ZLf3JWyRJ4ZMlPlaKgsDjHJZ1+zely5V+Cx9SYvUC6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BN3cRbfxjhuI6YjOIu8C0vBY4WA+hO7N57gEGpttVmIGOo0mBJaTp8w+GYVImcafZ58OUXniOarmWTE7zuFVJOqp3cks4EoWEOa0TIrbTERe9dVrA+ND+3nJcZ7d5F9g81vf3bSA2vuWf6tUQBiisEQO5/62JyAo+NazD+dfvlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=UyixYJAT; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="UyixYJAT"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 429ab32a7;
	Tue, 16 Jun 2026 21:43:21 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	error27@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>
Subject: [PATCH v3 0/2] media: atomisp: fix probe memory leaks
Date: Tue, 16 Jun 2026 21:43:17 +0800
Message-Id: <20260616134319.3969928-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed0ac1f2603a2kunmea38caa144bbe
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0tMVhlKSBpPSUpKGhgeT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=UyixYJATlchTC72LjI68aMEjO/yUWElXsPUiHFginsLZq5pmpfC5SptEtlg4OUKR8KtSbgCYjeWLKJd1AbRPStaBB4Rs9LXJkE7P4XaAxJWz7XDk4/3gKRf+exsPFj7z1BmxxCrPUAnQoaD4JX5xxEZ0143AiHbz1sCautLIjy0=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=ffCh9oL1e0EAcHuPsDW71SlmsWGjbc+hxVo6fDlA5d8=;
	h=date:mime-version:subject:message-id:from;

This series fixes two memory leaks in the atomisp PCI probe and adjusts
cleanup paths.

Patch 1 fixes the cleanup boundary for media entities created during
module initialization. atomisp_uninitialize_modules() did not release all
module-owned state and instead left some media entity cleanup to unregister
helpers. That split is incomplete for probe failures that happen after
module initialization but before all entities are registered, so the
module cleanup path now owns the corresponding media entity cleanup.

Patch 2 adds cleanup for the V4L2 async notifier state initialized by
atomisp_csi2_bridge_parse_firmware(), including notifier connection
cleanup on probe failures and notifier unregister on remove.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still present in
v7.1-rc7.

An x86_64 allyesconfig build showed no new warnings. As we do not have
an Intel Atom ISP platform with the required camera sensor hardware to
test with, no runtime testing was able to be performed.

Changes in v3:
- Moved the research background and static analysis explanation to the
  cover letter.
- Changed Zilin's Signed-off-by to Reported-by.

Dawei Feng (2):
  media: atomisp: fix memory leak in atomisp_pci_probe()
  media: atomisp: fix memory leak in
    atomisp_csi2_bridge_parse_firmware()

 .../staging/media/atomisp/pci/atomisp_csi2.c  |  5 +++-
 .../media/atomisp/pci/atomisp_subdev.c        |  9 +++++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 26 ++++++++++++++-----
 3 files changed, 30 insertions(+), 10 deletions(-)

-- 
2.34.1
