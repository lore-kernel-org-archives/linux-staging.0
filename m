Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97241ABEDC
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733313720; cv=none; b=WaJDwL8/VKCi0ubqXaz6ItFXUtB5Y6z/rzuppPcj9fiHqxx7I3MOdgGe3IvchKzNqhjYJssQEgJy/OoHe6OddUr2fcRPkW7iV5wQynhqi9dgkDe2s+8OzWiHy4tX8HFZ4o32M5Bn6qYhxm3cuLoJy2pe4AIQLBFo4wMYAuBJiB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733313720; c=relaxed/simple;
	bh=yu9K6L0reByIxM4EZiwlstKaAxLSrHPxGYe85KbLfgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcBfcy0q+IDxMgxtBrRvkzL4yvlpjLK5fyRnQyVjFjFi+QLRHlwZdp3BYghPb0mOgbwYALrCVkJt5y/U5ZtaagVdAz3jvIYHrc6LoBNsZKZf7qBDvoeI+pwgJVkfdza4507pd1s4ozSgYo1lST7qoDNXl/I0g8jwdRyizydeiLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8/xtRIf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8/xtRIf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a742481aso55361495e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733313715; x=1733918515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g351fpLdK2lkyYhcqP1PpLN3dK/iLJKWziU/9Oqsr9E=;
        b=i8/xtRIfcOG3Fd0kMVxEZY/1X6syTJ+G2mnGYcgdKFRWZQnzZEhMwH+GoAI/lkBG29
         yBt1v9RKC91qfQXiD5bMRyTkE6dnX0TsJbgaKtPDmBbLJ9uqz8I/ieCzdnjdHPdISN01
         zE95LbzgNjT9WLBXtSmC9shHRtcdTqPxxuA7Vp5Zr40gTQQ9HvDUvoJJo6VFT3piFkYy
         nUyrZ8IERzJWcXmBljQTmgVx/aOhG4bxaDMKdRv4gkAFuK+yb0xIqGFJLxvNGxrki9lm
         bCJbi9+ZUNncuZ9aGahXOeUiYgCmHGFrnk43/JEwyNFDNPwJj6bKQ0o1Oxkw6iHGJdN7
         KBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733313715; x=1733918515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g351fpLdK2lkyYhcqP1PpLN3dK/iLJKWziU/9Oqsr9E=;
        b=CNtsRWKbb9+5h7Fw4njcSVFXTvOQPlervY/XN57irNgbJWgLdi1hggauWEvfjOlggb
         G/dx5BCdAcWC2CG4k+NQ4GehGMOP+NyskkolEXjdFDCcdP1/t7kPJVkvaM8eyMbiCUGf
         p91d8bRjqfsBRWRsdG3Y7YRAZlp/SE/uHI5gsmTF8ZdQvjzkfSP/QjFmUefj4rwkvrYC
         ntk14aPgz2xsUPHe1p0dOAAU6NKyP0RDqKPwnefmP34/veeyL4gLeMJO37JM0HiYgIFS
         jhDsp6ABl9WIRNWpl3Fxj8cPSHvir8y9cPxfEwpPaqnrmIPd+5fn1Bd8m2SNWu82MLkH
         wgAg==
X-Forwarded-Encrypted: i=1; AJvYcCW6huac7bpHRKrbDz5C6zHSR1UiFBj+7de+1gHi+nuAKeseUvLKGDaHSfUAC6jGPxAib5snHcY/Jrvh1QO3@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/gOlCcecCkvIZIqCwMoODN6EZ6SAogM9KQuRNsm/eje33Hqr+
	g4tqbhtkCf3ouXoomIxCKg16GptwFDDDb9sn852GGcdRahN/XUsu1d+XQqUG
X-Gm-Gg: ASbGncvLXQsj4MniiUWGatoVpuZmShBzTjQUJX/obHX6PEcl5Nz2KTGxiLn7Gy1aURa
	kYyfQIYnHjW62xLU6Ae3pKB/ZXsR5Ig9bOkc6QlgNPHlW3e1O3oUapE6tXVM6lZCyCIi2twa63T
	cc65MNAktWC8MqgwINo96jw/MQ2Yu71uJi5qzas/rp0GRAtGS5u418gKVSbpB0jj18BDa+gI2kS
	Wcdvfra2rHbwJYWYWZ9T311oh0dVDhBtBM7qUak9X0c/JCgoceleAj2/SK29wFVpg==
X-Google-Smtp-Source: AGHT+IF9NqIgghnkEvv/kl/PYOge+dz/Z66I+zobuoCi4wMGv79T9pki3Apb0qMW6ImoKaW4ahhW8A==
X-Received: by 2002:a05:600c:3c9b:b0:431:5ab3:d28d with SMTP id 5b1f17b1804b1-434d09b630amr56228135e9.9.1733313714460;
        Wed, 04 Dec 2024 04:01:54 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b131sm22909155e9.7.2024.12.04.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 04:01:53 -0800 (PST)
Date: Wed, 4 Dec 2024 13:01:51 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Fix i386 build issue
Message-ID: <Z1BEr4QEF3vPDo57@egonzo>
References: <20241202173301.6462-1-dpenkler@gmail.com>
 <88c8ede5-47c0-49ec-805d-161293eec679@roeck-us.net>
 <Z07EtdJpe6mnKYOH@egonzo>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z07EtdJpe6mnKYOH@egonzo>

On Tue, Dec 03, 2024 at 09:43:33AM +0100, Dave Penkler wrote:
> On Mon, Dec 02, 2024 at 09:48:49AM -0800, Guenter Roeck wrote:
> > On 12/2/24 09:33, Dave Penkler wrote:
> > > Both drivers cast resource_type_t to void * causing the build to fail.
> > > 
> > > With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned int
> > > which cannot be cast to a 32 bit pointer.
> > > 
> > > Use ioremap() instead of pci_resource_start()
> > > 
> > > Reported_by: Guenter Roeck <linux@roeck-us.net>
> > > Link: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
> > > Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> > > Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
> > > 
> > > Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> > > ---
> > > v1 -> v2 changed pci_resource_start to pci_resource_len for second parameter of ioremap
> > > 
> > Sorry, there are some more.
> > 
> > drivers/staging/gpib/tnt4882/tnt4882_gpib.c: In function ???ni_isa_attach_common???:
> > drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1430:26: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> > 
> > drivers/staging/gpib/cb7210/cb7210.c: In function 'cb_pci_attach':
> > drivers/staging/gpib/cb7210/cb7210.c:974:36: error: cast to pointer from integer of different size
> > 
> > Not sure if that really fixes the problem though, since there is other code
> > which maps the void * back to phys_addr_t (or, rather, to unsigned long).
> > It might be better to work around the problem for now by disabling support
> > for platforms where sizeof(phys_addr_t) > sizeof(void *).
> 
> I think it is dealt with in v3.
> - Dave
OK this does not work so I will submit a v4 which makes these
drivers depend on !X86_PAE
-Dave
