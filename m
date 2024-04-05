Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424316F848
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330161; cv=none; b=S1q+wHeaPhYZ/jVAJZu+2Ozz9yOcOrtNP2ZkOf6RH7gdBvMnHLP/jYz9nSNZqqoedLp6rMVBMcp8Mpem3F6vGLce/Lx1WwPJB2w2iDiHcTaUI7sgLGMjxFclG8HFl0UDJtkeztKxMJ6OOIyEVXa1Gf5Y8x0RAkKpeF9HQ7GedBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330161; c=relaxed/simple;
	bh=7P+HGP8/T4lYIz0l2ULz3CKPSC7Jmb8DzjNdoDnLGqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tE6/soajXtVdKRs/+JD+5yh+44++znvKnZiwIH/cDfmk1ggDvSQPjI3BxtaJY4VDVFpY6ANoUQzI6iG/1AycaddmeA+Al1+ochi8E2EyhEeHp2L+uwMSQ1BueXH0RU7UcsGOKZIjXnDwMnUIHC5cWsXd9qX9mTNrDF7WIO+OjxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ubKmYUDw; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ubKmYUDw"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516cbf3fe68so2480947e87.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712330158; x=1712934958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1eUbXBoLQzVP7ZJce9Ub2mzhwMzjl4oWganMnS1Dz34=;
        b=ubKmYUDw4mSMXn73Ztjoi2kWtFr+XiqlTKWAPwrg/AUYirbbuys52SAQdETQwCJ3iW
         hj9sZqwxrmlEkNqvbgl7Bkw+3I4Z1IPeG0dvEWGxujOk8WRVVswSMZircB4DmjSyiWqR
         spha3l5Xpx4qld/4rf3hs9qEEJUOWfa0ZmN2bz69t5yAY5/NWQc16Bo+6ZJstrSlu+Cb
         n72quIJ0jcaXvP5IBbSMiKsM6iz6rQDPsmSlN+uMzrq7V9Crg9QuyW6YJHrWhvIZwURN
         a4dwlPQLUb7zlb60oV4UXQibz/zKUvV2Jp+UAu8qZP/8eb1d8tNpxF7pSCeb71WgFRW4
         UYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330158; x=1712934958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eUbXBoLQzVP7ZJce9Ub2mzhwMzjl4oWganMnS1Dz34=;
        b=Vq/jsdWWNF9C1BE7FsUhSaMfXZKjJ3oBFsGk++zCXe9m0gF16D+faAJf9dxMiRlw3k
         I44z4lZo9V2eN/sl5SprHkCjikZsB5POVZxEJ1vJ7L0QJjMYKO5ghwrHy7X6JJWbbjH4
         WidXdqv2l/r/vuOfx5K6oyCXJrq1nIhxDUGDKbhuh5SuE2fBsXa2uOF4F8IBLutrWw7L
         sG4P1hPiWTEifmWjXXKBCGhKrssdI1ouUa4Qez7ywm2AeL6A0MGhdpf1pDkRlia3Of+n
         HQVIlyjd+3rBX0X7ovKNZFm1DTbh6d8sHV+VEA593290FgZ52dqFMRAOY7yud+oNiEOB
         bOzA==
X-Gm-Message-State: AOJu0Yw8smIWi5Nr/lBWQIolaA9EN5jIieppYxijOfUkOMLhp/v/9f0R
	4a0KSKuNlVxQxRK4We4AUxR/FSkRttzKJbVD4BfbS9ym72OVDMjIILFCt0N3Xz0=
X-Google-Smtp-Source: AGHT+IFBDTZxRfGRuqujSpDCX4R1pG3Kkz30S6y2lSQqUuiB6mMayQUvXWRL5b+MrApdH9qVYzovUg==
X-Received: by 2002:a19:914f:0:b0:516:9e97:d3ee with SMTP id y15-20020a19914f000000b005169e97d3eemr1180153lfj.53.1712330158047;
        Fri, 05 Apr 2024 08:15:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906411700b00a51a676c596sm799771ejk.121.2024.04.05.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:15:57 -0700 (PDT)
Date: Fri, 5 Apr 2024 18:15:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/4] staging: nvec: make keyboard init synchronous
Message-ID: <144d1723-12d5-405e-b37b-498e261dbd90@moroto.mountain>
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-2-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405140906.77831-2-marvin24@gmx.de>

On Fri, Apr 05, 2024 at 04:09:03PM +0200, Marc Dietrich wrote:
> Improve initialization stability by waiting for command completion before
> sending the next one.
> 

Presumably you experienced an issue with this in real life.  Can you
describe what that looked like in your commit message?  Should this
commit be sent to stable?

regards,
dan carpenter

