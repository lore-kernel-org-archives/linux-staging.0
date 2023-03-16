Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5CE20EE;
	Thu, 16 Mar 2023 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MX9PWOpl+gczMtq6Tm3f+M+4h8XUnDLXB2g0cF3zAzw=;
  b=ltiDjQzBUYZCsQcR73I8iQnd1u36LMOBnjeOFe36EYS3w9Qp8tyh5iw2
   NoVLBuUhT0EP3xegaN6w3qzRRW2j8D33kIdqoS6vrs1VGO433CkzP+B0q
   dzzH7d1FDsdm3X2LZo+K4soiDhTS1F3nTmZPX18NRIoIUTVXlnDtugvL0
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="50339159"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 09:27:13 +0100
Date: Thu, 16 Mar 2023 09:27:13 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sumitra Sharma <sumitraartsy@gmail.com>
cc: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev, 
    manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com, 
    gregkh@linuxfoundation.org, netdev@vger.kernel.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Staging: qlge: Fix indentation in conditional
 statement
In-Reply-To: <20230316081428.GA47053@sumitra.com>
Message-ID: <c6cb3428-a785-195b-ffae-d715f3aacee7@inria.fr>
References: <20230314121152.GA38979@sumitra.com> <6e12c373-2bfd-48d8-b77d-17f710c094f7@kili.mountain> <20230316081428.GA47053@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 16 Mar 2023, Sumitra Sharma wrote:

> On Wed, Mar 15, 2023 at 10:47:21AM +0300, Dan Carpenter wrote:
> > On Tue, Mar 14, 2023 at 05:11:52AM -0700, Sumitra Sharma wrote:
> > > Add tabs/spaces in conditional statements in to fix the
> > > indentation.
> > >
> > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > >
> > > ---
> > > v2: Fix indentation in conditional statement, noted by Dan Carpenter
> > >  <error27@gmail.com>
> > > v3: Apply changes to fresh git tree
> > >
> >
> > Thanks!
> >
> > Reviewed-by: Dan Carpenter <error27@gmail.com>
> >
>
> Hi dan,
>
> Will this be considered as my first accepted patch? :)


I think it is accepted only when Greg takes it into his tree and you can
have a link for it.

julia

>
> Regards,
>
> Sumitra
> > regards,
> > dan carpenter
> >
>
>
