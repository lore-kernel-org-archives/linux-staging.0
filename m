Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB1B371899
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199277; cv=none; b=Br71M/6wUeVNJ30/Jfg54KyKCTn8CfxmmzvBpbnyWPjvQwbhIGEIydMdcru+PY4mSp/Vl+W0+JSIb36nYYp2iVcwjKTe09qq34IGGrnbDbE410HBf1AQ8YpFZCxVrwzPO1sfw1irGeTM/qlQpFHcAFDPE4MVWkm2ftGbo3thv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199277; c=relaxed/simple;
	bh=cmLSqzifwOF8w3gy+VghqBDjtxfwKg/n6RMNTB5n+1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=houGa8IT97n32naiwr4nZvK2jpOgvHTWN0zofZBoPEeb8HhY/jwJcQCo3gukTfDusVxCkFYqZKJaf4GPU5p3yrcz/IatdS8vdKXdlOtq4XaUGGMzcM1qcWfCYlvstZjmMxK+nfjdP95sTcUIhgGe1phxmIIBmHztgAHGcs6jl+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pz1LRCu5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pz1LRCu5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f633e6058so3032023f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199273; x=1788804073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlC264ZmuNC9OaSCC+Hoy8y6Tn/lQ6yUUOOH17G4Le0=;
        b=Pz1LRCu5Dpe5l29W/Lw4xNuG2nnUTBlFw8NvCpjMOvCK21SHrDgKupAsEfjWs6IkfX
         +Ei3C0R5hmKHlHcTgxxRXsehSTnVQJI8TCmcDi79VJfZMNTOKRzCFYHkTwWSC3di1tFV
         bM4NfYHzKtmZH0F6zze7AgfFDwqh1XyNz8v10rHPoEGlVtlPyBTphHgHn8D5yaZN5xof
         JCw12jVM5f8Z9RJ+RjEA3wjkKKRmxEjw3SVrxb65Ww2eCkMwdHMYvB/2qTH/LsVOr0Ue
         uPE5dfBL9MFOgW69VLbLgwTt9tJ2pvv1SvnEyWKyGx9aD7CGA/mbZN7XlkqsKEAwPwsU
         PACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199273; x=1788804073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qlC264ZmuNC9OaSCC+Hoy8y6Tn/lQ6yUUOOH17G4Le0=;
        b=eRFCDQTiSHTOKURgP4onCivlUTDaRsGuY5lA74KpGk1VQEZjwGjDlhmAboIcFuSy2E
         l44EugGfrx5SeyjEsHrkg5ztpQy9avukib2I2egsiem9AQBZP4aHZgstVR16SEk97JGv
         wDN8cWNDaQ0Fd+ZQYML4ECFWWZprBUTcj4kXewKR2ibyk+oPCqK5d51gml9Suupg6zmg
         ty2ck6HvD4UB6hEuYhmR0g/eSl4UVPq2Ll1IEpr74zIoTLRURponC+o0eRcieKQFdp4p
         IJ6aAk+dHu7F1pIgLCI+QJf+t4MhxbJE9uoqlq555kTRZ4UD/mKpmrxY4sAPuBrgUvo/
         AFGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/qIPVItynCDmftASBdGuKNipcGiJ8kZseDDof3USnjBTKyOE7pr8NS1BFSVJ1sHOpFgbwDxFP2IYUUrlj@lists.linux.dev
X-Gm-Message-State: AFuF++mQOuevYHWa4a1WXNL38PY8pj7uZMmqfUXG9aRMyeTQzOq3Rrr5
	HCMqkKNwBIvNZxinLJDK6oSu3VBj2Gp4eekvgvINlz3BuToDrsb1fR6s
X-Gm-Gg: AYBFou3A1zuXF67EhYf6fev58rLYxvnT4NkGtg8LkkAI5EJJWgVIpLlnqdFF30HP70O
	wjnD2ybNxMPHpZUjgTD77pT21aU0LYS7Qs4AZ2mEnaOtn4kCJPlZxfs969xL+jkwhh3MtmIHzb4
	XVUuZqxEN90EnaZUjttTRg156bp3CF25frbPHZlVX6ZUXursoKgijR3d2RgeEehDGrgQQwDsZQX
	UHSiv343wLtjPtEq1j5Xw+rcyJnIFfXxnQ4FmWUwLdFh30zaI43Y1dvGZJ+9evRmG7cTv6tiwmr
	8mq+Gi8ogNWzV5zv+suZh3XfGr/6NHsl/rRS1yg8nS8jnEt1F/caTd5nZFSp5gjeMY1b2KGCsoh
	XGvTGHLHzY4xem3sLjXH9kia9r+mAsz6A6cLNYQxtMlc3oH2/KxzrwUL406Dn+S9oRO/TGUqziw
	AHI1XUqz7mCjvE5hdc4mD0kBO8PpSYSYSAHIjwNyNdVwrGrGaZKf23aKaBlEkEfRsatoAYjE1gJ
	327qlGWOL7lkpDNxqwE2J8yREA0cko2z/ZcOX5xQ4A=
X-Received: by 2002:a05:6000:40dd:b0:482:e4bc:51b3 with SMTP id ffacd0b85a97d-482f799da20mr41606868f8f.1.1788199273297;
        Mon, 31 Aug 2026 11:01:13 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:12 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Mon, 31 Aug 2026 20:00:49 +0200
Message-ID: <20260831180101.3109854-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
With Best Regards,
Maurizio Casciano

