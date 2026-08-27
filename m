Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF54C954E
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854689; cv=none; b=q6IkWvfJOMmLwVelAcMftu9mEHN2YcvYtuQ9pRZB+HvLkOWa7ws00NEVpYtIMQcbgQbnuBwzJver7B8oAMyIyjlfKlAQPHQiX/0X8O36uGw60xwddgv0e+bcrQMxQ7MFD4UDb0Ex24GiDJUYRzSNijCTx2Rf6+MAhVmvGAavgDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854689; c=relaxed/simple;
	bh=i4XP/y1OtMKTpjmyldq1NfyuUnIY9DtWEpicagMug+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdWyGesMkRUrTmIoga+ecfXacitVmmO7PvGjVGzs44tFDQA0MjpnTJOmpGwzpxUmKFMsuRJMndmco7eMySDw33IcPSf2bkNKeJm+1Wi9edAdfNyGqC4n7Evaoc3sQa3F4tTt8O+lWbmhEOogMX8Vk4jf+8Wei2HAI8qCwYkMju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iapa9skv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iapa9skv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so373845e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854686; x=1788459486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEsNUYGlKy1ooscwN6zWUOqqar7TDxOoNVnM+VqT2yI=;
        b=Iapa9skvtRpwWm+23Qx5CQaOjl0WWxsy5xmXHhraKFSrXW85cuBUZcPMjYGgrqsnO/
         pIRZhlg65n+lsn0HOqAGY9Y1ZbG0EQhU4MnOx1zINxwU3zYpK0W2REHmO93eRuZ9PI5U
         UZHjbdGWCfF1LD11rWcHzUS5SkUT+HfYbh94YjQf7XI+5fhdOfVJxn1ay5TLI4gpPwrx
         fwJwWpvuwXd5Rb43zkQ/0RlIGauV3e5/pcgGte2V5PcSAeZTRtJHxZ7u1e0xWArS75uJ
         5Ov142lLZC3d917E6grxwwEvuj59Gtq9GfBI8D3rRTw4AIUTSkU97Ifbd5Ia66XKLzV2
         2KHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854686; x=1788459486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VEsNUYGlKy1ooscwN6zWUOqqar7TDxOoNVnM+VqT2yI=;
        b=gdgIoJpoYX1MFSMTAzHD7KxfyRNpNrocTfAI896iO7RrR5PX3+9JFf6VwO+dKcbYOG
         l2MHFv+zNfRBKtw4zwt9/xolbjGhBMuH+82GYVSP0zw/SneIErwreMEi7OF7S0lJmWGy
         xVUGjX2OjJcKouxD9jGLbM66KJ0asMIARdJjy6JaUs65ex/xn9hEKDdWWsexyKDw9Lgf
         +Oy+3apkJG1XdfFPLSYxFWaonatYWw63x7Evrkzr7+WwoGQV9ikIGGK44v3/8blPPak/
         N/rq6X4iwK/QXj2x9llocdgkQPcKGMhiU17xynMbJGw3LwffRUfr6TbEgRllx/wt149g
         lwjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYizdh1kyROXfb7Kc/0FrBvB6fPFvLLboMz/cb9LC5K39Vmm3ViS7Wvf3Vou3rwHQ9G30cc/ael/DjyGJ8@lists.linux.dev
X-Gm-Message-State: AFuF++nO6I7DW6Dg+5PPzL0s5aVp0YmsrZ/EFM6yJLdYlFKU6O67FEhh
	go0lAXpcgWxQ4gSqE2ycerlp5THL4mWbQjVO956DigTn3uQY1yChlMMCCyB/cn1m
X-Gm-Gg: AR+sD10pIYmDc7kXZDsvDB/e95PjMQ+/pQZxrxH0I5R7fZMcvy/LTh9melF9qw0vVxy
	GtLzaB+xXk4FveTxYlOuNEWl+njYoDRJsACACRZGkTw379QfIQVbS82Oc8ViWJDg/GVmmnOz9Yu
	cfhcjmu6KmPoBfcpQCHw2lcXJI1EwtFZ1AOMA27ugFQsWgC8piYOcBZJnzrAYymB3FoO9spTQt4
	5t0gSU3c1kR04qz5tx4K4ZS47qjG0UCE6PWzJCxj79fKAiRblDNUyJ3s1NaL1uCo5nIGE3Stzd6
	bM0hb2e8fcV4Q1IZdiuoEtEq+6iGa8Fn0n9reOR/kpKfGHOpftpuCdVl1unANysB5okGrbeFiLL
	WabWMYxc/yS5xK6ab7rY2Z3xJTvzRJzPCa2fHJKgluj5/A/jcCNE110jzpsNFNsR5gPLQDZMmL0
	qRSSXOTotpnZJheM+FwwcXgbXMQSGDi2vFb2XHFF3xFU+GsfDbg61VSjUwbX49f0kyCwzKaNnMW
	vTt3WzdxWCGcfy/qEZGQLVoyIGhirbGihvK3hfpHhCC
X-Received: by 2002:a05:600c:3107:b0:49b:4dc0:9a06 with SMTP id 5b1f17b1804b1-49b91c50f5emr10361015e9.13.1787854686006;
        Thu, 27 Aug 2026 11:18:06 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:05 -0700 (PDT)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 03/11] media: ov2740: Use C99 initializers for ACPI IDs
Date: Thu, 27 Aug 2026 20:17:48 +0200
Message-ID: <20260827181756.2430054-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

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

