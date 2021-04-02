Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626BB70
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 12:47:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54DFF61106;
	Fri,  2 Apr 2021 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617367632;
	bh=zxuhmIWb9ulD0jMERTAwiNj/4ow7lzX4fNftxtw8LIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhb37daATvI06G+um3eDcB4v6r3Tck6S22o2x7w+GwEN1bsJHXMMnRSerxrQ9vURW
	 TEKL/8XwmsAYmn/OGaZ2NpGR2imaepPvL4CRbUdeNFbyOpms1hB63Tqc+s3bT2tTBY
	 fEKJSTrggKjWnc2Oq3rowFGrubP3rNAGcsRRfiUc=
Date: Fri, 2 Apr 2021 14:47:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] staging: rtl8723bs: remove RT_TRACE logs in
 core/rtw_xmit.c
Message-ID: <YGcSTvoyPtBsXgfp@kroah.com>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
 <72ab5222629f912ca2dbe825d194108992d321e7.1617356821.git.fabioaiuto83@gmail.com>
 <20210402115626.GV2088@kadam>
 <20210402124045.GA1420@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210402124045.GA1420@agape.jhs>

On Fri, Apr 02, 2021 at 02:40:46PM +0200, Fabio Aiuto wrote:
> On Fri, Apr 02, 2021 at 02:56:26PM +0300, Dan Carpenter wrote:
> > On Fri, Apr 02, 2021 at 12:01:21PM +0200, Fabio Aiuto wrote:
> > > @@ -568,20 +561,11 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
> > >  	if (pattrib->encrypt > 0)
> > >  		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
> > >  
> > > -	RT_TRACE(_module_rtl871x_xmit_c_, _drv_info_,
> > > -		("update_attrib: encrypt =%d  securitypriv.sw_encrypt =%d\n",
> > > -		pattrib->encrypt, padapter->securitypriv.sw_encrypt));
> > > -
> > >  	if (pattrib->encrypt &&
> > > -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> > > +		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
> > 
> > You've done too much clean up here.  Just remove the { but leave the
> > == true/false comparisons.
> > 
> > If the patch is only changing five lines or code then fixing checkpatch
> > warnings on the line of code you are changing is fine, but in this case
> > you're doing a bunch of changes and these sort of cleanups make it hard
> > to review.
> > 
> > Ease to spot that the curly brace changed:
> > -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> > +		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false)))
> > 
> > Hard to spot:
> > -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> > +		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
> > 
> > regards,
> > dan carpenter
> > 
> 
> thank you Dan, it's a good tuning process for me. Shall I resend the
> whole patchset? Maybe some of them are ok...

Yes please, you do not want me to pick and choose individual patches out
of this series.  Our tools grab the whole series at once to apply them.

thanks,

greg k-h
