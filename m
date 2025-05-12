Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204FB264A90;
	Mon, 12 May 2025 23:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747093236; cv=none; b=O0HIULtIdUvHL6DQHe2pGQN49ScYKLuILdJoZUPOUEQeMonJy/ErWL4T2R7PuhrUVFP6s0H1PeQ1OlE8pfwa6jDsO3L96SP3ia6rzAnP6nOxNmenK2LEqJvSXO+MDC5DcVBvbNEwczWJP1Pd4djaF1ObhAm0Y2GbvXpLyG+FMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747093236; c=relaxed/simple;
	bh=XpFUmPLDn67gUJ5IU2ERgA2EBgtYyvY1tJex1tyNjac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9tHBSKFNMW0b/KRUhvdsoxhkH0n9BtcCVKUkhiy016KBA1+BikCUCeGdO1vauV7dAzF0sPNB5Bj41u0CKur7QiOyjBEBSc0B6IQBycOFGEw4PU7l8VEl0AmFfGjKYG6E2l2Hdt1gaD5wzYj6DFqym8c6yQ/BWOFjVGUDmO+mxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOpgp4ei; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOpgp4ei"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4ddb53a10d1so1889198137.3;
        Mon, 12 May 2025 16:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747093233; x=1747698033; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XpFUmPLDn67gUJ5IU2ERgA2EBgtYyvY1tJex1tyNjac=;
        b=eOpgp4eiGSWircGC8UuMTLrsdEbMtK4+anErT3I7t5jmdwpuxBYFuT+ldN2Ty3S7ZE
         c0UJyH2YMkS17OLYMTs6XLimvRktxlM7GmHO2/x16mC7gQvVdnZNRH5m1yqLRLVVFUdT
         gsugrctEMRrrPX1iGwdgZ8n3fd1D1a8E0Dpn/NmOlU0WMLcsP1UDKnugJcC8JaRFvgZQ
         SZooG9ei7GzNFW4Gsywxy+K61vrqs6g2TQKlpTilxChwughqIik9YfXIKIlNX5T8mx0u
         7vYlgL/oDM91RlEty10YcoHAELRhSBX9rmIn/KAiFH6OYVrqSPC5k1wj0y1V/cjNUcEX
         WgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747093233; x=1747698033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpFUmPLDn67gUJ5IU2ERgA2EBgtYyvY1tJex1tyNjac=;
        b=cKhiRVpLQmjTzuj9Jg5CWM1ZOBwJnK8DTp9bWbbXEx6W5lOL40pKGgJdOs3mW+ZORj
         xsDDpPhW4iX2HyXKNNuvMxWCidgfMNQFg/+B9XvuzHk4UsRmUfAqDv7/KHvQbs4rPbjv
         FturAMo2GGih1R6E2iMUbQA64HcKRwP3I/bQXNWaSEPxe3oNnrmVELbD60dkBXw6R7ke
         8dBoKDUsHB26eSski5eXC827+vdvIhXU+W1kHnp74ZapZq8MfSqVzmOHlG6gBzZc28xn
         uaBlokGR5qrWG9Tk71rTaluZWzJ7LBC8T/kqGRX5fd35cLmhyl/JWHSALjYTrVOTiP8z
         20Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9S//tg6TcPT4sriw/tjxkSmPEys331DAelR7fUKaPi0Qx+SoMDAxZ69xR8CMg15qxtM6Ow==@lists.linux.dev, AJvYcCXmiSZwq5/jtpF0o0ZKQaB/3B/rhT1bPgHQ/6SfPwuhWrsWycTkgUmhm1znx8uuj+aWTkPKpqi27cgUVEGyHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEIV26zq4/ClspsXV+XljNnhqf3tCWJBX2DqlSc0UZOydI+taE
	04269cAD0eyuVCX7c9mGreXYsk0qQ9zvoLi0Yz+kER1J+ByWGXL6
X-Gm-Gg: ASbGncs3RzpdIaBXp3iLEmQ4kT6O8+1OG6vZBg2IAzUu2QvRX507O5QUU3pog5owQLE
	HOHsNDkIACGbXJdYqWlu7pwSR0w8GOVYEBMkbCr8v5txT5yfGtxDp13j4wr6SC4mEzmtVZTAIIQ
	IRpLxkImhu+HNnc+7ioCn66O07UhPUx/J6lsnOMgnArvDPE48Cr47J7+gvPifdRAFN71LjzeQgM
	AgMn5iqkn7+AJ0fEu28kBfnx3R4GSzHWzv7Z9L5mwDT3iVOtW9SgFXWbAzZ/OqTQAEuB85qgmi3
	brbHxtdMNf47m4t3+HhWmnVTixIQy6tvb1hdIFVZVTKIUKW1Ga4MwY5XMvqq
X-Google-Smtp-Source: AGHT+IGoypguHEsX6HpvemdJ88QptMQH6H/Q9D2t7EN+1BBtVIyJSPv44Lv+/lxCrY1e1SpOMmMQTA==
X-Received: by 2002:a67:e7cc:0:b0:4c1:85d9:5641 with SMTP id ada2fe7eead31-4deed370764mr13126706137.11.1747093232903;
        Mon, 12 May 2025 16:40:32 -0700 (PDT)
Received: from eaf ([2802:8010:d51f:e600:10da:2fb3:1edf:2e90])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f603551dsm6063651241.0.2025.05.12.16.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 16:40:32 -0700 (PDT)
Date: Mon, 12 May 2025 20:40:24 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: ethan@ethancedwards.com, asahi@lists.linux.dev, brauner@kernel.org,
	dan.carpenter@linaro.org, ernesto@corellium.com,
	gargaditya08@live.com, gregkh@linuxfoundation.org, jack@suse.cz,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, sven@svenpeter.dev, tytso@mit.edu,
	viro@zeniv.linux.org.uk, willy@infradead.org, slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de
Subject: Re: Subject: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem
 support
Message-ID: <20250512234024.GA19326@eaf>
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
 <20250512101122.569476-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512101122.569476-1-frank.li@vivo.com>

Hi Yangtao,

On Mon, May 12, 2025 at 04:11:22AM -0600, Yangtao Li wrote:
> I'm interested in bringing apfs upstream to the community, and perhaps
> slava and adrian too.

Do you have any particular use case in mind here? I don't mind putting in
the work to get the driver upstream, but I don't want to be fighting people
to convince them that it's needed. I'm not even sure about it myself.

Ernesto
