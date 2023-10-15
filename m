Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D863DD;
	Sun, 15 Oct 2023 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vUAMFCEw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB52C433C8;
	Sun, 15 Oct 2023 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697374253;
	bh=DcgxkIYZsMPY4HuUkYYrrImJhC13skqc0B+si2SPaMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vUAMFCEwwURYpNXvfZUqu8XZVw31wCE4N6z2dHc2YdTtD4A1T2oTbB6K7leOa+qJi
	 goCEUFgj6BRDi1CxJbluz6I1p+WBF4ZdWzMfVqzA8hA1NffONVqEQrVYax+52P3+wz
	 L6eiZ/Lr5ePyQ6jTdQSRwTriG3daFVGmQco36FQw=
Date: Sun, 15 Oct 2023 14:50:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] tty: gdm724x: Add blank line after declaration
Message-ID: <2023101508-curry-disorder-1b10@gregkh>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
 <3b24ca9976cf873dbaadb499e09d7b545e9db89c.1697184167.git.soumya.negi97@gmail.com>
 <2023101551-placidly-garnish-3ee7@gregkh>
 <20231015060716.GA31326@Negi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231015060716.GA31326@Negi>

On Sat, Oct 14, 2023 at 11:07:16PM -0700, Soumya Negi wrote:
> On Sun, Oct 15, 2023 at 07:37:30AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Oct 13, 2023 at 01:26:35AM -0700, Soumya Negi wrote:
> > > Fix WARNING: Missing a blank line after declarations
> > > Issue found by checkpatch.pl
> > > 
> > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > ---
> > >  drivers/staging/gdm724x/gdm_tty.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > Why do you have "tty:" as the prefix for a staging driver?  Shouldn't it
> > be "staging: gdm724x: ...."?
> 
> Hi Greg,
> 
> Thats what I thought too. But when I looked at the git history for
> gdm_tty.c the last few commits had "tty:". So I went with that.

That is because those commits were tty-wide, and they changed things in
multiple drivers all at once, not just for the one file.

> Should I change it to "staging:"?

Please do.

thanks,

greg k-h
