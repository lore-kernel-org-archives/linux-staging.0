Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8484D12E1FF
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 18:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649550; cv=none; b=qHRMgXOHFKDBZ/RWgg1wkbhkmiHJ4IMPCl6pFcDpwYR5SWbML/0yMAmYcgaFkB+FqaC6LdUfIhthN2Qyg8eK/SjYc7xq2LjXOrHcO6wTIXMMo5hQ4MXxS3GwV7CR5rXSzlCWWBYUZ3lUWmht36rZfNH9pN/ihj2G3oVIAtoOdOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649550; c=relaxed/simple;
	bh=vNYgd3ynhZIIIPg2T/ZknSWquElbXTBGCadgjCGh1KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQGgvc484BPKhvoukoo7th6Vor5HUwIyiJOapranVIyuQuZZFmwMAF9kroOsbOWSP97Byt2EkKZa50p/XkKt3vvmIYyowHS8N/I5PU8UCKPDYOuB3q/bTIJW+OH9mK6s8TdPSqkJuqbrw+WEl6PPycjvV2Bx822mHE7bTX+3/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EBRNvKpu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EBRNvKpu"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 114CE475;
	Thu, 28 Mar 2024 19:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711649514;
	bh=vNYgd3ynhZIIIPg2T/ZknSWquElbXTBGCadgjCGh1KE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EBRNvKpusWNE1+s2IC7MZ+YYkMhKH66CmuC77T+uwPrsjWODjuVNo5jbj95KFbNng
	 7F0DYPCw0PnRMLOA9ZOBb5GOecYbCl/zlGsaSyCVi/l/mz+F+yCEUpjEkBcx2uEJ7/
	 CtwX1LDn9U5HabXe/NyXCMNQc8/HrZs6dPAu/Pv4=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4 11/11] staging: vc04_services: Drop completed TODO item
Date: Thu, 28 Mar 2024 23:41:33 +0530
Message-ID: <20240328181134.1548799-12-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory barrier comments are added in
commit f6c99d86246a ("staging: vchiq_arm: Add missing memory barrier comments")

Drop the respective item from the TODO list.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/vc04_services/interface/TODO | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index e8acbc21ee10..dfb1ee49633f 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -21,13 +21,6 @@ some of the ones we want:
 A short top-down description of this driver's architecture (function of
 kthreads, userspace, limitations) could be very helpful for reviewers.
 
-* Review and comment memory barriers
-
-There is a heavy use of memory barriers in this driver, it would be very
-beneficial to go over all of them and, if correct, comment on their merits.
-Extra points to whomever confidently reviews the remote_event_*() family of
-functions.
-
 * Reformat core code with more sane indentations
 
 The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
-- 
2.43.0

