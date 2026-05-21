Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D911366822
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354709; cv=none; b=gG6hMHA89qFQXyJPC5lDzOIUBIjfqF3kSc1pd+i5SBd+7j9OJ+qOiiIR4uMI95f7nsL0B6xUhidDuH/D29+qWVfiHUzx7rVgMaq+6mPFqpjKgmUTiq6AAzUzRHZKbhaBLLi319mjdL0OKYqajgqgvCdEgiMSENuaRs5bqc3MjSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354709; c=relaxed/simple;
	bh=lIRSqEJjD2GoMY6Y9gSmPc/UOkiBEeLDRw6vSTC65mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aiz4KUqavLSe/WMQcbgIkXwhuR7Bs/rMm61uYFCnBjHKADm5lgxD/rUk/w09wNBM90vgMaF9zqZCrf98PXbNZLMH0vK+9KPDMqpC2TzVAedV3A3g8IpqT2cU7b280sh3FZh7gSrEdQROAFtLWQCGOsF/GT9wfiwPilvhpSNEEAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bVG+Z1GI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bVG+Z1GI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845CE1F000E9;
	Thu, 21 May 2026 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779354708;
	bh=lIRSqEJjD2GoMY6Y9gSmPc/UOkiBEeLDRw6vSTC65mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bVG+Z1GIt4dS51k0mM6bDO+ESrYcasB9pnehQaqBkUrqCw1REQQOPCqd+s4lz/gDd
	 9ogZE0lrRhuhEFOH3Wgf3mBNJx4ex5g0ZDRQE+16AvrU9wdTD+D1kttjxpmZCPROjh
	 N0Hd+DKmGvQ9LOoSdLBpbBUEbZw+UpX089cDLMPw=
Date: Thu, 21 May 2026 11:11:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jennifer Guo <guojy.bj@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: sm750fb: rename CamelCase variable pvReg
 and drop prefix
Message-ID: <2026052129-sudoku-stimulate-756d@gregkh>
References: <20260511174124.5345-1-guojy.bj@gmail.com>
 <20260511174124.5345-2-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511174124.5345-2-guojy.bj@gmail.com>

On Mon, May 11, 2026 at 10:41:23AM -0700, Jennifer Guo wrote:
> Renames the CamelCase variable 'pvReg' in struct sm750_dev to 'vreg'.
> Dropping the pointer prefix 'p'.

Why are you keeping the prefix "v"?

Please don't keep the "hungarian" notation at all.

thanks,

greg k-h
