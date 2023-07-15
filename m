Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A14715B8
	for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689440956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aq+EG35HOtgUCV8xZKFZmNK1P5mj+t/i6l/MjJyilLE=;
	b=K0b4Psmj+FdfB7YX25dJ0ePK8dkIvOqUTlgqxfz6CvT1B8L9ZEQUTLLLNh4u1LXVb4c7HL
	Ow/KsrXmyYxHLRZRHjx+M3Sm6K2Fyp33A8l1AeIeH9f9GsC66fjvcqWrCbBSPqRPhE1kIF
	ILbcMo5CMO4o7VwGRgUpSZ9NJJCw/TU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-8srJJYUIMCCchUDUA2pEew-1; Sat, 15 Jul 2023 13:09:14 -0400
X-MC-Unique: 8srJJYUIMCCchUDUA2pEew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4754687321B;
	Sat, 15 Jul 2023 17:09:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A0D11121333;
	Sat, 15 Jul 2023 17:09:12 +0000 (UTC)
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
	linux-staging@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] media: atomisp: Mark ia_css_isys_240?_init() static
Date: Sat, 15 Jul 2023 19:09:06 +0200
Message-ID: <20230715170906.3627-3-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-1-hdegoede@redhat.com>
References: <20230715170906.3627-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

ia_css_isys_240?_init() are only used inside the C file where they are
declared, mark them as static fixing:

drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:24:20:
   warning: no previous prototype for 'ia_css_isys_2400_init'
   24 | input_system_err_t ia_css_isys_2400_init(void)
      |                    ^~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:87:20:
   warning: no previous prototype for 'ia_css_isys_2401_init'
   87 | input_system_err_t ia_css_isys_2401_init(void)
      |                    ^~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307152046.rvhFGrbz-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/runtime/isys/src/isys_init.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index 1a7b45bb4544..18bfe1010989 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -21,7 +21,7 @@
 #include "isys_dma_public.h"	/* isys2401_dma_set_max_burst_size() */
 #include "isys_irq.h"
 
-input_system_err_t ia_css_isys_2400_init(void)
+static input_system_err_t ia_css_isys_2400_init(void)
 {
 	backend_channel_cfg_t backend_ch0;
 	backend_channel_cfg_t backend_ch1;
@@ -84,7 +84,7 @@ input_system_err_t ia_css_isys_2400_init(void)
 	return error;
 }
 
-input_system_err_t ia_css_isys_2401_init(void)
+static input_system_err_t ia_css_isys_2401_init(void)
 {
 	ia_css_isys_csi_rx_lut_rmgr_init();
 	ia_css_isys_ibuf_rmgr_init();
-- 
2.41.0

