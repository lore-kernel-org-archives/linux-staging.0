Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B522CA0
	for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 21:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642369944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkoQd7gjxr71vUNWnR7XIGrbM4DTr+/zCdydsU3Qc/8=;
	b=M8rjy15B2DO7i2iVEi2Lwrno1jn6onjKdSNkW6HWzY/7DTfuviyF1ijTaiaTK5keQBpcv5
	b6pc1ZfenLuShB6pEif9IsZe9yXhOFYWUK3xdd7Q1vN8j0WEQ+eT3MBfZIv+6PRqTYfehq
	nqIWLVVZftwpwaSKNyJDwm8NGHhJ4xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-lxTBumPvP82OVLxsuF1raw-1; Sun, 16 Jan 2022 16:52:21 -0500
X-MC-Unique: lxTBumPvP82OVLxsuF1raw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 737CB2F24;
	Sun, 16 Jan 2022 21:52:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF83361F20;
	Sun, 16 Jan 2022 21:52:16 +0000 (UTC)
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
Subject: [PATCH 4/9] media: atomisp_gmin_platform: Fix axp_regulator_set() writing to the wrong register
Date: Sun, 16 Jan 2022 22:51:59 +0100
Message-Id: <20220116215204.307649-5-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15

The second write done in axp_regulator_set() must go to the ctrl_reg which
turns the various regulators on/off. This replaces the second write
writing the sel_reg, which sets the voltage for the regulator, for a
second time with a wrong value.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 1cc581074ba7..a29e5086ffe1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -741,7 +741,7 @@ static int axp_regulator_set(struct device *dev, struct gmin_subdev *gs,
 
 	val = on ? 1 << shift : 0;
 
-	ret = gmin_i2c_write(dev, gs->pwm_i2c_addr, sel_reg, val, 1 << shift);
+	ret = gmin_i2c_write(dev, gs->pwm_i2c_addr, ctrl_reg, val, 1 << shift);
 	if (ret)
 		return ret;
 
-- 
2.33.1

