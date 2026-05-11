Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA45388E7C
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504133; cv=none; b=VTqm9ouG+RHTljJ0tdnMNGf1wz9SFTRI+R0achSEEllBdfQe0Ncsf7a7uBa3SBcav2ZVvKZ1So6HcqdC7ue8xdVrGCwQVa6c04mmC0yJNr6QFl6bBRqFCTqeY9sZHsWFjZ3mzcZOiCK/22YzMVeubb3R+RNRjlsLVOqUkBxQQCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504133; c=relaxed/simple;
	bh=+U98w72ZCri64mso5WVBjyRYMUFczhjaoQGfNleZhz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pb+/VvmDc9McBrM4ogyYxfalwPipTvuMw+Am00zw5hVDglNE2QE45iU+YyC9hiQZP+81AfkmHpL5NV/Qp8fpp96jXEpIfCrjlad/zhItdEsWEKcKfD0/hpqzPT72RRvXEN0n56XE+fShAnWUe6IaKQ4AEDfO2cvPToea+ZGS8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFQxJCdQ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFQxJCdQ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so38235521fa.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778504130; x=1779108930; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1bOG3hf5gk3P2hHlfxVaUWnQMt3Q5Lh2bd1865iZQo=;
        b=IFQxJCdQFPQmtYgv/As7hj9pl8077ZTkRaRo7/mzABOEEAm8PhBntFWw8ZpXg5fQxk
         BX3MWo4PrePvP4jATjHN/aybs7NzMUv6+lDNUPtKQrNtbD5Miljwa0DyfRD572Qd2lUh
         ybJepGMQ3jPdKFQtdPUGNhj1DLnYMUKmGSz1qY5dYuhBtFMTX3xKTQ9+cP8JUOZLJRuG
         UaTCrfPcX85khmxQqRVa5pmZncQWFCaRQsJJHPt+UZ2sVv0kzE6hNm78xCqIBcGzyTDV
         kBSAQ7yj9qp53ujfd1OgbbhwTEYrlNISR1VOUqyBtU8anaEduBZ8OYq9h4nSD+adsWGI
         6R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504130; x=1779108930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1bOG3hf5gk3P2hHlfxVaUWnQMt3Q5Lh2bd1865iZQo=;
        b=kcic4h5H2aXhIRkM/gQDcBSd+Nj/MDcLqpAVDPexMkhDBoNogkZMxmPlDBrYqPIjBI
         YkDpiXOysvPHkIM4CmfSbnm07Ma1Zu1jRzbXFCdT5FE4ZxqI7h7NBLuCrMGXU6DdP45r
         8x4/j1H7RTtALZVVkaYDgLXnLkpFCt/p3NZA3nRP1MkMXT9COp5MdaEhh5IPVeXEOy1/
         TALcybnTV43T9NGFe+ZaxH0M9g321tmS8ElbA0CgL2OTy8TA1OqKyKfs0hOdTSXfqr/H
         eJOZP6fKhMbpPPIdi9QjfFjvCQf8YuqGU76nJO+bSdK98b15kzsGWaZpA6rKkEc7RV1M
         DaRw==
X-Forwarded-Encrypted: i=1; AFNElJ9EWFEveaN+1EUaroY/dpGfQt6fDZ9wsH0hz8GVwwzdqF7VehppvGrZ1GQ8WPN+MGwlhooz88rlw/DaiB5B@lists.linux.dev
X-Gm-Message-State: AOJu0YyJlsVFL8U0vvE5YvlSrJsNzmR6DH2wKJ9vShjRK0nF0Hrv6BA+
	d68TkVxLM60pFJ5K2PV4y02EknzUeAqrkbHcgNrN4ptNRVkePPyXcekr
X-Gm-Gg: Acq92OF4ca8dGb4IZSWjFhBEFdPeNAIAdSMUAcLOQ4nUU/SsiOUqxUlnbkHDd8FjXc1
	h99FE25JpLAMzz3DaKz1ukJqgzXbn8RUyqGWdblM/vni5fqL2LIaOobZo2bBQtmUDOQWmG0zB3C
	XMlKviyf8WTzwgG4kruJCxtPR3oPb7u6lBl99c0ugDnPpmACVC2iiw1rmOhtRzanWopeuJwTGbH
	UCm+XNiToHK7N1CJdK3eAp51PRfwPE5Ho0+Ez/L2y4h/1TId3z1krT3V3B4lXwLaqraVzuA9Ins
	vGpRXp9H98QX6Jpq51hViwas+dCe+e2fxft2XpjabjRkh28IlSy+HSWHSbrVeajIUNJTbcpRAZl
	kW/E5nu2pYbRB2KoAZeBJ8pF6q4873QLYDjnv//rM43pTVjPsbOEjb/fjpj2AyQV+Ln2xGNCsjo
	ZYFE8Y3esDQGFao0KsxNsBuUlr
X-Received: by 2002:a2e:be2c:0:b0:38e:8102:cbdd with SMTP id 38308e7fff4ca-393c40a4dbfmr87109361fa.3.1778504129888;
        Mon, 11 May 2026 05:55:29 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f628ef7fsm26179731fa.40.2026.05.11.05.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:55:29 -0700 (PDT)
Date: Mon, 11 May 2026 15:55:26 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: PRAMOD MAURYA <pramod.nexgen@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>
Subject: Re: [PATCH] staging: rtl8723bs: Fix coding style in ieee80211.h
Message-ID: <agHRvlftXepSzPDJ@archlinux>
References: <20260510110228.96612-1-pramod.nexgen@gmail.com>
 <agC1-rqon7nRUdvM@archlinux>
 <CAKR_b74W78QpNKvF_bU1EfT0WhXq4GxQDJiQ05Z454eABRsYWA@mail.gmail.com>
 <agDInsLI8UV7LdhV@archlinux>
 <agGYe8_ggP5aQHha@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agGYe8_ggP5aQHha@stanley.mountain>

On Mon, May 11, 2026 at 11:51:07AM +0300, Dan Carpenter wrote:
> On Sun, May 10, 2026 at 09:04:14PM +0300, Nikolay Kulikov wrote:
> > On Sun, May 10, 2026 at 10:48:22PM +0530, PRAMOD MAURYA wrote:
> > > Hi Nikolay,
> > > 
> > > Thanks for the review.
> > > 
> > > Understood. I’ll split the changes into separate logical patches and keep
> > > future submissions more focused.
> > > 
> > > The Cc list was generated using get_maintainer.pl. I’ll review it more
> > > carefully before sending the next revision.
> > 
> > Run this script with the '--nogit-fallback' flag, it will not output the
> > developers who modified this file, only the maintainer and mailing
> > lists.
> 
> The CC list was fine.  If you send Yuvraj and Bryant can figure out how to
> handle emails.  If we really decide that everyone should use
> --nogit-fallback then that should be made the default.

Understood. I suggested this flag because it helps me avoid sendig
patches to people who haven't explicity requested them. But you're
right, the decision is up to the sender.


Thanks,
Nikolay
