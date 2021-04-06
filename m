Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF2A70
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 14:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4A8A6139C;
	Tue,  6 Apr 2021 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617718367;
	bh=pcziQPHW1TqS0kWxpYxP9neRIebp6sZAONItqnbfQvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdFawesu53kdwMYki+QYg5Bso5YqGTCFpROshhmtT4kuZCLKQ0VG1OPQhi/eB6zhz
	 2G3/wPjNSfuOdfSHAK+PxgQTmAZ8BlUpVFRhQ3W7utBYiH1qoz+FspI8B5EPgTdluY
	 e6u9GyNQIbzYX7pPVNff0eyhIIue0MnR8eF/wjhw=
Date: Tue, 6 Apr 2021 16:12:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [PATCH v2 2/2] staging: rtl8712: Remove extra blank lines
Message-ID: <YGxsXMonD5TvtUyB@kroah.com>
References: <cover.1617710602.git.zhansayabagdaulet@gmail.com>
 <f61f6d330bc3fa53d4d420754d1d461b6cfcb2de.1617710602.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f61f6d330bc3fa53d4d420754d1d461b6cfcb2de.1617710602.git.zhansayabagdaulet@gmail.com>

On Tue, Apr 06, 2021 at 06:09:58PM +0600, Zhansaya Bagdauletkyzy wrote:
> Remove extra blank lines after an open brace to adhere to Linux kernel
> coding style.
> Reported by checkpatch.
> 
> Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_io.h   | 1 -
>  drivers/staging/rtl8712/rtl871x_mlme.h | 1 -
>  drivers/staging/rtl8712/rtl871x_recv.h | 1 -
>  drivers/staging/rtl8712/sta_info.h     | 1 -
>  4 files changed, 4 deletions(-)

This does not apply either :(
