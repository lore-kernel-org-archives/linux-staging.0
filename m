Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DED263C8F
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322726; cv=none; b=RrRen8/x5LyXYLb7WngVfw0SojkveOJF/yFc+bTqMQWpyu7fgZMhC9Uk2AGaAJ9HCNb/bWhQN0KueeVw/MGZPeHl2gfnUXzWjumh05hxRjvkf0b8vRhp91qo/AuMXtmsI84lCsyr+YsYl516Yc5G6iFdXsqD6m7qo8QiXfzJcac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322726; c=relaxed/simple;
	bh=pj6ooHPpY02Xgn4aouAqvWLkf/SUqxgBJpi5NWn2MK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l675Z7uBFj9/wv4qSceMA2dE1nYZ2RcnaW53laoRRzjg9RjOU1ULAJmv5xpGH9LH4yEL2PCkhu7Lpnx9jlYdanrmj3d/vCok3Zq/pyfTCvAcgq/zOrfNSwMcfxI3mUV1fLH8hfh6yc5epMrZcE7Nh5PFLMURoSdbBIYycy9s0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhP5GK8x; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhP5GK8x"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so896229a12.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322723; x=1750927523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q39zMSY2QXSvAessIFBztZZAf+LCItDf8l0+pCWd8Wg=;
        b=BhP5GK8xKW7MaumT+FJKzs4AsJKsfPIZRT1AhxofoMCqJ5actzCXEI8ndmxBk3ghUt
         7CctCkbj+BghxFlsnVHrlyRMI0DJ0mNcvHs3i18FO+6ekH6Sry6+MgTKCXBaBg4gX/gg
         zok2U/OjMoFwDbRJ0r0GOPhfsUlg/K5KKj/o6V+7labMQvD1CIYmk5muiKzA28itp2HI
         vXV2ykosJgJ38c4RXQPlpSmzBLiPR/gCXFX3FaB9Qn7JtyPcRxaSWZTkkc5Pu1SKIQPT
         Hl+ogZU+iEvK5wSLFSjN3Au4Wyf73JHDL01Tn4yZe1BLLFVhUm2VA/FtLdmUajvBZRYP
         7wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322723; x=1750927523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q39zMSY2QXSvAessIFBztZZAf+LCItDf8l0+pCWd8Wg=;
        b=SYzXN9CA5S1RFI1eVljacUjXXyytbMOMytxyyuUxXcmO9sCoNziuF4/mJcVjtV4onK
         tdjsyG20AhGZJbyWLhP0MlXE1gM8JzRTaAp4JIAM1JXBupcVdVGTVdrYP2/W4WaJldVg
         TVpFLmLoZeDmzEiCNG6pMcMVBVcCC+wgUatue5g5DwOrBPVA3tdlBDYtOQTxcSmLlx90
         k3dAvZ7Nk3FMh/vRaExT6VgNM8DvYG3IyFv5gBGlxg/SyhBfnuDtVxBrpjEj5QsD7C8T
         07511Qh4cRr2jN9GCQBWuZf2I7wxfiFUK7cMcbrun91dFFcE/wuBcn1pRrs0BuqJhi5a
         +t2A==
X-Forwarded-Encrypted: i=1; AJvYcCUsgeojp4T//NUKF1HrSuahh1S3v/QrPTxY35FJCJT2pwdbBrM9GhhZRheShhCKwE6AHmgfM1yb6n89o2wo@lists.linux.dev
X-Gm-Message-State: AOJu0YzG+RsCX0eAfTnpDFTbbf/AsL5OiFkc7iFPgJm9O95ZmymuL88x
	fonURKYTgD5T1cialF35zp2op1/7ZZaub/X73n37gUsxgVjBLyP5qnK1
X-Gm-Gg: ASbGnctCWolqZa0UybsqZz5tw3TQqmyOMVBP1OwWED0tjlZwBBcfjnc3GnTgScu0l8u
	jxgSj/F2LM3kTcptsN8GWuXpqp8ebo/7PNlWdvOkoYraBucQB2YqT6oIM52fGmNRxsOupuogyty
	OboNerH29eSNYN+Xd7zbnA9zn66nyuZeGyeSwQTwF7A1+KX0UKSk6WSCYl/WhwAhCi26bkiYp4S
	rp7FW2GX/VEhJ7rXR+2BVlT+lYRE/AVoeLguWGKXeF2IOyk+9RZ39OuNo51DQyXKMZLicUy04YE
	Rx7ltwYEJKr31+x160zoBJUX/AoPtuV9A87qje1y4aLPli/HyaBl0jBjohJgyrwerX/lGBdMkef
	am1BcCw==
X-Google-Smtp-Source: AGHT+IEtgbXlUI0CffNxw+nr/zbns5q7H2q+wq2PNORA4Hn5YeiYyblJ9ZadfIi/qu91qFv+IJUZhQ==
X-Received: by 2002:a05:6402:3592:b0:607:19b6:8cec with SMTP id 4fb4d7f45d1cf-608d099f344mr18743835a12.33.1750322723202;
        Thu, 19 Jun 2025 01:45:23 -0700 (PDT)
Received: from chimera.vu.local ([145.108.90.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm11276831a12.42.2025.06.19.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:45:23 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 2/4 V2] Staging: media: atomisp: i2c: removed redundand debug message
Date: Thu, 19 Jun 2025 10:44:20 +0200
Message-Id: <20250619084420.146151-2-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
References: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix: deleted `dev_dbg()` printing the name of the function.
                ftrace can be used instead.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 857d7175942c..6fc39ab95e46 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -779,8 +779,6 @@ static void gc2235_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
-	dev_dbg(&client->dev, "gc2235_remove...\n");
-
 	dev->platform_data->csi_cfg(sd, 0);
 
 	v4l2_device_unregister_subdev(sd);
-- 
2.34.1

