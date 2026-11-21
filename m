Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267976;
	b=TjovE8RVcsgoNdJjKwCkvGkj56PlVleqLYl+5QkYtW7KFKpgIBaB4rEpJQYtYlLIecpR
	 fPzUrJasE5EYICGKhQTT1J5/621AeWF7+/aDKwvvmP6U4rhqzT3KS0HK8rPnqRwnoy4hB
	 q6HIeNWSDuk8XsLmolEGydeS5bV+u99NAfMUymSLZj8Wsz9UVAp3Ace4b4jrmC4Kq0yK1
	 lWDB4NxVtW3LB/ngQhqIBBLx8O/LiyPVXsEyDuZOO0i3N4BVoWBksKblsbwSoMe8oYqxa
	 NLVnZLu98e5TJiospXuJj/hzPTzTgLkX5sdphqq+0p2Z0qhv04OXbH6mHzSUHUnA15A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
	b=GOh22P6cBsS/cCn454Caq95CcZGCGTyAoOW+a8phkbZZl33NzJDxF3Rxs71Rl8TNq07/
	 YzXKoypHtKREipcoBB07JcuAshgxe5sWBPyJlTy8kZ6TSFu4MeFtLGGEggf2UlkTpXp8W
	 qPvXfxRvojQwTdU6Hza9CWg+w3aMSyjfcFyht492SW8yeOqDmHaBaZh61WS4XQFK4qgz6
	 4m9urnS84trq1H0bmulgcfDcUibQzojwDQRMPZe/jIenkFdGQewg5t27idCBcr1V6mI4G
	 Q0R+RHO5OX1WHeQ3rtypoScPeGdFjSC6kMhEophSwAuErvtF9X/6NKm6s2CT3Lffllg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RG4HrdDs;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2959A606A6A1
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2959A606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RG4HrdDs
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13753735e9.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267975; x=1795872775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
        b=RG4HrdDsEbMeW39ijfVuN8z081Z6onb5HXhX3HqANnyIlaC5TUQwBe2yckp8P7WXkd
         ZNmX1PoGsERIF/hB+K7ibOg1e5f8ldLzRgypEZbtg9J6Dqd8SUN5jlma9D183+B2T+4F
         H3lPQMFJlxfmsLskLvBQnuxrwIX0q0j/597t0MFcKcLrkpW1FbqlcEwnOls+JV9dLv8Z
         37Q7aodF8J4s1oOQdQQlKvQCffs25nIkKN2feGrcC4FmP3Do5Ss6jQPegW9kqDGxVi2N
         fg1Xz9iah9vmqEpSV9KRjLNBmsCKqoYXHLfctSE1TwgCEw5iyr0B2Md29D6OKTB6jT4B
         ho2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267975; x=1795872775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hj7yNn3putJz4DcthZJ/vjPhR/zNcYHIbbwffyr61oc=;
        b=JKGzjSCamXNqWAByVLcVcUZ955+QyB4KO03Q+tP7v03/lVASSvy/6Kwfh5numU/hVc
         T49UfYeNKxxDMjbwb+NwQX3cFgwz/JT08O5Xk0N70IEpma6mD1uyNGlT/m+y0PJUpDwz
         y1Rwq4knI/QfPiTqjsTQ7LBRVKygpx7Wi8dyS8XhB303urQqDo1yXcGhJ/kK0Ktqr7oI
         W6AbDQMGZT4rbJukmCq9IP9bnv5u6dowlBNwd4rOLrh357/Wq2ekDcZUr9J6pOAbJDD3
         dbJxSTqb7Wr436Ah32fBbP7N+PAiTvtWYzxUSf22QJz5DfaDsD/m7q6baS8S0FfZW/6U
         Shjw==
X-Forwarded-Encrypted: i=1; AL+hErFp3z1GnZJDxcAxA59VESv4IdxyeTurmNJ2QiHr9D0+5rP3etWZ4ZIxwOCraEWadTd/8d+UCG1Us67+qO3S@lists.linux.dev
X-Gm-Message-State: APuU4Z+Z8pgxvCGAiUYYJJ75wmdWH0oy4vBt/d4w2qBMlxyssdFmyFBp
	QT21DaQGSA6jnqGZJSTnBcwevQcuxywUMWiux1/R9RifArNpGuCzDAVHjmmc/A==
X-Gm-Gg: AZFdTZdNrzORRc2XgKuh9YjVD9DyMyGUhBELnwJ/F7YMuQ5EZ3S0Dfxy0YSn0pqxkIt
	EUA4eIK2J1BLmecSfxsvHRo8D+B6XeMBt3cmIbxMi7NNHSUnN3GKwl86Z3X51dnhC4XycNXPLBK
	D4Cmxcqd3JThHC8hVqKDikIw4V5sg4hwbgOpqmrNhrI/uU168JY7RkpXwd4BVdVs1WhEPtiTAsm
	KiQKNsX4WfhB/V9Dx76fH2ih3fHUyRIzQ7sCOcIBtbrudca5XWm9dcH6J46W+o2tm/TbIDfLgpN
	mFrTIDT3wW9UDP8ZLb0rRPjbiB4TZnZSsQ+76BRly11wJ361izW3JKSoqvJ1TViFx0Pde851p14
	Ym4KDtKgRp8g3M13uwwaoU3dPK9fDqGoca7M1Wf9qiLawFjvgQ+HuFkzU05z27IbiF1+9OnOI/l
	x9pOcUxKfUq3KHR0N74OYBsYc9Vvg+LsAlDMjN94qkDXpI3J+FRhQvk3Zw5fXDAY9Gy+kWHLQcj
	5pXFliDOfw5jq8GaXWpve1Nl6Kd9+dfpEHAdxxz9XoEKgpe/GMgNBoqJU1IHMfNHd8RxCB/SJVV
	WBq9ggXI9nML1cHhnbO9Q+ttCyHUAqZYXrDYEfzYOdAQs4dcqI92LLmzp2R2meLxxnbLJx13E4K
	IYSj6PJYADLyK
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr132851145e9.0.1795267974678;
        Sat, 21 Nov 2026 05:32:54 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:54 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 04/14] media: ov2740: Add OVTI2740 ACPI ID
Date: Sat, 21 Nov 2026 14:31:34 +0100
Message-ID: <1c093a6c4acfa46ea1c4b159ea0d5eb2f3085f14.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index b7c0f2890..7d786d09f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1463,6 +1463,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 
-- 
2.53.0


