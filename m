Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5799B72
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:01:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BFF1610EA;
	Fri, 22 Oct 2021 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634893304;
	bh=4bMvhQPX6/fDL7Lv2GrhBhjdUgYTkWIOQGwWTJp8Mus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGa/DdEgrvkc6gENd9RQfXyxyQVdC2u8DToYV85zHurQ7I0EeGnarmUBjqdcqSIpk
	 QELa4uJi4lc1Q3Ln3uzocv2RFYMdEBKzqwN/F77kvqSWQhvyp9c0w11EV8gM5NrkAI
	 YcoyJOJo6bkwCkvqepJD+ZJBvnicHbjWk1FX7s8Q=
Date: Fri, 22 Oct 2021 11:01:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Remove unused semaphores
Message-ID: <YXJ99WIRPOYa+Dk9@kroah.com>
References: <20211022084727.28035-1-fmdefrancesco@gmail.com>
 <1905861.9EeI4ENUQp@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1905861.9EeI4ENUQp@localhost.localdomain>

On Fri, Oct 22, 2021 at 10:54:26AM +0200, Fabio M. De Francesco wrote:
> On Friday, October 22, 2021 10:47:25 AM CEST Fabio M. De Francesco wrote:
> > Remove two unused semaphores.
> > 
> > Fabio M. De Francesco (2):
> >   staging: r8188eu: Remove initialized but unused semaphore
> >   staging: r8188eu: Remove unused semaphore "io_retevt"
> > 
> >  drivers/staging/r8188eu/core/rtw_xmit.c      | 1 -
> >  drivers/staging/r8188eu/include/osdep_intf.h | 1 -
> >  drivers/staging/r8188eu/include/rtw_xmit.h   | 1 -
> >  3 files changed, 3 deletions(-)
> > 
> > -- 
> > 2.33.1
> 
> I'm sorry but I overlooked the name of the driver in this cover letter :(
> Am I required to send a v2?

Please do.
