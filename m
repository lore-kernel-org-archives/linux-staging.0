Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FA77A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 14:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165FCC2BBE4;
	Mon,  4 Apr 2022 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649082984;
	bh=73qqUvZ/VQr/pWfWdhrhsVcUa7yrkg0XCAGXIPOUfDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5KGhA/2BqUP1zD/DGNonn6yNZH5xmdobFP3PVt3Rbt9oyX3ANm7ArHHjWwsXEKY+
	 EgLiBJOG2J5kxB1TBwcc1lFIFT2sTCPweTBqAMJa6IblsCJ8FyTCxqgiki4n4OYQEy
	 6KVI14qtuHgedDKfR5tUiyKCWuL+js/S8LJumMxw=
Date: Mon, 4 Apr 2022 16:36:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Charlie Sands <sandsch@northvilleschools.net>,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: Re: [PATCH V2] Fix unsafe memory access by memcmp
Message-ID: <YksCZRJWNNcGSLMw@kroah.com>
References: <YkpdVyuQguGzPSNE@sckzor-linux.localdomain>
 <4729027.31r3eYUQgx@leap>
 <20220404120332.GY3293@kadam>
 <1890716.PYKUYFuaPT@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1890716.PYKUYFuaPT@leap>

On Mon, Apr 04, 2022 at 04:29:48PM +0200, Fabio M. De Francesco wrote:
> On luned? 4 aprile 2022 14:03:32 CEST Dan Carpenter wrote:
> > On Mon, Apr 04, 2022 at 01:25:37PM +0200, Fabio M. De Francesco wrote:
> > > On luned? 4 aprile 2022 12:50:41 CEST Dan Carpenter wrote:
> > > > On Sun, Apr 03, 2022 at 10:52:07PM -0400, Charlie Sands wrote:
> > > > > This patch fixes sparse warnings about the memcmp function unsafely
> > > > > accessing userspace memory without first copying it to kernel space.
> > > > > 
> > > > > Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
> > > > > ---
> > > > > 
> > > > > V2: Fixed checkpatch.pl warning and changed variable name as suggested
> > > > > by Greg K. H. and improved error checking on the "copy_from_user" function as
> > > > > suggested by Pavel Skripkin.
> > > > > 
> > > > >  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 21 ++++++++++++--------
> > > > >  1 file changed, 13 insertions(+), 8 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > > > > index 7df213856d66..4b4eec2bde96 100644
> > > > > --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > > > > +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > > > > @@ -3233,23 +3233,28 @@ static int rtw_p2p_get(struct net_device *dev,
> > > > >  			       struct iw_request_info *info,
> > > > >  			       union iwreq_data *wrqu, char *extra)
> > > > >  {
> > > > > -	if (!memcmp(wrqu->data.pointer, "status", 6)) {
> > > > > +	char wrqu_data[9];
> > > > > +
> > > > > +	if (copy_from_user(wrqu_data, wrqu->data.pointer, 9) != 0)
> > > > > +		return 0;
> > > > 
> > > > return -EFAULT;  We can't assume that that user wants to copy 9 bytes
> > > > especially when they're passing a 4 character + NUL string.
> > > > 
> > > > This is a custom ioctl.  Called from ioctl_private_iw_point().
> > > > 
> > > > I think if you try to dereference a user pointer like this then it will
> > > > cause a crash, right?  So that means no one has ever tested or used this
> > > > code and we hopefully we can just delete it?
> > > 
> > > After a quick look, I'm pretty confident that we can also delete 
> > > rtw_p2p_get2() and rtw_p2p_set() unless I'm overlooking something.
> > 
> > What are the problems with rtw_p2p_get2() and rtw_p2p_set()?
> > 
> > regards,
> > dan carpenter
> > 
> Is it safe to access user space pointers without using proper helpers? 

No.

