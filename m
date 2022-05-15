Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52523806
	for <linux-staging@lists.linux.dev>; Sun, 15 May 2022 10:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B50C385B8;
	Sun, 15 May 2022 10:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652612150;
	bh=eMzgbuvzHahLRRnZiAI5LEHuxl1LzYgVFGtZA2pB6tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvYbqowRbwZoV4bF7hG1pAbBnSdM08U6VcUIEYA9GhPplOBrU55E+ph4FeU1cClds
	 8fH9eHRZ43hkBRgRLr2SIVkkwXy4Csj1hUUkTg+mpq0AMG78j0E71JuJHjypQrXeJs
	 wfD28+g9vm0soGoo7nwFnHscVlxlnZ5rUetw4EzY=
Date: Sun, 15 May 2022 12:55:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?WWHFn2FyIEFyYWJhY8Sx?= <yasar11732@gmail.com>
Cc: paulo.miguel.almeida.rodenas@gmail.com, dan.carpenter@oracle.com,
	alexandre.belloni@bootlin.com, realwakka@gmail.com,
	u.kleine-koenig@pengutronix.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: pi433: Don't use ioctl for per-client
 configuration
Message-ID: <YoDcMmcnbPjk4uuV@kroah.com>
References: <20220515104711.94567-1-yasar11732@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220515104711.94567-1-yasar11732@gmail.com>

On Sun, May 15, 2022 at 01:47:11PM +0300, Yaşar Arabacı wrote:
> Currently this driver uses ioctl for reading/writing per-device and
> per-client configuration. Per-client configuration can be handled by
> usespace and sent to driver with each write() call. Doing so does not
> introduce extra overhead because we copy tx config to fifo for each
> transmit anyway. This way, we don't have to introduce new ioctl's.

Wait, you just changed the user api of the write/read call to the
driver?  That's dangerous, especially:

> This has not been tested as I don't have access to hardware.

That's not good.  You need to figure out what userspace tool(s) use this
api and ensure that you did not just break them for no good reason.

thanks,

greg k-h
