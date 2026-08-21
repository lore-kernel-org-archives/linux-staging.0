Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72163C09E9
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313203; cv=none; b=t44pA7QqCO0WBG1F4AfHl7gV8F5rd/H7lZsx+pCN/S45F4BpGTFSXeGsmdKh4SddnYt7fNDw35Ym2PDV+m45xvZi/InVXYYkEbSL/XjMzj06y1uVYi0yYw2RTuLZtq3Q5/7Aq1PiW5XV3XwZuNFqNX0NG2wdSEJJaXzowhuW1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313203; c=relaxed/simple;
	bh=twJtsqkg53bpD4bVrRNiLIZX920vdyn30TopGVNGaE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wc+Ge18ZghvZZQgQ+R9UoynVbzbLEBPom0EuISVaeS5w6FxO9VK/vEzYLlrKDAJ0sX2CYEpF3hRZJcchVM0wvBenGPpzsWAxBCveDUQSNBGCPVK4z1bLWYbkjTZUwnuzZKP71OIsO16yxIjuy1iHuIc9NGIGkpwZB4swbhw9SDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URSmG8aR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URSmG8aR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495437bb891so4577455e9.1
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787313198; x=1787917998; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEGJVYFUVUAeETEsjFVbgJcz6cD970D0BMiWavG2Bfs=;
        b=URSmG8aRukYHOq/ZY2xgOJhE7qhhXJe8PAIizWbxK7vgl4pZLz5cjxh4ZjSQiGrloP
         8dKtSJO1RZLh+NwB7wsAclBTl/YfYthTn0wzwr4O+etpOkoarz/xqApEtgY+xvQdQVnd
         vmrpx1lhSPSMVXNphy6e9/tF5fr+DKvsI9n8Kqcf3QtySnBTud5z0AAhqR+WS6q37wc2
         mLGG0eZVIL9eN67fnbenr3T+XV5LK3T3wmJMPQp+PY0u0mWf/rRADbPFLq9773tlH3Xg
         r/Ee9VyR8afV3MbZ+sSjcyqeLVKpWL4DExOksZVRgYF7eT9Qj6QEGXTLYrR/L/pVyXjn
         UpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787313198; x=1787917998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEGJVYFUVUAeETEsjFVbgJcz6cD970D0BMiWavG2Bfs=;
        b=CB5DD+3Fus4EDP+D3qhBpdOncjstAxb34+J1ismJ0fJ6RoaPIzQKyO95dKpYzFw6m2
         aQd2vcGGgtbf1HK0JZS8BgdUdf2ofhsmqh4J7lWZA8sEmbewWsbm5fHldxW55Z/Fz7UJ
         RUdNHPMIvef2WX/0CfiwuUgEHiK2aM1aNK05ZBDVjhEHB61yWFR5BPeaO8SDPs3lufkM
         6rcKCzPUKH03cGj1wFmjR6OrFIQhCnPlu/XLPn5l1oqjOsG809zOXmVO4Nurld8YJaTj
         ak30WFYkoRbT8RsJOyEz5lkTb6XCdU3G3EsvUMwBaZ40iHWscmeCypfsbsW16YDVH2RC
         tBxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr07w/qib2EYSEwk9bBGo2iNStbAQcp0eUUUMv9Iwxul4SPt1icRHC4XcI8H75nHBX1FOT/Rs7XVW9nrweM@lists.linux.dev
X-Gm-Message-State: AOJu0YxmkQV+v+/RBrULox0w9osWmbEJLTs+x1aj6L2NF3k4qjvzRUhl
	fuxzuUZACVfvxCfG29BFqgG5Dt3dQJ9ActK4TOw07XYaHFyoIVxRAFxT
X-Gm-Gg: AR+sD10Hb8+MfaNEISQu6skHA4rjR4ZfTdS5Mhkjk4jRI5EOaAi/R0SXBK6tJYTAS4T
	In8LXiBLTFa+QfN6/6BtV8yuhJCe2cLM7jtEx1gBkWwokdN6VY8jDE6igkKSlZopTh4pYgUVK33
	wSZRx0DtLmL5+02i1agPeAmq5SnHgK7k5c9e6Y/kxKr/2FLwFUk1rrCXtBegrk7p4ffsxsoWKDj
	7j0k0lpO991rHR6odZbRDL7G0tSPKYBzeWs66Fv+R89hPfJe+iF/tcYklCMc5lMCd/XQbmayRu1
	tVze/kiN+ST7Wsfapba5meA1POMLVsATkZAjTXpNVumnUa07pvEn9HoKaqtHi6rOrLrofKmKC5k
	OHGSs/KTQ5Z6IcDlXmLfRAEiZlB3gss99+9tfCsRSO0r9AtjmAoPjLpBC93It05Z4xdqlb4DHjp
	xBLE3nlBwOh5ngvtj1WiJvlAnWYg37HE0/G3/Xkz1EPTuFCXbndCQyyccE
X-Received: by 2002:a05:600c:1912:b0:499:8d9b:832c with SMTP id 5b1f17b1804b1-499b9182141mr49688785e9.4.1787313197554;
        Fri, 21 Aug 2026 04:53:17 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9b81602sm16565645e9.3.2026.08.21.04.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:53:16 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:53:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: bootrom: fix potential NULL dereference
Message-ID: <aog8KROHA18VIZtm@stanley.mountain>
References: <20260821113540.1989561-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821113540.1989561-1-hanzhijian1991@gmail.com>

You're using the word "potential" but the commit message correctly
explains why a NULL dereference is impossible.  Don't say potentially
for things which are impossible.

On Fri, Aug 21, 2026 at 07:35:40PM +0800, hanzhijian wrote:
> In gb_bootrom_get_firmware(), the queue_work label dereferences fw->size
> on a path where fw may have been set to NULL via the "if (!fw) goto
> unlock" path.  This is currently masked at runtime by the !ret
> short-circuit (ret is non-zero on every path where fw can be NULL), but
> it relies on an implicit invariant that is fragile and hard to follow.

A lot of people would argue that the original code is easy to follow.  In
your code, to see what is passed on error you have to scroll all the way
to the top of the function to see the "next_request =
NEXT_REQ_GET_FIRMWARE;" assignment.  In the existing code, it's clear,
this is what we pass on error, this is what we pass on success.

It's not really fragile either.  If we screwed up and forgot to set the
error code or something then Smatch would warn about that.

drivers/staging/greybus/bootrom.c:300 gb_bootrom_get_firmware() error: we previously assumed 'fw' could be null (see line 266)

Or on the earlier paths, we would get an uninitialized variable
warning.

regards,
dan carpenter

