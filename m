Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C5A1CD30
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708943032; cv=none; b=n/7UT6YCk8f6aN5/Btvg4Ob7JZIdCGCx35La4SZGdhGB3LMeRdyQ/a9e4bYgYG8HLfft4+eSKInIauZYgDSGsIMHtLkCTqNF6IFWst602W5J5EQKbda6H7uudND4bI9ph2LkRQw9W8Hyqfjg4MxMX3UPZCWSZ+x3kUSN5WShUXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708943032; c=relaxed/simple;
	bh=nIlN/jtpPeQnxwEmEu5CghCABz2PEFjtvaRZ1Mc+Nz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHw1pToj9Uf7XRNIrpjBxZMklckIYhdc+Xc/u7PujOBSLKmLXvWdAVoBvA3Efygo7NCE8uCzhA4WD1QeiWqV39ThLaQjqxstl05HI06EkRVnrPvAdMyBwr67YFWw8B671v3zp3kGtkCNf6/EOSzdKYJS8sP08SpGf7u8cf9nGMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cawOFCl/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cawOFCl/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412a8d9402eso777415e9.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708943028; x=1709547828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xlfTscgQB9POTfBUx30Xla8SuM0B8+WvX4CUIan6AuI=;
        b=cawOFCl/W+Uep5S94tJBaqrpJdyKiDIqJuJX/DfeRBxdA6M7fYnEnJzawQGoA3cDll
         ss9i/ADNirUFl3J6FA5CSVpZwGOGuGOPh8rT2AHHLE2ChcUd8VB2+59W67BcM/4JSdfi
         //szxjKORxhx3q7sRogOyQw3KTYLJjn4fPDLeYGJ56tv60ZtJR7FsbgrwJ/DlWZLlKLW
         cb04znuxRjTlWNocBPThskjPCw+ppsJ28psP7gScho89ZJ6gy91YaGFOSX7CqpLgwI2f
         yXGHHMm8RYPiwxbQJt52/xH9eHFmw827Px8n6kA0APw9/IjLGpPfgyv1xip5WJyx2j6r
         AOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708943028; x=1709547828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlfTscgQB9POTfBUx30Xla8SuM0B8+WvX4CUIan6AuI=;
        b=CpFcO4IM0ha47mAIybYFvOQOCIT7aiwtmHTTrkkTKPDKJwv64B2QKB1TS07ig4iRSH
         WnGUdW+M/kQ6gg7gqcGfpa/t/Xt1NLCCVnopLExcWW3rYBtM22mn4uLWfp/6W8rcG2zu
         aEFE4bFDgsde20J/t821XI+s3nn3jFuJ5O/ZndASw3XD7ZeFYmGxex8Q724bTFJIIU6B
         DMQXwUrHYM0QkdqoYkBQLYJKigbVbAhYWMp3t+PknTWK3m/PWQD2WzKM2uXP7IeOikDx
         oCr2Wi6crEi3pIq3MNA5iggYzQwd0voESbu5cuFgVbb5ID/lTT4+TvQ3E2obnpdc0Koa
         FxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrfrLc/z3C1up0x3j2OUlf0CfCfvIxyGFXzuseNBq0c6tL4NWk2QvYeDCAnWEjqBHmVe/N0mJ2hG96K06TmFcOkxTfX3XTjrqY83Nu2A==
X-Gm-Message-State: AOJu0Yy/QBAXuRMZppgsVu1Mm1+doITM5GN8JOKoRlrRwr3/kisPg6Ep
	mn1XDwL+ZfIjQ7Vwt5sSp+QVD8MLspcMaoqtUtRVmTNY1/TvhIBnrTqeIhcGlgo=
X-Google-Smtp-Source: AGHT+IHOYrGSl/T75n+H59MRt4wltRF4iyb6EgTFzU5G4WEZznntNnYPfL0Uq4b/7PjoKUHydY9afQ==
X-Received: by 2002:a05:600c:3ba6:b0:412:94a3:2843 with SMTP id n38-20020a05600c3ba600b0041294a32843mr5818110wms.15.1708943027842;
        Mon, 26 Feb 2024 02:23:47 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b004125f34fd7csm11415118wmi.31.2024.02.26.02.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:23:47 -0800 (PST)
Date: Mon, 26 Feb 2024 13:23:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meir Elisha <meir6264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Staging: rtl8723bs: Remove spaces before tabs in
 rtw_set_auth
Message-ID: <96ab1a91-7682-4aed-a522-ceaed0dbf56c@moroto.mountain>
References: <20240226075225.44881-1-meir6264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226075225.44881-1-meir6264@gmail.com>

On Mon, Feb 26, 2024 at 09:52:25AM +0200, Meir Elisha wrote:
> Remove spaces before tabs to improve coding style.
> 
> Signed-off-by: Meir Elisha <meir6264@gmail.com>
> ---
> Changes in v3: subject and description changed, revert dead code changes
> Changes in v2: remove dead code
> 

Sorry that I was not clear.  This needs to be split into two patches:
[patch 1] delete dead code
[patch 2] remove spaces before tabs

regards,
dan carpenter

