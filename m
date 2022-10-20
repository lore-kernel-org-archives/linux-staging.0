Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69B67E;
	Fri, 21 Oct 2022 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666341366; bh=FInV2/69P5hzluTR/+qki+dkW2XiNEaLTE/gwpAeJwQ=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=KTy0zDhRxQ3LoM6aZLsbM3OmevGbLLVPKDvOaqxSzwmwd7L/b1SNWxcexuxJsgSHV
	 gsEfHkwoW2Z9RNeRdQSrE4cnhL8JcMZOmlEgqsfR1gdS9bpFHf/kj9RbW28lis6Vex
	 gifzYI+KmQuCVkYSiwIgZVJBdgbgVGX9bbH+Bhj0=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Fri, 21 Oct 2022 10:36:06 +0200 (CEST)
X-EA-Auth: /gC4Pi2zaJqUwWKMC+QMhWaIJ+d9M0BuJ4rAQ07uvVuNjlurNpHpXXJIaHDEGeSy0bKHnsVy7aHJ8B9Xa19uKGrG7wRPPUxU
Date: Fri, 21 Oct 2022 05:20:41 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
	outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurabh.truth@gmail.com
Subject: Re: [PATCH v4 11/11] staging: r8188eu: Remove unused macros
Message-ID: <Y1He0f+TqQhb9qr4@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666299151.git.drv@mailo.com>
 <efaf637a14b6f7fdd0178e2aecf8abf17e6922f6.1666299151.git.drv@mailo.com>
 <b038a335-29a3-5118-bda6-9b3230094f90@linux.microsoft.com>
 <Y1I0dcZqMJAzHSm2@kroah.com>
 <Y1HbDZbZvdme1hJb@debian-BULLSEYE-live-builder-AMD64>
 <Y1JZdembzkkQPaOQ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1JZdembzkkQPaOQ@kroah.com>

On Fri, Oct 21, 2022 at 10:33:57AM +0200, Greg KH wrote:
> On Fri, Oct 21, 2022 at 05:04:37AM +0530, Deepak R Varma wrote:
> > On Fri, Oct 21, 2022 at 07:56:05AM +0200, Greg KH wrote:
> > > On Fri, Oct 21, 2022 at 11:21:06AM +0530, Praveen Kumar wrote:
> > > > On 21-10-2022 03:02, Deepak R Varma wrote:
> > > > > Simple variants of macros PlatformEFIOWrite and PlatformEFIORead are
> > > > > defined but never used. As they do not appear to be designed for anything
> > > > > significant, we can remove them to avoid unexpected usage.
> > > > >
> > > > > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > ---
> > > > >
> > > > > Changes in v4:
> > > > >    1. Patch newly added to the patch set.
> > > > >
> > > > >
> > > > >  drivers/staging/r8188eu/include/rtw_io.h | 14 --------------
> > > > >  1 file changed, 14 deletions(-)
> > > > >
> > > > > diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
> > > > > index 87fcf6c94ff3..e9744694204b 100644
> > > > > --- a/drivers/staging/r8188eu/include/rtw_io.h
> > > > > +++ b/drivers/staging/r8188eu/include/rtw_io.h
> > > > > @@ -285,18 +285,4 @@ void bus_sync_io(struct io_queue *pio_q);
> > > > >  u32 _ioreq2rwmem(struct io_queue *pio_q);
> > > > >  void dev_power_down(struct adapter *Adapter, u8 bpwrup);
> > > > >
> > > > > -#define PlatformEFIOWrite1Byte(_a, _b, _c)		\
> > > > > -	rtw_write8(_a, _b, _c)
> > > > > -#define PlatformEFIOWrite2Byte(_a, _b, _c)		\
> > > > > -	rtw_write16(_a, _b, _c)
> > > > > -#define PlatformEFIOWrite4Byte(_a, _b, _c)		\
> > > > > -	rtw_write32(_a, _b, _c)
> > > > > -
> > > > > -#define PlatformEFIORead1Byte(_a, _b)		\
> > > >
> > > > Can the naming be reworked to make more Linux friendly ? something like PLATFORM_EFIO_READ1BYTE or better if there are other suggestions?
> > > > Rest others as applicable ?
> > >
> > > All of these should just be removed entirely and the normal calls here
> > > made instead.  There is no need for these #defines at all.
> >
> > Hello Greg,
> > The current patch scope results in removal of these #defines. Can you please
> > clarify what you mean by "normal calls here made instead"? Do you mean the
> > calling function should directly call the wrapped functions OR you are
> > suggesting converting these #defines to inline functions?
>
> The calling function should call the wrapped function instead, there is
> no need for another pointless level of indirection here.

Sounds good. Thank you for the clarification.

./drv

>
> thanks,
>
> greg k-h


