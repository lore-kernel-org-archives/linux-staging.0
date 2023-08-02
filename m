Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4D63B6
	for <linux-staging@lists.linux.dev>; Wed,  2 Aug 2023 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690970269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOFd9JGAsybq3+W0dWLwdnReh5Kwy01yAHdTXKRQaPk=;
	b=DM0D/OrNEJ6DdoaBEMNaDPj4T5R9Sr2DPwRh85Ae7jbDkAfcx6V/YNfpTH4LhCZy/ZvORF
	NkklJpbk89drsoh2bsIMKFXPMzOb49QJ23V21BQ5mnXCqA+mVHMMdaHGL9zN7HUHk7Py6i
	HsX6RTKPQCq1E4NiQuqIf2Vu/naEu3A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-b7IDWI0YNF6fknKoi6LuXA-1; Wed, 02 Aug 2023 05:57:48 -0400
X-MC-Unique: b7IDWI0YNF6fknKoi6LuXA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B09DA856F66;
	Wed,  2 Aug 2023 09:57:47 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1B1C401DA9;
	Wed,  2 Aug 2023 09:57:44 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 12/12] media: atomisp: atomisp_v4l2: Removed unnecessary code
Date: Wed,  2 Aug 2023 17:56:06 +0800
Message-ID: <20230802095606.1298152-13-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

Here is the last step of #ifdef ISP2401 removal work. Since the driver
became generic, this part of the code was no longer needed and can
be removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c43b916a006e..ca95944388df 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1206,25 +1206,6 @@ static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id
 		return false;
 	}
 
-	/*
-	 * FIXME:
-	 * remove the if once the driver become generic
-	 */
-
-#ifndef ISP2401
-	if (IS_ISP2401) {
-		dev_err(&pdev->dev, "Support for %s (ISP2401) was disabled at compile time\n",
-			name);
-		return false;
-	}
-#else
-	if (!IS_ISP2401) {
-		dev_err(&pdev->dev, "Support for %s (ISP2400) was disabled at compile time\n",
-			name);
-		return false;
-	}
-#endif
-
 	dev_info(&pdev->dev, "Detected %s version %d (ISP240%c) on %s\n",
 		 name, pdev->revision, IS_ISP2401 ? '1' : '0', product);
 
-- 
2.41.0

