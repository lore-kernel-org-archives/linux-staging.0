Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9EB14B090
	for <linux-staging@lists.linux.dev>; Fri,  6 Sep 2024 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725607529; cv=none; b=f+xS4P0wswQSSLhGEBdWNFvXbRBbXYU9wy2amv/w/pQbP6e5eV1+p3WC/qC9qhjODnJv/7Hh0sfLfA5pDzh4NOCVzksPGD7QEDuzZ2uuDj0ZviFo+ZxNJXvpjfZu3A2VCxFneyPyiKgWLmApx1+7l+KVAmtmEjwA9wt1C2htnXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725607529; c=relaxed/simple;
	bh=K1WcmrcLbEELBSkrxY1A3Spx7Lfdyu+4/yUq696iEAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z6Q3PlYzuB3sYPqpYnJDuPQ35D3j5XGXx8P5yq6T6fqM5C84sUIq/5kdz6H+fj+FVENw7PbogMba4koFnqg9mUYfL8XM2jskpD/tWNrYgchScU1SZnSFbxyViuoY4vipn/JQGoyLii4xO6xDXQ08+9v7hFFMTjtNQMzo0u7umvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jbqABgOB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jbqABgOB"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:c173:4b:4a04:3a21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A018FEF3;
	Fri,  6 Sep 2024 09:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725607444;
	bh=K1WcmrcLbEELBSkrxY1A3Spx7Lfdyu+4/yUq696iEAg=;
	h=From:To:Cc:Subject:Date:From;
	b=jbqABgOBBaoWeQRIINe/jW9ME8XGFVSmDB017NiuuUsKkMUC30vo/iA35Gahf9YMr
	 1CFD/fb6PkuFwEghTLK9Z09UciEqyVwsIAijaYClZQIDGfqokZiS84tcPSn2gUjZ/x
	 C8gqsY0J6UJT0BR4X1TpKaA6Q4h1uNvgLNItku5w=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v4 0/7] staging: vchiq_core: Refactor vchiq_bulk_transfer() logic
Date: Fri,  6 Sep 2024 12:54:59 +0530
Message-ID: <20240906072506.174026-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Series mostly refactors vchiq_bulk_transfer() code according
to Arnd's review comment from [1]:

> You can also wrap vchiq_bulk_transfer() in order to have
> four separate functions based on the different 'mode'
> values and have them only take the arguments they actually
> need.

I didn't wrap vchiq_bulk_transfer(), instead created four
differnet function, one for each mode.
This will pave the way to address his second comment:

> Ideally this should be cleaned up in a way that completely
> avoids passing both user and kernel data at the same time.

which is not part of this series and will be done on top as
arguments shuffling will have to fix the sparse warnings
that exists currently.

Patch 1/7 first moves the VCHIQ_BULK_MODE_WAITING logic out
of vchiq_bulk_transfer

Patch 2/7 then moves the core logic to vchiq_bulk_transfer()
which can be shared in subsequent patches

Patch 3/7 and 4/7 refactors remaining bulk transfer modes

Patch 5/7 finally drops the vchiq_bulk_transfer() as not needed

patch 6/7 and 7/7 are drive by patches, noticed during development.

[1]: https://lore.kernel.org/linux-staging/3d3b7368-93b2-4c0d-845e-4099c2de9dc1@app.fastmail.com/

Changes in v4:
- In 1/7 return 0 direcly instead of assigning status = 0
- In 3/7, fix null assignment of bulk waiter 

CHanges in v3:
- Directly return if service == NULL in 1/7 and 4/7
- Drop set-but-unused variable from 1/7

Changes in v2:
- Directly return if service == NULL in 3/7
- Prefix non-static functions with "vchiq_" (appropriate driver prefix)
- Use typed argument for 'userdata' in 1/7


Umang Jain (7):
  staging: vchiq: Factor out bulk transfer for VCHIQ_BULK_MODE_WAITING
  staging: vchiq_core: Simplify vchiq_bulk_transfer()
  staging: vchiq_core: Factor out bulk transfer for blocking mode
  staging: vchiq_core: Factor out bulk transfer for (no/)callback mode
  staging: vchiq_core: Drop vchiq_bulk_transfer()
  staging: vchiq_core: Remove unused function argument
  staging: vchiq_core: Pass enumerated flag instead of int

 .../interface/vchiq_arm/vchiq_arm.c           |  20 +-
 .../interface/vchiq_arm/vchiq_core.c          | 319 +++++++++++-------
 .../interface/vchiq_arm/vchiq_core.h          |  16 +-
 .../interface/vchiq_arm/vchiq_dev.c           |  15 +-
 4 files changed, 228 insertions(+), 142 deletions(-)

-- 
2.45.2

