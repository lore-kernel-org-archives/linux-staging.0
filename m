Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890334403A
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784375706; cv=none; b=dj2OdOlEtAaMKVPVCZJHG379Ny7x+G5bC+2kC06lf6L826HpGQrx9xgCQEXWJEKUkG7M9QyBeBthU7OLqB68Tb2T+1Z5kK4gpSwT2+YnAuPxk7UdoaqFJV8bxwrzIlrlVsjgWxaJLfPfEKub+B98Dligj7vlCPQ7ya8lut4G2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784375706; c=relaxed/simple;
	bh=uL1h+zcBYTdhfJh+Pjb1mkpqWBcpEGzZ2496SPN7xBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqQ9/KwcbDlBa+x1E1w1txBHbzOG7mMayO7f+IMKIM4YvZ8YHxPmfYAvJgtR7jDQ+iKHMmJKqLi/h0KRO5A1TMtbbXGiDxkmeknrEHJcpts5FmXIcL5wGql1yfW6TH/H21/pqagyFxdhUL/e3CwBIsl3oy+MbaRub0KD5B/hWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9rUq1jj; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9rUq1jj"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43b7e186a0cso3183963fac.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784375704; x=1784980504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L0tz/h43xnvUpRXIsTHo/6Kg9VzM1jb7Ry9KU5PShuk=;
        b=I9rUq1jjPe8G05jnG1t+WJ+d9Z33AKZZouIMFc6SpIANw8B+SQZuCPqU8Fg99FLDN6
         qcJ9aVDveuNlDxTqirnF/MfL5lWacqJ18dPH0keOJD2bAL0zTRxOP09qJeoZlZ8yY5HA
         kWawsMpHOW+Mw7m+mCSXsgmi/HFAys4C2WS9gLmy+dBFGF+mPqEidqh2Z0UTSrnk3DLv
         EQDlP/3LCj5NQCF77Ti4YprrR40e9SkMIfaVT8KGxLSEQjRclvb5WxYTc3PLQ8Jstqq2
         z9rUSTZCk5TmYkfMqG+cLSNK2FT1jpHUJMp7Q8Fzl14Vll3ki8lMBaiy3qn4c8vw7vXQ
         eRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784375704; x=1784980504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0tz/h43xnvUpRXIsTHo/6Kg9VzM1jb7Ry9KU5PShuk=;
        b=pTf+hSxOzPiQcb0dtYb5/eKlEK++gpNoe+b0uXMAbEYCS9knxEvVJWE1gqI2yHIV3U
         NrQjDkHwvpP8Rd3sIDgzAAVZLY6iHroe3Na3E8UbfULtQvjGqvwt1EuHZWbKbCin5hy/
         FgNkZVSnwUfs9trrfMe01iG4uLbXKrEJz7Slb6R8iz7YD0t9r4UPvZwKCqnFNOjykko3
         dSYIJ4U0Q55Yw+4iD9aZWu2KgUoGQYTTw50YyNOEmUZLRKxhJSRQgC9qxTTNpTcM7dwx
         BJWcChLQHFZOLc2P+OnB0HNqOOk9gncC0gc/3LtieS93uCIHDeT7m9Y2S70mU9c63Xip
         YxfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0zM5WQCiOAZg3tjV8LxuHNme5wGruuLzlX5j8aRNxa4e0qCS9ZEoHNq8VDmBy5Hgip7Ph6B1R30hc4A1O@lists.linux.dev
X-Gm-Message-State: AOJu0YzKwhgwYicH55K9w9ATZdZlo5eTUbpb5/ZyM4KZwDjgZ09/njVZ
	gZDhL/QjQtpC3QYaF+cwuMirG79ADWpeWe59P4YGQa7HFgM9DPh9udLo
X-Gm-Gg: AfdE7cn7CXuIhGkDllSdnI5DTA3u8yZh3T3MA02a2c79zGkvUqDcxwMZYPqPocxDHbM
	cszZ1gMj1M78z9FcB1XuLANPMk4BeWFI5jYiOpOIR4+1m7F5ybCU06liFf9KFcGzWPz3IHq/HFg
	eet5K9E5esmfwvvs5y7Qk2LwhsO1oStZa6ANHH1CwoWON+NPS1sNeUr1hKXJbnadA+I7LGBBKFH
	pVqgjqDGCiCFQcuoffshDRcJLk1dph8z4I/ofNEG7H0s960E3Ftxdp9nMbsnMw4I0M/8kNHhcGm
	TN4qOJbl/YhxZiwiO5mfSzMhL1QC60iGYhvEo/slMmcKX3MyHZMEnXj5+RttT4UMY/IvvPmkgWl
	UoeQCasxqEi1XWl+TCSRrcZi5xiWit5GLzoJ8i6WTtJSQQDd+o7XX1b+lnLDM92dvM1SGNw==
X-Received: by 2002:a05:6870:1b83:b0:448:558c:d83e with SMTP id 586e51a60fabf-45690620df5mr3110708fac.35.1784375703743;
        Sat, 18 Jul 2026 04:55:03 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568e6a92f5sm3425488fac.15.2026.07.18.04.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 04:55:01 -0700 (PDT)
Date: Sat, 18 Jul 2026 14:54:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix mono image source stride mismatch
 in lynxfb_ops_imageblit()
Message-ID: <altpj57xQvrY8I4w@stanley.mountain>
References: <20260718045641.468640-1-meatuni001@gmail.com>
 <alsSp5tAe8tunTeG@stanley.mountain>
 <CADqcGB=F6Qvk-3zQ=DCPewfpOAQvCta2q-WrfuSPanmoVqyGpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADqcGB=F6Qvk-3zQ=DCPewfpOAQvCta2q-WrfuSPanmoVqyGpg@mail.gmail.com>

On Sat, Jul 18, 2026 at 03:38:52PM +0500, Muhammad Bilal wrote:
> On Sat, Jul 18, 2026, Dan Carpenter wrote:
> > Looks reasonable.  Add a Fixes tag.
> >
> > You have this hardware and are finding these with testing?
> >
> > It would be better to move the source delta calculation into
> > the the sm750_hw_imageblit() since it's just width rounded up
> > (or rounded down if you want to be wrong I suppose).
> 
> Thanks for the review. Sending v2 as a separate message since it
> came out as a fuller rework rather than a small diff on v1:
> 
>  - Added Fixes: 81dee67e215b2 ("staging: sm750fb: add sm750 to
>    staging"), traced via git blame. The bug has been there,
>    unchanged, since the original 2015 staging import.
> 
>  - No, I don't have this hardware. This was found by auditing
>    sm750_hw_imageblit()'s internal stride calculation against what
>    its caller was passing in, and confirmed with a clean "-Werror"
>    build. No runtime testing on real sm750 silicon.

You really need to put this into the commit message.

regards,
dan carpenter

