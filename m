Received: from smtprelay.hostedemail.com (smtprelay0245.hostedemail.com [216.40.44.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5223FC1
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 18:36:23 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave08.hostedemail.com (Postfix) with ESMTP id DA77E18008664
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 16:09:41 +0000 (UTC)
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay08.hostedemail.com (Postfix) with ESMTP id 3381E182CF665;
	Fri, 27 Aug 2021 16:09:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id D46641A29F9;
	Fri, 27 Aug 2021 16:09:33 +0000 (UTC)
Message-ID: <628285fc7757f020159503d4d3b45790e73f0133.camel@perches.com>
Subject: Re: [PATCH 0/5] vsprintf and uses: Add upper case output to %*ph
 extension
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Andy Shevchenko
	 <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-scsi@vger.kernel.org,
  storagedev@microchip.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Date: Fri, 27 Aug 2021 09:09:32 -0700
In-Reply-To: <YSi9NufNS18rRpmE@kroah.com>
References: <cover.1630003183.git.joe@perches.com>
	 <YSiZlyQzgW8umsjj@smile.fi.intel.com>
	 <4b8e2987c1ff384bac497a20fcd75f9051990cff.camel@perches.com>
	 <YSimXPUVcy9zhpYG@smile.fi.intel.com> <YSi9NufNS18rRpmE@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.73
X-Stat-Signature: aby4s94qy84u5x9x6aqguca3q11mh8d3
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: D46641A29F9
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18E1EtdtIkXuy4sqiURYIDYh0DNlDpJ/ag=
X-HE-Tag: 1630080573-979598

On Fri, 2021-08-27 at 12:23 +0200, Greg KH wrote:
> On Fri, Aug 27, 2021 at 11:46:20AM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 27, 2021 at 01:10:41AM -0700, Joe Perches wrote:
> > > On Fri, 2021-08-27 at 10:51 +0300, Andy Shevchenko wrote:
> > > > On Thu, Aug 26, 2021 at 11:43:00AM -0700, Joe Perches wrote:
> > > > > Several sysfs uses that could use %*ph are upper case hex output.
> > > > > Add a flag to the short hex formatting routine in vsprintf to support them.
> > > > > Add documentation too.
> > > > 
> > > > Thanks!
> > > > 
> > > > Unfortunately I have got only first patch and this cover letter. Can you,
> > > > please, Cc entire series?
> > > 
> > > It's on lore.
> > > 
> > > https://lore.kernel.org/lkml/cover.1630003183.git.joe@perches.com/T/#u
> > 
> > Thanks. So, you won't me to review them in a regular way :-)
> > 
> > TBH, I think those examples may pretty much be safe to use small
> > letters always.
> 
> I agree, let's just fix the users here to use small letters instead of
> adding another modifier to the kernel.

ABI _should_ mean stability for random parsers.

I don't use these so I don't care that much.

