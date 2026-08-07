Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DC9399890
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 16:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120795; cv=none; b=Q1AVeY04J2MghqVA06U9T+M+kvZSxm7KbmNcuKTWlO8AiWMvutt14zTSz2e2rnMBZ0yWXiQdKvLsP1X+1r8h0YNT3i7fahFKERkcbBvmhbHeiM6TAD7yYm8jDNigLIZywWK6z7WHSJlJ7ZccVFyDivaTM/F+n28Oyl5LmlZJLp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120795; c=relaxed/simple;
	bh=epq73lK3MZUwvnu8FNf08QieBBaJCWva3MyuIW62F6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnnGgO5J64ad6He/gN3I9mz+ZOUmHGGUgCZZs/xSxNAQ0GC4kKl/w3/fB2CedmRy6PZRC5n/Bw4zCYMFOGApwYQgSPkgvzF9j4PcutyzsRFsPQq3D+mAJRiDzqE61QzOKdS2Z3gG34kDgQQRWSEFRY9kE6xSPqCDqqmuV64Mz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4uiJ5GR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4uiJ5GR"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so3359831e87.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786120792; x=1786725592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wBAxmQq2KNDHznSsDDpOCDN4UZ6dDNu0GMeDOEsdv68=;
        b=S4uiJ5GRpfw96uU7Pn26yeGu9EzkJkDn4m3xC5OOntjVJGmzoT0F+mHeDN7ho2TqwN
         68/hQ30GlxcH/SUuMW191ueWfX4n7eDWKLXe3CksuPOsmhnwHZpRhWsuyZDD7HtvvDxE
         b5YAbeSD3umr2fsmYj0ROqfSEcN7l3sn/JLqtlaaBClS9WibX7I7bsjWt982xZRU2RwF
         52Hh5ETb+c+a6W5wvVlip5qgZmmqR+wQfL9kNwVNJXvOT7d1ApUEQLsn55b5EdhozZbQ
         ALqBRxmn3FhVLIl/ooa1ncL7FMRT/vWlG5iUkncVzdHjsSAgQilIeqiyCZE+FNZhYtjh
         Szmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120792; x=1786725592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBAxmQq2KNDHznSsDDpOCDN4UZ6dDNu0GMeDOEsdv68=;
        b=Zv1QDNi0j/rxyuEkfH/XxNjuk1vkns+b7To+yOUvnuN1QQgmg/4rF4LBODFoOjAood
         dwoDdtB4a/if6GrQUzddtVGy2UYBj/KCaIjpt9qTTT6Vb8JfapmY0nFWLwYrfb7SsuMh
         cbJtC5HyaT14arMm6bnI4njbAYE9enpC5MGurKZQ5y8lpMSVz+whrd62SFjeDzpGcd/T
         FJjdFytQw6LCzPZJrDSdzDyNxRO+fBXRjJ3vrQ15MdH+p5McdZ/3G51/usJiJ7mpOUeH
         OZvwDP/JXovFOgSa63QywMyGYXn+P7pqb0eK82PxukGr/QhpmfEhnKO6j4eyYd09Wzup
         I14Q==
X-Gm-Message-State: AOJu0YwUiLAzHImDnG6Wmg5jINPZzDs6GaYuSLQLoJ7FMDzFT+T+7WkH
	5DDVYwCYqLf5tDTfw/FkzmvtbrdhKjg9kSp1MV8jEMwJ0ZSzl6ZsHTrLCf2yog==
X-Gm-Gg: AR+sD124OZAZBuBzalNaco2Cy+WlCABqnzWws78chUlGCsCWqN6hzojxnD6FOyGnFe1
	/XZpD/lsqp4CC/V6TXwazCn2mlNYye5JaNKGRguzAdaLzt3wTWgO26vHINtVpL1JCzUByqSn2mO
	jZBE7cRkrt8VWIHnCLvTBk9G43wGH6ERPU3MFyV6qiO9ujlFg0G9ZBOpBkwCx+8tcSQdns4UfYj
	3rYA/CIIY5cxddxpcix6G+3obmd7VUcCSDnxJ/1ypKVLSxPVrJ9VIi4dLjVKBpyWLh5+GvBY0ld
	j031o0yYLxpmFtZ8QaFmTP9CKnI2s+LJ0xtwcAU+FIXyQGK0NO3jPRZ7gTygkLWRzllxX1IQ5HV
	CXmf/Iurl+opBQwgIPPrV0mXgl9K2RSBbZ0g2lIzwca3GvKsCmKuKLHlJCyjKdLcc/7mZUX27RV
	Ks9P2retUg0C/D9ALkQlQtvc9CpRbjxmg786h6PqAiM1gx4G+ct1XlO/JoPc8=
X-Received: by 2002:a05:6512:1055:b0:5b1:543f:f5ca with SMTP id 2adb3069b0e04-5b30b78abb6mr252549e87.46.1786120791547;
        Fri, 07 Aug 2026 09:39:51 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1e8csm564346e87.8.2026.08.07.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:39:51 -0700 (PDT)
Date: Fri, 7 Aug 2026 19:39:47 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove static HalDetectPwrDownMode()
 function
Message-ID: <anYKU1f7kjGrZusA@archlinux>
References: <20260806-rtl8723bs_efuse-v1-1-fedb8b91f346@gmail.com>
 <2026080749-dolly-never-0406@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026080749-dolly-never-0406@gregkh>

On Fri, Aug 07, 2026 at 09:03:21AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 06, 2026 at 10:34:48PM +0300, Nikolay Kulikov wrote:
> > The return value of this function is ignored at the call site, and since
> > the function has no side effects (except for the assignment to
> > pHalData->pwrdown, which is not used anywhere else), it can be removed.
> > 
> > At the same time, remove the efuse shadow functions, as they are
> > becoming unused.
> 
> Why not remove pwrdown first, which shows that it is never actually
> used, and then remove the functions in a separate patch?  that would
> "prove" that this is a safe change, as-is we need to manually verify
> this patch is correct.

Yes, that really would be better. I will do that in v2.
