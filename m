Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77623D7E6;
	Wed, 28 Jan 2026 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596266; cv=none; b=cdyw3VUwFW4Kgo145bjWfRS4nW2J4eEN0eHNiEdxy+HzxCips5mLbUL1VAUvvp6ka/54ncAe1FNlnO3GCCEH0wktPpC9kMc5DiBFlZ3l9pc7iACl8KTB/LLMkvKG+rUYwbaJFXLFAXR0ONn4IiTKFA774OC/HiluTTFeNgUrJYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596266; c=relaxed/simple;
	bh=78bCOhDqXr8bBF3xtZQoWwDzVfmysLcx2Uqt3RQB1lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdKxP5oT0xYV6Z2xkYpunPUFXEDz8CtkS3kmG45J8p/yF+4KrU9KdxRW69Wno5OtKX+2zDXc+fwXwDToHcBzkpKu18QWro70RkicSZoskrL1Ez66V9nUhTsWNBuJRtzhi1JnwI0WLtMoLWo+Hs9Fy1kdX4GsnQ2gGDETAu5LsaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SC/VQpM6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SC/VQpM6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE919C4CEF1;
	Wed, 28 Jan 2026 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769596266;
	bh=78bCOhDqXr8bBF3xtZQoWwDzVfmysLcx2Uqt3RQB1lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SC/VQpM6pyPSvs33zscIlvRraQPRm489bWZxpkrOqS/c3sSe87DzW8xc3nEe9IWAX
	 PCcB+QlDgky5osGZ1tZKu5OYZIM5DPsuzwvI3BK/UAZyk80aKYxUD4OtjNnU1BC5Yk
	 jtCftlvjO42aSZt389AhfXS8TqO/1J8T0/0FDEoM=
Date: Wed, 28 Jan 2026 11:31:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: MADHU ANAND <madhuananda18@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: replace magic number with jiffies
 timeout
Message-ID: <2026012844-gazing-shawl-1662@gregkh>
References: <20260127164816.91481-1-madhuananda18@gmail.com>
 <20260127164816.91481-2-madhuananda18@gmail.com>
 <2026012818-landmass-cattle-d8c2@gregkh>
 <CAPn_1uMTAJYCWE08qd-abag77pDUu52yFsNu_x5=zGPL5b8n+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPn_1uMTAJYCWE08qd-abag77pDUu52yFsNu_x5=zGPL5b8n+g@mail.gmail.com>

On Wed, Jan 28, 2026 at 10:18:07AM +0000, MADHU ANAND wrote:
> My apologies for the private reply and the top-posting. I am resending my
> responses to the list now and will ensure correct formatting going forward.
> 
> You're absolutely right. I over-engineered the implementation and added
> redundant comments that shouldn't be there.
> 
> To address your points:
> 
>    1.

Sorry, I don't have much context here, you seem to have removed my
responses and the original patch entirely :(

Remember, some of us get over 1000 emails a day and context in an email
matters to know what is going on.

>    I used 1 second (HZ) as a safe upper bound, but since I don't have the
>    hardware to verify the original loop's speed, this was an assumption.

If you are changing timing loops, testing on the real hardware is
essencial.  Please don't do any sort of logic changes like this without
being able to do so.

thanks,

greg k-h
