Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE341A502
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925915; cv=none; b=df3xK2qVT+B2iVX5nUhVcFS+fHWoD3BoGj5U4Cvk5Rct48WUZBLwVOxCMN2LGaWw0VHsExeiKVQViJ18wr120cytwoVaWqXjC9hrQEANJJK5hM8pzUfa7y/oeZ+d5xrw6WORukoelMw/r96VIxDGGGLYxZFzPsxdJnzu13xc7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925915; c=relaxed/simple;
	bh=HiaU+q5Z5tDTpbFQyiafkFs3u8yzq8OT/DxIh5N6uLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9vPhd2uJ53dU6FC5KZYyqEjitvJAh/SqGwiU4g4SuASPK8Mpj7NDsx70y2ZsIAhzBsF34sA+ID77aWux6DMJwEn3q7M3eew6rz+GX6567jveoTCWJqx3AjXIS/q8F2GEZV2c2+6jH2ZewGwkIumbFiVnQ/Ed7b2UtZGYqFI2/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQ9d6UJ4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ9d6UJ4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so4539739f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 00:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925910; x=1791530710; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bB4mviFaTg52lMAlQb9mClXh9oAds6IAu1vT5YPotyg=;
        b=VQ9d6UJ4WcO8Q2j5UkeRZe2BEeI/FVCeZqXV2c7N/BMYYkd62qAu+o931f7zVUiVUy
         Dh1UiM3zYWAk/mCpytxrOZiqis1Dv5vtlWKgICPVoTIzU5HEX2rvH5GFBoKwJjoJmN/3
         B69UGYChxKAYvGlLmPfN9V0zaK4ixqYMYcx8PNbRGKFjoo2GtXcbzd2jeUSOGB9gWOev
         5BIlrqxxQ5zsBLEZPYRTyv/rRp2pwwow/Cu+VYi+zca2yaXaODhe1n4JNx7hpnHt6PLJ
         fDNc5f7THKJ4qKc5PJv/DtTnIBSozpqVGZT9hybFZl2cakp+nJyGwaV7Giuu5fVvGqXc
         vdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925910; x=1791530710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bB4mviFaTg52lMAlQb9mClXh9oAds6IAu1vT5YPotyg=;
        b=WI8JMkWCWb97p43m7qLaO97k5fUrWx4vifnx/diE6lmdLJt3bJCLaWf9BpyfXLbcKY
         dnNqSMbkUQI/iV0r2rh9Rp4y8SFb/MUFeWrM7SQRIytC2wCITvvlNW9otDGWanrDBgat
         O91Bmhli3IyTsEcAFBF5XDhJkqHLHFgnyarNdWGtyO0mKZln0+2lzLTrRfOtczniGrDZ
         0kySBIcfSHPX45cKmKGyGWf4rNGY5vJ/vEppD9lpwg8U8l2tv/TtPytRN0otXixAHpH5
         5KH50nt6tLVF0z79IIK+X2SSdKwMWX7CqT6iytuqZVJT1mG4EUoV38VsoZqeSo25nogD
         pd4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5fZ0vUeoLj8IcibzubGWYLFPso8/WQpVZSGcx/vb5yMn8IOHAtEualJJSX38YGkPfwTkzK5QqwUHLQyDz@lists.linux.dev
X-Gm-Message-State: AFuF++mmJs2pWWQCSdXQ6eSmz8pPLEFx/IVKTPPd+z/Lb+HglWoCiFoG
	7kbj+nFlWk8UeCF3pS2E6eazGf4M05r0aBmhldlct44UgqYOAdPnj2aT
X-Gm-Gg: AYBFou1WkmTrNoUhukpf1a0omNF5pgG76czn6I7Jp5FCKVeWlJiynI2Fo5gbWw/7eRU
	iLXIGty8qzhfX8YPU5oMrt1nIPmVm4NGMMIPRJLleDC2FbGosCkmXXaaXPvUQA4H28m7gnKGyda
	74NKf8UcxOPqRGyHC5Hx7RuyEy0Pc+ztXAJwKqVJdsmn5DQm6x8jT1amcrTEsrIOyz7whpb8229
	LwICW/fO7jZ3TlWrizSZ3cvnMcYdzlnfi+FUYddHrVkhC2AHbnhmRHtR9IDtTDlJokJ6CcBpE/b
	ULlfB+N2SSX27RO3m+5LtNqHAszSdt65X1EDi5rRCqO6s3xRE5ELSqZIQSyqWepiME8W0mPRytF
	5Qx5CCJJyDUAe67osPD14BCbfe2pS3RJm0CdRywWSpxDsw/FYmw6iGwXkD0v/Fe9mHxEG8gi4BO
	jw+7bWlgN2QNtoKc4AkQSfbgu7f5CqgVSqxuZ3/vkfIF6JYV+FR5FrN8b4A2uyfGiC5pA=
X-Received: by 2002:a05:600c:154b:b0:4a0:1559:bafd with SMTP id 5b1f17b1804b1-4a027573e97mr33311035e9.8.1790925909801;
        Fri, 02 Oct 2026 00:25:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm3713815f8f.10.2026.10.02.00.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:08 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:25:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <ar9cUQd-NEJozKxg@stanley.mountain>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
 <20260921165527.1379-1-itsadi2409@gmail.com>
 <arJXA7q5a40jcASB@stanley.mountain>
 <CAAd6oEjAMrJjx6PLDE7jj5OsgbwFWU9Uoy=_UyO8w-5AyZCxqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd6oEjAMrJjx6PLDE7jj5OsgbwFWU9Uoy=_UyO8w-5AyZCxqw@mail.gmail.com>

On Thu, Oct 01, 2026 at 10:51:00PM +0530, Adi Prasan wrote:
> Sorry for the late reply.
> On where ie_length gets set - there's three places: collect_bss_info() in
> rtw_mlme_ext.c, and the two H2C_PARAMETERS_ERROR checks further down in the
> same file. All three cap it to MAX_IE_SZ before it's ever assigned, so it
> can't actually go out of bounds.
> 
> On a more sensible limit instead of MAX_BSSINFO_LEN.what do you have in
> mind?

Please don't top post.

Why not use MAX_IE_SZ as the limit?

regards,
dan carpenter

