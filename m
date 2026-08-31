Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D34036F905
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199274; cv=none; b=hkSFmpqJT/b8yfgz9Px8E/IZEuUf47203oBV+wj8aMU/X1LsdsR+7cuVpnobzJF+9HOVq8cYaSFKdg1xRFJ38834y7d0VBVvQqrYPV8wSP1Rvgon3R1kGvjKtHIHxb8iRGU96Z4U3IThj5Ml5nQCJTjSeRHG9viwa02JaumuwaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199274; c=relaxed/simple;
	bh=dMHhEeZzc+g0IX6lqLqY4IrziqVxJJRg2znt5XQ0Rfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGKYX0Gg/H17zgvzbE1cs7n2vd85fzzdSaY6clC+V+KQVwzDj9Q47+5WVexqcmRGtzWxE90uW5gE8iiM17CIxMtpf4cVqNSsmlxnoCf8RjSNIMWUgMz8SI17erN+60xE/hQmdTL12lG8/vmNeA0H5ft1JEfQ87oCM1LIDF7GnLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fy9GARZa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy9GARZa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so10772f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199271; x=1788804071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XzF2GiQLWqxybVzvZE6EZJoLEDzHgosCVIqT/75toU=;
        b=fy9GARZaDdTs61uKD9ZgZVNAOwUDaJlzLlyA05x9pCa159BzKJ+UmIzataZ4bbW5Nm
         9iqUBqK46rsyZGvWdfKja0KBeJo8mM0NzhvyIalCFJJoMuI+d/KXBpo7nGJ5zfrHE7ig
         suagZp8oMV7cMM84bIj2AGGt3l/3I1MquJNVrzNb8dRxHIqghQ3YXejrV0abLcHLCZEJ
         Wc1WUfB3205+qBjLURRvqAUbwo3TZP89U5UkICBp1lx5/C/x8W3DwG051c/VEhlTFHWb
         r7/0wBf3ddxQEiO6d9PAdUMSlAoeSMTjHmmLKehMPpafd6BmlipMUbk87TmhvAzvVfNK
         18FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199271; x=1788804071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XzF2GiQLWqxybVzvZE6EZJoLEDzHgosCVIqT/75toU=;
        b=ayULBnzs8rapGvUEHtn5DdmuuE8V147MGnx+/4iw38ATgh4Y42jVkf8bWeS6gXAHwH
         tI1gSQbIZf8+BJNs79ggtDGqM02yLCE+9gaakdxfuVaFQYbRTpN/RfqWF12ZSojzw/7r
         Fgcc2Uo0gRr1UqPtbXzsGvPKJXBLPlSk52qd7EAvJtz6fOA/ZppgVz1YFuwS0MYm3aux
         LQu+Je/uC696vkbIbmoPWdCwysc9le2WTALOlWnRLMcdyxILmP57MNZC58419Ok4nuMO
         uRobcJeETRqTyIcJd636pezyE/hFTSsv00Ex1xt+UnIsmXwNe4ASv18q+HMFGQ1U7FJp
         ppEA==
X-Forwarded-Encrypted: i=1; AHgh+RqUNI/FHEUqD4nOaaTcYsHXSeSl8dLNoOhP1TWeicg+4rlJwllwlf8hvMfN3V2bLMXJSj6K1fqF0UQhDc1V@lists.linux.dev
X-Gm-Message-State: AFuF++nUH9mxS/QnkECEWVSWDIc+rYz2ZVuNgIss15ruEuoJltLbkxh/
	eIjc+c/P8YmYaKt1y6NZHLg4MOMPh15u8Be7TuALh1DUoXr3UFftvpyiH1qEKVi23vg=
X-Gm-Gg: AR+sD12De2O0h9p5BSzr5sV99y6zOAujkCYmTocfeu+i3YCq71ZiTEs+P6uRDVi89Nf
	j3zKbVqeefc7DRjPk77DEJUIJkUi0dEejzNtQ7ehEmjnHBUwixNkq2K0OoXbWLbiTrFz39uFJKR
	TNWnNLYzi1tO4d6NTLCxumo1+LUkx/zQXPck2QAdCQsi65du6R0vO6pkEA8IA45tZJsWd4tSTr1
	ODpB9F5nlenRjqImCGlbJAiD4R+GLzTpjda4hGpFoDU84klXJYe8Dmh7OYr1V8/qsf5QAJmXo2o
	DtlBA4tOIOy0wVnFa6PWEqcvwmwBApQpSMjmJMSiKP/r0GkHoZUv/1EQvaW74WATyy6yZeE7A46
	s6TCZdrh7CPJFQS/2A62NKF4vdzkcP3rg6dIENV2rl6uFVq8czE8NPgxJoFDivKgKX8cSojB9Ws
	SuX59rOn1mFIfngTmpkj0Rt67zUuUwaQMRhxFqwt8o09VYovY4TD2AI1WPQo+AXPNc/kV6tbp9t
	wNng69pokxylxvIyzix3gz5CHonpOmhMqxfz4yNLXCArdDboBeNrQ==
X-Received: by 2002:a05:600c:46ca:b0:49c:db20:da13 with SMTP id 5b1f17b1804b1-49cdb20dd1bmr85500855e9.5.1788199271314;
        Mon, 31 Aug 2026 11:01:11 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:10 -0700 (PDT)
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
Subject: [PATCH v5 03/16] media: ov2740: Use C99 initializers for ACPI IDs
Date: Mon, 31 Aug 2026 20:00:48 +0200
Message-ID: <20260831180101.3109854-4-mauriziocasciano7@gmail.com>
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

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
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
With Best Regards,
Maurizio Casciano

