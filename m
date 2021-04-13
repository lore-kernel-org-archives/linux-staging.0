Received: from smtprelay.hostedemail.com (smtprelay0023.hostedemail.com [216.40.44.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CAF72
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:41:33 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id D59DC1800C607
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 17:43:34 +0000 (UTC)
Received: from omf09.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id 0065F100E7B46;
	Tue, 13 Apr 2021 17:43:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id 87B871E04D8;
	Tue, 13 Apr 2021 17:43:25 +0000 (UTC)
Message-ID: <84b4db0f2c82adbd82e2b93f5b1511730cb0678e.camel@perches.com>
Subject: Re: [PATCH] staging: media: tegra-vde: Align line break to match
 with the open parenthesis in file trace.h
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Thierry Reding
	 <thierry.reding@gmail.com>
Cc: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Andy Whitcroft
 <apw@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Dmitry
 Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter
 <jonathanh@nvidia.com>,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>,
 outreachy-kernel@googlegroups.com
Date: Tue, 13 Apr 2021 10:43:24 -0700
In-Reply-To: <CABJPP5AEtg+615Q2d-d9aZf=CE7EFPKEbc7tr=gKo_H-XL+M5Q@mail.gmail.com>
References: <20210412222040.GA13659@focaruja>
	 <YHW5Fwl55c7NJAeo@orome.fritz.box>
	 <CABJPP5AEtg+615Q2d-d9aZf=CE7EFPKEbc7tr=gKo_H-XL+M5Q@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.60
X-Stat-Signature: 9aydssrki5wx43zq6s8qzajxi8wuht6h
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 87B871E04D8
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/QF9YzwubwiFOs9EBwe/ADGp4cP1fI5cc=
X-HE-Tag: 1618335805-903163

On Tue, 2021-04-13 at 21:35 +0530, Dwaipayan Ray wrote:
> On Tue, Apr 13, 2021 at 8:59 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > 
> > On Mon, Apr 12, 2021 at 07:20:40PM -0300, Aline Santana Cordeiro wrote:
> > > Align line break to match with the open parenthesis.
> > > Issue detected by checkpatch.pl.
> > > It consequently solved a few end lines with a '(',
> > > issue also detected by checkpatch.pl
> > > 
> > > Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-vde/trace.h | 111 ++++++++++++++------------------
> > >  1 file changed, 50 insertions(+), 61 deletions(-)
> > 
> > Ugh... I'd say this is one case where checkpatch.pl really shouldn't be
> > complaining since this isn't a function call or declaration. It's more
> > like a code snippet written with macros, so I don't think the same rules
> > should apply.
> > 
> > Adding checkpatch folks (hence quoting in full): is there anything we
> > can do about this without too much effort? Or should we just accept this
> > the way it is?
> > 
> 
> While it may be possible to add exceptions for trace headers on the
> alignment rules, I don't know how many more such exceptions we will
> end up adding. Such fine grained checks might be unnecessarily complex.
> So I think we should just accept the way it is for now.
> 
> Joe might have a different opinion?

Tracing uses a different style.

Maybe just suppress various messages for complete code blocks
of DECLARE_EVENT_CLASS, DEFINE_EVENT, and TRACE_EVENT


