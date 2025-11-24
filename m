Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146E2F49E3
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975883; cv=none; b=YKFtCUg1MwVEymhjjkgwua2hA+KCm+QwcA+Tr1J2Zbyc4tsX32sah4HboGzlE+t8UGuhjGGO55aLsiC5DRtywHOnrsZLLZrEXBAm4VY6jk3vjzt/wSTyiTG0F13nq1NQFq0Tbg26MIEvNQEa14MXVeFJ8ojxiUxattrhRMEq6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975883; c=relaxed/simple;
	bh=fOW807JTElLXfu5bQPLRb9PA5X6q6UTCIMUH+iIZopE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mmXTNevwIfLAvTp7y1+dRUdFKbk0yyY7p2Rz3018PH5qfMU5IFsgmy+a95ovaO+zgBPunUZjTcJbY2GyezxTE9aQQKk4cR3e6t5QW/47T6W+xcfUXojkhKvGJdAPwOGpalqJ1713hYKYLql2AVGSuyOUn2jQuGU5PKIkVopZuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=5EhBLGcc; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="5EhBLGcc"
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vNShp-002aQ6-KG; Mon, 24 Nov 2025 10:17:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=m9NC9OE2YXpqlTOPq/UKKARWr6En1t2j5wsLN0Btg9s=; b=5EhBLGcchypm9NTyRWtDaUzQPq
	XoD4PjWlFsyIQ4RJA+NIUHnTWYQR742KuPvhiawHq9ovStSC+1ZYyPzDreeT58ZZqPyjR7INYLyED
	81OXlyZlQWISopP6GPBUtyAi122NY+peH7ekv3pTfBeB/76zDBsU0XlAFRumzPPX+6dodf1n9aI9l
	Lp1efMM8vxYxUHGJuBUMgoepu06NoWqfA3+C7wUYSXBEvTqisFk5KExUFSaQv3YkCthtOZD3nLlNR
	18ItUGxyvmcnlpBO0LUZrVI75GpEkA70NkwJzg3VYDt2CxMY7NMp0iM4LevkqM107PubT0UYYlemU
	+yMzXWGg==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vNShp-00023x-2D; Mon, 24 Nov 2025 10:17:57 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vNSho-008Fpr-Gi; Mon, 24 Nov 2025 10:17:56 +0100
Date: Mon, 24 Nov 2025 09:17:54 +0000
From: david laight <david.laight@runbox.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Navaneeth K <knavaneeth786@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: rtl8723bs: replace FIELD_OFFSET usage with
 offsetof
Message-ID: <20251124091754.7147dc66@pumpkin>
In-Reply-To: <aSQSg91zk2zCQ8xE@stanley.mountain>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
	<20251122174555.215109-3-knavaneeth786@gmail.com>
	<aSQSg91zk2zCQ8xE@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Nov 2025 11:08:35 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Sat, Nov 22, 2025 at 05:45:52PM +0000, Navaneeth K wrote:
> > Replace usage of the custom FIELD_OFFSET macro with the standard
> > offsetof() macro in drv_types.h. This improves code readability and
> > standardization.
> > 
> > Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/include/drv_types.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> > index dd9018aa4ee5..47cabf8707f6 100644
> > --- a/drivers/staging/rtl8723bs/include/drv_types.h
> > +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> > @@ -173,9 +173,9 @@ struct registry_priv {
> >  
> >  
> >  /* For registry parameters */
> > -#define RGTRY_OFT(field) ((u32)FIELD_OFFSET(struct registry_priv, field))
> > +#define RGTRY_OFT(field) ((u32)offsetof(struct registry_priv, field))  
> 
> These casts to u32 are bogus garbage.  Delete them.

Dunno - they might be needed (or have been needed) to stop min()
complaining about type mismatch.
They can also stop expressions being evaluated as 64bit (on 64bit)
which may reduce code size.
But that is a bit subtle...

	David


> 
> regards,
> dan carpenter
> 
> 
> 

