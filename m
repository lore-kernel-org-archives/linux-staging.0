Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D284C67
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683981161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HkEplNlc2fK+7LvqaNXv7APsTheUIvNpX+DSOhAxqI=;
	b=jHJstTlRfKz5o1MV2+bm/qs/O1i2dZyEwQyAPx1Yd7AF6MkaSNKtIyYaZuM4BhOZo6XcZE
	TzXisUdiMszYAts5s3TNuAYmlQA5RA5XYGYSIDW30Bqj4U3KjYYl2BeqiU9bLw1eHyC9xx
	xl0/rQ031fsRBgTBLswIFZXjmCzTziQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-UD96skoxMKeUyfKlIH-pEg-1; Sat, 13 May 2023 08:32:37 -0400
X-MC-Unique: UD96skoxMKeUyfKlIH-pEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD9A6857E60;
	Sat, 13 May 2023 12:32:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5698040C2076;
	Sat, 13 May 2023 12:32:34 +0000 (UTC)
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
Subject: [PATCH 19/30] media: atomisp: Simplify atomisp_pipe_check()
Date: Sat, 13 May 2023 14:31:48 +0200
Message-Id: <20230513123159.33234-20-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

All switch (pipe->asd->streaming) cases in atomisp_pipe_check()
are either no-ops or never happen:

1. ATOMISP_DEVICE_STREAMING_DISABLED already is a no-op

2. The videobuf2 core guarantees that when we are streaming
vb2_is_busy() returns true. So the ATOMISP_DEVICE_STREAMING_ENABLED case
is already handled by the if above the switch (pipe->asd->streaming).

3. After recent changes pipe->asd->streaming is only ever set to
ATOMISP_DEVICE_STREAMING_STOPPING in atomisp_assert_recovery_work() and
that function holds isp->mutex and always transitions the streaming state
to ATOMISP_DEVICE_STREAMING_DISABLED or ATOMISP_DEVICE_STREAMING_ENABLED
before releasing the mutex. So atomisp_pipe_check() never sees
ATOMISP_DEVICE_STREAMING_STOPPING.

Remove the entire switch-case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 087ec5120bce..08a3d98794df 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -528,22 +528,6 @@ int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool settings_change)
 		return -EBUSY;
 	}
 
-	switch (pipe->asd->streaming) {
-	case ATOMISP_DEVICE_STREAMING_DISABLED:
-		break;
-	case ATOMISP_DEVICE_STREAMING_ENABLED:
-		if (settings_change) {
-			dev_err(pipe->isp->dev, "Set fmt/input IOCTL while streaming\n");
-			return -EBUSY;
-		}
-		break;
-	case ATOMISP_DEVICE_STREAMING_STOPPING:
-		dev_err(pipe->isp->dev, "IOCTL issued while stopping\n");
-		return -EBUSY;
-	default:
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.40.1

