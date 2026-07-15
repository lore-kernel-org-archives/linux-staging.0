Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC136F434
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124755; cv=none; b=gg4ukEBVfyqpkAkS13MXZrGfcmc1KcCCcr/Ad8BgXH+whMedXpUynQEFnQ4n5FkXlcrxCELRaAFNUhAl9cviApXwYCKpuUPPxNR2KRnQxvv9Ej3C7q0PTzGz+qbrJQccVkYbqrJSyzEIW0dZFz62NRPvfKPs0WvAq/R+eAYhIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124755; c=relaxed/simple;
	bh=PFIdls6l5Hb/HT5IwkBcYt8uCYSmoGHG5+tYsGbv7ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmOgV37eAqfrQbRXG025Ik9dlupmTlat5SvUX4un1TxEl2daQGKo7r85aGOd7sOo2GN0SFD4Vv4r58nBg5lu3A1yKP4lr30QshluzcwSyX6o9IAnEyIJSq6t8cc+1SEXhlLaA1s3UQxs+MhrCL/2Xtn9P61B1p1q+CrtNz77yFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s6xX9Uhx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s6xX9Uhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DE51F000E9;
	Wed, 15 Jul 2026 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784124753;
	bh=JyIVraV3dhUCWzsE1D9X0cC6ePGQG0DTma6G7oQHCRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=s6xX9UhxnaiXCCytDPiQwxSHqO4NV2Y+YFE5RgdE6Ozxmkjrr7XeXeVoD8tEdJBGs
	 rrKv1ZW2Oin4vYFTFyA5A5vvlV5M2wNUHLoq69mi+HfXYSuTt1GLKLiU49ONSVkLvB
	 8/baezvGUYrtqVcS9xI4RVpmFyMtm9oD8X0AxwQI=
Date: Wed, 15 Jul 2026 16:12:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?0JDRgNGB0LXQvdC40Lkg0J/QsNGJ0LXQvdC60L4=?= <ulijg308@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: rtl8723bs: rename ReadChipVersion8723B to
 snake_case
Message-ID: <2026071543-king-bronchial-1f9b@gregkh>
References: <CALVCEwaxiiPEc76COZkKeCVLppamx=Z6LOVj=5w8fHXAaUTJCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALVCEwaxiiPEc76COZkKeCVLppamx=Z6LOVj=5w8fHXAaUTJCg@mail.gmail.com>

On Sun, Jul 12, 2026 at 09:42:39PM +0700, Арсений Пащенко wrote:
> >From 51598f4093b689f19369277ae77dbd1d9d15ab53 Mon Sep 17 00:00:00 2001
> From: Arsenii Pashchenko <ulijg308@gmail.com>
> Date: Sun, 12 Jul 2026 20:15:48 +0700
> Subject: [PATCH 1/2] staging: rtl8723bs: rename ReadChipVersion8723B
>  to snake_case

Something went really wrong with your patch submissions.  I see multiple
messages sent, and no versioning and no linking between patches 1 and 2.
Take a look at the kernelnewbies.org tutorial and please try again.

thanks,

greg k-h
