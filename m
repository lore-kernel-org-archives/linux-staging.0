Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C091BF7E5
	for <linux-staging@lists.linux.dev>; Thu, 10 Oct 2024 10:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728555809; cv=none; b=H7vCkgFbL5stXWoq8W44VyAwIrhU7P4ym2i415Yi62CaXapDgG0NLY9t+24yEY93OofkniPyN+qsmkR7VyVfcCLx0urpo4llJVgUVaWHz1FELqGHvjIVntzQAOOo9tOBqnx1VQsXQtDO6rNvwSRrtIQuyuwR66ZJWgXRlWiOQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728555809; c=relaxed/simple;
	bh=4qm2O/FvqUhv43GxGytOJmIEyUznWr9x7uzfJeQeBL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=igeE97Pjt5ziRm6kTdNrQQIp15QW/pXzCZuGRlyyuaLjfTPi4xJcoaUBHJGxEThrK55fFD1cYRyTbSjhLSXCxpuZx2NtebdmdqCpKkIXbwScyuEDT7Bl7HqCXzL/Qh3EjvVndtQSPejVGxYzD7ScIwW6isRJJWmR5VVULTzFFTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qtnIIL7a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qtnIIL7a"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D13419CA;
	Thu, 10 Oct 2024 12:21:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728555702;
	bh=4qm2O/FvqUhv43GxGytOJmIEyUznWr9x7uzfJeQeBL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qtnIIL7a8yAcyXXOmAc8zcyCWaTbF2H7q6WIfcBQAlAUj9YSlJcQqAvDjlo7LLOGQ
	 0npD4eLwE3TWDVlTVZS8dwqpWViDSxaW1ViHO1k8eZeu09T3vGLn0Egc3jyoDmaAAO
	 2nKNJl7yAcuAuGrMiiGTse9K7rSBnkPUwANefjco=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/5] staging: vchiq_core: Indent static_assert on single line
Date: Thu, 10 Oct 2024 15:52:46 +0530
Message-ID: <20241010102250.236545-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010102250.236545-1-umang.jain@ideasonboard.com>
References: <20241010102250.236545-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two static asserts are under 80 columns width, hence indent them
on the same line.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index dfd68d853214..1e4b2978c186 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -70,11 +70,9 @@
 #define BELL2	0x08
 
 /* Ensure the fields are wide enough */
-static_assert(VCHIQ_MSG_SRCPORT(VCHIQ_MAKE_MSG(0, 0, VCHIQ_PORT_MAX))
-	== 0);
+static_assert(VCHIQ_MSG_SRCPORT(VCHIQ_MAKE_MSG(0, 0, VCHIQ_PORT_MAX)) == 0);
 static_assert(VCHIQ_MSG_TYPE(VCHIQ_MAKE_MSG(0, VCHIQ_PORT_MAX, 0)) == 0);
-static_assert((unsigned int)VCHIQ_PORT_MAX <
-	(unsigned int)VCHIQ_PORT_FREE);
+static_assert((unsigned int)VCHIQ_PORT_MAX < (unsigned int)VCHIQ_PORT_FREE);
 
 #define VCHIQ_MSGID_PADDING            VCHIQ_MAKE_MSG(VCHIQ_MSG_PADDING, 0, 0)
 #define VCHIQ_MSGID_CLAIMED            0x40000000
-- 
2.45.2

