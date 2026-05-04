Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF833D6CAF;
	Mon,  4 May 2026 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906583; cv=none; b=BB8dsbDfoP7qZX3hJyIEQpjUidyh7moAWLN9WethMXn14uyg0DAsh0V3l8PMJPvZvv77vErKuWfJA5+18b/5/7JjUclBGfCOVNoTmkXhDn2hfCyiy9zP6I8oZ3XGZOy8T71MKz17hbZ8fEdqYGXwpKx0+y4xoFgcTY+o9AGE8/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906583; c=relaxed/simple;
	bh=OMa+PW8rNJuqoeSB6MroRicoWmkA5SOqhlT+psuymAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brdfyQOYEledC4KWYWzBHkIIbzfMEppcv6m7negQUc+xC7twUgSoXDkB4+B3iXeD2coh9XZc0Ist4pSqiAJjtpsJJBvF1mv6XQiN9hD/MyLSbGtkpKx/ZhyLfAFZpzTV3rLDeM73pqyEpz89m2+VuPw+RWXXLs6V+cxXOS8u1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MyayezfJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MyayezfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D268C2BCC4;
	Mon,  4 May 2026 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906580;
	bh=OMa+PW8rNJuqoeSB6MroRicoWmkA5SOqhlT+psuymAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyayezfJxOwY/vkKj8u/Uz4Cc+cFl7REfktW47Oqs33JRMLvvGo4D58JrJmhg4Evh
	 YkHyH4UNBMpyhStgJs+k8Kt4MVT7I/vk7SXN19+6ggyl+NEyvIqILXFftLiERzhwPj
	 qp1J7taGQaRgvMJ2XEItUvO0gJoBNSejyfOxugZk=
Date: Mon, 4 May 2026 16:15:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org,
	johan@kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: uart: clear unsupported c_cflag
 bits in set_termios
Message-ID: <2026050413-smell-ramp-e2a6@gregkh>
References: <2026042618-whole-cassette-b15e@gregkh>
 <20260427045446.16430-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427045446.16430-1-debjeetbanerjee48@gmail.com>

On Mon, Apr 27, 2026 at 10:24:46AM +0530, Debjeet Banerjee wrote:
> gb_tty_set_termios() derives UART line configuration from a subset of
> termios->c_cflag bits (CSIZE, CSTOPB, PARENB, PARODD, CMSPAR, CRTSCTS,
> CLOCAL and CBAUD). Other bits are not interpreted by the driver and are
> not represented in the Greybus UART protocol.
> 
> Mask unsupported c_cflag bits so that userspace-visible termios
> reflects the supported bits implemented by the driver.
> 
> This addresses the existing FIXME.
> 
> Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
> ---
> v2:
>   - Clear unsupported c_cflag bits as suggested
>   - Update comment to mention the change

Has this been tested?  If not, I'd prefer to leave this as-is until it
can be.

thanks,

greg k-h
