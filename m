Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E932A65F
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 12:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C10C340ED;
	Thu, 31 Mar 2022 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648729881;
	bh=NmdQDPXR8+F0xe6Dr6/W7d0mIhGtR/BoO/i7pZkPbF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bx/sb225B70SPkqSjfn7SXxBA39EqrZLLKWxz4S8eNnSEIe/r0dxc3wmdlTevnJMA
	 9oVjSLsvT3cJBJZQ2q+Xe5QUpaprvixrSKcDC30v4XKqaq3zB6B2DdNzamAbJME3hg
	 X+Ikw9isL5lWz/KxAbi7IMUawDlDH/gWmTsflUmY=
Date: Thu, 31 Mar 2022 14:31:17 +0200
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
Message-ID: <YkWfFUjvgGfvAg3r@kroah.com>
References: <SL2P216MB12463DE2E1E100E2498A5C33FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <SL2P216MB1246D7900A0B9620F1E1A038FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <YkWRN4ac0ivRn4aB@kroah.com>
 <CAFr9PXm3Mvr0guGoPDKmashMhFG6OQMvXHxwX-SD5ZHPi_sw4g@mail.gmail.com>
 <YkWV6HGkGHvgSwCj@kroah.com>
 <CAFr9PX=s0CRtcVw_5xk7F6MRZ+svFK_cUDRzdaOFxcPGe4tBmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PX=s0CRtcVw_5xk7F6MRZ+svFK_cUDRzdaOFxcPGe4tBmA@mail.gmail.com>

On Thu, Mar 31, 2022 at 09:00:28PM +0900, Daniel Palmer wrote:
> Hi Greg,
> 
> On Thu, 31 Mar 2022 at 20:52, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > According to the text in this driver, it will not work on these hardware
> > as it is broken.  Unless that text is incorrect?
> 
> I think that's for risc-v.
> The other chip this is in is ARM Cortex A7. The crusty vendor linux
> BSP for this chip manages to play videos using it so it does work in a
> real piece of hardware.

So are you going to be able to work with this driver to get it out of
staging if you have the hardware?  Otherwise it makes no sense to stick
it here for a year without anyone being able to work on it.

thanks,

greg k-h
