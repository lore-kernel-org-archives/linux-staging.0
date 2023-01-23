Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740C21C14
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5XYtcdXj+XG93FnkZUSXSf7r0zy7YW2dQ8xxWVppmtA=;
	b=KPEE6mnE+SLJADJoDHB1caUL7MPh5cRiHeL25sUVbp/ZPOVni43U+hHx6ouFTGez2cVaNs
	mowKnZcPOmCXM1NrU9Oaa+tvWs7piPSK0GqJrDEayQcKU1I78WFYMX8e4HIUgyw8gd5KpA
	8tXdYJxDPQed2VB93pWViAUJx7W3smc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-OwON5N0hMUSEVPbE0n5XZw-1; Mon, 23 Jan 2023 07:52:31 -0500
X-MC-Unique: OwON5N0hMUSEVPbE0n5XZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95A49858F09;
	Mon, 23 Jan 2023 12:52:30 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 095FCC15BAD;
	Mon, 23 Jan 2023 12:52:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 07/57] media: atomisp: Remove useless msleep(10) before power-on on BYT
Date: Mon, 23 Jan 2023 13:51:15 +0100
Message-Id: <20230123125205.622152-8-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

On BYT on poweron/runtime-resume the code is doing:

1. Do nothing
2. msleep(10)
3. Start actual poweron sequence

Since the runtime resume can happen at any moment, waiting 10ms
after it does not really make any sense.

According to both the comment and to:
https://github.com/intel/ProductionKernelQuilts/blob/master/uefi/cht-m1stable/patches/cam-0341-atomisp-WA-sleep-10ms-when-power-up-ISP-on-byt.patch

Which is the patch which originally added this this was added
as a workaround for a single test failing on a single model
tablet/laptop. So lets just drop this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 9eea8ffbc3d6..aa05c69a5c6b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -665,14 +665,6 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 		msleep(20);
 	}
 
-	/*
-	 * FIXME:WA for ECS28A, with this sleep, CTS
-	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
-	 * PASS, no impact on other platforms
-	 */
-	if (IS_BYT && enable)
-		msleep(10);
-
 	/* Write to ISPSSPM0 bit[1:0] to power on/off the IUNIT */
 	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
 			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
-- 
2.39.0

