Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF4131619B
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206943; cv=none; b=VoBnJqtnF9Z2GR3OOnXbiUb9pDx3ei5q588MCKrls7fUejIbOipK0sPrdA4Hdwuz9yOMa2CQeaOG4Zg2Wi8t2qj4Xn0ZTOSDNvickPM1aEZdRslnZsBWesH0rrDNOgQ8LjWO8d7C+HNO3YWfMLkm444TR7WZRpUBubR6WMWM/ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206943; c=relaxed/simple;
	bh=7XGrSCNrN5uhRtsxuhz5xVWLn597vTSmrRo+qSOXmXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvL3zrjolyI52UeIC8yxptENT37MFUotos1lnB0hKrhmrRVxas+opgExXJ7GTfCnnia4K7QG2PdUdgKtydK0ZCvhXsh2q50VyyIKc8WttDAOf4DUbHQY2o0sbyocxxVHf60A8ZNsjkb3wE0vbYrNpDDrSLimlgGCrHleMpZKcqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+7FtTbF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+7FtTbF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488895ad947so19584335e9.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775206941; x=1775811741; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSuDIoeoytZjS9lz1nCHQAgnrLXZ7nvk4L/rgRFQaoQ=;
        b=l+7FtTbFhboR2c4N1R9dQXWLvO3lMqsaHVm2BMsezdDrLE0AtSvngl5Ud/ABumRE5X
         B5IV+8Dgw1H8PUjyM01f5Lmrt3V0JZivPpWpaIwVfKNV0BWLqI11/2i6akUVHTAhyrO0
         ef5wBOjCRjR6EW5Spq9IfRGx1k+E305PrE4SdJtyem+XwBT1KHn++OPBgPF0aTG9UPGk
         X4sieOGwQxr+tJlh8zFiFLJcFV4+vAqmxrPrUPY9gRG6S+SsPWAeKKkhp9r3roRqnrsi
         ArpnHDUvni5MOVPaCoR8DAKuasZ5Xxoj8U9YosrSInPbr57ibv6CZ5QrjiDZm0GVGqVY
         NacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206941; x=1775811741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSuDIoeoytZjS9lz1nCHQAgnrLXZ7nvk4L/rgRFQaoQ=;
        b=kPT6v/ElIR1aq2Ud4MgyBog4cLF29+rFWuMWrsenJxUezEOoTmLiamh20ViH7hGnhN
         gnsYESf3A6koe1eNPcHLohGAqmZxAThoJIZNYVBArUBZjkqxyWiVV29kEGMBxCyFOnN2
         /A8u4bKtq3obfwTJzHcO4kaH9sERL8Q1rAnBddySeFgYQf9p6NqfQQj2KfPDBkjXc5vL
         Lj5Dr2X40jLrD+WzEwWX5a7kh7+F4L+AIQJ0AWMTs3ZafKSzKUqPrzAECirIasHfZwDP
         ix7PmPd2gsdOVmcewF75fT56D3m0gdvnoS/HT7bfG9I/Zn3/sv9ATCWHQ/UBTZsNhcCL
         iWHQ==
X-Gm-Message-State: AOJu0YxRJcEMpJ5MKbg9puHs7bLhSuR2HNC7RIJ4tm5/IyuTMKakiZ7A
	/iRA6R01qOO5xH/yGDmYV3mnR8SIfwrqBhVMB6NeM9LJe7pBXIfMf4cQ2RxYzw==
X-Gm-Gg: ATEYQzxS2fRGzjnkKUXNBc+zy7qroGVwHxwo87ENmNZ5J2CId5/9T4JE3G+xh1RoJUK
	4eUuYvrmfiUIToBUZRWjp3OSp3bLdjCGhKK/HoXEsUEcQhgV/qErrhJ5i9ljo069odo5F1tONuM
	8MYRylQbuuID9j9dqQp5dYE6O2YbDZ46cdAw27uPaE73e9ONfPfbSQsI11m43hI9Cgds2Kppobp
	j0C8BhaihmFMI1Gy/ZJmHgUW6QBJ/3aa9+wF9jdQTmYqh0wyVMhtJ1FuNOvg5gIvwIq0DFB347+
	9F4zLvO6L++Z6A7EkTP7goN7ZkztymQ95tBRhye4tO+IWHwl1d84IBZkrIPxCk9k6TYlSb22ihv
	KoXURHviUje86ImGIykchMRdIS3ulogG68/rJF+LLsd5HJZ3m7ucpmEUDV+mI+yta+bWGAbhEJk
	CiO9Hiygh6xHUfbTeUnDLSlCPrSNxp
X-Received: by 2002:a05:600c:8b52:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-4889978140bmr38999785e9.18.1775206940413;
        Fri, 03 Apr 2026 02:02:20 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a626100sm218963985e9.1.2026.04.03.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:02:19 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:02:17 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <ac9864qwMrHuU8Sy@gmail.com>
References: <20260402183402.444630-1-azpijr@gmail.com>
 <20260402183402.444630-3-azpijr@gmail.com>
 <2026040336-humvee-throwback-72cf@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040336-humvee-throwback-72cf@gregkh>

On Fri, Apr 03, 2026 at 08:42:11AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 02, 2026 at 08:33:45PM +0200, Jose A. Perez de Azpillaga wrote:
> > The function configure_isp_from_args() contained a duplicate call to
> > ia_css_output0_configure() using the same output frame index. Remove the
> > redundant call to simplify the configuration path.
>
> Are you sure the hardware doesn't actually need this called twice?  Lots
> of devices need to be told multiple times what to do in order for it to
> "stick", hardware is "fun" that way :(
>

The concern is valid in general, but ia_css_output0_configure() does not
write to a hardware register.

ia_css_configure_output0() writes into binary->mem_params.params[], a
software-side DMEM parameter buffer in kernel memory. the ISP firmware
receives these parameters later as a batch, not at the time of the call.
calling a pure memory write twice with the same pointer and same value
simply overwrites the same location with identical data, there is no
hardware interaction that could require repetition.

> Have you tested this?
>

as noted in the cover letter, I don't have the hardware to test this.

--
regards,
jose a. p-a
