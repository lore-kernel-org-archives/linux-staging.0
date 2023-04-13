Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8FAD28
	for <linux-staging@lists.linux.dev>; Thu, 13 Apr 2023 16:17:32 +0000 (UTC)
Received: from lenoch ([91.218.190.200])
	by cmgsmtp with ESMTPSA
	id mzdZpFW1YPm6CmzdapKsBV; Thu, 13 Apr 2023 18:17:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1681402650; bh=2KiT7NBU6r25sO3GW3qL8zvFELXNNyDdgupz/OiuxSU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=3EKZbqbIcHhVMDvyv9AWRz0vQt9QO/9/jqAvEq3ARb/16ZOhHzHs+kRd+h2LSa8PZ
	 zqK7v0c1sK81nerMUzdiH8aOzrIHtWwOJIwEtOOqCo/xdLbmW1oXS8OkiOKIf3vchT
	 3nroU/5tmrHoRj0GQ2flbaZYZCl9RVylkHyUcBqnaKxBwepzfzx+VrBTAXO76YTwsP
	 bv5kL4VXMs3lH5apUSbWMmZTB//3zQ0nJm2D2ojOl5sgbgNhFkpUIQv9dSmO5M7qWY
	 WNpbPwfAQtdv0qTxX98lvhc5PLQJhVziz13LTHzyF4jTh5QOKmogF8L+dIWB2ZyBwK
	 HeGhTuVwzK8Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1681402650; bh=2KiT7NBU6r25sO3GW3qL8zvFELXNNyDdgupz/OiuxSU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=3EKZbqbIcHhVMDvyv9AWRz0vQt9QO/9/jqAvEq3ARb/16ZOhHzHs+kRd+h2LSa8PZ
	 zqK7v0c1sK81nerMUzdiH8aOzrIHtWwOJIwEtOOqCo/xdLbmW1oXS8OkiOKIf3vchT
	 3nroU/5tmrHoRj0GQ2flbaZYZCl9RVylkHyUcBqnaKxBwepzfzx+VrBTAXO76YTwsP
	 bv5kL4VXMs3lH5apUSbWMmZTB//3zQ0nJm2D2ojOl5sgbgNhFkpUIQv9dSmO5M7qWY
	 WNpbPwfAQtdv0qTxX98lvhc5PLQJhVziz13LTHzyF4jTh5QOKmogF8L+dIWB2ZyBwK
	 HeGhTuVwzK8Qw==
Date: Thu, 13 Apr 2023 18:17:29 +0200
From: Ladislav Michl <oss-lists@triops.cz>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [RFC 3/3] staging: octeon: convert to use phylink
Message-ID: <ZDgrGRImf0O0bP4r@lenoch>
References: <ZDgNexVTEfyGo77d@lenoch>
 <ZDgOZZb2LrlFEEbv@lenoch>
 <0af60abb-d599-4fdd-9bf6-ccf14524fe44@kili.mountain>
 <ZDgoH0KQ/Q0ydxn3@lenoch>
 <4ba4bab4-c9ab-468f-ac35-510612529b89@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ba4bab4-c9ab-468f-ac35-510612529b89@kili.mountain>
X-CMAE-Envelope: MS4wfJuXSkbX1lAp5B3Tui4Q55n+c+ZFrNyO5J+bFbo+sEAMaQ1ZlLF/sZ8QP03CkFd+z22mmdx8uXTzbSKtgmCieoMC6I1f2p1XBqL7pCUcwwFF8UQvZIfn
 XNBJPGHI0nA6tVqqRHzwLVGwQLvrSroIwQomurtoh/C1soKj3BRsUVxJetP93W2UNteUIUeCFALZRju4S2UcP3RL/6//ntlNrVNvcVdTbQS6Mf4JdzH2dF2q
 uFTlcCk+g7We/JpGqy1xV7WawAR4jcBG2Jil/lLkgz7y+pAid6XsQ3VOpEd8QucjUrKV6S4PJ6fd5oRgDO8rObqxq7TygfH+ZhhFvEW3oNM=

On Thu, Apr 13, 2023 at 07:10:47PM +0300, Dan Carpenter wrote:
> On Thu, Apr 13, 2023 at 06:04:47PM +0200, Ladislav Michl wrote:
> > > > diff --git a/drivers/staging/octeon/ethernet-rgmii.c b/drivers/staging/octeon/ethernet-rgmii.c
> > > > index 0c4fac31540a..8c6eb0b87254 100644
> > > > --- a/drivers/staging/octeon/ethernet-rgmii.c
> > > > +++ b/drivers/staging/octeon/ethernet-rgmii.c
> > > > @@ -115,17 +115,8 @@ static void cvm_oct_rgmii_poll(struct net_device *dev)
> > > >  
> > > >  	cvm_oct_check_preamble_errors(dev);
> > > >  
> > > > -	if (likely(!status_change))
> > >                    ^
> > > Negated.
> > 
> > On purpose.
> > 
> > > > -		return;
> > > > -
> > > > -	/* Tell core. */
> > > > -	if (link_info.s.link_up) {
> > > > -		if (!netif_carrier_ok(dev))
> > > > -			netif_carrier_on(dev);
> > > > -	} else if (netif_carrier_ok(dev)) {
> > > > -		netif_carrier_off(dev);
> > > > -	}
> > > > -	cvm_oct_note_carrier(priv, link_info);
> > > > +	if (likely(status_change))
> > > 
> > > Originally a status_change was unlikely but now it is likely.
> > 
> > Yes, but originally it returned after condition and now it executes
> > phylink_mac_change. This is just to emulate current bahaviour.
> > Later mac interrupts should be used to drive link change.
> 
> I don't think you have seen the (minor) issue.  Originally it was
> likely that status_change was NOT set.  But now it is likely that is
> *IS* set.

Ahh, will fix that. Thank you,
	ladis
