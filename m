Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3104A39D6CC
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 12:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848401; cv=none; b=St+U7lLIU9zBHDqQszM5oM+dLW3SH+a2iiM85O+ja1XWaXE0C0NupO6efVooJm1dSP4g+0M1Ar1+12hCrXZbA/wg+2FrctowiDPqqrg0w2qR0dwIt4gKWCAwVlLKXcePkfUZaVpwXEAxPo6w2bn8fDcTUqEACOT5Humu4gx2wOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848401; c=relaxed/simple;
	bh=nsX53Jr1DZH6CN2CVi3DdkhEahLo7XxxSdqnsuJPDUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXCvYk0YsFjo0awHnBXINyYv7cQ//bv/8BQi2ECMjjLIpRFweiM88TiQrKaOJCUeSuXxjzFo78nzk5hBV3FrAXVD0vJ4zbLzj+h3Y9UvTTH16ZA53octUFXLEw5Ft880BQbOsnZMvaDWmmBbREmIK3qsw+CnKYutIa1Jkuhwqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SIAm2qUw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SIAm2qUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B95C2BCB0;
	Fri, 15 May 2026 12:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778848400;
	bh=nsX53Jr1DZH6CN2CVi3DdkhEahLo7XxxSdqnsuJPDUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIAm2qUwS2Ka/Xn5iCKqAGYQHYqJANvbg982Tj6g+Vtm8X7EGe9ZIpMkWwpNGr5x1
	 gGPaT/3mEKSm1qYhra3JGSKmfQjFNKtLK9EQcpTP8sTymhLQw2ZiAh5mQDmKURCVYa
	 lLaEFWCyR44UTpESDPTaYli8z46YdO9fWpmcD1XU=
Date: Fri, 15 May 2026 14:33:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: rtl8723bs: reformat rtw_efuse_read_1_byte()
 signature
Message-ID: <2026051503-crudely-mossy-19f9@gregkh>
References: <20260515013353.61614-1-mokshpanicker.7@gmail.com>
 <2026051520-unbaked-perjurer-bfd4@gregkh>
 <CAK0z5OmSunDp2xVhwEcy+gYz7KCXPihSV3R4zLn-ia39Lbtirg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK0z5OmSunDp2xVhwEcy+gYz7KCXPihSV3R4zLn-ia39Lbtirg@mail.gmail.com>

On Fri, May 15, 2026 at 05:37:24PM +0530, Moksh Panicker wrote:
> Apologies for the confusion. I sent a v1 series earlier and then
> resent as v2, both ended up on the list. The [PATCH 1/4] subject
> was a mistake on my part; this is actually a 3-patch series with
> no cover letter. I'll make sure to number them correctly and
> include a cover letter in future submissions.
> 
> Should I resend the series as v3 with the correct numbering
> ([PATCH 1/3], [PATCH 2/3], [PATCH 3/3]) and a [PATCH 0/3](PATCH 0/3 being
> the cover letter)


Yes please.  Also please don't send html email (the lists reject it) and
don't top post :)

thanks,

greg k-h
