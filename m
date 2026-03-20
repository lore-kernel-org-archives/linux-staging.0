Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEBA3B7752;
	Fri, 20 Mar 2026 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027756; cv=none; b=iSKzYeM3yazYl6b2JLuFtNZP4nTlNNNh+GeEpENUNqyxudWmsPl3bqZUkMmq+U7A7kUkPw9RR1JhHNCfIg1sZ70Lk4yhkeU1IAjSwmXp8JperAqpsreSwk99U9V9SbuJK2YjYn44+rSyjpxnBv0TDaoLA01/SwctF+GBKfurm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027756; c=relaxed/simple;
	bh=3n2oxapyJ1dUN0PppGQM+nhtmwOT1EZ5qEsJGh3Jhkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFIWSOqKaa507+gQoRV+dsfy7VQhJRMOMq0fJv55AxSCBFum0xt0BEVb0KErkEhF+pbKM1gs5tusZIFZurHxuosQXm3LoYWzp57y4KUcHbuOVGG5P+K6jiEHi7N1I58sCOjAt0goxrqav2WTU4g+wIujU4NRGKYfolfpjEp+6Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=10rU80Mh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="10rU80Mh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E00C2BC87;
	Fri, 20 Mar 2026 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774027756;
	bh=3n2oxapyJ1dUN0PppGQM+nhtmwOT1EZ5qEsJGh3Jhkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=10rU80MhFx1RmlAtvy/2if4yQo90T9vdp0rSF/isC5e1b+vE8vbqDdJZBbyUkpM1A
	 ZUJbEo/EBA1Sa4PuCNA7USuIuKqpnhnt9joam102pQeZlWcuHi96ZcNLFXVh8RhdzG
	 22aoBMFEX21fFZXvrVVnroHnZA1yZV6tub4MhQw8=
Date: Fri, 20 Mar 2026 18:29:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lin YuChen <starpt.official@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: initialize le_tmp64 in
 rtw_BIP_verify()
Message-ID: <2026032035-opulently-cupbearer-820b@gregkh>
References: <20260320172502.167332-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320172502.167332-1-starpt.official@gmail.com>

On Sat, Mar 21, 2026 at 01:25:02AM +0800, Lin YuChen wrote:
> Initialize le_tmp64 to zero in rtw_BIP_verify() to prevent using
> uninitialized data.
> 
> Smatch warns that only 6 bytes are copied to this 8-byte (u64)
> variable, leaving the last two bytes uninitialized:
> 
> drivers/staging/rtl8723bs/core/rtw_security.c:1308 rtw_BIP_verify()
> warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)
> 
> Initializing the variable at the start of the function fixes this
> warning and ensures predictable behavior.

Which makes me wonder how this ever worked at all, if random data was in
those 2 bytes.

Was this tested?  Are you sure this will keep working?  If so, is this
code ever even called?

thanks,

greg k-h
