Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B218A3D6E
	for <linux-staging@lists.linux.dev>; Sat,  1 Apr 2023 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680361224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TezODqGRq70gjY6nlZ1O4bq0QDVSc71v9rjbdJs2K48=;
	b=excxYK8f6flw/Oil56eHkAIRo9vJwtwohonx945yRPWI0p8gX+hMpfezwg1gQpyG7G22D6
	q+t1DdswWxP1BYqz1HzmI/M8c9JpaTcYFGww6rtMRkxLd8tBAo1QBo6HAW/6fEE86AfIAF
	m6X1bwsT6bTqi+YXsCriIgU/ilQmkXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-fzpIHlJ3P8q1GbVLavFRng-1; Sat, 01 Apr 2023 11:00:21 -0400
X-MC-Unique: fzpIHlJ3P8q1GbVLavFRng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4A0F101A531;
	Sat,  1 Apr 2023 15:00:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88C59400F59;
	Sat,  1 Apr 2023 15:00:18 +0000 (UTC)
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
Subject: [PATCH 23/28] media: atomisp: Remove unused ATOM_ISP_MAX_WIDTH_TMP and ATOM_ISP_MAX_HEIGHT_TMP
Date: Sat,  1 Apr 2023 16:59:21 +0200
Message-Id: <20230401145926.596216-24-hdegoede@redhat.com>
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

Remove the unused ATOM_ISP_MAX_WIDTH_TMP and ATOM_ISP_MAX_HEIGHT_TMP
defines.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 681a9258288d..35293f2c196a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -76,9 +76,6 @@
 #define ATOM_RESOLUTION_SUBQCIF_WIDTH	128
 #define ATOM_RESOLUTION_SUBQCIF_HEIGHT	96
 
-#define ATOM_ISP_MAX_WIDTH_TMP	1280
-#define ATOM_ISP_MAX_HEIGHT_TMP	720
-
 #define ATOM_ISP_I2C_BUS_1	4
 #define ATOM_ISP_I2C_BUS_2	5
 
-- 
2.39.1

