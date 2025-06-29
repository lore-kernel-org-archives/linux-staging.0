Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D0227EB6
	for <linux-staging@lists.linux.dev>; Sun, 29 Jun 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751207004; cv=none; b=WZeuPMU/R1xwR2l21R5SGinuzAXp4l5s7dIn3Om0uaw2DuF1Pal3gfUU8aZfK1r59BKhAKkfp0UAsXmk9t357g0X2Z3PdaXDywEza+0reQz2nypCOnXWDrQJoPi1Skdh3Gv0xktNnQm22g03Vop+26dGt0e1AmMJ7OaqaE253F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751207004; c=relaxed/simple;
	bh=nAzkLf6fByBaHr2zsZXR+WogUuCuVekqUNUPbP7vlYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCEukwPVS6XFbAFB7yXa5TtXOulDVzVUmfbvkfEacCuWe94hR8YpzyinljjRKTMNb44CUR598r0e7RDnvWJfiavASEUKQoiyl6r56X6rRwvE7V1nhMYMuSqVI9idxWD6uuKEHIlwoS7oVc2rIKBnn7Ahv+Qg61lT6ISB1Yj1y1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmxWVEAg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmxWVEAg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23508d30142so13877195ad.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Jun 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751207002; x=1751811802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4XmE3HNeFPwhvV3YapnRmO/5DkoCIHrdHE5yflvWYiA=;
        b=XmxWVEAgDAlhsr0YihVQNTkRWc/tVDVXi+45u4MnjRqtWESH0eojekFKl9quYqTPKQ
         uSfXBVs/C38e02rY4GTc+09oFZQy6tGNUjh3QhI5asMcLK/SXYvBz7E+Ec5u8uOvaX0y
         qufYUSdxBzhE0QdKUneouho2bfipTcJcW+1Gco5o9ZQS21xYfKpzTBG9t9L+uTXFjLPS
         F+CuidqhpxjdayQiHWyYSbZsClLAlI+K2baogZkCZS4X0if3iRKWh2fl86fViuQIuFTr
         d8UT/3Nw3PHHQkGFsuTI6DT2Cj7f0CwKF53ozjfKzLY3TT4j+xnevFDGik6PR3VkIchx
         KXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751207002; x=1751811802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XmE3HNeFPwhvV3YapnRmO/5DkoCIHrdHE5yflvWYiA=;
        b=Sciw56atRyg8S2Xk8aNH28vuA3BhP4bJf3a09ggmBH57yr8uYR0oUawAxeDJEdXaua
         QjO0Ql94qZ4AJdj/OngDX9r3pP/aIda9E3buGxbiSYgcGXvS+lhVGGn3Fge4FfALrsCE
         1zhRMKLcG++INu4YhyLd1vJbYItoWQgaFxa/R20/XqTRmKt3AHqx0G/SJEcdquO04RGr
         KW+erCIuMurGhgvASx/xes7jUC+PwsYbH0KjrI1nV4Q+krHzszVEvcI4Jqvyzwr6OFRi
         Pp9JfxgELIK/XdwK+CXBSYxWRBXWNnaMfm1g/mz9sKHXCb8UnTtsze4NN8x8j52FrqO5
         xOjg==
X-Forwarded-Encrypted: i=1; AJvYcCUWX3MIyRf8JDcm2jI0OhAIOqKuanYF04MeOUtvOZhpyLQbWB8r5r6/Sk9t/65UgpfKyxnh3tvfU0Da+ER5@lists.linux.dev
X-Gm-Message-State: AOJu0YwUizO9zK6vVL7r3YQlS84UrWLVzdR/xuJLqQVAxxzl7BwnDBAJ
	BdthnHjiJOisU6uxhzOCK+kvL8NrECHS/0iCri07YL8EVRFcbJ/XkHRa
X-Gm-Gg: ASbGncujCgQBkCWVzz/JOycZA5Bl/b1xR3BMuBq//lACFWtwVIuMBeU6LxsZE/n9MO4
	V6HH9srbF0Eibn7hBoKdxIOFw7NO+Jnq3ybmzE6yPkFqZFbCx7q/sGeyt7caSxQYMktWe3wNEJ/
	+iVRtR6AEts0b1HfmMD93SstVEchgJR6m7UiumcH7gSse2s/pkGeQo39x8zIrE9XMmeAWXiAM8L
	rVMPCkCHTOIw381OU/p8wwQovuk1yUwfvL0+ZyVFqoKuhZDpS2TPGK27JaR2bQM5l+pYA4ULglk
	YDgjrQyl5sEkSR77UfExjhmmMfrPNKXLd3KurNwU9m3qeCWSJXElNwQ=
X-Google-Smtp-Source: AGHT+IHXD8nXRq9dLp21pFDQyRXR7/wWUgH4S+2XEaLAGY7dzwkGVIgjA3e+5v3+0oNfgBvPx8YFhQ==
X-Received: by 2002:a17:903:1aad:b0:234:ef42:5d5b with SMTP id d9443c01a7336-23ac3deb9a5mr167279295ad.16.1751207002043;
        Sun, 29 Jun 2025 07:23:22 -0700 (PDT)
Received: from essd ([49.37.221.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bd67sm60442735ad.136.2025.06.29.07.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:23:21 -0700 (PDT)
Date: Sun, 29 Jun 2025 19:53:12 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, dan.carpenter@linaro.org, gregkh@linuxfoundation.org, 
	lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com, 
	willy@infradead.org, notro@tronnes.org, thomas.petazzoni@free-electrons.com, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <eemnoitjhvt3nkt6k66dl6p75zqvsdttalyncfg2dqs2bcbkgy@pvr5wgx3x5xz>
References: <cover.1751086324.git.abdun.nihaal@gmail.com>
 <62320323049c72b6e3fda6fa7a55e080b29491e8.1751086324.git.abdun.nihaal@gmail.com>
 <CAHp75VeSYesZuJ-NEfEAvaRepEUtdLmxGrYmthD1YkSg-bsK_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeSYesZuJ-NEfEAvaRepEUtdLmxGrYmthD1YkSg-bsK_g@mail.gmail.com>

On Sat, Jun 28, 2025 at 10:58:20PM +0300, Andy Shevchenko wrote:
> > +       struct fbtft_par *par = info->par;
> > +
> > +       if (par->txbuf.len > 0)
> 
> Do we really need this check? If txbuf.buf is kept NULL (please, check
> this), the kfree() is NULL-aware.

I assumed that the par->txbuf.buf may be uninitialized, but I checked it
now and it uses kzalloc to allocate, so it must be NULL to begin with.

I'll remove the check, and send a v3.

Regards,
Nihaal
