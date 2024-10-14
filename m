Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17B158DD4
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728900394; cv=none; b=N+KYvIBB+J7WnJCM7CIPJA33VbeGgTrdmeFcq4vhZ6Orh6TeFdptjefK7JzjarYi0uDLh9FggfRfyCoPbcbTutMi2YXgZ21MqpDuO8fmRpiD9i32zhAxZvejLIss1xzlDqZpFG+hUbGDm+QwD9WYwvfMax3TJ0XJG3zcjC8Qkx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728900394; c=relaxed/simple;
	bh=4z4ceNICW5XYgKjbDxsLq86uTYJPt/LJa75nLs8DYV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kG69ayuVa1kyTRI2en2THpwh55YXSdjLCo+qsV4X+JzpaTHUZsbSWQMeZgkur3cOm9am5WukHqqrEev21327+cntHuj57Qq/vmdxFgUHVObnYXloOcPrkQ2lPVeG+NjIeQMIP8hK8L3tyXjgOha3U20XXhd4kXZ580LsH36nUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n4LOA10m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n4LOA10m"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1272667;
	Mon, 14 Oct 2024 12:04:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728900289;
	bh=4z4ceNICW5XYgKjbDxsLq86uTYJPt/LJa75nLs8DYV8=;
	h=From:To:Cc:Subject:Date:From;
	b=n4LOA10mFfXev8JBrVbbSd8UUNk8GHdjSFjpOvusLxrRExTsSAcb7OYLqRmIR9clp
	 W+Wa+Cd9oMwazVXQwNAIcSKed6/KQCt5ZH1+5slJ/Jta/Fav/HDZRQaH1jMcoeOG+z
	 G1xNhYaeTnzTj8j5qZdC58qsbDoAgDD4SZjYonSQ=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 0/2] staging: staging: vchiq_arm: Two memory leak fixes
Date: Mon, 14 Oct 2024 15:36:22 +0530
Message-ID: <20241014100624.104987-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two memory leaks were identified and this series addresses those leaks.

Changes in v3:
- Add Fixes tag to 1/2 as well.
  (Suggestion by Dan Carpenter)

changes in v2:
- Split patches into two

v1:
- https://lore.kernel.org/linux-staging/b176520b-5578-40b0-9d68-b1051810c5bb@gmx.net/T/#t

Umang Jain (2):
  staging: vchiq_arm: Utilise devm_kzalloc() for allocation
  staging: vchiq_arm: Utilize devm_kzalloc() for allocation

 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.45.2

