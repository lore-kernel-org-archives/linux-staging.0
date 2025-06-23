Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B8B130E58
	for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688222; cv=none; b=fA0W/+zZZxReStObco89fq0LDMgx5SiUsutJwO8B4k0DepmXmmxA9DO9Y9km/EDEqX6Fwbrx1S93/5XnQJhVNK/Q1esHeA6GBU8AjNGLnmbAaVWnGDVdd8fslmK83IhEnMRzvdokZ6wu6nM0cCGkn2Kzr+boznjW3h5KaFH49yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688222; c=relaxed/simple;
	bh=4sigOS/urFG8brAKKfv6zzu5o31axp6lF2JzLxHf/DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXcW9v4WevKpbokeg/URDf8Dpw65YlegnwvzgHleeDPbniy2UMW5Bpu//edNk+ef5ZjAnMaeo40ipH1vEZIT88dxmKnen65iZx0fnqs2hffPrICpzCBivEq1bdCuPSeQK/oXv9fhU0fNnJarfesPhI/InnpGBYRB77Rn4SIvcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lS9fI/+v; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lS9fI/+v"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7382ffcb373so2541483a34.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750688220; x=1751293020; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sw2KbHBZVpbmJppFl8KBxErcXGguWr7O6NCzbr+d6nk=;
        b=lS9fI/+vN2jqfFqwYpkdMlMmcJMBjVTKZfuQWRjJTYTkEO+pf5sL7DfsXdQCtrart/
         76yFEz/GJIZiwKyaiY7loC+MbXn0tU3K7Anoah6NICy4SmZMz92PgBJr1hwhClYe2BUs
         QCJkh/M3ikgk7abE6Q6xyMQzvO83DPSLAf6HN7Fdaj91KDgT6EiHXzMM5GJVmtlMtwi6
         MnBmruExs2ZhkfR4vbHOiHZHomhSHCUQiIzqfP3qpYUDOYa5PzWEQ085i0o1rpGzymYm
         TCW3eXWlwkPMt3FsDBdOhkSIVGdhZfgJmb2UTP7Ep5Y9aOt/DoRf1B5WNBw61vjV8Es5
         B6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688220; x=1751293020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw2KbHBZVpbmJppFl8KBxErcXGguWr7O6NCzbr+d6nk=;
        b=NfB1r3GEaVOF1D+avrNn70GsnqwixYZJ9wez04TjnfSZ+gZgZmAwxkfnnaeZgyVytS
         cTEhm4+1E6nW4xyUKlpux7+uezHLmcJVEziNYE8fho+ozSAzKbljIyzc+qbHy1Dv3gZ/
         lzaiQD6kG9h2vDkRiXO5Xy5HyVVFeJRI8gRB2JA+/xbwSutI6ruoPZt9oOIKIv1fE+PK
         gCZ51JPE3wQxqZ4ECqxLK9hVjHnQkZe5eHy6Mr1YFOhFWoWQgYFdxeb14izQHvzxGnhm
         YtfrDhye1bB9oxMbGWy4HKwdO3ZKRA0Moq66Bh1qf1JGJ+gVBHvgxFpUM1Vf47jXoR2A
         ZpiA==
X-Forwarded-Encrypted: i=1; AJvYcCVMoDFFsVahM2YKnpKaMiOWwmjx/zjAkxpSrv6wIGzUkP0/JjWtG06FajelrPxTyifvuXWCRSFgXGiwVMMJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxmSyG4ryk+KmBKIxOWDTTQMBHxf/Jvj+OFIzEOD9cN9kQFog1V
	JF9Ub+iXKy8ol/AHlzIrF5onFxqr8NpApPWbuJpyMvh2TmGQuvV6dtqfiqXWedN8d8w=
X-Gm-Gg: ASbGncvhGPBx/3T6M9ApmyZiKn3sQ9HkdzgrE4m0tsFlLyYBw1Sanw/hnk1buRKnl/C
	tgvjkgk0/XXnbE1uVclQ5I+uFcjUyGPGRxTwN2GrKVfmh4tbDQS/K0a0OiCprvltaKfTMCpoBGt
	XC3NnW+adlJy1eFXuiBLW5WCMwRVIxbXFplOXpLyduhLM+K7maGacXTyyB4m0Pk3BFH+nADyGrl
	J1PvGiavv0xlYIc8PiLoDPZTptCZ96Pao571Ue1CaJuCIr4/4VrJTGLw3T3Xk3Eb85O0eINi/L5
	MibtxymFceSC3KW4IEebiQH1z5gDHRUs//vo1phQvwgBULjR0NWORzwEAahZ7LqqMWkAVQ==
X-Google-Smtp-Source: AGHT+IH/W6bUwoQ/oCDqxzbkBFhhtZ/Fi6LgoZ05YDqiaOhVb1dp7z4SKY54nEy+7+CedB7z2NIslw==
X-Received: by 2002:a05:6830:668b:b0:73a:96e5:19b9 with SMTP id 46e09a7af769-73a96e5a6ccmr8122051a34.2.1750688219746;
        Mon, 23 Jun 2025 07:16:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90cbb5ccsm1418904a34.58.2025.06.23.07.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:16:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:16:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, andy@kernel.org,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
Message-ID: <a2a67998-f67e-4677-a348-780bf640bfc3@suswa.mountain>
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>

On Sat, Jun 21, 2025 at 09:24:40PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 21, 2025 at 9:30 AM Abdelrahman Fekry
> >
> > -       ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> > -       if (ret <= 0)
> > -               return 0;
> > -
> > -       index1 += ret;
> > +       offset += sysfs_emit(buf, "type pgnr\n");
> 
> This changes the behaviour in case the sysfs_emit() fails. Not that
> this is a big issue, but it should be pointed out somewhere.
> 
> ...

Neither scnprintf() nor sysfs_emit() can return negatives.

regards,
dan carpenter

