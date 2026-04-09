Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008E340A51
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746261; cv=none; b=lQ+ff7/wGBBMGFs2mnl88Z0gOBFseXc8fnAy6XnQcGQUkt/kEDYF6IXgMtN2F2sFkAXn8IwOA6daTcD1eFU5PPx2dWuYQdsWwKuGouIG2WNe+OxP9Cczw3xFxGYuu9IJlxW7sEt8a5Y+xSN9prBg/nd7OliusovWKKcaK0jESQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746261; c=relaxed/simple;
	bh=U+JsuIiz4aVzMqa1gkLEaVKH1yVgXrfjSe82DThAQh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FU7g9sDLPELubHsv1ce0S+JKnqHbRcmENSpfPykf68E5VVM+iTv1pHLMh9sOXBUv//DM6d+T7L3P1EuuoEcOgECUfcbtNDCqtBcuLn2Fq6l9EZOAA7FCmDLGECpt1rjsZPlJDUb42huY1ftUUUeeQ6kkj+j1/6qp5enRx5nbj/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsX6XfaX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsX6XfaX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cf96ca071so515858b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 07:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775746258; x=1776351058; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y54Oy57C3TXGFr3MeHG6GB7G+DPz4eaomITtMIsmbk0=;
        b=DsX6XfaXRESPAMoU6JhcOVK4wz9WsYjEK0wX/fZT/R2ndQHLnnAAJCndpB4yuIrXr4
         QdUSaNW8YLuGXKq8zM9w9exIorgWRSVi0x7foR1lrCZVy0zEKrXPo3qyFc9WrF75cG8k
         lRJMeIz8iSseEUZrdnqLRu6fRyPpYBu7nz8bWKcX9XQZGUmYBj5CYc1y1Iw2LMOfS9SL
         Gl/RqZCdsA5kWd729HWYJ09bwCkeu5uVpHFGjJNrnW2+B1qB0jsAor7I/rqmAqezcquK
         F3007ih3vMzbWBU/RErwCtCfq9DpRllPqGF34YTwEsesH4QjRuiJ0ORfflw7/3+5iKb5
         dKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746258; x=1776351058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y54Oy57C3TXGFr3MeHG6GB7G+DPz4eaomITtMIsmbk0=;
        b=fudwZ0OLV+jGBvytokLaUou8+kFMzGM3RGvs0zY3Of60cuLbN05MA75S6/2HTb1D6E
         PYm1/Bn+KRbo3ITMPHCUVB79A6BEPBsoJ0i4nKiVbGM3oRDOQmQxBK/wCZMBXrpNTk7t
         vgWcn4kBxlq4aGlW4dsD0jZteiE6vEcllbhmJrgg9iHRKMg+y+iOnoAh6WihKe3EyFbt
         xcQ8cgF1GRYUVPcCdTWKpq71IEXFMXQAlBI68w4a7Uz3gCPtJd8a8dYDPtL9hOg7l6B1
         lCrmBeI9Q3L0JJTlqhOrbvX9k/FJiCyvMAeCDKbKLkNg9f9kdVcwFl54rCt3oJkImHUu
         8YtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV7MXkwcjgphkGL+U9ZbnvPWmD/s1PUqP9ZsEY/x5697aWHH2mrcN1Z8Wqq+FSGf64NU+PkpGRGUHs2HoN@lists.linux.dev
X-Gm-Message-State: AOJu0YxGHFNOFVdW7v9wQFdpznJWOc/FJfzEHNgFKuSRbeCWZFbKzRk2
	8JyAUHcjBReGByxJUQN07KJJRppzUrm7A7smkXOvbWCusGuu+i5FkQ7s
X-Gm-Gg: AeBDietnZasa/2Bhy27nWnCeO8r5U/ZFEnxBfhpM8ftUg70SgGXNsRDDxKrnzHvXG73
	Ui+qmSB2va55HTtOqJN65d1e1GyYTKeHUpT5pvxeK7JkXiDgSIIM1E4pBa/1XtBz1cxWxkC3+y2
	XqbXAdN+0ElSbkrKgKR8ZZrB6MO90knAbcBIu/Ey0RAPm4iiLYAENNJCTPmzftPKHqjBljUN1Zu
	JLQpMAImQnV+lfraygQo75PXwlh4hsXqeGzF6+3HwV35uvGmeFUPeP/o7nnthm17xbI7kGrrPUU
	Y7VQEMMD2blMzoAlRjT67nX9+qciSCaTslD1UEyz0E/n0d55TGrEZ5oW6ClgKLJox293s7RO667
	u0wxAHekxGA939ByF+r12lHHM7fy2LVOZ/eddcAMNQWwRoYYILumsS2ZFP+9Uvag2vl2+Hci6cy
	ouyEVhdzpGVlIgNTkS7/aZcNY=
X-Received: by 2002:aa7:9e47:0:b0:82f:24e:6a50 with SMTP id d2e1a72fcca58-82f024ee605mr1385982b3a.10.1775746258214;
        Thu, 09 Apr 2026 07:50:58 -0700 (PDT)
Received: from inspiron ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b27064sm31330063b3a.9.2026.04.09.07.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:50:57 -0700 (PDT)
Date: Thu, 9 Apr 2026 20:20:45 +0530
From: Prithvi <activprithvi@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com, tmimiharoen@gmail.com,
	filippo.muschera@gmail.com, ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com, rayfraytech@gmail.com,
	david@cardinalsystem.net, weibu@redadmin.org,
	dharanitharan725@gmail.com, ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org, karanja99erick@gmail.com,
	khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, bryant.boatright@proton.me,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260409145045.44r4f5bleklkk4ha@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>

On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
> On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> > This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
> > majorly focusing on fixing checkpatch warnings of constant being on right
> > side of test in comparisons, deletion of empty if block ,use of
> > read_poll_timeout_atomic(), and other code simplifications.
> >
> > Changes since v3:
> > - Rebased the patches on top of staging-next
> > - Remove compilation output from cover letter
> > - Add changes in each patch version in cover letter
> >
> > v3 link: https://lore.kernel.org/linux-staging/1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27534
> 
> ...
> 
> Hi Prithvi,
> this seems better, but I have one question. Did patch series appear on 
> mailing list to you, because I cant find it and my emails sent today 
> don't appear either. Not to be misunderstood I don't believe this is 
> your fault but I would like to know if you are experiencing the same 
> problem.
> Best regards,
> Luka Gejak

Hi Luka,

I just observed I am also facing the same issue - I am not able to see the 
patch series on the mailing list, no idea why :( However I received the 
sent patches as well as your reviewed by tags on mail but I am not sure why 
the patch series is not visible on the mailing list.

Shall I resend the patch series?

Best Reagrds,
Prithvi
