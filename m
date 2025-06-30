Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B891FBCB0
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272266; cv=none; b=SQLqtv/K9I4N1N54zfbyZL1m3FtiwFzR/9xrAhz0zPNUJRM4i7eynwjpHB9XBG1+4XlBBWAStFARImywIcheC1AWOfwTTeCPMH3mzC+fQxs0i3QY1ewV8wpyw4T1v6tPdkSqaN1NlNexRAZpQ4CFFnGfZIR+jgqb3/1s5xGUMcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272266; c=relaxed/simple;
	bh=5k4q97aqdrBVMH/JPdwcedXO/G7Da2JnUoHNlsI6Cnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VTWlb94JAm9SO99O5HjEKwNsPiDVf7wWtbU6oVNxi+wMZZd3//4ctOb6Sk7ek0IEWHYa9WLxp5NymObahP9BRzQT2NpNcVhuGDKydiSFE3Sq4QCnIe86hCrrzwjgh7A+5TEthP3R58LPjmxPYD/vhomgUGHdHzoB9f2gfI51NBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+jlTIfz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+jlTIfz"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae35c447234so554506666b.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272263; x=1751877063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbZMPv0y3qJS3SDYqu+8oZexHymQrdcMlRD66G+arTA=;
        b=d+jlTIfzwF3YHCB4H4O8SAe+NY+Ihj9DHb/a47znv1nXNb5pU2IEfifspMyhIyTM6B
         HhdO8XV5XG6ntcHrfDLELEY1p/No6eY+uBrDcPv/opf+akFToSiZWT2zgPr2iETmdmRS
         r9P0Vk4DAwHOQp4lvCwjZFH6mXDRYrUL2jhj/z6K1LLZ2YfNjSf0QS+fAO7FiI7zF4Re
         CGBTsn16aIiPoAE/AXjjBSoKBnQRtzjSSTMAXAiCHWG3tlLQl0dGI26Bg2UwJPqidglr
         a2QcD9PaAS7F3qsrfp3XkOP8XukrpiLm18pwfAcNhn7zq2FmWrK/de1B4dSE5xhIa9hJ
         IfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272263; x=1751877063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbZMPv0y3qJS3SDYqu+8oZexHymQrdcMlRD66G+arTA=;
        b=srLgD3HyjCqWyZXNMDxKZj1w9iwMstn+d9jhJ4604nhXw3eRPmIHMIY3TEJlNdJaVT
         9GDobmY9MR7yzEx4xE79ePAYAhdm85PHbYxdXXDE/jzd8tTaFUePBlWkr31FUot4VmTu
         ICn9j1Z26kq8uTL/OUWIQbKxH0J01q/FcDEInRcYR71jRj8C2fCMN96tePFPbcx5jD0L
         Y+rIneCeKVUDgVLyTZcBxjL0aJFgWWFdvmq5uq4alyWqhTBdpDj5yR9JTcWz0cjxB1u6
         ic39J/kmCQRc8zpHJtOA+hfCLqKh8Zd5CgQ3L2k0kFPpHe7uuLHlcltn82S9D+kDqPvH
         Utkg==
X-Forwarded-Encrypted: i=1; AJvYcCVjnoK2PnTAHOa4hKk9imE4AFwzJyLD0vJz7YuAEJa0YO0eaNkYZd/nv6NVXwAbd6g8KjCIXGUrQ/QCuD3a@lists.linux.dev
X-Gm-Message-State: AOJu0YxSYe6HjUhlMwnpvCC2PqaJ+FL1j9Ghv//EzwLcj8PlIxiyEaVJ
	GJykAOLgvdlEj4914Jam67ffRTkFZWpePhojZQujkPr98RLVycQlJ89r
X-Gm-Gg: ASbGnctaI7VK+01SS3X2EcQIhgQy8B4ZRlNKoRG6nCvZus8PN7O0UWjrBow5aRNOK3I
	aK3vrV35onhzKhRe9If8OIjFkv/1d3F9RrrpTq5g9Ks9jNGyFWnbz7zYImtUrHOkSV8svc3cb5T
	/5756dq0SKKaskXqFDQzdcwgfFX8XO80tfVge65SuhApi2pBl/dEAfXCKsJw/HqXInKo+/x8aXU
	IH5OsvHru7ZZC1fQsfIDFfztOEZBtfXmf5NB8Azt+yglUy6UuON6/2X8oZBVSEFIO1ff2MjrWE6
	ypEwAAib3yZBn27IhWsLyhBrOZamCgpinsC99EHv7YSX56p1ZQbTZTQhomA8d+zAUzA6dU5aQ+8
	jups=
X-Google-Smtp-Source: AGHT+IGe2RZcwGAvMuh4nvpZI3ONv8WljTrSXxJF7JbxbmKyyyBwZHQq3owGx3JexR93hUNRNpw4wQ==
X-Received: by 2002:a17:906:d54b:b0:ade:9249:25dd with SMTP id a640c23a62f3a-ae0d257550emr1814240266b.8.1751272262484;
        Mon, 30 Jun 2025 01:31:02 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm577568766b.37.2025.06.30.01.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:31:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] clean up some code duplication
Date: Mon, 30 Jun 2025 10:30:46 +0200
Message-ID: <20250630083049.103734-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up some code duplication in the files wifi_regd.c
and ioctl_cfg80211.c.

The patches have been compile tested only due to lack of hardware.

Michael Straube (3):
  staging: rtl8723bs: remove unused function parameter
  staging: rtl8723bs: remove unnesessary function parameter
  staging: rtl8723bs: remove redundant static function

 .../rtl8723bs/include/ioctl_cfg80211.h        |  1 +
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 24 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c  | 16 +------------
 3 files changed, 14 insertions(+), 27 deletions(-)

-- 
2.49.0

