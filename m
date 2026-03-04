Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F73914F2
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611732; cv=none; b=rmIv/EUbArOxkk42BhUebEE668sIpcJN0EmIuxT7nQJ4ReCWQ1eQUQz9ZdclTORPhqzHipqXQPeRBooCXok2NoAapLqmJE8Zrg6gEF1IiabMZnylhf1RY6rp9jHaul45ZVQFutK3qlxsZAnn3/mcK6F9S7mI2nJzHY9z+nohpek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611732; c=relaxed/simple;
	bh=lSa/Vrgx8+5RJvu2DAP5ugBlF7ME7nIIxqPzykEB41c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pliBF+B5vP9MOpnQwGFWnPFftJIOzLvVWF83hhfn9SiTI4jE1xTkOYmlcR/foq5UZgzRPg3qoaVojRrl86FAw996kLsnggPlfkBB7nB0fSmJ7ntYXtpO+PIL+0MBYyRMUNVrBTLGfLzSHV2SXw1D+lC2GiCqI4+VBfuk6xJqpOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cWd2R6Oa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWd2R6Oa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806bf39419so54860075e9.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772611726; x=1773216526; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fpM8i8yx35v4Q2PK0wRgI3KYOnueLVbaabPznk38Dyo=;
        b=cWd2R6Oa3cdGN4bo/PQQK/vHPj+g5kKBQDousDqjE4k9T5XDfJXnNfOvnkXJ063X/4
         x8lysfraS99nwAm0Nx60ZuuOFYVid0j/u7PIt93r41e3XOY9dm/Gj6d3v7V2T6HyFCj0
         zBKPCO5teazYnQ2HI3XDouSocRabnAzaWYxjO7EMB/FRDV8fwZA5oJzf4zlKg2+0qHpq
         MgOWyK6g5oNRbzFb/q5s28GVPKXnxWsCn5D9qFBwIMpF+fnTdvDHQ0KlguaEqNRA/Ohy
         WpqLYD83xqNjpz/eEKuw3xYxwyAPIxbCTvIoot6urhWjahG3yxN5/qIA173e2zMQdnk9
         Tv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611726; x=1773216526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpM8i8yx35v4Q2PK0wRgI3KYOnueLVbaabPznk38Dyo=;
        b=UeldM48HWgLGK/pf6YDWAgs+wm0by9AcZ4rMsjg63uNF5qZIU43r95gB2aZp9gY2ST
         snrkEVswqVA+DfIL/WOWVvbO9mh1jgiOAnJA7cURubPOW07BCFs/ZIC1/mirsWaPnjbq
         fXxfB9s92CwjCs7fKeeCudxW2PEzDfBM//qGrgmsajrKNS9j4R6IAJuUT0W1y/L+j02H
         lETp8bzEyoeS2Dx6DUB6qx3j/1AELB1bJCu7RxLdqcUxoAzFXM79Lg8rbRyTzcGPXHLn
         6s1SRvZkOmaUgLeeLPJ3vf6A4fzHjLK+yLJCUvJOD6lWf+mXR9ts0y+ntWAWQNRfizHG
         6QhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3EUhMusOoHkHjZH/8B/bjXQv0lCzbHf8AD2JnybOitcaLHQcBE127oyJXQpHWcOBPzM86NLIEX2SlnJTC@lists.linux.dev
X-Gm-Message-State: AOJu0YzVVZ+l80PnJ3GmOOsIO/1JIAh1gk/CVlwEt7HIaQ4GIBsbEOBs
	QPPPEqIxNXonznvO360OD1vAyoCfeFij9b8JwF5W1cwegIv2CwLEwIoN6Sf2gNxT8u4=
X-Gm-Gg: ATEYQzyul5wnzVwFbaLd9g34zKK4SWpSMC4WG7L+7sVIaCv03kTD2ICXAerwWBY8LKG
	Z7VqXl7z3qRBPNr5PQgBtfgqtJXqs2iK3DKZGwEy5Ki1LbSoxjUdEhvAkL9gcyCeRGBIGI1w48j
	baXL5z0VP9DTZ7btrFuyX6ih3xy4sFzL5QbPB3HyFzALu0Cl4/eUa7Re+kQmFB6PesyHkevkyds
	OM+UG8gVUy3pqD75bj8A3gRv5g/X9fomRDV2Eu3rLjNA2BIztLcAi1TF57Ku/DjibQ2F6blFFw1
	K6WGqjmUgomaECZ+GEyFrGt3MJa2idVWpHZTqcd2FFXk333dxRNcpDuAnu+VNta73fGvGn3J69j
	Xx/zw02G9qTXN4GTiRp7Ps33QZCfR3AwYZs/S7bqzHgvBk8QmrfPxgZpQK9jP3rHBkONBvCDSuz
	xFVyM7nS9IgFiAkpfZKOCpB6oyusK5
X-Received: by 2002:a05:600c:8b6a:b0:480:4a90:1afd with SMTP id 5b1f17b1804b1-485197fa2c8mr17216925e9.0.1772611726512;
        Wed, 04 Mar 2026 00:08:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485186747a0sm72355725e9.0.2026.03.04.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:08:46 -0800 (PST)
Date: Wed, 4 Mar 2026 11:08:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	=?iso-8859-1?Q?Rog=E9rio?= Fernandes Pereira <rfp2005@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove redundant blank lines
Message-ID: <aafoiy8e53XRfg7F@stanley.mountain>
References: <20260303173844.47975-1-azpijr@gmail.com>
 <20260303173844.47975-2-azpijr@gmail.com>
 <DGTHUZ568F1W.1OBYQ16QVDYLL@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGTHUZ568F1W.1OBYQ16QVDYLL@gmail.com>

On Tue, Mar 03, 2026 at 04:18:30PM -0600, Ethan Tidmore wrote:
> On Tue Mar 3, 2026 at 11:38 AM CST, Jose A. Perez de Azpillaga wrote:
> > Remove multiple blank lines and unnecessary blank lines before closing
> > braces.
> >
> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 14 --------------
> >  1 file changed, 14 deletions(-)
> >
> 
> ...
> 
> >  		pwrpriv->rf_pwrstate = rf_off;
> >  	}
> >  	pwrpriv->bips_processing = false;
> > -
> >  }
> 
> Ideally since your deleting that blank line this would be something like
> this:
> 		pwr...
> 	}
> 
> 	pwrpriv->bips_processing = false;
> }

Sorry, I don't understand what you're trying to say.

regards,
dan carpenter

