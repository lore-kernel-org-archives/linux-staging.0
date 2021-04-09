Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736870
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 17:42:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: ezequiel)
	with ESMTPSA id 9377B1F469A9
Message-ID: <532a72f6fcb6f51451e12444413c0ad4441a679d.camel@collabora.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Julia Lawall <julia.lawall@inria.fr>, ascordeiro
	 <alinesantanacordeiro@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date: Fri, 09 Apr 2021 14:42:02 -0300
In-Reply-To: <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
References: <20210409135404.GA26172@focaruja>
	  <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
	 <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
	 <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-09 at 19:25 +0200, Julia Lawall wrote:
> 
> 
> On Fri, 9 Apr 2021, ascordeiro wrote:
> 
> > Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > > Hi Aline,
> > 
> > Hi Ezequiel,
> > > 
> > > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> > > > Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> > > > and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> > > > code style.
> 
> Maybe you can see if these macros can be converted to static inline
> functions.  Macros don't provide any type checking.
> 

I'd like to leave these as they are for now, tbh ^_^

A more massive refactoring is needed in this driver,
but it needs proper testing and it's a more complex plan.

Thanks!
Ezequiel

