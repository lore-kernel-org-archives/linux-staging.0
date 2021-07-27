Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3E272
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 13:22:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C1EE61A0D;
	Tue, 27 Jul 2021 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627392158;
	bh=MkPLqPJc1XgJH7AKYbcntWYTSOaXX7Pjfcxk8FnP6Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIXvYIN/seq9bVAkt/WwEuoowe8ns43cdiz9bqjZUsi4gN1fQontbMr8XmxhFir64
	 ZV1tvc52YgnWsE7jWNdpMD9tzMrvRHZpN3iJOTzoRxdE1uM+MZif7ECzr0tfa+Lo+m
	 kctkR4wMb4ibWZbaiUtYE/OXza2RiB8yliY0xWIY=
Date: Tue, 27 Jul 2021 15:22:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Lucas Henneman <lucas.henneman@linaro.org>, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, trivial@kernel.org
Subject: Re: [PATCH 01/15] staging: vt6655: remove filename from baseband.h
Message-ID: <YQAIm5Fe7HCC8Sea@kroah.com>
References: <20210723144340.15787-1-lucas.henneman@linaro.org>
 <YPrcnylo47dFU8Cl@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPrcnylo47dFU8Cl@google.com>

On Fri, Jul 23, 2021 at 04:13:35PM +0100, Lee Jones wrote:
> On Fri, 23 Jul 2021, Lucas Henneman wrote:
> 
> > This patch resolves checkpatch's warning, "It's generally not useful to
> > have the filename in the file" for baseband.h.
> 
> I would paste the exact warning you get from checkpatch.pl, warts
> (line numbers) and all on a completely separate line.
> 
> > Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
> > ---
> >  drivers/staging/vt6655/baseband.h | 2 --
> >  1 file changed, 2 deletions(-)
> 
> Nice first attempt at working with Mainline Lucas.
> 
> The premise of the patches seem okay.  I don't personally allow
> filenames into new commits in subsystems I maintain.
> 
> Seeing as though these patches are *so* trivial, if I were Greg, I'd
> be asking you to bundle each of these changes into a single patch.

I'll take these as-is, it's fine.

thanks,

greg k-h
