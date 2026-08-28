Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67078390231
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933715; cv=none; b=bKeLWTvOksc+qoxSnnFJTDOueGqxg3+9hiHy5E7tnHEdF7a2K+Kc3nVucqqjuRW8JsfBX7C/F+wEhNuWIXYgfmFaCZ0D8nJbOvJY9o7QzhuiD9zN7AbpVGI2//A+Wzmuy3qF4mwmrL8SWgFvKJMYPfjkXyTGpJdguBt6VeJb7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933715; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4L/YV7kNw3gD0Um3VQ+GgYcrvKNQBZKws2dmZjWoD77OBpbed3UphSf9h6ofEls6e3Lm0V0hq3zIvyzbcHsgHe8dWpMGTIzEfA8YVutAnuAcWXMqMkXTxUpDqiUP6b5JPriM1kEat8kLO9ht3GKFZTkimzymUrxCxb9ZFq7DMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BibXnNEX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BibXnNEX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b965570d7so8608935e9.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933711; x=1788538511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=BibXnNEXdqAi5mvlwDsrc+L+GLuzOwxpRJLJ9yEf0AEZhkB+EyAvjSagdkl9CybQkA
         Wh+y62cDjDBj/g04r8gYSZhqv4V9hN+v7Mvq9WuHreJTcVhAquSiGKNwV22Kpr5t6F7g
         x9jesJ+NshuBiiuwXjmkjgCmRpmRFIgkKiEGPS9Zcvp4PtYXvFw3DBpPmoBx2gRTSUf4
         vyR/IdVqOnaHVouBxrDpMcyaJmo08E2x8i7DXu+7q0dbnk7Qt66lKf8cMI+b5Aa/krks
         L3toPElTzvnLx21uhc3TbAcdenS1Re08iO/y/DEcotQcX1sM5MLuaqb84RDWs1z4Wq7i
         HFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933711; x=1788538511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=oL3AdVJdDTx+qnXOIXcbvZfB28JyP7qCEJNstq5HP8kXHDsBoL1YQDpkWb6Lre+E2u
         ie0Fi7N/Faxok7MHXpefxioxehHo4ZxPwqK8iLQCVTb5IVzTUyAA34B/e4orYNcPEFww
         lNl2N2ES2K0I6pP0aFGZKnC3J5Yvt6GUQs9/hZv0Ok+wNJiFWZpDS+ENa3aQEMmPwUBV
         NwwsPGJBdPYH9xCgYXOInCAs8PblDkO96cu/+1ph0/yxpytJC1XkVGts3kV6vmCwo3cp
         G5l+7ydTF6vANWHWEVBAhm+0YGlH95Obo7hjuwNU8/SaS+jS5K77M3EaLLDgOxmsiu6n
         14Sw==
X-Forwarded-Encrypted: i=1; AHgh+RpkKMxnqxemTfcNy7wKOlB9Qf1nwjkLK1lw71Eq10c3IYFRsplVwxbCWZi1EHaqgKsClaGDaOa1EhDV0noy@lists.linux.dev
X-Gm-Message-State: AFuF++lGFH41M9vACox27hRKec1uXI5GFSyhzgoqPj96++y2RTFj08IV
	sMsOtGOIgDYutjKgW/DEy6kbn3Q2pboVSfqposOKimAe4EJnKM/EXwQh
X-Gm-Gg: AR+sD13+fRM+rZldPT1P7OemXjxqf7wBHRRpdhxxj0Ef1IGLy2TEz9G4RSfAnG1Irjs
	C4med54C+M5Xv5tqPushSz17+GsVQOOP/Jn41P6M156FYO47DxfatW37Hmbu/hQ8Ahkup7xtbCH
	Ipo2NRZ6WrfGWVYAgJlTXjFL4tfxw1gOEdpZTYJsGJX9+aCCbilUruSadLQMhQZKJy+aXsTZxJG
	IoeGMDR+DKJ8nJI5mMZsbbrfig4LTEtQ2vVtfuJg0Ii36aqXn/q+7qgAaEBl8nfo0sZAjajKUYs
	2J1zSWo5gqlzsdgxnBtMmwkhpK8Ihf0dAfDocQzkILTiCW3wCNPKOIYjwl/ZNcqKEZ254V+FFaw
	YbZelmlzvzPL5eatHHBerXvt9lB+eDOI1o1f8Ncy7HxlzrVeTfzDNsTUIZh/S85nJ7ymDegpNNK
	Oxp8VVyjPYU7ZHio0bjwyGgtf9bYzoe8ScJy9oAmUHGpNQ1kBpmfBmnLgas2Ip95EQVvHeYvWiJ
	AmotxokNxvedqE9WGtuxdQdA5RTk43fhm5IHxzXKQ==
X-Received: by 2002:a05:600c:1c0d:b0:499:a5fc:207e with SMTP id 5b1f17b1804b1-49b91c338dcmr143772225e9.8.1787933710585;
        Fri, 28 Aug 2026 09:15:10 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:10 -0700 (PDT)
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
Subject: [PATCH v4 04/15] media: ov2740: Add OVTI2740 ACPI ID
Date: Fri, 28 Aug 2026 18:14:46 +0200
Message-ID: <a04beb60575ccee57bf0a6079473df7bf735e145.1787933456.git.mauriziocasciano7@gmail.com>
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
2.53.0

