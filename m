Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B32FF678;
	Mon, 24 Nov 2025 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763986408; cv=none; b=cZ14yXaRc+YNZnDpBUF2DNjfJ6vRziPeMHSSQQuZAPeQlTN6fzJwxtkbNgh7kk52+hehFa666UsNlnZlEEtRkdMLGDR17nfHSpHccM4XACMXMXmEexlwoFbv90dOmWNeVYQ+rvbM4+FSFFYEMGSl+yozl6aTL5SdKOob+pHSNXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763986408; c=relaxed/simple;
	bh=ST88riz1/tBkGbFGDIrrW49Gyvj4nU4FLbqhRPVWT44=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2u27hCLUpzWTWgLYRx2sRuzKScZ9q2rQC5fYerLCTotZCbx2bkbS7xxHuJ9uvxDKsVjsNIEVKt/DQEbwMJtNZhgcoXbuohKwet71lF80a74WgJlpHes/p3pNPf/vRir28RyIDGMkbEKqyPGy4AxAIyMYQJQe6ZXjxxp8uP3YtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=P5TTqBai; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="P5TTqBai"
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vNVRY-002yHX-85; Mon, 24 Nov 2025 13:13:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=9/Qlkp2h+YYDxPN6J7eZoZizSjW1HxCHjAjt9zLB1QE=; b=P5TTqBai4w2oQeZbPBAnex838j
	eZwwk4enC2CfRzeHvb6bPSMm0p+ulM2NV5kDFH1sy6WFmzlwWSKUmtjLiQ2A2Hs5/Hg90Y6LIbLXU
	zENpAigSUlb/BIQ1NARGPP/o1wJ+PgxbeEuH1ZLGBGpPp3T961TWtFwcyCijy0VWve+pDyiImk4ht
	oaJO/V2ljlYcYKsuqMXzixkBlcPi2cfJP/WR5Jt1wMF0U/ms99lRngWNUL2Fk54Bs5pvktCYf1G7x
	+BlXjvO3FdPdtpSJxu8/RyAlMw5RqxM4czXdeEy5AwFjht0VHPNnPG1db05lft3SesbNG3+ujuInq
	gu1ckl8Q==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vNVRX-0008FC-KV; Mon, 24 Nov 2025 13:13:19 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vNVRJ-008aW2-0R; Mon, 24 Nov 2025 13:13:05 +0100
Date: Mon, 24 Nov 2025 12:13:02 +0000
From: david laight <david.laight@runbox.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Navaneeth K <knavaneeth786@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: rtl8723bs: replace FIELD_OFFSET usage with
 offsetof
Message-ID: <20251124121302.2d1988b6@pumpkin>
In-Reply-To: <aSQpSiazYpEquYS6@stanley.mountain>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
	<20251122174555.215109-3-knavaneeth786@gmail.com>
	<aSQSg91zk2zCQ8xE@stanley.mountain>
	<20251124091754.7147dc66@pumpkin>
	<aSQpSiazYpEquYS6@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Nov 2025 12:45:46 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Mon, Nov 24, 2025 at 09:17:54AM +0000, david laight wrote:
> > On Mon, 24 Nov 2025 11:08:35 +0300
> > Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >   
> > > On Sat, Nov 22, 2025 at 05:45:52PM +0000, Navaneeth K wrote:  
> > > > Replace usage of the custom FIELD_OFFSET macro with the standard
> > > > offsetof() macro in drv_types.h. This improves code readability and
> > > > standardization.
> > > > 
> > > > Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> > > > ---
> > > >  drivers/staging/rtl8723bs/include/drv_types.h | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> > > > index dd9018aa4ee5..47cabf8707f6 100644
> > > > --- a/drivers/staging/rtl8723bs/include/drv_types.h
> > > > +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> > > > @@ -173,9 +173,9 @@ struct registry_priv {
> > > >  
> > > >  
> > > >  /* For registry parameters */
> > > > -#define RGTRY_OFT(field) ((u32)FIELD_OFFSET(struct registry_priv, field))
> > > > +#define RGTRY_OFT(field) ((u32)offsetof(struct registry_priv, field))    
> > > 
> > > These casts to u32 are bogus garbage.  Delete them.  
> > 
> > Dunno - they might be needed (or have been needed) to stop min()
> > complaining about type mismatch.
> > They can also stop expressions being evaluated as 64bit (on 64bit)
> > which may reduce code size.
> > But that is a bit subtle...  
> 
> Actually the macros are unused.  Just delete them entirely.

Sounds good to me :-)

> 
> regards,
> dan carpenter
> 

