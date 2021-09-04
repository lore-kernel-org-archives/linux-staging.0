Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4313FC0
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 07:34:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C9F260F38;
	Sat,  4 Sep 2021 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630740850;
	bh=BBgdDw2pbrzGmdbh2uLjiJOpUEwB831X9jZZ+sjK8Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQAgZjSHQWBSlWGRABAE8n7AdkcGh7hnbOeNZt+tMCYfAscjPUYDdeITvwnsgdIeX
	 4ZexBxh7DvzsjsF+NGx4ZJ6qAIyZNBjuxTDglPB8QXGTO0adqwz6QJqbCE4nR0j3Au
	 J7UDwofXmu/iKsEDgQLiiEFdNtd+BJD4aCbolREc=
Date: Sat, 4 Sep 2021 09:34:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove _rtw_mutex_{init,free}
Message-ID: <YTMhcMSqWCepQMMT@kroah.com>
References: <20210903193356.31927-1-paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903193356.31927-1-paskripkin@gmail.com>

On Fri, Sep 03, 2021 at 10:33:56PM +0300, Pavel Skripkin wrote:
> While testing Fabio's patch I hit lockdep warning about possible
> deadlock:
> 
> [  252.063305] WARNING: possible recursive locking detected
> [  252.063642] 5.14.0+ #9 Tainted: G         C
> [  252.063946] --------------------------------------------
> [  252.064282] ip/335 is trying to acquire lock:
> [  252.064560] ffff888009ebad28 (pmutex){+.+.}-{4:4}, at: usbctrl_vendorreq+0xc5/0x4a0 [r8188eu]
> [  252.065168]
> [  252.065168] but task is already holding lock:
> [  252.065536] ffffffffc021b3b8 (pmutex){+.+.}-{4:4}, at:  netdev_open+0x3a/0x5f [r8188eu]
> [  252.066085]
> [  252.066085] other info that might help us debug this:
> [  252.066494]  Possible unsafe locking scenario:
> [  252.066494]
> [  252.066866]        CPU0
> [  252.067025]        ----
> [  252.067184]   lock(pmutex);
> [  252.067367]   lock(pmutex);
> 
> There is one problem with this warning: there is no pmutex in this
> driver, *BUT* all mutexes are initialized via private _rtw_mutex_init
> API, which had struct mutex *pmutex argument.
> 
> So, all mutexes in this driver had same name in lockdep map. Of course,
> lockdep will complain about any nested locking.
> 
> Fix it by open-coding _rtw_mutex_{init,free} wrappers, because we do not
> need them at all.
> 
> Cc: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")

No need for "Fixes:" on this, as it's not a bug, it's just a badly
designed implementation.

thanks,

greg k-h
