Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B01390998;
	Wed, 13 May 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668655; cv=none; b=d108xmCcwCXtRDT0jC3WOzxGmesxoR7A8z5BfR2IGOsGZ6N2xTwct9pbfK0SLjxblOdn9XOWlq92UnBVKuIPDcrZ36bbCnrhS+AS8UxjjR0AgH1GKhsV7dq4BpcwZv9ZTQOwKnggqYDTXhavvTHK6N7UkEFDkz7QhRfFUosyGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668655; c=relaxed/simple;
	bh=7lLHw/tq9WptnGccyFjuybNXgQfowqreDcImWIMil3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccEz/II5kkj1PHr0M+0QlzkC8QU5WCjO58o8Sl+d8k2D+p0PSiLgDULNp6QOVtlBp9A2o61xLgbMggt36h501C+RWvuTSSdk0kml+BywA0i4laeiY8XRCdSB1Tm1MHQDdcOJZS+ambhk/9a9rjAvNHwGRUfns6A7Hlkq1Pjyyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2PzbQ2El; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2PzbQ2El"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8FBC2BCB7;
	Wed, 13 May 2026 10:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778668655;
	bh=7lLHw/tq9WptnGccyFjuybNXgQfowqreDcImWIMil3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2PzbQ2El/MshaoGMCgpRlTMqHHxBc8RUps2/GtJqKv9qGCg0NPdMpEIDIilwJat+L
	 QwmARYuFOGJ4Ijeba25gG2QGgAkig5Q3HhGxsVuwCof/rF7dyH85TOQk/NNjyTojt7
	 wCGbvm7Q/0G3VfFbvmO5eOD23Zu27TflC/oPQdPo=
Date: Wed, 13 May 2026 12:37:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: andriy.shevchenko@intel.com, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: fbtft: convert sysfs attributes to use
 ATTRIBUTE_GROUPS
Message-ID: <2026051345-calculate-elves-048a@gregkh>
References: <20260513085949.484-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513085949.484-1-shawharshit116@gmail.com>

On Wed, May 13, 2026 at 08:59:48AM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() calls with the correct
> ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
> driver structure so the driver core automatically adds and removes
> the sysfs attributes when a device is bound or unbound.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---
> v4: Fix build error - add extern declaration of fbtft_groups in
>     fbtft.h so all drivers using FBTFT_REGISTER_DRIVER macro can
>     see the symbol
> v3: Remove stray blank line in fbtft_attrs[] array
> v2: - Use DEVICE_ATTR_RW() macro instead of DEVICE_ATTR()
>     - Move DEVICE_ATTR_RW() definitions closer to their callbacks
>     - Remove trailing comma after NULL in attribute array
>     - Use ATTRIBUTE_GROUPS() macro and add dev_groups to driver
>       structure as suggested by Greg KH and Andy Shevchenko
>     - Compile tested with: make M=drivers/staging/fbtft modules

I see too many v4 versions on the list for there really to be just 1 v4
:(

Please wait a bit, take some time, and resubmit a new version after a
few days making sure it's all correct.  There is no rush or deadline
here.

thanks,

greg k-h
