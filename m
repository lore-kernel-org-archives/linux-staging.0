Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D2418A6DB;
	Sat,  8 Aug 2026 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786168003; cv=none; b=Xw1/TVxCwJB8P+M18x0mVqCH55qARB+IFEUTERVcGrzEqjH09V8p/mQTCO/6DVWYtNv3qANzVFdf2IOntvOdSUescp+Ce2+l1VYHVPa4oKIB31JJJ3OTTmaOsc9oJcgwMvBr/L/W8k11llEnG4SMLCFzzeidaTrfkJbr8Y5frGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786168003; c=relaxed/simple;
	bh=uoqjrIWLausWyb7ghdFreIPvYFw78SFliWq4MEpHvBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kz4gUU3Y2AHSgYoJV5GpLY1cul4gWXHPITCTsWDVMmjOBoK9Hm7lidl3kdhfiqcdt6bUViGuiZ1BvqCA2VDGZYfEq7id7UmjAeqMQKN11fiKNRzQaYNR7H1Dea/M+ht/Dbu5IawIIGdYsb85KIyV20zSf2tFdUvv+O0XopKYIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zFvYvQdk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zFvYvQdk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816471F000E9;
	Sat,  8 Aug 2026 05:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786168002;
	bh=sOsK7nYsykRD7zlmPr9VG4DzWMmQw+4iheP/HLR6b/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zFvYvQdkKLre/E4wz5PedaN2yraOV0xlSw8pfzeC+LwLNYn2WQL7/cHUMwv5olSjq
	 18JjMnv7EZIXULAdqlgIhtkBQuEZvfy6y9sBQri7z0FWCnyHOtJZCq4BNlRVGLPjL3
	 jQ3rC+flhttvfBIoPC61JJaWI4yN2cLXyyV3I2Ls=
Date: Sat, 8 Aug 2026 07:46:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aditya Chari S <adi25charis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: usb: fix response buffer size for fixed-length
 hub requests
Message-ID: <2026080805-unsuited-sandy-ed29@gregkh>
References: <20260803010248.339120-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803010248.339120-1-adi25charis@gmail.com>

On Mon, Aug 03, 2026 at 06:32:48AM +0530, Aditya Chari S wrote:
> hub_control() sized the Greybus operation's response buffer purely
> off the caller-supplied wLength. However, per the USB hub class spec,
> GetHubDescriptor, GetHubStatus, and GetPortStatus have a response
> length that is fixed by the request type itself, and can be larger
> than (or independent of) whatever wLength the USB core happens to
> pass down. This could under-allocate the response buffer for these
> request types.
> 
> Special-case these three request types so the response buffer is
> always large enough for the data the module will actually send back,
> matching the equivalent handling in usbcore's rh_call_control(). Fall
> back to wLength for all other request types, as before.
> 
> Compile-tested with 'make M=drivers/staging/greybus C=1', including
> sparse, with no warnings. checkpatch --strict is also clean.
> 
> Note: this driver's hub_control() is currently unreachable at runtime
> since gb_usb_probe() unconditionally disables USB support pending
> separate USB core changes. As Project Ara hardware is no longer
> available, this change has not been tested on physical hardware or
> with a Greybus module; it was verified only by compilation, sparse,
> and code review against the equivalent logic in usbcore.
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> ---
>  drivers/staging/greybus/usb.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)

Cool, what tool was used to find this?  Did you forget the Assisted-by:
tag?

thanks,

greg k-h
