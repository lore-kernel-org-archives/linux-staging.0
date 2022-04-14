Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512BA7A;
	Thu, 14 Apr 2022 15:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649949248; x=1681485248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E4PUTnraDM0XdbC1S7MHSeZ4c0C1t7c9n5lWV8zDjmA=;
  b=bPmdgUg53qLfiJnMBH1UI1RqbTkhR+hANBY1RDTCzOPiedjYGznwpG6H
   UlYD9tevuWrUlvxHAPl5w/zEC2TXolLCBkNKwLfR1Yewplyox4RciRau4
   sqgJ2h6Q+IbILfPy83HgpCiAGQmxFoKOfbhDLdjSSrGMvRaWWDQXNe8oa
   cyb/hIYXON2nBZjtnwvm0JTffkJ6dvLxQzbqLfhqM3C6IwlPF00xtVH3l
   8nlQwZry/zjgp9MYDZCxQ0iBqAnkSYz8SaUheVDloqZgX6QicMB5qPTIH
   eM3Yq4lcYO1Wo+w6/YEvV0uziWDg17K0fuALslhkaFZ5tIiTyHmrDiEtA
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="263129425"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; 
   d="scan'208";a="263129425"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 08:14:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; 
   d="scan'208";a="552721354"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 08:14:07 -0700
Date: Thu, 14 Apr 2022 08:16:00 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Aliya <aliyarahmani786@gmail.com>
Cc: "sudipm.mukherjee@gmail.com" <sudipm.mukherjee@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>
Subject: Re: [PATCH] staging: sm750fb: Remove volatile
Message-ID: <20220414151600.GA1246500@alison-desk>
References: <20220413203914.59533-1-aliyarahmani786@gmail.com>
 <20220414011156.GA1243803@alison-desk>
 <CAGTWmRGPyD8_zSQu17eQ5MQnYyxFaLQuL8L+H5=J-Td9n5VsOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGTWmRGPyD8_zSQu17eQ5MQnYyxFaLQuL8L+H5=J-Td9n5VsOg@mail.gmail.com>

On Wed, Apr 13, 2022 at 11:06:53PM -0700, Aliya wrote:
> On Thu, Apr 14, 2022 at 6:40 AM Alison Schofield
> <alison.schofield@intel.com> wrote:
> >
> > On Thu, Apr 14, 2022 at 02:09:15AM +0530, Aliya Rahmani wrote:
> >
> > Hi Aliya,
> >
> > Wondering why the recipient list different than this:
> >
> > $ perl scripts/get_maintainer.pl --nogit-fallback --no-rolestats -f drivers/staging/sm750fb/sm750.h
> > Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > Teddy Wang <teddy.wang@siliconmotion.com>
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > linux-fbdev@vger.kernel.org
> > linux-staging@lists.linux.dev
> > linux-kernel@vger.kernel.org
> >
> Do I need to include all the maintainers and mailing lists?

Usually - yes. It's possible that a maintainer has instructed
otherwise, and in that case the maintainers file can be updated.
That's why I posed it as a 'wondering why' question :)

Instructions for using get_maintainers.pl are here:
https://kernelnewbies.org/Outreachyfirstpatch

And, here's a prior round email discussion of same:
https://lore.kernel.org/outreachy/20211015171331.GA431883@alison-desk/

Alison

> >





> > > Remove volatile to fix checkpatch.pl warning.
> > >
> > > Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> > > ---
> > >  drivers/staging/sm750fb/sm750.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> > > index aff69661c8e6..7a11f8593596 100644
> > > --- a/drivers/staging/sm750fb/sm750.h
> > > +++ b/drivers/staging/sm750fb/sm750.h
> > > @@ -52,7 +52,7 @@ struct lynx_accel {
> > >       /* base virtual address of DPR registers */
> > >       volatile unsigned char __iomem *dprBase;
> > >       /* base virtual address of de data port */
> > > -     volatile unsigned char __iomem *dpPortBase;
> > > +     unsigned char __iomem *dpPortBase;
> > >
> > >       /* function pointers */
> > >       void (*de_init)(struct lynx_accel *accel);
> > > --
> > > 2.25.1
> > >
> > >
> 
> Thanks,
> Aliya
