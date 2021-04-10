Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246C70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:55:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0E986115A;
	Sat, 10 Apr 2021 13:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618062952;
	bh=+2oaVVdSbdeETRDIulQvK38BCijkBUmD2tjAHcVSdsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuO8zKbvO6RmTwaHb0OVkUNRTEQSLajmyzw7ginW5ncqdCFJnCduejDHqprdlDtoC
	 HGDMmSwWpnWrrHi8QZIa2lqxCvXGF/DX4b1YtyuABQJIaTfpQZHqqfb8VZ190JwQDs
	 TK+6OJP6gPcLizksUywX05PLggLetJaCeIe1zXAM=
Date: Sat, 10 Apr 2021 15:55:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 4/4] staging: rtl8723bs: Change the
 type and use of a variable
Message-ID: <YHGuZc2G/DVB8ZvE@kroah.com>
References: <20210410092232.15155-1-fmdefrancesco@gmail.com>
 <2186059.xkuF2sVEJi@localhost.localdomain>
 <alpine.DEB.2.22.394.2104101524260.2975@hadrien>
 <3114102.qbl0ZuBMXl@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3114102.qbl0ZuBMXl@localhost.localdomain>

On Sat, Apr 10, 2021 at 03:53:38PM +0200, Fabio M. De Francesco wrote:
> On Saturday, April 10, 2021 3:24:43 PM CEST Julia Lawall wrote:
> > On Sat, 10 Apr 2021, Fabio M. De Francesco wrote:
> > > On Saturday, April 10, 2021 2:12:28 PM CEST Julia Lawall wrote:
> > > > On Sat, 10 Apr 2021, Fabio M. De Francesco wrote:
> > > > > On Saturday, April 10, 2021 1:37:30 PM CEST Julia Lawall wrote:
> > > > > > > That variable has global scope and is assigned at least in:
> > > > > > What do you mean by global scope?  None of the following look
> > > > > > like
> > > > > > references to global variables.
> > > > > > 
> > > > > > julia
> > > > > 
> > > > > I just mean that fw_current_in_ps_mode is a field of a struct in a
> > > > > .h
> > > > > file included everywhere in this driver and that the functions whom
> > > > > the following assignments belong to have not the "static" type
> > > > > modifier.
> > > > 
> > > > OK, but a field in a structure is not a variable, and this is not
> > > > what
> > > > scope means.
> > > 
> > > You're right, a field in a structure is not a variable.
> > > 
> > > > int x;
> > > > 
> > > > outside of anything is a global variable (global scope).
> > > > 
> > > > int foo() {
> > > > 
> > > >   int x;
> > > >   ...
> > > > 
> > > > }
> > > > 
> > > > Here x is a local variable.  Its scope is the body of the function.
> > > > 
> > > > int foo() {
> > > > 
> > > >   if (abc) {
> > > >   
> > > >     int x;
> > > >     ...
> > > >   
> > > >   }
> > > > 
> > > > }
> > > > 
> > > > Here x is a local variable, but its scope is only in the if branch.
> > > 
> > > And you're right again: I needed a little refresh of my knowledge of C.
> > > 
> > > I've searched again in the code for the purpose of finding out if that
> > > struct is initialized with global scope but I didn't find anything. I
> > > didn't even find any dynamic allocation within functions that returns
> > > pointers to that struct.
> > > 
> > > Therefore, according to Greg's request, I'll delete that stupid 'if'
> > > statement in the patch series v2 that I'm about to submit.
> > 
> > I'm really not clear on why the if should be deleted.
> > 
> > julia
> >
> I'm supposed to delete it because of the review made by Greg. In a couple 
> of previous messages he wrote:
> 
> "If this is only checked, how can it ever be true?  Who ever sets this 
> value?"
> 
> and then:
> 
> "Just delete the variable from the structure entirely and when it is
> used.".
> 
> However, like you, I'm not sure yet.

I don't think any of us are, try fixing up what you think is right and
resend and we can go from there :)

