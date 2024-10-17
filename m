Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45A7157E9F
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 07:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148621; cv=none; b=unr6UYckijSPUK6PZN1SmNFWGj5jlnZTsuKeYf0gl0ZGd1xKPUUBRh0Y60NhR4dgQ/PRsOAg+lTMeq+PxQSu8mghPeRlevzamANQ+gY2sLEnvzCeNBtaAXa1wJSMDqo4ZVlSUgH9+soSzEmaL7wrbF/Q4W5/1dSCAzTeFrRZIcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148621; c=relaxed/simple;
	bh=zDXGu3x/zNVOof1rSjPWuobKaTHcITYX+c97b1xcpvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1IFAd90ml0tmMf1YMIGzQLvmr1XoHVTwwMRoIVqEFm+Zca7PT3rMbY+wtkUPhL78u9pkCP6+uzt4hPjfjEfBQ+bhNkdyGV0TNnGD3q1EOAKAQgW+Wjh7kCc8JrmKO9eTBKxXj44vBguV2MuNfxo/HUcRaEcphb2yvGH33rk/JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Etvslckt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Etvslckt"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539fb49c64aso817432e87.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729148618; x=1729753418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iawtoavv1G2RX0l5WVjSkFXmpKxh1NpN/ld6wwOOv/s=;
        b=Etvslckt/tgmvEfJ76Mv1hTPRnp5fVlOeZDKaNh8HPpqkoaYWURNDg6LoPbtExa/eQ
         ZQCOU5A4sSIr+jMuCy3apmgxilBO+N1iiNlhvr5I242sdA80Kifz8Ey/etEQfTensMQA
         j+Plxc5LssfIi4iB/ySWz5/uoma0CgAjoaF4QX4vNHr9ZNMknJN4Xw369KAYae2Mf/uO
         QwPD/4Z6HqO7MD63CDx4ynVqFRZQPQmMYDRqPwdhF7RDaXzhwRQ2wek5RYg2XwwOwTOj
         JQrhHVuW2N71KnpcpCx2nSpcXoQPzaBLExcYNPOL/m4BHnLrkh9j0u5OiAI0IQmq6X99
         xuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148618; x=1729753418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iawtoavv1G2RX0l5WVjSkFXmpKxh1NpN/ld6wwOOv/s=;
        b=tPPzkL6poQHZ/ZYv6ktlMYtwuMKVaxBK0cNO5lnhnpvAKZR9OTguBKNmk2qaOpyJE/
         RLfhYQUv13dpHWcHOlalHEsT0oynEMZyJfBddst+7dYAnk8iKvfbpOqC/pb7sYlXsmTU
         Ec+Wg05Lv8glB/C9iryBhqMVoUqqsxO6SSq9VKlZeM2a2ue3pw14COYa4bKR5Sgl1eq0
         I0mC0H5fis/XBTGRrCzTkTDPWCfFJcw1dvwc5z76yid8+bZEE3KAumDrRIJWY0MYlS9D
         Vcy43hvNlOyGEmVOYKHB4eZBYgW74BiOWrrl8+mo00po1q8ENtauc1CIl3u7UpBWfdbD
         NDLg==
X-Forwarded-Encrypted: i=1; AJvYcCWBt75i2zd0pWqqpY9OTJ16u+7+DlbZrFH1Rciexc+jgNF07C7DmhE4CDNP38OiocF/iJJeJloU6inMfgPd@lists.linux.dev
X-Gm-Message-State: AOJu0YzbdoP7BEjAYIANR4rbzqZ2J9xHz6NNHCJ7YzFiwIAqg5nXX+dY
	VJ3bWHSWnX2dy4oDT82pJ2E8LvjoH2qMmNcwbBQUH2LltCxW2bNDdhBYylSt0RI=
X-Google-Smtp-Source: AGHT+IHSDq0H6zQ11CelWpuA9izCcxSo97xdpRi0sSnTkqGYNPxSymFsUjn53qQvY3ZhbDmWOfE65g==
X-Received: by 2002:a05:6512:3e06:b0:536:a7a4:c3d4 with SMTP id 2adb3069b0e04-539e571c959mr13304029e87.39.1729148617644;
        Thu, 17 Oct 2024 00:03:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29717324sm257782966b.36.2024.10.17.00.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:03:36 -0700 (PDT)
Date: Thu, 17 Oct 2024 10:03:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: Greg KH <gregkh@linuxfoundation.org>, dpenkler@gmail.com,
	skhan@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] staging: gpib: Remove a dead condition in if statement
Message-ID: <92acd116-55f4-4262-8b86-840da55481c3@stanley.mountain>
References: <20241016075319.4092-1-everestkc@everestkc.com.np>
 <2024101654-jasmine-ransack-7190@gregkh>
 <CAEO-vhGuJUdbBhchbga33TNWvZXTXHWbd4=M8xeWkHAi1rnw2g@mail.gmail.com>
 <f3fdd6b8-53bb-4e9d-bb32-3816035d4d52@stanley.mountain>
 <CAEO-vhFAb=xfc2sZiezW7Zn0dWNQ4axVxE6GErayKs76NtG1bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEO-vhFAb=xfc2sZiezW7Zn0dWNQ4axVxE6GErayKs76NtG1bg@mail.gmail.com>

On Wed, Oct 16, 2024 at 08:47:21PM -0600, Everest K.C. wrote:
> > $ git grep get_dma_residue | grep static | grep -v gpib
> >
> > arch/alpha/include/asm/dma.h:static __inline__ int get_dma_residue(unsigned int dmanr)
> > arch/arm/mach-footbridge/dma-isa.c:static int isa_get_dma_residue(unsigned int chan, dma_t *dma)
> > arch/m68k/include/asm/floppy.h:static int vdma_get_dma_residue(unsigned int dummy)
> > arch/mips/include/asm/dma.h:static __inline__ int get_dma_residue(unsigned int dmanr)
> > arch/mips/include/asm/mach-au1x00/au1000_dma.h:static inline int get_dma_residue(unsigned int dmanr)
> > arch/mips/include/asm/mach-generic/floppy.h:static inline int fd_get_dma_residue(void)
> > arch/mips/include/asm/mach-jazz/floppy.h:static inline int fd_get_dma_residue(void)
> > arch/parisc/include/asm/dma.h:static __inline__ int get_dma_residue(unsigned int dmanr)
> > arch/parisc/include/asm/floppy.h:static int vdma_get_dma_residue(unsigned int dummy)
> > arch/powerpc/include/asm/dma.h:static __inline__ int get_dma_residue(unsigned int dmanr)
> > arch/powerpc/include/asm/floppy.h:static int vdma_get_dma_residue(unsigned int dummy)
> > arch/sh/drivers/dma/dma-pvr2.c:static int pvr2_get_dma_residue(struct dma_channel *chan)
> > arch/sh/drivers/dma/dma-sh.c:static int sh_dmac_get_dma_residue(struct dma_channel *chan)
> > arch/sparc/include/asm/floppy_64.h:static unsigned int sun_get_dma_residue(void)
> > arch/sparc/include/asm/floppy_64.h:static unsigned int sun_pci_get_dma_residue(void)
> > arch/sparc/include/asm/parport_64.h:static inline unsigned int get_dma_residue(unsigned int dmanr)
> > arch/x86/include/asm/dma.h:static inline int get_dma_residue(unsigned int dmanr)
> > arch/x86/include/asm/floppy.h:static int vdma_get_dma_residue(unsigned int dummy)
> >
> > Only the Sparc functions return unsigned int.  The rest return int.
> Why is it so ? Are there any resources I could go through to
> understand it better?

There isn't a reason for it.  Programmers make millions of little choices and
some don't matter so it's just a roll of the dice which way things go.

regards,
dan carpenter

