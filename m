Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532F3C279B
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100533; cv=none; b=ZGMoM91i0KyPKX357c+VRRs8IECsTVvJcdcdW2gvZE4Sf2PFYnGLThylehBi2MhSxhqAhWXjxzYRm0c98jtJxgQh6SFB5SfMUtoAOWaKd/43avYGJYExOWpQWeM9cOUHzk52Pf1T9F1/y13jv1G6cBayskDTzID4SWAq+DZt38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100533; c=relaxed/simple;
	bh=kyLCZZV9kbfs2YsCqC/zFnPHyjufd3uJsLGVylKb0mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrdq6NmJf16Ff/l8H+k9pB54FnU67RoDFtUIOVDpHJij1bhnMRSdE6C8ppmDUA6LvokeYgnNWFqT9p6JVEklqHAvBmaJDF1YwoT3qE9jZMiAxENyQUYjoT/Lcwg5xgAq3jXjGsTfLUg86KYt5COCvXYTRuad8EK98dzi89ig+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eX51Nc8v; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eX51Nc8v"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-44cc65b0a7fso311893fac.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 00:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784100527; x=1784705327; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxQ0BxbdBsXkQRkJTN/tYd3cFPb7z2YjlCsAC7VkUCY=;
        b=eX51Nc8vKh7LDIdpfWQflSrDiYQDCdjNrhonpZHB5cZAf8BzIPPvZKRpMmm1u4e2aA
         3dWPFKmXX8ZZC80wErqiO7MBfD8GR7KvYxnpvWkdTLBw1U1FHbbdEl4zAkVu7OXiKucW
         bqOZojNrwneSNRw9HLsCZHlhRmcWks972cH2jb7BhQHTlpcYFgujyOWvV3CqRDEo50cX
         6NOzRAHYelA/cGVOuL9NHpNsybFieGx7YcwAeOqxxfOBaOWi6nJ4UhY+ZBD2CLDX5fGB
         CqWjm+UU1oaQpBz+MmY+jauF012d/Mgswh+s0wXKrDGgrOxY5UGugE8i5x8b0kwhUdWC
         jHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784100527; x=1784705327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxQ0BxbdBsXkQRkJTN/tYd3cFPb7z2YjlCsAC7VkUCY=;
        b=Gq+uSC9fAS99ppkx2ebBlKB9ETjHvQ0TZexxdJW5Us1O2Ct0EqNq6eAdeVxKd4qHwL
         6LLzLiz14OUENRgL+PMEY68cqe0V0iwQdhKJjFENP3mbbcYNOIMbDH/6EJIW92/Py3HR
         lpu0DKEbVg7iA0yab/d6xzi5bsBOG65IZdKInh+ivh2SdGQ65Kpghv+KZUGRR32qOCWM
         CiKcJCFZ+qW+d471JrLHlbFxLg59MKHK/V+Gh/JwMQkQwSBzKHMC+dYwHKAHpK5L3Iuc
         qbQKmcnsCQkf810K7U1ZjCJ/wkbYQCRf/ePeOFWwmvGOZYWSHVC/4r+4ElkUq3OcYVtm
         012Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq2HYRFxGTVwZrtHeMHVvy32ZfML5HM8MB5UvOH9Sgc7mczQjRaRvcFu+pUzZPjtH8TuwERinys9JJZ/3qi@lists.linux.dev
X-Gm-Message-State: AOJu0YwSej+RDU4WTipJdV3mT1cknRG92POlN8Rr/Jz0SfGv9oNdemZ1
	qmAYOARlRtwR6/PVyhtHH5JFf/TAyOzSS+yY7tzFRw0NxvYWgHqsFpen
X-Gm-Gg: AfdE7cmQPIimPhExeUwN4Hh3+rJHcVNiDincyjAm8KBvOErN/HQf/EdMpFj2G4qiVPs
	kYUDZlODuQTvLuBMGfTj25x0gVXyo+qsPuwfOV8LcvQAB5LWhp9SQp2bvmfyep9DvOIecyyQJ3y
	HjfPTJ8x8iOkadYAlJ7Jmbs23pUqafA/5TmCOFr9sYYvSjSVIO2sN3H1q84D8AZb9xMq/a8A1NC
	AelTyYCR2jEP+9BOyPtSCvVLkDgWazBU7yfOBwZnPliiSIdKF/zoRFKBchqTqCIX1bpP4K6c5kX
	8MirZKC8Kl3lCn6X7xEywhiDAXFNJrXxtp6Bm3mwr22gdhnPDPr8fJiJwAaJhpZSrQVGqZ3rb1E
	nVWy8j9vRsfEFy8R3BeK/DfWuQOAApl4p4CDB46BQjc39hHQ8b9O+qJ5ZqVcORHSKv+RyDu7QUW
	DGVIPg
X-Received: by 2002:a05:6820:f021:b0:6a3:1b9a:48e8 with SMTP id 006d021491bc7-6a39bee8e8bmr7442734eaf.33.1784100527217;
        Wed, 15 Jul 2026 00:28:47 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a3b0d60sm15711707eaf.0.2026.07.15.00.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:28:45 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:28:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Panagiotis Gravias <graviaspanagiotis1@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, namcao@linutronix.de,
	tomasz.unger@yahoo.pl, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging/fbtft: Minor cleanups.
Message-ID: <alc2pxlSIEv5FMWa@stanley.mountain>
References: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714190958.219437-2-graviaspanagiotis1@gmail.com>

On Tue, Jul 14, 2026 at 10:09:38PM +0300, Panagiotis Gravias wrote:
> Solved some style errors,
> parenthesis spacing, aligning arguments, replacing udelay() with
> usleep_range().
> 
> I hope this makes future checks with the style script cleaner and more
> helpfull.
> 

With old code you should search lore for why it still exists.

regards,
dan carpenter

