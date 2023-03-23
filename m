Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E6A93A;
	Thu, 23 Mar 2023 15:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA71AC433D2;
	Thu, 23 Mar 2023 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679585324;
	bh=uDCD9FVGWvkG5Pj+Z5q2Nu+zJUymfaiJh3ULLXyJC1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q16mFK2Im6oWv/24dsh2Jk0mWOllFkfcVtal1u53t4r8jv+1YoQLaZsApkTWQNVPW
	 9c1Sgj3jpxIj52ygZf6Rc3l6r4G60xDVzWp70OcFE6IelAzdP2osWHdmCSMA+EinEw
	 P/gwuP6Zx5V8ODIj/xHNi21MkAKeCGsKql5aoyJo=
Date: Thu, 23 Mar 2023 16:28:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: fix line ending with '('
Message-ID: <ZBxwKQdl8CDPqD2L@kroah.com>
References: <ZBsSOlPbaGZcAaSY@khadija-virtual-machine>
 <ZBvbP8ugDFjSoVp/@kroah.com>
 <ZBxtpyT8she++602@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxtpyT8she++602@khadija-virtual-machine>

On Thu, Mar 23, 2023 at 08:17:59PM +0500, Khadija Kamran wrote:
> On Thu, Mar 23, 2023 at 05:53:19AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Mar 22, 2023 at 07:35:38PM +0500, Khadija Kamran wrote:
> > > Splitting function header to multiple lines because of 80 characters per
> > > line limit, results in ending the function call line with '('.
> > > This leads to CHECK reported by checkpatch.pl
> > > 
> > > Move the first parameter right after the '(' in the function call line.
> > > Align the rest of the parameters to the opening parenthesis.
> > > 
> > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > ---
> > >  drivers/staging/most/dim2/hal.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > You have 2 patches here with identical subject lines, yet they do
> > different things :(
> >
> > I've dropped all of your pending patches now for the most driver as I'm
> > totally confused.  Please resend them all as a proper patch series with
> > updated subject lines.
> >
> 
> Hey Greg!
> 
> I took your message literally and sent a RESEND PATCH. I should've sent
> a new version of the patch instead.

What message?

Remember, we get hundreds of patches a day to review and have a short
term memory of a squirrel..  make it obvious what is happening when
resending or sending a new version, otherwise we are confused.

> Would it be okay if I send patch revisions with changed subjects now?

What would you want to see if you were on the recieving end of this
patch to know what to do with it?

thanks,

greg k-h
