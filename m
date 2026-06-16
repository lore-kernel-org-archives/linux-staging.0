Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C9313534
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595772; cv=none; b=lvZSd+bOjHE2QIXNJOId62HtpFojHJ6X+9gAHGfr4UfojItkfzV4hYrSwGUg85GiYE916v11M2jPjfhxog7yFnkvuAnLz8vZJtnjkVAvxdSNjqSA8WAcuRLkIhyJWQGaMuNo+ntRMLicljZ7lA7Eee6UiW5DiIpvQs4i3PNXBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595772; c=relaxed/simple;
	bh=yTQpcE6hgSL8qmLNr43zEcE6tGMMwDLIqq6M8DR7nnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLAW0UW12aEKDVYO1snT7Zu9RMNS+xzTWhHwRfb2S/FENFyBAiJQG7sEQNOifvbEAiRiP7hnMEsrkVQucN31y1wuSp/bAzWcOihKtIHg2bas24y+1lltmcy5ULzahadZIZgI1/oEWiufnvgPkx2qfnbnrytCaYu6T34ehJcLAKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdTCEc7B; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdTCEc7B"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5176bbb9384so47301811cf.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781595770; x=1782200570; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3vSm8eD6FMJPEneyrT8INZ/0kUYiIyKIleKMlOU9h8=;
        b=HdTCEc7B9jBRkKTVF2hwz5+nB1coU3IyhVgDMdHr6PDP8Yrs/OAlr3G8VYYPoA4oVj
         P0DBvWbgl1aFR9r0ygZvRbzpjnCp9vrsoDApwYSWcDck+9xwf761Pc74Nsx/EyqOhwOJ
         cpZNWd2KPB49KV98PBwwQTRUX4XWCmggWwey4OL29GsXAvBN4yMz6rHAWzPIlcO4Q3l6
         VuMykaN4+B+0iXtmeXpAX8Eir9jFV6Q006KLA06anM8IQBeSwX8MB20ZaXXe4ZCY+kDl
         4ytaLoiXs6jwGgX6IoX3+rLfnwkikuZj1/rYhC4hqUA6mvoV/n573WJe7nIDn4HQ3Zqh
         BSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595770; x=1782200570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3vSm8eD6FMJPEneyrT8INZ/0kUYiIyKIleKMlOU9h8=;
        b=JusLoo7h2PeZQppX/ubjZIJz8JkW8OwI636dpURKKQ/GYd18/5wuuovK+4P3PmTJNA
         kjaTUgUSF0We7s60jWa+eE1Xf/yCLOZ3yUYnl9RQpHh/SNSxs0Ek7Gs/ePcJilEPx1yH
         wxMLmcv3j7TAD7o0rk1g5U2i31nTPE1akxi6InB2CfLV6mD8+TC1ay69rltpU7YrR7+q
         JyT4aBnqcmOGFpBMtFZYGIyuMuI8R2bUck4cZUUmbb3vuYFl62vGS1bZ1oNxX6mTHpJV
         KWJj7+NAcY5AyJeT6YyyIvHaMVCgKzDOijlblrqq/N3JvKzAuBPM7E1RMuQbRuFTotDk
         TPEg==
X-Forwarded-Encrypted: i=1; AFNElJ/LUPWzxpiAwSpfn9HnUyyrUF556E4Zsxke8lsOyr7AxydEJ0kgNGDHM3KcDkBzGAPyxWC3JoOc0Gvuvkgx@lists.linux.dev
X-Gm-Message-State: AOJu0YwLITMo0OBGzanQodyl6pFVRg6q2cRraqkBVEKOTqC2VIwvUrPN
	7J+xEzdIgBtijh7swR8yGc51QClm8i8VAIZoe9q2nrTL9qkB0SJR9q3l
X-Gm-Gg: Acq92OFT1RcFHGiiJyB9yQx5w/1zvCd0XUtywomXJp8nDlork6YgJ5LfJsYPpNuPlrt
	/x5lCOrRLNYtQfnDVoGx9S57wTYc70tBJc+OP9678faG4AHDXc1C7kA9FDBvbJBAeqkgu9zDSyR
	A05rPVsUYOLn3AsPxQrqGZZkGkUm1CkGcjO/bTCK2GQUlrK3bh1G56Vg/azqurOS4JU8Tj26Kkg
	/GtAi2EGYE+krvlNj8HgefvdAb+ynI7adliLRtkJRhZ0GqEngQbsqh6rAT4CGEQ+UTeIr3eeSas
	ft7oiuRzhNMNhm0ZJeut71M2beTBZSNy9syHnhdMFlbLfb+xcAkr1+f3XvhjJAoFYjxfshKI+Pi
	T4dHYnzEY/WOHIHn/4FJAjIaPOVln7tCSbXQnWm893GTebjo6Xs+P99MyCRp7cWG6NtJsq7525d
	lJVDxUYnp1jqRNj8/375Eqd7nrM30=
X-Received: by 2002:a05:622a:487:b0:517:82a1:adf1 with SMTP id d75a77b69052e-51991592438mr34332981cf.15.1781595770695;
        Tue, 16 Jun 2026 00:42:50 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6428a6sm154779031cf.12.2026.06.16.00.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:42:49 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:42:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: hexlabsecurity@proton.me, Mark Greer <mgreer@animalcreek.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
	Alex Elder <elder@kernel.org>
Subject: Re: [PATCH] greybus: audio: bound the topology section sizes against
 the fetched size
Message-ID: <ajD-c6_n-ZSHAk_l@stanley.mountain>
References: <20260616-b4-disp-4352e8b0-v1-1-3e09f62e0ad5@proton.me>
 <2026061643-crowbar-handgrip-620d@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026061643-crowbar-handgrip-620d@gregkh>

On Tue, Jun 16, 2026 at 12:01:30PM +0530, Greg Kroah-Hartman wrote:
> On Tue, Jun 16, 2026 at 01:06:12AM -0500, Bryam Vargas via B4 Relay wrote:
> > ---
> >  drivers/staging/greybus/audio_gb.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> > index 9d8994fdb41a..144591f1a512 100644
> > --- a/drivers/staging/greybus/audio_gb.c
> > +++ b/drivers/staging/greybus/audio_gb.c
> > @@ -37,6 +37,19 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
> >  		return ret;
> >  	}
> >  
> > +	/*
> > +	 * The size_* fields are supplied by the module and are used by
> > +	 * gbaudio_tplg_parse_data() to compute offsets into the blob; make
> > +	 * sure the sections fit within the fetched topology, so walking it
> > +	 * cannot read out of bounds.
> > +	 */
> > +	if ((u64)le32_to_cpu(topo->size_dais) + le32_to_cpu(topo->size_controls) +
> > +	    le32_to_cpu(topo->size_widgets) + le32_to_cpu(topo->size_routes) >
> > +	    size - sizeof(*topo)) {
> 
> Are you sure these checks will not overflow?


Yep.  The cast to u64 ensures that.

regards,
dan carpenter

