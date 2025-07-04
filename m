Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B882D46A3
	for <linux-staging@lists.linux.dev>; Fri,  4 Jul 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643674; cv=none; b=mXp9fE5nlzG+TfMCMIPP8to7adQ7/HgNQSHenmj/pn733jNUK4c9en0673Yf53fL1zwMzMuh2l4cB6BBP44m9WktY+cygfrCup6AMe5oCd7HN8zdeUo2LsX22NA5HXY+z84PIvu8BS4aBiNwh/CfDVkKjY4uzApZhge+sT513YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643674; c=relaxed/simple;
	bh=xYLbV2QqFNHa8jDpZ/vCY1TRrrpjjetgD4nLJ1JjhaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmUxESco2BkpZiE2HvesNjShQsAu7MNdwiYIYvra+1K/OO0w3NQLm9aRzwTSHnZahlMXwBMsYDsAt2tWFYYurldbSGo/z4OySiFM4BdHT/6IyBsK3tF3fXQfyE8LMStUm2HFIKCWBQkRoHi8Qy8RL/k7p4AjuXaZcmnmUeN5D/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uov6Aqux; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uov6Aqux"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23c8a505177so3858095ad.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Jul 2025 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643672; x=1752248472; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9FXgo4kOOsPzZWvaw6DLbnFb2GiAYv+/FkUIxgcH20=;
        b=Uov6AquxfJcI6nru/HtSEoV0zzNyai0+qkqmUNqpUQwOv8+aWvI0jTpxRfwl5KSfme
         hvvoWQOOH9sAIsIthZRGGJZLSZ4OfKaJmQgCXoIJCTvjVHGjn0nZb7Y3ixiMjnYOk5xg
         Os5Ae0SkRdzFnPvmvt/+TfNZwHGi2r4WJAmmFD+gwacaCvTYQF0zTHs3LsDmSs0pqWGk
         PUP+AoFZQXZBGDT2paFgOX6gtk37iqrm2H0iTYSeexNtNF6Kgu3qJHFYvLT9qG04xG+W
         3SM1S0zF51zO1CIr7M17oX/a8xK16CGKOz1RxcrK6LpWXh7BRDJPWP4Lcms/01TIBbKe
         8+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643672; x=1752248472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9FXgo4kOOsPzZWvaw6DLbnFb2GiAYv+/FkUIxgcH20=;
        b=O+P46NolzLZgy2u5cpOYsiUZlWROB7v1mgiGkCHkmVXxYkV5b93MdgtEq4X2c7pKIu
         6bFoZNdhQ42NXhMzb/YaRmfcuTynJwjKS+8iAWEfgK6on9x7qcO6xUtwbfKG/OA0zRQE
         9AWAQb32/n78/aE/W4qBIfn4Bs/A2VsUN9yYROLZw6UOPthTC2Wvt06R/Zi2kkkG+m+8
         46i2wxFnTmNGX+I1OrvH6wcslEI9NqY9HodBD1R3VMTOdQ2KW3fDHuoWmE3Pf+1Dg89X
         fgYGMRwKN4OylhNp3DtTLkXiHxZYetmuMVJ0bvOHH3o9XI0aqake1NpyA8pWrrfy57HT
         MzHg==
X-Forwarded-Encrypted: i=1; AJvYcCV/RnTG1TYkzp+o7bTuvjYApMxA+yVPplnm2UD7j6iLLkTyhdUutsMwgg46P8EABnqDkzabCyd1gjgT3a1Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwttUayROstnw1tA09o0m5boEGCqy/Lh6x0A8PsFmD7SzQsrOq+
	QWW0ohxYCpG0ypF0i65DJPgkpgi/zJ9cAvShMd7jNGBu019jjXUozfct
X-Gm-Gg: ASbGncubtJcx3A/SYI4EXBlYyFfPJP3ycfXnCcyDG34dAA+1UiamM7uVw9l96XvyQgc
	L1hcR7BnvPERK2MXS5WsxerStGbl/EZpVHQcyeAcLgEqvYiKH58C4se+f/ZlLMVezHwxBMFVW8I
	INqV7niqJzv5IY9ExYrie3r9Zws6uUFoBS3BzZ8Boa3EnasA+zYjyGGW461IJXdAUKzGPL+8F0w
	nq/LD+J1iIRJBIOWavg8/4IRdv1Or1A9JHHFC1Iy4FJpdLBRi3bVYf52FNGtdNoAzjIfpMqbOJ4
	JoGy0MAWVQa8HEhKODWnFjtTBQCGbi42yorHLM2O4GPVxWzhszsH210z5OKJgRYv/ShFZiiYGPD
	eqICaJTbH4wcOwj5fJp/oWHX44RIHCh23S4SATGX8uHkDenAEtQ==
X-Google-Smtp-Source: AGHT+IG/P76dOfXnU1KF02O5kxsvQJC3lmARtg+FeImu9RcqMS9TTJhq19ARbgLlFkg6O+xe1izNwA==
X-Received: by 2002:a17:903:41c6:b0:235:f3df:bc26 with SMTP id d9443c01a7336-23c8606baf1mr47935955ad.3.1751643672356;
        Fri, 04 Jul 2025 08:41:12 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4b6sm21912375ad.29.2025.07.04.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:41:11 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 04 Jul 2025 23:40:52 +0800
Subject: [PATCH v8 1/3] staging: media: atomisp: fix indentation in aa
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751643666; l=1280;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=xYLbV2QqFNHa8jDpZ/vCY1TRrrpjjetgD4nLJ1JjhaU=;
 b=0l97E4GtpF151G5Q/EOBzlk5pBjplayMLCl1wJKdXl+23Lrop3GD5ubW4+Ry8pPMZ4mt1eEOQ
 y3BDtRB4uvFBCcuW+KIzM+JP/Dqe5WJCroZEPT/zQBdyyG65qhjcyfj
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in aa
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75VcPzq9XrFD29+uZ1rbFcDxb4UbXNkv_QZ=3iyVm3dxyPg@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
index 2f568a7062da726397f55b1e73dadd27fcd1f2f8..edca987ee20931cc124a9af74a14698ec12419e5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
@@ -30,7 +30,7 @@
  *     ISP2: BAA2 is used.
  */
 struct ia_css_aa_config {
-	u16 strength;	/** Strength of the filter.
+	u16 strength; /** Strength of the filter.
 					u0.13, [0,8191],
 					default/ineffective 0 */
 };

-- 
2.43.0

