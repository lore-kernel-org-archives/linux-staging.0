Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4B3CFF6B
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 18:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954215; cv=none; b=ZHz7XrNmt93Geo7GmX65Z/fz3xNA5lGAlFqH/s7XUhT3fn26jqF7EIi2c4Pij018+eHsQfC94miTweQ9vGhjxYuSuWQyWT5Lp/nyKuBSvG5HrNDPF4CyWQeLuZoooPcMVjeEpUi/umGVME/Zr6ebl8DBlF/smzY2NtnGWCnrQm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954215; c=relaxed/simple;
	bh=nTc8+Tr9zgaZd4gVBmuIHYRet4AbJ/Bf3Pe+JF6wnIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uSCL2ZZStW0TziWHgwRoH2JcP/3NUAwfw4L4OXlReQsPElePOzl61ah59dPOMg+sjMgaMW554UIctmL2hxrUuP/1y90ftEQ2LeIRWFHzD7Pxtif1FLaXbDfkmJimZRz4JhV/ovJ0a4xI2SVAJ5LH9oOT3fK3FyEtsxM5zt0EYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGKRB7II; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGKRB7II"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39faf9e2c62so9051611fa.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 11:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785954212; x=1786559012; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cOOcUtJpZgjZhcvvjYqKMWSAMDYUSI7q14I+SQGV0ow=;
        b=QGKRB7IIg25NMm+VHP/PC/lfXiDJKD3NOiPUb/O4pOMk/VREG4mCsu9isXkHTxJz/7
         dqfS+KyzElmrHr9HCQlsrsxxF27H2+6kGBMxEMk8GeGzkOs2DL4HSxqK5DeDtkKWwcuQ
         Woyv3YP9VG1/rdAVVVcGJlXCw3/BezKf+2iJSOgTyX5BomYwOMYFLZpT12L5CS07/KA9
         HeNhOCQmgWB1zYoR0iXCLLnG+h5vKlayiPHbHrbrvhpextvlh/Y1OK+6Xbz7BZLHucG9
         M8G7q4Dv22F+XV9f8UKid7p5zpGYgZnOf8t42HXhdCc/wcRyHPwwTgHup2kkNQRVbM/8
         josw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954212; x=1786559012;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cOOcUtJpZgjZhcvvjYqKMWSAMDYUSI7q14I+SQGV0ow=;
        b=aCjRfdFmil/z3T2A9fkjmJlq++pXhYPvIckkqsL2E4sPp2ghKjihOoBk1Doqf2xYm0
         wF3evNtv0dQf08sG4h3lk2aiyILjaQoJ8K0oUDo78S8bd4Qy1XbHKe/KKmq5Y9Wj4r82
         9poeyVpLgpc37ZI3RXtL8gnEo+94pwgakz24O9Y7PX4Xlc3yuZy8AsTQOuSYdDOyNn7h
         pYbZKwOTYou9aqdVawppMgKxwuyHDoy19jirWuRFC0COs68LaQRVRwbkSrVm02R/WWNt
         SNsGMjbXjxr1HvYcFB8o/ip/trsmAtTQsi/kmEfAhxcjhQSUZhiZ+Psej4l4HZZfu6sD
         kuFA==
X-Forwarded-Encrypted: i=1; AHgh+RpkGTXuJVNcStrLDy9qliq5YByferAqJfipguWcEODxgWqG60a6CsRr2aEn4Iw0o4YxrJnNENU6eXj2ZTmF@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4fWkBNYDgQmfg//o1Hlw7f0jRfc/opaELnCg7RiyKOYuOwIaP
	PZooUcuHydn2VpQmxHcfzBoIp/bt5u+7s5vn9g3AtXi5613zDV/4hG/zyy6+JQ==
X-Gm-Gg: AR+sD11CjPRGijIZhMaEFROU0kyi68V6JRH2x3srlOiv0lHmYhOkroJSyww00doIIe6
	mNUejKGcFxgeUnOXsF//iOIS6RT2Ugk0Qkpx5ZZkar6lqvJPCnsIMWtfl/A1NxfS2wSXU6yGoWA
	Hd2wrgxVF3efkE817p/NMukFOf+/NZcrczcbrvikMA2GPfMXkqmI6FFS7mXp8H2JRTXcli5MxnQ
	9He+dDDOuriyzxrdgLAevglucEq5QgPr9jh9lo3lwxwBDz3Wo2mmPPPvwIyZDVchHhMGXnYsEui
	N4zdEXoxNMzyIXDD68hO5Xy4sjRnE2yiAkfWAuFbAtmdnBY9h6g0R63Q2SgTLSaUHRnXo0TnM9a
	3DJiveqO+IYUyOuRHPSk8e2ycdCruBvCNUKo78aRP6ZVM6y8cWhU1SdY/bt6Z0Efrzq2vHOdPl/
	a/DDGsjtg2B4Zb2/CExqvilAQxqtpKAZ4jXwkcwn3dge2QV8AhyRAqpVvKbPK020fvRbjt9g==
X-Received: by 2002:a05:651c:211e:b0:39b:1825:d56d with SMTP id 38308e7fff4ca-39fbb0662b3mr12618081fa.6.1785954211453;
        Wed, 05 Aug 2026 11:23:31 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a32bb7sm11954811fa.29.2026.08.05.11.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:23:31 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/4] staging: media: ipu7: abi headers cleanup
Date: Wed, 05 Aug 2026 21:23:04 +0300
Message-Id: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubbaLBteRdJwxnGBNqSWdzdc/
 ur/fQE8OkIPVRLA4Ume1iVCpAn0k1lGZDREQ8YzxQsuGW2Hbk1HTOIgSqG1NbmCmG8OLV3fVd3
 89kc3Y7+/e7jvB+J31KJsAAAA
X-Change-ID: 20260803-ipu7_abi-3ed19177fa56
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785954209; l=1194;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=nTc8+Tr9zgaZd4gVBmuIHYRet4AbJ/Bf3Pe+JF6wnIU=;
 b=c4irqDJ2R8+GXAKilehgj/HdtSJ/Cp5Ys6yzdaFmPQ37mvpN73t0GhoL0xiVbl7pqAobE0PUT
 SpwqhgXNTDqC5MAbiT6TGOdtO4dn5PU+JoJCJGnaxYVjjTomLF4y1bq
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

This series cleans up unused definitions of structures, enums, and
macros. Each one was identified and verified using 'git grep' across the
entire driver.
Verified by compilation.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
Nikolay Kulikov (4):
      staging: media: ipu7: remove unused structures from abi/ headers
      staging: media: ipu7: remove unused abi/ macros
      staging: media: ipu7: remove unused abi enums
      staging: media: ipu7: remove unnecessary "#pragma pack()" directives

 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h  |  86 -----
 .../staging/media/ipu7/abi/ipu7_fw_common_abi.h    |  93 -----
 .../staging/media/ipu7/abi/ipu7_fw_config_abi.h    |   3 -
 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h  | 183 ---------
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h   | 421 ---------------------
 .../media/ipu7/abi/ipu7_fw_psys_config_abi.h       |  24 --
 .../staging/media/ipu7/abi/ipu7_fw_syscom_abi.h    |   1 -
 7 files changed, 811 deletions(-)
---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260803-ipu7_abi-3ed19177fa56

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

