Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AC921731F
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731008900; cv=none; b=aYn3N918+rbhxUZ+Cq9jIKi2TY7ksUPgfQD+KhEwDuJbBJs8MjG/KBwoK472fyW/quVPgAiUW6rCPSt9m/75FywaT3Kvmpm4xpa47zSSLhxN1ID6oFubZmwvdaNVnZvFEVFl8Vkoqrm2JyCVAP+OUfM+MXDyrHIZtRJALfRJ2T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731008900; c=relaxed/simple;
	bh=GZ3n4cGUFb9X0QXdd9Kdf3Hk/WUzfeCTMfx/Vj51ysE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUaAOmmOlyx8ZYvtxGU1A2vLGEz60hrqaiDpk6Crzhdfj5AnoGArNtCjc+hoWYpKDwihx+lP5VKyH2TT0WlvapOpkc1mJQQ8HgvIGNqxaK/C8xIvB7H2oM8BBrn+1yuZybOBw9cK6q5HwDiClrfgIO8UrWx27sQ1BsTcGuYS8A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jXjBq2Jl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jXjBq2Jl"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:c173:4b:4a04:3a21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA73822A;
	Thu,  7 Nov 2024 20:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731008886;
	bh=GZ3n4cGUFb9X0QXdd9Kdf3Hk/WUzfeCTMfx/Vj51ysE=;
	h=From:To:Cc:Subject:Date:From;
	b=jXjBq2JlXpoAA9J7MX0LWSdJ/tjY8Pl5LCVuMjW9T9lJd8RHkA1frsHXyT4ssxyyc
	 R+9exTw54vl3e1iIZeq9grpedm/NOYSUBgHiAJku7yylySTRLmF5Qrkv7afqOobhB5
	 xJ8/71lKtccCxAqsbQ62NSlB5tL/3HAcYHBtqVO8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/3] staging: vc04_services: Assorted fixes
Date: Fri,  8 Nov 2024 01:18:03 +0530
Message-ID: <20241107194806.90408-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assorted fixes for headers and TODO file

Umang Jain (3):
  staging: vc04_services: Cleanup TODO entry
  staging: vchiq_core: Rectify header include for vchiq_dump_state()
  staging: vchiq_debugfs: Use forward declarations

 drivers/staging/vc04_services/interface/TODO             | 9 ---------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h       | 2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_debugfs.h    | 3 ++-
 3 files changed, 3 insertions(+), 11 deletions(-)

-- 
2.45.2

