Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0A3D8E;
	Fri, 29 Mar 2024 02:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711678494; cv=none; b=TKPATjTNUm7lhTcvuRE6Vn6w1CGbRdcJMm56qifNBdD2a1p1nXQqXwmbwzl/Ye6ZtuyT+vNAwqmUyT3JJIuQkm/rRtTegW7jvzOhscnbkcFESFSm0z1XF5WBl+P0WZtbBRisoNJFfaOal6Re0wnWKGqjU+vjwvwPFwQ/MzQ72e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711678494; c=relaxed/simple;
	bh=DhZdQ2iI7Zs+BqDVOGl/HOsjIT1jvsMP+tqZq0VoEFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TC6Fb2P/+Qm2dt5CGRrtaMBwc5Q4xiRx6lKR0TPahHrAqhPR1Lgm4efb4ZTQdAyXZL8lZJ6EoGHLaYuWj06Nm0y2XscFRlbPxvpZomh+JMu8Ggu5hs3+bJKeIxXaikIdSOZ0atSEU/wmgC2aZO5mH39BlG2zi3wKz78OwBMtAf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVxGskhw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVxGskhw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dde26f7e1dso14222475ad.1;
        Thu, 28 Mar 2024 19:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711678492; x=1712283292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHKg/7V7Pl/oLudfM0ileqdKuhPljGzHIMYbgvPiGiA=;
        b=LVxGskhwgNVfyi8o1IdSMwcULiPoiH//bcLJXTLEj8C99EYWlFrRCKlO51oSF1CNzq
         tKH6OdKQgDPvLcgFsy9ekHoUb98puRD6g9d435Y4Fj4wj39eUBb9GUmNf/uZooq78ORG
         cAgFQvEGwt8JfiypePYioSikDBaZe3x9nM76ffGqWe/QMgQhTazWbPA0x64aSCMlnXDa
         sFSnFJtdGfxQg0S5VI5hyKhopp1DoZtGoxyrscyEyx96pKR6PrAJIf+BgE7xpyD58loW
         j69UnjQFkZVFVBNoqRJyC+z49b27wwfJMJmGuBfzHSuJG4bcldz/clbQCoV9tMLDVIX7
         OuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711678492; x=1712283292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHKg/7V7Pl/oLudfM0ileqdKuhPljGzHIMYbgvPiGiA=;
        b=Uj3kd1mnFEEKK6V5nPhrzWoTBr3scRd4TTemANq9QQfA585IqBV0vD5m5gInMVG8K2
         sPIPMXY7ylsPOuzOittoEm3EzKRPM3BUHQQJXJtxYBsBBiNpdabbol0o7XUCIffimqkx
         iQLEBgp55Ko7CID4uUvkmuPyRzz6vWR3puy0iz+Db1cGzgwir7XHriz7PbIrKRgXdb9H
         udnJss4qgJsFqkGBiwgEv4Vp1BIdKqdTWDdXTmbYp+0MAnNAKrCjtMMdLXaMnTgo8w2w
         H8m7hjlavtXcbo0EMxil4qMdwacLgK/SUd4M3sUDqyfVk9vgUeQmR0XrX1sqtvbj4AWO
         7uNw==
X-Forwarded-Encrypted: i=1; AJvYcCUgb6oYUv/H2zToy92kwEp9Va81NQwEdQ3oOm5eXXNilvgbJ2ThAbHxjkBy03ZSfhc12PMT3e2szQiQ5lyz/pOAQncEFPnGzL/CNLE07rk15ddggMqSBbJUGyHuEpOm17GPJGz51gos8Q==
X-Gm-Message-State: AOJu0YzH84YScyB7I9T60DCsUQDL2qTLv9Nmonyy2+Yoi353eaFR6Qk+
	GBPF1uKyZScxx09PB8pu1xq/y2BB3f1/FrTvNSOnotIsVIhfR34r
X-Google-Smtp-Source: AGHT+IFvOpFFrQkbmzDEFb/cGsaj4nEqoC3f0kHNWirc2xKMaRHRNGExfwgCVpA/5A/dRRUx2hFrMw==
X-Received: by 2002:a17:903:1210:b0:1e0:27c8:5c7e with SMTP id l16-20020a170903121000b001e027c85c7emr1375866plh.25.1711678491960;
        Thu, 28 Mar 2024 19:14:51 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([2401:4900:4e59:88b8:f462:3eea:57c6:a15a])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e80200b001e0b5fd3c95sm2342659plg.259.2024.03.28.19.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 19:14:51 -0700 (PDT)
Date: Fri, 29 Mar 2024 07:44:42 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: alison.schofield@intel.com, paul@paul-moore.com, mic@digikod.net,
	fabio.maria.de.francesco@linux.intel.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH] LANDLOCK: use kmem_cache for landlock_object
Message-ID: <ZgYkEghv7lFK4K4+@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
References: <ZgSrBVidW1U6yP+h@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
 <dfa6ddcb-9a2d-49ac-90b7-bb30b23e32c4@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfa6ddcb-9a2d-49ac-90b7-bb30b23e32c4@moroto.mountain>

On Thu, Mar 28, 2024 at 09:39:14AM +0300, Dan Carpenter wrote:
> On Thu, Mar 28, 2024 at 04:55:57AM +0530, Ayush Tiwari wrote:
> > Use kmem_cache replace kzalloc() calls with kmem_cache_zalloc() for
> > struct landlock_object and update the related dependencies.
> > 
> > Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> 
> Is there some advantage to doing this?  You need to re-write the commit
> message to give us some clue why you are doing this.
> 
> regards,
> dan carpenter
> 

Hello
Apologies for the errors. I am working on a newer version, instilling
all the corrections. Thanks for the feedback.

