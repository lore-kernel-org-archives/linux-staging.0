Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278692C0270
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 05:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767505134; cv=none; b=iUsk7iKh7yAlfsqVCSX28hxBi7xL+EecciaRHH7ksE1Yj63EXv70RR8rJsSck8zh9iNpEgWcf0N+4fcKAE3ihIkPKPezXXMYH2FmD7jb0RLvfXbA2QI9DqX4ft+0ptFA7jvq/u0L9aaqgFlm7oFmy6qFU8PBNpPwRWfWFX973CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767505134; c=relaxed/simple;
	bh=1cy/7omDUaB5WW8ifDmvv3jc+tFSD3izpn1YCB7cvj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0lwdztDRJ0LsLuKGl40b596Yq8pexKC4afwvJJGUc7EEb9VPuSjd638fD1qJWcf26v2j3/lyxjV4legIrNoIkMSfT2xKisVq7CNnpvI+si8mXsA3jgB9wElnlc1f3RotwqiD9f87VvuqSH6RqQGcE3xA/STLuXa8kVzy94Zpfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsdybrbM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsdybrbM"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34b75fba315so14194798a91.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Jan 2026 21:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767505132; x=1768109932; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFnxtKrucpWCo/zUoxUrPbX5HS36ZTXbhXduqwcqQ/M=;
        b=LsdybrbMd6IGnRtmzpRUjqHtmGKwRDanNLqj0llL/WDrvGopLX24jYECnk2cyOLSRi
         JaiilDh3Z4EOpsuZ8T//4YaBoYevvYPdEZiM2bwEE+pdXtA8zbxQMbHdKkfxZROGy/lc
         zeyfPAcxiWU7dROR3IOjL0Bh+2unzZMjQKYHD+HxBzlLHO6Eog8MT2sfUeQd5OrYqtCU
         HR1SRC5mSo34+JF/p90Eq1fEIkreALg/pZ05qW9HaAmAOghkUTqAO1EPPRgOTaANpw1b
         PiCkzoyHOdo2zFaIkdzLLqOj0H/mSK48vsFot7VicDg5QAqUeQbH4bXT6QkoXUx3ArEW
         hlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767505132; x=1768109932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFnxtKrucpWCo/zUoxUrPbX5HS36ZTXbhXduqwcqQ/M=;
        b=ANrQPWO3E436+9Z0NTFVROdNbiThk+EcsYJOx5VFCSSApxWoXYBw/bNzwhBrTuHv8j
         iTkXZD1E0kf6nvokXr4SOZIjLL02Csj2SibPWH3O8usrpdJ/fIiGpGc6dwemO7f+Y/Xs
         d43lmjA0b153arCwOYnzRZ8WXgmVMmKTHpMPI7XJ/Rhgz5EdCzABks+6Nqne6l7gocnH
         20hK0anRFyiCAn71AI0W0YFBmdWq/92yzF+F6myMFbbjgMLWgQP9+HeZ+KQxbT28AHeg
         OYWH9V1uo0YWUcYk6hzm4dYNvOzcTt54OajKZuXAGj9L5iTROGum4vR72NwQR/SO9Zj4
         +M6w==
X-Forwarded-Encrypted: i=1; AJvYcCX4DabYv94Wqdy9STmYC8rSyj7s6a+Di3B8Cpkqn1p6tynexERoX89MnR9unKsZ7E7SMIl9OX+EYE8U7ZH8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3rN1A2u1R1MasSfRIQBjSD9tqQ0G8Dg2HIqStzD+hK6Azdo1d
	U462Yml2z2LhJ/lqRMUkQBYyuH14FmqKEfCa3UNVlSqolpv25sqnqhUR
X-Gm-Gg: AY/fxX6yXPFunZWn0jicP/BQPt6z/oMIZKG3/+G5pl5Pmq63cFnqefh5Hg588QqtF3e
	oaq4hwDesudNGRSpun/ywG5cl7UxETea2rDBykVx9q045lNk79OaJddEpv/3vCj++3W4XhrmfO6
	WYfGZWz7bazp1XLDljP2vnzEh8NaxKoiPufVv7iL8YU7PiJBQfC75SBKEvrQqUhE/W/aSE+y7oE
	2/VLnmz52BNuHBecjMKmK17dc2EcrAJStTKea5fwlwH6n9QF9hn8VDQMqDuQ+JJzQpUOdEcTF3C
	PArpyj9Ydw6ykVmteJI+GAC9QJTO588E3v4tC3UQEU+C0Pv0yQWh2sKb9b8wvVjMLmDb8oL6qT/
	yF2i3FPJ3oJC7AgY7vDfuvMSW728bhiA2al/ek1VaqSBTgmYRSRPPfRjBoQUp3+RmhDNgvUTAOo
	ZZ78YKbu1PTqaWiN/JUFv/ayg8eyJiykgPu/Sbq5qnTgTxSgRIjuCketbZdHNUza1RUlZnRlFvG
	v4afyxtnv7QiB6RKK/Ys57hcTBPlVOJZJTFD2kja2KQxbLcv+pAkR5kqXg=
X-Google-Smtp-Source: AGHT+IFuU8vk9mK3i7jVlpZJLCONCafucoWR4wnV/MEWErIkN9otjQLB08bVxfsOiCswR8zeLPY+Kg==
X-Received: by 2002:a05:7022:4287:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-121723018d9mr53382128c88.41.1767505132287;
        Sat, 03 Jan 2026 21:38:52 -0800 (PST)
Received: from localhost ([181.191.143.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724ddc30sm170899611c88.6.2026.01.03.21.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 21:38:51 -0800 (PST)
Date: Sun, 4 Jan 2026 02:38:50 -0300
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 4/6] staging: iio: ad9832: remove dds.h dependency
Message-ID: <7s5n34ucflr5jvn7xpotj7qnp5msf45t37ziydh2g4eej4j6ai@irs5mrlpwcyr>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
 <20251230203459.28935-5-tomasborquez13@gmail.com>
 <20251231180939.422e9e62@jic23-huawei>
 <20251231181153.556f14fe@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231181153.556f14fe@jic23-huawei>

On Wed, Dec 31, 2025 at 06:11:53PM +0000, Jonathan Cameron wrote:
> On Wed, 31 Dec 2025 18:09:39 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Tue, 30 Dec 2025 17:34:57 -0300
> > Tomas Borquez <tomasborquez13@gmail.com> wrote:
> > 
> > > Remove dependency on dds.h by converting custom macros to standard IIO
> > > attribute declarations.
> > > 
> > > Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>  
> > Hi Tomas,
> > 
> > Happy new year (almost)
Hey Jonathan,

Happy new year!

...

> > I'm not that keen on having the documentation only several patches later. Drag that
> > before this patch or combine adding the new ABI and documentation in the same patch
> Ah. I'd missed that this is deliberately a no change patch with old abi.
> 
> So ignore the stuff that doesn't make sense with that in mind!

Just to make sure I understood:
- I should just remove out_altvoltage0_frequency_scale
- And add documentation in the same patch with all the ABI changes
  "staging: iio: ad9832: convert to iio channels and ext_info attrs"
  or as a separate patch like it is now?
