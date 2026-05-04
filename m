Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DCD3DEFE1;
	Mon,  4 May 2026 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906565; cv=none; b=sPjwCDI9udeg64a+9ybf2JcKRj+aOIp5bYN7GQRsVjWXemMcE1YoMfFp91FLQdyS0cnpy8oXJvuLrm1dbaYODIHncJ2f6b81cCxeCzEFmQk0wPMhcbk4dHapmFrv0qwDtmF6u0U1kX03oz4bFGJyNQWlO69Rp5dNylHWU/6Z84k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906565; c=relaxed/simple;
	bh=eRX5ptcFNVTZhmHb5NiiWH0vugoGbXXUqAAIlFAFR+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ct3OpdhPOh8xk/vvkAkxDlOd5/eyL6ANRailzEy/oCpy2dwafv8p+b1/1MBIng6v55nndYNzfCOdcoF2QAHR4iZ1B67LZ8HEHx/Wip/HsuJelYUzBzgR4rdlYts0XM7wZqNIb/f/IYWN1/yvdmvhVCXWNgEKrzJOWEx341CTuhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FRkk784A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FRkk784A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFD6C2BCC4;
	Mon,  4 May 2026 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906564;
	bh=eRX5ptcFNVTZhmHb5NiiWH0vugoGbXXUqAAIlFAFR+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRkk784A461dRbRnCMy1KFfI4eb2Zy8GbaaONEIyjHNLl7l6kvlyfP5vEDUFi7ZmC
	 hAxF7auCCCfAq7/30f8MCHJ53Jg2qXoqTpBiVFrEbp2ySIP4HNMKs/FjH7VpUNd2QM
	 C0kWF4B6KoIH8eECwQZjoPjsrmXV8i/Os28blda8=
Date: Mon, 4 May 2026 16:10:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, stable@vger.kernel.org, luka.gejak@linux.dev,
	hansg@kernel.org
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: fix heap overflow in
 OnAuthClient shared key path
Message-ID: <2026050453-scorer-rebate-3898@gregkh>
References: <20260415094505.1115208-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415094505.1115208-1-hossu.alexandru@gmail.com>

On Wed, Apr 15, 2026 at 11:45:04AM +0200, Alexandru Hossu wrote:
> rtw_get_ie() returns the raw IE length from the received frame, which
> can be up to 255. This length is used directly in memcpy() into
> chg_txt[128] with no bounds check, allowing a heap overflow of up to
> 127 bytes when a rogue AP sends an Auth seq=2 frame with a Challenge
> Text IE longer than 128 bytes.
> 
> IEEE 802.11 mandates the Challenge Text element carries exactly 128
> bytes of challenge data. Reject any element whose length field does not
> match sizeof(pmlmeinfo->chg_txt) (128).
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Cc: hansg@kernel.org
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> Apologies for the version numbering confusion across previous iterations.

Please address the review comments found here in your next version:
	https://sashiko.dev/#/patchset/20260415094505.1115208-1-hossu.alexandru@gmail.com

thanks,

greg k-h
