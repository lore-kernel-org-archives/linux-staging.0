Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C821C01
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7EXKqOmQ6tBEmWnWsUTo/7iQPF4r/k3m/kS7MniM/So=;
	b=PA03Fq90q4ZCbBe96l+2mtiedIxJIp87z+CJv95ZSM6MBR7IvJNBpfJSrEcaKegliwBmZ5
	jJLef+6EiCYs2OJpGtsWzoq5HBC4Vtrz4eXVxRlyK5UGALGvTfIErRnb0gbU8TP2STLOBd
	8Slz44R4vXqWSREkwNbC2gYsdleExho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-AtlCwY_GNfCdmNmcSjlzrg-1; Mon, 23 Jan 2023 07:52:13 -0500
X-MC-Unique: AtlCwY_GNfCdmNmcSjlzrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19EFA877CA3;
	Mon, 23 Jan 2023 12:52:13 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB33C15BA0;
	Mon, 23 Jan 2023 12:52:10 +0000 (UTC)
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
	linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/57] media: atomisp: fix videobuf2 Kconfig depenendency
Date: Mon, 23 Jan 2023 13:51:09 +0100
Message-Id: <20230123125205.622152-2-hdegoede@redhat.com>
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

From: Arnd Bergmann <arnd@arndb.de>

The recent conversion missed the Kconfig bit, so it can now
end up in a link error on randconfig builds:

ld.lld: error: undefined symbol: vb2_vmalloc_memops
>>> referenced by atomisp_fops.c
>>>               drivers/staging/media/atomisp/pci/atomisp_fops.o:(atomisp_open) in archive vmlinux.a

Fixes: cb48ae89be3b ("media: atomisp: Convert to videobuf2")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/r/20230104082212.3770415-1-arnd@kernel.org
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index 2c8d7fdcc5f7..c9bff98e5309 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -14,7 +14,7 @@ config VIDEO_ATOMISP
 	depends on VIDEO_DEV && INTEL_ATOMISP
 	depends on PMIC_OPREGION
 	select IOSF_MBI
-	select VIDEOBUF_VMALLOC
+	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Say Y here if your platform supports Intel Atom SoC
-- 
2.39.0

