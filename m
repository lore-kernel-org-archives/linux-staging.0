Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB963C1842
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 03:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711337676; cv=none; b=seTkakvLg0ZST+G2WBbEqmGCBNXY4DAOBP5oOEjA7MfIp8PT07AfvooaT2730Wc9lN5XxCSSaAPA6313SM4HHDVfR2IMlEmkDmcGGgCb1oLY2UYRGovFkC+DEo/HEMEYD0pzdjz7+ZYhewUUJKubBPHVG8lkxSWWOCdcdco3Woc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711337676; c=relaxed/simple;
	bh=dgHhWcmK4wzqyaiiERdmFMSqnnE06qaplwlkFBXUdIA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JQ0imIxENU7KcVAeg8TpQS4v4wApJL/Qcnp6dsVD92CLbK6RLOtchBb7o0BFcuUw3IM/t6s6xHqkjmdHWao6A43oC3iIGYZjHmn0H91YTz7LC40kHfwnspo8Q33Es9OLZfqylINprPqknFsy1puxLWD0j4xTXXojB2ezo/XF13o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWs7Lhb0; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWs7Lhb0"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-22a353217c3so353174fac.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 20:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711337674; x=1711942474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMpIxPMCcxDzGX2UXAJvTPFkeya4KxDWX8GZFo5s2Gc=;
        b=PWs7Lhb0f+dKeelyBIwc7mJ8yGuf2N5huWYzGjpmIh5pvlp7040eesGBUA/+JW9gxh
         avDHCuBdoTyhIgM0VFwfBn5lV1Uq0N+1DgU8o/5wdPSlG3+Cv1hDBTZ6oPLcinRcrShq
         UnIIbf3ajQKQC5pfhfYp9SHy+vRaIOobSuho7NZOf1vo3pVi+f5ur/jQu0rwJhHZciwW
         ffZ53PI4qR+5mS3wkXB6iTfix3474F7aB+iYj1n0osiWDNkLObzReQcfyMt35vGiyWp2
         h7Loi4cxc51qY96rTcKujCVn4JpRLf8C4BlWEZehyHzwtglYt+NyOg1SmSDSpjBCgTQe
         Ys2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711337674; x=1711942474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMpIxPMCcxDzGX2UXAJvTPFkeya4KxDWX8GZFo5s2Gc=;
        b=bzt6XR68d5bP8ohVT/2O+DmgpaMlmqo0guSraC7yfSwFFrYrAtocSIIF0pmx0YYwJR
         aHd/nL0ejkxBu5MkZ8PqVEm/0iBfXNhw4sTvdv4492ETu/eAhAN7BcLc6hLr9Cx5GnYl
         Vi4aGewPh9MdSxuK5VSBDvIz5ub1THP5fUtqtJ0b1Ss/i7nFFHLhXOnw9HQoN1MTxuhW
         Ovu0+JGCBnqIs61pq885y9m/SC2Mh8jJH7zZ0k5/4Vodz5J28d3QTBXGvYSVxiOIX6uq
         aIe3evW4PgwzMCspbj6NoUylUbh5zEV4w0lAGrBIgB1DeQBxoGkBJwXyBo/TJkLntDf+
         YRzg==
X-Forwarded-Encrypted: i=1; AJvYcCWy7meIA7Xa6KP38pzGoKa0o6EBLq6zTT+JgQiWi+JrFwAln3/GmYOl5JeMW0NRBpCM306XYiZyq7IORMhnsXWwTpTwBXImsvWZoQvKbQ==
X-Gm-Message-State: AOJu0Yz94Oz26PFIkbrmtyiACDkGP6NjPfLwJlEJbjtCPyw6JRE7/4yB
	RSRZoKjYvOsiY53P9tQ9gZCK8S726VJakc4acjzpUwFxfTtPO/4p
X-Google-Smtp-Source: AGHT+IGSrQDNPv9m6amL42+SaReUA0caWi4XU01dj8E7zHNP41xfBJTTfNqiPAlE6na2wTOq0RYS1g==
X-Received: by 2002:a05:6870:2183:b0:222:b950:6785 with SMTP id l3-20020a056870218300b00222b9506785mr6717232oae.28.1711337674272;
        Sun, 24 Mar 2024 20:34:34 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1010:877d:14ff:b313:5f57:6762])
        by smtp.gmail.com with ESMTPSA id i25-20020aa787d9000000b006e66a76d877sm3310747pfo.153.2024.03.24.20.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 20:34:33 -0700 (PDT)
From: coolrrsh@gmail.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Rajeshwar R Shinde <coolrrsh@gmail.com>
Subject: [PATCH v2] staging: media: remove duplicates
Date: Mon, 25 Mar 2024 09:04:27 +0530
Message-Id: <20240325033427.4708-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

The kernel configuration VIDEO_DEV is defined twice in Kconfig.
Thus, the redundant code is removed.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
modified the subject and commit message

---
 drivers/staging/media/imx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 21fd79515042..772f49b1fe52 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -4,7 +4,6 @@ config VIDEO_IMX_MEDIA
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_DMA
 	depends on VIDEO_DEV
-	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select V4L2_MEM2MEM_DEV
-- 
2.25.1

