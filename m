Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5401FA6
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 12:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B70BC385A5;
	Tue, 12 Apr 2022 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649764941;
	bh=RL0TS6TyTsdDUGUm/EuXSEF8ETZ+oamHhp+RILM0/YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3mHLMHoovRPWuJ8y8P/Vdf5aWsXfBlbwPd/Lv1CC2gAYrz46aDVuZy2dSkGLSWmE
	 hpBubU2oQjoy5rFdmrvHhehRBFD4euGUaRkf+8y/ARPVcMFqqMajIZJKh10O45Oc9C
	 VsxROyNh+ZUUyk13ISrKKT92HWZsCR8RKZeqBRIs=
Date: Tue, 12 Apr 2022 14:02:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Liu Junqi <liujunqi@pku.edu.cn>, Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Colin Ian King <colin.king@intel.com>, sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Remove D. Kershner from Unisys S-PAR
 maintainers
Message-ID: <YlVqStHr6acHnF5o@kroah.com>
References: <20220412103629.8029-1-fmdefrancesco@gmail.com>
 <YlVXV4J41KBzKHtm@kroah.com>
 <2976258.CbtlEUcBR6@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2976258.CbtlEUcBR6@leap>

On Tue, Apr 12, 2022 at 01:08:28PM +0200, Fabio M. De Francesco wrote:
> On marted? 12 aprile 2022 12:41:27 CEST Greg Kroah-Hartman wrote:
> > On Tue, Apr 12, 2022 at 12:36:29PM +0200, Fabio M. De Francesco wrote:
> > > The email address of David Kershner is no more reachable. Remove his
> > > entry from the MAINTAINERS file for UNISYS S-PAR DRIVERS and change
> > > the status to "Orphan".
> > > 
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > > 
> > > v1->v2: Change also the status of the entry to "Orphan" and rework the
> > > commit message. (Thanks to Greg Kroah-Hartman).
> > > 
> > >  MAINTAINERS | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 3ed62dcd144e..9283c63565b3 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -20184,9 +20184,8 @@ F:	include/linux/cdrom.h
> > >  F:	include/uapi/linux/cdrom.h
> > >  
> > >  UNISYS S-PAR DRIVERS
> > > -M:	David Kershner <david.kershner@unisys.com>
> > >  L:	sparmaintainer@unisys.com (Unisys internal)
> > 
> > Again, please drop this "list" as it obviously is not going to anyone.
> 
> OK, I'll also drop the "L:" line. I wasn't sure about it because I see 
> that there are other entries marked as "Orphan" and the list is still
> there. But you are right: although the "sparmaintainer" list address is
> not bouncing, it looks like nobody care to read messages there.
>   
> > And really, this whole code should be removed, no one seems to be using
> > it, and if they are, we can easily revert the removal and mark them as
> > the maintainer.
> 
> 1) If I remove the entire drivers/staging/unisys/ I suppose that, in 
> MAINTAINERS I should also remove the whole entry called "UNISYS S-PAR 
> DRIVERS", not only the "L:" line. 

Yes, _AND_ you need to also remove all files that are listed for that
entry.

> 2) Furthermore, I understand that I should also should change the relevant 
> Kbuild files, otherwise all builds of staging would fail. 

Yes.

thanks,

greg k-h
