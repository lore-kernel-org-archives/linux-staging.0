Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76403E0C46
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872667; cv=none; b=EQ6qucOnSeJ6YMkDWqXnRA6iBQtfoUgMGIswjqdUVJ6i871Mp9ouWqPsX7KiAwMMvfLp81utkNdh6gGKAaa4sP1NV3uQgxKy2oXX+a0VQlgSUh17Q+dZToJNFjDyEXfmKUYX8lya90XnTSS23RJGgjIjV2dMtAWRNzcS4TT6JmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872667; c=relaxed/simple;
	bh=P2vAhkjwfZLpGHwPw59L73KMSOIBIbwxnRr5PopVIrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfLd5IR9U+Mxac2DClX5/ptl8tz9A0cMDsmVQ+U2Z5qPc/1MXS71BWUxFBdKwjFN0kMrjmLAXXhYkS2nfOzvOlVk6GhDevbpgzwCQiVpD6XAnK9yMPZFPCUhKjSTOmxOcL43lw9yAU7V49fRZAhcdSXvm6S89G3l/RtiSyHWVnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKbCjudz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKbCjudz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso2126315e9.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872664; x=1788477464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=KKbCjudzQvFFJRL7h9Gl5ekWwY0nRJ3Wg9nRftBeY7aXEM/8RvBqgvRK0e83ezn/Ol
         RCw81cSy7msrpKJI7l9BrJAOnVbCaBaxZXqZP4eo6O1hGj89zqMr5yYskcsJsamyPZag
         FFoM/r4PC11eI17eR9edd6UpECmY5jg+gNpYfLMUhUDUYcuJk92NoDlQQnd9xgz5hrPd
         kcf1aIWnE8zOYNsOgqE108AIiE9yputyRu2mXEdyfTsEY94Xw76JVD1yuMKWEn2BlmeU
         x+IlAXdObWHEgqkCRyk3n4150EoXzHM9dHxLCR3k2H3JvtsdmjrYc4RvP0rhgERA+8GS
         1oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872664; x=1788477464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=fDet0MytQ/4vGVFsjv8nxiXiGFFN4+MwtSgZvN1LomOo8YJzwwsQvTqGmHvdK7QERh
         /DIvfGmQgM38bQRVza+1HvgdYsZvMu0FLXkUWWWusao4Ez4sDvwmcLuqAEWInjvuUvG8
         gtk4bSgpr9XhhI8xIh5AC3IHNZAKW+ngbd47T5iD4AaDxCMUIXn1m1caMXcpU5tynxq2
         EVP5Iwc3s7QBR/1AHQZsDxEF8VTenN8FS3FTVP3rp5rf6LRUBW04YVpIKJjDhQRQnVgl
         KzGiApwQ0VaTARLnM7hYyUcdgGBJNsKDbojrle2KyqDd4BiaqYRktZvYh0UXuQtU9MIy
         VA6A==
X-Forwarded-Encrypted: i=1; AHgh+RoIgqaQzWoMOtkj+qv+dWLYS+AYedwlglAECtIkY1UtmtCTDW8cG8HmBuS35ZuoNCMDdqqQ6v2mnBMETDGu@lists.linux.dev
X-Gm-Message-State: AFuF++m0Wr7QpJwI89lIMF/Q7e7WdFQyIbeObGJORsSs6MYu6d69vBp9
	veQedtRBmaNkiMieSUAUiTiroawop6P9xXxfRBkZhNEDu8IHD7T9dm90
X-Gm-Gg: AR+sD10mkqQu0Fo6Aktx65DWmXJHxBibSNPeWCSQnhd+gLDIQawDkrCtUGZ9/WZxboJ
	FNu4pDGx97fcJsuUoMRIkqYwepcXOp9ptGTU8hKqoqeEO/WIBht5SbdgjbNgWQINMTHNybZHl/3
	zKhajT/p8qZOtRs6BW4ndq6rCrN5ihue2ZNNA37yek/CTRNhdeN4upwo5OFZNbRG8Vl+Xa2WyOf
	0a2EvXz4PH+5YOSy7mDplly22n1LVTjxuCwXN89a4M9iaZsVqUWLZAPOzlynRnWZt0hFolbMvl1
	rs55EZz7UiGHoet6Yui6pZy6+2y23CA4PsMkECf1PYPutL83mFE9u2Y+EIWFtlVrHFeETQ9OA+0
	IvEzCuvchLeOk7zGQrEHKDXyL9Q/1zi453ETG50e2xK1+HcIJGyCyHcpqfDaCXeHNorWJzEV+Kp
	QAI0tiiBmvFqgd8KrOQonBptIgFmIWdKAjE3QeSP/EmkIWxwC/7wqwW17sfqyZhAp+m1gVHduWH
	T5D6lL2GT5bhDnNZ6iV37z2B/Vd5Z3OTyUYP/zbjHsI
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr36205905e9.5.1787872663612;
        Thu, 27 Aug 2026 16:17:43 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:42 -0700 (PDT)
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
Subject: [PATCH v3 03/12] media: ov2740: Use C99 initializers for ACPI IDs
Date: Fri, 28 Aug 2026 01:17:21 +0200
Message-ID: <b4d57f1498ad38e024d3c16038e4688aaf452db1.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

