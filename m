Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093001D6194
	for <linux-staging@lists.linux.dev>; Sat, 29 Mar 2025 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743255631; cv=none; b=HhgEHp4zgJZqzGGToyhbVrsXqY4zIlUfjQoeOd8J1Myna9lkMGV5YoEmD0FhTNysL4SxN2xcPcqPOWGyYqI39F8Kx4d8P+kTbjJi90QHETsSn4lnHEx9JpLBznn2PTHCU4nKdJi4oh5e5zliio5O1S06Fh9xOLzjgfjaAnWFZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743255631; c=relaxed/simple;
	bh=MoWzeZWOTaAKgwFTjQ36mqg0XzzUVcbJKEAWJVJs+KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyfOrDnuer8MJfi01W+lQmQ3xQ7sZAw2CW/ZXG6gYb5+AoW91Kvb5Pd72LCEt9DykieApAKWI+tKHlGB3JzULc6t3SGl45dxvTBdzX5PW7ceb/9BaxxngnclQRST5JghVolGRmdt89Lr7h4+NWDdczhpp4QHG5dUtD/X2Gb4Q18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZ0dBY9Q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZ0dBY9Q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2260c915749so45459975ad.3
        for <linux-staging@lists.linux.dev>; Sat, 29 Mar 2025 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743255629; x=1743860429; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0dAst4F27VW8K5mYgO/xzjAOXmOxFERt6ayMD9R7JYo=;
        b=PZ0dBY9QfMGvPic3hwQrvvHopmkQ2ZKFhHaI2uvPomV42+YGQlhzIgjPiSvX1k+9+3
         QOBZfWjgLGDJpDiPPtb3w1beXkjNBGwP+JHi85jXU1kVMo6eyQWOIj/6TbCKS+tfjcZs
         r3464rzJG00309RhDXIRD2BFg+d64xPx2WUcjuQeBCC7jiu1GZ6BOTTYdqgeNJ4HoQYz
         QeBLC+8SJ1FrIRMDzUcg+x2ohfMeECC4cJbhRrmADaSw5ThQXzGOxPvAr2Bv9XjqSgVM
         Dtbz8akj5iWvUy8BGI2IyG/umU/KtBQYvlIJf6amZAK3Ko0+FK0ZK9Z6NlWJ83n8C0K0
         Z6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743255629; x=1743860429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dAst4F27VW8K5mYgO/xzjAOXmOxFERt6ayMD9R7JYo=;
        b=SUveepNkqwfnn82VE4gG42AnX8K+0ehYSve3ghiAj6FSZfNR3VjtcKRo0PV5nqKF0x
         Bg3FE+ZKErMEKmXtD876jnsuaWgNAAsucbLSIE8aSQeAQVviPtJCy+600ijeQXQq2f/2
         M2PWsiYSJMG5lmW9aGyV/qDaNMNZic1oPfHWHK3ciARK5R+yrnVpoEljhm/M/NGE+bs5
         alOIHc3hnNPs3SYUHeJdZgqB2sLGL7r02xteMRbeh3vrJCYh90tndDM3394H0TqwBUwk
         OJqBEKWxTGCGyTn0wDklET2IFpY+fVJkPkd1Fj+l0ol13CKDfuZVrdXQGJvV80c0CPJz
         vOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVQz6BzkygCzGPOPg2+tPiu2ugj9Pn1EqDAF4IlvxxL2wQEDglIZT4s131+C/vfhwVxl3F7bNHixHIPQ9M@lists.linux.dev
X-Gm-Message-State: AOJu0YwVG9av2AbOyA9Dxor66+8JW1C4rWvWzDDgV8ao8RhTcQ43BMLO
	4FaCn2qpFxYO6l3zGUNC1LBeWZerc5rh0kHDd6LvdsJgLmxlCs4i
X-Gm-Gg: ASbGncsWTh30Kt9gxU+mLQ+BczfbGZmOEumbbDzkgs3guWP6M4BEyVjzjR6lXxqf1TN
	rZbXrAEzj7+xywPCs0HNBeC9evQ2qGlv6v1CMwiabwlnf2uPIaSSTUF6/MOFO3va+h+ytg0zX4p
	8MZV/hQqohW2TLVWL8gItmyBUcVZpnkr7trozit41ml9v3Mp11HnkkP1iEwEBnnBWXIUKkwyZwH
	ztLsUSW4JEoeviqvLNjVsB0XjOLbmgAyrX9ByNbUVMuHO4j0PgZIlzRNS4nSgsZgcshjHpvxWUP
	UJHU0BfKUMN6ziQ7/8hSTMnZIkOF+h8I2nw8Wk3a/gbWVqyOPx/hOg==
X-Google-Smtp-Source: AGHT+IGJjEMZtKoHgbsGX+ALAGZjFxOcU2Vy33m106UeqkLR7cq0fKX2dLrtPTHUTlpHex4xYcNFtw==
X-Received: by 2002:a17:902:cf0e:b0:220:d257:cdbd with SMTP id d9443c01a7336-2292fa01b74mr53629935ad.48.1743255629078;
        Sat, 29 Mar 2025 06:40:29 -0700 (PDT)
Received: from localhost ([2804:30c:b03:ee00:e0b8:a8b8:44aa:8d0b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3051cd9f674sm2350193a91.2.2025.03.29.06.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 06:40:27 -0700 (PDT)
Date: Sat, 29 Mar 2025 10:41:30 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
Message-ID: <Z-f4irfx5Jtz-rfk@debian-BULLSEYE-live-builder-AMD64>
References: <20250319045212.72650-1-simeddon@gmail.com>
 <Z965Rz8NuXhbHrgy@debian-BULLSEYE-live-builder-AMD64>
 <CAGd6pzNW2JKxTfQ8rLD8V7bdUgq8fc0R+ayChf3J0VdRm9Ptrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGd6pzNW2JKxTfQ8rLD8V7bdUgq8fc0R+ayChf3J0VdRm9Ptrg@mail.gmail.com>

Hi Siddharth,

On 03/25, Siddharth Menon wrote:
> On Sat, 22 Mar 2025 at 18:50, Marcelo Schmitt
> <marcelo.schmitt1@gmail.com> wrote:
> >
> > On 03/19, Siddharth Menon wrote:
> > > Refactor code to use the FIELD_PREP macro for setting bit fields
> > > instead of manual bit manipulation.
> >
... 
> I shall send in another patch addressing this.

My understanding of Jonathan's reply to this patch is that it would actually be
ok to do all MASK/FIELD_PREP/FIELD_GET cleanup in a single patch.

> 
> > > -             st->data = cpu_to_be16((AD9832_CMD_SYNCSELSRC << CMD_SHIFT) |
> > > +             st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
> > >                                       st->ctrl_ss);
> > Not sure about this assignment with mix of FIELD_PREP and non-FIELD_PREP value.
> > Maybe have
> >                                        FIELD_PREP(AD9832_DAT_MSK, st->ctrl_ss)); ?
> 
> From what I understood, I don't think that would work out. AD9832_SELSRC
> = BIT(12) but AD9832_DAT_MSK only covers bits 7 through 0 GENMASK(7, 0).
>  It could exceed the maximum value allowed by the mask.

Ah yes, that's correct. I didn't look very carefully at the assignment
surroundings when replying. Sure, it would use the BIT(12) mask. So, something like
FIELD_PREP(AD9832_SELSRC, st->ctrl_ss)

> 
> Thanks,
> Siddharth Menon

Regards,
Marcelo
