Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB437C
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 07:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE77DC340E8;
	Sat, 26 Feb 2022 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645862351;
	bh=VHjr7f2HRH0bpdum7Sn3FYXa463vDmGzha8n5Y5qImY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPIeBCiOzDi5VBowjjOLlNe6PtOuuZ+7BTsmNS67AXSd5BbXi8ERagNt8jn3DCr8q
	 r6bQM2SoUz83RV/tl0CNNeyC9u0Nq50UMlkie1YcMsyQCrUL9GWsAEc4QVPD8WUtXJ
	 c60Wnh0fJvUb5CcfT/qmIIc+Y9hWl1ES8wehQ0Y8=
Date: Sat, 26 Feb 2022 08:59:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-staging@lists.linux.dev
Subject: Re: [GIT PULL] Staging driver fix for 5.17-rc6
Message-ID: <Yhndy5cTzhJh7abq@kroah.com>
References: <YhjYPIRvDnV7XAzV@kroah.com>
 <CAHk-=wjLvye-_qj-J=dVWhFf7S8noL6d-szRtFYq_hoOk6J1Eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjLvye-_qj-J=dVWhFf7S8noL6d-szRtFYq_hoOk6J1Eg@mail.gmail.com>

On Fri, Feb 25, 2022 at 11:57:43AM -0800, Linus Torvalds wrote:
> On Fri, Feb 25, 2022 at 5:23 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > It resolves a reported problem in the fbtft fb_st7789v.c driver that
> > could cause the display to be flipped in cold weather.
> 
> LOL. WTF?
> 
> I just had to read the commit message for that odd thing.

Here it is in the real world, I should have added this to the changelog,
but I figured the url might not be permanent:
	https://www.core77.com/posts/111994/Hyundais-Strange-Cold-Weather-UI-Bug-Digital-Dashboard-Rotates-Flips-Display

