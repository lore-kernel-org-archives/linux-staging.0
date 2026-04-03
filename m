Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA9299943;
	Fri,  3 Apr 2026 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203452; cv=none; b=ETy4+DoAXiDhYSzlAnBdwdasIlFZclj0WEVhBJTNsUziIwlInEE+HMqI8IdAx5exky7kdOql1+mgEYSZzM1I42muKA0yd/zzVIrfZbaHLcQUrr7YqN1VVrrIrXOdG5jxkqJ7KaI2PnGjZK3qN86VFiNxYTxQPvf4QFL7kjgokHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203452; c=relaxed/simple;
	bh=3xk5QR7wCVct8wdSDr6ZwDQMZ8XKNfKvuFTuoATThF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fe6KyIBKwGSkd47l05gDDy1VXGzLlxvn0mYDBi8bAq+EgR5xXTzCSqeBUNWmmmYD2SFUqgOJaLUdMfyyPvj9ApVQvLxXgMqukDZvTZmIcvNZouPAMGNcrliiesOONkfKuFwXGbg7rnY9rRklegUODsrQVcw7aSRSA5BzX8uPaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c4oelyry; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c4oelyry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04138C4CEF7;
	Fri,  3 Apr 2026 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775203451;
	bh=3xk5QR7wCVct8wdSDr6ZwDQMZ8XKNfKvuFTuoATThF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4oelyryifSO7FiVTBnoOCurd9cehwP92ZH4tLrrcMbcNQhqIsBWQpUdFz944QzZ1
	 jGkuHuVUSPFyEhkDbGf0iBzMifTW3C1+MMmOQ9YTgpzzbf2zfqzR+HNtysfFOHztXq
	 LAFO3eS/wg5fzgOXZaL9OGiS9ihYuQ3h7pJ4AIiM=
Date: Fri, 3 Apr 2026 10:04:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Prithvi <activprithvi@gmail.com>
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
Message-ID: <2026040317-bunt-pampered-a625@gregkh>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <20260328174716.rna2qykokwkojzpt@inspiron>
 <2026033047-explore-embody-564f@gregkh>
 <20260403073108.qj5vjqx7zq4l3kdx@inspiron>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403073108.qj5vjqx7zq4l3kdx@inspiron>

On Fri, Apr 03, 2026 at 01:01:08PM +0530, Prithvi wrote:
> On Mon, Mar 30, 2026 at 06:03:08PM +0200, Greg KH wrote:
> > On Sat, Mar 28, 2026 at 11:17:16PM +0530, Prithvi wrote:
> > > Hello all,
> > > 
> > > Thank you very much for taking time to review this patch.
> > > 
> > > I understand, that this patch may be considered to be majorly mechanical
> > > changes, but still, the scope of the patch as well as the changes
> > > involved make testing important for this patch.
> > > 
> > > I agree that, in case of unavailability of hardware for testing, I should
> > > have mentioned it and used the RFT tag for the patch since v1. I
> > > apologize for missing this detail & understand that compile-time testing
> > > can't be sufficient here with all the changes introduced by this patch
> > > and also the concern of the possibility of regressions getting introduced.
> > > 
> > > Going forward, I will be meticulous about clearly disclosing the testing 
> > > status of the patch and if I am not able to test a patch, I will be sure 
> > > to add RFT tag since v1 of the patch itself.
> > > 
> > > Lastly, I wanted to kindly ask if it will be alright to send a v3 patch 
> > > with the RFT tag, incorporating the changes discussed in this thread?
> > 
> > Yes please.
> > 
> > But remember to do only one logical thing per patch, I see multiple
> > things happening in this one :(
> > 
> > thanks,
> > 
> > greg k-h
> 
> Sure...just to confirm I should send RFT patch series, with patch 1 being 
> regarding the change of keeping constant on right side of test (shall I 
> include the minor changes like proper formatting of if statements, or even
> value == 0 changed to !value, etc. in same patch itself or strictly keep 
> only the constant on right side changes in this patch?) and patch 2 being 
> regarding the API change of using read_poll_timeout_atomic() only, is this 
> correct?

What would you want to see if you had to review a patch series?  Which
is easier, a change that only does one type of logical thing throughout
it, or one that mixes different things on the same lines?

Remember, a human has to read all of these :)

thanks,

greg k-h
