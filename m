Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6DA3D9D
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 20:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655326247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QAhhhQ5IzN2La/WRzt8CEbBSSJ3ZZyE0+kLhh1ahUQ=;
	b=WEiK+VJHsSVDRh5wO4ynOVUoA1tVQ4VP0vcQji0AOnpq2kCfygJnQr/eNyq2Y+ODnAJ00X
	LgIdigfx71k8jJVz8KbIbiIyD3TYP4Ttc2pu2eCOeGjEb2gBCrxQFA6IB7pGXkjL/zmHdU
	eYsm6LjwHgfy5yzYBZOyuUc+s0z9gQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-630FQlwIO-C0r7TaXF9wcA-1; Wed, 15 Jun 2022 16:50:42 -0400
X-MC-Unique: 630FQlwIO-C0r7TaXF9wcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08F87803520;
	Wed, 15 Jun 2022 20:50:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 688221131D;
	Wed, 15 Jun 2022 20:50:40 +0000 (UTC)
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
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 01/40] media: atomisp: remove the unused RAW_BUF_STRIDE macro
Date: Wed, 15 Jun 2022 22:49:58 +0200
Message-Id: <20220615205037.16549-2-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5

I noticed that the RAW_BUF_STRIDE macro is using the removed
SH_CSS_BINARY_ID_POST_ISP define, which should be a problem except that
the RAW_BUF_STRIDE macro itself is not used at all, remove it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/isp/modes/interface/isp_const.h       | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
index bfe4f5976771..73432dc35ae3 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
@@ -145,12 +145,6 @@ more details.
 
 #define RAW_BUF_LINES ((ENABLE_RAW_BINNING || ENABLE_FIXED_BAYER_DS) ? 4 : 2)
 
-#define RAW_BUF_STRIDE \
-	(BINARY_ID == SH_CSS_BINARY_ID_POST_ISP ? MAX_VECTORS_PER_INPUT_CHUNK : \
-	 ISP_NUM_STRIPES > 1 ? MAX_VECTORS_PER_INPUT_STRIPE + _ISP_EXTRA_PADDING_VECS : \
-	 !ENABLE_CONTINUOUS ? MAX_VECTORS_PER_INPUT_LINE : \
-	 MAX_VECTORS_PER_INPUT_CHUNK)
-
 /* [isp vmem] table size[vectors] per line per color (GR,R,B,GB),
    multiples of NWAY */
 #define ISP2400_SCTBL_VECTORS_PER_LINE_PER_COLOR \
-- 
2.36.0

