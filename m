Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D48F49
	for <linux-staging@lists.linux.dev>; Sat, 18 May 2024 22:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716069760; cv=none; b=qxbwfqcHv6cfYpndZw0fWJ+O6btjmAvYjG47D/1MBRcnSuuuXQABuegG3t0kC4/CQHrJmySWFGdGryM32p2+h5ogLZhhj0TgCI1RKvzcO946DsfidrgeZaCVLtc03KKKaaOwkEBd0UjrU9jIH2t9w8BsfOopmkzDpGfqR6w8f5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716069760; c=relaxed/simple;
	bh=kedmeD4aX62R44RLOmYiPNNusWIBA/LEAOhBmBHsFjM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kB7VATpzoFIsGyZQ3xqIXFzSU2tA7H4Rm4xOc+RnZuIUflcL+6A4XXxIJo1x2uaNHE+7/BDaE5rqP75HM2nW6aQ6BKSHJJvzUcMHeQkqyQ5wNWAcBUoIw/IKl6OkGcMArcJ4Le5E+jjh417k1+948a1nXuvGnK3h5Gjut2TH9us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=cCJlPXbt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="cCJlPXbt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f0537e39b3so41477465ad.3
        for <linux-staging@lists.linux.dev>; Sat, 18 May 2024 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716069758; x=1716674558; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Dt6GgNMEhbMDY/9MX5M405N11rz/0+cbz8H78AH/cw=;
        b=cCJlPXbtYr05/olhDnKQCVWqu/adDTuIlcrW2S5eVW8gR3qdSb/+RbMfWi2BTT67UC
         LDM3Q/ritZzm4Ms+6SaOKe2HpzhpL9KIEi4ijwtjRIyoikqL6DfUJ0gGPPmXyJyp3SpZ
         l3VWu9hJCpcJrHy3C0pzYDF8oHRy7pfNE84DQVhu7MeYjg91ANnoKZGYnCfw+z50OxPI
         Isu91ArN0GuBZB3GXlYBXG0yLm6CgEfN7Rce3rhEVGeDL0pBs1hQIpLuBcTqqBkfPvgh
         bUpisfyOAFZSdPNwh9rzNuerLljo4H+euPQ36fel0yZdYjhM+QIsHbxxIIX+Fpipi2Gf
         nTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716069758; x=1716674558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Dt6GgNMEhbMDY/9MX5M405N11rz/0+cbz8H78AH/cw=;
        b=c92FzsbkyRSigdsLCU7+0jWWMHLgl3zhRhk4X26AjWXFQJnag9Qb4buHh1wWDsSu85
         uyxXsL4YdY5FEMF4/BjZ/QSV7Am7jsLjpNdGHZo6YWeUYCV8SOE/WN4hxWpEhhvdVI00
         iA+3uYXpjObeEWp9z8dqqxn0tTVf6/BjGk/5EVY7UVU2UW7lhBwmAMxZJ8qp1rHZl9xQ
         SlzjOLi65PioIMDhyBE6O/VqHR54rPGbLEbDGcYQQ1HOVuIznW3Lu6glFqopFioJ5Bev
         xukldIc/jwHUx/hBirNvfv1MGzxxrjseYL7FWZs9qjHNgEEvKV3X+4oePUTb47K1gu9j
         1/iA==
X-Forwarded-Encrypted: i=1; AJvYcCVuytJdhCJGCbF9IiiGWpYRxkWe0mnBjj2QIzANJj5KbeQ+XOea+NpbMV0COPdoCrAsgB+l9DAnFR4rKYpoq3A3/VE8NWmR4+gHhWhTIA==
X-Gm-Message-State: AOJu0Yxf6uxGSc2VswQDaaue6X67/bM2nvdR4lbfrFaWf0GM3qjWoGPj
	nOBdiIyx6Av0Ws5EFGCTes8GxJQLJoDAYMF5ZgaEk4knq56nGp53lrUHlmv7jXI=
X-Google-Smtp-Source: AGHT+IEhdDfAdlW5zWrQVXUMQoQD3CaQAI159xoqyK3WPc5KCs5rHttXSJJg3iNZAXw+s5U/dsRbEA==
X-Received: by 2002:a05:6a00:9285:b0:6e6:98bf:7b62 with SMTP id d2e1a72fcca58-6f4e02ac4cdmr30838143b3a.8.1716069757595;
        Sat, 18 May 2024 15:02:37 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f6805cbe76sm5283629b3a.43.2024.05.18.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 15:02:36 -0700 (PDT)
From: "<Tree Davies" <tdavies@darkphysics.net>
X-Google-Original-From: "<Tree Davies" <tdavies@gmail.com>
Date: Sat, 18 May 2024 15:02:34 -0700
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/31] Staging: rtl8192e: Rename variable ChkLength
Message-ID: <Zkklei8JM4zz37xP@lunchbox.darkphysics>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
 <20240515045228.35928-20-tdavies@darkphysics.net>
 <2624273f-3589-435f-8bc0-8ae6514916b4@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2624273f-3589-435f-8bc0-8ae6514916b4@suswa.mountain>

On Wed, May 15, 2024 at 12:31:20PM +0200, Dan Carpenter wrote:
> On Tue, May 14, 2024 at 09:52:16PM -0700, Tree Davies wrote:
> > Rename variable ChkLength to chk_length
> > to fix checkpatch warning Avoid CamelCase.
> > 
> 
> Just use llc_directly and delete ChkLength variable.
> 
> regards,
> dan carpenter
> 

Thanks Dan, I will send a v2.
~Tree
 
