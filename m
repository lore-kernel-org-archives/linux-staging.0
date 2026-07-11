Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE06822083
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783759309; cv=none; b=Nso4krXq6QJy4dRKyg0MknRnuEsri0veHGcGGhF0VTioqN/BT1yMv5FAyYEtPO69gaKXuNkW0KhlRpq5cmbf16F2TMATpvXL5GHcBuc9LKVK5D9lYzkrlKsUUH2aMcebH07IsqTMQITmcBroju9LcOkEWl4WgwEsLqbaQU01LzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783759309; c=relaxed/simple;
	bh=741NkNwMBd+zrpm/eJCRcdcbZ5O/1bxg/Lz5NDisiKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxBQ4AFHmtrLNVTQAWmiXvLfOatb+Y0zp3ROZEax4FlQnfjgye6lZNE3kBXPkNZPRAUz+LGrHoBJleh/ePcshqhACKg7ATfs0j0HU711Qyjz4piTePE8aYxG8EgRvwXR3S4NFa3l6zOg02iyDP3AlMImSlfHEQgYcZBIN56a1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFR62ml9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFR62ml9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so14928195e9.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 01:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783759306; x=1784364106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlLLztUM+0640uqDvfdh3aW/oG7BuHYgj+9xmBZ2wEI=;
        b=CFR62ml9VOlb4bV4sr2eJEgx9HuGlt157TMEz8Q5fh788RxFNdbHyrv7hLxPZoA77y
         npgnNtQuvzT6ROTAnJ/rRUP5VEI77dljhX50hg0WKGPVSQSfLeskubRq8NOMYgytCPp2
         qUMSfmbxW20VwMKg1i51ITLnE4pSQh6XwIhPWtezn8hVgGxaeAzicw2v0jJHDe1c2G2J
         CYHDlARsW5DVgG1uV0UAgnVQNy7AJTqdh+CikX8FHEYF4PqEvJJ144slhw0RWRj3HhPh
         iT+oPUCSX0nmcTGoEq7eqA5dDjmUQg9LQzxNfJ2rrRFRwqRSTu/sqY7yWmQSdXNDUMHN
         t0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783759306; x=1784364106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlLLztUM+0640uqDvfdh3aW/oG7BuHYgj+9xmBZ2wEI=;
        b=RpEtwfxci4zYXsFGoN9tYR+xff/cPbTz+DPPTZ3t1neuTBs+TkKS+YjG6ym+iwnJ56
         Ht1LI3Kze5T6Bivcbcp8jKe9GneNjlQQtiZOw1xnrbQ2zaFhWQEivRN579MPOpv768rc
         cCVZDOmNoaraSHYWYsHi/RzgrsMapU9vfOZsOfKuZUCSCjhRp/LgHJAR6uqqSNzrWCy2
         5jmah9FmOgiiG5gq6cbxnjKlmmvXlrCdKDY7gHREvfIVnhma/Hkx8rX4gPDJO0jxh7LU
         uVMJV1wDNf65O7sOfL4z1f3JIn/WIEmxuVh5zZJXIw5i//ER6ZUv+ce9GRaCvEnorw+Q
         AnWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkEja/JVUJiQas6O6OoFExU+Ox0MzsiFa58ACvHsTKZplfW9eWb7ue+UN9beHvg4BEkTK5SCqm6kLYZvDp@lists.linux.dev
X-Gm-Message-State: AOJu0YznXcI7Hf65PyKtkI9Sb8oqLsGQ75yDtPSAHpg1PpL9JqqJIbuR
	ERyGoAugCdND9bIQp0D0ZjBqvR5hp7yAMDiRZPhbEAFKyJwJXaqb4kIqH79RkaPX
X-Gm-Gg: AfdE7cn9yLcQl69f6ifF4ydP0xVQm9BhAWW+IOQP+G/clhpIeVXXqEvJZFojxZ0zwld
	+TMcIxHhKG90bI+IUbs2gHdjOn51bmwfWL6obcy7MAV+yn6FjiJlxXUnadK+T8mcC7T+ko1Ks9X
	7gh61kWHXG3nIT8tkI7s7frzrmUbUTZ7S1QSLwKYojAKQUfZ8DufHh75kE1reaQagAzpW/WALIN
	qiC9vTFxxQwIetC0FoSM+P+heir8otvFhHcBiPz/v0CT0fKz9kWafDBkpqC/EoBxcjxTiNnHtSA
	zRtMgzxCMpvRsI9juYFUNAWZmMY4xV70erndLgE02HCi9SnY0uMhoZA3wqsbH1btNtC9CeHiCzm
	3F6Ihy5FhyPjquH0+rkAFsf8KT2XqYvCgmLxMg7py3DejqhiAxpWsXIAFzJuJ//VFroqCvyvyLX
	EK+OiyuRB6Ok8Q1L+ISGg2V1OPySTZsdQddu4VDi+xQbjMXOIgDpe90b9lynbfqwbbJqlLJiyqZ
	iZ75w==
X-Received: by 2002:a05:600c:1989:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-493f87d613fmr18066205e9.3.1783759306088;
        Sat, 11 Jul 2026 01:41:46 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73ae14sm196647325e9.11.2026.07.11.01.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 01:41:45 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	fliegbert2@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: spaces preferred fix
Date: Sat, 11 Jul 2026 08:40:02 +0000
Message-ID: <20260711084002.8507-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026071037-floral-linked-fd2f@gregkh>
References: <2026071037-floral-linked-fd2f@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Jul 10, 2026 at 04:49:55PM +0200, Greg KH wrote:
> On Wed, Jul 08, 2026 at 08:28:26PM +0000, fliegbert2@gmail.com wrote:
> > From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> >
> > Adding spaces around operators to match kernel coding style.
> >
> > Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> > ---
> > - Rebased onto latest staging-testing
> >
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 194 +++++++++---------
>
> This does not apply to my tree at all, are you sure you made it against
> the right branch?

I checked my repository and found that I had rebased onto an outdated
local copy of staging-testing instead of the current
origin/staging-testing branch.

After rebasing onto the latest staging-testing tree, I noticed that this
change is already present in the tree, so this patch is no longer needed.

I will drop this patch from my queue.

Regards,
Dalvin
