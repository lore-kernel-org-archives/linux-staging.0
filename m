Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FEF29CA
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 07:17:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84C53600D3;
	Sun, 11 Apr 2021 07:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618125426;
	bh=p/UdKtXkSKul+gDd7EMlk5C+albZFshfM4t0+YC5LEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjDkBM97UXnMXoxVuluVyo0vn8G6qIxIPAcfOcof3mnlYaMttr0Sa1H4Y1xY00MGN
	 e69OpoBma3eUgkz5Hg/XFQ6bL8LK5enMGpWgekmF2egnvD8W+UgZZfjvQujrLz+NaN
	 CPH5z7u1PIo0iXQyvaWbrl2IXm8/OaUG4AjUHgE0=
Date: Sun, 11 Apr 2021 09:17:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v2 0/5] staging: rtl8723bs: Change
Message-ID: <YHKib/h08kR/hsQV@kroah.com>
References: <20210410150008.5460-1-fmdefrancesco@gmail.com>
 <YHKZlqFy15QC9Mzz@kroah.com>
 <3154849.IkRRYng9eG@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3154849.IkRRYng9eG@localhost.localdomain>

On Sun, Apr 11, 2021 at 09:11:43AM +0200, Fabio M. De Francesco wrote:
> On Sunday, April 11, 2021 8:39:18 AM CEST Greg KH wrote:
> > On Sat, Apr 10, 2021 at 05:00:03PM +0200, Fabio M. De Francesco wrote:
> > > Remove camelcase, correct misspelled words in comments, remove an
> > > unused
> > > variable, change the type of a variable and its use, change comparisons
> > > with 'true' in controlling expressions.
> > > 
> > > Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.
> > 
> > The subject line above is very odd :(
> >
> True. I've just read the output of git format in /tmp and noticed that the 
> line with the "subject" was broken in two different one. I think I had 
> pressed return while editing.
> 
> I'm about to send that series again with v3.
> 
> In the while I noticed you sent a note to let me know that the you have  
> added the patch titled "staging: rtl8723bs: core: Remove an unused 
> variable" to your staging git tree. 
> 
> I think this could be a potential issue because the same patch is in the 
> series that I have to send anew. I put that patch in the series because 
> yesterday you wrote that the message with subject "Outreachy patches caught 
> up on.", asking to rebase and resend.
> 
> However, I'm about to send v3 of this patchset. I have no idea whether or 
> not you will have problems in applying that. If you have problems with it, 
> please let me know.

I will, please rebase your tree against mine, which should remove the
one patch that I did apply already as you do not need to send it again.

thanks,

greg k-h
