Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394C3DDDB3
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872671; cv=none; b=pUMTyuSEjBe+g7NjYN4kpHuIJCzKFc5y70D7KlNvQiq2kcTyzOI30j7+DYE/fetaTBVRvZGIgyrjBYbsdElHXRPhlDcyLvFMgMA9uwQ5MAxvYKI207g6dEsgKpzffp5xPWrRP6tzfYkrU7pYWtDBbtD8rx7VsMBBbKfpQ53R65k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872671; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZ0dgnzF8slg9Ys2gKcUweuhF1W23GIDyaPLBnrNpGdl/4YDyQfP0C8+3h/J76KbYpMaR8LHTt2/fzyxyOvu20ZsbgGdh+7GYD34wHuWfI9u9i93/yg7E0wJlq38AOmIHaXJ6xNu9EMPpoWffPbV1d8A3GaRgvlNc67rehZStv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8n2byOI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8n2byOI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so2536715e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872666; x=1788477466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=L8n2byOISW7VpUniorpGJGWNQJQ5jX3bHorolPuwaSQW5rQ/gXe2TfJuRT3NdnkGy1
         DAXZou2iufCxsa4JOW1UUwv3R+mmB5KuGUEsoYeQ/REqY4OYtS+LPcICB2WPiQxazfsT
         ulsRjxIbfOTQwyOHdbK0kUuHUDo/gEaE5w1cpWe//vOIQl2l/6raegb5VP7AEP90llwf
         YN3MWfP44dH3MMTFQFdsE75Jf6xFAFU3akmWFmCqtex2bGUpRvW7YYY8dBWB9lhS7j4K
         P7xbxyBzdLc6hYQ5TULjwmY7acAKtgG8XkxFkwWVeYhToeEMT8mtVF+fkW+NmTtyIrZn
         TO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872666; x=1788477466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=TwD/GqKFu5oS8rIxmkYQhAFQEPv21hisYtSnK/jwKVUFJ50iGfH/f2VGmpdPTVygJW
         9/OF6bWuMW4q6hnLPGm0kRKEXCt3JfBIAhQNZ20tSq40VWQgQ/MueYBvIlg1RlUx090c
         i0oKfQEQ+wQywcHyjagMqQw4OKOxCR6TajbKF/qcLi1xVXpG30LgMPQHo4oXxWCAfqNU
         O+9BmGIpdqpOyz0Wf8PuuD/tQXfE+cMCGkSm+9cov+C1lNUAgTvThnwSTdD2mL22Ma2F
         CQChxa85gPs2Lf4XXTNcip7EqNQLbh/J+OK5PzPU8yrFOKHVu9JA3RHgt0k3vshjAOhH
         s36A==
X-Forwarded-Encrypted: i=1; AHgh+RpQytWuELwk29/wBro63jiBuZK9a6vV7iiyNCn2i6fFEr1cIUHbXxkJn4niCvZr35mCUWxtCQkdM3w9k9vw@lists.linux.dev
X-Gm-Message-State: AFuF++kzdAPaFfKOzLGB4yIbUa2fl6wAvRFIVghAJiKH1DSePatcMqN5
	xL20iUTgJ5xy8qtE5L5TD82qyu7sEqUof+4OVPA0ZiK1ajYjxQD2a1LW
X-Gm-Gg: AR+sD13wI1M5bP+hWmNxsmW9dFNWw6Rj6ne9/DKGPaj/s/X91iLNSnUhAxewN69LDvt
	MDxv7zflTCi2ez2A4odF8xtNhG9ylQtpj88DtVv1sSU+5cgUiNwrOmshNSYhD0N/ZChESlz8vPg
	6ZU1EHkmIA96aytpr2mpz4/GPn879VeTkI1YYWeAcWzL7JaBHtGY/hA38d5FHr3K+bwSM36OSD+
	Jjiv2m2Wq0j5IJHRXEFUjhUqY8DozQfc/Ty0boTuSNu8bOtsocDjyH5ztQj1Y4a+N+1aP8Px2UF
	I8+NH8FtcW0vqp5GbCvWksaBzpf+QSHaE7LUoYbRySKkbJefmcawWeXJzrppV9bGcBWIibowQCT
	Bdg8pd4YNtS6fT0soNuBQKntO8X7mzZKD5VTA0SkJeidlUHZwxwKhYAGoFCAXBCYGE7aTgC5Jw2
	4r4FXn8FR+KeS54YQwmbj/NVfAzXhXgnnIkwx78PS0kJtUqT8IU/qOLIZWLSqi8+SCaiP3fcsUq
	vqxSQuPhJ3Xfoq7IvNAfbjZOC2aFPq5H8cYT/eNFSjeL+wdxZ818Ys=
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr30266455e9.3.1787872665851;
        Thu, 27 Aug 2026 16:17:45 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:45 -0700 (PDT)
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
Subject: [PATCH v3 04/12] media: ov2740: Add OVTI2740 ACPI ID
Date: Fri, 28 Aug 2026 01:17:22 +0200
Message-ID: <49e05167a81e22557b7cb08c94131e774e524379.1787872237.git.mauriziocasciano7@gmail.com>
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

