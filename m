Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740001F8EEE
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133014; cv=none; b=iXYBJNjxoRH+IZ/xWmnH0EqUIstOdzWq1OUmAxe7xLfQq+mYOVhzPUybHKjtdilG9V+FySPnHuPSpTtRP0C30M692/cEeKthtX2MuaU7ZtPwCU0Dm+yM5cvDrb0FnALLTZbBbSCelhV+iUMwneTqExEAKH6S6HencxYAA9WzOuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133014; c=relaxed/simple;
	bh=yupbxSUbYy8LInAwf/1LDBrb1j4q0UJbTOpZzjh/iDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPXfPyZiU2GA9ro+1OdpeU42Dxf8SvJnVJS/sCEqIIGxws3THFuU8dlTNayBIX9WfisnQ3wa7YKTYBxzMd+wHckEi4QotUQXDy/mJbmXFLiU7/Fl8QgOGwq73cl3bbfV5wjUYkeIhS6DSSrnC1y4YdOPFxBWxgBcMrVyQCa3yI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcQiULdy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcQiULdy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so36973685e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 01:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733133011; x=1733737811; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGdJEBG9Txtp78vl9KMnzjxNyiIm9+dUdwbTmnsgMo4=;
        b=mcQiULdyVow10KgdmZ5QlHweYmOdvfLqQaXcrYg5g34bM/zKLKlj6yAhmR19AdhbDs
         W+No5sP1vYCgKEPWGlthLXVyJWPFw9Uga0kAvWpemyKRG4p5ZUK7SU3dE5QDf2iniYJ/
         pCtL+9BhJXbKF8A+9pJXJlTFZVh5nWas7yqjptWGsDSJA5jQCFaVwzz6Lvy1dqVJ9S72
         VE97wnHLj9GrzxMsf4T8rLiSA/8PkcAz5P1uzCLt6+gPhUOar4QDR0XDRsFP8JetNNnb
         dP8ibdjPx2PH1wDU3DahktnLt45bk9ljkEkVK9CSwlmDtg8esBQkS58vIqjO3oLuzx5R
         JJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733133011; x=1733737811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGdJEBG9Txtp78vl9KMnzjxNyiIm9+dUdwbTmnsgMo4=;
        b=Lc7w+BJGXHYJfyk0bPfWiYiNfGZXU33PcvdzZ/I8xoEhvRK8BJXg/kIbSD9DcaqIH2
         tt8abwLR2yMsIkFdJJJ2VaMpCUlYjU6XzeM5gbCENFW1e3JoAP2MU16b5GeK1dwWI3tS
         jozmCFEZrMp06tFqlSxIre6gapbvaBnw2ZSbiCOC3r4j43CFGix7GefyZNRDI3KKXVwE
         Tfs0nnTiXRAc3zTOK5cSE7GaS/itiFivJ3T2pE4n1va51KhcdlDO4LTD1hzm8ha9GV4t
         C3s3K9/4XlFRfJSDIZ9T/2lQrVoGEsL7ULiVrpazdQ0SUjDhJx5odXLtZsE+37ruTZAX
         xhPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQZL5FuJvqtD7i9Fg8dmSZoe/aIuClCEFX2V4qu8xRnXTIi22VUZetg5CvLwvjnHNsLsDVUEQdwp3DsYyn@lists.linux.dev
X-Gm-Message-State: AOJu0YxolKJE3aWBlZIH0bMNrp+MqC3BurGQnektFG+cQNxJ5thi6Vm+
	zpPVyTuVIUYL7Dcx4h9IE1eeBObgt0QdMc3x/+bBsEMFfw0+0uGq
X-Gm-Gg: ASbGncvgl93jlhXLKUfORS6GRRf3dVW46RGqB4+41V/2SoRgO8d4mQpuf/lO/XlVlrB
	kOqMtZVl3WjQNxMf7ocb74NeWTIekLiKbhyfXu0vy2we+y+i01X17zTpDWI7jeYiBQAEqZF6xZe
	YRyCy55I81Bj7ECP87K7F7i5d+PBaT7fgDTs1rBVEcPPxTXiicqQZfpgynK6bl5JLYgeKgkY4zV
	d+qrOP+iYnx6EYMYhUlqiJmDCHnymC80ovR7VSvPtR3wbXMN4+KjmrsC1du7+/MuA==
X-Google-Smtp-Source: AGHT+IG/NVivYLg1OUuCE5VjRAF5LhER8lnv3l6zTFnhpZD70zQp/iX3dHcDM7WzvcQeakGCE+ffIA==
X-Received: by 2002:a05:600c:4f08:b0:434:a179:71b8 with SMTP id 5b1f17b1804b1-434a9dbbc2cmr165027075e9.1.1733133010404;
        Mon, 02 Dec 2024 01:50:10 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a972c33csm142136955e9.1.2024.12.02.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:50:09 -0800 (PST)
Date: Mon, 2 Dec 2024 10:50:07 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [GIT PULL] Staging driver changes for 6.13-rc1
Message-ID: <Z02Cz6GbdtGNPywE@egonzo>
References: <Z0lCyXBV06VyH96s@kroah.com>
 <f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net>
 <2024113025-sly-footer-3462@gregkh>
 <7d7e65af-b818-45de-a92c-ee59a864dbdb@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d7e65af-b818-45de-a92c-ee59a864dbdb@roeck-us.net>

On Sat, Nov 30, 2024 at 09:07:39AM -0800, Guenter Roeck wrote:
> On 11/30/24 08:15, Greg KH wrote:
> > On Sat, Nov 30, 2024 at 08:10:55AM -0800, Guenter Roeck wrote:
> > > Hi,
> > > 
> > > On Fri, Nov 29, 2024 at 05:27:53AM +0100, Greg KH wrote:
> > > > The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:
> > > > 
> > > >    Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.13-rc1
> > > > 
> > > > for you to fetch changes up to 114eae3c9fde35220cca623840817a740a2eb7b3:
> > > > 
> > > >    Staging: gpib: gpib_os.c - Remove unnecessary OOM message (2024-11-10 08:04:18 +0100)
> > > > 
> > > > ----------------------------------------------------------------
> > > [ ...]
> > > 
> > > > Dave Penkler (33):
> > > >        staging: gpib: Add common include files for GPIB drivers
> > > >        staging: gpib: Add user api include files
> > > >        staging: gpib: Add GPIB common core driver
> > > >        staging: gpib: Add tms9914 GPIB chip driver
> > > >        staging: gpib: Add nec7210 GPIB chip driver
> > > >        staging: gpib: Add HP/Agilent/Keysight 8235xx PCI GPIB driver
> > > >        staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver
> > > >        staging: gpib: Add Computer Boards GPIB driver
> > > 
> > > I seem to be unable to find the patch introducing the problem (the link
> > > provided with the patch is invalid), so I report it here.
> > > 
> > > With i386 allmodconfig builds:
> > > 
> > > Building i386:allyesconfig ... failed
> > > --------------
> > > Error log:
> > > drivers/staging/gpib/cec/cec_gpib.c: In function 'cec_pci_attach':
> > > drivers/staging/gpib/cec/cec_gpib.c:300:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> > >    300 |         nec_priv->iobase = (void *)(pci_resource_start(cec_priv->pci_device, 3));
> > >        |                            ^
> > > drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_common_pci_attach':
> > > drivers/staging/gpib/ines/ines_gpib.c:783:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> > >    783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
> > >        |                            ^
> > > 
> > > pci_resource_start() returns resource_size_t, which is not a pointer, and thus
> > > can not be cast to one.
> > 
> > This is odd, why hasn't 0-day or any other build testing found this?
> 
> Good question. Another good question is why I see this only with i386 builds,
> but not with other 32-bit builds. It should be easy to reproduce, though.
> 
> make ARCH=i386 allmodconfig
> make ARCH-i386 drivers/staging/gpib/cec/cec_gpib.o
> 
> does it for me, independent of gcc version (I tried 11.4 and 13.3).
> I don't see it with clang.
> 
> Having said this, using the return value from pci_resource_start() directly as pointer
> is quite unusual. Typically drivers use ioremap(), request_region(), pci_iomap(), or
> a similar function on it to get a pointer.
> 
> Guenter
> 
That is weird: the type of resource.start is resource_size_t which resolves to u32 via phys_addr_t on i386 which should be the same size as void *
For compile check purposes simply changing iobase type to phys_addr_t the following error message appears:

drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_common_pci_attach':
drivers/staging/gpib/ines/ines_gpib.c:783:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
      |                            ^
drivers/staging/gpib/ines/ines_gpib.c:783:26: error: assignment to 'phys_addr_t' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
  783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
      |                          ^

It would seem that for some reason phys_addr_t resolves to long long unsigned int
-Dave
