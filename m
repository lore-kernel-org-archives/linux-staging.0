Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6530DEDC
	for <linux-staging@lists.linux.dev>; Fri,  2 Jan 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354331; cv=none; b=dlKHxfwjBIlO8WQpdidZK+8CXhpSvfRmWIrnu4WA6uOZWKahcI2VjPvitOQdQAr435mzf3DlfNYnIJmzai1GC7Gsf3sC5fqtweelm1l1CFVbmfsVbAf2HqEDd9CXpVabKSyPtsihmgxelQvA0Em1fdqCdSe0LM2exqESyXDwzyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354331; c=relaxed/simple;
	bh=TDJbXfFyAbZcEQrNkjWXCeHspNOTitXO3owb4PmXNMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjJIoNaaHWVG3TSOED/PV0w+QGecyD+MNUP6ZuZfZrSC3ZFGiDaXLgMS2PqmZfAWabyU73uvYdKA9ByZZvc9GbI0xAie9K3mBMYphinnZjTTN0e9Jhw9KOhL8uCWk6M1RhB9oEcvXnBfIpzSpaJ17joFcbe/2rZgzAzaBlknvHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3fBNk2O; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3fBNk2O"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-640e065991dso9921569d50.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Jan 2026 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354328; x=1767959128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1dnW+Zt54C69hvmZUhWgW5bAae7MU/KIyFI4r0RGm8=;
        b=S3fBNk2OBR7cxEF38PO1RS6JhqntWMTskF8HNqegAyoMA0HZjNO9Nb06nS4ihnajuo
         yo9Veh76rbbp7mmW4iRZOEarnBd52yg4fdSorP12D4EQy46KOKlVZc0PfSn6NLrZnr2e
         dPmJZ25naqTE932dj53I/AlkN7jaWyNG2n8FpUNNRxKXKuYa8BxgBhrO4+cZu14w25ii
         YTK4cLspyzrl0xyPWcfCZRoezpEI6DIwP5oeA6zqZvIXdg5Jj5XS+IpK+iHsUKHdITsB
         JdAcu5KLNMOmwZM9zRoipYmTbGlCg+edVR5H8EViqcRh4MOw5/+r97Gw9mNaTrZYWFpc
         K0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354328; x=1767959128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k1dnW+Zt54C69hvmZUhWgW5bAae7MU/KIyFI4r0RGm8=;
        b=wVTT5gDwRU5C5ANO/cW3cI2GxZ992ubdtH0H9SJqpdpAYzQmGtvx4lUvBRthn0EHFR
         l0FYbUX8jaUjEx3OY4AmqdAvJ2E5JcXJvMGoIAaE1ImGGb3dQXMe9RGDV08AHLpK6zug
         XJjkRC4hHykS1mm2aVKdhUb1z6o0HHSFOoh623yrj3dJN4JX/otMXRNuV3SsR8LxwWgV
         7fbe4dp2Jmgl8eH7hA21zu31X6Ho1J6V8Lapfl86WDqokEsxaUc9fWlyVyDhDNrQBYbU
         ChRh6gOCI11MwOebas8EhBuHru2ytRNVsFSFhcIV0Ln9VLNfgf9uiDNDrVIJxcTJLnt3
         Z+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ6Cwpn7COGViZkxmHSjpRkt9mMFpQci3biAGZMd9cFYlJSAxkHeOktxpx4ePwiqgAe1c9FACBpG71BaqK@lists.linux.dev
X-Gm-Message-State: AOJu0YwD6uxnr8gbU8szAQkDy2wqXe+GoM3B7odfc+pTT8K1QAq0tyCZ
	WRmh2kuWLL/XU+4IfHAcel20FOgNtciLUTyCwbMC6yLcQToEkbbPvwcZ
X-Gm-Gg: AY/fxX40K2CfJHEJkdtrXbIaMrzXAg75qQ4ykTe56uzb67Zrjq/LggcgxgGEwR9BtX9
	wLdyluKEofcTMkay8Xn9C7smtkkO0CRbOnOkimfPUwuUcYMcJ5zBHfb57JLwS//c1HHwt7XZRPg
	/hbrT5/XVqzGKJhYZcMaK04k3C2MW6veCvpZsuXb4od6N4m75nH4ow/6nDyZ6PqxvSMzw36PSBj
	2GUVuCkdEOTN2H3R1s5wcwha8Q928yaq7cc+DI8mk42SZMsFwodRubNN+ONv+X3iASbncMHtlN9
	OsPB4KG8/H1MKhGR7/UX+no+3KwmZ/qc4J/c2mAy3ioNmHSkY0ZUFBuFYrsf4bdqvik7y25z9dH
	W8QNPVeL8q5/NGoUNu3a2MqoRPG2oby0WXk5HpDK39a5dhl4m5fyxLRWfLUIn8oOU0QFTStzPY+
	21VFK9MehDFWL3LZ6oCY/QJTAa0XZfagXQ43K/PCWwZSi4TfjCZngTrBhPVBpX0IzrbMm6HwKl9
	+opglY=
X-Google-Smtp-Source: AGHT+IE6ACYtbfDtIgHRuD99sx3uuiu8dKeGyrijkk8cNwMwXUe595t6B/utOB2BInhViBh0R6kqVg==
X-Received: by 2002:a05:690e:1486:b0:63e:b41:cebc with SMTP id 956f58d0204a3-6466a8395admr33899090d50.17.1767354328416;
        Fri, 02 Jan 2026 03:45:28 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:45:27 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 0/2] staging: media: tegra-video: move shared SoC declarations to headers
Date: Fri,  2 Jan 2026 19:44:59 +0800
Message-ID: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up tegra-video SoC data declarations shared across
translation units by moving them to the corresponding headers, avoiding
local extern declarations in .c files.

No functional change intended.

---
Changes in v3:
  - Wrap the SPARSE warning in patch 1 commit message to <= 75 columns.

Changes in v2:
  - Add the exact sparse warning line to patch 1 commit message.
  - Add patch 2 moving tegra20_vip_soc declaration to vip.h for consistency.

Changes in v1:
  - Initial version.

Sun Jian (2):
  staging: media: tegra-video: move tegra210_csi_soc declaration to
    csi.h
  staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h

 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

