Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B72746A
	for <linux-staging@lists.linux.dev>; Sat, 12 Apr 2025 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467560; cv=none; b=uosjPgKyG6o7Pu5wWtbPEOAUQIxsu1ImrCD32fZ8Dkk9IiaFBhAGeCIJiW2amnyRDLnWAnHdedQelkf+HKZvJ1k8deb1liUlpWoX0A8xGBOLr53eHzh4LI05FwawM0qMcB4qnRW7UC/t4Mmu/hIrpz+m9hpxihhFuxbpj8/AhMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467560; c=relaxed/simple;
	bh=yz6epcKAphDwC4sqY+d8Vu+1Rl6M0axJyNhIkKMyQ70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCbYfpIcYpxi51p1cttihcs24NG2T7tToaJ+iv6Tz9F1oYnYHKxC3RwSW59fttICsMOGmdLMsDRUAt0hMjmcLi42noLaJ+Zf8DAjyUdIIQfWsiZDBO0ch7S4VxrbvNEWKLhLZ/WE/Ti3VBuAkqcjZLEnCNhGrAugI5VXvHMaVPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7uzO02e; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7uzO02e"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0782d787so20163075e9.0
        for <linux-staging@lists.linux.dev>; Sat, 12 Apr 2025 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744467557; x=1745072357; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JHBL7CYWwnBjd3jrunm4nVzAhAz8iBRNbPGJWtoj108=;
        b=J7uzO02eG7sTeefOe3Qay7tLmT6Wl17hsG49+69MttILCd3Uabd15ot3d0pUnw/BvR
         RYCTI8Nak1vfh5goZeiJNpyY5jDn6aO0VyMa2nTozh2PBK8gX8fjbBGRxoyQPqfECF1h
         hwj8HRpP711t+MN7T6YgYN2vC415sCXq0yDuGcsOaVKZ6Z5YOHPMitAqUZ/MHpPWiBtY
         FZfhQOh1Y/lpDAWCUZ5Xi3xhdd87lCQJAhbDvqkQpCvkzzl5Iu/0JXDHv+lJX1ES+KEI
         9TTk9CPLPG64cdvAkO95qKe4y4cWBWq22pigVEnY5P83ToBJRQ6QQLKEyYSAisWL/xi6
         LkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744467557; x=1745072357;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHBL7CYWwnBjd3jrunm4nVzAhAz8iBRNbPGJWtoj108=;
        b=cQJSXXJTMPeAaybz+aKYTdBp91JgaVq7oqS+nX59VWf8zJoaeohiVD7RghI6q1o792
         d0NbkABjk4gtz7SDnHkxfjsILX5AQidh9yOldMq/2mQnDOCb4RSobd0cDx91uc/5p/4s
         +KXB/rmjfc7sHCOaDuxABvWGga31FZr3/DCWWxN010OF4PeUDg8iCNfB84FAmhpseY24
         Nb46tVTqHKpZzik8QsfpcO4ZsX8676yY3Zkqgb1P6tH+VIx4N/xaDxa6X6vdJBzRKFZm
         qE0OpPOeAnm8PtfycGgUWcxZv2ZYM+xbc13tCxyBiwxEWrJxPC3sManUklQ0bPJbJWGs
         BTkg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1ziBdkLq/KU5LhLlnSUTs9/1U3Czw9icG024g3iAdP8lx0jho/YbYTLK3pv66RlldhxxGc6vuTZAS0Yr@lists.linux.dev
X-Gm-Message-State: AOJu0YxQgdTcNccfqiXrubkqLZxV2f4qtLSLeeoLByJPoflM6UZHZ+rX
	MFB6gDq1pOMImi7BGp//nBH34LeDT55cMi646UNWfNp9sEgqasvvpxaqyaP9RzI=
X-Gm-Gg: ASbGncuNoMankPCCnpFCyhZ9Uz3nF0Uc+eBWBJSaVpW85bLo7s8eZDWnJjJAVWaruQ0
	6gdPbR6bFL9fKytp5CVMoe8V8vFJ6XJO6NrGsrKRqM/2hZL7NqnxaGjYVk5cJfz2ticZhtMKv74
	Vxj7nLLXKzUW4Pylm6FaKz/sH8pw7knqAg63WN2tldJ2gNKdTP28rqdcn3LS9PH5lSG2BRo/XRA
	FBl1f7JP05o7iddnSvuEErbZ3yEXZoiPHrsF+5FgQWdTM3l1JcyA7QJLahVyxfUqWKS/PRVL6+4
	75CSJLP0llDjqiCP5qk/DRNxkcxzlb9iwVPjhruPuckkLA==
X-Google-Smtp-Source: AGHT+IEaXX2OSI4xMiPL2LlRp9XzH1rVJcRvtRXaUMBzdzy+GqUqBfNUNEsYMNnIK3gvqLJKjB6vpg==
X-Received: by 2002:a5d:5f96:0:b0:391:ba6:c069 with SMTP id ffacd0b85a97d-39eaaebeb38mr5812638f8f.44.1744467556566;
        Sat, 12 Apr 2025 07:19:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae97b249sm5222195f8f.58.2025.04.12.07.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:19:16 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:19:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	andy@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
Message-ID: <209e5330-a4d4-4ecc-8d56-199f4a190c3c@stanley.mountain>
References: <Z/bA4tMF5uKLe55p@ubuntu>
 <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
 <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain>
 <CAHp75VehJd4FUXBJSJh35a6KF3Qr2eBG6PiNogZ1m9SzBph0Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VehJd4FUXBJSJh35a6KF3Qr2eBG6PiNogZ1m9SzBph0Ow@mail.gmail.com>

On Fri, Apr 11, 2025 at 03:47:40PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 11, 2025 at 1:37 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > On Thu, Apr 10, 2025 at 08:43:53PM +0300, Andy Shevchenko wrote:
> > >
> > > > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > > > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> > >
> > > cmp is good but not good enough in general. Here it shows the 1:1
> > > binary, but in some cases code can be the same, while binaries are
> > > different. To make sure the code is the same use the bloat-o-meter
> > > tool instead.
> >
> > I don't understand what you're saying at all.  cmp shows that the compiler
> > was automaticall tanslating the "& 0xfff" into "% 04096u" so the resulting
> > object files are exactly the same.
> 
> There is a possibility that the compiler changes the code to the
> equivalent and cmp will break, bloat-o-meter will check at least what
> happened to the size of the *code*. object file is not only a code. It
> may also contain debug symbols and other stuff which may break cmp,
> while the code can be *the same*.

So far as I can see bloat-o-meter is only looking at the size.  I
deliberately introduced a bug to see if bloat-o-meter said anything but
it said the size was the same.

regards,
dan carpenter

