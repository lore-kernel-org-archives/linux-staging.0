Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC9224B1F
	for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 22:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717520; cv=none; b=kmf/RtBXCk8N+VXkDQeJjITBacAgNo/lR/3uKFb5AlwvA9mRLKm/qt2OK3oPMLomlXANe0mCaXN15leEqkfVt9LyChOkJ6xzj20WZd1WQHvgPlzSHW4Rwe+ahsH74VK2r9VDuzmvg3Hjy5fcB8izPaQnIJVfo1Yp9wsfsPvcKVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717520; c=relaxed/simple;
	bh=iSqfQdhhNrFUcXqgyYNd2M03410UI/DXw37Kxcdnpw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgF7dHhfbcq//LVl80qkgSIrjm2WCALAd2Dxu5IsECqwpAikN2WoO3UVg2mmUESV0A+wp2dzw6F3lCAYdEUl7Nmgp68BRy4vtm95++GbrwwTTFutmLJaMi9n0EjGBd6OTQ9KsTykb5qcQE4xZv4R5zN154ziJcUXLPsYorJP2qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uo+E9rrP; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uo+E9rrP"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-408d7e2b040so3169412b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750717517; x=1751322317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YurwFid4CmPM1zECZ7NAIyg8xcw24kM7tKeHyFwlZDY=;
        b=Uo+E9rrPozR7sQkKz72GCqbtJEdg4bfJIPO++eywXLYbVONSoEeHRejJO8Swm2Oxnv
         ByJkxzTsi4PQf1gXdTCUZvtF5Jj9De6t2WzFGKKwVSCN35QVxqnPYglNoPusY4RuSa3j
         2gs90okxjtW5CdUvrqBCOLx3Dspc838V95T+ZufwfMJs/HG2QJZwa9VtVW3CXq+GVO8f
         amCrTDPrw34VyZdcSRvt/E4WDvHPsErSzaoMXgpHNIq30d6F+RiGY1PRyCWV29PCoebY
         3NTNu98unXU7PdWwsOCswcvJDN1+ujcemUgDOtC0r9H6Inx3BAyzQwLEKtxNfLZy7h+e
         XsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750717517; x=1751322317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YurwFid4CmPM1zECZ7NAIyg8xcw24kM7tKeHyFwlZDY=;
        b=cJAKYQ5doyfG69ynHlFSLAtUo3cVNePpEkQdI/sURFjuNCieaz/Qsb152VCQjjIBDu
         /fTczdxS8s+WV8qQblAz2ZknaakXZpZ9Yu1+7MC/iAvVps5Q0Me5xKxEsCK57jSmyJu9
         rlKE+71raeldmFJW8Gs5qFuj3/VKwrE7GLYRwQ+BWB5YpJhE5XVvJEFmNzPfrl+EemDs
         pIkYrr4ABO7TbXtMrfqTrVe5Td//YBs+8EVdSgjy6lfZ6s/G6zxBy4VTRqKzQzeTgYJC
         Lj0dkdlD5flHqmVpe1Ulz7GqjQlWrsJ6r7Ox40rPldiP3bD6A0fPl5PzK4eM9Zl4HR4v
         e2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUKXt9bNM7U4ILncEbeNg9QmXI81IKx8+HNRGhULAZeOqVnHXaecsh8Itc3usYAj2SPRn+5cmDpsdYh64e5@lists.linux.dev
X-Gm-Message-State: AOJu0YyBbcm8Wfy8USOAvcfxZl1y75Mp83hNxNwG+nhNkEZegKqEbSQ/
	61HBkScg/WxMZY8YsL1D6fWKOyZB6vBqgXneNjdxtLc89k0gdl5QvK0IFrgfQx0l3Ss=
X-Gm-Gg: ASbGncsg8GDepvCE1X/yUThSTe+oIUTwqmfvnauqnXDqEI15bE36jYEjCfR21HqzXFH
	Y24XQt9F8uS6E21Rrn7tC/7ie5621xAxCOlSqC2EbCWc1WHTBpgvGBZQo7QgtRmsMPhZ4IENGKo
	9yIcPb3hC1lM1iKwMMH7+w2I7icnkCROiJFb5sHpJHY+ytKOhCzTtH+ao3jXLVxK7SezYNTbah2
	trjCqMJ7R642fivzTaC0R/b8lALRDMlGtHW8HNIYkR24LozoI4AuPJCO54Bin6PraukONp1kbe+
	nR3fcaw/HA2ZknzotN8XVOmj5VPvbEG8HRmHcgEW8Hiz5fH4bZ7YQBCAl8JngFFokuj6GQ==
X-Google-Smtp-Source: AGHT+IE91XZYWlprKGhHxRhe/CzOGIt6hPjcFJioO4ZNtu61oT2yO1/raktvIuwHoxAPy2DMwidNoA==
X-Received: by 2002:a05:6808:2008:b0:40a:54f8:2cac with SMTP id 5614622812f47-40ac6fe3646mr10872876b6e.37.1750717517244;
        Mon, 23 Jun 2025 15:25:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d3b353sm1557857b6e.46.2025.06.23.15.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:25:16 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:25:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: gpib: fix unset padding field copy back
 to userspace
Message-ID: <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>
References: <20250623220958.280424-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623220958.280424-1-colin.i.king@gmail.com>

On Mon, Jun 23, 2025 at 11:09:58PM +0100, Colin Ian King wrote:
> The introduction of a padding field in the gpib_board_info_ioctl is
> showing up as initialized data on the stack frame being copyied back
> to userspace in function board_info_ioctl. The simplest fix is to
> initialize the entire struct to zero to ensure all unassigned padding
> fields are zero'd before being copied back to userspace.
> 
> Fixes: b8394732ff0c ("staging: gpib: Add bit and byte padding to ioctl structs")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

The fix is good, but the bug has been there since the driver was
introduced, it's only just now that the static checkers have started
catching it.  Oddly/sadly Smatch doesn't catch this one.  I'll have to
investigate.

Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")

regards,
dan carpenter
