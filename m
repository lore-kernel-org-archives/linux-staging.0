Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D459470
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 08:37:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C681A61004;
	Thu,  8 Apr 2021 08:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617871042;
	bh=gTRJUY1qblXJejgz2sywV+BWhoT7K1wnHBT96srPwq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V6GxBF5jSNseCmswWdYSFXiLQuH+aG/A37oCuSEAh7CmY2C6N1PC84DplxdY3O1ui
	 NStz0KauMpzYzjj+qboizZE4QjEjFtgeKAg2sQTmsaEDPk4JoebI/ogPE/QYCw5vov
	 OUZS4GRsv3lRdgaukMhB/Mf4Up4YrjfZyukaYt/w=
Date: Thu, 8 Apr 2021 10:37:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH] staging: rtl8712: removed unnecessary blank line
Message-ID: <YG7Avz5/iaSynCwX@kroah.com>
References: <YG61JYTdl1HQKcGj@kali>
 <YG64Kvun5Xxy4lOL@kroah.com>
 <CAHWmKdgm0bjRBasEjcWdtDPX1DPON6RSmNXMTp+NQfYrYHmcXg@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHWmKdgm0bjRBasEjcWdtDPX1DPON6RSmNXMTp+NQfYrYHmcXg@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Apr 08, 2021 at 01:36:07PM +0530, Mitali Borkar wrote:
> Okay, should I rename the patch?

I can't take it as-is, so you need to change something :)

> I removed a line and matched alignment, so should I rename this
> appropriately?

Only do one logical thing per patch, so if this is 2 logical things,
then you need 2 patches, right?

thanks,

greg k-h
