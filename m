Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777029A9
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 14:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E041C433A4;
	Wed,  5 Apr 2023 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680705480;
	bh=TAtG4B5tFiggBEsy4rhkDWycj6tfQMutZHeZjsUAWWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAOcfidP9OBCM8O8X1pqT3yVrK/CjqtrpGu0qFaZzlWtFvqi66komKn+M0l/eYnUa
	 gMsv8ORRrzfiV5i5CLKLbOzfUU0ZpB/iXxInWVUgfORRl25wPJsc32KHW/10QwR1Ol
	 /arQFNgwUFg27BVZQxr9WLlPT7H83U/0obVTyXqg=
Date: Wed, 5 Apr 2023 16:37:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG] staging: rtl8192e: oops occurs when finding hardware
 rtl8192se
Message-ID: <2023040521-angelic-emptier-1367@gregkh>
References: <39dc735c-fd6d-e405-856c-788a52704d63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39dc735c-fd6d-e405-856c-788a52704d63@gmail.com>

On Sun, Apr 02, 2023 at 05:00:13PM +0200, Philipp Hortmann wrote:
> Hi,
> 
> when I use the hardware rtl8192se the driver
> drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko detects that it should not
> run on this hardware and aborts.
> But when the driver is freeing the resources an oops occures. Find oops at
> the end of this Email.
> 
> When I comment out the following lines those errors disappear:
> cancel_delayed_work_sync(&ieee->hw_wakeup_wq);
> cancel_delayed_work_sync(&ieee->hw_sleep_wq);
> cancel_work_sync(&ieee->ips_leave_wq);
> 
> When I do an init before the cancel:
> INIT_DELAYED_WORK(&priv->rtllib->hw_wakeup_wq, (void *)rtl92e_hw_wakeup_wq);
> The oops are gone as well.
> 
> When I use cancel_delayed_work() instead of cancel_delayed_work_sync() it
> also works.
> 
> Can somebody give me a hint what the expected way is to solve this?

Is this a new thing, or has it always been there?

Why is the driver loading if you don't have hardware for it?  Or are you
manually loading it?

thanks,

greg k-h
