Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA3F2C81
	for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 08:12:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37ACC61057;
	Wed, 10 Nov 2021 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636531959;
	bh=hOElsn9o0XHWX7llXiy9jQT7NSmeSlmSgpbdWccwyac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAVOdcMtoGgoVD6OdatAhX/b33DPVo8aDz+DlDTxkyceQH5V+I6VQ6Wqh8Z2d9sIC
	 ucg36FIFR70uVzkOMOU1RWf6JiZzxksUteoqaPcekKKxCdjYrJPevQsWOrpcRd28Qr
	 pPyyfLfb7J67VIpsnAFnTqmthrkJsiFWuTZa/72g=
Date: Wed, 10 Nov 2021 09:12:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: cgel.zte@gmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] staging: r8188eu: remove unneeded variable
Message-ID: <YYt+9d9Jn0SBocVC@kroah.com>
References: <20211109115307.133100-1-deng.changcheng@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109115307.133100-1-deng.changcheng@zte.com.cn>

On Tue, Nov 09, 2021 at 11:53:07AM +0000, cgel.zte@gmail.com wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> Fix the following coccicheck review:
> ./drivers/staging/r8188eu/core/rtw_cmd.c: 66: 5-8: Unneeded variable
> 
> Remove unneeded variable used to store return value.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

But this is coccicheck finding the issue, not the "Zeal Robot", right?
A script that just runs scripts already in the kernel tree does not mean
that an entity is deserving of an email address and reported-by tag,
right?

thanks,

greg k-h
