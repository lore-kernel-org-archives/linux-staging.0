Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8335679FF
	for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689440956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KiYOXQR1dfJ4ohFM9TQtektSyJY5vyb0vgtjKDCem0c=;
	b=ODdrt/tdTuseswvHFOtCMdIkDOetKKuvRHia1MoeXFPutYYZXPStePYPYtHyYzaenzetOo
	XQmPhOituocWRaFn11Uqr86utjzK2tVHEOEkGYGkYiRcbpchO0ko/PJQRsMwQBkmQG4zkW
	amyzsxW32AruQMdCTReO0jm567SIT80=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-Lf0VOJg2NPqr_C38y3bqrA-1; Sat, 15 Jul 2023 13:09:13 -0400
X-MC-Unique: Lf0VOJg2NPqr_C38y3bqrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 568C185A58A;
	Sat, 15 Jul 2023 17:09:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B4D61121333;
	Sat, 15 Jul 2023 17:09:09 +0000 (UTC)
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
	linux-staging@lists.linux.dev
Subject: [PATCH 2/3] media: atomisp: Remove aliases for MIPI_FORMAT_2400_CUSTOM0
Date: Sat, 15 Jul 2023 19:09:05 +0200
Message-ID: <20230715170906.3627-2-hdegoede@redhat.com>
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

isp2400_input_system_local.h defines 2 aliases for MIPI_FORMAT_2400_CUSTOM0
MIPI_FORMAT_JPEG, which is entirely unused and MIPI_FORMAT_BINARY_8 which
is used once in ia_css_isys_2400_set_fmt_type().

Drop these aliases and directly use MIPI_FORMAT_2400_CUSTOM0 in
ia_css_isys_2400_set_fmt_type().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/isp2400_input_system_local.h | 2 --
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c        | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index e7b84fdbb4e0..6319d6449f20 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -200,8 +200,6 @@ typedef enum {
 	N_MIPI_FORMAT_2400,
 } mipi_format_2400_t;
 
-#define MIPI_FORMAT_JPEG	MIPI_FORMAT_2400_CUSTOM0
-#define MIPI_FORMAT_BINARY_8	MIPI_FORMAT_2400_CUSTOM0
 #define N_MIPI_FORMAT_CUSTOM	8
 
 /* The number of stores for compressed format types */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index c8316e0965d0..deb4130f710c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -271,7 +271,7 @@ static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
 		*fmt_type = MIPI_FORMAT_2400_RAW16;
 		break;
 	case ATOMISP_INPUT_FORMAT_BINARY_8:
-		*fmt_type = MIPI_FORMAT_BINARY_8;
+		*fmt_type = MIPI_FORMAT_2400_CUSTOM0;
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV420_16:
 	case ATOMISP_INPUT_FORMAT_YUV422_16:
-- 
2.41.0

