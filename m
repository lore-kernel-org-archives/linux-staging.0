Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE2F323B
	for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O191TYgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/D5kn92EyIN4VJYiMHV5JLGxxxixiL9iUiAsEf8zGsM=;
	b=O191TYgMR8zd4ZhFbwk7psKeCKBUY4998EFeb5GCjeU9mTfViJwNhSr9A2tBrrf54y3FXf
	g+29nKUBpssMJI9/4jHtKa4dN91tkyKQCXkbPcT5RBmv07q7RvLL4zxyWxXgr92enBLH47
	CWIMldZaG8A/KJvsQLSzXWZTlrvsJWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-ENkHbEGaOL-1Ps9WN0biJw-1; Sun, 31 Dec 2023 05:31:13 -0500
X-MC-Unique: ENkHbEGaOL-1Ps9WN0biJw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F7A833944;
	Sun, 31 Dec 2023 10:31:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C31E492BC6;
	Sun, 31 Dec 2023 10:31:11 +0000 (UTC)
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
Subject: [PATCH 03/15] media: atomisp: Remove s_routing subdev call
Date: Sun, 31 Dec 2023 11:30:45 +0100
Message-ID: <20231231103057.35837-4-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
References: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

sensor drivers do not implement the s_routing subdev call, so there is
no use in calling it.

Also the 3 0 arguments are not the arguments which a successful
s_routing call is supposed to take.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 404317f6c57b..85d0847d7e1c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -666,14 +666,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		return ret;
 	}
 
-	/* select operating sensor */
-	ret = v4l2_subdev_call(isp->inputs[input].camera, video, s_routing,
-			       0, 0, 0);
-	if (ret && (ret != -ENOIOCTLCMD)) {
-		dev_err(isp->dev, "Failed to select sensor\n");
-		return ret;
-	}
-
 	if (!IS_ISP2401) {
 		motor = isp->inputs[input].motor;
 	} else {
-- 
2.43.0

