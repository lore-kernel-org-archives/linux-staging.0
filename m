Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B811D3A7F46
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560901; cv=none; b=muDVY7pPCzC3XnsqQb0V7Z8sZdSp+RMPKxJ/WOKJAD3VEt/ZzQKhJcKJXyFug2kHPpYibTduoi81pIoklNAzAoyHcwuzWDLmb6QvUP0UiR3hl+L6PWgxKvWh95YD0V7HdRxaFvLyG4yer3vJ2ZDRDIrovI7z1aptH3xiXaHAY+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560901; c=relaxed/simple;
	bh=7o5MgVSO/qsaM5mSZ0Wv6cG8RqmY9Li1Q+TtGkk2SzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2Ub3vrxh2U5z9UMgob6rsCQnz5YOWsYkKMzfVV38KITMO02ZShZsJnycjU9drltAC7lJRe6374VTcfjRhPA7zBE5SWm3maCjT9JZ+aoAwxiReYX92TORpjZTWftAmfXHJH2T0ELExL97JqxH23rN5PWTzs1696oPOh5xrwlEz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM1ndpoU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM1ndpoU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe655187so16769895e9.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774560898; x=1775165698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfG4+xyHjyGndG08zbjd4lJLrSPoKYcyTNHjlwNnYuE=;
        b=RM1ndpoUq+rhrAX7AwdE9OR4Equ/x3V4ft54Yi0Efy/pFdvicYoRl+Q/nAZ8iaGM1c
         ZKEJIUO/mFJ7NHkjJjqYobWinIMeP8RNUxRXjnyZXK8SNY27D0o4ne/NjLaUGd3+WiAO
         Z28ycLufTLVD3mcrhr0tQJkcDGp0vti1+S4TaPsZk82X8+AfxoXbNgqWbN7rgOPghxld
         7CVy3E4kQUfw9J1cUdrCCvR4W3NvW4mhYwYuDTtOGrbSgLNQGEYaqXpyrsqbwYAfpUHF
         nKHQxQ9HQpWduwDqcGgPXnzkX8G6XvjQIK+7+4oIJy8tmnjtHS/hZqky10p7NUVSnWvd
         b13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560898; x=1775165698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfG4+xyHjyGndG08zbjd4lJLrSPoKYcyTNHjlwNnYuE=;
        b=JFXN7REJ+Gp0ZGxfyBNChYH7jvdWdC5APE6TrvxcDSVkDnWZhvbQ/9laVdYSj95aVo
         L1+PsdHajJuvikY2k4KGS2MNoJ/kGmZkPkY6oNk3UgZA0wUhsr4D4qidkghq25pmuxKY
         tYXZe6B4UwUxo4HcMlwgt54eZqt0ZY/JqpMlkqtKsMIj49EnlCnso/YVsgYnw1dms51o
         tqdNwY/RVfsxVMYPObTzsmF6X++QEPpB1dtEUjd+2OBHuUdReQTJgVA/Ljp8Xj44+saM
         ZniaQTc5lnPz7rmBB0FvWVM4kQ/ZaA2csEddRysBkvLRD2GWULVPrBBsvToh8tPtMnN3
         UdmA==
X-Gm-Message-State: AOJu0Yx9i9kjXJbGXOFBMYZvVtqJ3y1ZKEJxuXtdLlIoDLo9C3ZAUXeL
	SzCEK947jAQ9Fh4pZq/frjIiIyzDSKRUgrm6RcwrR5ZPkugqUjVBmngaCtBTjgUL
X-Gm-Gg: ATEYQzxCMuBB6ZhajzAVGsf8IgMtQTtRb24dU/EEGDBut/PEMDhrI0+XlwPqns4xrQb
	/Vi35r46h5hvrjUSf0fpFuVayuvCTJCy3GD2Pg00HlNi06rLOYXumWGhI5mFDkCM21pH+5UzWhx
	QqSndVDi6V1NZTyiW2PV+Z8f+GdJjN+jVMQiBSl11GpMjDj0AmIaj4dkwLvqCADYebN0Q01MXuN
	LZsa0TLHdPgTFrpp0pC5CmNOnWOmSuHc4FRtn3EUjVK71hLtveMWVyPwp3WHa9Ra77kANrbgl8P
	K0p9WOGJysS2WmahEmTfQj4kto0Bs6RBGffkUBvYkhe/uoIf4ZXo7MTzyNO/O9c0MR2SxQEtP+I
	GDBl+437XceEvO1rPDpWlbfr1tuAwAV+m5S9pfyiwRZnjJZqLxm2TF36zsd7/dsZT4nSbTZAJ7q
	sam0o4gcMJM1eYJF0MYMkCDYNBZnT+Slk7fjN4pN0xaChzF1hEgYnQ9wBW
X-Received: by 2002:a05:600c:8286:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-48727c70637mr4121455e9.0.1774560897734;
        Thu, 26 Mar 2026 14:34:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1855:4ab5:5c9b:17ff:fe26:9b2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c7cec3sm51106825e9.6.2026.03.26.14.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:34:57 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: media: atomisp: clean up ia_css_stream_destroy
Date: Thu, 26 Mar 2026 22:34:06 +0100
Message-ID: <20260326213442.876745-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a loop shadowing bug and refactors the ISP2401 cleanup
logic inside ia_css_stream_destroy().

Changes in v2:
- Split the original patch into a 3-patch series as requested by
  Dan Carpenter.
- Added a Fixes tag for the loop shadowing bug.
- Separated the extraction from the logical improvements.
- Added clarification that assert() is a wrapper around BUG().

Jose A. Perez de Azpillaga (3):
  staging: media: atomisp: fix loop shadowing in ia_css_stream_destroy()
  staging: media: atomisp: extract ISP2401 cleanup into helper function
  staging: media: atomisp: improve ia_css_stream_destroy_isp2401

 drivers/staging/media/atomisp/pci/sh_css.c | 79 ++++++++++------------
 1 file changed, 37 insertions(+), 42 deletions(-)

--
2.53.0

