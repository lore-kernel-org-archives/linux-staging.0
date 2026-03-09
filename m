Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E4B366831
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087174; cv=none; b=P2JLAE72L6xINsJHwMFbQmkJJk17iS1dgOCVit/YOlAzhMPkMHzpOBxlEMZTZYI6Ao10QqZhDABX4YS6egryLTR3F0Za4htLmSALkJfPB4pMmlNSEJvEH21KS90NQ65Ymq88Q6G9NMFKLkc2cLyIcQU2GoZ79WgnpQt3JUGpxEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087174; c=relaxed/simple;
	bh=KKjEqW3R9tTDO1aT3CWGT7lLNuFrcQ8gXDzZqGe/FFI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzMEBCYtJLFfRi7DwPMD+ZA0zibk+4amAVZvDsnz2dYSewFni0dJBnESi1NIOJasJiGslJYvoLom34DiWbKN8UYLuHyOADrv7hcrA4rkamBhu2jQyoBdqBReeco2Pmyu354sZ32Lo1rtFmidi4SqRJZtkHaPwb10vZeM2YmNFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLb07r0/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLb07r0/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so13512145e9.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773087171; x=1773691971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7H4kYocdbxhXcIo1nTTG3WKzkoNhMzO+lmo+XKrpuo=;
        b=eLb07r0/9ShJfMQNhWrlSlvSiogvaRmdEEIpV9ov15gXvZgAQ9U4vHp2LkWxO8WE93
         nWrqKJ+vaJEdRLXIfYBlNQqA6OXuLEQy/ZTOIlcaHk1FtaVVOY9ItVnpxSzkk3kprROf
         9wUiCEUgBEP8fzXHLta7Jzw5Fho+zLpGmHmBai9+VykhV2k6V91kjWmmrpGPTA8VxvjM
         rVLpDlaieG2h+1xApRTn1Fe4ARIuzwvsjUyaQF8iuMfvfHATvwTqAs9h8j6NmNMq253t
         WrGn4wWieZmQw4v0Aa+vDZM2xJ0MkFoJjLCiuDUpUtgi4SeJ/VdPfxsnkJCqH0rtmMiK
         h6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087171; x=1773691971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L7H4kYocdbxhXcIo1nTTG3WKzkoNhMzO+lmo+XKrpuo=;
        b=R5VMK6Y4Z7NNTy//B+ahaqgcSZAk6cRrK55rQl52gWpZVfNePrKz75LwzgYXn6rFEy
         y9AaisF8oPV/+bh7ATd1P/3NvugRTc9IiFiCeXP2Lq3koUuOaBS9/3Iz+G5WbDCGdQxZ
         GHFQkCqTGzHyjd/51//5UEf/8XtU4CddX2EmS4aOIwMbDENURcbAmKKaR30BQddzhCVj
         kcyYhazB19HLNn50z6rT7MmvFVghBnBGNOWQHomv9Ui6viNamet1LCeiWRoO7FJoxhh8
         /jXXQeYKvytNUVN5kmQk+mqzIIGEPJdfkGlcs6pD9i8b5kbOMEy1oQyjhnJk9JDj9Nqk
         8KjA==
X-Forwarded-Encrypted: i=1; AJvYcCVp9vs66oy3cysN1frL2vEDapnvOtX0T9lEED/jQLYupviipN/SRT2/fDpOSy96Nn+PfED4F9W3NfxHp/UE@lists.linux.dev
X-Gm-Message-State: AOJu0YwNhlS2AxoluOZXg71zxLF4yBHlGNnNhv9vSJTH9kiwkBZGv8lx
	cknlwPqlhwdBzZnrDCkr80Zmis7R+lR2yyoEU0ybSm4Ja00/zaCKCx/HBvc7sILS
X-Gm-Gg: ATEYQzxSbAeokKPoy42AO44h48twyolRkvvdwjfAOzyjV/SaBun4u8yDwOy8WHzBaVg
	LwNRLztUlZBnX82ExsTke6WRKcNn0KVghZ4b5GciX4ybmpZg2ypJ/5Iik9FcKjfp0Jy6oobRM18
	oFQT4tEwsfntT/SpKiFH7BFNNfd0swtjUt2rFtl2pjghZ2Fg1HcK6v31deOkrwWOIwdDwGWEJPu
	SpUZ1uPnoA1b1Rl4f9zHOKS8/U+S0Atq5hyt6sPpadbWfdwNOF1JhbvlI8KJ01v9cE3yaI0IPrm
	LFwhap0+6JaBnSrAfPBOPoZQm1i1S0xax2AVq6xWKjcwGAggelNVuOBifd+0omvJMyKDUTQuci2
	BzGDMHtEQil/l20WVAUmOFN+PtMgZTZ/PfEQD41nmsa4iFAAUv858fMHTJGAzV2vMQGq45vMmJn
	45Fm8OQBs725bMtSlgAfDUc2rmoO/fLRX2JWDY6uprChOnpj8ZY8eHOci7RlhVbrO6
X-Received: by 2002:a05:600c:a00f:b0:485:358b:e80c with SMTP id 5b1f17b1804b1-485358bea63mr122750265e9.0.1773087171219;
        Mon, 09 Mar 2026 13:12:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485358cd26bsm94471685e9.8.2026.03.09.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:12:50 -0700 (PDT)
Date: Mon, 9 Mar 2026 20:12:49 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Adamenko <marusik.adamenko@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: replace BUG() with WARN_ON_ONCE() in
 cvn_oct_xmit()
Message-ID: <20260309201249.4672ca61@pumpkin>
In-Reply-To: <2026030949-banner-rematch-db18@gregkh>
References: <20260305005316.49848-1-marusik.adamenko@gmail.com>
	<2026030949-banner-rematch-db18@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Mar 2026 17:41:14 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Mar 04, 2026 at 04:53:16PM -0800, Mark Adamenko wrote:
> > All three values of queue_type are handled in the switch case, making
> > the default case unreachable. Replace BUG() with WARN_ON_ONCE() to avoid
> > an unnecessary kernel crash if reached.
> > 
> > Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> > ---
> >  drivers/staging/octeon/ethernet-tx.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
> > index f5bbedac6a65..f34d82a433e3 100644
> > --- a/drivers/staging/octeon/ethernet-tx.c
> > +++ b/drivers/staging/octeon/ethernet-tx.c
> > @@ -450,7 +450,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
> >  		__skb_queue_tail(&priv->tx_free_list[qos], skb);
> >  		break;
> >  	default:
> > -		BUG();
> > +		WARN_ON_ONCE(1);
> > +		break;  
> 
> If this is impossible to ever hit, then nothing changed here, right?  So
> why is this even needed?

Jeepers, that code is horrid....
But it is trivially impossible to get there.
The compiler might even optimise it away!

	David

> 
> thanks,
> 
> greg k-h
> 

