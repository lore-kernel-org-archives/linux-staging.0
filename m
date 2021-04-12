Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F971
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:31:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E11896121D;
	Mon, 12 Apr 2021 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618219866;
	bh=AitILzDXOaPxQJDyb5VWuU+H9qTa5Vx2vTYtd7yvvbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0wESZK06EOMBoGHqMcawB5gEZBUbdp/KQ0p40iIbYOMmgTp5GEWWdLFEcog5OTQM
	 k1quQMahCaEACeCd/qN9Jk6XhbgpV2DMFAvZIfGcrc/1DHAG4u1a7zEo77oIceu4Gw
	 pn/A/W7z7ZiqSBT1xwYuU9m53thBxU5l+TBZIDis=
Date: Mon, 12 Apr 2021 11:31:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8192u: Remove variable
 set but not used
Message-ID: <YHQTVwx+S82CAJyb@kroah.com>
References: <20210411174143.31618-1-fmdefrancesco@gmail.com>
 <alpine.DEB.2.22.394.2104111943230.11703@hadrien>
 <2836382.q67jgZTtOx@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2836382.q67jgZTtOx@localhost.localdomain>

On Sun, Apr 11, 2021 at 08:12:05PM +0200, Fabio M. De Francesco wrote:
> On Sunday, April 11, 2021 7:43:57 PM CEST Julia Lawall wrote:
> > On Sun, 11 Apr 2021, Fabio M. De Francesco wrote:
> > > Remove variable "int ret" which is instantiated but not used.
> > 
> > instantiated -> declared?  I thought instantiated could mean initialized,
> > but that doesn't seem to be the case.
> > 
> > julia
> Please, help me to remind...
> 
> If a local variable is declared but not set to any value, does it take 
> space on the stack?

Maybe, maybe not, doesn't matter either way.

> If I understand your message, it does not. Therefore it is only declared 
> but no memory is allocated for it (i.e., it is not instantiated). Right?
> 
> If you confirm I've understood this topic, I can send a v2 patch.

That's not the issue here at all...

confused,

greg k-h
