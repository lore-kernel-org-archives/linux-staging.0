Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8F2AD0D
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037159; cv=none; b=XIzUbRO7ZRI9SX5QB4n7Zmi31qNj3/iTU3j3KeaaU5Q4AWbfD+JM6HyNDboSCCIz3dYQ43U5EPKTjvepjLVspt0o/11fPv2YoqAQMbM+47I7kAVuixnTgemCESnQLR8hEFwtpG/NNnKXzlshPapClK6hiO+KgDxBiLYPldZbawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037159; c=relaxed/simple;
	bh=QLYvYIlNsru6sVR2dQ1cSAedc3A4vVjd8m3PtqCxK0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qZ+nbzi9SuVAH9IgB9Xf1WQHqJClnHlU4wp9YShJf+qQrYwMD9nfRLQiTB403oQrD0Ntj3erCYVOksjNkLe545dUx8z2h4qRj4Cn+X4Mbo2vzSpNOh+5Ni2kNyPvsz2eulbgv3RCx7moHGLXMsyWj3VzHhIUZuGIVB+SCK45K5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHVZQq+v; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHVZQq+v"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6157c81ff9eso1977300a12.3
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037156; x=1754641956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w61+8xZzLE9ZAKBOlZw6XCNl+aIH1RldJ/u9IGbSh9U=;
        b=nHVZQq+vDyOvuUTjZqRBmcZfU+9TMvcdmoMb6R1k31T04Cz2ynlMxFb/v6tlSd6GtF
         qOcPPuH+i857kOEBqSsVInBr/tE4FcL8Ckeo+2ka3BvxKssdEd8Z77x8cd4MbZGlifZ3
         ZqXeIX+y+rC/TS2SC9hEOLMx9BDeJQ4M1STQ+m611Qm5xXb5KrYITaxQ5ynE4EY9WEEi
         0OuhRrpYNsYXOp+2ymmacveTXc5vWjb3qvxaK2cKA1iw3d/QYF4jLGOHLqER7GUMif39
         HmHCIF82YFckMA9dPvrtE0MAdnqtQtO5FtMKNHAfRL3eyxjW/nbN1zxxnBMIyGpTdCog
         Q+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037156; x=1754641956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w61+8xZzLE9ZAKBOlZw6XCNl+aIH1RldJ/u9IGbSh9U=;
        b=vJQDbJ4B0T4tnShQEAH0hL7bqNmUmPxqxJbr0ND54T+qLVB1SLTheIyI1Va9a2i4ac
         j09qs1GNt4Pc91Z8sxUkjXtyFu0BXOsJl5ERvdVhjb6zKZB56jg/R8r5HPNy8cYjbPta
         ujPnnZIZy9VwLAJdcv3Iyku8GHb/GrezHtBe7YFdpQj1nAaQDWybEYMtz3zhWHA+V8gi
         W+cMOogw8+xtPBBg59AB0vwLDOx+Sy+kYD/+AFdQruekvpNA3kRSMBKoYzIOLEptitNE
         fncwaouUVkaSThDve2QGvfVW6SlKbHlSxamNbQfpx2o17oKkCn/ZylUIiHMmOl6nA+Vz
         QDnA==
X-Forwarded-Encrypted: i=1; AJvYcCWfKMlciwYGDEciK3+U//u4NNRw4i+veRMlqdCLjJWYJiY5WSRH70X81i1fIF04PotIIz3Y3olGRdNADjIR@lists.linux.dev
X-Gm-Message-State: AOJu0YyVTvCtzP+KZsZ/I498c+/vVLT+jBar9m2iDWJNQAzFyj6pIo9T
	lSSrf4B7l1s426d23nbpVaHtNUH5dmZOvmNmX/5VLgddb5TwCKtiZTT+
X-Gm-Gg: ASbGncsVooSIqostZEnYIpvBLB9zQkaAIUX/zzXBfjXE0k0VAXGAlk3FG0OJpPo/mdm
	Dt3nEHrLyaqlNgsdqAdp5yQHpIRB006ZUiZJfPHzJyUu/oB4Sc3JBfFImEq2YxFl+jOMpx6/ysk
	nPQisPzYFL4x5AJzhbsDsSMaj8WYfvOjYv/BvRDYm0HDw6hA3I7XwhSocebYRzfFDPI4ngzdSQu
	yErcY7Wwop1XfCnhnHk1kMaN42oODPOZkGWiQxjlLy7aEDVbD+P0ltWgkNvkwFDHUSRRGDiCZzf
	U2feRiSwOSfeFbXDF2hf2drMp7+V36otqgq3xpapv83XbV9/Is6HHFeAGSpcEsOpxd6ZZ54SEbV
	jusX26igXMBneW0v3Clq+KWM0wPRQ+ka4sWPkP6LEnKPRgaEa6aI=
X-Google-Smtp-Source: AGHT+IGSjaHMpSM2F0DUBfBzULo8o9lfOwTP1cmyjskDFOpXe49VIrHx6V9mwMpaiCqRqoWuELGnqQ==
X-Received: by 2002:a05:6402:1ecb:b0:615:b0a9:20d with SMTP id 4fb4d7f45d1cf-615b0a9071dmr4970679a12.20.1754037155594;
        Fri, 01 Aug 2025 01:32:35 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/8] staging: rtl8723bs: get rid of os_dep/mlme_linux.c
Date: Fri,  1 Aug 2025 10:31:23 +0200
Message-ID: <20250801083131.82915-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves/merges the functions/functionality of os_dep/mlme_linux.c
into the corresponding parts of the driver in the core directory to reduce
"os dependent" code.

The patches have been compile-tested only due to lack of hardware.

v1 -> v2: added back accidently removed tabs in patch 3/8

Michael Straube (8):
  staging: rtl8723bs: remove wrapper rtw_os_indicate_scan_done
  staging: rtl8723bs: move init_mlme_ext_timer to core/rtw_mlme_ext.c
  staging: rtl8723bs: move rtw_init_mlme_timer to core/rtw_mlme.c
  staging: rtl8723bs: remove wrapper init_addba_retry_timer
  staging: rtl8723bs: merge rtw_os_indicate_connect into
    rtw_indicate_connect
  staging: rtl8723bs: merge rtw_os_indicate_disconnect into
    rtw_indicate_disconnect
  staging: rtl8723bs: move rtw_report_sec_ie to core/rtw_mlme.c
  staging: rtl8723bs: move rtw_reset_securitypriv to core/rtw_mlme.c

 drivers/staging/rtl8723bs/Makefile            |   1 -
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 151 ++++++++++++++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |   9 +
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |   1 -
 .../staging/rtl8723bs/include/mlme_osdep.h    |  19 --
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |   1 +
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 179 ------------------
 9 files changed, 155 insertions(+), 210 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/mlme_osdep.h
 delete mode 100644 drivers/staging/rtl8723bs/os_dep/mlme_linux.c

-- 
2.50.1

