Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9035B651
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776956982; cv=none; b=knpTN1vyNTZL82jy8v0G8cGN58OP6YYFUZe49n4ioCwMt4KzaBAjTE1Xqo0N4WF8dP/q6PIKuJDh15i9H6OHb13jgjhGuKZdID0o3ZM/yf2XqxODaGJQXqMUwy9pxrfuhy6juf4wdt+GkV6xWr+8S3jysBhB+lo1Q/GeUghkTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776956982; c=relaxed/simple;
	bh=fAk/H/P5kUVb4f/sC9mNVdxg3zeLOWSvVSZAeYbxyI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTHYqphOemOCLoqwyBDlx+7zM3bsud+MmDWloOd+i6DSj7keaEuwmSg70ppBuEL3Onw8VcUVeHSI1z0fHhPhbardq/N84zphorkhV272EsuPXOxkoFH343N/k6ms6t8AXiamFKTjh2Nmn5dvCGFa3LyQrXCex7FDUkEsA0+iVrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laoIRdrN; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laoIRdrN"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fc4425b6bso59048007b3.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 08:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776956980; x=1777561780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAkJRbPnqB7pwOh2l5JQO+WRUaBhz28RcGSRyyXQT0o=;
        b=laoIRdrNpx/IsMwrTtgyoMXbV15zSjb5I9NuZHMCxWZt5V5GjCxChi1FKJJxSuEIUI
         XwZLozdDzsQdiSODFhnVic2bkkWbrLT0oKig5ZzoI4Qrsp1dho2GwKyNXGeRwn8Q6E/g
         qUad0acbzvVle2h29KO9N4IfN0JsANT3SzVJl84+k1MgONGRO8YOcJhTNWg7S2WCiJqq
         ++0wDkk8syD38H8yG9QIYb2ZXB4tkPj4lJNr3u0ql9p8WLQdYlRJHyaTgZDVVeNmutk1
         +VlHmVf22YCuQ8qkX7ThPy7Ovvgg+834eF79Gb6+/tnPpSRRkretTVzrypQ4EDr13pC7
         68hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776956980; x=1777561780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAkJRbPnqB7pwOh2l5JQO+WRUaBhz28RcGSRyyXQT0o=;
        b=TG5pdnmDjejKdStXngnT36ZiQiSRjUcVkhfdZqUImePULpPJnE/AB5KM1yAPGoy9+r
         K9zdAoAgLSABixuUZD+PM9fBeBe/Vj0zQgGyKLse4VaB2qXOb/nWQhxPk2vM63H2DO3k
         XzX2OomtP02oFfDFcrGqJn4bbDYHoeZXnUsm/RrHvn5tVllb/ySiEtoD02KDY0Hm4K1q
         ha5B184VBTQPcgfhOKICKcgkGsSavfprNgLIEDpG/0Z7p70nqdROtjPfwQU7vo0hmhjb
         DGFpWMqWbgxRi+OLGoRMYM2Xrf59u+sEmldS1ncnW6zCnp6FZfpWHSl0XTixElp/S1Hj
         LIbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+X/d7xA7cvITYLUVdLWMv0R0mFoYeH6UlWJ3iK4PfMoCf8HWsfqXVG5VhRCEZNClA+G9vIFymtZWXjCf/I@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0Ij3DNPQWgpft0XMEPdqksShi4iBpOCDL/0XdgA4sfU/MdVNi
	1xbGLkZAMG6uv4L9Sv9j/AhpM/DHuPBOa021XUc3TYTOFd2Twj8dGDv16RoyB8jNoJc=
X-Gm-Gg: AeBDietmbbsByBRQ9TBWsW4oQZUxH4FuDjngf4NtYwrr9Zh3sVtovUnX4b5KhRqBE0B
	+99PuA1eBq/503uyi6+RbQDwMMsGMS+04+MLf33xAa1/GRJ54OHwSwZe+PWYtXB6boZW62kLvUb
	vW1hDzW2ITSlU5ucegTIMTviRi9oAMFaiBoxKB0cVvA6A0guv56vxAq8RozRA1xh63zypXZISBW
	y6bsPZCzPS+Fb4HcdOxABKjWsNJRDMBXoOxU8R23GuVqmn92tGacv9o32UhdhBIffky+VHoLQ6U
	CL0P1SymPcaIEj3W7EuM1yUbUpukxHJU7/q087Vwy1mcyQYFjdYeokfRApY6FoJijyRIpKhC9fC
	hMsGeKmwz/B/xDsVa6Xwdk5MBt5AsyPssyVQWYX908LsQd3jPqGDttatLP9D1H+RtLRzEPqW79O
	Nw/sGmKs0bzoSQ6h46JKhmV8I/V+kA
X-Received: by 2002:a05:690c:39c:b0:79a:62a2:b3a6 with SMTP id 00721157ae682-7b9ecf7af46mr282323967b3.29.1776956980273;
        Thu, 23 Apr 2026 08:09:40 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee9b1c4dsm81858127b3.33.2026.04.23.08.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:09:39 -0700 (PDT)
Date: Thu, 23 Apr 2026 18:09:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: deep@crimson.net.eu.org
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace TBTT magic numbers with
 macros
Message-ID: <aeo2LXug4MUs4aXo@stanley.mountain>
References: <20260423141213.720643-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423141213.720643-1-deep@crimson.net.eu.org>

On Thu, Apr 23, 2026 at 04:12:13PM +0200, deep@crimson.net.eu.org wrote:
> From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> 
> Replace magic numbers related to the TBTT prohibit settings
> with descriptive macros in the header file
> 
> Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> ---

There are a bunch of people going around looking for TODO in the code
and then using AI to "fix" the TODO.

The last time I looked at this code, it was someone doing AI.  And then
when I asked them how they came up with it, they fed my question into
an AI and it hallucinated up part of a spec file which they quoted.
I'm pretty sure it was a hallucination.  I downloaded the spec file
they "quoted" and the section didn't exist and none of the information
was in it.  They later admitted it was from an AI when I asked them to
provide the link.

I worry that you are getting your information from the fake spec.  Or
maybe you have a link to the real spec?

regards,
dan carpenter

