Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011AB21069
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684423948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jq6Lo2SAVoiuLH5Wdc0+xjnQRPMqaZHIwshQ9MWmxJc=;
	b=cXBF6FxdHs25dl2VFoglbfOmm65v1shiFa0pOTY94Dzt0lt5GP0fwcJH9TszI/GzioMhRq
	Zj8lwh7zVzRZrtywafGiT8gRhJFVqe3iCpyH3jGV+U2SRjItDG9xnwXm/+vdEKxyzF2KG6
	J8+wPipuzn2tXAnq9Ev/llGkF5TX6FA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-sGmhowE_MA6cQzd8B1KKrQ-1; Thu, 18 May 2023 11:32:24 -0400
X-MC-Unique: sGmhowE_MA6cQzd8B1KKrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD812182506B;
	Thu, 18 May 2023 15:32:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 404C240C6EC4;
	Thu, 18 May 2023 15:32:22 +0000 (UTC)
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
Subject: [PATCH 4/9] media: atomisp: gc0310: Drop XXGC0310 ACPI hardware-id
Date: Thu, 18 May 2023 17:32:09 +0200
Message-Id: <20230518153214.194976-5-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
References: <20230518153214.194976-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

The XXGC0310 ACPI hardware-id does not appear to be used in
the DSDTs of any hardware out there, so drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 1db9580fca78..0d4d47af73ba 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -467,7 +467,6 @@ static int gc0310_resume(struct device *dev)
 static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops, gc0310_suspend, gc0310_resume, NULL);
 
 static const struct acpi_device_id gc0310_acpi_match[] = {
-	{"XXGC0310"},
 	{"INT0310"},
 	{},
 };
-- 
2.40.1

