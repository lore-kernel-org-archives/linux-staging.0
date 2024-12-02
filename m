Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0562020899E
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153712; cv=none; b=feDkm5Sk7AUYug71RfHj9PUfF0CFYHi51by7RrK+7pYx18cHr5h++7y23SGRJK/P1sgFYF6GURg6B1dDM5wAfvYiMz9lod0LcTq7KbbUN1y0hsYNI/OD37YkdEiOE9PtnkPg8Op1uV3eXMCE2M8Iy5dlaFgAQH3wID3MzT9KaA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153712; c=relaxed/simple;
	bh=Gh0oZs8+YzMS7aG0V1l/FJUBvC8sDDhkH8XK9OIML+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uY4U7bjHrkLcH9/QKvjMIcFPpRF92UajllU64Yv0Es8juSQLP2g3wnJ3Acj9rjGCX/+Yu2/t4eetNhCXd2oHF/BOEr+TfIU1ApnnC6fGUspMEBqbpSijhTi0hmjUehZwzmIlJadHkyx70H2rxG7K/pl3HKzGEmZLGKdg1CoR56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrkMfPht; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrkMfPht"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a8640763so37441345e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733153709; x=1733758509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwQoSlg/CRXta7tinu4nzK9A8fmWpb1sD/ndqJQH9ZI=;
        b=WrkMfPhthHwfOUvb2yewybK8ObQ1VkgJVz+X94PF0VVfzgWURZD/Txhad8YAMGEHwv
         Z3N6K+rfYQ0+bKJsEvA72RNB7I8dLB+jMl4X/kq/82QqGoYq0O+miG/0FCGux3jYEC61
         BWEypGaO/y7kqaf7uzwHG0xJDqIXbgJj+fXBGzQi8AUfkVVQBidEkH8u8HfZcG/mKH1O
         vBBVDTKCTdwPE3wYmUzUcefdR9YlCO77hLm44dusoSRCPKfUrytOVVNW2MRHoYn9CrNZ
         lUu7DYNzOodrpD7AUZZBu05re8EB2MHIA+2L3zMGDwN9KYoBuimfv2ytaxmPth84eNia
         BHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153709; x=1733758509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwQoSlg/CRXta7tinu4nzK9A8fmWpb1sD/ndqJQH9ZI=;
        b=hWRb8mNPHw9fOB4dqyqHQxMhQXDCi8sfriW5GoeTaqHncKFu+HyGmmAI97nFS6ZiHy
         tCKWp/6Wh9sA16ElOlvczTfCxaRJhlqunESrB2xNwDyOYBEY55IZFvWQvrgG9ep473Ex
         ZsCi1BzvLvJ1Nsx3rY5Th2jcBptnYUm6vLy/06SEf2f1yUsVYo9HXe6Y1PmeDx9WgRnf
         tyR/IfurAFemUUVhl+t7CakG/Phqf1sOAN7uvLC9Hd+E4UNYnEaT1bXR/CglNAkcQzv9
         6PYbwOoqf9DKCzo71Ln0PEO4dKeZAphquTNZvPrOfiy5QP161+Zea6nTP4ooX0fFLCwa
         NtbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYv6nGOoUOW9rZNtqWKi7IjEvEAuSqFycPOGLmbL8WgEKQlQSMzAOTXdAl0apTHAmoymB3pEIhlU0DCljS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy04CnEkdJXj/te34296aPcx/KDpdxbUx9qbxSOMsvUlVx8C0C2
	ByiMrmlQ8AmUy/R4yf/3ZvSgfmxDe5xRVsYl+wI/AOYf+S0mTKUO
X-Gm-Gg: ASbGncsu9pWRc1VdK3a9Gpfi9S0U5aa0IulYZA3xLJNHPEG6xzqwMjmSCQUXo29qpXp
	MyxUvNxEUTe07i0lpn0W5tjPNKNhbZ1BMnaOQfJu740JMFsqlro3SuLh6XyJgVhh8nHey3d+SwU
	Npqdt7K5UC7t+NNz1lKt4zowHVoXonXS/EvFgo+ruvQ5X+ebuTBngTuy1xW/8TaiCKLfvHCMzVc
	DSzwJuhLLLTBFO4BFH5DSAWdua07k7pX+3QwWN6o/nWnTk2+21P1welAc1+PVws2Q==
X-Google-Smtp-Source: AGHT+IGBTrglvrKp5qU2mZgN2kGd2HuOxElLlSuOyMKA1D6iXB7TZwlqKAUTda4yKuSfgAlf2BaINg==
X-Received: by 2002:a05:600c:3585:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-434a9d328f1mr229926915e9.0.1733153708961;
        Mon, 02 Dec 2024 07:35:08 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5e59sm190838035e9.44.2024.12.02.07.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:35:08 -0800 (PST)
Date: Mon, 2 Dec 2024 16:35:05 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [GIT PULL] Staging driver changes for 6.13-rc1
Message-ID: <Z03TqThAOa29MEjD@egonzo>
References: <Z0lCyXBV06VyH96s@kroah.com>
 <f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net>
 <2024113025-sly-footer-3462@gregkh>
 <7d7e65af-b818-45de-a92c-ee59a864dbdb@roeck-us.net>
 <Z02Cz6GbdtGNPywE@egonzo>
 <f4ded99e-35c7-4651-8c73-376390ceb130@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4ded99e-35c7-4651-8c73-376390ceb130@roeck-us.net>

On Mon, Dec 02, 2024 at 06:52:28AM -0800, Guenter Roeck wrote:
> On Mon, Dec 02, 2024 at 10:50:07AM +0100, Dave Penkler wrote:
> [ ... ]
> > That is weird: the type of resource.start is resource_size_t which resolves to u32 via phys_addr_t on i386 which should be the same size as void *
> > For compile check purposes simply changing iobase type to phys_addr_t the following error message appears:
> > 
> > drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_common_pci_attach':
> > drivers/staging/gpib/ines/ines_gpib.c:783:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> >   783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
> >       |                            ^
> > drivers/staging/gpib/ines/ines_gpib.c:783:26: error: assignment to 'phys_addr_t' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
> >   783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
> >       |                          ^
> > 
> > It would seem that for some reason phys_addr_t resolves to long long unsigned int
> 
> Check out CONFIG_X86_PAE, which adds 64-bit physical address support to
> 32-bit x86 images. Pointers are still 32 bit in that mode, though.
> 
> Guenter
OK thanks. I will submit a patch to use ioremap.
-Dave
