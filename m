Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D36BB52
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182595; cv=none; b=LVPtU7nz7/6F77v8J0G+yygP3q8dT0/PAqH0NJbqVZLu4TZkPsEGTeZg5eJKbd3SBH4aJS7E+1PIgixcLW1Q/+yRxcmRFRu4KducTrOd7STz+/o8l5qPEIjbnsILXXvp4D2IspoqPH5UX8S6XTS2cwxjODuJXv7R9imvJqcoDPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182595; c=relaxed/simple;
	bh=YKSNmJ9meTEoy9zIufeabQgPHINDjfXPuWfRNlPUiaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0ulRDLLgXJJRCHeWMzH1qhTONoxXoPGEteknTe6bagVThkyTDrUZzZFYPtV11lf0z0UaKaiDz8y4MAfRJrCFSfSNK342NVixLsNZsVJMzduhy59k6DaIF+lmpP+Ayf02qRzt3RKlwF3tb4cjjZnWT1wjqptoxiqOtYuIt1/jk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIpBPFCG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIpBPFCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A119hcBTOajWEhL+s5a5KfbuwpEfz7ZsTsceD7xkrwg=;
	b=OIpBPFCGRn/jAiWuuZpCWPh49fYsUqOf5M4h5jRoglclz5YUgUvRHBMTfbBlg/vPk6/tkE
	a9KL+yr7SFarwrtCpMBgNkiwb80eVR0sQKJBr3+R0updPkCfLvVYPteFBe0r6Xjnqc3Jx+
	pWr9WC7eCwxaGKF9dJXpmVTeVIo9XYg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-FQNiPVqGOfG3HSbri9w91w-1; Mon,
 15 Apr 2024 08:03:07 -0400
X-MC-Unique: FQNiPVqGOfG3HSbri9w91w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64BA138143A2;
	Mon, 15 Apr 2024 12:03:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B94AC13FA2;
	Mon, 15 Apr 2024 12:03:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 23/23] media: atomisp: Remove setting of f->fmt.pix.priv from atomisp_set_fmt()
Date: Mon, 15 Apr 2024 14:02:20 +0200
Message-ID: <20240415120220.219480-24-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

This value is not used by the driver, only returned to userspace and
userspace should not rely on / use the priv fields. Drop setting this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 2c95fd6505e0..4ecaded57b9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4412,8 +4412,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	atomisp_fill_pix_format(&pipe->pix, f->fmt.pix.width, f->fmt.pix.height, format_bridge);
 
 	f->fmt.pix = pipe->pix;
-	f->fmt.pix.priv = PAGE_ALIGN(pipe->pix.width *
-				     pipe->pix.height * 2);
 
 	dev_dbg(isp->dev, "%s: %dx%d, image size: %d, %d bytes per line\n",
 		__func__,
-- 
2.44.0

