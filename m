Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C144D00D
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930419; cv=pass; b=tS0/oVtFXLwBeIakqV1H7wWT1dfWFYU37r+icwd0vllL2IMAIsLO2u1jnKVCHFH73ebddJvnmIn/1/QPY2bVmBZjXCbyGQrwaRWN9MhLkIuBdBt1n57QspmN3GCwGx157uFHgp/ffi9iOxNla0HNgh3lcAIIytSEbQQc40Q2VhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930419; c=relaxed/simple;
	bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MR0Vg5LwgYfBCo6nloOQ/OHT4iXaxnqdg0WKNSYkCgHH+tI2rYKuTusa6ZVJWByOwh1tL9SdNqd5rz/EgTGQkSvhN6KVOKsYVVCMCDjkWShbfAo7hQ7BzY4Jkq2JOCb1dhlzexZPom5Lgm2phAHnWwEVZn13e0oBKy2Fx70SiAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIm0zz4L; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIm0zz4L"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-82290755a1eso500853a34.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930415; cv=none;
        d=google.com; s=arc-20260327;
        b=O3f1IrJtH5+9Hy4P0sldCQkGTFziCsI2Z+HGEBTQwI1ZlS2C0Ukg/1B8NFwLJJrpuB
         Rk1sO12rJHg9/1SuXt3uMNtpk/xxIKpPSNhthjOyaq01JYeaEWQHOpscg1eMdaXET4mB
         Ep6F3hPLtSZAlLYyIqA/IXTKkyD0gU8DiPtoTkLzpCmp6O0qL5WbK4qXyQ3Orgg0nTqy
         o26KSH/QDodPCy/ukidgT/leW0Waw54RdGFOjvrfFCvs7JT6VQyTfeXiZDfYBEm9Ng6I
         6fkO6z/oX7qZxJNJQ9LercK1dICasnnSgCji9X+koO8kxD/Ua0NYLy2z7f9ROUjlJZTW
         DDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        fh=xKBeDg03yqZEI/qu3Y05rJ4dF3udtd7RVq35vvA+uuo=;
        b=mZABAOVLvSWOURVrno1Hkovu5BmEmR1BjrHHpZRjxUE82afb8cM4ysKzp1TXWg/BcH
         9F+OoMgbcyQS5hdkORYLqM377qxzRE0DuZI+fqH0wSpK7/nSBPJs4ednTuEMk2cxAhz1
         8eblkZGRHLKaMX38mTdPilGHbaB2dDPuuECjMIklSbnhxTUrjieN/4/1QGlVagoxSIhf
         gGPO+Xd4lTQbtoCbA19jzDCww01p4ayyLFc/8t++NFH0yh+Iulek76c3lylBSObImViC
         OJLU0oQMPVCBbnY2gFXrJJ57sH1z9MIyA4h5Bx0Xqnj4Zm42WeVILeViNsK0ZabY8v12
         v+UQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930415; x=1791535215; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        b=lIm0zz4L/ChtTEYzTlDfBOcuOp+9qkGK0vrPEJiB6rsUWZdbDGvc5BUIaMfoYghaSd
         0cmlClJEkOfc0IX1brvYz+Sjbbdh3cghUYkfMMc9XOLcjGm25JftyMv7+Qnedg5aUywz
         siA5ZBjmiWc37k0gFgv5qJqu7uhrB0f/YFK/YqYvO7XTGddf3GYfcaTPJAfCF1ITpSRp
         XO74y8PvQupapMXeQOAyx0etP3ZtrFVCOSQq5gZJBhGXvDq8WuogzNt4nofUlBH5GJig
         9H36k3bgSsVH0hPUVAtSS6GmajvRJq+Z4oph6lm2zsbq5NdvydaYPmmfHp5Gev3vjmZh
         yseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930415; x=1791535215;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        b=zBkhK6/YpvebjtVA1HOlPGJdWK5KnDnJ7yAJCFNXRHl6FKMLigjABvP93U6SWwUErz
         H9aDbx0oqln2stCdXSXK4px21Rj2p+AgXaTQzsj2C/Vi6gPhifmvAm1SYkreMRFXdsi3
         fAUz9LD4GdpaV78KlSqjuOfdepwVLVukNFvwoTOgWmpZRRfDZH1s5SI3smapZL+tDLsL
         nDHn0r3ZgbrE3LNIhCUa+5ci/p5p9H3vIJuQ1BL1wKE8pLA3K8+WW1Ssko9gveOM1XNj
         zKTMwM4M8y8FWq9DDqscQzUSLZXFQ11DUhxdoycyHhc84N/cz2c3iaC0u3cU5qCaVs98
         X9Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxVXSamPq5UHGKELI3OPv/T+w5vqA4l4xVBw0TAC7q66m8z8fDoQnf/q5VQYaLakEY+F5l9oS5JWOmMdP8p@lists.linux.dev
X-Gm-Message-State: AFuF++lhWxX2LrBUBNm7jOXhoFt9VXyL5Og7xFs91xrKQRXdcd9JnfZN
	xCO2BT4tGm5pgcwpLs+sWpCyPoRSIX48jWUTb1pnEbNmTzQRoq9qwG+/C7Whg5Jr81aIff86jfd
	m51CqMpoV+8xQfqscegSctgzAr61jb6imyKUK
X-Gm-Gg: AYBFou2RT19vaQjKuGf2SsNU4ULOYmn1KY3CwBw6YXoXE+2JE0VbYoac5nvDjhdNzp0
	Tp9IXS4JGbJ07OToJ7otb63MxCORcdynygAcgMYGEP8pLkrdU7gpsxJBplEj7VRsXRi3xBN9AV8
	4zFqvD/TTyxXcCduSFdCBYxt7dC/xRdFaA1CkInctaYIHHmxuVslx5vpmhtMdxoVdWtVSzlAJFE
	6QuxHkOQ6chnxzscB525XFMAWF25FdX8VvSpFPGZ+7KVPQ0k8VVZiRhfoj8T8mh6sTxyWFwFX+f
	YLQnum9VLa3GQ1UYjkptAa9iRwdxZ9XBAeFc9feOhWLQRcNAQ4ygENrzXwOW53IKAnKCWMr85O3
	TOsMoGLdBuCIqgMH+YXaK3MgQ7nmIA7bPqOo=
X-Received: by 2002:a05:6820:c3c5:10b0:6dd:4a4b:1843 with SMTP id
 006d021491bc7-6df32aa7697mr1233994eaf.14.1790930415068; Fri, 02 Oct 2026
 01:40:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:40:13 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:40:03 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 2 Oct 2026 01:39:53 -0700
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
In-Reply-To: <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
 <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:40:13 -0700
X-Gm-Features: AclHuK_f_8PDilm3AcjpkkUSo4CYULlSQZBGWXCxVQAmtvjbpYa5nVZnpOcKW7M
Message-ID: <CAO7O_xiT9L4M2NXz0gRtX-6toT7q6Ec_ZnyEj3i0RGc0q8jdxg@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] media: Add Lenovo Yoga Book camera support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

> Your series is mangled (has a garbage), please, *always* read and test
> what you are sending before actually click the "send" button!

You are right. I checked the public-inbox copy and the Media CI result.
Gmail reflowed the patch bodies; Media CI reports patch 1 as corrupt at
line 10.

I stopped the attempted v9 after its cover and patch 1 when the public
archive showed the same corruption. I will not send the remaining
patches through Gmail. I am switching to a byte-safe submission path and
will verify the public archive with b4 before resending the complete
series.

With Best Regards,
Maurizio Casciano
