Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA37ED5
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662025633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEAI9KHfek7RN/C4xU1FNFkJEMFJUTHd1T9ANa6t+P0=;
	b=Pr7rQpI0Fup31Pm/V80cM5pjND6vThyR9zy4xZ2xSMumOiLkcGRzKQXSqfgKChSQ+HPHnF
	JuFdtKYWSoHi7FZvW8d87LoSqJoFeohTx3UTy1Uiu0xDawCTF0bOKAnD36jhAgJ8xrOU18
	I3Gq99R0mgKvgeuHDrM/fr5NSorO1uk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-X3Pw-QBdPoSuTphM19D-Vg-1; Thu, 01 Sep 2022 05:47:10 -0400
X-MC-Unique: X3Pw-QBdPoSuTphM19D-Vg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9ACC690F94C;
	Thu,  1 Sep 2022 09:47:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4B9D492C3B;
	Thu,  1 Sep 2022 09:46:58 +0000 (UTC)
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
Subject: [PATCH 13/14] media: atomisp: Simplify v4l2_fh_open() error handling
Date: Thu,  1 Sep 2022 11:46:25 +0200
Message-Id: <20220901094626.11513-14-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

v4l2_fh_open() can only fail with -ENOMEM and as a generic rule drivers
do not log their own errors for -ENOMEM since the kernel will already
have complained loudly about this before the -ENOMEM return.

Remove the unnecessary error logging from atomisp_open().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 61571f3fb060..fa37defa5ecc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -708,12 +708,8 @@ static int atomisp_open(struct file *file)
 	dev_dbg(isp->dev, "open device %s\n", vdev->name);
 
 	ret = v4l2_fh_open(file);
-	if (ret) {
-		dev_err(isp->dev,
-			"%s: v4l2_fh_open() returned error %d\n",
-		       __func__, ret);
+	if (ret)
 		return ret;
-	}
 
 	rt_mutex_lock(&isp->mutex);
 
-- 
2.37.2

