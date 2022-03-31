Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F257C
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 11:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B859CC340ED;
	Thu, 31 Mar 2022 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648727532;
	bh=a9mOGUgdT7iAt7EJjQ3oddc3bHbgvXVhoDNeftyXSOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1WjV00TzByu4odN/Jd/wbIsLJYni8j06eg/1pLy691kCqk1pKR+81SFXT90QA5c9
	 oOO4qprKkNn4qnzzmGB7GIIT09rX3qEQdDQ3alsFRQ2D4Xr9ysZqcm/tu1QV2TeQv0
	 0T3UUlJx0wJNoUOBvlnh56UBEeox6oMGhXAgme78=
Date: Thu, 31 Mar 2022 13:52:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"kernel@collabora.com" <kernel@collabora.com>,
	"dafna3@gmail.com" <dafna3@gmail.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"kiril.bicevski@collabora.com" <kiril.bicevski@collabora.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>,
	Scott Woo <scott.woo@chipsnmedia.com>,
	"olivier.crete@collabora.com" <olivier.crete@collabora.com>,
	"dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH v6 4/6] staging: media: wave5: Add TODO file
Message-ID: <YkWV6HGkGHvgSwCj@kroah.com>
References: <SL2P216MB12463DE2E1E100E2498A5C33FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <SL2P216MB1246D7900A0B9620F1E1A038FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <YkWRN4ac0ivRn4aB@kroah.com>
 <CAFr9PXm3Mvr0guGoPDKmashMhFG6OQMvXHxwX-SD5ZHPi_sw4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXm3Mvr0guGoPDKmashMhFG6OQMvXHxwX-SD5ZHPi_sw4g@mail.gmail.com>

On Thu, Mar 31, 2022 at 08:42:40PM +0900, Daniel Palmer wrote:
> Hi Greg,
> 
> On Thu, 31 Mar 2022 at 20:32, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > > +  Until we can test and resolve any issues on final silicon (due 2H 2021)
> > > +  this driver should remain in staging.
> >
> > Then why not just wait?  Why merge this now?  What is the benifit of us
> > taking this code at this point in time for hardware that is no one has
> > as it is not even created?
> 
> FWIW there is an SoC that is supported (if console from initramfs on
> uart counts..) in mainline, Sigmastar ssd202d, that has this IP so it
> exists in the wild.
> I have tried to get this driver running on it and it did something but
> didn't get far enough to actually decode video.

According to the text in this driver, it will not work on these hardware
as it is broken.  Unless that text is incorrect?

greg k-h
