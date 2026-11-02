Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637924;
	b=pCxMWwRKng/AZML7h5oFInWOQE4mdELbvHo7pGtINYu+YOuzQi5jqwVueQGaFTwgZ/sJ
	 34UW6xo3gBfoxf55ZAsmKhA9lRT+KM4Puig1uJ6nv9HBX8MvrBKGaOKRoF5SVCikyzti1
	 IyAFvWgRMGuZB5nwiqp2q0JVpkU8ZSSJmw2LlgCxh3TtN/hZw/ddEwyRebcLn1DQHuLCQ
	 jVRy5wtPA2J7Bf1a6MBPoGkI4yaj0b58h6e8dzFweVpR5xKiiehw5lSyd/Rapn6iJ80/x
	 VhD4IUsh0/76roD+aSBIvEuNYlIx2AaVoRTTILB/AUPP9w8xSxy0vr1TwhjHjmWg6gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XdVsUglm3xnm6Ps5OdJgbVUyAyNc27jKuQPYlZNCoDo=;
	b=YPu0S1O/c/Dj8PTsT5wYJ+HGmglqY7zNuSg4h5LUeKcedqrw/HkZt0HNKhrIJW9cd/Rg
	 pEnawgXYE0ezbN5F8nkjsstgX0gJcsvtDygvq/ZH/wU4t+/yzMoV2crhElUYfs33a34R5
	 1inBSl3DCJGYb0DON06NKczK4bpyGO0oNDOJBxJ1AULl+BOpj37IkfvmUJcOXUiU1OWwS
	 o2jpCMPhbcWjuoNP7WGySf0BdH8JJCQY3zrC8FAkP51B11RZuHbWyUgnAtWY/yPZ09Umy
	 lLkm1WMiNacBi/ec0BJGIWUMFjssfk4GXEZqim3N9Sn3CY7KcTBjixTjngevHcsUK/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qei4h/bF";
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D47606CEEF
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 16:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D47606CEEF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qei4h/bF
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679a2b5fe87so2733057d50.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 08:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793637918; x=1794242718; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XdVsUglm3xnm6Ps5OdJgbVUyAyNc27jKuQPYlZNCoDo=;
        b=qei4h/bFWua2+evKR6AzOI/KfdpofQZG90F3QDceg7D+FJpSgjIRyoQwQa4oXIM1Ia
         RUijNyLD6Y3i6BQ8VHuoXlo4olgzhAo1zEIdGxpMsYyLrYgLPtbN29A7Me0O4XZnmejb
         xrv+2/iZ9F2CXYL4E1IqGFHFVLVW+v0BIFBcSLCxOiLbW4dol5Y8R92pZQH3rnM3u1TD
         QMikR7l016Nmdi6TrYNsHRyR6acQIxcDDr+tZTKLVxu4aRTkBeXX8HMZ6VFRBYykE2J8
         RAGxbbDndZo0taJBsmIBcdvtzudeVYKiESEq3jjuErEwQQZFo362l8xRxOfSzmihH2z9
         6QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637918; x=1794242718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdVsUglm3xnm6Ps5OdJgbVUyAyNc27jKuQPYlZNCoDo=;
        b=op4RwS15ljGVbbbzMaEHCyhzH7OhhlXWHpZhqOupNdCHJcE0E29guz3SiOqMlXvsQs
         7cSkzv7dpXuZ2OZOqZ12eABFFcYsG11dIRjwZO1/XinqiYFhE9Wpg1DY5eNjMdSvrJXE
         nUFMw9mGSiJWe26zTiKLMf71YNCtDIT1ZI21V9cJj7BsEy9Qdeaojr7Du9nLpUAR8dyB
         wm00Nvu+/CsWjDiSM45HjZypd0hrwPVsztkKYkoMMjTbXG+ZLvgeK/0bXRNAmSg+PuI5
         54ftEPB9r9bStq++zDczjHjNcd0C/fomgtcEySwK+9nMKQvS79xvYu8aM4qcqqV/0RpF
         3BwQ==
X-Forwarded-Encrypted: i=1; AKwUvByBuFXn8U7v+7Ky+bneY3erQZ3bAvcjFl8RBjRj2jAwEuAKIBQA4W/e2sNpLjSe/FJhPVss6SWwaqh8Cq48@lists.linux.dev
X-Gm-Message-State: APuU4Z8GblSCPpOcjPKLe5r41JRIwUxhFSTXIywWzbKCHA5STDpWRh3i
	oxMtLWAoHhZ13hBuPpEmQH+nGhznizY7NgLY+4vjfslgX0NoVqvYQ1tn
X-Gm-Gg: AYBFou1lPCTekX95PzUy0S1TVJbZJjptIlH9P7zpmpU1qSzYzdbSw5rUAOjcdXpA2gp
	swuGFKMBT6bzwBB10Sqw+JA7qAplPkadS6sYSK9RKwHwLpQ64n8ieE1KOkRWGF4CrTg2DIfRcLd
	yUZ7PakPkbL/JpNFW0AflVxDtwkdSyzHeNW6DeAX0371EVtqCUPAU8FvAqpDQP9G7R5GGck1HvT
	LHgU/hBYGk4pWFFrq9M+LP+L2T3NoWsvnuJUxsoGHT9bQvM9vbRXQtNy1Mc3AdiLP0W8G6aspAu
	ZojhTsoo1FNbG8dLCLvu1G6k3NvLmBC/HJd6KsPJ7kqqwpgI2GWYWX/rrnJnLfaiUxD4HYt+Bjv
	/0fxTPEMYZFnmfxB+jMFTJTkCW1wx1zEpJN8MTz2RvEUvPclBpu/CbUmuXdzxbf5VeMdgjMnZC/
	c5FUHGI2MSUnT6tvw88Zx9w8Nz/EcyeZg7gBLOIiVywKplKTTN3gA7D1XorCDzSoBoMvAVapa16
	ujdiHMEwlMB8HCOQRXsFoUHdPL3sGHp9rcVU7AArIcSyDxkpjawi/ZAt6iKz8p39EYJkfN13MVp
	qL75gBBpZxqZbX0VF8HcI/Yj+HHmq53QpS256wsFlHK9xlCyCvoS0BRaiw==
X-Received: by 2002:a05:690e:4547:10b0:677:ae43:8182 with SMTP id 956f58d0204a3-67ba4eeabc6mr3625211d50.37.1793637917731;
        Mon, 02 Nov 2026 08:45:17 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.200])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf270946sm5286049d50.8.2026.11.02.08.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:45:16 -0800 (PST)
Date: Mon, 2 Nov 2026 11:45:12 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Add newlines to sysfs output
Message-ID: <aui-GOB6USw2ziOt@daniel-HP-Stream-Laptop-14>
References: <auEmTBqbAPvMLRcg@daniel-HP-Stream-Laptop-14>
 <2026102808-stunning-headgear-4355@gregkh>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026102808-stunning-headgear-4355@gregkh>

On Wed, Oct 28, 2026 at 05:19:45AM +0100, Greg KH wrote:
> On Tue, Oct 27, 2026 at 06:31:40PM -0400, Daniel West wrote:
> > >From 6376e59cb4d0fa2d57ff7f4fb2ce6cdb8bb1d03a Mon Sep 17 00:00:00 2001
> > From: Daniel West <daniel.west.dev@gmail.com>
> > Date: Tue, 27 Oct 2026 15:53:19 -0400
> > Subject: [PATCH] staging: greybus: Add newlines to sysfs output
> 
> This shouldn't be here in the body of the email, right?
> 
> > 
> > Add terminating newlines to the sysfs_emit attributes in the Greybus audio manager per warnings from checkpatch.
> 
> Didn't checkpatch warn you about too long of lines here?
> 
> > 
> > WARNING: return sysfs_emit(...) formats should include a terminating newline
> 
> Please read the archives for why this warning is ok to ignore here.
> 
> thanks,
> 
> greg k-h

Thank you very much for the contructive feedback. I have reviewed
the archives and it makes sense. I will drop the patch.

Thanks again,
Daniel W
