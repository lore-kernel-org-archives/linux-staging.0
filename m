Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944AA391E5F
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933716; cv=none; b=ZM0sT4HCAtiAXL70T6P62HlBl8ortyJLZ8neVWDliSSNYciOunAc1Rd6mOOAhlsGhsZU05qLU4HZhti6bivTO5Qn+OyK9jtddewaFGH9dXSvlnFo6t3ZFOx3zO7fn6bJcbM2dCw9jfvTJE7kwPCof1EuWS0t1cRGX0iK3vbvDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933716; c=relaxed/simple;
	bh=v7juixLQwrF7KDdp/S9iL2tx/5gjSGtziv38EJOHhcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5CQaZb4Cwx5LK8pvo5un4YSsxtJYcOdbEWXAuBjvgr8hFmGwADD5Er/FK8YaPwLpgmhpcOWAsXJEQiaZ15+zhohA06+31+mCNKFi/5qXc3RpLfeE7otk3pE3s0h7Q4+WdzWiPUzyHG8FLuGo14GHXb/Fntz3UTyUTaeMTfhNzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVjLBme7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVjLBme7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e2904915so841063f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933713; x=1788538513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvPJGHIKC1eJmheE+blqXkJ54XPQu26+LTbYDPnFGgY=;
        b=DVjLBme7CAcFGLh5UTia5BFWyrf6CLGm0Q/2EPbDRO0X/zpvCafrPK86hpqNDFmO2t
         I2cUYCyr28RSe+3hqYMbhlORqQb+9MZeb1D1l3+ZobgEp9e1tQQWMnNaHYZHiB7yCXlW
         yFD+ozEm/eZX6HLnCOeKIr3mZ34YFZoxorhCyTP9pVH2NQ6mPvmG1VcRx3QMb0Q1BYeq
         3XPPMtd1bgRxY6tzNmIfLx9YDd8Aj30MGcBZFfNNlwpbBZJZJmFgWCtLQlFc8Rc5WGCd
         xbnDiX6NGIDqie+b164daiOUE9ctID6Sty0mixxx9p4Xc+Kt028vn3/9TQim/WbSfpZG
         n3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933713; x=1788538513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvPJGHIKC1eJmheE+blqXkJ54XPQu26+LTbYDPnFGgY=;
        b=TPkQzx/9DNY3KomZb0eqoFxgw6BNs+Y+n1eIRH2UQzSuhaRBFt75xZ15oAqlg4leaI
         50yHZXVgVckedTGDHqZcg3a6DFgtyepQr/vpW923j+ZDw6IT/MSiNCb9OrzrEN3KF+3m
         Kfvbvk1kXPElPfnuiVFfZAci7kpro76WTSHLVuuRpnzv3TttrygNipqs4jgdbOsIBQka
         Va8k94yP/se8EKnlUNVnYijbDEu3MX5TPJI4BKtgk85/+i8Xqvg7QA2kfYWuGe6lIMKP
         FXn8VwS4UGFj8gHo6aonP+vWvzQKaRMX9815NGhAJYvCUxAASi+5ByAGeDrMa3/GpP53
         tyEA==
X-Forwarded-Encrypted: i=1; AHgh+RpJZCeYVfds1unm1KHGgilvnB+ekMeHzdXBoRzbGPjOLGsf1tCIoB/qfTMdlomgfIDzdOsvTx/d4cR2WCk/@lists.linux.dev
X-Gm-Message-State: AFuF++mQIjeF2r+bhov01YT0V/T8EHTVcTUkgQ70+ySAoEbFYqAHVc/M
	mA9TeJehOm607Hhi9gHhPg/0Npwt8sHkU3Tq+LTC+AHGJmXy5eyncyMT
X-Gm-Gg: AR+sD12VwOs7qHt3AGh3VOJB4iaXaHo1TUgZqcwXQIUDb+qcihznLmiL/BPUOISpbx1
	24UNH0Ag/2tD1C7oB78ncK0XmhblkHSChLwF1tNIBV2n+PGPR7/1cGlkByt7qm/MGBmp8iwQZ+/
	YBNwuueypEDDCClbbWbCvBNNRH/HLqVsDcUAL+JR+KzL5BFY8uv7OFq77uqjxB1g1NIlEKKDQnX
	rnDsqG0A4732lSt/x7PzJem+ycfnvayjzu2XxfKU6AyuwQOJb8CJaBqQeJ8/qdDfXje66G7Bp+u
	LJtJFIJLiXJ6tpWc5zztyQkNuNK5uUoZXAlCUzKNcTpC47SMRoMiD+Sx8z+O80WpcbNjeZMPOyk
	85G2/gsGuxFotkMh8LUrDIcmQ6rNktWpdl+KTnNWt13mFHtXvcNgPe+nFbbLOjqQQ+yeZ7Kvk/M
	urUc+qT8amlR8GqEmNNwexkJyI/IR3PVo8dkLldZxE67N5yRPCDDkqwYfe2X5NQLGkhPMqD6Ufv
	l3XpwK9lZs7Ujww2fztRT2TNqcRg0/6FPEt02WFbXz6JF9cgAxmQg==
X-Received: by 2002:a05:6000:18a1:b0:482:bf78:300a with SMTP id ffacd0b85a97d-482f79c78abmr14393256f8f.17.1787933712863;
        Fri, 28 Aug 2026 09:15:12 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:12 -0700 (PDT)
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
Subject: [PATCH v4 05/15] media: ov8858: Add INT3477 ACPI ID
Date: Fri, 28 Aug 2026 18:14:47 +0200
Message-ID: <fb26c4cb3dae5d87ee877dd558d6ea5e0b3926fd.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 9b3e6eaca665..332625e19142 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2088,6 +2089,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2098,6 +2105,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

