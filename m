Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E2E42E004
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607199; cv=none; b=DwqkEeRplqHjUJRSpyDD18+H15yMLPyz9aIa3aLq2FoTWFoUPkpvGvil277JeZTcO3gJcsyH7ujEwziZd+4F404uwwkpH7vPx1bbIaTKoSCGrpHvUI5Q3Ygs6qVduB8Df7DUCnfeVqZvkrh0iwWbjFRXy/l0jt9NdGoGWstj3f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607199; c=relaxed/simple;
	bh=XwOY35kYJOzlvhlxRDH1kVozGnuz35ycy8983yIKIy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIIDvk/oNsCSvrUnOTsibShFcZAigDmY7W3RVRz0L+IHLHqHA0QgIqrIlCsK8kNefsGyiSz3pH0ZQoxPNwR/eHBfcFw29RUV0BHjUpcPs/KLiV/Z1qTE+UGeDshwRDbpnApdWMnQePkxbzBnaqUYLruVW/56lJ2gDwaNeDsFU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3JhtF7A; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3JhtF7A"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5176096116fso52716061cf.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607197; x=1782211997; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vv6uo3vwJO0w2foLRtW9k1j/yvyPbYa9fXgArK+5IAA=;
        b=M3JhtF7AqvpettEcu6ktYJHwCxvG0RVNOlS9d/H7A7C2vbkQfUOq8rqDxeEZC5MKRp
         0De/KzzTtaH5k6w/qwfzWjZxfdc3kMKZJcUmqQn4EjS+MHjxzzKOhsDox2rP7y40onrk
         +JwyUkZj4Q9hB5Ach7UH9hEy4r6dgqQpS1af+t67PgTS9elzxLr1mjC63oTGqEmhfIkK
         wtOR/OUOpA/2EaBqWTk20AvA9bewhAxOAagcd8iu6m6wi1et3MGvZqhQmp7YWRcm4qqg
         y46goELnFQB9rcwOOn4XuxniBvLu8pkA+E/oSIVC9f3xrcD+PUpXWHcBrfvrCI8mfzN7
         BLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607197; x=1782211997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vv6uo3vwJO0w2foLRtW9k1j/yvyPbYa9fXgArK+5IAA=;
        b=KmAsU9fs9KbnSeUrwitXK3IvTyV7VbY4XE22xN+xRslukyrlDKXs4T+Y3JZvAnY2h0
         gMS73H6EOxdZZy2jT3+IlUMav7AKjzebo3W5qSWMKucnUECBNP4L1jyDkYtzNKwzSh3e
         FQavxrjZT8fwZj9HWDJb3g6itSn2cF3UqzaAa4Z7XF7dc+JVG1sYL75LSgQaRPMrUiRe
         MutvAkRu2N7dQsCTbFKaEID2xCvNmxRYPL0kTVgx7ikBoxrXOZihYC2kqw3MVvR28Jeb
         t4RoMoYFdGJ+lZf0QXkRax2tvEyHPj6psPIIlAqaaxvuE5ZwyDL25MiTtArxcwTxTAtw
         XGIg==
X-Forwarded-Encrypted: i=1; AFNElJ+bItFLRokLuwObdtLcGvIUTQEWtDi1aOGmCQuK8BxZoElCFQPaj29ddULurcwpP9X0qibGp9QYnA7z9thW@lists.linux.dev
X-Gm-Message-State: AOJu0YzkrrFCwCq21/2mj7oOW71BWwkUbte4P9Sp3uhCxM7iGv69hiHj
	GEAvzwRtVYgW2QviaMLwKxg3Lu6/WUF9Uk7isXqmN4SbIYvwyVQDO9CA
X-Gm-Gg: Acq92OG3Jjrro0+kJkcjulSYy0etzGTw5tgqv1poznvmH+xu043HEmALDnufdUK95on
	Fvuok8N9JWxSgzox56cZTTzeTjMTBAZo5p99KK3J1ipfSLGSsEzKE4Qr3/Ys3Hyvt9POBieScaH
	REgzWuoxPDIxxBsBQC//jBUWHZWR2vzTIuwUNzzxpVoIeA40et30cL1C2dmiylwELW4XvftBR6t
	qzzhJ7uJnbRfIpA3vGAv9CP4Q6lGmtdCoyT4Z47ZDEKkYeziXjg2jZPygv06chRypfJMaka485u
	W7VAYTls3b5iHviJwdLDg7+MBv4tKxSjWDjQX29J7ASbJziAiRf74skuzRbgehTrjROUMQ9f3Lf
	LPnKsp7QmBuffaBrNOwmROm+96dbFF11na8pyWTA+nAkw6bSRnumPe6Wd+NQGD4uC5UmTu/lntN
	W6Q3lM0/VEka/vXEsJ
X-Received: by 2002:ac8:5916:0:b0:517:82f4:a2fa with SMTP id d75a77b69052e-5195337e812mr219561631cf.17.1781607196997;
        Tue, 16 Jun 2026 03:53:16 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb81697asm144674211cf.26.2026.06.16.03.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:53:16 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:53:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix whitespace in comments in
 rtw_mlme.h
Message-ID: <ajErFjogI6Uo-GI7@stanley.mountain>
References: <20260616102348.41973-1-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616102348.41973-1-subhrojyoti0609@gmail.com>

On Tue, Jun 16, 2026 at 03:53:48PM +0530, Subhrojyoti Bala wrote:
> Remove extra spaces after /* in single-line comments to comply
> with kernel coding style.
> 
> No functional change.
> 
> Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
> ---

Please group all your patches into a patch series and send it that
way.  We may end up asking you to combine patches together if they
are small and similar.

regards,
dan carpenter

