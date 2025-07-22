Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48279E56A
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170087; cv=none; b=o++EbFyWzaxoOjTIfa88OvTKFWYuqz3EVmVdejc5oNLHXFwZ2jkyGskq/DJoeVVaL1v/hO5xPr8aewnPkw1VKcuYC+6nelAMjXF8pgE7TDcRl/l03FEj3kLmI5NnU9aO1GuKNEWIquND7TrsHEGDDzhL4F7L9gZuTvErztPgJ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170087; c=relaxed/simple;
	bh=DbbZYKcIpuLXiyjkFSGf91A2eOs0AFWoLz0cFNMYfPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMnFvqpRdu1AqKTrcRBae5D5xcQf++KAW1gPEJal7z9oFoH+pw5WrtdMS6bnnJE5sTLAteLAQtzIeVjughZCKX+rr95YITOrtntHHyTyPKpzWvAB5BFCczJIxeAy0nzAz1IwJb3KdRLwU4XwmwNlunJF1466ZyoRvgTi5ZbrJ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmoXKe1+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmoXKe1+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso8891750a12.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753170085; x=1753774885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iEcp76xt+rnAHv6VkJ8kkXSE29MAgy59gpxqA0MqfLA=;
        b=GmoXKe1++TSv0Ja4aWWyc31L6DjGctOraQSHx/Mh1W7kkmF1UHTUDzcw4l/n/yJHff
         x89Ukpy9/tb1Dlqsbxlf0rQdDyQ+leIJPx92mig0/0NBjE1PienP2v9KSs5om+NwXQnj
         zAW4vt8DSLLNLYqdDoEWK21KbvuT2CXRudbXoLOoEsTYzyJLy7xhjynn19Tsq9iatiOL
         dcF4hulBtnVjmfBDDxQTqb6m3yQljkST7ACzCQJyQ4lT11Lx5q/cbztyfyefA7eXvPNu
         PDKANS6s//gc81zCGhXa6piAYWr4ygxVRsdOyiFoVGfJeGJbYVf7jZxg+jJOeEpxvNt5
         HupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170085; x=1753774885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEcp76xt+rnAHv6VkJ8kkXSE29MAgy59gpxqA0MqfLA=;
        b=AvqTabCuFDtjo6lvZE9U2fOnTXnLGXkjfiY0yqbXsuhEBw+2XqUsjEcsTl/Ejx7C8f
         T1YbWbSbhjbMBXCh0n8pufsgJqB9gA06HEmI7GXBP1eLMfMOdAcIZkbwUr+S1euX+WRL
         8kH9zfrzvlRN4rn4wg+fmeCc53x4rDdR+Ykwz4NPz2o/j+iUiVS53BXtadwAWSnljuA5
         kKuywwvsvVdge2iSZ/BIHlOfrABq/J8E90/FuF8Uh6rbALSyJnUDgXDo2bpBJA8mCYZh
         922fwMX8PBkZS4sIR/C8scgui+uTAZ4EyjMWqsQeQ4Rm0IPudHl0AKWZ6C2VArnsiMaI
         V4bw==
X-Forwarded-Encrypted: i=1; AJvYcCXVYwpraPPf/6aKmL5nzrCS6hUZfDyPFv6zw/5DO14TuL/3JA+iwm0nD+CTbnAYcOPjwgazWQfocpcIZ4B6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9V6pprYMhUY1YrIq/hSr3Ca5tk2JSW3m+Ms4qXi4WX/QU1cv1
	AlCrjKup74wf8oYPCu1fS+szWaXC3S4zwlMwO3SRWPm61NjLlNOGO6Ad
X-Gm-Gg: ASbGncvcDkudkXVJOSFVn3ndIwHwxO7lpHTW0tcYBa6+kDQW6NeOhPVUHtTRf14PciV
	OplBsKOS0CeUMUDphhb7rtDkLePvlhWgkB6YJaW3SDT8rqF4XX2uxPTJNRUPl3jecRsOl3KKVvf
	k935V0XOXzB5/lMvKXQnl3was3pwEFp/nriHJEYE/B4lTFWRLOeh8iawPo8OQH0zqyGuWQ1Pkvp
	IVpqgitJedKExudwTM8ModYRfG0xgMxMM0ak7e0C/TbD1qFiHE/aOlk0Fo7E6vMZiMLjiOdLdKF
	qbPs7AzJtcowfUOItgpp30dHx/QuSuNsMLe2mxPFAkw6YJVhRvbK/TjJW07h3jw7QAUMXNHYINl
	+u0RZkPYdF4M2mX11yBg3rz4=
X-Google-Smtp-Source: AGHT+IHDQyw9NYvdFCCGeAnM2fJtVuptzMXio+lp0jLaNFeZl1ERXmLnJ572m2qsqzoLB3bKbbHU+A==
X-Received: by 2002:a17:907:7ba9:b0:ae3:b371:e7d3 with SMTP id a640c23a62f3a-ae9cddfe62dmr2150317566b.22.1753170084343;
        Tue, 22 Jul 2025 00:41:24 -0700 (PDT)
Received: from tumbleweed ([95.90.185.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79d6c6sm821224666b.32.2025.07.22.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:41:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/7] staging: rtl8723bs: remove empty functions
Date: Tue, 22 Jul 2025 09:41:08 +0200
Message-ID: <20250722074115.35044-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some empty functions from the driver code.
The patches have been compile-tested only.

Michael Straube (7):
  staging: rtl8723bs: CheckFwRsvdPageContent is empty
  staging: rtl8723bs: rtl8723b_set_FwAoacRsvdPage_cmd is empty
  staging: rtl8723bs: rtw_get_encrypt_decrypt_from_registrypriv is empty
  staging: rtl8723bs: _InitOtherVariable is empty
  staging: rtl8723bs: hw_var_port_switch is empty
  staging: rtl8723bs: dm_CheckStatistics is empty
  staging: rtl8723bs: DoIQK_8723B is empty

 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 ------
 drivers/staging/rtl8723bs/hal/HalPhyRf.h      |  2 --
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 10 ---------
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.h    |  7 -------
 drivers/staging/rtl8723bs/hal/hal_com.c       |  7 -------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 21 ++-----------------
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  7 -------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 --
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  5 -----
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 --
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |  2 --
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  1 -
 13 files changed, 2 insertions(+), 72 deletions(-)

-- 
2.50.1

