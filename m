Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935B2C96
	for <linux-staging@lists.linux.dev>; Wed,  3 Nov 2021 13:36:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 894E361076;
	Wed,  3 Nov 2021 13:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635946586;
	bh=dunXkZtNcaRVY51A84/L3TpeLaRw4mCDlMAGY1y4frk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZPh74Sl1M7Kap1o8Cvy+RxeS9PAMACodR2RWixzex8GK7kc3ZsqYxQHAS1wlvUPAH
	 RIAERiVVCTV5RKglIdYJjyIl9mlAODB6b8nlUxoneOZ2enjrD7C/DMYrNpjSSJD/1L
	 bEAN4vrW13o7ND8awy9rzzNOsOeKKhN9AJy2pnnmy7kVTEvNUJe9uUq9aqd5UZTkjJ
	 2MEJBaY7YwSA1tGqqDwVjh0u6H7uoz/Dm2KmFWIRpBHwwREziS3SaYVKzYkkaZ1ReE
	 vFMH+DnTKRKDKrllLhN1p45d1NixIJ3MNABsTPqbqV92w8RfYo10uzFRdawdSVMPTk
	 PbygZR+2RYqGg==
Date: Wed, 3 Nov 2021 06:36:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 knv418@gmail.com, jiapeng.chong@linux.alibaba.com, ojaswin98@gmail.com,
 arnd@arndb.de, lee.jones@linaro.org, clrrm@isep.ipp.pt,
 fabioaiuto83@gmail.com, hdegoede@redhat.com, ross.schm.dev@gmail.com,
 insafonov@gmail.com
Subject: Re: [PATCH 7/8] staging: rtl: use eth_hw_addr_set()
Message-ID: <20211103063624.075c75e0@kicinski-fedora-PC1C0HJN>
In-Reply-To: <20211103112906.GQ2794@kadam>
References: <20211019171243.1412240-1-kuba@kernel.org>
	<20211019171243.1412240-8-kuba@kernel.org>
	<20211103112906.GQ2794@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Nov 2021 14:29:06 +0300 Dan Carpenter wrote:
> >  	if (!priv->AutoloadFailFlag) {
> > +		u8 addr[ETH_ALEN];
> > +
> >  		for (i = 0; i < 6; i += 2) {
> >  			usValue = rtl92e_eeprom_read(dev,
> >  				 (EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1);
> > -			*(u16 *)(&dev->dev_addr[i]) = usValue;
> > +			*(u16 *)(&addr[i]) = usValue;  
> 
> No this doesn't work.  It writes 2 bytes instead of one so it will
> write one element beyond the end of addr[]. 

But the index moves by 2, IOW loop is only executed for i = 0, 2, 4.

> It doesn't work at all on little endian systems.

Indeed.

> I'm not sure what's going on here or how to fix it but array overflows
> are always bad.

Same :(
