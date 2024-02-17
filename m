Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE7B664BE
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169103; cv=none; b=HE0vmLlRB0d+g6KI0ObKykdDExk2i1fGeQZNdzOPhNKBVu1NHEHYUT/xDjWfniF90IF3HPJgQOko3foaxUU8pdZWTQcHvLpGDuWICLTBicFj26xohMVgxXXsUcwG/qOdI+inGsrnwXU3eBfyGGMelYXR4QkPsy6vNuGC6VI5tqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169103; c=relaxed/simple;
	bh=az0juSVxRAm+2xPusheL0MEA2fzlp8Nt4iN47vXYwV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5NKS2IMTkk0SzSnKqKiWlN6h5vZvyDpqcP5TNfEQm3q9xLEQGKaOIrnWC7AOjXVwgZGOe5dQZ2kksCJvXogosbwWE7Ut4F3A6+BMGyxYe6O6qcw4qnZni92MS7/jRtnQ7T76jL+nuE7gsP4SN97wx2LNpT+WGwwN7vNlIBY8Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Su8FXpSu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Su8FXpSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aLyDg+vKCWtQHBB/yP8t49hpe+D3zz4E/SvOD24Eu0c=;
	b=Su8FXpSururR67p2u0zkrUvkJu3U8lvIJ2+ohpMSYTx9jPfVtHxxPpUPau4jLOBdF8L00w
	wesKFa8zcSTcrnc0+4GoPxT/Xw8OfMAIrqQxQ0eYhEEgpnw8dVmeYz8d5lOIeA+wYHbQQp
	ubr1HSx0aoeKOPorWLzS6q6pcbCJcCM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-zNfwzdCpOjOGU9dMbvtq4A-1; Sat,
 17 Feb 2024 06:24:58 -0500
X-MC-Unique: zNfwzdCpOjOGU9dMbvtq4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6750D3806707;
	Sat, 17 Feb 2024 11:24:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0D241C1C7E3;
	Sat, 17 Feb 2024 11:24:55 +0000 (UTC)
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
Subject: [PATCH 7/9] media: atomisp: Change ISP subdev name to "ATOM ISP"
Date: Sat, 17 Feb 2024 12:24:36 +0100
Message-ID: <20240217112438.15240-8-hdegoede@redhat.com>
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

Change the generic "ATOMISP_SUBDEV" name to "ATOM ISP" to make clear
that this is the subdev for the ISP itself.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 8253b6faf8cd..822fe7d129e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -799,7 +799,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	int ret;
 
 	v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
-	sprintf(sd->name, "ATOMISP_SUBDEV");
+	sprintf(sd->name, "ATOM ISP");
 	v4l2_set_subdevdata(sd, asd);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
-- 
2.43.0

