Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403D821C19E;
	Mon,  7 Apr 2025 18:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049212; cv=none; b=ehAX+vm2N+HecN/XFA8zm6H/WPSsuKuddFdkTNqvGT6Z2DSQwpGigHZJUbZd91SqslAoKlCIhM2qgfH4LbHjT8zjgTxrK2BDccGcu/M6NogqqFpL4dE4FAT/hHoZjcFt+FVkzwPApC/6loelcH9iP7wgpy8fnPd8yxc3zXXh77I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049212; c=relaxed/simple;
	bh=/QL2Deg67baZmAbZ/a+IO0SqdLa/xoFdNNCtzMrZm1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAZEnnj+qGDX7Kb7BIS2eBK2XPom+09oOikwrY6bWK0y+DwhgCq/Aha7FS0k+PGiyJ1o90TC2aWlnoA/nj0YlwNeb2ZUwbu9jzKLVUug0Lx3XdVpMwev2DCT8ZCirayHaMRWwrTep3Ns4c7uryJmZXFz2WVCW0Qk3M8I/2dxfjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMkU7uRr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMkU7uRr"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c266c1389so3350718f8f.1;
        Mon, 07 Apr 2025 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049207; x=1744654007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrEaB9L3JJCWImgpqc6St8J9YBdrcTfemPWf3LmUw3I=;
        b=LMkU7uRrfX30njAltBRpBD1IDU8FcILsta10ObuzLDE93N3d6DCU1a3AjzLJ4cM1VJ
         e/GSyYXdU/J917Pcqtq09otrC4HrgNvV/PkFTM5KVG+qEL3g5xyfgbckuZv25zVBqOzk
         T8Gm6ilF/vjo46WQnys/G5GqztpJvfTxxnqyCtB+6ri/vyGXIj0HU0OPc+SkyGF2RNrz
         Xwb9uwoLVM+BrHigZoqHMEqX8iCy8a4X/IGuHa+54UnLYdykYdWhYr5/LAsgotEgycUB
         cta9J7kwvV7ps7zKhYVRhMSn0CeKc5LamgDFAYSGW7b4nuvFCWAgPDDyKPbGQU2wdez3
         mnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049207; x=1744654007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrEaB9L3JJCWImgpqc6St8J9YBdrcTfemPWf3LmUw3I=;
        b=iW91Sjndky7XtUXR/4xHab3jfHuIJe9o9DTWvmWsQ9uzTK9mnC+P9+bmpQKNP2z7yM
         a72Pdrz0vXMEH9qJIBIOB5NhaSBhPHuY9xsZ1HFEvzVa8jR1stTKMcJ4kxl3LgEqf/0S
         QQJ4gVy6pbFr9Iz6iSPw7BLDIbBCpWwH790q2oqiIj38aE7H+/cFlVMGCSiykViMKCLT
         8yrDygNKZmCASPKbt3t61a47hm3B7h55qYxW0cHvu1lP5L6rXPkBHt9ssMPiD0Ci4/q4
         w6cxRplyXZUI3RcEG+4DjM98NQKqb5Oxacl2gp5Opz+t5ty6lZcthrk840PoSL7kRVqw
         Kt+w==
X-Forwarded-Encrypted: i=1; AJvYcCWPkUacLD6cMbtDAdG77iD8zjNwC4Eo5oRbU7o4ipcTGG2qwDgsgLDv40G+2ufQnvpi2jGv6uGTjhovrSHf@lists.linux.dev, AJvYcCWRdaiPbgS7RQ4Mnp/aAftDBSuCr34E+2OMcztGffyys9W0wQNILbnVWvJmooXh3KKoUgqwXvyJ4ONq@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6ddstmSyVn+VfqgCnaVeWgTMuZKZO9MQqpHRUo3wKpwiG5S44
	K5RqKrqufiK9jncEO0rN2UXv7t4JJYdkPERElBaLsPtJMER47iMT
X-Gm-Gg: ASbGncvKD7/8EsHpctQJhthoJ/ZBWoh+xEde9m8h1bbb1y+ic+FQFQCOotrEehpTtrb
	00eDkZQudMxnNY4PGcHSr1Kx1M5hxjw5+NpXnPOqKfpGh7P8FFwwzSBT9sS8p41TnTqFkSN/NH4
	0jc96tLELAZFNVnwEHkKjzw5wOEZrhTqfJArMaAsJOE0nzSW0DzmFg0ptjyaNoiP8bGicWnPsQ6
	ea8p0YdI2WbWk4YoTrOiubsFMRNowfZCN3NSLH+1o8lyKK17xAInjVh7nEZUst8VnEEkHqaBXVm
	ngo7vfT1jc1A207vdzLtaG7Xm8TsAB7ht70g2p/rw/WVuyjkrQKs27aHDyFbq3F4FRWmMkUUTUR
	AkYRW8Os=
X-Google-Smtp-Source: AGHT+IFTFEHCvLaGHp3dLmSDqBIEvCaNTT+cXX7kVGMx3xEmdqHdogSDXb/eN7l4LEq4MVLdCLQc8w==
X-Received: by 2002:a05:6000:18af:b0:39c:2688:6904 with SMTP id ffacd0b85a97d-39d0de62689mr11800118f8f.39.1744049207297;
        Mon, 07 Apr 2025 11:06:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b72d5sm12601873f8f.47.2025.04.07.11.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:06:46 -0700 (PDT)
Date: Mon, 7 Apr 2025 19:06:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Abraham Samuel Adekunle
 <abrahamadekunle50@gmail.com>, julia.lawall@inria.fr,
 outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <20250407190645.285fa924@pumpkin>
In-Reply-To: <Z_PE8usXhpLJ4sTd@smile.fi.intel.com>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
	<2025040757-clergyman-finalist-0c63@gregkh>
	<2025040752-unrefined-labored-8c8c@gregkh>
	<20250407132115.11ded3d9@pumpkin>
	<Z_PE8usXhpLJ4sTd@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Apr 2025 15:28:34 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Mon, Apr 07, 2025 at 01:21:15PM +0100, David Laight wrote:
> > On Mon, 7 Apr 2025 08:53:30 +0200
> > Greg KH <gregkh@linuxfoundation.org> wrote:  
> > > On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:  
> > > > On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:    
> 
> <snip>
> 
> > > > > -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> > > > > +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;    
> > > > 
> > > > I do not see a modulo operation here, only another & operation.
> > > >     
> > > > >  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> > > > >  
> > > > >  				SetSeqNum(hdr, pattrib->seqnum);
> > > > > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
> > > > >  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
> > > > >  						pattrib->ampdu_en = false;/* AGG BK */
> > > > >  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> > > > > -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > > > +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;    
> > > > 
> > > > This also looks odd, nothing is being "AND" here, it's an address value
> > > > being set (and an odd one at that, but that's another issue...)    
> > > 
> > > Sorry, no, I was wrong, it is being & here, but not %.  My fault,
> > > the lack of spaces here threw me.  
> > 
> > It is still wrong '& 0xfff' => '% 4096u'.  
> 
> Why?

Do some math :-)

> > But it is all rather pointless especially if you can't test it.  
> 
> > Plausibly more useful would be to find ALL of the uses of 0xfff/4096 (I suspect
> > there is an array lurking somewhere) and change them to use the same constant.
> > But you need to be able to test the changes - or at least discover that
> > they make absolutely no difference to the generated object code.  
> 
> The problem with &, it's not non-power-of-2 tolerable solution. Also using
> hexadecimal there is not so helpful as when we are talking about sequences
> (or indices in the circular buffer), the decimal makes more sense.
> 

Except that you either want your circular buffer size to be a power of 2
or reduce with a conditional (eg: if (++x == SIZE) x = 0;) not a divide.

	David


