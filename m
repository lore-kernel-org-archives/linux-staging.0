Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C703148DA
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 06:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468431; cv=none; b=jz/D0y8pQ5YjM7ke2VXdQdTnqh2dbfaMOKE19PIExrJluCm2chbU8PCvwiS3kVGvLbzBvB8+qfby7L9PTwPZYpr99wd4DFwft2ELYVZcAxDZIlotCtLqZuKZPzziJ9MmYLxbYL7vC9wUarH4Q2ioZ+X7eqZHrKCENgsZVUS3gHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468431; c=relaxed/simple;
	bh=1mFJwss2uddOemB0lfVnj8btYhgYyzmfcfvPotLmuZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfIigegHjlutBe///KBvxMkW6tY+j7wrvI+sWhk7YJyB4LK78S/tQ3/wkD3u/WOzfFdPD7HHrxlAX3oUnVxAC/vp0juR/r/FPQPe21CvmXE240HTk0n61rVj5AdLyeDKPQAC+qyc1/nrLXmhD0BoRXtXkf3IzvopUowJmYEieVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiW8GwXP; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiW8GwXP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so8905764a12.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 23:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780468426; x=1781073226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8okQsbU3P/WBag+XtfX7e4+WVeyaNw5gsz4Ik6CGEOs=;
        b=XiW8GwXPQ9BOzUR4Vsfv6EdAHYw7s1wuJsQBKjHVXxxM2BPYyoExg7t+SjAkTIhoHV
         m2/373YoaRx2XpgQN9LECLWQHbyZZKG9zgQrFVQJeeJopn4jUIzIxR7pvMUUUuqvazX2
         Ay3AOGmMOzyjMAEO2nb1UBtYs7wXVyudqER9ql7cNFWn8opgWRdbtzVAS73e6U6qkU6W
         XWSBj224bjvW7/LMQPPmIqXgBculbNhiFxXPz61PQLIggPByJkqb3vIG3ItpeMonuMTP
         hYyB4IT/m1h7U8bTSk7zsttnLEKhniySiwrCFGYybP9GPQgsrJBY4EXdQ3Na3mOX84/0
         Deeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780468426; x=1781073226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8okQsbU3P/WBag+XtfX7e4+WVeyaNw5gsz4Ik6CGEOs=;
        b=aKtJBKE9JBglcoBkAaKkIMb03GXNeB3NGv+gt3n8NrjapOx4eEObZrUNOCTiUHEVw2
         ugL9BC/YcsAVhPu6MyaC1V1o+LGbGadtJdQVVx39odE+mbk+OS9PRc+evvs14ENZsdOi
         mVhvaeHWfH27SXkE+lAZDGmbNcjmg08q8bNWXl7bKIYsmAxCwBs4Dn+g6yFrUdxp4D+o
         0niSagseKP94dGpNR8MM6D4DW0lisbmt7Xgno+2s//NIhfPu6YKZGFJfyKHyjDW2nRFR
         drU92hjoCUbJqiyddbfTtg1Tp/UoN3tBLlaLa/PYfskcIa7Jpdz4Ka1ZvMDc1HnaIWjl
         7sHg==
X-Gm-Message-State: AOJu0YwJU+TUmVTDhD9vA7e/D6x/5L6HAhZH8Z1InxIhHfmWsio5iDrD
	cTzZYe+iiiEPeugSHgqL+/gO3FM0McQyyyL+obX+NPTjxc8ThVonbo/8
X-Gm-Gg: Acq92OEFxGo95JRnPMPt8cpvRBOE7rokeZVKAoASbuMudGxTv4FMU3Gjse86muSnP1N
	Pn1xBxsmENuYfrRfsUnt/o3EBY2xATJBebArA14YTrOXvs+uHgovAp4bBQZNC9K8DejAYuA/Oy6
	g8EZWFbWXhflEuh/SO88Z/QeuNHJu4+MBYWh4ng9ZBalUVsHPMITDP/2nzmBeOTKQ2XVChRkdB1
	iSC1JgbxuTlVUTkTVS3jkBlVfQr/98WpgV39Q40ncV5JC+Y7Tsa6XQitzowHMkaFgbwxUdWe1nd
	og6VRSdUjWU2CXTAd3MS/nqo40otykJPzCtmcF7ZWsfAStSKPFXJbR2eHOzOCjI4m4Y3TxJNQeW
	HTubymto2B53bsDbINDveemj7TBnsaiQ+ag41+T6v9PBImLFYUsimwSMjbURqMF0Er+rzaEodyW
	jWuCBENPJ7jKuCoRfMAJKzyNP7ZaIEkw==
X-Received: by 2002:a17:906:8446:b0:beb:f976:5235 with SMTP id a640c23a62f3a-bf0b1bce8f1mr51527766b.18.1780468425538;
        Tue, 02 Jun 2026 23:33:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051b0sm89899566b.31.2026.06.02.23.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:33:45 -0700 (PDT)
Date: Wed, 3 Jun 2026 09:33:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] staging: iio: impedance-analyzer: fix CamelCase in ad5933
Message-ID: <ah_Kxh6A9YaArwrU@stanley.mountain>
References: <20260602201428.213890-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602201428.213890-1-inasj268@gmail.com>

On Tue, Jun 02, 2026 at 09:14:28PM +0100, Jad Keskes wrote:
> checkpatch flagged mixed-case suffixes in #define names: _mVpp and _Hz.
> Rename to _MV_PP and _HZ to follow kernel UPPER_SNAKE_CASE convention.
> 

These are scientific things.  milli vs Mega etc.  The capitalization
makes it a million times different from each other.  We have to be
correct instead of following checkpatch.

regards,
dan carpenter

