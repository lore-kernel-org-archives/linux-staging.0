Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AC539D
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687171947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ii0g44MHqb3/hcjWWH34sglXiDVkosGVv1NC25z3QnE=;
	b=C4qQNXCSU12NufcYOkoKsfdXr8vUa8n81L/BnaH1ig0W7AUJfBsSszgm97lBCmPYeKodJp
	4e9ioaPUnrhPkVzCBy7uCw1Npuh3CUnKAB5/Cr+Ly8/Hcaa8PQndZpMoGvSiTcMexi1J9A
	vQUKMGSZd255aZBMunlFA4rMSD2Wm1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-ek3U7LH8OXuq8CIMAIBJXw-1; Mon, 19 Jun 2023 06:52:24 -0400
X-MC-Unique: ek3U7LH8OXuq8CIMAIBJXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 297CC801189;
	Mon, 19 Jun 2023 10:52:23 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95BB1112132C;
	Mon, 19 Jun 2023 10:52:21 +0000 (UTC)
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
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/7] media: atomisp: Add some higher resolutions to atomisp_enum_framesizes()
Date: Mon, 19 Jun 2023 12:52:10 +0200
Message-Id: <20230619105212.303653-5-hdegoede@redhat.com>
In-Reply-To: <20230619105212.303653-1-hdegoede@redhat.com>
References: <20230619105212.303653-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

Add some higher resolutions to the fixed list of resolutions which
atomisp_enum_framesizes() uses on sensors which can do cropping and can
thus make any resolution that will fit.

This is useful for higher resolution sensors like the 2560x1920 ov5693
sensor.

Note the highest resolutions added here are 1920x<height> because
the atomisp firmware does not support widths > 1920 with the default
asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW setting.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 047b9fb075d0..8fd981f49659 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -708,6 +708,9 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 					      int *valid_sizes)
 {
 	static const struct v4l2_frmsize_discrete frame_sizes[] = {
+		{ 1920, 1440 },
+		{ 1920, 1200 },
+		{ 1920, 1080 },
 		{ 1600, 1200 },
 		{ 1600, 1080 },
 		{ 1600,  900 },
-- 
2.40.1

