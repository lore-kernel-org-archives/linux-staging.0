Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BF732BF52
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192838; cv=none; b=LAf36NbYT38H+jddYaqo/YYstKor0SOD9aSzBQAy3AA/hOHlcKJlaPnclAMkrByjalzt24nlAZz9/CM8B9IyP7/GKwBcqojl+OtqFk6y2XSTiUSI/kOyc7tuhqQdQjk5s51ElMnNAQC0Gs5dcoBi/UVh5JXgCk8yk1hDJmHPyqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192838; c=relaxed/simple;
	bh=tfl34mYdl0Noapuc2UJuzlz0da9Lhz548k5r+Ktg9fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7ViKe0AuQWN8W8N5gS5gDx6tVx0KgVU25mnhzUYt/qGz2AdAWIs53/ovGHXRYwIwqtQNxcsThfJLIjkORqja5B5OfWENAFZZRtqKGGiHDguFK2GFRvEYwyN1K1XMMGWGI6C4NCsEjXyZ3xXD8IlSVpDcIBD4gJAs5jsL1ZIkQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3r4re90; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3r4re90"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-439af7d77f0so2466689f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774192834; x=1774797634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4Qw33qfRHBSQKNha6zlksCMBTyHK8fMcFdv3YaBtyA=;
        b=d3r4re90xOtXPRXD20vSFWKcnHami2P40xaaZoJtWV41i00LWhRIms939nYzkEaSaE
         7qfNxDsX6KXsC7JiOaTVpDeFQKxJMu8RV7Ze3aEQVkfYw0AJIsefnpxXMF1njSllGWAO
         lB+jUYlOZfWUwbjpoznkZcUMCri5dmRLQMP7v2eAvrH8o2MzyCIZ7eg5dRqyDdmggRPk
         /+pQ9Nh7/YBQfHSzlYauzJsKh8KtFwP/Ey5nTFc290ccxRNybB5ARn65uUbSPc9MdSBa
         gENBIqWCChEe8WbL6RUJgbSOs03sJNk+Hs59YvT8+1ZAXL4r2u2i2MP7E8c7YFV9BLux
         c+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774192834; x=1774797634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v4Qw33qfRHBSQKNha6zlksCMBTyHK8fMcFdv3YaBtyA=;
        b=UWvzDpimqWNZA9+ftHDwgGkyLQtojd5kXlHGvEyQXKc4HTH3eJHqhBArNL6AYlv424
         Y4hD1kq22mogA/oYXdeWt5BgbXFzL2ChA0K4R07P9lYfH0AAmKVpAKFHwvWdm1ah4JrT
         zMXUz2fK5t3LNVRltP1M940JYlpVZSRwy5R+lBx8+XaAcsab9CuSLEe/X1Ry42Mv8/ov
         SaLT/uUvNDULfo8VRpaM8+/+z0lV16eVdzAXPon9NCTdQ0Og6vRjYSlR/7KX+znSeCRa
         XIkg/XrDvBtJw1KxD4tBq8L/7ZR2WETLJePNF88Ff7EdRe+BTt8GkvTIVaGnxXgAgg5F
         s7NA==
X-Forwarded-Encrypted: i=1; AJvYcCVuwNzTo82vcUhSD3KJpC6X6ZNV98nMi5bzFEPE5TG7/WMSdqEcxCEqPjk4FVhT9H5T5ZIbWHoPEJrQ6+wK@lists.linux.dev
X-Gm-Message-State: AOJu0YwyZfTTJxITbi1SzgxO742SFypzQiR4U2bbq0zaqLkWGWYQK2Mo
	lK3JlUpTgHIZnAdtt4zNaCk3Cc8xmux2LHZ2+jjJ2qkuV/4pf5TLaj9q
X-Gm-Gg: ATEYQzxdrE4Lq3RtFrI0ozc2qs5uITvcZSaQ2qb5iI/K5lTEg5QjsxLe1moAf2UYHE3
	PsZ8q5iQH4FKheDUFOOFPmKbeqdLUwTTdZ5eH+WGeQyUu2IkpUXcYYy5ejo/j+hjtAg4QwM6D+3
	03QmhteNTjPCVNmPLB0D6ukOH2syA9bEyG/eN61+Kz88T2Hl8/DyEpS11mzj2YkMGtVfQNH8gUh
	/HCqMcJia4+yKFQqe46YaGcLFoBqj+3L7Rmv+ALQiTQhRT/bZGQRIm1pGqDSnM7Y1TjoQeSI0af
	kdde0yBrES3+OafTf3uwjb5hRrI+lximSiuLmVmZiC/Ecx6xVDPby4l6T+Wh/qBWGgk/rJYd72c
	NMvVddkAgyAItDIr70+kz2uxMXieWr9ANIPHCOnf+Pqtwn5ryv7CC+MMjbdMJWtsm3cPpb0O4QD
	uu9OG8M4fOf/qTpOS3wycx
X-Received: by 2002:a05:6000:2508:b0:439:c1b7:890d with SMTP id ffacd0b85a97d-43b64262ed1mr14748047f8f.26.1774192834161;
        Sun, 22 Mar 2026 08:20:34 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b1f7sm21912792f8f.25.2026.03.22.08.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 08:20:33 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: rayfraytech@gmail.com
Cc: dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lkp@intel.com,
	straube.linux@gmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary braces in single statement blocks
Date: Sun, 22 Mar 2026 18:20:15 +0300
Message-ID: <20260322152014.9381-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321220612.6560-1-rayfraytech@gmail.com>
References: <20260321220612.6560-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Mar 2026 15:06:40 -0700 Oskar Ray-Frayssinet wrote:
> Remove unnecessary braces around single statement blocks throughout
> the rtl8723bs driver to comply with kernel coding style.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

Can't apply it to staging-next.
