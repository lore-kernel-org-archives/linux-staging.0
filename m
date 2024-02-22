Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524E4131728
	for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 13:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608272; cv=none; b=R7MQPCJ1dEIOKIUIDJh9Z7b/b4vTKllE7RTj9mCMRFoqOMP1+68ako+3XVGWce56nNB6w83aI3/dFaAVL3zHNpsnbacRS1/iPd/r1vgWGrmWj3DaOa2ezNXonByIGAzri/RFXcxWgiWWccLpeTz8z8j+WCGqPZmKNogMPuWhJ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608272; c=relaxed/simple;
	bh=0IHfQCsPSzb8pnRPoBnWK6s2twIJXraeaF4xwtfCJ1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxbsxozIJKodSjk1BfOfOa0jFpvFo7aLrYCFNRxtGHzUquLSn/4CXsQpcLD9J6xHH/HLmX9gvXRiPV5YpVsLc7FUyuYLygz4zHIke3sCfDqwfJeEyWkqorWb9Dk5VWn7wNJRWQRL7UmyTwDxd8nKfcVThKq5DuO/+hkO4Hz1rkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=lWwpF6yR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="lWwpF6yR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41272d42207so17422775e9.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 05:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1708608269; x=1709213069; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DbxUMRAGDF1HChv8QBv0mMPpjYAbLCrOUtOWPuhncuw=;
        b=lWwpF6yRlFVzZtudnM/znAT3P858NTcduZdp1jEUbPs7eVP711GwOHSCYorn5INiEb
         rrJBEKT0A68Dp3kLbkVEe7/hEung1Ik0+LjLQuv3RsQxnJzdYSqwVhaGgMejqPrqM9nD
         Q7/dqntTYrGZQfvcV4fD+d6QY5JaxoFT3H8IjCp3htpNq9JwdCFrao8vUIX5GPpUS2VG
         yv0OMnKiuVCYv9+EqyuP4se9k69coW3YQPu6HeZccJgH/XlcGZTfmxpHhTuG0ru+7tI+
         8mLyTxMY0VnD9urybfXMgNg4LznbybH8H/Wcks2K4OxaPwoEPrEyzV9Wjm7wjxonLGA5
         ZN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708608269; x=1709213069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbxUMRAGDF1HChv8QBv0mMPpjYAbLCrOUtOWPuhncuw=;
        b=lPrGb5MYkDd+gtDlmmA5uiXrNd5bthSMCAAgVRR401Oe+wpGQ8e7uBDwvI1bMt9l3B
         Gn4mGk8UEVSw4CZtcYf1SL6ZAy8afAnhWWDXyo/kNlYi4qp5hDF6uzPVE0qb0ay/wEbP
         16zZ/+3Go0g8Ffa59S4ESJtpEfBvPWS1Z6jVV8d2NnWWf35nWiIXS1YuVIklwLxWOHkC
         si9ulb7fYAsAmKBjVnaTrKsBTlR9tTNJ75z6Ws1jrgtFDFaNoNP9rN/vB4qb6qsBocwA
         Jl6JDSloM/ThImJJ5Cl17fkPKWzIH5/w6wW8ECSr8qmQjO1FnFpj1vUrFC6/cnnywwrx
         yAQA==
X-Forwarded-Encrypted: i=1; AJvYcCVKQC4VaP1yjiWM1zOoGdP/RQ8KTrI975PeBOiN7TAvpUF9BseFdR3hQmQyQwybMq6XHk4JI3NnljWMi7+1tLq8+qLKrBvrEpchTjkBMw==
X-Gm-Message-State: AOJu0YzZIrnCvBW/bFU4qWei1NwXxkWnyRIGD4P1aFOx+1nsVtvy43id
	nUR2bBSuCCPD/o9di4FHovfkJjeN0+TJBhxgKEFRICLmwjrwze3eijr+I45CIjM=
X-Google-Smtp-Source: AGHT+IFu4xid5HojxVhW+0/O82323fmGQj4/MxZKPTHYrb4Lf+CaWCzFoRc/hh6Sa58zcrg70bXmgw==
X-Received: by 2002:a05:600c:4f47:b0:412:8f5c:cd34 with SMTP id m7-20020a05600c4f4700b004128f5ccd34mr10013wmq.27.1708608269542;
        Thu, 22 Feb 2024 05:24:29 -0800 (PST)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id e25-20020a05600c219900b0041061f094a2sm1884631wme.11.2024.02.22.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 05:24:29 -0800 (PST)
Date: Thu, 22 Feb 2024 14:24:25 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: John Garry <john.g.garry@oracle.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, gregkh@linuxfoundation.org,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	masahiroy@kernel.org
Subject: Re: [PATCH net-next 0/3] net/staging: Don't bother filling in
 ethtool driver version
Message-ID: <ZddLCZ8D-qe2nOP_@nanopsycho>
References: <20240222090042.12609-1-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222090042.12609-1-john.g.garry@oracle.com>

Thu, Feb 22, 2024 at 10:00:39AM CET, john.g.garry@oracle.com wrote:
>The drivers included in this series set the ethtool driver version to the
>same as the default, UTS_RELEASE, so don't both doing this.
>
>As noted by Masahiro in [0], with CONFIG_MODVERSIONS=y, some drivers could
>be built as modules against a different kernel tree with differing
>UTS_RELEASE. As such, these changes could lead to a change in behaviour.
>However, defaulting to the core kernel UTS_RELEASE would be expected
>behaviour.
>
>These patches are for netdev and staging trees, and I hope that the
>respective maintainers can pick up the patches separately.
>
>[0] https://lore.kernel.org/all/CAK7LNASfTW+OMk1cJJWb4E6P+=k0FEsm_=6FDfDF_mTrxJCSMQ@mail.gmail.com/
>
>John Garry (3):
>  rocker: Don't bother filling in ethtool driver version
>  net: team: Don't bother filling in ethtool driver version
>  staging: octeon: Don't bother filling in ethtool driver version
>
> drivers/net/ethernet/rocker/rocker_main.c | 2 --
> drivers/net/team/team.c                   | 2 --
> drivers/staging/octeon/ethernet-mdio.c    | 2 --
> 3 files changed, 6 deletions(-)

The set looks fine to me.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
