Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F405208D77
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083758; cv=none; b=fEmD90trjffV6yHY4md2reECu2m4PDWpjbQQsSASgA+cVGcW54+BCIqwsVc+yWUJtTj7h9EQ/cMd85++8wrlRXBEqeN/T+F/QnKteFT/XOwENY0JXHwurVnYfbpQMvehZ+/u/xRI4hzyLeH1VzwE+4r2OexxNeyQKGg5drqphxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083758; c=relaxed/simple;
	bh=9U+Pdo3QeHZ4CzgnlEsxiTkvWi3GjRDjQG+pAMqgyLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FCaysrywzx7e8lsvexrv5FJXAAs9JF6/fzSkunF1tlbzy26FOiOMnnQjMMdp7qrnyB/PvItd2lEiqX1Uv6VtIkbpeSGwmNdKLvwJMvI2DNW5XC3UKaTcP7gos2Wq4NAcDBddz0L3+/WeMhPB3OFkxIiLwvml+q5aXCkOgWnTyFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BAoXMe6+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BAoXMe6+"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CC9AA2F;
	Wed, 16 Oct 2024 15:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729083651;
	bh=9U+Pdo3QeHZ4CzgnlEsxiTkvWi3GjRDjQG+pAMqgyLs=;
	h=From:To:Cc:Subject:Date:From;
	b=BAoXMe6+a4TsrrC4Mom95CmVfZGgLc/M1KOu4VCCodjP0PhgAb20Gcni6+GDh6G/U
	 +/tKZ5MfvvUSpRdmNG6Ovc1WXdO2vUc79NyiN4chmKdBOulSEOSe7iVHih418Jer78
	 wNfvCUZdEmkRqTt1lb+9JA4Uo3pktOgAINR7QHl8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel-list@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v4 0/2] staging: vchiq_arm: Two memory leak fixes
Date: Wed, 16 Oct 2024 18:32:23 +0530
Message-ID: <20241016130225.61024-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two memory leaks were identified and this series addresses those leaks.

Changes in v4:
- Make commit message's subject un-identical
- Fix a spell error in commit message

Changes in v3:
- Add Fixes tag to 1/2 as well.
  (Suggestion by Dan Carpenter)

changes in v2:
- Split patches into two

v1:
- https://lore.kernel.org/linux-staging/b176520b-5578-40b0-9d68-b1051810c5bb@gmx.net/T/#t


Umang Jain (2):
  staging: vchiq_arm: Use devm_kzalloc() for vchiq_arm_state allocation
  staging: vchiq_arm: Use devm_kzalloc() for drv_mgmt allocation

 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.45.2

