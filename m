Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8E52D248B
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376701; cv=none; b=VCXzGRDAGPfgp2RoUal3X8wixxfAyEKXDKrgFyOObDb0e0kqkRLdZbOdJOzBpgWPgTilCAl3azZxeElxMODhsYyo93DORM7lgeYHODxDGy9UVSKKQrs2ajO/Hz00Sv6Wm52R6NJJvmI1ChzSD0S2jG+5VH+kPE0lJUsZheso+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376701; c=relaxed/simple;
	bh=hkzH6X4MspMymVkiKD+mT62ikKI91e+x9tNKmbPUwkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ4tMiRIgcabhIux1RS8rQEta/mwjYgH5QRsn60w2a1v3IPUcGHLW2XCYtEcRR+hrs1rTNCv13DOuW2L/ZlciDXUihkv6Umj7Pfg8bdJGkezR1Tq+WFV+jjaQKpXqxXG5x3N7kYUIm3f9fF/EKLJ6U52bGtAgK6UpCTjkhTDfOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=pdkIwZQe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NytO3xLA; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="pdkIwZQe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NytO3xLA"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id EF9B91D0003A;
	Tue, 28 Apr 2026 07:44:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 28 Apr 2026 07:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777376698; x=1777463098; bh=bm+tleJWDp
	2qM3s0/SMhGJUZNPI07Pf+jAi3udjkuqI=; b=pdkIwZQeJuKEnemq+f808/bJM+
	ZX1jA03xJGHFUNs7hbHgbitV78SR3vcoZ5OYhIuMYh+9YQf2nuWJDiLVO6LRIKgK
	tBrzzkLVtn9+ZRhFWtmAlijUNW2hz5Mi0FhrC3GaAFe4p7XfwQaNBRmajW4jAanc
	LnMJCj45ipGxDcS3tOreixZvn1KVjRDIyHSq1Dwb+1aDFGJChM2tCg5JthBYVxtD
	c+Prx05llSANMEOOkYYq/8psIjDvw8sk16GmUYHfEt7pH23aU9UtXlSe4ZVf31oC
	j7a06RcSWGOnhrAoiohqwfWgbhkuTN0hq6eUHK4xLsDnEIyzHLN9nTmw2ARg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777376698; x=1777463098; bh=bm+tleJWDp2qM3s0/SMhGJUZNPI07Pf+jAi
	3udjkuqI=; b=NytO3xLA/l2Gi+7weZdAhiw1/Inxm5iQEfNs9HqKILOnM3S9Ps6
	Q2MaPlK4Vqf+R177BqKPLXMkFXVCmshr5M1JzjzWCAgCwgQHSI0uosZA4KezhWcQ
	YQl0/wxqmZP3QW0e5T5UKtSWI4xT5g6RYFNdKtx8nr77aZrw7o9uUNjI9AG1x42R
	5fpHOjwZTnfgPvZCRp2s+dln7uG9n7fRbyB1G5/4+gDbSzwKnWwbX4RgXOQURHBx
	XmpM8qxFwLTvMaNO8QZmRo4IhjEUEZqhPfcGx3nflkmOkQ0YOMsQUomF83bDpCVx
	NTRWIknBbJwHrMb8V/O/EGo3EUZG49X19Aw==
X-ME-Sender: <xms:up3wafeXQRtj0GE09xJ2m_dgdT8k8oT9P_pIdIsLUxUSp5KwIgwjGA>
    <xme:up3waegNF7e_znsZ6FIygppM3IFkiN3OUgdFp4Dnnt7KQL_ooZP5hskv0620JliUI
    h62tDLeObLmmx1nlvXYqp745yiDbiRmhwVksuLp1HIdExleJo0>
X-ME-Received: <xmr:up3wafwqpRMugwgf1U7gkpEeAK-OSlxMCRAviHzT5Z6htVkmAfh_9HyrIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttd
    dtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecu
    ggftrfgrthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiffdvud
    effeelvedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghhinhhgvghrrdhjiihllhgvvgesghhmrghilhdrtghomhdprhgtphhtthhopeguphgvnh
    hklhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhg
    sehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:up3waSPUcXn-JAdOkEkezpWwel1Depi8wmmonHqPT9M1S-SYsULabg>
    <xmx:up3waYU7W_IJq2EptrgF9tnMEqmJ_RCsFCi1hW6O5VY_q8J9EqvhuQ>
    <xmx:up3wae3Zu1tZlv6gyGr-9w8zsOgw8Xri3VyN7Wt_EKjuK_W1ZCDTQQ>
    <xmx:up3waeqThixwhjYG2EUtLLnDadDEmRxFcwcwsMQQjTmbSLU_jczNVQ>
    <xmx:up3waf_XyD_RE2N7wMr7GDh1DaZzD6AoLj5My7_MvB6WZrU-XP_9dL6t>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Apr 2026 07:44:58 -0400 (EDT)
Date: Tue, 28 Apr 2026 05:44:21 -0600
From: Greg KH <greg@kroah.com>
To: Ginger <ginger.jzllee@gmail.com>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [bug report] Potential order bug in
 'drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c', primarily in
 'skel_disconnect()'
Message-ID: <2026042846-character-tamale-78ab@gregkh>
References: <CAGp+u1YiO_nf4dNvEtxTDWv86D80ac4TrP1-DhrYuQtt-JsyoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1YiO_nf4dNvEtxTDWv86D80ac4TrP1-DhrYuQtt-JsyoA@mail.gmail.com>

On Tue, Apr 28, 2026 at 01:07:36PM +0800, Ginger wrote:
> Dear Linux kernel maintainers,
> 
> My research-based static analyzer found a potential order bug within
> the 'drivers/staging/gpib/lpvo_usb_gpib' subsystem, more specifically,
> in 'drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c'.
> This bug is similar to a previous bug report as discussed in
> 'https://lore.kernel.org/linux-usb/2026042718-unwieldy-dicing-626f@gregkh'.
> 
> Kernel version: long-term kernel v6.18.9

Please do not run "static analyzer tools" on old kernel versions.
Please always do so on the latest kernel release (hint, this file is no
longer in this place anymore.)

thanks,

greg k-h
