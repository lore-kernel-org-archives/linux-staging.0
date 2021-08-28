Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A673772
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 09:46:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C60E60ED3;
	Sat, 28 Aug 2021 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630143996;
	bh=SiGJxzk16eUk9XGSCPM4wzNg/e5oL3uafMhtUaj0g+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRLnpRQmpIhLLvrnzK8oTpqSxuKwXAyg6z2i3RQI8WrSVMKyOCUoPlfxipAj/AkJr
	 JVHH1bg9v042ynF0TL5l85Yf5eUzUlbcWLa+MTNhQtX7u2y5VVR3GlIIYchj2gX6Oh
	 056W8pFQNRi6EBbDOi6mDmeOaXp78mH9HoeoB0R8=
Date: Sat, 28 Aug 2021 11:46:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krish Jain <krishjain02939@gmail.com>
Cc: Bryan Brattlof <hello@bryanbrattlof.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Declare the file_operations struct as const
Message-ID: <YSoF+VcDuW/2ojjF@kroah.com>
References: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>
 <3634721.RBzQ2xsved@localhost.localdomain>
 <1742120.GgyQvu0Ciu@localhost.localdomain>
 <CAPGkw+yJ=V0OwFE+uqCeWWS8JbJD=YBE3+Uk-OKpmHRnvSTh+A@mail.gmail.com>
 <CAPGkw+w-y+iC3dMDLxi8DR3N+jf8roiJ2Vs_-uHxJ=i57eTiUA@mail.gmail.com>
 <CAPGkw+zyj4e-m19KdrHpAN_vHksNDy=k_cPPAftSN-hNoph0=w@mail.gmail.com>
 <20210827233835.px4az5hyqks2n4o5@h510>
 <CAPGkw+wq6LcVXSmuoDcTqOo=ULBBT_4DVXqXnpf7S5GW3Vzy2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGkw+wq6LcVXSmuoDcTqOo=ULBBT_4DVXqXnpf7S5GW3Vzy2w@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Sat, Aug 28, 2021 at 11:37:50AM +0200, Krish Jain wrote:
> Hi. Thanks for your response. Changing to  "const static" would fix
> the first error but looking at the second error indicates that it
> can't be a const, right? So checkpatch.pl was wrong?

checkpatch.pl is a perl script that does its best here.  You always have
to then look at the code itself to see if what it is asking you to do is
correct.

And you always have to at the very least, test build your changes to
verify that they do not break anything.

thanks,

greg k-h
