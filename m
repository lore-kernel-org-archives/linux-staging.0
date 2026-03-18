Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99173A5E76
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832685; cv=none; b=qpo5F2W2qoycxEeadOoRwLO+JaZqRt+q3d6crVvrta93TORGXh4+pHtX3uDwK+j7zNVovU11Diq3+X547/uuyER5gbYAHy+3AQl+6CSAL9Z+mrP56/Pk6xbDG4xA1ymSKKQfIp4aUuXkZlYWt7Tjwfy6WP7UhxJa6QsvhiLDxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832685; c=relaxed/simple;
	bh=XNqONWgWTe8jAN7PZU6G+ILHFEYLHk5DEAmh0CGR/PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCZjDq+Z3jygbfa/u+ezOFqF4b6sLLqia6HCFFnJ26r7IvmbI7YllDMSkFTJWYPedrzzG52zhmtsJeqvOJVYexHWDxkwvZx76OvGRoiYPJsJvqc7xsud0XBbgJQeTDxsH9Oatp0cRXPT/9BJ5d3CDdzPKR/9HbgY6Tw9i3n6UHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAJf1vzG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAJf1vzG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439bcec8613so5237445f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 04:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773832682; x=1774437482; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mprAVzmkazDIxuz7411i0uWNea/JvTXoL4j3+KJMyn4=;
        b=IAJf1vzG9an/4yMrgpe5A9idjQr78yLyNPmXs6DMkSR6kFhzfvtGWpHBahsAUVf1oW
         4wkLv7DEiTjhFPdayua4btYAGuQL9fYpRLpgClmRQMW/DXRsJWc4lg9AqVoXB02SawBI
         enn5eIz3tHxqNfH5nuh2dmzUHqCtQRnvQiEdSM4yecrFfkVR7+5jf6o2Akpyn5AL0K3m
         +z/BedKMLCKuJXCrne9ButA3D+oL5dnbgOg3HS6KWDOEnF0Gec6M1DiubQbcC4m6+hwk
         tlxJxMCSQXowl54jvQT9hQNVGChnc4FmQHKNUiO/jGK6JB9mmgRdwD72A1QsLoLY6++7
         5zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832682; x=1774437482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mprAVzmkazDIxuz7411i0uWNea/JvTXoL4j3+KJMyn4=;
        b=ILvZCBtFqxM1ef/ZRLcqcMchVJ07It1VQsTbdvnzfjX1tqJfdR8c7c0SvZ9FWby7BB
         4u/9OcM+wzr/e1j4q7dfqIlnjeg41qf6x0ghJhyyOijqeyMAYKYiQnEDv6Ar7DcheBpc
         Hd2YfcLiofVSwLciI5ub5IQnYHKfVFHjRm/bhckk/ZgDAwPMy+jGRIZsrHsyMnVtHvVe
         KiOvrrp4tVJgkl575WDr2JKzGRnEjpZrxD1bHAOzIretA7jp1DlEJu13Ir6A3upEecJY
         +s+r4U02k218Isr2dNZpB+sU+P6fONFLK98SupWm6UtnFeJD56e5v85BtkFhsXhiDsSF
         b07Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRHdUZLqkEhvw7ZT+U9st/VtMnya3W3xA/e9PVujK8oDkWbfWwXZ8uB1FbAIHVSNLCFfxall8j76Y4bFkr@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5mmNQfOzEPDRPuT8loziAeAtV7QPQSJtw8tQ+AnW3rDHi7tCU
	xIXLKmQSEY/8JXxR8w4pfcvTgy0z1ahs/Tos7LgDAAoqBwoOKIWrTLEuhYiWTdouxF8=
X-Gm-Gg: ATEYQzwsKf+5FbPSV2wR6FBkV23J3i+CqeFD6bbDTFiZOxMA/0nLik2PiDVpibq4UC9
	Ig9SgNU4JktcIncIJ8IcSYpno05G8jUMvT+3TjGeDzfghNVqjw8rIG7XXvxas9JMzr6BjZ+sare
	FdjAedW9OdvwuYDjxRB7fiAmEBYoxnFmo7ZXBhiNyHujRKyp858s58wM5mAMWBYikBh1elgUz9c
	X4XcpULPPl9twJnt2d/qaVPOP+0TTCOqPDhA1mzDuKq/lvgbTe2KUc/P/51hPbRFHerC594/pfP
	kr0x7Uasp14xTceMOXG2nFCvdRCRu8NqbMyhAs/dXbsVZNl//MxSOAWC/1gPKRc/FrNOmd+UsTS
	xxY40twMjhKNg60R9Uz/UMLNC99GIENwgKgfsbWBWyKju+mdXsUtOMnh3rDKsk1RAh0c66hF78y
	W7D9hFpNu7zIhekYICWpxWzFaycION
X-Received: by 2002:a05:6000:420c:b0:432:5c34:fb32 with SMTP id ffacd0b85a97d-43b527ad99emr4753737f8f.23.1773832682005;
        Wed, 18 Mar 2026 04:18:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b7f7sm6962268f8f.4.2026.03.18.04.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:18:01 -0700 (PDT)
Date: Wed, 18 Mar 2026 14:17:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev,
	ethantidmore06@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, straube.linux@gmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: remove dead code
Message-ID: <abqJ5kdM_OsgJohA@stanley.mountain>
References: <20260318092639.27055-1-aadarshmandal9354@gmail.com>
 <20260318104332.32093-1-aadarshmandal9354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318104332.32093-1-aadarshmandal9354@gmail.com>

On Wed, Mar 18, 2026 at 04:13:31PM +0530, Aadarsh Mandal wrote:
> remove unused and commented code 
> no changes in functionality

Line wrap at 74 characters.  Add a period to the end of the sentence.

> 
> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
> ---
> v3:
>  - regenrated patch from the clean tree
>  - removed unwanted addition
> v2:
>  - accidently added the functions in the {} blocks
> v1:
>  - some commented code wasnt deleted.
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 21 ++++++--------------
>  1 file changed, 6 insertions(+), 15 deletions(-)

It should only be deletions and 0 insertions.  Review the patch
and run checkpatch.pl on it before sending.

regards,
dan carpenter

