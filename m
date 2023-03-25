Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12828EB;
	Sat, 25 Mar 2023 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GCBvLJhQ3scmdinTnVG7pueTv7IZRFGDspF7uPw2vAA=;
  b=cWpInD9UfkZPBpiBUFI3wrug7JbuUGCsvPTnQ9gIStk2BVsjQfKn+2ry
   reos19IJxIJjlyLx6msWidJEMgdkk6RDsycFUSW6+ELkkwFHLDQLWippB
   NpvUpj3DHVDlJw2sV6wGx+M9qA/O33xZexfFs27ZHdupLJYVIDOFkQLWi
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,290,1673910000"; 
   d="scan'208";a="99065710"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 15:04:33 +0100
Date: Sat, 25 Mar 2023 15:04:32 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Greg KH <gregkh@linuxfoundation.org>
cc: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8192u: remove change history from
 comments
In-Reply-To: <ZB7n23tzWxGmBPe4@kroah.com>
Message-ID: <alpine.DEB.2.22.394.2303251503280.2860@hadrien>
References: <cover.1679744684.git.kamrankhadijadj@gmail.com> <c4ec9246e2d103c15e451fe3d6ed42692c93d39f.1679744684.git.kamrankhadijadj@gmail.com> <ZB7n23tzWxGmBPe4@kroah.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 25 Mar 2023, Greg KH wrote:

> On Sat, Mar 25, 2023 at 05:13:17PM +0500, Khadija Kamran wrote:
> > Developers use git to browse the file history so revision history is not
> > required in the comments.
> > Remove the change history information from the comments.

I'm not sure to follow the argument.  The file was integrated into the
Linux kernel in 2009.  So there is no record of the 2008 date in the git
history of the Linux kernel.  Maybe it's not interesting, but at least the
explanation doesn't seem right.

julia

> >
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/rtl8192u/r8192U_dm.c | 36 ----------------------------
> >  1 file changed, 36 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
> > index a88686be3523..885c5966342f 100644
> > --- a/drivers/staging/rtl8192u/r8192U_dm.c
> > +++ b/drivers/staging/rtl8192u/r8192U_dm.c
> > @@ -8,11 +8,6 @@
> >   * Abstract:
> >   *	HW dynamic mechanism.
> >   *
> > - * Major Change History:
> > - *	When		Who				What
> > - *	----------	--------------- -------------------------------
> > - *	2008-05-14	amy                     create version 0 porting from windows code.
> > - *
> >   *--
> >   */
> >  #include "r8192U.h"
> > @@ -276,10 +271,6 @@ void init_rate_adaptive(struct net_device *dev)
> >   *
> >   * Return:		NONE
> >   *
> > - * Revised History:
> > - *	When		Who		Remark
> > - *	05/26/08	amy	Create version 0 porting from windows code.
> > - *
> >   *---------------------------------------------------------------------------
>
> You can remove the extra blank comment line as well.
>
> thanks,
>
> greg k-h
>
>
