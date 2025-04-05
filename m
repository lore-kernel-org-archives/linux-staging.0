Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C5B1C84B7;
	Sat,  5 Apr 2025 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743842505; cv=none; b=ojDzE1lf5euTKkTjLs65fRPFexvW/s7vLYbe+vGDDdasFFs1qlIUnbiV0WEEjFrrNNfprycODz8khdjshFV72zIY0ZYd1BMgblV+6YAxs6zzxV/HAOe0QHnI7cXQQ5DP5+iw59YbZZ3006Qy1ChiWPvfWYFsqbXFF5rLsTxAMnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743842505; c=relaxed/simple;
	bh=qkwdxkQstWHqLZwaQdiUe8yH/69gvSue/S00JLO//ug=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uBdyofIG7Cc2KXt4jnjZZCdHefEedDFSiiEGVSJjycu9JnWiC7CeG/bAtUdVaHKYZBHDgCy6ilAogEIt5sUOBVR8PSefPwMBSWDzfwP60BChJ8TLAt4v/42EPuhdNOSdaeDOzPrWciIeMFxCVnIeTxX9Nw4/BHekE77XENxoyow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=PO6+D6El; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="PO6+D6El"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=S+qQigJab1XkQ04Xka52HJIvQxQQUX0zSJbuj0PIiI4=;
  b=PO6+D6Elguz7tmttMO/wUY8R8vKlOe59mNkG3YhefuFqnk44evEiw8jQ
   DdhFVg3QV93l095pInPOXOEG3tT1KunWanO8appDDmOENgexIxRipzL4g
   gp/4x453irhC8JnyTz4oYiqQ0HzwyNKUSQtAx5ziY4HBA39lbHRsfoXdy
   s=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,190,1739833200"; 
   d="scan'208";a="113522369"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 10:41:39 +0200
Date: Sat, 5 Apr 2025 04:41:37 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Initialize local variables at
 declaration
In-Reply-To: <2025040507-attest-hyphen-5dae@gregkh>
Message-ID: <ef088d6-cec1-9758-cc0-55fb66ca952@inria.fr>
References: <cover.1743820815.git.karanja99erick@gmail.com> <ef29adfe7c8a189009b07c2873aa48782cd594ca.1743820815.git.karanja99erick@gmail.com> <2025040507-attest-hyphen-5dae@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 5 Apr 2025, Greg KH wrote:

> On Sat, Apr 05, 2025 at 06:14:49AM +0300, Erick Karanja wrote:
> > Optimize variable initialization by integrating the initialization
> > directly into the variable declaration in cases where the initialization
> > is simple and doesn't depend on other variables or complex expressions.
> > This makes the code more concise and readable.
> >
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> >  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 56 ++++++-------------
> >  1 file changed, 16 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > index 5dc1c12fe03e..ebe9562a9606 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > @@ -120,13 +120,10 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
> >   */
> >  s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
> >  {
> > -	struct xmit_priv *pxmitpriv;
> > +	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
> >  	u8 queue_empty, queue_pending;
> >  	s32 ret;
> >
> > -
> > -	pxmitpriv = &padapter->xmitpriv;
> > -
> >  	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
> >  		netdev_emerg(padapter->pnetdev,
> >  			     "%s: down SdioXmitBufSema fail!\n", __func__);
> > @@ -168,10 +165,10 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
> >   */
> >  static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv)
> >  {
> > -	s32 err, ret;
> > +	s32 err = 0, ret;
> >  	u32 k = 0;
> > -	struct hw_xmit *hwxmits, *phwxmit;
> > -	u8 idx, hwentry;
> > +	struct hw_xmit *hwxmits = pxmitpriv->hwxmits, *phwxmit;
> > +	u8 idx, hwentry = pxmitpriv->hwxmit_entry;
>
> These lines are NOT more understandable and readable at all, sorry.  You
> are mixing pre-initialized variables with not-initialized ones, making
> this harder to read and maintain over time.
>
> Which would you want to come back to in 5 years to try to understand
> what is going on?
>
> Keep it simple please.

This is another deficiency of Coccinelle.  It doesn't really see the case
where there are multiple declarations on a single line, since it is
generally more valuable to be able to work on them individually.

I guess the first change above would be ok though.

julia
