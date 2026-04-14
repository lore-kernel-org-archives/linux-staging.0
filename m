Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530DB19ABC6
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171760; cv=none; b=JdCSga9Cw/H8vkTfAqFrBSoNBbIfesCwMislv40n3iBwG2g4mxoNsuy9NivOGmESWVnDvj9R42a2gAf/oi6NxNF9gg5fx9KSCo73YVVwufIYUkjrfdfr27MnC/qKM4tkyCHW2fRSr7NbIEpNY+Uzz0QbTlTr/XBFSMWARcBAXu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171760; c=relaxed/simple;
	bh=T+bDo2QrsDmzyawj0e7e+J4d7pMFaswH7o6m8bbf4hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2f4hGdXLF9l7O144WD5v682745+FjVGflNiohA3pfrsHoWmBEDg9XiTD1sniiVQlXs0Rw+AcKyj7R+ElThEDH6xg8qDOBaH5gSxYYy0ZCtZXJjTghZPCvr8hEP7u97UVWQE4e2nnImnRQhwCrLMK22WYaTDzWPHelc+ObwPOsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+amjNf2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+amjNf2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488afb0427eso68408675e9.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776171758; x=1776776558; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/ThIx4+xtrxrBR4kGGwtQo3YXjegxw0z+ZYGF/h5Ro=;
        b=D+amjNf2SlCKeDLyehGyWA7Q9/mTrF08gi+UoaKbkBH+ds+W+VIfjzaRt8WtQm343V
         1Q7LJa4PYCknwCfuHCxT7aLdrNFEHW+lC0xL68IPdjnytxRGRr0Uy1msdruOGypBwuFP
         7gAOwk9kA4xWR1qVZewkuuoupJVFzRHOXCQX3DmiXj34beGE6Cj5apzoY1AdhBpaTikc
         TAVe4dOn+uvSXHGr0swSJ6y3n7mn7BGp5BTa4HlXeddpa3S8tEkmCpxslg1qDGHYPBBi
         tMt7ZXYbQ/et8lAdxcEYMv3r0fHqxKL92eT2qu1QYJIOGg1sFFlj144GyprfZwVRe74G
         oz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171758; x=1776776558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/ThIx4+xtrxrBR4kGGwtQo3YXjegxw0z+ZYGF/h5Ro=;
        b=XKA5/BPv3i56s356mQQ35AjlXIHDG8AStsJ9/mDo8z/G/sHwiOwty3Vvem0OLVCqmu
         ge6ZGZgDzqYRAn7qxDtiMzeqKeBlWRHxNeG9lJd3+YuBSlJYoIUhAPOtAKs+gHSWbCC2
         eLsz6a3Nhbpmx4i3Whw/2AxMZEcYpVyNf5zz36UqdWqYYnJtHmHB/0a19pN8PKnfPYMr
         q9BkvX7/dRadQMpKe/U/CwK1GTis5jA0cWPambQZhbBC2Br1iP9AkUe7zzFQ8UZHpwDb
         6xlniH56LlzelDDIzOa9/gccxQPYqdp3pAVUXEX69gpBxErjIgL3TagJ+0T9gAgxxg+t
         YxFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pdKbAXMdYAAfsyJfOB/ubrnb6eqg1/w/8uWWMD2qye/iTo6gnYRv/wm3mspc8P58BBg/Sm3hDKMIGLzun@lists.linux.dev
X-Gm-Message-State: AOJu0YyMwiaIsYyqE4UcZrzBkgfUiFXeFRwqk8qh3Rjl9iAEkoGWbvAN
	epKEHwpe7/HMISFc++IyJVWvBgn7lnB5JMWW8019bmX+v3WHqM5CT7s7
X-Gm-Gg: AeBDiesh+1H770axdnf2Yr3JR9sKOa9CuepUHUamSqzuB5wYhVq2YHJqfnItFDnpLn1
	olN+9LQcKjMiW6304yxcxClXiAbQzZslFHd4G10ac2ORpByOrKnwA+/9WUOFSLwMbvdLoxIZxu7
	XmA/Aab7TWNa3VcroFfmXH5R9hwAKrd7F9Vy/plbpUiALR9xlh/2P+kBo4Pd25k3lcy8NuN5h77
	smIfQ2QYwI+0PRDUN29rsWF7iXcweQzAtb9VJVubK0VbZqbfOzwhLHPJbQaxz3MZzOFsuvHt1Rk
	pmvzqZdpAmedSpXEb7fXK7t6dQaq3+uOSOv7Q9eFbj8zkWI/sU88i/WaHGn69JpNrTvu2LagSKM
	2ilMpFTD5uRp2LwzqvTzJVpwSfzHJlXEJn77PvfwPtSFTgABs0cR+S9u9Tuu97FK7tDrnYH+d9B
	H7pPgZHbbQF7rJTT8dPw0jvSFbAneNBQ/oT/52
X-Received: by 2002:a05:600c:a311:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488d68607fbmr176523385e9.20.1776171757537;
        Tue, 14 Apr 2026 06:02:37 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d97c65sm122528565e9.6.2026.04.14.06.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:02:35 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:02:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: frequency: ad9832: simplify bitwise math
Message-ID: <ad465p5LVaSMlTUa@stanley.mountain>
References: <CALoEA-wfx3=eVq=omiNmDeSaZpNP85KZd32A=GBiU-DVZ6btAQ@mail.gmail.com>
 <ad40MI2oyvDeu4Gh@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad40MI2oyvDeu4Gh@ashevche-desk.local>

On Tue, Apr 14, 2026 at 03:33:52PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 14, 2026 at 12:45:31PM +0200, Joshua Crofts wrote:
> > On Tue, 14 Apr 2026 at 11:57, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > It's up to you. (u64) casting here is not bad per se. And it's more robust
> > > against changes in the second operand the type of which is hidden currently.
> > > (Reading again what I just wrote, it seems I objecting my own suggestion!)
> 
> > If I'm not mistaken, the compiler would always do a type promotion of the
> > "smaller" operand (in this case fout). By casting at this point we're just doing
> > the work for it, so I guess it doesn't matter.
> 
> Yes, and the problem here that BIT_ULL() is (semi)hidden on what it returns for
> smaller values.

There is no way we'd implement a BIT_ULL() that doesn't give you a ULL.

regards,
dan carpenter
