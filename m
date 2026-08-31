Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AE357CE8
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 02:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141969; cv=none; b=kYVs22GDVTqI6U5V3lm0bvXSMAwigmMwGFwZCkv/wtc3pfpG9T+YbM8I0LSYHwZuANiY5RE6fyHrHZalV3Yyzwek9D4JraH4vwoXh0XuTcfJfIOEaG0U7XBfiOQJ0YlP8G1w+cxTR8/9VuXFybx/RFg3UNq7GDeB2VK1+nmIBC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141969; c=relaxed/simple;
	bh=MQrMhcoX0T53A/BolDIrghwROp+RXFXDcVM837v9P+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2HwFWIYo6BHlxeyqqCZElBa1gmIiElzgnoO9n5Up8m+p8uzWvhG/R2rnjEpSJ8n7fSIKlY6uQvybPwpjfRReHcqjNwxuHfvGaNlwNeEXaGdoZmukr4VG/+9mitXZAAfwedwdvOSsGx75aYfbXW63I+LCu/c3ZjyjNuy4ZGJJec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4Z7RlNc; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4Z7RlNc"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7564b7a9490so3184401137.1
        for <linux-staging@lists.linux.dev>; Sun, 30 Aug 2026 19:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788141967; x=1788746767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoQQIG4yLqzMLHAsbkE5MbCHxuyB8pPqP+IrTjJWJTE=;
        b=k4Z7RlNclSxENURoD0uqB+y9EHoq0SupawxGl+f7uwZCt0O0dXaGB138BWBf2SgNDM
         6WtqvjiAeazuocVQMImb4KbU6rLwg3C6NTg84NUjZ5VnZeJ18MSGggbnXXer5OblBMX0
         mI/DqCtn7jmmbmsBu0Ox80RGizjKnvqWPHD3go4tpNXtBZabFPOi8dpeUdthtI29eFUA
         Fw4eTLhCvilhjIyEVgvN3CxlbSc6svFYBVl+0pvC3zSwyk9tghLI5tu9xJ3Vm86IfWK7
         yo2XrbqvjCOQ5ajFTIZlRtHkgx31XZ5y1PLwsmkkCzcl2eVEfzgZeC1H1EJ9GCZcfMrG
         QquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141967; x=1788746767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoQQIG4yLqzMLHAsbkE5MbCHxuyB8pPqP+IrTjJWJTE=;
        b=kTfINRMoYiOToK1hpzbPtMmy6AyTd07NgaqZwe3zUBPrEVoBnrm1ziKGdgTCDZAuZZ
         yIm/T9IEqF3NpZAHCn8R7ZfnMqpQNV6k2m1yqLIVvV/HHM3F7RoeWMdhQ8oGYYco1L00
         yOSLytkwJgcrozcTvltjsEYpC4thsMS5VM7PW4WnVu42mTKrnqbeODzaXC8/yB5SRJEK
         1kVLRi5GZZW5qrOpzjxA1DLbQDfQlQ6kib6G5RT316VkV95Q+lbcQtAM9Ib2RWV8AZLx
         aSMVWKSu7CrJ4dzhm4K//ngr7FQixJxx6aUL6gRCm38BZcEAakbqHRNgZzoX8sGjNANd
         mEUA==
X-Gm-Message-State: AFuF++lh3PU2CgnRWVqV9KdYFZx8oAonLNCkCjKbLbVwO8+jXv8e8BXv
	+fTN5A1tymvjt5DaafbENxbBMJwmp3Hjgi0rwjOHy0OhxXWZZtbj9INo
X-Gm-Gg: AR+sD10QQeyFUz9VJZYzs6FifMbJ5KGpRSixaykCVhrMdtW6vRD0ENa77MmkuXUM5p3
	BTg8gelivh8Ng0YTDzE8wbnvKpLLIMbS/VZCdahlQwaG4aX3gOKypQwDG/GC/FGwUEuiQuDvB7n
	kveggcxT2A5h87mxlwc+UNVhnBIAtqLHFRIuBFIx9D/78n1QG1umsh9DqdpAdnqEm6C0WtazSW2
	6TxyRvY/tChEpSgbFgfOTM1tuLQ5JYyL7UkY/EC6sdTBc/OVHuYnJTEL8wurYzAkAYFNJ0V3tBO
	nbM+bOmlRsj7sKKnvnY3WtAaRbraGxnIWz6WNzXjdkJjOBOgf9TwvZXH9X7taz0Vk8nnH+E0/Mu
	J7DifK9zBkvFmeJEegQauTxSoNmpp+Gv7M3SMk7cStQvMIISY1Hro7c33EVxWzof3w8RioPKWGI
	HtPP8xY+0bXQeoBf9BjEEBGgdm5ENaT7s37DiyiooJLD35pTaZjuv/
X-Received: by 2002:a05:6102:809c:b0:785:8ad4:57f2 with SMTP id ada2fe7eead31-789da793e3emr1242175137.2.1788141967139;
        Sun, 30 Aug 2026 19:06:07 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aafcsm5875214137.1.2026.08.30.19.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:06:06 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: remove dead chip code
Date: Sun, 30 Aug 2026 22:05:55 -0400
Message-ID: <20260831020557.1235504-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches remove code in the rtl8723bs driver that is never
compiled or never referenced, with no change in behavior.

The first patch removes declarations guarded by BEAMFORMING_SUPPORT,
which is defined to 0, so they never reach the compiler. Preprocessing
the driver confirms the symbols are absent from the preprocessed output.

The second patch removes enums and defines left over from other Realtek
chips that are not referenced anywhere in the driver.

Compile-tested on x86. Rebuilding drivers/staging/rtl8723bs/ and
comparing all 55 '.o' files against the pre-change build shows every
object file is byte-for-byte identical.

Adriano Cordova <adrianox@gmail.com>

Adriano Cordova (2):
  staging: rtl8723bs: remove dead beamforming code
  staging: rtl8723bs: remove unused chip-type enums and defines

 drivers/staging/rtl8723bs/hal/odm.h              |  9 ---------
 .../staging/rtl8723bs/hal/odm_DynamicTxPower.h   |  1 -
 drivers/staging/rtl8723bs/hal/odm_precomp.h      |  1 -
 drivers/staging/rtl8723bs/include/hal_phy.h      | 16 ----------------
 4 files changed, 27 deletions(-)

-- 
2.51.0

