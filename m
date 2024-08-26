Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A206170A11
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675782; cv=none; b=aZyHEh4smGlaImqsPPKZjaoTvjunctr2aU+yfxcun+Pv4VVqSm4KOGa+Qtli6OxusAOVGzwNjiijFxmDzj4LuQm1NRhvCciFotm/Rv4KIomDMgbpFq4aOLH00emnUyCCyFmjy8eBclHmeeVNjpF8Wiahe8PnHmdugklQIAlgS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675782; c=relaxed/simple;
	bh=m5u0IcAWdKx8hVb/V0BzHt9oAthDFFYZLNAiWLrrlAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhLQ0KWTUW9aqeuNbBlW05XytzaDLYF9m5LkfiKRWDXjXBxZLdYJTHcLP6I+tcwC4wrkvYAM/bliWKaqpF+w5niudur5k4QWmLJu9q3l7QoXZxtmf7+6y0SaEqjrVOsXIOo5Py2vKDYNKeZOkg7BvJKkMEjQlVVdwO+zbBEfD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXPE5TCZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXPE5TCZ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a868831216cso488199766b.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 05:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724675779; x=1725280579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0AvcnZxCYKbbgBxM1hp568Q4PFo11xk7FRTLAQWiodk=;
        b=zXPE5TCZ1I1+Swd82ndhYX6jj/yLDPkrz2jKil7ylM/Z6KztlDPtsukAGa9qIwzHZU
         Ul2lWeszXHMdqSHGX6+N//GUGXdQWrqU8/15CvF3dsIeQeid6DqBbnGeBLPk7rah448X
         oY6slAqsv1J0hKNgmhKAJaTHHG9hl918TNSOEQzQaXj/WOSmR7MQMtVhdKpUWPgzCTeV
         COsOlqpsPiJnCtJnfOCW78udUaBXT+/tiK2HFeh2BXgaeG1OWP+gdPeMuKuMHzSs6fqN
         qnXxQi1bUCjKfNZ7UHsAmDPsv8P+TSjqzh4yKJ0Ve/tBVsFwnLcuH+bmpjSO1nf+ZQ87
         7jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724675779; x=1725280579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AvcnZxCYKbbgBxM1hp568Q4PFo11xk7FRTLAQWiodk=;
        b=Au+R3BOMeYB9ue5OgbPPfvrzhSr8LvO8JjJmKaC0VWIBaJ8wB22/aHygtDglCyxZtO
         u/1ZWTG7XgUoVgNxmXxU89vcFK6ByQT2/mnY2691Tzfkzp9OnQnfIWigF0fYxsqKu7sT
         ew3szUYOzjlx+CkBYDTubRYzfg7CqIX2j/ZiaMK1UJbh6ur3XNIj7Ct4yKLuJOa5Eg3j
         d5dm9S5SXGov5mQJfdYJATCWSXxo/4Bvoldpd8OnZV0x8fuo+XpsElWkexvrdX5g4wlC
         Sh0lJbDMYQJvoMeTYaE6SjLa6LrkcSJj4N4vNIAHlFWeV/qnPIPagN29lXsX4qnAwT/c
         Czyw==
X-Forwarded-Encrypted: i=1; AJvYcCVS9s/acc5X/HsIiqwz4KHzkr+m/7UZAsoL8dyMqIFixgkjRrWi7EBFUJPuWJpIKcUkdcuH75HF2Tknslo2@lists.linux.dev
X-Gm-Message-State: AOJu0YzEZddq24W7qptagHZClfzbNW47TvWdZ6UxMvRbI6P91+UKxa+b
	rbeTq/veOOUa/6Yym13NbXmFffdlQKFiAyRJweD8zAiwGFMJNffuaDXYfIGm57/ymzwSsaSpS4e
	5ZDQ=
X-Google-Smtp-Source: AGHT+IEE434rCq1S+EXj/6yMfR8MXyDOkg3EGd1S4Q3BopexMzuNDob8Ant3j5ZoiRS32d0H0gnMig==
X-Received: by 2002:a17:907:f18e:b0:a86:851e:3a23 with SMTP id a640c23a62f3a-a86a51af30emr723539466b.27.1724675779333;
        Mon, 26 Aug 2024 05:36:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f43367fsm657906866b.115.2024.08.26.05.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 05:36:19 -0700 (PDT)
Date: Mon, 26 Aug 2024 15:36:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Change slot number type from int to
 u32
Message-ID: <98a8d85e-9967-40df-8327-2fc03790b18e@stanley.mountain>
References: <20240825072955.120884-1-riyandhiman14@gmail.com>
 <0289149f-3880-4e20-a22b-8540f212f1b0@stanley.mountain>
 <CAAjz0QbrrPL73qz7OjZMi4banzZ+xE+WgOFHitRKtrsytQzD+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAjz0QbrrPL73qz7OjZMi4banzZ+xE+WgOFHitRKtrsytQzD+Q@mail.gmail.com>

On Mon, Aug 26, 2024 at 05:18:57PM +0530, Riyan Dhiman wrote:
> >
> > Of course, there is a place for unsigned types in C but it's so subtle and
> > complicated to explain.  I think people wish that there was a way to make C
> > safer when there really isn't.  There is no easy answer like just declare
> > everything as u32.  It's a false hope.
> >
> 
> There is a function in the vme_user driver (vme.c:L715)
> 
> unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int
> mask,
>    unsigned int compare, unsigned int swap, loff_t offset)
> {
> struct vme_bridge *bridge = find_bridge(resource);
> struct vme_master_resource *image;
> 
> if (!bridge->master_rmw) {
> dev_warn(bridge->parent, "Writing to resource not supported\n");
> return -EINVAL;
> }
> 
> if (resource->type != VME_MASTER) {
> dev_err(bridge->parent, "Not a master resource\n");
> return -EINVAL;
> }
> 
> image = list_entry(resource->entry, struct vme_master_resource, list);
> 
> return bridge->master_rmw(image, mask, compare, swap, offset);
> }
> EXPORT_SYMBOL(vme_master_rmw);
> 
> It is declared as unsigned everywhere but returns negative error codes.
> This is an issue,
>  right? How should it be fixed? Do we need to change all the function
> declarations to int,
> or just in this function, since bridge->master_rmw returns an unsigned int?

Easy answer: Just delete vme_master_rmw() because nothing uses it.

Complicated answer: So long as the caller is saving it to int then it will work
okay.  If it saves it to any other type then it will cause problems.

regards,
dan carpenter

