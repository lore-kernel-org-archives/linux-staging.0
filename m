Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040D522F3AB
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733815738; cv=none; b=qs6TTdsWSNTmL6gJxOHNgTg9J1/iif8i2nz83RLgya4IV/dzh94gmd25mdD/TePaLruy6VsrdVyvp4vtscLo+PPtAggCe7DockB7J3sm3c4x6HK+KRlOnwPoI5BBAZdD2VQwuzz731zNRgAMB9175q4//6uI4K56ao6TQ0xQ/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733815738; c=relaxed/simple;
	bh=jcBjzE6y4SuGYTvQrZw6rDbaF2EAFAUFjnWErKsWp2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLNZnJQLFVvF77uCzrlzrsfP60CGyMZQ+oH9+XpuJHkL7/bQReiTsRM/SBFOS5YqpPmGNpW5Hljf+XJF6w2sk4ai8xMRY9KvzjDEA1Y8U0UdjD7mnnzx8lNJbOA+FSurPs7rAlBRoMUWMa777v35ikJv6NscNbatvZZrb5xBwHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LQN61fxs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQN61fxs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso50254075e9.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 23:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733815734; x=1734420534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4JB1lq6UZAc6HCGowqpxl9Kk5HX97ITZ41Bl06+0/o=;
        b=LQN61fxsjjCmrUInCTa/YjTA218MTWjAZ9OM29/pgvxvMf8cte38JfvQMiMggZku0K
         ceBZsVYJpQ2HF5KBxPKzK2YyOPb46DxUsjsWRLfQ6BUTtsotXxRIPFx+OLF6Gcyyn0iH
         gcpePUjfv/rOFlI6cSaApy2NsJ3ySB9Jp1VzDYNmQq3Au4Yt1a7df7a9x5vvQZoo4SBl
         u6T07/P9PSvSDHBIWq6MiQ1ptgHduSmOocZiTAHy2CwcNIW1evvRpBYtxqRC7GmmHkEN
         hj/D/YeyrTT/so/fBFCoU0x+pQeZH+YxzSFQYH+CD8beLQhi6mpyinByd6wrNx4yMiGX
         A3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733815734; x=1734420534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4JB1lq6UZAc6HCGowqpxl9Kk5HX97ITZ41Bl06+0/o=;
        b=sB+OyvCkKN84NkSg01MOuLj7GoPaAlU3PeuqdMnnuUwKqNpcgbc8lBgzRIo+dlYkVU
         0d0ep3TR4tmpObb2GfFQW4bKfmqQnfmm93wLFDz/Ue8bKrRjvuYv8WmuNHZcr0uvtxck
         wm/NVUPQ7YnCxztRulAaPsNtWAM50WVX2d3d38+asDX19SkkpnZ2/kvoEpgg4q+h0E/h
         MwrnK2xZREXsCwNXMkG9bIjL2dsVTv3uAyCoPrBPV6YVt6TQ9Kfz9/snhJg/os2oeXcG
         qvi1zH7UWrgrIHLd+jVECqOsWsr/QIsH4mkSyafBt8anF8O0yEB4xLXzuXlSBWz+iP5M
         tDhw==
X-Forwarded-Encrypted: i=1; AJvYcCUdho+ajfojWKB4OY+761TrEJN1RdIfiSmJ1W6j4CXRzJVsBHSHB6G9HsIyaF5rfUsgiAys3eYnv/dce3Kj@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmy4TK2saV849NwzUGL7ssHwQg1ob0IkH7msSgzfahgs1QOmv3
	eRcHfCr5UhYFZkN0k6+dMLP4Xg5vwZDah1xgeY6PD5SmGk7eoNptOgz0j3i1yIc=
X-Gm-Gg: ASbGncv2Ogy2oV1XHi3awVU/sSaxXTdrMs6nDuPoRz8SLCeleES6WbesxYbeBfTVz3j
	cj39XbKDVzeDgPov0lH488laKw7nJ6hUFbW5h6hD/eNqihkBlOgGP/Ly01omXzJZfqcqUpppneU
	uYBm9y1BcWfeIBnQe1wVDShzdC+5BsLUHUc+EY1LzUXmy2kxAX5F27f3SD7T9S6W8d469XqWMmH
	18JcZ+isqc/7dv3F8tGC92npgK3vtEAirozN45iXWdvNygA6wj0JGB6b8A=
X-Google-Smtp-Source: AGHT+IErBp3nB27t8Idia9cetAVpCVdYB5xJ411doFQHPuwsK44xALnFKbTnOl7EG470VnVrE5IKHQ==
X-Received: by 2002:a05:600c:4f02:b0:434:a10f:9b with SMTP id 5b1f17b1804b1-434fff3d8f5mr29019345e9.14.1733815734174;
        Mon, 09 Dec 2024 23:28:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd42sm216710555e9.38.2024.12.09.23.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 23:28:53 -0800 (PST)
Date: Tue, 10 Dec 2024 10:28:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v3] staging: rtl8723bs: remove code depending on cflag
Message-ID: <21d2d3f7-c94a-454b-92b4-2eb6a4be6ce9@stanley.mountain>
References: <42d24db0-b403-4c4b-8607-38f3cd55cf63@stanley.mountain>
 <20241209213528.5917-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209213528.5917-1-rodrigo.gobbi.7@gmail.com>

On Mon, Dec 09, 2024 at 06:33:36PM -0300, Rodrigo Gobbi wrote:
> > The commit message should answer any kind of reasonable questions
> > a review is probably going to ask but it doesn't give any information on
> > this.
> 
> I'll try to improve this for future patches, tks for pointing that out.
> 
> > This commit would easier to review if it were broken up in a different
> > way.
> 
> Ok, in that way, a patch series is the best approach here, right?

I'm not your boss, right?  And I can't tell you what to do and what I'm
suggesting is more work.  If you just want to send patch 1 from the
series instead of all three patches, that's fine.  No one is going to
be annoyed by that.

In patch 1, you would only delete code which is obviously surrounded
by #ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA so the case statement would
look like:

	case HAL_DEF_DBG_RX_INFO_DUMP:
		break;

It's basically the same as what you wrote but slightly smaller and
easier to review.  But yeah, we're not going to merge this as-is.

> Despite the changes in the series being dependent on each other in this case.

Yep.  Patchsets are generally dependent on each other.  The rule is that
each patch has to make sense on its own.  You can't break the build.  But
they work on top of each other and they're applied in order.

regards,
dan carpenter
