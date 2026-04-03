Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0B3947BD
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209620; cv=none; b=sf8f9gMleyBIxgB+0/gGD1bGbd0W3J9hXOzeBp6JqPerzjH4pBz5DU1rN7gnoYClnQm1y7Ef3bgAsb2aGRBwhCficNuqmjYXi5Gl0+oV0pIe/aXYf+IdLNtCtU8ENftpdVK644lmFyKA8JAlm1+fYkC6wjK6vfAj8EggTsuXqnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209620; c=relaxed/simple;
	bh=p60BRs5FAVudtDIWG0lrqVFZH7bExONxaFkex8D8ISA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/SEqdRD6mRVrO35TR0RfZB2bNyJ96PHcbVLgnUUCZ9rHkKgDuRtLAZd2iFV3gnVuKXfzTTpcnXFBRP0DvYX1oqPkh0H9tuVhNaY3Y57wYn912I79ZHWKf4udkWAd26AEsFE5shwRut9RsKxX0rWgUR0sADwYp+c9q42PRFgLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/ftLi+o; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/ftLi+o"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so794987b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775209619; x=1775814419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vz+gjdpiukg6Y9fAW5H7hyMM4+ZnsKxjEKaoeKbJt9w=;
        b=R/ftLi+oopnVA+7P2FPvr+WfOViw2j1lFzOr0//mm8KFtLL6vwQkJDIvaou171Xodz
         xaNl1yR6ysSf1kFkyHYt5uXyo3xuQ/bM3P0raoCdaDqrWtnF6TG85G5V1YlyfmiTHyr6
         0m27CjiBxBb9VGkWKL6+GhHiGipheBy9QcwH0y7/YSmpZEXgWP67aGxALR0iwlonml2S
         /P6PCc43nhu/nG/N1hbvyHKHePlQsdKNG9WTS5xp3FmUJxyG00md/+cDGpnmxhj7yufV
         Jb3zVo+urLSZBBeMxYnpQLe+m8zd0WlR5epBLo/lyR8222EtGTVyQkAwi8YIB6qZmBZW
         0nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209619; x=1775814419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vz+gjdpiukg6Y9fAW5H7hyMM4+ZnsKxjEKaoeKbJt9w=;
        b=swZE2JiVTh1lY125Yj/AJ4pDU7dNBwVtzi6HdnBM/slt3zW03hleRqE5Logz+7V/Al
         pwr9dA157j1QyDeWVGAM/L4ZD4k8v3lnSz8lk2bD43sxBf4ZMN0jYenK9Ss3TGvBPVu6
         qQX9eMLXCJ/N709/JGxUX+U08NVdqWrAp9dwLjXDJEilsqVy3vrCWDkfz35ycj3L1wwz
         Pz3aaVByycFxAcqEbJbjRlBUb+/fPJt3QxgUY7f1UBfhw8cO0I9a2shEbNkpQlDSU4Bo
         IQ5F6UmJi1YYO1urWwO29IaybQlYzbP8OxnZzKcvyigAfXc6IG03IDJ+SBeDg88CxG2a
         8liQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/MVFIjACgescJ1BVewiDKcGe7TSardVeOrZprruPmYXtqMgNN0F98Or+cXLf1dOfS2WkhU0Z4go0xS1cX@lists.linux.dev
X-Gm-Message-State: AOJu0YxqyuOKBqU5vORCBnxUWVLZ3DwtFHloqFsTjoO047/7vgCmZQNE
	T9/gTDfm3S7mf/qj7xBi6kJOkNew8bRkehr4JboUOjlekiRbmqjYpl92
X-Gm-Gg: AeBDievezGbxpNCRsBuQEyyhH8h5wxt3ohBb1uG5mAXxpnt9pjjnLaJTV5Iq91z0t64
	gYsDMpB9P6UYz3yed97eQnjGMo2Tk8SiUBpGTCpQpDjuUIpyujN4n4+OFzLa1htbRPnQPnXaBG/
	Vn8EgIEx+J29S66pinPo1sSSxltPAuL67MPCKeHGKKnQwC6BQhxXbJdrLad+7MFGyox0hfQ1Fik
	IUsdW+3Z/7lv4KQjRrUyzp+dR1ExcgGhcdSabjn05dyq17NED/tu5TSCQ2rmoKJaovEmaWauoFQ
	LULpOegm0pHtCO9DNae8lDwBXsdvc5rYtyeC7YGuXUGr2hb75gAiT7kuWD9+kA5ods1ssGLA9t8
	Pw0l7z2bAUCoNOlEXb2LeB3ALeC7YIqye8+9OZONbSpozYDlFHTIsMFantNy/heur/pYgIq4Jml
	qyEY/Rvpv9alehZIQ9wH1+
X-Received: by 2002:a05:6a00:4b53:b0:82c:70a8:faec with SMTP id d2e1a72fcca58-82d0da7dff7mr2222291b3a.21.1775209618705;
        Fri, 03 Apr 2026 02:46:58 -0700 (PDT)
Received: from inspiron ([114.79.178.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ad8asm5756282b3a.40.2026.04.03.02.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:46:58 -0700 (PDT)
Date: Fri, 3 Apr 2026 15:16:47 +0530
From: Prithvi <activprithvi@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andriy.shevchenko@linux.intel.com, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, lukagejak5@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <20260403094647.fmgop6xh2cjpit3s@inspiron>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <20260328174716.rna2qykokwkojzpt@inspiron>
 <2026033047-explore-embody-564f@gregkh>
 <20260403073108.qj5vjqx7zq4l3kdx@inspiron>
 <2026040317-bunt-pampered-a625@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040317-bunt-pampered-a625@gregkh>

On Fri, Apr 03, 2026 at 10:04:08AM +0200, Greg KH wrote:
> On Fri, Apr 03, 2026 at 01:01:08PM +0530, Prithvi wrote:
> > On Mon, Mar 30, 2026 at 06:03:08PM +0200, Greg KH wrote:
> > > On Sat, Mar 28, 2026 at 11:17:16PM +0530, Prithvi wrote:
> > > > Hello all,
> > > > 
> > > > Thank you very much for taking time to review this patch.
> > > > 
> > > > I understand, that this patch may be considered to be majorly mechanical
> > > > changes, but still, the scope of the patch as well as the changes
> > > > involved make testing important for this patch.
> > > > 
> > > > I agree that, in case of unavailability of hardware for testing, I should
> > > > have mentioned it and used the RFT tag for the patch since v1. I
> > > > apologize for missing this detail & understand that compile-time testing
> > > > can't be sufficient here with all the changes introduced by this patch
> > > > and also the concern of the possibility of regressions getting introduced.
> > > > 
> > > > Going forward, I will be meticulous about clearly disclosing the testing 
> > > > status of the patch and if I am not able to test a patch, I will be sure 
> > > > to add RFT tag since v1 of the patch itself.
> > > > 
> > > > Lastly, I wanted to kindly ask if it will be alright to send a v3 patch 
> > > > with the RFT tag, incorporating the changes discussed in this thread?
> > > 
> > > Yes please.
> > > 
> > > But remember to do only one logical thing per patch, I see multiple
> > > things happening in this one :(
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Sure...just to confirm I should send RFT patch series, with patch 1 being 
> > regarding the change of keeping constant on right side of test (shall I 
> > include the minor changes like proper formatting of if statements, or even
> > value == 0 changed to !value, etc. in same patch itself or strictly keep 
> > only the constant on right side changes in this patch?) and patch 2 being 
> > regarding the API change of using read_poll_timeout_atomic() only, is this 
> > correct?
> 
> What would you want to see if you had to review a patch series?  Which
> is easier, a change that only does one type of logical thing throughout
> it, or one that mixes different things on the same lines?
> 
> Remember, a human has to read all of these :)
> 
> thanks,
> 
> greg k-h

Understood - I would send RFT v3 patch series, with each patch doing a single 
logical thing.

Thanks,
Prithvi
