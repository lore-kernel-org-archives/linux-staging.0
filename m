Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1A7539D
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687171945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnqmnuzscMduS86UdE+Ktdua/ucXBwFGdE/PJUq9UGU=;
	b=IwmtgbsDJkLBor4kiyUYSDzHbwxIC5yjbNLa5Z+bA0zMWop36NBww7hyoh3JF2ts80riUg
	vZE1i1vRKiCbLlTBuQnZV4OTDGO+PSktnzx8X9S7iIE0mQxMSQQ8K1+KWa0oHEapR7gbbA
	q86yHD6mdF1KXrrR8GNJYpfTLMIHUcw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-WgqnNi0rNEe1mO2PcnVP1A-1; Mon, 19 Jun 2023 06:52:22 -0400
X-MC-Unique: WgqnNi0rNEe1mO2PcnVP1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F084380671B;
	Mon, 19 Jun 2023 10:52:21 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88F71112132C;
	Mon, 19 Jun 2023 10:52:19 +0000 (UTC)
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
Subject: [PATCH 4/7] media: atomisp: Change atomisp_enum_framesizes() too small cut off from 2/3th to 5/8th
Date: Mon, 19 Jun 2023 12:52:09 +0200
Message-Id: <20230619105212.303653-4-hdegoede@redhat.com>
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

Change atomisp_enum_framesizes() cut off for too small resolutions
from 2/3th to 5/8th this results in more resolutions being available
with some sensors.

E.g. this allows using 800x600 with a 1280x960 sensor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d2174156573a..047b9fb075d0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -729,11 +729,11 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 			continue;
 
 		/*
-		 * Skip sizes where width and height are less then 2/3th of the
+		 * Skip sizes where width and height are less then 5/8th of the
 		 * sensor size to avoid sizes with a too small field of view.
 		 */
-		if (frame_sizes[i].width < (active->width * 2 / 3) &&
-		    frame_sizes[i].height < (active->height * 2 / 3))
+		if (frame_sizes[i].width < (active->width * 5 / 8) &&
+		    frame_sizes[i].height < (active->height * 5 / 8))
 			continue;
 
 		if (*valid_sizes == fsize->index) {
-- 
2.40.1

