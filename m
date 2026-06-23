Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35A3A7F57
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782192080; cv=none; b=Q5uL5ivyfxU5OZywluGiQo2My8JLLqwpoSvUHBMdc6f8fk+H1fL0qaS39eVbvOcENptYxy6fgY62WfX4OVAuSY/ng8YPV0OdhUlkxgvhj5P914AfOCfjbo5iZawwODDnAwaZb5bW4mLbOo60HMYtZvE+CyCeYK+r27Co7VMBED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782192080; c=relaxed/simple;
	bh=ST1JHEQ7mFAx4gDIq208KWCavqyeViWHnZbIAGD/r4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHMzdoz8LdCS3SkgHx0gXx7Osz7Nx+UsElvdv5RrmKYlGVYb1wQ7qzN4Bem8wscPPFXcKTzM6rcm1RiP826grYJKS2v8n/xswKOR/BHlPpw/yZYMM9lb4fr7+Z/T2kXVTqfsrF/YZFqeISiueKlWWxpqskmBN5MdgE0rf8JgNXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtwVUPLS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtwVUPLS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-befee9e5ef7so631377266b.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 22:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782192078; x=1782796878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yClUGsY1ysuyzjoW+pFwgJOCs93oAn9+JbUKr7O/i6I=;
        b=CtwVUPLS2981tzYuAlMyzdP/WCCESSl5ug9Smc3vc86VwTtOSBOfvj5v6YzvcMBnc6
         ZUgdPpNhu8E/+Ez2HQWBhWP8qOzVcwGYF6HSztLqz+6/lknzA+IqIkz7TkABnDUc5uuM
         nJk558ijK70KBIfNsE1DHxae599MNew84EaSIE6+9MiUOcEf/xBYIUw3zCrnwAcN7g9l
         voh+9QMD4P8/DJ7/e3kpLTAeFkbhcxnyhYtGxr6b7hraZ7FnTPXaQ1glKYwVwzEkHobR
         J4vmZ67U70NfFHYfZ8qzAJ9Rzyp+e7sgatFs+ry6bWS09HF/1Q5ifwxwplmQJESaS6qi
         DaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782192078; x=1782796878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yClUGsY1ysuyzjoW+pFwgJOCs93oAn9+JbUKr7O/i6I=;
        b=DKIv8/qTzFj8uhABuH35TwQ8G1f9b5dQzS2jCM+YYa1raILfAxDxTCXl2XNT6ap2B5
         GUgOG5rgulK1QhlxT/jRWukFXBlzRhnMtvl6XiRXLCpbwdu+milSeo1MLYp1v+Mcv/Pd
         OkWXbI3oH+iDoIKEXVaQsARSWQa8wsYTjW6cjyqlrvSAwltIXfrr8SEmI43mtHdJaEid
         AhMuu8w1b4jXWAnPL6OGMIoCk3POfnBTCdjzELQay7oMb2Jls/T/ZgR4hVNCtNBg25WW
         GuHaJNPzrA74uOVlZcRxzrtLy0Bx1Kwa1A71E4+tITmnsVlhdRwfSluXtv22JSuiYp3F
         Oq6g==
X-Gm-Message-State: AOJu0Yyztw/E4YnSqN8NCfaTt42618oClPxCc+JitE/VxUw3hMWY8f6Q
	uArW6PX5HUnhbZqKUFnqctqa1EB7zH3xFtHa9xNXAJgZEXnomFPRQp4/
X-Gm-Gg: AfdE7ckl5chISWH04GTJ65JqrTgw78DLI2wNSRTjWt5whIgDKrEE/B0nrL0KdG22x4i
	5k+OGHwutJTS19sOR5JRzDsyCDvPNcD4qRkqk/AuGAIXmqli9R3+GOWrzJUMyFXqwz/lfd9KrbU
	7PgX0JZQjAhyE24/j3Fcv4W1c5v4X1V9tq3UahYwiK3VHxI5uQTYhR2X691RTGlG4gMgfqN1vDo
	CRukxQHirBvOueLD3Tcpy+sqilprENuEQmqn7BjYu1z/hmCB29ecFYE7yqZEizhLzhW+6RdBmM8
	LeYKy/sYqx3rezEV0OEET7A0qgZ27bshnAl/Z6W5dImp0mY2MJUGEkmpw7vRL2B8eM7vgDCoEeW
	0gaxpJg8tmS711M4BQ2Xa8tExJv/jhFjSd6QNz6x1Dldr4iKpTvY7L9MdRq+Ut7EKZrgH9pIm01
	RrhoTti3tz
X-Received: by 2002:a17:907:1c04:b0:c0f:cc39:48c1 with SMTP id a640c23a62f3a-c0fcc394a26mr256035266b.14.1782192077615;
        Mon, 22 Jun 2026 22:21:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be63fc0sm4336894a12.27.2026.06.22.22.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:21:16 -0700 (PDT)
Date: Tue, 23 Jun 2026 08:21:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, lgs201920130244@gmail.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: simplify rtw_spt_band_alloc
Message-ID: <ajoXyBs3CvAzea0r@stanley.mountain>
References: <20260622160947.7970-1-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622160947.7970-1-serhatkumral1@gmail.com>

On Mon, Jun 22, 2026 at 07:09:47PM +0300, Serhat Kumral wrote:
> The function only supports NL80211_BAND_2GHZ and falls through to
> exit for any other band. Replace the n_channels and n_bitrates local
> variables with the compile-time constants RTW_2G_CHANNELS_NUM and
> RTW_G_RATES_NUM directly.
> 
> Use simple addition in kzalloc() instead of chained size_add() calls,
> since the sizes are derived from compile-time constants and cannot
> overflow. Replace the intermediate alloc_sz variable accordingly.
> 
> Remove the redundant second band check before the init calls, as
> the early exit at the top of the function guarantees that only the
> 2GHz case can reach that point.
> 
> No functional change intended.
> 
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

