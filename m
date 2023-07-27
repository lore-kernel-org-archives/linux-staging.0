Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F12712E
	for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 17:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3A4C433C8;
	Thu, 27 Jul 2023 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690478471;
	bh=1siF8FEzIm/u9nbl1sknyH/SiSYpK9pi4eRex4u1zSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufU3DUXJT2VB/NpAfG2FWTTFW+/OmMFFUxDSz+qZgzAD9FBJ7NugNg2dN+YmO/3HB
	 pVa+tG3mh4DgcW0i+KlbnF1Hfeiyxmx7aIdxD5P5SEiFwwJJdDP9TEnI7eBTAiS1Of
	 YELuN9s4gUI63hao133fWBeTxa0xKdFNSKzPbVJc=
Date: Thu, 27 Jul 2023 19:21:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <2023072752-stem-pupil-76ab@gregkh>
References: <ZKjeHx/zqrNIqaA6@alolivei-thinkpadt480s.gru.csb>
 <2023072729-sensitive-spyglass-ec96@gregkh>
 <ZMKDeyGaPQHm6/pr@alolivei-thinkpadt480s.gru.csb>
 <2023072741-mankind-ethics-b95b@gregkh>
 <ZMKkgItqf8r8BcRB@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMKkgItqf8r8BcRB@alolivei-thinkpadt480s.gru.csb>

On Thu, Jul 27, 2023 at 02:08:16PM -0300, Alexon Oliveira wrote:
> On Thu, Jul 27, 2023 at 05:05:03PM +0200, Greg KH wrote:
> > You resolved one warning by replacing it with a different one, that's
> > not good :(
> 
> Well, honestly, I couldn't spot any new issue caused by this patch. At least it was not reported by the checkpatch.pl. The ones that are still showing up were already there. But, to move on, if you think it's more productive, I can fix all warnings and checks reported by the checkpatch.pl and send them over in only one patch. Is it that feasible?

I would have thought you would get a "line is too long" warning, that
didn't happen?

Anyway, no, you can't send a "fix all the issues at once" patch, sorry,
if you do that you will get a message from my patch bot that says:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

So please break it up into logical changes.

thanks,

greg k-h
