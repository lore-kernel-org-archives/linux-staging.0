Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CB331578E;
	Mon, 18 May 2026 05:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081133; cv=none; b=Yd8mu6R5V+GrnMTpjOfYwCCUh0v4qQIkAgagIBHQ+rL0Xf4ORQWxP0vCn1CsGjtuFgZEetRI/WOCCuHQRjg7H6mls6dB4/LSGhRIJNcC4tHj9KcHnZg88YOHHS9R2HykpK5D8J6PlGG2sReopzfOwgLGrZKuqMPKfWtbCr/lMzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081133; c=relaxed/simple;
	bh=GTDZ/hhMBNN2Y5L38IZ07C1tBf4GgmxqLOjWAyanebI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AijIUryuXxNdTzQBfEk8V76TbrpSTiH9+baynBiN2j01H7PWLSBpcV4I+JQGKOal8XQ6t8cXNW9Bi9CJbc+oWnQ5EtlwBhjJjPbk2pkWaPI3wVDLau7MSadRvOej1VGbmgBE7tuA/agYmQnBqlHekt0g31hiK6yniiscOSSwngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cZDA8I7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cZDA8I7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3CDC2BCB7;
	Mon, 18 May 2026 05:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779081132;
	bh=GTDZ/hhMBNN2Y5L38IZ07C1tBf4GgmxqLOjWAyanebI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZDA8I7M5hBomxlPzpQPma9snXLi4UUWwSvQ4IRX3NIr02B0+tlmpOITFRabAWRhL
	 dAw6gsQGWEALNIMk90YroxcdechfOwo/uHazXOsC2RD8LYWVVdTKt/KsAGDSHDFAur
	 r4iXNW7VV+7MTZIDb2B/ogthqBg+nOZeoGD4KoA0=
Date: Mon, 18 May 2026 07:12:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: shxyder <darknessshayder@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: octeon: fix carrier state, null guard, and
 modernize phy ioctl
Message-ID: <2026051852-attempt-say-7acb@gregkh>
References: <20260517141955.79666-1-darknessshayder@gmail.com>
 <2026051706-grab-overstep-66d4@gregkh>
 <CANy=CjfYXx+S0o7R60TDkm6ZLifsJ9P4nDoy9JPKvWB0NpgBBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANy=CjfYXx+S0o7R60TDkm6ZLifsJ9P4nDoy9JPKvWB0NpgBBg@mail.gmail.com>

On Sun, May 17, 2026 at 11:44:20AM -0500, shxyder wrote:
> Hi Greg,
> 
> Thank you for the feedback. I will split this into separate patches, one
> change per patch, and resubmit as a series.
> 
> Regarding testing: I do not have access to OCTEON hardware, so I have not
> been able to runtime test this. The changes are straightforward — adding a
> missing netif_carrier_off(), a null guard, replacing phy_mii_ioctl() with
> phy_do_ioctl_running(), and zeroing a cached field on stop. I should have
> mentioned this upfront and I apologize for not doing so.

It also looks like you did not test-build your patches, which is
generally always a requirement :)

thanks,

greg k-h
