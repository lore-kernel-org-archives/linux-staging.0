Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D3F657AE
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169100; cv=none; b=Hnqk5F6OjoouLwJmDvyBLJjTp9WjJWrvFMINHSBJPLMxpk3yby897ostWVNSzf7UG3ViFhpzVoqVvB/5DXPMO7MP2Q9YYzOHv9rN3sis0rfi2yAXWGXJbjnXulAcsXXKWmxpecmUUXgPlOKZV8VwUGnzd5eKdjyotuBW3AH8gkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169100; c=relaxed/simple;
	bh=GhHWTQah4qAfwcyOiKugTZYg+iNzrMhg4TO18/Rhp7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFjpL50x0FCojGLiHiC0s3nFYCVRKhE3P+9ac47kRPhzxIipZzpJlkviWdg5YmWDNC4v9Btsohkx+V+sPkSWEMRJdtDTNjXlODw/ytKdGggG1VQtlBvf19p4DaEnzEU/FfHMoxC5ZO1S9/3d0WY8QzPlY4XCYYbiq2rhSbhphkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P6tM3CWc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P6tM3CWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJYlabdakQKxlJf7c7KUDCD4THOgNbpITlRwUK0S6Pc=;
	b=P6tM3CWc9c29W5oMBktSYWTo/hL9inTAG50AP7YFCUa8e1y8yMjI59eMt+d5tlcesamKrO
	lhjHUX9iaHON1lpfMvQMfwmRvsUBHYh2i2pWhhXSWYKOlaEW9K2NxFicdtkXxKrh3AMMUU
	ftMvwKm/UiMb+6W039y7KY9fJv2qWcg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-PcI-C41HNIy1inDFWs4NyA-1; Sat, 17 Feb 2024 06:24:54 -0500
X-MC-Unique: PcI-C41HNIy1inDFWs4NyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06E3E811E79;
	Sat, 17 Feb 2024 11:24:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0191C1C7E3;
	Sat, 17 Feb 2024 11:24:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/9] media: atomisp: Stop setting sd->devnode for the ATOMISP_SUBDEV v4l2-subdev
Date: Sat, 17 Feb 2024 12:24:34 +0100
Message-ID: <20240217112438.15240-6-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Stop setting sd->devnode for the ATOMISP_SUBDEV v4l2-subdev, so that
a proper /dev/v4l-subdev# gets created for it.
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 8293bda0c681..7f1ca05ce54a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -802,7 +802,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	sprintf(sd->name, "ATOMISP_SUBDEV");
 	v4l2_set_subdevdata(sd, asd);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
-	sd->devnode = &asd->video_out.vdev;
 
 	pads[ATOMISP_SUBDEV_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	pads[ATOMISP_SUBDEV_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-- 
2.43.0

