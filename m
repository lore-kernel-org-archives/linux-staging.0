Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60253E022F
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748626; cv=none; b=VUBH8O65jaV6fxG9x8BrLiODIYsXaiID2IoH1bq4jzole6hMY8bw2WMckB/5oOJn8+J9YVM6lwIh/JJj86kJG5T/L51rI2rNS0AfxRdR50Phku5D5T2x6eKO5MX3UteAvzIesUzCWnomA+Xtx7+e2b5cPgkMnZQFDydScTKwz/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748626; c=relaxed/simple;
	bh=q5n+u+uxfoHL/2IXe6CRPwgXm5bv9dYpUFgxk+USRVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cn7bLWwlIRPbzsxmFu0XHXhivzZLRhPZo0kLUZQUxkjA5A0CJxxN0Xm4UhgR4wSGaXZpR8KkV+jZv/fLweHe+jK5Voq0UknTAMM5Dn7IOwXHVWcWtgKxeLHFNMkAwtzBxfRMPb0u/odtzLYJZxIfoLGNCuPyo/ETwthzxoqWlZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/ka6NA0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/ka6NA0"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-823c56765fdso809324b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 08:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748623; x=1776353423; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNYHrBzy6mrW+hEbMFHqp2BJfZUH2g68XveuwCg8vCY=;
        b=Q/ka6NA079niDT2bWUPH5/F0sQFUOhuBecvhq55DhGFuIggxBQr21zqmVO/EJcRCqa
         O0ELlszNuGoY//VnJCY3N6aUz1I05o9owUQsG6ULNnhJSsAFrv25a0G3eThPGBEK5Y6t
         tkh3J1u/GS/J+8UlCvyTrfrbsV64HwIzcxYXxy3Dd+cJkqNeIYuIx+lgw6zNZ766RyLa
         GRDIJqDUJNo8y6oNE+kuEF2RhRrRjgn6l29LzoIYyivdvE4mbFacNQvFb8JedbZVmoSY
         aYFM64CVWW4hWWpET1ylPxHG6iaRoLr6lElVq5DiC0/uMPdQ3PbyjUqlTVHLXpWByMpe
         Y4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748623; x=1776353423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNYHrBzy6mrW+hEbMFHqp2BJfZUH2g68XveuwCg8vCY=;
        b=Tqf3Qb+zNxRmA8rTo0c6hz/T6of3QJuhQcIzYBh0t7P3RdRZBXBdM4l64vfRgQu65T
         FAaSRFrt5wAKN3sW/RYhMkVKQ5qSQn/AzYLRacpDB9On9CtvENdNp0sk4gK1iKgqlTfQ
         4qjQwDJLh6FaHDxiMJdJhQlC/cXrdVC5DdKAtJv4cbzn0yUUs6yYFKagRo6H1N2GLYHr
         N4Dyx9Skzgo5UYtq4P+9Mhezee9xtQce8WUxLPB0UUJOLl/xoXWvl7RLgRAE+jFw55rI
         bm8+NfMNExL8SCraWuvva+C3OyTtEq97iQz8Z3zVAD/AcHR2ldc79yJjZjb27Ongf/T0
         Uf9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPzUtv+tmgmmAP9oGG/Rz268k0au4WxaH4pofCgK/Y3uYS6RCaUS8d2u1U4edotaqxH3VP2a9Fp7ec1trx@lists.linux.dev
X-Gm-Message-State: AOJu0YwcdR3QNmDTEeksVMImXxmiPlAKrD/Z+vjMn4JesajmyNcpTRFF
	8Lq6jJ6ymjPmjyDb3/CueK3DaGpJkh/3rTHiYkw45uCkapaSBAPF3/yQ
X-Gm-Gg: AeBDieuGunny1fXZ6YmiU9dmsF1IsbuspN5voovFPhqhmYKJj/VCeCn/DFVzM9ykwcu
	CKTJp9+eAD9Htn0+TUM/dpbqYibcavBcSlxgiRdy/NaoA0hDoVVG6Qv87ULnZFdjElN+B8nfM+A
	z5hCWFFG5lfHGwNQ/zbRQiaPgRUPKSVW4zFdiAhJjB4gZBZDQB3EIYr1EFjNOA6yoe0AuLO1Vrs
	oatlYnZwHqHkjaB3yw49EI3bc1fB/ITI3djTkai4QFPY2uSrGsOncsFPzH5Wa6lQTf5a21mPag9
	PpO57UAiQOMvbCTJ0XpXb1L2Ixtrt/nElRQHESsJBeC1nwI/iUWxiD/yT/pkBR5NfnsOpTv9H5T
	NT1CkR0A/hNuusbQNihp4+WYAGo/ie8v/NGn/IhTzuTfLyM7hW4rTI23Vup0QkbV6nOVAiaPamB
	GlxWIP58Bs4umKceumAO18MXs=
X-Received: by 2002:a05:6a00:180f:b0:82c:6b23:6d10 with SMTP id d2e1a72fcca58-82d0da456f1mr26896401b3a.3.1775748622698;
        Thu, 09 Apr 2026 08:30:22 -0700 (PDT)
Received: from inspiron ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261absm28940096b3a.7.2026.04.09.08.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:30:22 -0700 (PDT)
Date: Thu, 9 Apr 2026 21:00:10 +0530
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
Message-ID: <20260409153010.loz3kreihhr44mip@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
 <20260409145045.44r4f5bleklkk4ha@inspiron>
 <2AEE6A74-3C08-45A6-BA28-55BDE5072EC5@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2AEE6A74-3C08-45A6-BA28-55BDE5072EC5@linux.dev>

On Thu, Apr 09, 2026 at 04:57:20PM +0200, Luka Gejak wrote:
> On April 9, 2026 4:50:45 PM GMT+02:00, Prithvi <activprithvi@gmail.com> wrote:
> >On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
> >> On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> >> > This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
> >> > majorly focusing on fixing checkpatch warnings of constant being on right
> >> > side of test in comparisons, deletion of empty if block ,use of
> >> > read_poll_timeout_atomic(), and other code simplifications.
> >> >
> >> > Changes since v3:
> >> > - Rebased the patches on top of staging-next
> >> > - Remove compilation output from cover letter
> >> > - Add changes in each patch version in cover letter
> >> >
> >> > v3 link: https://lore.kernel.org/linux-staging/1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27534
> >> 
> >> ...
> >> 
> >> Hi Prithvi,
> >> this seems better, but I have one question. Did patch series appear on 
> >> mailing list to you, because I cant find it and my emails sent today 
> >> don't appear either. Not to be misunderstood I don't believe this is 
> >> your fault but I would like to know if you are experiencing the same 
> >> problem.
> >> Best regards,
> >> Luka Gejak
> >
> >Hi Luka,
> >
> >I just observed I am also facing the same issue - I am not able to see the 
> >patch series on the mailing list, no idea why :( However I received the 
> >sent patches as well as your reviewed by tags on mail but I am not sure why 
> >the patch series is not visible on the mailing list.
> >
> >Shall I resend the patch series?
> >
> >Best Reagrds,
> >Prithvi
> 
> Not necessarily, that is probably caused by mailing list lagging 
> behind, so let's just wait and see(it should stop lagging in some 
> time). Patches as well as reviews should appear then. Also, did you 

Okay...thanks

> receive two emails per patch from me or one because my email client is
> saying two.

I received just one email per patch from you

> Best regards,
> Luka Gejak

Best Reagrds,
Prithvi
