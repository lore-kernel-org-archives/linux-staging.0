Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C7418EAF
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500233; cv=none; b=H2JYNyRvLPL5kKr4yidYLFTE0nlcLPqo/0Crv4hhoyGkl9joqvFlDZ4qbPYVmMlFqA8RKyJd30g9tcryniuh+1J0UFF+ifgsGqXfIBn+XfSzeLpelnk+FLLuiWM5ChBbzYBiD5h1qcUgjUwLxK/MvnUqySe34sIVERYoXlcvRoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500233; c=relaxed/simple;
	bh=KVv87os0o02Kg39ZkUZNsSpBnFEQddHid2cSWa8Zuno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLr9WSMeOOQzOe8vPuQv+tzpIK1jA1AovAauz7bOF8qtFdT3YBYmIHt/qxTmf3ZlFPKDSZR6+gT+CnhstzbJF/onkqhHr8MIvu78ZIO2hZj1dUD+EwTR6kNckZICwUrDVAFR1Phdx2Jj9TONBKSb0MmLHVyei3TrLXqoKyD4aEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C6gPju5i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C6gPju5i"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7C0DE4;
	Fri, 15 Mar 2024 11:56:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710500206;
	bh=KVv87os0o02Kg39ZkUZNsSpBnFEQddHid2cSWa8Zuno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C6gPju5iI5GrjzPF93RZBk4Qx/JqPRQ3LT9Qh1NSQioOG5iOSjw/nbHa0x0zCt4uY
	 fo7CwTBUOS3sLXpJOs2GHpUqEbVliiMytXHoXNYPJbFz+g6y53I/WGQ8WjqKMN1+cB
	 9XFfXQdj2BuVAqeDveMi5haRFtvIyRgzVN7K7a8o=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/5] staging: vc04_services: Remove unused function declarations
Date: Fri, 15 Mar 2024 16:26:55 +0530
Message-ID: <20240315105659.111544-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240315105659.111544-1-umang.jain@ideasonboard.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vchiq_loud_error-* are unused hence, remove their declarations.
This seem to be remnants of custom logging helpers which were
removed earlier.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
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

