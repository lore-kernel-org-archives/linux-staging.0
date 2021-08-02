Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7686B72
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 10:36:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92AA960F70;
	Mon,  2 Aug 2021 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627900581;
	bh=jCtcVo0a6ZIZ1p/YHxrosxwqpunLCNXvuqd61Ntba2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/TEZj6sm52qqmKUrqr5v4LRvz6g4HpJonGHifmZIjl9YM3DsRca3i7ODGAyATyDf
	 Sof54yewgwznmItJSpGUsIoEGwB+YULtxXVjCbX82JsuPWZjwhC+tweE/BJozy/+Zr
	 yJ22xFZIWPCsNkmXZNwJk2B886KY+4o8weA9YxH0=
Date: Mon, 2 Aug 2021 12:36:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Subject: Re: kernel BUG in new r8188eu
Message-ID: <YQfKohnSRWHjlht6@kroah.com>
References: <80042e9f-6811-38f3-010b-1c0951ba88db@lwfinger.net>
 <YQThm1A0Up1m4l1S@kroah.com>
 <c2a6746a-24e6-6888-9208-32fccebb3fec@lwfinger.net>
 <YQY/tfJJdBVg/mwf@kroah.com>
 <cef19337-5ff3-c0cd-33ef-4f9990bcd4ec@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cef19337-5ff3-c0cd-33ef-4f9990bcd4ec@lwfinger.net>

On Sun, Aug 01, 2021 at 03:15:52PM -0500, Larry Finger wrote:
> On 8/1/21 1:31 AM, Greg Kroah-Hartman wrote:
> > 
> > I am worried that my "remove the wrapper" logic got something wrong
> > here, so if you could test the revert of that, I would appreciate it.
> > 
> > I think I need to go buy one of these devices so I can test cleanups
> > locally...
> 
> The bad commit was 9ff1cc4ef80e ("staging: r8188eu: remove rtw_buf_free()
> function").
> 
> Looking at it, the only difference between the original wrapper and the new
> code is that the wrapper zeros the len variable before the kfree() call, but
> making that change did not help. Reverting that patch restores the old
> behavior.

Ah, doh, that was my fault, sorry, that patch was incorrect (odd git id,
don't know where that came from, it's a different id in my tree.)  Let
me revert this commit and then will redo it correctly.

thanks for finding this.

> There are lots of these on Ebay from $2.47 up with free shipping!

Any hints on the name for how to figure out which devices are supported
by this driver?

thanks,

greg k-h
