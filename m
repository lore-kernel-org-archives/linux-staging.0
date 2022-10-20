Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BE723BF;
	Thu, 20 Oct 2022 07:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3C6C433D6;
	Thu, 20 Oct 2022 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666249655;
	bh=5vrQ4C20DD+nj92Hyn6OUvjArtEEknzGS96jSH4NC0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmHHsZRgVyHSnkW6USsjrxMMUPRPSHUZY7Rxz4tTj+AH6sAs5GsbqEHFGz+jMIzny
	 tJ2yE3N5AHmb3PYooOD55UMFunqnPNl16draY60edNReC9KI71Ko6CX3PzswPnAVTA
	 idVMfTj3mMw79OuT4z5ULXFkC/ZG+MmQdQHkRBJw=
Date: Thu, 20 Oct 2022 09:07:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Emily Peri <eperi1024@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: fix white space warnings
Message-ID: <Y1DztSHmsjFWpXJy@kroah.com>
References: <cover.1666230736.git.eperi1024@gmail.com>
 <45558673b486808e7978e2e4838c6ce5a2485b8b.1666230736.git.eperi1024@gmail.com>
 <Y1DVH+UatalfjDN5@kroah.com>
 <Y1DcimyMZwkSDm+C@marshmallow>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1DcimyMZwkSDm+C@marshmallow>

On Wed, Oct 19, 2022 at 10:28:42PM -0700, Emily Peri wrote:
> On Thu, Oct 20, 2022 at 06:57:03AM +0200, Greg KH wrote:
> > On Wed, Oct 19, 2022 at 07:10:51PM -0700, Emily Peri wrote:
> > > Fix the following checkpatch warnings in rtw_ioctl_set:
> > > 1) Add missing blankline after declaration
> > > 2) Replace spaces used for indent with tab
> > > 3) Remove space before tab
> > 
> > When you have to list the different things you do, you should really
> > break that up into individual patches.  This should be 3.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Thanks greg for the feedback! I got the idea to put them all in the same
> patch from the PatchPhilosophy guide, which suggested combining a bunch
> of white space corrections into one commit. But, it sounds like I
> misinterpreted what the guide was saying. Maybe if there are identical
> warnings, such as "trailing white space" in the driver code, could those
> corrections go together in a single patch?
> 

Yes, you are correct, you could do a "fix all trailing whitespace in
this file" in one patch.

thanks,

greg k-h
