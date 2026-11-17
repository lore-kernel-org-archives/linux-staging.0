Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937825;
	b=4uJRvPjtxbAKaGBSb81DPgJa9Olaes8b84UrVpgmqaquqrFj3mKJJpWbzgu1C/lqI1wl
	 C2gpmmD4JoBYrAenhKKOqC6wjDnReWV5lWFBbEVfAdKuiEI2UMXT6z0eMkqENoOWdBOxi
	 WNKEB0WrsQbukO/zsn7PVsav7H3Jrlgb+1/shzmBWdktpOTnJs4yj3IglMSannPMHafZH
	 qZhqTnVxNIwKslkZZxMa6CKLA2CIid90/IGcaH+MFGTTRZM13HDAUCXNdfoFIg0yCQu3E
	 Lc+jV2PWkTWaA3JieJz9jHkwl9vAf+pmsrvrZYBMBujepttPLj41k978fwhNkwQ2Mzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
	b=OEYMbw6kYwkMkAMOGn04OtuQblt2QXtIxei3djELBAp1RtscDBmnx4HzqV3afWGK5k7S
	 BC8THKkecqoBJfusv52ahg4vSxsERIJJEhjtSTwbe/NxGsx9ycwSgod1/U3MJ2K/cdFIA
	 KfNON6ZpvcCvq2QEDglRQjy37hpPjcgTHGmhFyuGS68m7oLp1HlIcz4fnzgA2v+8JsU4A
	 Cia8iSljD1g6iy8QtjW3EAhBIeJZa9bMPXUAjtHa8+14z3Jzc7qjIXJnxZr9a0mu9BY2l
	 lhTbO747W5meko1pGhKd2s5vbyNqjK/nEPd3bK739FcnPqnrdBH5pbdmIYkkBIIVdbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IumaCNNv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D910A606A32F
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 17:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D910A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IumaCNNv
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4cc793704so24769047b3.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937824; cv=none;
        d=google.com; s=arc-20260327;
        b=U2ep5NhRtQZluUImS8JbVug2ReWdiMkNSuXhDjLAbvpHMMhGDU93xkxnHXX6BRbPz4
         a8sPBArFkwjJp6rhCFTsgup7Z39Y8IkB7uRh/E4acAFnY4EMS1UA2RUE0dERw/KNHBzS
         JaG86UKjZvzZMVj5x3uQTggzXQjhVaVm/Bh/t+j0zPj4Sf35AIv9rH1GRUqOFKfe64BS
         Ar4FrUQigPswVX6ZD7nF0QzPnKmFzIuyDNNmDxyehUfDwvmnF0rYwWdOIdbRC9PHEyXL
         N2cJweYg4SyQ8e5Z5xp84yXvupm7XefsgbKmilPx0un0NEU/hyU1N/s+q4PR8V/e9GGp
         AzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        fh=k728gCjx04ibZjbR38WA7qLBdXdf9lbUQKG1mmkK8Rc=;
        b=U9feOhSlqA0Yc4orX5cJMmaTmIY98tpldU0AXYgrxcKEAixZoZLvwPxNi04ySiR/EG
         sKhSSkRg3nsnsm3H/4K0N7KXktJ1//X8cW76CegDh6v+JpSEyCxR9sHQghWvifViwyfz
         a1WzNq+MbwUC+dSoRXZ6lG9vXHF5JpsQIswmScEsPp8XTX14u0N+7h2GBiYvOhzghfhN
         9wrEFb8svaVvb1mi0zV5JLBr9cAbefArbSRtYvHR1jb2oY2NoO4/+nO/FK7n/06jmMwo
         /eB1jl2lOfSAWwZEgi4nMxnrjp7uLUJeUVtTgRM8hyPZSUxOcRwarwDOqk36bBfM1dzQ
         zT8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937824; x=1795542624; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        b=IumaCNNvRotPOqJxd+5HecpvLPbpZnbr+IX697Y8MsBQu1ubWcHrPAUyEmOaFgymxk
         xEU9pULGMazwCL+En8rt3/sW6vTWoE1HpfI+y4eU7LZEOIp2zdJa0fPkwiX2SiLmJGyt
         5jcksX8Z1Y0hrH0iwXj+yv9T0oU0m/WuRvyeLBRLdzf/tf/cow9M8wRTxoRpF3HCCZPw
         w4mVjpUtHywWJcOevQPmikCszfaKguLX/V15Ws9MesVjHhtksP4LBXufvzG564r4w8Oc
         OBfFylADYQ2QQILa3qwLhAd77DO6ilAEqQR+FRPFircaf5Z66jg2CZFmVnhgewZM8pjH
         XZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937824; x=1795542624;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        b=1u5+FEENX5iM6VsLHatRIYf5BK4pjxs07nDZxZ8oL4hdd7imazEXABNMgR6UnExj+U
         5wpeeu3mHVGmrA4qT42A9kjDA4lmNZEw1iYATG722zoS9iODkxtLl1pffiekCI37kAEB
         weVmYww06ZNHpSYsWLV6t3SrY5K5xSL4AQbP33e96DMl7lrlHZ4m6/vgRnmn+PaNqC8G
         uv/9HRV2pNVyAjhdlDvjI4vP/vrdxuoY850AMdJf4bzZ8axgRapzIM1tbrmwPZzmHW4F
         SBpz6l7AtQuy9w7RWjIsZavLaBT71Hrqjy0m81gvB/RlJyC5Re583DB0HvM/2IyGV0ZK
         eMmw==
X-Forwarded-Encrypted: i=1; AL+hErH+2dpLTv5dRu2z3LWSBX56o8TEtd52bOyWwAO6kCL13/h+558ycGbQO/QXfSp0sjx1lKtvMOIqgRQ55Pe6@lists.linux.dev
X-Gm-Message-State: APuU4Z/JHvcumMkbtkK5PdIzvG3e7HQF5/gZ/nwKkP/OsPPiPhubFnaE
	159hULX2kWvKj8E+2RUveBTaMqPDCn4JOCEwmOKGetuFxjZaTsmzdQMLp6ZuBhWfYIa48qfNFKJ
	Uz5HbTPy6iUoGum2TB5Rpo4x8qNvOWWE=
X-Gm-Gg: AZFdTZdcnnZWdpCtDNWwPbx+QgU8wkrJjW2qUYt59hzQve6OQFubymeFJpXNviif8wZ
	GrOw9T22b6CThQ5wjWbLXPw5DOnGth/eaJoYsBMFRfI7C5WwpbIvKsJVx2/u7OkwmWgxlfgvoAv
	ZYNFEbeK+ucY0vuaXs1inffwFkWDkJlJWfZDCk7pH712p1pFOoJnbLU92hSoxLmmKZGKNmxrVI2
	krqr/Fsv5LhlBvWpcrJX1J/uQM0UMftPsL1EdUfxQYNF21O2eBScHAyrM2DBbdfbZSUbGOe46om
	tTh8HkDgskr10mm8nvPx4u+Kexk7Ir+GlydTl1aVDT7ZYMZNbvjIJ2fBz8ibcGw4K+F+saZVYR9
	g5aMcT2XM/6w23jy/64niwx0Y9H/9v8ZkpO2eSvfyg27m9MrmeHVfKGNK4u7ehtJ4v2HIZLI=
X-Received: by 2002:a05:690e:4196:b0:67d:ae02:4603 with SMTP id
 956f58d0204a3-67dd3fc2a51mr113492d50.90.1794937823656; Tue, 17 Nov 2026
 09:50:23 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-3-volodymyrchapman@gmail.com> <avwk93N8D7AYGzDX@ashevche-desk.local>
In-Reply-To: <avwk93N8D7AYGzDX@ashevche-desk.local>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Tue, 17 Nov 2026 17:50:12 +0000
X-Gm-Features: Aa3M54rRQ1-bLYzTuwIPPkNUo0RYfScU4jd-nC1VUspHbX57A9OiM6Umcza7INE
Message-ID: <CAN1s30pEE5vN7Yuz9Y5_+4M6-TeTNTmHA_hYLR9KLnXj05RWfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the review.

> Enough to mention this in the cover letter message.

> This paragraph needs to be once in a cover letter, no need to have it in the
> individual commit messages.

OK, in V2 the testing details and the AI assistance note will be in the
cover letter only.

> Since the ACPI HID here is broken (it's actually a PNP ID), can you also
> provide (as a comment) the excerpt from DSDT to show that device description?

Of course. From the ThinkPad 10 (20C3, BIOS GWET50WW 1.50) DSDT:

Device (CAM1)
{
Name (_ADR, Zero)
Name (_HID, "INTCF1A")
Name (_CID, "INTCF1A")
Name (_SUB, "221B17AA")
Name (_DDN, "Sony IMX175")
Name (_UID, One)
...

I will add that as a comment above the INTCF1A entry. Should the same
comment go to the INTCF1A entry in atomisp_csi2_bridge.c (patch 3/3)?

Thanks,
Volodymyr
