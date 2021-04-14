Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E86D14
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 10:28:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DFE1613BB;
	Wed, 14 Apr 2021 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618396093;
	bh=inLOHc4mEA6C0jmfnEWMrWnf4KZT+SYwxR2duFTHKco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzFHRemJebaD9YD5jVtByERtwtXJd3I9oEx+xDcAe5U6ZwAXcVcfxU/sZCNm5IA8/
	 s6YuJMnHMHrUHprR8iZt5AKNXb5qCpJcGg8e0sClB5Op7TlZ8XL+8PiOcPoZddqtN2
	 mL2vZHZMhiVOKJ7f+lHHN/LS4qo9zqwY8/7EVhgg=
Date: Wed, 14 Apr 2021 12:28:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: julia.lawall@inria.fr, joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] staging: rtl8723bs: replace DBG_871X_SEL_NL with
 netdev_dbg()
Message-ID: <YHbDu8LtSzR8Vj6y@kroah.com>
References: <cover.1618325614.git.fabioaiuto83@gmail.com>
 <a798262b8e1dacf225dd42f2863243c543667d5f.1618325614.git.fabioaiuto83@gmail.com>
 <YHanGdS1Kc/4zq4q@kroah.com>
 <20210414094340.GB3931@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414094340.GB3931@agape.jhs>

On Wed, Apr 14, 2021 at 11:43:41AM +0200, Fabio Aiuto wrote:
> On Wed, Apr 14, 2021 at 10:26:01AM +0200, Greg KH wrote:
> > > -	DBG_871X_SEL_NL(sel, "%10s %16s %8s %10s %11s %14s\n",
> > > -			"TH_L2H_ini", "TH_EDCCA_HL_diff", "IGI_Base",
> > > -			"ForceEDCCA", "AdapEn_RSSI", "IGI_LowerBound");
> > > -	DBG_871X_SEL_NL(sel, "0x%-8x %-16d 0x%-6x %-10d %-11u %-14u\n",
> > > -			(u8)odm->TH_L2H_ini,
> > > -			odm->TH_EDCCA_HL_diff,
> > > -			odm->IGI_Base,
> > > -			odm->ForceEDCCA,
> > > -			odm->AdapEn_RSSI,
> > > -			odm->IGI_LowerBound
> > > -	);
> > > +	netdev_dbg(adapter->pnetdev, "%10s %16s %8s %10s %11s %14s\n",
> > > +		   "TH_L2H_ini", "TH_EDCCA_HL_diff", "IGI_Base", "ForceEDCCA",
> > > +		   "AdapEn_RSSI", "IGI_LowerBound");netdev_dbg(adapter->pnetdev,
> > > +							       "0x%-8x %-16d 0x%-6x %-10d %-11u %-14u\n",
> > > +							       (u8)odm->TH_L2H_ini,
> > > +							       odm->TH_EDCCA_HL_diff,
> > > +							       odm->IGI_Base,
> > > +							       odm->ForceEDCCA,
> > > +							       odm->AdapEn_RSSI,
> > > +							       odm->IGI_LowerBound);
> > 
> > Something went wrong with this change :(
> 
> thanks Greg, I sent an example to Julia, that reproduce the problem.
> As soon as it gets fixed I will send you a v2.

You can fix it up yourself "by hand" for now, no need to wait for a tool
fix :)
