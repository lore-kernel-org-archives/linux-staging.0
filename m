Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700A770
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 17:16:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: ezequiel)
	with ESMTPSA id 9177C1F46A0F
Message-ID: <88e48e7bb5679b913e3f223d29b566ce8c18e9c3.camel@collabora.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From: Ezequiel Garcia <ezequiel@collabora.com>
To: ascordeiro <alinesantanacordeiro@gmail.com>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date: Fri, 09 Apr 2021 14:15:56 -0300
In-Reply-To: <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
References: <20210409135404.GA26172@focaruja>
	 <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
	 <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-09 at 14:00 -0300, ascordeiro wrote:
> Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > Hi Aline,
> 
> Hi Ezequiel,
> > 
> > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> > > Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> > > and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> > > code style.
> > > 
> > 
> > Where is this written in the Coding Style?
> 
> I found this in section 12, about Macros, Enums and RTL in both
> references:
> https://www.kernel.org/doc/html/latest/process/coding-style.html
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst

It seems this

"""
CAPITALIZED macro names are appreciated but macros resembling functions may be named in lower case.
"""

It's just a suggestion, not a big deal. In general, if checkpatch.pl
is not complaining, it's not worth the trouble.

So let's skip this fix.

Thanks a lot!
Ezequiel

