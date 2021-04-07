Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F16D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:22:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2572161363;
	Wed,  7 Apr 2021 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617783747;
	bh=Tstxc5JLVYakU/lU5ERsTLbfDCdAfC8qMyeKum5GBO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUJ4NJlmW7AefWZQBQ2a6oZsnfPLBI/Yun+G57I5SE9souz8+8fE4BEkadHJeJP6e
	 HfqAHbnhXJc+84GcS2VPaptAjTCnq9whIYNTKkY2H9N7d0DjFNXxuMTZj1pzWE5RnW
	 gZUdquuEnXQEzNp5ngJ4K11p40pyCwMrAShGj+kw=
Date: Wed, 7 Apr 2021 10:22:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tian Tao <tiantao6@hisilicon.com>
Cc: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: move to use request_irq by
 IRQF_NO_AUTOEN flag
Message-ID: <YG1rwdRzKk83RBmG@kroah.com>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>

On Wed, Apr 07, 2021 at 02:50:03PM +0800, Tian Tao wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
> 
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Can you wait until that is merged before sending this out to us as we
can't do anything until then.

thanks,

greg k-h
