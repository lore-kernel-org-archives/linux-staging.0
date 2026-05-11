Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773243A257A
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490669; cv=none; b=OpYJUa6rXo7XVd7JmN7nT35iyuhjPJMXnVJbxyHovJ96V4rHLyn3v/KmAdeOFO9sDnSW9vtvJfu8ssskF/I8qOufZQae0td6uBCLiIwT2eYuWJnWhPz9Sq7yBpn9pRfEG1H3kJoG63EUIvCOmItmljCwZ457gTzfoCe+GqVdaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490669; c=relaxed/simple;
	bh=9N2Vhy/aDxryrW24nmHIqbwbUPRlrt4qGTj9ZPupNvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U74Lw7o2aHyNh0gjx/esSTbAMQNTU/6gKqb/1fOWkdZcjdGZtv51Eb4oDYKXfkyZywaTU5WbQhy9/UBTifSAnMyBeLHdQQzBa0NYzA7sYA+A+OmcSp4l9qU5Uks+/hDSmXUiKv2TPj4O4H0WKisEMv0ZOVITL9smllBKgYNzqng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkc7zLfi; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkc7zLfi"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57516bb40b9so2348540e0c.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490667; x=1779095467; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1ZNeudKncnWsHSK9q8cKI3Ombie5JKS7sAGEDd74u0=;
        b=dkc7zLfiVneke6WL8LC2ky8/5/qMgJXze76uPP74Gg378yx1w2aXk09uaTISiqihu4
         ospbFLUeImX42gxssor/3JgUy/kSIrLZ3owUDAf4C+XlvYhjYvH7Npq+MaAMMXJlNKt+
         cvp29+9eMifa3udREDIKEh9fMb/yII9L01t9MV1d31904rkDhndpDxhFtEPe73LBPD6S
         MY++qxS3uNbRp19F+p2DhZFrp48polzjFtmpLr2B01eHMSURGBjeMC0DtJmZ15418sAI
         kmsijcNL3h+uICu8hS5uF03gy+F0fkQlml1kVV8QIG/6ucx85q/6DlfNwbWByVK7KX8q
         DHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490667; x=1779095467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1ZNeudKncnWsHSK9q8cKI3Ombie5JKS7sAGEDd74u0=;
        b=JeXjqcivyANdbK+znUpcM7ebXGFZg/IBwsUvUGK6TpUNevh7n2WrZgnKxXJg0jN4tl
         UR1CMAa+OgsbNcMlZ9f84yq8u8qULNmrap2kFiHlHn9otELfkVrByn5kjrIb7/aBtlLI
         s5151pMhvg5BVpaxs75QgPDW2yzOynHYJAQ+No5FSCCBEwOvCuSkg1oUk/pri61rWMfq
         QbyFHACBKijYuvoh7F2shyq8QQlkQcBId/PxJnEHA0suxUiehJYPY0P1LAzHj+kiAdMY
         lk+5nSiufCgpHjbPjcjHIuzBpUMF8YmGVhqWcdKJiRtucviyDVsRSfpR/RYKGzDdfYLO
         sdzg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ee3T7wsfSXq6T/DotJaB3NlHpNYLUhdtNFg4BEeJDyO/KqNbBLXHvKBL5N1004TsOjD7jJ/xjDFTehqhc@lists.linux.dev
X-Gm-Message-State: AOJu0Yxep/kdCzTuIQVGVmk3EwoGfXtGK43NSyoaGB6ZK0Ro239fKR0/
	LfEC0zfxK45lnfiMNFrwPNi9B8ABMCNpM3GZMKX11UaIplOSG91g3NP8
X-Gm-Gg: Acq92OEqZKgJxmOcSQaHiMnWeKWTQFDpRmZIHBd3PVf7tUxw6U0ChIXdPbC0Jl8HSaG
	rHoIvt2xdyff9RK4qqQDM0Od77KC1HCbHUzzvF4zX0RXSsX7/rNjnSMNAkKmMzJchpy70lBihQ5
	gzo5pnwfSAx82yiRGMSIuHyTTajUk5F9f1y1w2CtkegvCeku4IA6B9vWuIPS07ZPP/SR/5tQWqN
	HAVCjN+M+bwE2wpdi+3GANd/Dco+5ZTZFV/2QUXrLTh1z0xnGcAk9UrOj7+31FQMpyts2ZkGNtv
	9gDuAmZg99WpS+J5/tOzaUbX4uCeBpytaqqgkqqcJgm96xy4wEGY3YHSkGog5u5YODcjJcH3qle
	ilz9f58Uyac18b3FHDdOTLWjApGXqOVrEVrcSqpIFdhRm9YJkXMOSzDJ/EVmtp2EBAVI4MzQ+Rv
	splsYyCKkTXwJ4hEusvg==
X-Received: by 2002:a05:6123:163:b0:575:352f:ead0 with SMTP id 71dfb90a1353d-575595589f7mr12946704e0c.6.1778490667476;
        Mon, 11 May 2026 02:11:07 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575869f2d08sm6106820e0c.0.2026.05.11.02.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:06 -0700 (PDT)
Date: Mon, 11 May 2026 12:11:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Greybus audio protocols drivers: correct sscanf() return
 value check
Message-ID: <agGdJFofiZYKqqhr@stanley.mountain>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>

On Sun, May 10, 2026 at 08:41:43PM +0200, Alexander A. Klimov wrote:
> manager_sysfs_add_store() passes 6 pointers to sscanf(),
> but required latter to return 7 which always failed the operation.
> I corrected it to 6.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---

This needs a Fixes tag.

Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")

You need to add Pankaj Bharadiya <pankaj.bharadiya@gmail.com> to the
CC list.  Although that patch is from 10 years ago so it means no one is
using this.

regards,
dan carpenter

