Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11514396D2B;
	Mon,  9 Mar 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075160; cv=none; b=TziIHnaV5y86RExlhoNRONwV7usYfauS7mc23DLEIfJI5DC0WghDPULEKrmMA3grwda5c9roFeCoctGhVlChzoxV/GyNKH2tdAjfmxK8mX8cWHXvbSIz2MczJ4KBXYBX0L6pYh335Y32qM4vQ9WxzJbq+ynb+WnyuUgL6xSl4b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075160; c=relaxed/simple;
	bh=JQt4qAx3Jxr4+iM+qBv79YB46wo4JlR7bsey2FBKCCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjaZAoniitc95C6l/zw7lUZXy9QfREqkF+mIDeXZRSaHRYnt6DmRrItGu2YMBLLnS5TCtHJ4UUqCNvwkS73IhLJgoib7sincdDcWFoSGAN6ssTCky2/QyUK5/EzkgDg8SRRaO0LOvQGxj5bzyxOWF6aXEb3avY1+AzegplMxIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X4WKXwxK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X4WKXwxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB6DC4CEF7;
	Mon,  9 Mar 2026 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075159;
	bh=JQt4qAx3Jxr4+iM+qBv79YB46wo4JlR7bsey2FBKCCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4WKXwxKNnbpK/ZdcK8+KSCV7VaEO8UvxTXhxQl1jeK8Dijnpwcz14Jex8C3J6VPZ
	 1Q0GtAjPMr4uiXgAerqWi+hxNX/+quB+nkpi5MsF13X8UY9mBNPLLFTwWtYOVWJOSl
	 aMXGjGL/bcRGfxfbYspQwSgK6xRb98bHD7p5mLu4=
Date: Mon, 9 Mar 2026 17:52:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dipesh Chaudhary <me@dipeshchaudhary.in>
Cc: khushalchitturi@gmail.com, dan.carpenter@linaro.org,
	abrahamadekunle50@gmail.com, ethantidmore06@gmail.com,
	rfp2005@gmail.com, arthur.stupa@gmail.com, mingo@kernel.org,
	lizhuoheng@kylinos.cn, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: add missing blank line after
 declarations
Message-ID: <2026030915-motive-wizard-d038@gregkh>
References: <d215ce3a-ddfe-43f0-8193-5890650d8c33@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d215ce3a-ddfe-43f0-8193-5890650d8c33@smtp-relay.sendinblue.com>

On Mon, Mar 09, 2026 at 01:04:37PM +0000, Dipesh Chaudhary wrote:
> 
> Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
> to satisfy checkpatch warnings and improve code readability.
> 
> Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 1 +
>  1 file changed, 1 insertion(+)

You sent 2 different copies of this patch?  Which one is correct?
Please resend a v2 that shows what changed.

thanks,

greg k-h
