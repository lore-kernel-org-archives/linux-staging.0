Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172EB3A1A2F
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504394; cv=none; b=HkD1nwEsaqR33kwUrrOd+d2cGE2184i8keTGHmo6eikE0v1gEY9akox8TMQ33sQW8zudTqR4aU1WU5P/aLw+YzFMbsaASFMT0N6Z47cpMWxCLOb7yxAIJX0QUtSKSHCiv0TDqBx9ZknfhRUD7jKPFqEmWRzhU3PGzVKDikT6XXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504394; c=relaxed/simple;
	bh=VKfH3YxWp4xko6Ek50yD1tYVkvq7tHbg9rFb3KbmKsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnL6mXPte1MOBvdWFBdWgHb4bFcIC97z+4PDetHSkAWmxoN/hqBBAjL76/wjn2x9MrmyR+/ZKwbHMVoUoUOpwY1IygPHipFaIGZ73NG3MUtwbmrFoSpOC/Paj5kCrPeJRlGHvuxid1MIm3by0RNX9s0IQWZkV+7wbPhShjlomVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNbHDHi1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNbHDHi1"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso3862678e87.3
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778504391; x=1779109191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2QMO+Gz8PfVKu/eolXLN2n0KsiOaj48rOzsVlwL9wPc=;
        b=mNbHDHi1HMQEYUeUm0vwostIluKticLXXxYk2VOiuTjnJ0+VZRUdtAzAybDqhOXkN+
         fJZpOA+sklYa2j2i8I6f1uqHzjpYL/EXE8AYXRPgKRnT4XNB+pIDmnSlPntLrbb7l7v0
         Vjd0AGx423fGPo0xeUiKP272wum65fwcqC2U7ESgkbnWuO4260zWTFOkm8yg209+1fKB
         lKBSDw3VEQjlvBwzVDOvReY3U0kjVVNio+GPdh+ieiikG3lZ3E13MJ/JZsASSoRpuo9d
         u4HdJ2lBZR1YqYblS/OZ8Thl/7aeAGM+JaaIB4d4adsNyqjJ0l0K8IMe9jKErBtyB3tx
         DmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504391; x=1779109191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QMO+Gz8PfVKu/eolXLN2n0KsiOaj48rOzsVlwL9wPc=;
        b=mahkFnSgupPLPuKPYh+1VsXsnny7SjdWOFwGDZKTsK8GMd8hSLolcPReZ3TRxbLzgp
         Di9iMf/XcCHJw+skz32ruDlBEbEX0lfoNwxbL5qRZ+gt4upmqrvS1hAsQQyQQEx/hDB+
         eXVeVe5R9dvOdyUx1uMW20SHUNCBRHhN+gDNI6Jiwhznner05UPOxO45udXT5arYVGPK
         NHmUMhCeKIop4Y+BVoBigcWuwFvwdyJyKVZBjK4MgO+Sw8knuG6mFF551HxL82ZoHZcB
         lMv6rLRdfNOXvSlqbahBHYaz9ajgUo3AxIDDgecJ0W+tL538lXhYTybDUjIa/e7oHuYY
         7tOg==
X-Forwarded-Encrypted: i=1; AFNElJ+PjL4++e1wOzVd9ME5ftGLDHeNG8tKpI6Y/PBM4EEjdhyB+Aupg3aXMFFXiAlkiwSYmvrrJOlWa73ivI1U@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgif/mNPHeBmIlVNtzOYQ34heekKtgWoUY1+s11rN8gLaZ+R/U
	5dKOXHL/1HDNywAMLxmvNk+3WT9Z2Lq2DCIASG4c78/qz2FIvoVyr5y0a3nJ9Hqs
X-Gm-Gg: Acq92OHHkF31OBl19SgeEvogOHU/19QxIUYPNACSfHDp6k9x+VgBu0wwThiqBvE1t9p
	FJ4L1gpqVHsZzvXGV5bC/SenJNaxkDZnUDu+9LIxoNQJmhgQR4IO1CrQekrnojEtXXeWsyoKjtO
	whpwRTfaM1qbN3TKc+4dTH6svb2JdQA+D0qluD7cLfyZB/6fkElJLy0GqeBvAml8xEN3quZ1zGV
	jLL3RMBzt9EP4QNngKcTxHDmSB8j9G6h23b5J+HdMbwMHVXeYdmFUoEdMmTaLJUEYNOjTomNxsH
	N+nBHSlQJk7tULFs81MRkBkDyXsIZo/GzmuhAIMvJP6BDoHXPb0t1fKK3lJSAxzYmK0WiYksD7p
	IR8pS0/qB06+S824pPE3mBnRMv6n+mnZ7p3dtyut/qVWbduY5p5/rNnRE3T/X+bh1JYnM0EKubq
	PtU6KTeiFQNTOY1hkOeGEnaZPR
X-Received: by 2002:a05:6512:1387:b0:5a8:735f:aeba with SMTP id 2adb3069b0e04-5a8a94bc4bemr5253826e87.23.1778504389468;
        Mon, 11 May 2026 05:59:49 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8b6b20ecesm1835213e87.29.2026.05.11.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:59:49 -0700 (PDT)
Date: Mon, 11 May 2026 15:59:46 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Andrei Khomenkov <khomenkov@mailbox.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 8/9] staging: rtl8723bs: remove commented out code in
 rtw_mlme_ext.c
Message-ID: <agHSwq6KyRF3Dd5Z@archlinux>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
 <20260510134315.64295-9-khomenkov@mailbox.org>
 <agFV6Bpe_HyxC4qG@archlinux>
 <agGbearJiYajq7rv@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agGbearJiYajq7rv@stanley.mountain>

On Mon, May 11, 2026 at 12:03:53PM +0300, Dan Carpenter wrote:
> On Mon, May 11, 2026 at 07:07:04AM +0300, Nikolay Kulikov wrote:
> > On Sun, May 10, 2026 at 04:43:14PM +0300, Andrei Khomenkov wrote:
> > > Remove commented out code in the site_survey function as it is not used.
> > 				   ^^^^^^^^^^^
> > It is better to indicate function names with brackets: site_survey().
> > 
> 
> I feel like we can go mad with these sorts of review comments.  I spent
> five minute reviewing all these patches and now I have to review them
> all again because of this really minor thing?
> 
> My trick for minor review comments, is that I try to find a real bug
> and I tie the minor thing to a major comment.  "Sorry, you forgot to
> add clean up on error and also you forgot a comma in your commit
> message".
> 
> There a lot of minor stuff that I end up ignoring...

This is a really good trick, I will take note.


Thanks,
Nikolay
