Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD71012B6A;
	Fri, 13 Oct 2023 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="PMn/WErs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+gg1Cxd4QB4t8PoxJSiGoybmHi9PDx9fE57wW04xc/0=;
  b=PMn/WErsiey74Upp1YBJoSvu0rzrEr9+GSTpR5wz1I0XxthIJS3UvEyD
   MFkxkCBY2g5UlTzCI2y1rZbT5V/QXB0GxiMrBiTVSu+hAi3PE7fHky+eu
   zmp/ww5tO5kJ7UBkifs1r4kl9HSxQGtvssn2ivNnSi9SwcOil/Uo1fm+n
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,221,1694728800"; 
   d="scan'208";a="68626676"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:16:43 +0200
Date: Fri, 13 Oct 2023 12:16:41 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Calvince Otieno <calvncce@gmail.com>, outreachy@lists.linux.dev, 
    linux-kernel@vger.kernel.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Luke Koch <lu.ale.koch@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
    Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: wlan-ng: replace  strncpy() with strscpy()
In-Reply-To: <b53cc9c0-f1fd-43ae-85d9-2c502fc4fcec@kadam.mountain>
Message-ID: <2a603886-332c-9b2b-45fa-3dea8f4162f@inria.fr>
References: <ZSkT0pFu0VClVc1V@lab-ubuntu> <b53cc9c0-f1fd-43ae-85d9-2c502fc4fcec@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 13 Oct 2023, Dan Carpenter wrote:

> On Fri, Oct 13, 2023 at 12:54:26PM +0300, Calvince Otieno wrote:
> > Checkpatch suggests the use of  strscpy() instead of strncpy().

Since Dan suggested another change, you could also drop the extra space
before strscpy in the line above.

julia

> > The advantages are that it always adds a NUL terminator and it prevents
> > a read overflow if the src string is not properly terminated.  One
> > potential disadvantage is that it doesn't zero pad the string like
> > strncpy() does.
> >
> > In this code, strscpy() and strncpy() are equivalent and it does not
> > affect runtime behavior.  The string is zeroed on the line before
> > using memset().  The resulting string was always NUL terminated and
> > PRISM2_USB_FWFILE is string literal "prism2_ru.fw" so it's NUL
> > terminated.
> >
> > However, even though using strscpy() does not fix any bugs, it's
> > still nicer and makes checkpatch happy.
> >
> > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > ---
> > Patch version v4:
> > 	Provide a valid description of the patch
>
> Good.
>
> However, you've still included the v1 patch...  See below.  Don't do
> that.
>
> regards,
> dan carpenter
>
> > Patch version v1:
> >         Replacing strncpy() with strscpy()
> >
> >  drivers/staging/wlan-ng/prism2fw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
> > index 5d03b2b9aab4..57a99dd12143 100644
> > --- a/drivers/staging/wlan-ng/prism2fw.c
> > +++ b/drivers/staging/wlan-ng/prism2fw.c
> > @@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,
> >
> >                 if (j == -1) {  /* plug the filename */
> >                         memset(dest, 0, s3plug[i].len);
> > -                       strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
> > +                       strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
> >                 } else {        /* plug a PDR */
> >                         memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
> >                 }
> >
> > --
> > Calvince Otieno
> >
>
>
