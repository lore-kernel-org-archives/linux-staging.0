Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D0304BDF
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 21:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775511083; cv=none; b=gYUpsY08YnntNa690a/TrC8f8KBQhEAp9nmz9QRPj9Qg+U3xVtTvWwffB+UnpkDV+gzuyjx48JN72qJxmrco5cKxVmq/owEsCMKo6SqGsNCKRUk1GN+m4YNmMmjfCh/L8tJ4yom55qioMe7w7qFJPm6EQhIXNko1R65X0b6WgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775511083; c=relaxed/simple;
	bh=5lEmVosmeuBFQdJSXSghbeCTHfp905dvVKwXttkmT3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAsP9zezMbAU1xXfNMoc3BOJOOgB3SJnuzMwJBzUOGsdpCucwJ0zdUGtlFs4dO00lPM5qNJ7SarWAirkt2qZGA5y6/D82KVnbB/unHKuJPCj1trc9inFkW6nQovNb3DiucLw0KQoO0zFMlP1k/qSNXdWaUEpG4ckPdU4HkWEUc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBSmFdIW; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBSmFdIW"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38cbb1ad0b6so37076591fa.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775511080; x=1776115880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=;
        b=YBSmFdIWGgI7SHv+Rrbj6oq2CWze9t6W3lca20496Qp2UCwwaAvReFdD7+t+EVjf8n
         K3m1UwYgDHiL77UPJqb5aEuSGUYUodJIt1wZxgQQZb+r1uL5ELR0PH4yepTwGyix+Eu6
         8NoKld+XXCVtgfCjFH16nayzMoc8Vusq0Gw1vAoajeFBVPXzQ4OVNKg1p3zpfYRq+ilh
         0PRKdj89dCXlPO0ixxQzY2O2I+0nC/bgg8AkNhMQp/mTG5Ssrx/tJim+/ccew4nhFb7+
         v7ef1lx7DfSCtsNmvpqzDC2wiH4q2WOSb/5871LAIa7XHFmUGuC2OA/Q3v5zzmuNEeMb
         MS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775511080; x=1776115880;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=;
        b=tKA07eEpYDzLQPNbz+ydwE5oYlr+7tzi3nKPnQkp0Pn3IU4pVk7rex00Rpa+9OiTa9
         kW/kBqYQZM8wSVX25X0f7Baxk4PKRXpCGKDHT11XTKE7WTtMGFJKYHEROJ7rAinLzNpU
         raU7MWAqsT+rR0L5g8LmWHY3cIp2zvEgW7Q8xhvvysqmGyPfFYFQcsAf4fL17mcSUKqN
         ZavJJ2b/5MPKCV248F4OImRzZ3Yt3sqbxPcY6GRAJTHtu/BNoHz7YWSZvmu+eeDK11Qx
         tZ149Ml1lDlNuTeLa2ufNbGwgdSsNMyDYbBG5JqrKU8m30DLaMhFUQZb8SVXwu5Ayg0L
         eufw==
X-Forwarded-Encrypted: i=1; AJvYcCVpT5PsO40k6FO7LP5J2k6UB5RYcEwlpiiXv2vNcANpR11q40Zj8CxI2WDWIHkl7FK7TJR59oZ/F89RQg7h@lists.linux.dev
X-Gm-Message-State: AOJu0YyY+83wxEzvgkngyaZMUnWH4ObArANMv4LW2n+kDoLpjJX5EWc7
	xg0JOHtfCpJE3Ixgo8090lQrgD1Kyw5INDA4nGDLD/8jrY0W1JBINgHZ
X-Gm-Gg: AeBDiestTF9Ff5NPgjkvbh+ro9SS7lymLKKSxQrUiuYjM3byvKkvdd1xVN/YI+USltv
	4CP0zKNNr/v3cCsBECASfCOiofIVeei1p2VyGRNf+N4Iu8dJsUVyc/AwB76eVCqerl+D/mIPnLu
	FoXhmOo/QBgFlZURQpwHUByaPHVzH6/hVoOPdU3YsTChPW1W0p+qr7B1XeSQBY9aqj3oFRHqYUt
	LjMi8rCDuQlm52Xdp8Z1MFNm4lEsDuUw4VlZy6KpxE/E4wpCTQ+v11EGdWliun9duenhjT3MTnd
	f86UdiulWdaelvUcZQE0mhoChkgfoEwId5WkuorhUYIOXTaqRuaNHhR/ZwpL8SqQaVGP8x5KWOL
	Djb4B49yww883s4JL/BBsGM/8EZdFoGgV7oOa/h2h5JJ0j2CkIvWEmrLRbLWCPekoWPeraG5XLd
	Sm7xaPhqI4ZQ3Eu0P3VfxuCIC7Oc8=
X-Received: by 2002:a2e:bc11:0:b0:38b:d8dc:4adf with SMTP id 38308e7fff4ca-38d9d439ed4mr46799101fa.32.1775511079668;
        Mon, 06 Apr 2026 14:31:19 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm32952631fa.39.2026.04.06.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:31:19 -0700 (PDT)
Date: Tue, 7 Apr 2026 00:31:18 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <adQmJhxNkAe-ChRp@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
 <ac5oecJ05oZD25VF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5oecJ05oZD25VF@stanley.mountain>

On 26-04-02 16:00, Dan Carpenter wrote:
> On Wed, Apr 01, 2026 at 10:14:41PM +0300, Andrey Skvortsov wrote:
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > From: Samuel Holland <samuel@sholland.org>
> > 
> 
> git am isn't set up to deal with two From: headers.
Sorry about that. The first line I've added manually and the second
was added by git send-email. I'll fix that in v2.

> 
> > cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
> > like disabling runtime power management, releasing claimed sram.
> 
> The first part of this sentence is missing.
Thanks, I rewrite this part of the commit message.

-- 
Best regards,
Andrey Skvortsov
