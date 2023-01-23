Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F81C2D
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTzUrNnZfNRNmVE2sLOZ7wFmZmOVB1VDCS/iprHSn2M=;
	b=ik/Dl/l3Wn7iUtzd+2ZShJJuqbQYGP3fle0ue300G0anbx2UEhDM9eFXIRdNVd/cXgFTsT
	0HfTTJbW24qO3KPVWPMNrPLP1k08SqnJoqUGASzGm0e1fRONrfASRi0gZ26QwFjknCU/i/
	dQ4K5+IQjEirpJ8vtSLg/nZL5fJ6/So=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-kLqEjIWQPp-Oo5CZkDwuzw-1; Mon, 23 Jan 2023 07:52:25 -0500
X-MC-Unique: kLqEjIWQPp-Oo5CZkDwuzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A473D29AA3AF;
	Mon, 23 Jan 2023 12:52:24 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 342F9C15BA0;
	Mon, 23 Jan 2023 12:52:22 +0000 (UTC)
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
Subject: [PATCH 05/57] media: atomisp: Silence "isys dma store at addr, val" debug messages
Date: Mon, 23 Jan 2023 13:51:13 +0100
Message-Id: <20230123125205.622152-6-hdegoede@redhat.com>
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

These are clearly debug messages, printing these all the time is not
useful.

Silence these by simply removing them altogether.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/css_2401_system/host/isys_dma_private.h   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
index a313e1dc7c71..d65fe9ec9049 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
@@ -34,8 +34,6 @@ void isys2401_dma_reg_store(const isys2401_dma_ID_t	dma_id,
 
 	reg_loc = ISYS2401_DMA_BASE[dma_id] + (reg * sizeof(hrt_data));
 
-	ia_css_print("isys dma store at addr(0x%x) val(%u)\n", reg_loc,
-		     (unsigned int)value);
 	ia_css_device_store_uint32(reg_loc, value);
 }
 
-- 
2.39.0

