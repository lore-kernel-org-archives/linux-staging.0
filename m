Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA9639AD5
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712042120; cv=none; b=oI59nqXN1UAyMq2zq+x3mgLi5ZgXnQN5+rBWw8FAjxCzvDnbSNxE2A1Ka1YoaTwaotGqsissP21TeoQX1+qvPpSRmbtEXz435U+RXL/2137clo7yOqW2ztQ6MINN8gHudD8nxFgWsnL1/9GY5h4+HwLH/6xlTyDgUVqo2VwFQxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712042120; c=relaxed/simple;
	bh=YV6DYQDC3IEebm+Pxkl6Atlk7TWUF7BcjSHmxpdG2BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPZpKXKq93nIj6biHSkwINarJV2FcoBd9GhrR5528vcXXQnj4BIUwUlsO/bkPVePNTova8nVlOPg//X9UXbYyITH9dsg7kPKkC8j7FSp8xOatqBvQsLRhaP9qmRdjssEz7rRjrqxFEPAWViD6lV1jJ5yyofg8d19z/bxnQZB4aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFMHJ7Lo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFMHJ7Lo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a44f2d894b7so544985766b.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 00:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712042117; x=1712646917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcLmIctw5YZRqLa0BDTmesSSp3mrMTcdHK0j2v9fFws=;
        b=zFMHJ7Loc4gi0+6ESQpH8GSZekxiVGG7ojP/AGuSMSk6YdMq7jOOni2Dkh17lhaymM
         mptxmsL/e77P94xpMfCOCjsI9J2BgXa2tGsd+CPnZl19Ba4j8i9wWjtlvYe6RT9GQRhg
         /EXfqhV+K4KoVH+r4/02/Xhas74ZwAzJS79hGUlk9S3xBlhHCX2OSLdx14DEmWuy1eoe
         scKKVzfVGtouGlmSm3ScaFVPQTx2kfPrYFkPd3Ot51tNqeSeyVYKDgpfpZaEEGNodreh
         74FZCIx21AWFXqJoP/IlhLGZJBTrZhvDN4djBnTdSC1GgtBApgMP5m4dtFM2+9MDIzXc
         HZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712042117; x=1712646917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcLmIctw5YZRqLa0BDTmesSSp3mrMTcdHK0j2v9fFws=;
        b=hxLiZvbta8r4Kchqo43kl7+ZPpzXnNBSziGT6B4K7cFUj0enBBG09JTRb7a3p9nOSN
         Sr3fkQTst3BWCIuA4RC73VKyppdEOkpjb8PGBHTN7UYcJSpewpfXVgW4aV6M9wR4yMbn
         0T8SGFB3HDhjRqM5tFBZhAw54Rc/nWuIA+2tDK8Lk8ZEoDpxX9vFcV/vt1e24kWukv5t
         IJqNWWo8XvXrWfAvuDIKrlyVaksNad/JGhIZCgUiyfSCUWdUbS1dBCpIydkOaA3e5L2E
         /TpySRt7mP7BSyGx5o0SCgmTvnU3BydvQYpyqXkF7S7VgeLeVgIpRRfQkop1gDSNEG8N
         i+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+FwvX6eX7xPoKU7REBxR/W9uOoPTcCkuYYBHlVb/e8AToymD4g1bk55xkcbNsuyhzBCm0Cm2ET9cEIU7fpJCsDN/at4izBvVWGsJneg==
X-Gm-Message-State: AOJu0YzsrGl3udffnoWSXUM9WBze4T6PcwE/w5wBhqUIAbs00xkIOmGW
	nN5nm+BjP8Nh+eCxrx4RiU6B1a/RCrVofVqhW2T0O8hzXnQFTlfgkFTn7skAVRA=
X-Google-Smtp-Source: AGHT+IE/t+XdD6wZQ394SX3ykpFvfynHcDHGuPT0TNGqT3wlNCQpXzyhP3G0Pj+iSe8R3hFkGfbHEg==
X-Received: by 2002:a17:906:4083:b0:a4d:f0c3:a9e9 with SMTP id u3-20020a170906408300b00a4df0c3a9e9mr6839023ejj.28.1712042117061;
        Tue, 02 Apr 2024 00:15:17 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090626d100b00a4e1aa345f6sm6147253ejc.115.2024.04.02.00.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 00:15:16 -0700 (PDT)
Date: Tue, 2 Apr 2024 10:15:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uri Arev <me@wantyapps.xyz>
Cc: Shresth Prasad <shresthprasad7@gmail.com>,
	christophe.jaillet@wanadoo.fr, frank.li@vivo.com,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	luca.ceresoli@bootlin.com, prathubaronia2011@gmail.com,
	robh@kernel.org, skhan@linuxfoundation.org,
	u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH] staging: axis-fifo: align arguments to open parenthesis
 in axis-fifo.c
Message-ID: <fdc25599-f8a7-4d66-9535-494de8439da0@moroto.mountain>
References: <z2ewk44rjutv24i6lqau3adrmlprj524ulqtqbncvfaj44dwcg@2dnnbm75abbp>
 <72dc90fb-79ef-4dd4-b30e-97b1e7058156@gmail.com>
 <qnljnwccqvqzilxuoat2s6md2zwcuhfruzbpepxebk65k34t3g@cyl67lk5lsoe>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qnljnwccqvqzilxuoat2s6md2zwcuhfruzbpepxebk65k34t3g@cyl67lk5lsoe>

On Sun, Mar 31, 2024 at 09:33:55PM +0300, Uri Arev wrote:
> > Oh, that's too bad. Thanks for the heads up!
> No worries, I wouldn't mind it if your patch got accepted and not mine
> :p
> I just don't think they accept patches to axis-fifo anymore, especially
> not basic syntax and checkpatch patches which are not as important as
> actual bug-fixes.

No, we're always taking patches.  You just had bad luck/timing where you
sent the patch 2 days before Greg went on vacation.

Greg is back now, but I imagine he has a long list of stuff to catch up
with.  It's possible that he also accidentally dropped your patch
because of the vacation...  I could imagine a situation where that
happened.

regards,
dan carpenter

