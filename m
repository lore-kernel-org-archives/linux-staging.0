Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B54A0F0F
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289492; cv=none; b=b4JtYexEx5Ve/7afbMathKO0gsySLWp0sqtP6wycXgXgLttW7uLsaVac0I/VoZcWsQEWArtaf6NFgx/N5IccQRCjwT3T0P7sSTVMGGsTclpRhHRS1+MfQkX1qvzTBLP45xHEKYUVOSWJeNQFbvSMuJBktSyCnjkp8S2tLDth/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289492; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Np2ECd8zAQQ7TSE2rSFAYWuNeg/rHRtHVmCLbJN5+AKqFwo1CBjMOSUas/msgE10yAHM+268Oy1A7LXhPOLNzv3o4hWybsFumSPflgeDpGSQ3Hox+1ak+XqWJxFMPXGUDEiWsu3kRoX8rrLAGevNzLuEKU/5+JFCrb/VPvvQMOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVpf+bSW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVpf+bSW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso1448585e9.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289488; x=1788894288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=WVpf+bSWaDHBnQ3h9LferCv+k+2zIqMA9z+8SuwYmFexiTL4Rl0eSRYAM1fAUEKxuP
         yrskSwQravsthBEACbqHE+QmX5nwzL+eDql2VwWWJfL0RT6I0V4tQ7F030mHWgQ7jWnn
         DxIotc9ky7+a3+ilyrNsQ5Oszgbg3UXxiM/T8WnFYEzT2I+NdONFoQbdhnHSrVxDB77E
         U/D0qz5Tw+ZnRzz61/Y4MCwM76uTgP4F54H/RX4UzDCpSlNx5iW642ZZV6kFse6oKhyx
         9SgwXJ2QXYgZNUTNaCM1q50n9/J4U4hPOrIRpZoBhAfLcNo2zaN34q4Ee9d9rZNzpb7R
         bmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289488; x=1788894288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=ea0iGm9zvxa3oOPBcW0AwTyRmMj+uZdPype58vAYF0LDgXRBo/MkN7UPBl5Fq1qkKO
         HEpgGwz7UluCYlIgxP2bEJbL8DEW2FycNfzeY8/C7diBusvYOqPnZ0ge8plF1df8GxKp
         KIOIoa8qxXJoQvPchPeJATLOuOK3yu3c7bHRMucuGffQpcEmaI3DYeXkprpwisK9b7j4
         3xITdndiHYURCUUrJJ5FD46RcI9a6eRWxjOr4MY0M9XAH751jj6isbg5R3BHoFR/jU2O
         MdUkrMpIUYpWee2ohPMVwibNoeyAk9K1qjU0J4r5ZLy7Y83JXB9F7pZoEUXCqwd5mg+b
         JHPw==
X-Forwarded-Encrypted: i=1; AHgh+RqkO8ap4kBIGTwScs6/p8czowJXtBrwbHVqClKxXeie766EeJMai6k/OraOHjU5J7BZm8Vv+JsWB3I7USFo@lists.linux.dev
X-Gm-Message-State: AFuF++nUdmKWVTJbtGbiwMG6P0sDKzvyeNWwtjvAyA+a0ZsqjjJKaR6d
	+/MlU8Zxd1cl9alfYiTX9xSnUGsOF9gZSZjIWrrAkmIN+t8rJ6LaYiQ6
X-Gm-Gg: AR+sD12jaSAcS1fbKFy++sUXy+LlPE5ffskWj1OthDleczCrKuRq/YTzvgdgO61QXui
	mnEb4MjPxnXbbE7aXxwcQv5fFRCfwsb+z8q4wd8FCt8mHJiY3Zj7G3bHxZku8vRD/mjBX1KIWsg
	WKPYCDhOCNmfLjzvVnVK62a/+38CRmaQrjZDwp/fD2JNqwTDxAsvtQvwNfp08rhPGQTWfKOe5Uo
	2VrmlPTUIZTr/QST4hby1YhhRyisKfIaMB6D/aH+st8D4IHq+dhmE0iTK2kYeH0IbM6aNMYAzPV
	Dq4mgs6nbXJ9HJql79wdBReBYWSQIxdgt11qMwtPhcSWOJFNYS39GM1IKXStFeK8dy0W8N+pF7p
	YJemOVNUPzD7HNxKcDlu83HTCIjB88hiUtNslfqj4XVkl6uf4oetn/9gEqQcTXzUuSfVeZ+jOnO
	KRvhcjGhYOFXh7I4Pn1o6ng0MBrAbSZGrsuFJRSaYg4L/3r6UGrERHmLlJ2pSzDruJfCaJIoMgW
	L/KCy1acU7muyn0nMeK6lrqqjdZKnErG+3g0zSH0g==
X-Received: by 2002:a05:600c:4747:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49cdc57bf3emr158663635e9.5.1788289488556;
        Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Tue,  1 Sep 2026 21:04:26 +0200
Message-ID: <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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

