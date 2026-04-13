Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242BA35B62F
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 05:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776057712; cv=none; b=jQkMLmHPSMCxmBZzJcYgB8q3SbnvaekO6fb2Sq5aMdynlRG8L3DMrYjYBxKkcLsJWcMd+ZJ4U3Jy+ws2ae76SowUvwnmBzLwDFYNFNfzr7rY+GvsIOcJcKei7alhwMfaYI+/kV8H7MXMzVP/NA0lK7yA6AGUJ9eTteYQ+iPD3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776057712; c=relaxed/simple;
	bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=F7BR3iAzouxsKRKvNy2s+sFa+melYtwxmQfvxkneDE/u/RtF0OYAQE7txZDbQC0OYGANRm7VzYqDoonBZwSu2YxhdCaz3y8x9+VlYSukESy7d+hJzUq8v5+zq4idAk0FkNlYMXppGNag0QRhMJcFByY0oVTu8xvRgKAcOkep/oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKrv7rYE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKrv7rYE"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so617848266b.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 22:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776057709; x=1776662509; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
        b=UKrv7rYEO3APDKEwlHsrAgWRW4KgQvzmxJp8KjWWG+FtV/QQ/x0ScEsLBLgBZYxZGU
         927Mi6EQx6PY24es5oF2g3grpVHXnjlA0ZJuc82BxS5r3mnSNSh88iqhEKu+PgdSNhee
         C+TSMWcTrhwREyxHbXDz4oRdbi8oqRkEbV72YATyu9YsLXh6x4zJdl43r5k6fmhdiyMx
         3UnneT9K6XiTVWvBV8VOobG5NV5J5kmkQ7PaghiOqzRzlSueSWaeOvZIOjzNF3a1TK1q
         tV4wLyVu2cG1vPqVvXIzwP1orM7zcHftomEQxDy+kpYvHrb7fgQxFY3XHDcaTKhXB6pV
         GF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776057709; x=1776662509;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
        b=T5cCiVP347XwLchRSjFj7Z8XKoFmhyhiszTpe1yhZfi7weVQBP0+1F70wPLNNI9PVJ
         RSsmSED/78vKzfIg0td8Om+XaxjQPxeW9/oGnf6h4xv5Eqyop9efcjJz2IU+YfbCNiEK
         3Im8vIQ7yhlT0fCNCbXba5BRIVlnTkXMACbFaxSuvtft7ci+hlNSV4uAorpWCpAZCMPS
         In+nAmqvt3cFbM9MxMD0KfqEaQuf3qQEpdvSVYLf57BAR2ocfmtKKtjCVKT3mio6nmqm
         8RQ7oDjRWoJLcKOpF3XnxQr42O8Oub8QFYSPKGOlnMkKn4DkB7ye7IGRfHI4yRdLAGjL
         NmgA==
X-Forwarded-Encrypted: i=1; AFNElJ+lxD7Cf7gqJoBUITOe/Q6OfHh1klGKpJmkMwR9j3xjznhxV/riXj8d5P9o0xwFVgCN/pIWb8A+bPZ8z0fV@lists.linux.dev
X-Gm-Message-State: AOJu0Yypg78i3T8Hjgbnw5iYam62TcbJQbtIV99p8vp4mPvz9bhm6PIS
	LCGKUSINLo3xa8iGMnYOV5qCAsDcuVVyKa3gLpvfkqe/GhWdqHGKCXXQ
X-Gm-Gg: AeBDieuHI0f8cDowarHdq4CBj405bGNe7XbFwfk40trX8pLuYkIejXyoRhEEO0a7oCy
	eKiyoRGVq8PVgbbc268CmwzgahVh5FdX2/m1IFgkKABp7kP46EEqUMgchHsdkYfyp9/ZInqoBSO
	3nII6Q3SaXQ8DVZ/ntlanMyUHxQkCAYO+yp5F/fCq/XNGShLgDKKSem9mOMuVEsoiFG3XfkIV2t
	PXRBrGAicu/IsZIhfdwcGgMkVDQrlzNhKaFgK4bahRXQwrAE1+Q096v5N/GAA3BFPHqVLaKQ73q
	cP+e7JT6HWLHYZVolgtvFMKesmBgrMlysZHTJ6roZgHXrWk1dLiPSQQ9JKH/JdS7TIfWCYo4NXG
	T5QHtwP//edWq4zb+D6+S0xAeQ+eBDZZm+IBLC5NEAGhoQeTd29eWgOM7TdgpDVeb3L0OR0X77L
	jtKo9e+s5csUsNwWfzm5YUZQvE+VhHixugqUIfJU5J5kCjYrZz1Ue1b3lBrUCPt71Nz4TmpJCrw
	e0+pxQnKJAAo0TttfEsMLKN1Wi8RQbBMThuMxWKcFKjD1anvujrXDLM2Ehrug==
X-Received: by 2002:a17:907:7251:b0:b9d:eeb9:b992 with SMTP id a640c23a62f3a-b9deeb9b9eemr68012066b.23.1776057709077;
        Sun, 12 Apr 2026 22:21:49 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671505caa61sm629377a12.14.2026.04.12.22.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 22:21:47 -0700 (PDT)
Message-ID: <69dc7d6b.a70a0220.2403d.c1ad@mx.google.com>
Date: Sun, 12 Apr 2026 22:21:47 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: media: tegra-video: add NULL checks for of_device_get_match_data()
In-Reply-To: <20260412205057.386856-1-hossu.alexandru@gmail.com>
References: <20260412205057.386856-1-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026 at 05:07 AM, Mikko Perttunen wrote:
> These devices are only probed through device tree, so we know the
> returned pointer is always non-NULL. Typically we don't check in such
> cases.

Thanks for the explanation, will drop this patch.

Alexandru
