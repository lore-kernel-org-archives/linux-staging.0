Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD87D4A28
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 06:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724654048; cv=none; b=AaacVy8DskDz21+O6FnRksu7UHxNfQg8vR30GZs0TYiEsKPFo6WdjKALAEsEIZMayZGW40Ifuk2xn4XzPn9TGxauZyPjTCowjMpCKaD4NgCJl4nZmvnPQrFTajW5awefoxrKCLFFl7VECxLkR8dSvBYEuVS6XphthQ+KWZkoZUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724654048; c=relaxed/simple;
	bh=79dMh3ozZ2lqnDINOcOVhNaezlAI70Ja2qWWVLvBDAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fo8BhiUGdKMMXQwzhwETZGpyLnqzBzc8J3U/f6pCC92eiuxwql3UpDcTPS08ZbOpn0B2lskXBMWRexHjoLIbIr/tzWPaeXhT586o2VGnBOtVGMFFuS8YsJ/vpdcGuFm2mPehC4SwGsTu2snSQm1UDjqB69wVZ2OPQKoG4zRU3SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YPiN7s0p; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YPiN7s0p"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3f68dd44bso45193821fa.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724654045; x=1725258845; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PVKhJvWevINCBH2qBuQO224gk6DRTc+AR1O2dLVPxfk=;
        b=YPiN7s0pflg6yPRttN6EXJA2jdHHQgIn41uxdMfcKuxiqz/3+ELl5JpY4ssE6WC0M7
         evjj/34tyK2tR+p7ULc0xHeszx3SuyjMeZ/CB1aGbGp7r/IORWCB/YzxFLuVy0r95+Y/
         37lMLwbjNa6UU1WX+Gyu/HI41eelCXW5ygB+mSTrTxvxXbRfmb2kFWYAeqcjXm0AA6ph
         IzR6VPliMTjevw6Ul/VlcmxblfXxDSiimTe89wWVyDMhFGOxqh4Yh/ZmaP6FZLhLyi7o
         RzrB2wP49109EbOIKMv9IUd7nrupJspPi4Zr9PZBuH8x8takajJkElBkoP9zkbe2NwqD
         GvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724654045; x=1725258845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVKhJvWevINCBH2qBuQO224gk6DRTc+AR1O2dLVPxfk=;
        b=hbrIK5PmJY3Re52LrV1q8RHrwx0FZkyj8yDBs/1BeNOnIN00zit9FXEfBkFn0E7vYl
         wFYTO0+iZI4uJP+3SNdwB+QtqItP7DZt63S/+FbbBwd2fAnDTHMypgH1WezanfS8gVMI
         J5yHsNnpQmXNUO25X9p8R0FxvTnl98951zAkyeVNEN8ivRng60OS22+ll5rn3EmnIAqp
         hrBS3LC/TxKHDVLhsvoBkdgEoP519J0//AIzVyQacBVrtsjKdvEziod0ZPQrX7V75+q0
         pmPvl8gGE2l71VSpg9gcKFmXT+A369OcA5LiPc9V5/unVX1lEjElTzO37zZvl93QhvBM
         ZBPg==
X-Forwarded-Encrypted: i=1; AJvYcCV5+L7v0n8TiS8VtuchqeFGgLTOcX1WQu/opWC8NkcfDsJ94utBcQFHrHoL6FW5o4oqRRya2PWLN43Mz/gM@lists.linux.dev
X-Gm-Message-State: AOJu0YwODvsGnWXyvleFE6Enk+PtYP8hxpUeWPy+PH2Q0+1RDOYUs2D6
	fJbRWXuJ+LT3TblqSuoCrV+NFX5FuyKo4hRpVBQUWhRWCNluBm4reZqW1Hsx4+U=
X-Google-Smtp-Source: AGHT+IHoy8mTyOxGm8laDg2utdl6ZPS732jQpJxtvh9UZHiw5iSkQt4l5jJLs4LhlX4N8QgJo+tsrg==
X-Received: by 2002:a05:651c:209:b0:2f3:ee5a:ab8b with SMTP id 38308e7fff4ca-2f4f494246fmr61411181fa.43.1724654044600;
        Sun, 25 Aug 2024 23:34:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0515a94e7sm5211639a12.89.2024.08.25.23.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 23:34:04 -0700 (PDT)
Date: Mon, 26 Aug 2024 09:34:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Change slot number type from int to
 u32
Message-ID: <535bf435-5f50-418f-ab69-84178bc49d90@stanley.mountain>
References: <20240825072955.120884-1-riyandhiman14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825072955.120884-1-riyandhiman14@gmail.com>

This patch introduces bugs.  I wrote a blog entry about how to choose data
types.
https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/

regards,
dan carpenter

