Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4835A3D68
	for <linux-staging@lists.linux.dev>; Sat,  1 Apr 2023 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680361188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iesvLwv6X8XuCGw70Cmh6LGcbEs+u4LGH9OWDaM1z3k=;
	b=Xa8wj9ubqCnptEbz2Qy9HTG1AXPRtu1S9xDGAUge90T0ceqIkXJuVsQY21GtqK3gUpnCZg
	UfDJ/0m9i3MLnnlSaZ7zKie7QPnteJ+MNJTkxmVk1kocznIpl4WAaK50Yhn4MoWuz/ryAv
	+VUxzfizOGYawMS0HaJi0VvqOvO7/54=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-ovuNWvonNqusOP65giNUjQ-1; Sat, 01 Apr 2023 10:59:44 -0400
X-MC-Unique: ovuNWvonNqusOP65giNUjQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8724A811E7C;
	Sat,  1 Apr 2023 14:59:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 048DA400F59;
	Sat,  1 Apr 2023 14:59:41 +0000 (UTC)
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
Subject: [PATCH 04/28] media: atomisp: gc0310: Remove some unused structure definitions
Date: Sat,  1 Apr 2023 16:59:02 +0200
Message-Id: <20230401145926.596216-5-hdegoede@redhat.com>
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

Drop the unused struct gc0310_format and struct regval_list definitions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/gc0310.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index cae480ae6fba..6947bf53ff4f 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -107,11 +107,6 @@
 
 #define GC0310_BIN_FACTOR_MAX			3
 
-struct regval_list {
-	u16 reg_num;
-	u8 value;
-};
-
 struct gc0310_resolution {
 	u8 *desc;
 	const struct gc0310_reg *regs;
@@ -126,12 +121,6 @@ struct gc0310_resolution {
 	bool used;
 };
 
-struct gc0310_format {
-	u8 *desc;
-	u32 pixelformat;
-	struct gc0310_reg *regs;
-};
-
 /*
  * gc0310 device structure.
  */
-- 
2.39.1

