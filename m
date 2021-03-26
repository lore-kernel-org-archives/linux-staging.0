Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC670
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 14:06:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5307161A24;
	Fri, 26 Mar 2021 14:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616767608;
	bh=NpksNz9lLbsAzvUd77qXzLFZ99XN7ephdBncdUikFNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4HbYzX+U6lZc3JTBVKSLzrAltmTmG3rht0aUgXUpbPQQkj9ARzmcbuxn3yeYu4SB
	 SFtyZH46CvZwsxuLLOW4/FO2ho9BdbQV07w2X+y6CUwp3PSH4vzYkYnQ621PxA/7ps
	 fkrf4zPKnh+L/Uhajyj7IJSAJ85T5GCaIES7xcpw=
Date: Fri, 26 Mar 2021 15:06:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix indentation broken by previous
 patch
Message-ID: <YF3qSsH/3vRy7BRy@kroah.com>
References: <YFxQSJXXQ4dFPGS4@mwanda>
 <20210326091716.6599-1-fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326091716.6599-1-fabioaiuto83@gmail.com>

On Fri, Mar 26, 2021 at 10:17:16AM +0100, Fabio Aiuto wrote:
> fix indentation broken by patch removing conditional
> code blocks checked by unused
> CONFIG_INTERRUPT_BASED_TXBCN family defines
> 
> https://lore.kernel.org/r/9157000821fd6febf25566b8c712fad1995c7c78.1615907632.git.fabioaiuto83@gmail.com
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>

"previous patch" is not very descriptive :(

Please put a "Fixes:" tag in here to point out exactly what commit this
fixed, and maybe a "Reported-by:" tag if someone pointed this out to
you...

thanks,

greg k-h
