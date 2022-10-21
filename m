Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579B217D7;
	Fri, 21 Oct 2022 05:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AA3C433D7;
	Fri, 21 Oct 2022 05:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666331768;
	bh=7HRzomlRuJXonuSkna+wF+rj0NZf1bCzqfwL19Q3qPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xlB7VteB3fw5FVqFFqB6x+hBAGVdBB1cbY9Aqv4xl1bbhW2pMB+BU2izpkNBdO5Bv
	 Vy4jVYsYiSAsL0lHwNQAyOicbDldGBj5VzSgWDr/SPHHiBwFuXGTnECjsrKES7iYT3
	 9KuqEb3cZHU770LIeg/JMQZ0EXexogMUqvFXPjdM=
Date: Fri, 21 Oct 2022 07:56:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Praveen Kumar <kumarpraveen@linux.microsoft.com>
Cc: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	paskripkin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurabh.truth@gmail.com
Subject: Re: [PATCH v4 11/11] staging: r8188eu: Remove unused macros
Message-ID: <Y1I0dcZqMJAzHSm2@kroah.com>
References: <cover.1666299151.git.drv@mailo.com>
 <efaf637a14b6f7fdd0178e2aecf8abf17e6922f6.1666299151.git.drv@mailo.com>
 <b038a335-29a3-5118-bda6-9b3230094f90@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b038a335-29a3-5118-bda6-9b3230094f90@linux.microsoft.com>

On Fri, Oct 21, 2022 at 11:21:06AM +0530, Praveen Kumar wrote:
> On 21-10-2022 03:02, Deepak R Varma wrote:
> > Simple variants of macros PlatformEFIOWrite and PlatformEFIORead are
> > defined but never used. As they do not appear to be designed for anything
> > significant, we can remove them to avoid unexpected usage.
> > 
> > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> > 
> > Changes in v4:
> >    1. Patch newly added to the patch set.
> > 
> > 
> >  drivers/staging/r8188eu/include/rtw_io.h | 14 --------------
> >  1 file changed, 14 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
> > index 87fcf6c94ff3..e9744694204b 100644
> > --- a/drivers/staging/r8188eu/include/rtw_io.h
> > +++ b/drivers/staging/r8188eu/include/rtw_io.h
> > @@ -285,18 +285,4 @@ void bus_sync_io(struct io_queue *pio_q);
> >  u32 _ioreq2rwmem(struct io_queue *pio_q);
> >  void dev_power_down(struct adapter *Adapter, u8 bpwrup);
> > 
> > -#define PlatformEFIOWrite1Byte(_a, _b, _c)		\
> > -	rtw_write8(_a, _b, _c)
> > -#define PlatformEFIOWrite2Byte(_a, _b, _c)		\
> > -	rtw_write16(_a, _b, _c)
> > -#define PlatformEFIOWrite4Byte(_a, _b, _c)		\
> > -	rtw_write32(_a, _b, _c)
> > -
> > -#define PlatformEFIORead1Byte(_a, _b)		\
> 
> Can the naming be reworked to make more Linux friendly ? something like PLATFORM_EFIO_READ1BYTE or better if there are other suggestions?
> Rest others as applicable ?

All of these should just be removed entirely and the normal calls here
made instead.  There is no need for these #defines at all.

thanks,

greg k-h
