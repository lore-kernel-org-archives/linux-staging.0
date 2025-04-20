Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3332018D
	for <linux-staging@lists.linux.dev>; Sun, 20 Apr 2025 00:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745110046; cv=none; b=G+u5Am+3/Hw/0IjWACjNsSIJ85g+qORG4c6lLV6UW6KVChe/6K9eKvXd3uTx27mhT5OKy0MyKiz/+TItI9bH+fmEqDg9VFN6aGJqZ+CMoWD9ff556b+z0ByaDIlNRUXbXxIT3R4tNcMGHHcHaGmpN/Ajo6dTp+5BZHmpsSBQYIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745110046; c=relaxed/simple;
	bh=oPEQvbu8JP50TDbHOHgqHxhAKnR79/d/8OgWww/ne2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RypVQQGgZIykF3n1Ud5wspc5cx1k9mikfJfiAQb4E3vhHgjB0b+J2OTxN00W6xOtTrhA5EJqgJrJdLy25PQY/xhOMCVXhEPRIm1dA3K2nicndMBQKlz7oZFBiT/zfsWic3idJcpQGf/4vTIbTFFnqncuLuDke8eNjakhJs0MTY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7nexWji; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7nexWji"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2255003f4c6so34291895ad.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 17:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745110044; x=1745714844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3UbJ6sVj0Q1eE44m7wvB7g9mVugpdeJOq3atIyJK1o=;
        b=X7nexWjiJW8REdE7GsXReBSB1FAYWcI/dNdf7N0aXnxVtHD0H/8LdxzncYepH+NTkh
         74SugvB+nOhz3Qa/0pdpQdA1ojTxILftNxO8KgK3QToICBSEW4PVHeIp4ZSurDRChPUA
         dCHKAg5rysdmYeRBHXIy+YveCliqFr7cH63vvE2fXYIWpTE0JRMekvRFlydtfsI+qBUH
         Eo4+PmE6NLz5iRUxsDFLveWRfFuFLLGLN3QK/dafwkIBUVXlu4zzmYrhOZIzinEtodPA
         vz8rMpA3aPrFi9Oh1+m/to6g3fsi6VvIOjzl964DeKFk8+tbCVggo3LxP6fJ2csfq9jn
         D3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745110044; x=1745714844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3UbJ6sVj0Q1eE44m7wvB7g9mVugpdeJOq3atIyJK1o=;
        b=Qm+AMhF2nl66YAEInNTxAH63UH6QUKc8x4cmcx/jrEaER3kku4aJk9ZJf/RusharDI
         YQPVrX+WBnOed900OZwcXVqYF3e975xb5x+AxAizG4w00sJImCdPh+Vlj+tp3CSRcmhF
         wzBTK7FEvEuWTFK0dRuFOV3d1a2Qv9JkT3ROVbN3QnE8sXxhqNVfJ98jLFBtawYdA0sV
         7lGAg+A6Nxmzu8fWGew2pyQq41JAFqh1Lapo7/00J3rUcx8hV/Y3qd6InIC2OwYeudID
         FxhqRLrNHSViQlkqzKwY+oQbAz5zi2yrc4o2w9SsVXgKV52up8G/lYoRJQxO7lo/LAAX
         majA==
X-Forwarded-Encrypted: i=1; AJvYcCWZVECNXNsDQlMDu32o0IXxYoXBiT7TH1FE+ZhLY4W/y6OG5u/DBn+h8hb3ZgmpOoh2ePbZJp5uGYo8fvNX@lists.linux.dev
X-Gm-Message-State: AOJu0YxrFzR8VDRBcP8+fGsrzYO+yiDWxzhfzb/7Hy+oL8zAFwtdWC08
	JAusyC1qiyEG0j9SgZGvmWatOlJyvgn4WObLJUeAB56Rx0HDEbiZ
X-Gm-Gg: ASbGnctWy+V07ePJ/IdinMIlOjEvtTZxNQeuOfH30F8NEI0lsDfzo0D7zkHYBkdneO5
	tBOQkqn7BuaxRrzqpzZRuhZkVAaMO6YLnIldum+x4+keyjO55HrbbCTRZ83vRNllm+vMErYFrtH
	6zjqBMKdidt4ps10PW+VTqLEQhC/2HlbGAQXYuOmjxtej0eFrGur38DP2ncwRHRQ/ZN8kCW3+pK
	53nx2MCYkAIJ0/WJ9bejAILCiS8hkhS3DdkhSTLGcbAAqiWxMG2uIAZzFCV3U+BBrkozHaHJQRa
	+QhqU0Hanm/SaaC4r947jQ8Q2i8iUXhMiQjSnmnHCsu/mNw=
X-Google-Smtp-Source: AGHT+IHX4JfCAGLHU+bXJ/YVu1CcsjhWotihBQ6Qsp9Bb6qEvbmSQUbeTDYj5k85HbBPZGMXyXD7TA==
X-Received: by 2002:a17:902:d549:b0:215:4a4e:9262 with SMTP id d9443c01a7336-22c5356deb7mr97366575ad.8.1745110044318;
        Sat, 19 Apr 2025 17:47:24 -0700 (PDT)
Received: from localhost ([2804:30c:90e:1e00:5265:5254:2e32:7e5])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c50bf543esm39858255ad.95.2025.04.19.17.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 17:47:23 -0700 (PDT)
Date: Sat, 19 Apr 2025 21:48:34 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: ad5933: Correct settling cycles encoding per
 datasheet
Message-ID: <aAREYg1uAc8NSVKY@debian-BULLSEYE-live-builder-AMD64>
References: <20250416142219.554938-1-gshahrouzi@gmail.com>
 <aAPEUUAHsG2CvFbr@debian-BULLSEYE-live-builder-AMD64>
 <CAKUZ0zJoV6pLEFh6mEjz5awousn4o8Mq2D9AL8CfvqqW620X4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKUZ0zJoV6pLEFh6mEjz5awousn4o8Mq2D9AL8CfvqqW620X4A@mail.gmail.com>

...
> > > @@ -411,14 +417,15 @@ static ssize_t ad5933_store(struct device *dev,
> > >               ret = ad5933_cmd(st, 0);
> > >               break;
> > >       case AD5933_OUT_SETTLING_CYCLES:
> > > -             val = clamp(val, (u16)0, (u16)0x7FF);
> > > +             val = clamp(val, (u16)0, (u16)AD5933_MAX_SETTLING_CYCLES);
> > >               st->settling_cycles = val;
> > >
> > > -             /* 2x, 4x handling, see datasheet */
> > > +             /* Encode value for register: D10..D0 */
> > > +             /* Datasheet Table 13: If cycles > 1022 -> val/4, set bits D10=1, D9=1 */
> > >               if (val > 1022)
> > > -                     val = (val >> 2) | (3 << 9);
> > > -             else if (val > 511)
> > > -                     val = (val >> 1) | BIT(9);
> > > +                     val = (val >> 2) | AD5933_SETTLE_MUL_4X;
> > then this would become something like
> >
> >                 reg_data &= ~AD5933_SETTLE_MUL_MSK;
> >                 reg_data |= FIELD_PREP(AD5933_SETTLE_MUL_MSK, AD5933_SETTLE_MUL_4X);
> >                 reg_data &= ~AD5933_SETTLING_TIME_CYCLES_MSK;
> >                 reg_data |= FIELD_PREP(AD5933_SETTLING_TIME_CYCLES_MSK, val >> 2);
> I currently have:
>                         val >>= 2;
>                         val |= FIELD_PREP(AD5933_SETTLING_MULTIPLIER_MASK,
>                                         AD5933_SETTLING_MULTIPLIER_VAL_X4);
> which assumes val only has bits within a certain range which I believe
> is the case here but not completely sure. Would it be better to clear
> the bits regardless and then apply said operations?
Nah, since val is being clamped to max settling time value, I think this is good.

> > ...
> >
> > Though, I guess it would then be preferable to use masks and bitfield macros for
> > all other places where we handle register data in ad5933 driver. Probably
> > something for a different patch (if worth it).
> I separated the original fix from the refactoring so the patches stay
> modular. I can apply the use of masks and bitfield macros for other
> register data. Should the refactoring be all in one patch or spread
> across multiple?

I believe all mask/bitfield refactoring can be done in one patch.
