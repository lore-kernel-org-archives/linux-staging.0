Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED193A93A;
	Thu, 23 Mar 2023 15:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47060C433D2;
	Thu, 23 Mar 2023 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679585244;
	bh=HJw0cYvbjKl3Ua+BCoBTtWSQ97hOTpIlh25Ayjfx9cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ijk5XVCvrDtTs0EwpUQ+M8T0Hig7XIBUObjoPN6gM5vYYjAvQsv9PSV+O9UWLlOxQ
	 /gX+rBs8oiHz6o15Zm+kTex9xFEzL/56dGkTWULucVjjBp3meJ6tPQwBr/YzxVDUYc
	 C1FYNtQdzYNSDaf8x311Be09ydKGb3FzAe+Kfg5M=
Date: Thu, 23 Mar 2023 16:27:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Julia Lawall <julia.lawall@inria.fr>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 0/4] staging: rtl8192e: code cleanup patches
Message-ID: <ZBxv2e1mkUJ5YRfG@kroah.com>
References: <cover.1679573474.git.kamrankhadijadj@gmail.com>
 <alpine.DEB.2.22.394.2303231408000.2866@hadrien>
 <alpine.DEB.2.22.394.2303231408410.2866@hadrien>
 <090ee842-46d0-4f35-bf00-68a3e1393b72@kili.mountain>
 <ZBxu5RBG9kCRlwRB@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxu5RBG9kCRlwRB@khadija-virtual-machine>

On Thu, Mar 23, 2023 at 08:23:17PM +0500, Khadija Kamran wrote:
> On Thu, Mar 23, 2023 at 04:34:43PM +0300, Dan Carpenter wrote:
> > On Thu, Mar 23, 2023 at 02:08:58PM +0100, Julia Lawall wrote:
> > > 
> > > 
> > > On Thu, 23 Mar 2023, Julia Lawall wrote:
> > > 
> > > >
> > > >
> > > > On Thu, 23 Mar 2023, Khadija Kamran wrote:
> > > >
> > > > > Fix several cleanup issues reported by checkpatch.pl in module
> > > > > staging/rtl8192e in file rtllib_rx.c
> > > >
> > > > Why is it resent?
> > > 
> > > OK, I see, sorry for the noise.
> > 
> > I'm still confused...  :P
> >
> 
> Hey Dan!
> 
> Sorry about the confusion. I sent the last patch with the wrong email
> mistakenly. It was causing following warning as reported by Philipp,
> Checkpatch:
> 
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Khadija
> Kamran <kkamran.bese16seecs@seecs.edu.pk>' != 'Signed-off-by: Khadija
> Kamran <kamrankhadijadj@gmail.com>
> 
> I resent this patch with the correct email address. I hope I did not do
> this wrong.

That would be a totally new version, as something changed, so document
it, otherwise we are confused.

thanks,

greg k-h
