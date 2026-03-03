Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77643803D9
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527384; cv=none; b=cJg2zCBcQmMUUJAEPyFLPkRQ9R4WUFjXN9Gi+Y0DmCffGdOWE8GIr6eHaWgDuR+E9zKQlpg1rXHKw9hV3f162CTAWQhsa1kht+NFkuL21zkCa053QMjxReJPLAAWJB8hmg74FehXzzylHL8k/Glu64S1zRQYrSPWROQ3xSIquxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527384; c=relaxed/simple;
	bh=BtYUDPRydbD7qJguB7Cv1gqWmul/7Eiqmo1Zcx4dX7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQGBkjd68zcOr9SmiH2j882FyV51ActhCbcTpienexjQlmRF1oCIU4z9xUasnXJqMAABfZRErpvsJsI6e+b8fkBNwOHnJQDCPgS/YLTEQW5jxdCj4h2kyr+JbOO5vGkKstyqG3L7eXAW66YmKMYxE4Y+G6QWVIpVhVNR6zHfOYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivUJuOwt; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivUJuOwt"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-389ee8efedeso84020441fa.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527381; x=1773132181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=ivUJuOwthZbIv3+LWxX9tByvqga4U65bIPnZj4v4JpVotRgLYycUIClFTG1oMLsnZG
         kaU+oDgeaCq5N4GAoOljfARDWCLvh6ra1PVFJ3WvogXmuUeO51S862C+aIMz1r+2kqiP
         zAJ4gjqcGARWVGzVDPuU9GC8c38mNPwIDksOKQPm7uDCi8OuptfTl9gYzkZZJiaZKgZe
         sCLdm+/gB0y69rqWmLf4fZchZIwWZZXZj4GciShIermGx8mcUWkkTZtNwpkDdGm8Sumy
         NkTVAb+CdsbdEx69VcGhhE/nLAfGD8QzbplZYDAJbTkP/jNxskPUn/BdKyc1N3l/Tr0l
         XLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527381; x=1773132181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=TkUsHk3mxW8HuiqqFyxR+WJggFWS9RCwHJM7+2o5hGScCyT93aPvQnH6xr+2mBRnew
         8+Gadzr4X4BnRbwEpsU+uO50z27XaiisYiVjr74Q76ya/sbR8189ZYiO0vUmqUJlWcHI
         WOipVlNyoU5QiVaUyKuoWMfuTHSYlG/Frmc+o9pApWW6R3EpFN+M5ukcIJQvaENm5p3g
         LJZfCatr1cp2jtnFwe8+y3cH0bS6PzNeiPgnqChtDaShPS+5FxBsTA2Q434VXfqTky6b
         jMmRYHzF3dKNfYy6CWkYgdzupQcsbssuEx2A/C9iiuEvLZZiwz7CehWdseq55DoGuDb8
         cH7w==
X-Forwarded-Encrypted: i=1; AJvYcCWcQQLJUV5E+l8zuti0qk/jCgL35yQSVrUfaOF9TzHDfZCv95vsBkj2C+5jNUbtI8QpSEoolDsN3tCF9sln@lists.linux.dev
X-Gm-Message-State: AOJu0YzNdjJjqfG14JCHk1CeRgc0AFTV0hg0nqoml5WkneXbcIwoZjtL
	ox9tQbN53LqM0BaUSmAzRcWTvB2Gg0HmWP5Tl7Cc706htRt6u+sbXwoB
X-Gm-Gg: ATEYQzxVRg16zAfFvkFo/gOWZKJXcgEQTKRWkiimq6Lk/Xk03Vxnj9I0yqO24cCRZDX
	mx5qZ9UAJM782CDRjd8hiE2mNr+E5DSVhM1emEBfNNpJjK6Hz0wiFlZgelx5mSlzXSXaKjRqwag
	3kYTQ+fxYSYGCczQWg00qINojP4aV1lfXfQ/x2Yd3j7EQjMAK1nA7qZ03bVYy1IqvbUDeCG1lPk
	c09HjsokUT8yzMC2bKfgozlLWtOVNe8zTNMetmZlTvDkhe9l1dOZF8wjttQt3XMktHKz3RjdtEB
	mpTs5MJgLLWAoAOSFZVN4opxywYqalGrAe5f+9bAWLBlZqi1uee6eN4RHVG+Im/yBoN9oDlX02O
	3nvIV6NdJa8n/Z82aGUCHt/yKQr58uNsLIeuiC+qeO0Iha3ZuW5dvmNsiTHAqJ8KwjRsFjZamyX
	fo4qyLxUfe7O8S
X-Received: by 2002:a05:651c:882:b0:389:fa5e:51f9 with SMTP id 38308e7fff4ca-389ff355fc9mr105960021fa.27.1772527381047;
        Tue, 03 Mar 2026 00:43:01 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 08/15] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Tue,  3 Mar 2026 10:42:31 +0200
Message-ID: <20260303084239.15007-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index aa9ff7fec4f9..b2e706fa727b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.51.0

