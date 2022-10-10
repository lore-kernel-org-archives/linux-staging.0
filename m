Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C6A1FD9
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 06:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0100C433D6;
	Mon, 10 Oct 2022 06:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665382942;
	bh=eU6nKUGRICKBPqnh8VlPl5I90p3qXrHPn9KVy3p8Wqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEfO3gHb80kHnvl6D2XTXYxjI0ALQtEYiyS/FSVrfgB7xyyLbdnkTFowyQd6AD8p8
	 oIMicDWuLAILcgn5X0EyzRvaC2nflcsTKmFOr25TWz2l/7vdhU3puvBtbj4qC8cwOn
	 1vY4Vq/6m8qseY50lN1rBUs37PSA9uD5mZkgJTrs=
Date: Mon, 10 Oct 2022 08:23:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yi Jiangshan <13667453960@163.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiangshan Yi <yijiangshan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>
Subject: Re: Re: [PATCH] staging: rtl8723bs: fix spelling typo in comment
Message-ID: <Y0O6SckZK8a9FNG2@kroah.com>
References: <20221009065647.2635700-1-13667453960@163.com>
 <Y0MROo7YMrVoYyZ8@kroah.com>
 <382427df.1d30.183bfdca4b0.Coremail.13667453960@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <382427df.1d30.183bfdca4b0.Coremail.13667453960@163.com>

On Mon, Oct 10, 2022 at 11:07:31AM +0800, Yi Jiangshan wrote:
> 
> At 2022-10-10 02:21:46, "Greg KH" <gregkh@linuxfoundation.org> wrote:
> >On Sun, Oct 09, 2022 at 02:56:47PM +0800, Jiangshan Yi wrote:
> >> From: Jiangshan Yi <yijiangshan@kylinos.cn>
> >
> >Then why is this being sent from a 163.com address?
> >
> 
> >What is wrong with using your real mail server?
> 
> 
> There is a problem with the company's mailbox, and sometimes I can't receive emails. So I temporarily use my personal mailbox to send patches, so that I can receive feedback from the community in a timely manner.

But how do I know that this is a valid company email address at all?
It's not authenticated as such, so many companies do not like people
faking their address.

Please send from your company address and you can always cc: the 163.com
one, right?

thanks,

greg k-h
