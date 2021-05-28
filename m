Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE8429CA
	for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 09:56:31 +0000 (UTC)
IronPort-SDR: 3MtNgvk7JBK8dseRumevrn6UyQdsACOWukj9Ja+354xue4wsfJCugOR+XjKDCBNRAAkm7FAuYP
 ic6dLLPJQIAg==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="202699735"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="202699735"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:56:30 -0700
IronPort-SDR: lHedNBtMjWa7HpWVCW9aObzHnYW23RnXYGsPsppyc6Ei+P04eyzXOHyu8ZfV457u3N4AOaUWI7
 wqEwtzQiUwfw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="480985811"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:56:28 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 09160202F7;
	Fri, 28 May 2021 12:56:26 +0300 (EEST)
Date: Fri, 28 May 2021 12:56:26 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Christoph Hellwig <hch@lst.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: remove compat_ioctl32 code
Message-ID: <20210528095625.GO3@paasikivi.fi.intel.com>
References: <20210516204818.2967910-1-arnd@kernel.org>
 <20210524151829.GO3@paasikivi.fi.intel.com>
 <CAK8P3a1--fRJ0A+XwOPFLNDNUU7uFWi_LiPCAoCQ53GYZknvpg@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1--fRJ0A+XwOPFLNDNUU7uFWi_LiPCAoCQ53GYZknvpg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 28, 2021 at 09:19:46AM +0200, Arnd Bergmann wrote:
> On Mon, May 24, 2021 at 5:18 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Sun, May 16, 2021 at 10:47:43PM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This is one of the last remaining users of compat_alloc_user_space()
> > > and copy_in_user(), which are in the process of getting removed.
> > >
> > > As of commit 57e6b6f2303e ("media: atomisp_fops.c: disable
> > > atomisp_compat_ioctl32"), nothing in this file is actually getting used
> > > as the only reference has been stubbed out.
> >
> > This patch was made redundant by another one that fixed the bug. But I
> > guess you're right in the sense that no-one could have used this because of
> > the patch that disabled it.
> >
> > So:
> >
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > But:
> >
> > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > > index f1e6b2597853..e383e17c5072 100644
> > > --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > > +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > > @@ -1283,7 +1283,8 @@ const struct v4l2_file_operations atomisp_fops = {
> > >       .unlocked_ioctl = video_ioctl2,
> > >  #ifdef CONFIG_COMPAT
> > >       /*
> > > -      * There are problems with this code. Disable this for now.
> > > +      * this was removed because of bugs, the interface
> > > +      * needs to be made safe for compat tasks instead.
> > >       .compat_ioctl32 = atomisp_compat_ioctl32,
> >
> > I think the comment could go, too.
> 
> Should I replace it with an entry in the TODO file then?

On second thought, it's fine.

The lack of compat ioctl support is not among the biggest issues anyway.

-- 
Sakari Ailus
