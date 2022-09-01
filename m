Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B7ED0
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662025633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ywlw22fxNElpDb1Mjzquuxso9WM367LQ9Nkck0nqn/M=;
	b=O0X46Clbj4Y+FQ5NZG/oZ5kbQDIeRtqO9ftjRk5lSix/+7cHjyKsWykJ3xJBU/lAkcGN9C
	yNFSHoNCmcqyZ8r4VNJCRs77fklHfLMLpK1hrW0/WGFUacW2ZylnP6VmKXlpkZjrfzN7Mv
	kmgHTie0Mvp521PN8y6QT8edCaTIqtY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-3CqohexkPJWUv1QQ0HO9Fg-1; Thu, 01 Sep 2022 05:47:07 -0400
X-MC-Unique: 3CqohexkPJWUv1QQ0HO9Fg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AED3E109EE8D;
	Thu,  1 Sep 2022 09:46:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D430403344;
	Thu,  1 Sep 2022 09:46:57 +0000 (UTC)
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
Subject: [PATCH 12/14] media: atomisp: Fix v4l2_fh resource leak on open errors
Date: Thu,  1 Sep 2022 11:46:24 +0200
Message-Id: <20220901094626.11513-13-hdegoede@redhat.com>
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

When atomisp_open() fails then it must call v4l2_fh_release() to undo
the results of v4l2_fh_open().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 6518e6d5c7b5..61571f3fb060 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -804,6 +804,7 @@ static int atomisp_open(struct file *file)
 	pm_runtime_put(vdev->v4l2_dev->dev);
 error:
 	rt_mutex_unlock(&isp->mutex);
+	v4l2_fh_release(file);
 	return ret;
 }
 
-- 
2.37.2

