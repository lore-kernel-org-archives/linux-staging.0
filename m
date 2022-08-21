Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB346A4
	for <linux-staging@lists.linux.dev>; Sun, 21 Aug 2022 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661118644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHBIZS/bAxYof9KpwGWNmLOh7mnAnqnDwDJC61PvMzQ=;
	b=dqjUUtHOnRYJLLMChtYHXtoI4apCdi+UNE/Ne9UZ2R46clqc5ccCD1eJ8ev9YwPzy81tCA
	pJMFKRS6QqJTpN3quAqtvBiIoxLRki13eXXlwkWPIRqhTETdXWVJt+lJeR34F038i1EOY2
	uIt9k3dvfCdwuNs9y4hOYnjbdxRW0l0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-a734-Bt2N5-Q-MR9ua4Tow-1; Sun, 21 Aug 2022 17:50:40 -0400
X-MC-Unique: a734-Bt2N5-Q-MR9ua4Tow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFE188032F1;
	Sun, 21 Aug 2022 21:50:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B02D40CF8EB;
	Sun, 21 Aug 2022 21:50:38 +0000 (UTC)
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
Subject: [PATCH 07/13] media: atomisp: Make atomisp_try_fmt_cap() take padding into account
Date: Sun, 21 Aug 2022 23:50:21 +0200
Message-Id: <20220821215027.461344-7-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-1-hdegoede@redhat.com>
References: <20220821215027.461344-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1

atomisp_try_fmt() gives results with padding included. So when userspace
asks for e.g. 1600x1200 then we should pass 1616x1216 to atomisp_try_fmt()
this will then get adjusted back to 1600x1200 before returning it to
userspace by the atomisp_adjust_fmt() call at the end of atomisp_try_fmt().

This fixes the resolution list in camorama showing resolutions like e.g.
1584x1184 instead of 1600x1200.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 459645c2e2a7..7ecee39ef5a4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -960,6 +960,13 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int ret;
 
+	/*
+	 * atomisp_try_fmt() gived results with padding included, note
+	 * (this gets removed again by the atomisp_adjust_fmt() call below.
+	 */
+	f->fmt.pix.width += pad_w;
+	f->fmt.pix.height += pad_h;
+
 	rt_mutex_lock(&isp->mutex);
 	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
 	rt_mutex_unlock(&isp->mutex);
-- 
2.37.2

