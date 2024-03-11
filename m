Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EDB4AECF
	for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710198979; cv=none; b=Kdm1y+JI+q1jobuyh5UnUB9l7yorV+nTy0WBevbhdS4OoMjYb93so90e1rEYmXqw6rAURs4G+bjl5BHW9bd/SFy+enB1nepCv8+QJ2i3/KZzKjRses+kyyZ8Vi34EFTqLPilx6YjFq4nFB1t/SKZwIHcudKFLqOdapRiQJDSThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710198979; c=relaxed/simple;
	bh=UU5UBZwdm4tFe9XUC5mwtmwB97K9qQcYZOBEykmnbmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMAEwOCksfd2QVHBSLioRGSljUTNPi3r6ivcs4+qCoj5My8Xm52z4NmXZMPwbbhjOIKh8fmEaC2a+Jmq+6S4g2W/pW7eMKQKZ+KI0YTZU2Ar9qitK/gro5+6+5picy7KEgnXChzranJMVXCYq3L1z1tpMgNzjBhW6TmCRp1gbck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rfu99oiP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rfu99oiP"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A607A842;
	Tue, 12 Mar 2024 00:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710198953;
	bh=UU5UBZwdm4tFe9XUC5mwtmwB97K9qQcYZOBEykmnbmw=;
	h=From:To:Cc:Subject:Date:From;
	b=rfu99oiPzO4hhO0Y4BERe7qay22RTmbMr/KODI17Vvt2W4rdXSz3mTpYtDhurhGMO
	 hwqSJ2TzvwdujiOLU494XDPSmHwrwDDpNILGlBegXQHfYdj2C4e9toe1Ft50u8OOCw
	 tov40ah5egiJb8sCBPw6XG20aaaSfMGqz55Liycs=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/3] staging: vc04_services: Drop remaining global members
Date: Tue, 12 Mar 2024 04:46:04 +0530
Message-ID: <20240311231607.124491-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series works to drop the remaining (non-essential) global members
in vchiq_connected.[ch] and address the following TODO:

```
* Get rid of all non essential global structures and create a proper per
device structure
```

The global members tracks the connections to the vchiq platform driver.
The logic has been moved to wrap all this within the platform driver
data instead so it can be get()ed whenever necessary.

The user of vchiq_connected.[ch] is not present currently, but the user
will be present when we will upstream bcm2835-isp via the vc-sm-cma
driver. Posting a branch for reference [1] to provide and test the idea
behind this series.

[1]: https://git.uk.ideasonboard.com/uajain/linux/commits/branch/uajain/remove-global


Umang Jain (3):
  staging: vc04_services: Move struct vchiq_drvdata to vchiq_core header
  staging: v04_services: Add connection structure to driver data
  staging: vc04_services: Drop global members for tracking connections

 drivers/staging/vc04_services/interface/TODO  |  8 ----
 .../interface/vchiq_arm/vchiq_arm.c           | 18 +++++---
 .../interface/vchiq_arm/vchiq_connected.c     | 44 +++++++++----------
 .../interface/vchiq_arm/vchiq_connected.h     | 16 ++++++-
 .../interface/vchiq_arm/vchiq_core.h          |  9 ++++
 5 files changed, 55 insertions(+), 40 deletions(-)

-- 
2.43.0

