Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265CE84A4D
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026477; cv=none; b=Bgi5fkR+C6UTOgaXxDi1foKctbMaPI1TF/Z/k9lkFHCe8vitWA9Nk5PB3CXwC3csPhltKeNei6rjSGzB1CYTii6zlyEIX0yGMMiJz8ajiMisJIDsJ5RQqqRQL+BorWAs3LA/dsWC0uj6POVuaUoODzOe0prIEgo9wGJ5y9RJa1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026477; c=relaxed/simple;
	bh=NB9CX1tldNp1yQQ+n51L22Dkp4b1f49h+S/vCTmlRc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tI3olksunpfd3Z8B1vl+2Tfj4SLUgc2QayuBMit9GXViqditK1zvWerBb7/7Z+6XQIvsbsdEVZ5jZIaCztmuwNSMUXt8WGK9usT9MowiOGw+iA9YfBG57dV/vP/oCtyG3I7yTog5LuLGB8i7a3MPviNaUUTl/gp7i48eZ45EiZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mOuHvs15; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mOuHvs15"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6D4A7E9;
	Thu, 21 Mar 2024 14:07:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711026445;
	bh=NB9CX1tldNp1yQQ+n51L22Dkp4b1f49h+S/vCTmlRc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mOuHvs156L1cVTIHzkyhMgGB3JhNZo0fzUMNcUmqt+u/y7T1bmHBNn3XiWn3CpJUc
	 VHpCDgjq8N2oVFuTiGKtrUSKLw7u9w+8suk5NA0R+i0ZLaODwDhKVttYgc0ZktSFjS
	 4mfqeJkkh6YgN6XYnnqKnsb/NdTPHTW6bN4vYa2Y=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 1/5] staging: vc04_services: Remove unused function declarations
Date: Thu, 21 Mar 2024 18:37:33 +0530
Message-ID: <20240321130737.898154-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321130737.898154-1-umang.jain@ideasonboard.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vchiq_loud_error-* are not implemented hence, remove their
declarations. This seem to be remnants of custom logging helpers
which were removed earlier.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h  | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index c8527551b58c..5fbf173d9c56 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -470,12 +470,6 @@ vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *
 extern void
 vchiq_dump_state(struct seq_file *f, struct vchiq_state *state);
 
-extern void
-vchiq_loud_error_header(void);
-
-extern void
-vchiq_loud_error_footer(void);
-
 extern void
 request_poll(struct vchiq_state *state, struct vchiq_service *service,
 	     int poll_type);
-- 
2.43.0

