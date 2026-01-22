Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBF372B3F
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100494; cv=none; b=u1bvPvBz5k4vfdYBEN4M9CoOcsvOQIJoPGvjaDNBms6rcd4oMVsPr+thoFqZmWzYbEYz0hVYn7R7f4VmETin2iqfxab/nb3Pba29TCiLnZ9CWoRdHYr0CINsBvYBo75m01ccaiSgSlpdeYkLei+ksB2vEuS4YIC9eDIKJrygiZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100494; c=relaxed/simple;
	bh=yJ6uLBXKrwhGe5lFPlt18qUtVEGLDkd0UzpQp/XffII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GPzzc3W7xBmV3AxmiOuE6y2cuTVA/5KwKUPHBvdSbWjkYv84QRk9uPdCsNH5InK+3RGLaSFz3uhY/tBBu+rGINwoJHhfSi76PAgkPTrQMKoj6DhVsKhBX48iJe7ME70IOhcf2pcOPp13E9Hmbn0hMJyWQ/yQ+ICSvOtsctuIJuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ61xOhU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ61xOhU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f2676bb21so12035255ad.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 08:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100485; x=1769705285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upyClHbhxUztmT5SUZjfuKpJcfN2FcHAGfvW12IrNIo=;
        b=OJ61xOhUGxUzad9WZItlH1JSa6r+UIzc8R8gu8ARXTWhEUw1xauJRPHWJv7sizQOle
         6GFN0Zyry6OLBjUGpEoCMnj1ua4Zhc7P/ENA8XcO7TkmU5v1QEAAXwgMcQRAGMBUaLjT
         y41G/wcGtlFRJe//MEbxXgOa2qR/jkVkzNfDSPvRBsdHsiluwKzBnAd/xYzDho6Y0v8q
         wkZjURLxuVQeLYWkRe26SONxQnlF0lkGMBG9qPvUAbRgKHlXBb7rOnK8amHoDSp9A64p
         FOeW1+6gz43sazLrzS/VlDwX4n0wzvJmt817WO4TPaq9y8CpcVV9C6jEpOfce5ySmAOc
         PvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100485; x=1769705285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upyClHbhxUztmT5SUZjfuKpJcfN2FcHAGfvW12IrNIo=;
        b=EyymaP9U9LD0UzLcJ25FuClZ+hX3ZTXGSYAsP727cS6Rj3mReSpzg8/KPehm6yT1tW
         iUTBxLZJKIS5tmeUJnRfyjog5Ih6iTe0x0irElNj8qcpXslgP//MVmxvFA3Ri/FGNg4k
         GqV1po+yUVFbi+q3LdHUqgFDIW//aiDjiH27p8XTWifZb9vYY4Ht7T7B7mgyRN9dLVfZ
         hIVn+4B68JW+VEqU/ESZ2ZXXUzO+c53bn3nAwvz0wcHIWjtnsx2GLurRcr81akRLJ0E7
         LfkjAGhcgeuuTfv4bLPqiK7uqC8kz7xlnFYTzr93BnCmsuG3w3oXMEA0VhK22MhM4reg
         iczQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsaPgrYbax5bXGhQnvySl8ljfeIdcrSeMDWoS31R7gegYmZKAmhes94NGPHqe5hW6HZTfdIca8W/QhSwZX@lists.linux.dev
X-Gm-Message-State: AOJu0YyfZEGrXg3cUbFbP341DlIm2S5InrfeJcWqTQVb4zn2vOUx5cKN
	0iMX5yZFJVaBWz51WMSZa2UqQw27J3VfVO6FBHbDaGlEf2gMCVnd4npN
X-Gm-Gg: AZuq6aL4N1Qz0pMOl2mju0Nu5EZUFRbDSbAsxyE2G5E5KsWlCuJh2ozu6V2Sc+lX80a
	rlHM0kq/cRQBkR0Bepbjc0tujhTYwqvkwaYKbTkF2kk1yMm01HriDE+t4pg0S3uH45LOhuVSbbA
	6vK56vpkmJbQrmoxbULSEaZTac2nBa7/R4fz7Uf9IR72Yp5cROWGZn6SO1I4NqJHbxCxzbk5+Cl
	jdfkCpCGeeaQdXANOXuJkBtpEMfN64bi6BBWk1SZOs+VDBYnBoxVHudiTHL+GtbwXLmVXttLZ2T
	LyQJLDrlhOOYC1ECjgMVff3x1vpiW7Wa8UJ+jK2kN+JkW67cUOdW9pejZ6oHqm2GfRlI/ZtkE1z
	kAhnh7TPni49ubFv4XmmMdJ9GxP3zT8KqPx8BoL5dvDcBzKCyxh7F2V8Xj4tCzyTwS8Lv/xOXa9
	Zhl7n0/AoCGCRKeGgGnwt5RU0fAydS486aqCY=
X-Received: by 2002:a17:902:dac2:b0:2a7:5a42:fb5a with SMTP id d9443c01a7336-2a7fe757054mr273685ad.55.1769100484855;
        Thu, 22 Jan 2026 08:48:04 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd523sm189986225ad.62.2026.01.22.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:48:04 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v4 0/3] staging: rtl8723bs: coding style and refactoring cleanups
Date: Thu, 22 Jan 2026 22:17:48 +0530
Message-ID: <20260122164751.37796-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs minor refactoring and coding style cleanups in
the rtl8723bs driver, focusing on rtw_xmit.c and addressing checkpatch.pl
warnings.

---
Changelog:
v3 -> v4: Updated rename scope, cleaned up formatting, comments, and
parentheses.
v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
v1 -> v2: Fixed incorrect commit messages.

Note: I noticed this driver uses a custom N_BYTE_ALIGMENT macro for memory
alignment. Would it be acceptable if I send a follow-up patch converting
this to PTR_ALIGN since it's more commonly used in the kernel?

Khushal Chitturi (3):
  staging: rtl8723bs: simplify boolean expressions
  staging: rtl8723bs: rename LinkDetectInfo and clean up related code
  staging: rtl8723bs: fix line length and alignment issues

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 102 ++++++------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  15 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  10 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |   4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 149 +++++++++++-------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   4 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  31 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |   2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   8 +-
 12 files changed, 194 insertions(+), 155 deletions(-)

-- 
2.52.0

