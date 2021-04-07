Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2125D70
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 05:37:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D25A613AF;
	Wed,  7 Apr 2021 05:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617773861;
	bh=nzwtY+L0kgmfWf4JSBCkm5fqQT9Wgv7V7OBgqfxP7iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xnCUb60RQc+dbIilRCXgHSUKVn1uSFZRGHhqBgIHEUtOafKvgpD8IHyGesMJ1jfXL
	 01RmSupd0IRlARujw4yym69PmeknlmD/m+ZPpiHBvIaUWDGCfrEvx0jMX/iGk0Yneh
	 EqdAp4TF0KHnboEMVlH3NikrloWCoSpedSWQfP/8=
Date: Wed, 7 Apr 2021 07:37:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [RESEND PATCH] staging: emxx_udc: Ending line with argument
Message-ID: <YG1FI38zNbidjt9q@kroah.com>
References: <20210406193409.96428-1-martinsdecarvalhobeatriz@gmail.com>
 <YGy4LXHBrBb/r3dk@kroah.com>
 <4c7df741-4e73-2ac4-f0d8-c9513ae29c88@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c7df741-4e73-2ac4-f0d8-c9513ae29c88@gmail.com>

On Tue, Apr 06, 2021 at 09:00:07PM +0100, Beatriz Martins de Carvalho wrote:
> 
> Em 06/04/21 20:36, Greg KH escreveu:
> > On Tue, Apr 06, 2021 at 08:34:09PM +0100, Beatriz Martins de Carvalho wrote:
> > > Cleans up check of "Lines should not end with a '('"
> > > with argument present in next line in file emxx_udc.c
> > > 
> > > Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
> > > ---
> > >   drivers/staging/emxx_udc/emxx_udc.c | 11 ++++-------
> > >   1 file changed, 4 insertions(+), 7 deletions(-)
> > Why is this a [RESEND] ?
> > 
> > What happened to the first version?
> Sorry, I didn't receive your review, and in kernelnewbies tutorial, they say
> if not receive a response, may have missed the patch, so I resent it.

Do you have a pointer to your previous patch in the lore.kernel.org
archives anywhere?  I can't seem to find it.

> > Also, your subject is odd, please look at the documentation for how to
> > write good subject lines for patches.
> 
> Yes, I know. It was my second patch, and I was learning, and when I resent
> it, I didn't know if I can change the subject.

Of course you can always fix up things you know you did incorrectly,
don't make others review stuff that you know is wrong, that just wastes
everyone's time.

thanks,

greg k-h
