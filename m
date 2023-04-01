Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0969F3D68
	for <linux-staging@lists.linux.dev>; Sat,  1 Apr 2023 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680361215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p4MzD35r/RrS1TyR4VnXqVtk+MtgwA7BTD4xECWDmHs=;
	b=hhczycFW61DS3nwBbxYlY+6zyTUQ2MKECSqrgqGjl+strzkCsUgPgifEudeJ2RbjH7nb+x
	MKa5g8fNFRjQQJjtv9noIYcUvbQ0KjkA1P4dueJw5vq2wGhFkT1ut4dOdHwFVUboLDFeQ6
	1ZM3CuCD1/Vf7fsBj8Jddtr59kAHDIQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-Onn9KD1PMPet-rgbVSP1UA-1; Sat, 01 Apr 2023 11:00:10 -0400
X-MC-Unique: Onn9KD1PMPet-rgbVSP1UA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE3D53815F61;
	Sat,  1 Apr 2023 15:00:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E055400F59;
	Sat,  1 Apr 2023 15:00:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 19/28] media: atomisp: Remove duplicate atomisp_[start|stop]_streaming prototypes
Date: Sat,  1 Apr 2023 16:59:17 +0200
Message-Id: <20230401145926.596216-20-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

atomisp_ioctl.h contains the atomisp_[start|stop]_streaming function
prototypes 2 times. Drop one of the copies of the prototypes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 93139decf1d0..db6da77df06b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -53,7 +53,4 @@ unsigned int atomisp_streaming_count(struct atomisp_device *isp);
 long atomisp_compat_ioctl32(struct file *file,
 			    unsigned int cmd, unsigned long arg);
 
-int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count);
-void atomisp_stop_streaming(struct vb2_queue *vq);
-
 #endif /* __ATOMISP_IOCTL_H__ */
-- 
2.39.1

