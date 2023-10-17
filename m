Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414B92D798
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z7Uxdl/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565B1C433C8;
	Tue, 17 Oct 2023 18:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697567377;
	bh=RWaaTJsHFTAPyIb8PliZf2YUP4BF7u+rPqF1xmAY/BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z7Uxdl/rBzaEX6CQGfyEztx9f2I5Mcdzgn7TUeSZsNKMXt88j2rhDnD5dbToZK5Yg
	 Lj62cECUhmi69fnHRTfPxLjjDRtBL9OwItvrBTJrw92XVxk+nFoIVKSyOMGGtnBCje
	 iXzCbmuu2gHvda0jX1/WBpO4RpbmRmCzv7wtPwUs=
Date: Tue, 17 Oct 2023 20:29:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] staging: rtl8192u: remove entry from Makefile
Message-ID: <2023101705-undertone-sloppily-ce90@gregkh>
References: <2023101709-amuck-upward-46f1@gregkh>
 <51fcd05c-cb8e-420f-be62-0c9ade82fbfb@leemhuis.info>
 <2023101757-defy-spiny-4faa@gregkh>
 <337b7086-98fd-469d-a9ce-36b2d8a20559@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <337b7086-98fd-469d-a9ce-36b2d8a20559@gmail.com>

On Tue, Oct 17, 2023 at 08:07:33PM +0200, Philipp Hortmann wrote:
> On 10/17/23 15:35, Greg Kroah-Hartman wrote:
> > On Tue, Oct 17, 2023 at 12:35:57PM +0200, Thorsten Leemhuis wrote:
> > > On 17.10.23 10:13, Greg Kroah-Hartman wrote:
> > > > In commit 697455ce4110 ("staging: rtl8192u: Remove broken driver"), the
> > > > driver was removed, along with the Kconfig entry, but the Makefile line
> > > > in drivers/staging/Makefile was not updated, so things like 'make clean'
> > > > fail to work properly as they will decend into all subdirectories to try
> > > > to clean things up.
> > > > 
> > > > Resolve this by removing the entry in the main staging Makefile.
> > > > 
> > > > Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> > > > Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> > > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > > Fixes: 697455ce4110 ("staging: rtl8192u: Remove broken driver")
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > 
> > > Thx Greg, that fixed things for my case. In case anyone cares:
> > 
> > I care, thanks!
> 
> 
> Sorry for messing up. I did a compile test of the entire kernel but I was
> not aware that I also need to test 'make clean'

Not a problem, I didn't either, and neither did the 0-day bot.

greg k-h
