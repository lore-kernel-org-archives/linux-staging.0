Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241AC38AC91
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762044; cv=none; b=gbDkl1HPW0e23ovhMWnw1kxI7nnh9Yse/lxWukNSE/JlTbCl1CfvEUEzT1ylD63XzQEyh8ZmpAUgboX/yZDbvlEplHtZZKNYstt+GhVJ4GX5xBDwz0nhfO3yJNWrSA4H+M3Ji9WfR7FYCQ4I44x8tRMInplH3ZS8JQeu03NTGBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762044; c=relaxed/simple;
	bh=hnTiiRzl9G7eePzzIwjE22PBDOl75cM40NKb+PgReeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XP75+W7FY3+4tNcG0Obv6cjWYuJMzoMrIBgq2C6z81VLq2Hwii70/V4bneuEZF+KLf1XKqnyhgZfxE8T0eqRa2x/Np5aFDrAgwNT2gPUXblOTTI6xexWbmZYjEQCMLbL6JsftISSuWXbtqZ8hCoxpSJiFRAoWZNM9SNsdprTKV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sboECAFl; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sboECAFl"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9cd40e582so619078a34.2
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782762042; x=1783366842; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5WmMKvjmzvyuGXbzKRG6hqivUgSDTWGVP+syryStGI=;
        b=sboECAFlM2D9dMgK0Dyi4E45GL2Vs8933f118qpTz99lmSKik7gj1hBZoksSxY/YbU
         zq4/+DOh8TW8fyxEE0rGqp3rHffUP4hnJSnSleOtn67jkD1sf5AalhIyREa21vCxmlqw
         0cVx9d2aRZvKPFkxpY1xF+CULK7ptsD6009p+rP+xtkUFhkHOhqVBV/JjF74rJ2b8059
         B9CDM+oFV1AEpxSUPi/aBjFPst9EOfSnJKXBF5pD4QVcLNO92hOizhtLSqkucj7Jg6wh
         51Vz2JL6/LMYjbWI4t74jW2C3qmNyANgeiRUgUhGoy4LGTEjyke6CxRIuaGZbJaQWBuV
         0M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762042; x=1783366842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5WmMKvjmzvyuGXbzKRG6hqivUgSDTWGVP+syryStGI=;
        b=eejNWt4SHy2WAM0hTL3ELw6a75WhsPDRu0YMLu7C89ucMrslwqagqMoAmn/A5Np4Rk
         TwbhrSiRTiOiITb20SOhGwmLy+MO4uhl4WezO/0mh0YBkYGPZqL2rRcmVKtwn2m8LXEE
         bY2j5inncQ0gyQ8ve++DmlY17rUf+gx89kMqtretsIQQnKk/8OYpi1iP13kilmIA50LD
         v6Svmtz9y2Fa73UgLdzVGJj5JSLElbZNG8F+5IMHlXlMb6fjsvhB1+gMx2RahqN/qYZ6
         XdZFUjWIaA0pLEzQQ/jKkqBhWSS9YPXu3/UDUHtAgqNLMf5Z4PMxw11jPj8YGJRlclNM
         QZww==
X-Forwarded-Encrypted: i=1; AFNElJ/iX1aUCcMyq9bwELSzz8uiMiNqe1aR4HkeQXQBLoVTsBsnNrT9ffzIyHMiiVX+m5XrCdE75H5oBsuPiZOE@lists.linux.dev
X-Gm-Message-State: AOJu0YxUJItmvRRA1CElOZ5Wz7inEj1WqTTkAaDaKHvaDIxpxPj5mYai
	Ss5QiYZiVOOO8y2WOrZq9z7Fu4fyvM2gvQhPA/Sd641IE9a477qQA28y
X-Gm-Gg: AfdE7cn4d6iYTR77CjrvYO1h/Gw9hzApGyQZT6IpFg0W9WEDz0euPmFCtYmQBpb+wAj
	xnpcH3aYafOrqnLtTEPlB0dz7eaXWCgC7tlGzb7uKdTrtNyyaedNlfgqdB+ONFiqkEYdUUgGjMm
	BUVGvOYF8VOJpUAeyDo9yNRiopS5ug9AMiklzqmjYkqatix9dvgFDFs+SDDkczunZmaIDAquZ5U
	Ttz7IRCx9rqYe6GCfvuTA8KCQLc28XXnqqbQzDTxPsD5Ft40QyzoVVwPwAnXhhjPIiER2EnAd10
	gzOFfpsSiyq+M87x0VsuOaO08wCsnNRRmyMK9x+YxAN06psi8NOI+Go/jg+V2q0xJEuWW03IrrM
	cYF9ruNOg+9Cb20fzr+m7dYbN9gZBDmoMD/EUOKHi01YFqAlmCs6bB6MvltaoCpfbqv0ZvYxIO8
	uLpb59DTg=
X-Received: by 2002:a05:6830:6e21:b0:7e9:ef39:1caf with SMTP id 46e09a7af769-7e9ef3925bcmr57606a34.16.1782762042018;
        Mon, 29 Jun 2026 12:40:42 -0700 (PDT)
Received: from localhost ([45.136.154.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2b8f03sm524966a34.13.2026.06.29.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:40:40 -0700 (PDT)
Date: Mon, 29 Jun 2026 22:40:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prashant Rahul <prashantrahul23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] staging: octeon: handle rx/tx initialization
 failures in probe
Message-ID: <akLKMaudIMA8Wj0M@stanley.mountain>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
 <20260628-staging-driver-octeon-panic-v1-4-fe8c34989254@gmail.com>
 <akIiVWOOfjbdM_G-@stanley.mountain>
 <DJLO4N0H5YYF.1GOPQDJ9QVG4A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJLO4N0H5YYF.1GOPQDJ9QVG4A@gmail.com>

On Mon, Jun 29, 2026 at 09:49:49PM +0530, Prashant Rahul wrote:
> On Mon Jun 29, 2026 at 1:14 PM IST, Dan Carpenter wrote:
> > cvmx_pko_shutdown() has a built in call to
> > cvmx_pko_disable() so why are we calling that separately?
> 
> Didn't realize cvmx_pko_shutdown did that. Will remove that. Also, Should
> I remove the cvmx_pko_disable() call in the remove function in this patch
> series? Or should I do that in a new patch?
> 
> > Also I feel like probe() should fail if alloc_netdev() fails
> > or register_netdev(), but that's not introduced by this patch
> > either.
> 
> My main goal with the patch series was to get rid of panic() calls in
> some of the initialization error paths. I will look into properly handling
> alloc_etherdev and register_netdev errors but in new patch(es).

To be honest, I would keep your patch as-is instead of being more
ambitious.  If you get much more ambitious then we'd need to test
it.  Right now, we're only affecting paths which would have caused
a panic in the original code, but if we added error checking for
register_netdev() then there is a chance of breaking something.

I was just saying that this might not be 100% correct, but it
doesn't break anything that wasn't broken in the original so
it's fine.

regards,
dan carpenter

