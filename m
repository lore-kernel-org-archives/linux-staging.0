Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C7944998C
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623050; cv=none; b=Zb2obsb5pB9jdLaY7unXO2+Y5A46QbnC01rGme3WRYvuSB1MC1QkkyI1qKekoiv2wJAUioYNnmKZL7Xufe4G3hfQyHIMXJ6YPKLRR+GvlSnW8vfjzGqCHs211PB0+aT+qLlrVLLk8A1WnAGfrdKJ0Ub+PC/RRNfVG7+dsYedp/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623050; c=relaxed/simple;
	bh=1bAtBPGgK8NHVISEj+GO0iePzHotuB8GIB2HKxOWIDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QE39N/bCxwf12+Z4WbxzdwAo8KI4iN6TLPk9sAE7tdooSMgXJkwIcP47AyGZkhliwc8DCkJMjYaoU7BGw+Y+d4px68Zv/0SYcCb16J7IdJHrSJ+vp75cUuvLMjhXG5lLv/HI8ptQelSZl/qZkqMFmm7fXgb45dskx0Ha7h4Na9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBl1ne3d; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBl1ne3d"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a37b2643e2so149922eaf.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783623048; x=1784227848; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZRHeCwFsmKFBk4M/1QJH4iLci+OyPvksYnhoTo8Soao=;
        b=jBl1ne3d4v7gcpk5IEKH7KwM1EN1eAoVilBoY7x2IfyDAuk1rXYxfMv2UbOefsZ1Ud
         1PUS5rOBNgKDB+w4h98UfuN4nUxK92NBX+rxHvpIxoe0xqnNfRDyyf9GEL+wxKrwW5+d
         jOSsbj05vLTZEZ3axbpDmDB2G3ITvILW0/6Eudsag/mMURNzYvHKbH3BTnrvLECzI77F
         wF4q46p8bfmrmMni+ogEEqByIJ4xQMi8P/GouSK9xzJCM4LFLC8m4J/B62Xq4j2UP6jM
         u3C9ywil2gm/mfdklKmhaQsaBWFltX7YAGtZ7EbHjOxn9e3iQhN4+kw0lUH3wTmUd4p/
         4QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783623048; x=1784227848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRHeCwFsmKFBk4M/1QJH4iLci+OyPvksYnhoTo8Soao=;
        b=rlJW5lZXWxZVpgASXFsqV2b+jolayGWTN1+vFzBqBmb+q0fAV989D25TvDDgoAT1hd
         91CqIjdrsvIWmsga0p0BSQjBFPRn3NSncuNLbA23uBy4B7Sqgym3scfhYZw7D0Y9IIDY
         7Bugz+XArA5a/YlgCtF1gNty35oA2ej5qP8C0oxFZsNgnuV7msmokF/xiUDfQiqDiBEz
         d9b4UV98fVu7++HD9DlpUhnYLPBcICIYfwMqJmI8+kfOyAsFUBpZinAflQcU4/Cl2uXW
         pcyYVET74OYv35AjwIPYeXAj/mB0l8pT3dTf/M/TxCWD6gWsnavkWnA9TsPk64GoS0a2
         xmoA==
X-Forwarded-Encrypted: i=1; AFNElJ/EX+Befz50rZvLKXDJzFTyj61nf4SeRRkyxz7d69DrbVqq3RbvfyQ4qCN1Z6koyI9wE2M0ed8TCxjs0dHa@lists.linux.dev
X-Gm-Message-State: AOJu0YzyicJNAZqh/52BDW+m8GW/lWow6dB6VXighFTuxdvfbre3u/5J
	DT/UDbNE9ANEWUaefOeJx4aO4wAw1pg/NwhlHI/G202GoLxYB4Bxc85g
X-Gm-Gg: AfdE7cln+ISd6h+3lNpcsB4NyEgS3HO/Eszq475ro/ePXzEvCDWvo/CHXZ63YFgZc+l
	muEj6hlb7os4V/WjXlofK4SdIckT9yXk3JLU9mCEn9YO0+dmL4ZnoCclb+rwh3btjXLGopuScYt
	jbCuonP1ehV6kEwFF1FcKBNjFSHC0cUD/IQmviDLXMfqV4YHwfYdIS7FbAqo62I5XPgDLD0NrAE
	M/CH4A1taYD26P9EFITinWP+z/UCo6lPgsoOXprypzPyYcS4OAHis7lgx3WnXutAOEQIZVhX+r1
	+cV7Xe/SDdc7vE+t8BW0dr2EJxtFbZ5Gj+O6jf+jzi3UK4nQ0Dv+rgW5ucfprz6laW0sSO5Gqwy
	8FUzddQmXex9Y1nAnVvfGxXFw4Aqs32HjSaEzp1KMFYnlyZblb4TbTkWQ3jxjcIeOc0BFwEbagD
	6XmDDquqk=
X-Received: by 2002:a05:6820:82c:b0:6a3:8023:f344 with SMTP id 006d021491bc7-6a38023f40bmr2648403eaf.2.1783623048208;
        Thu, 09 Jul 2026 11:50:48 -0700 (PDT)
Received: from localhost ([45.136.154.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a377bd9cb1sm2973603eaf.15.2026.07.09.11.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:50:47 -0700 (PDT)
Date: Thu, 9 Jul 2026 21:50:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
Message-ID: <ak_tgJC8-d1HPKuV@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
 <20260710020644.6728.alvinhuang0603@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710020644.6728.alvinhuang0603@gmail.com>

On Fri, Jul 10, 2026 at 02:06:44AM +0800, Hao-Qun Huang wrote:
> On Jul 9, 2026 at 6:52 PM, Dan Carpenter <error27@gmail.com> wrote:
> > These kinds of changes require testing.  How have you tested this
> > change?
> 
> I compile-tested it (W=1, building gb-hid, greybus and hid together) and
> traced the return path by hand.  I don't have Greybus HID hardware and
> couldn't find a working emulator (gbsim has been dead since Ara), so I
> haven't run it on a live device.
> 
> The bug is that gb_hid_set_report() returns -errno on failure and len on
> success, and __gb_hid_output_raw_report() computes that into ret (even
> adding one back for the report ID byte) and then returns 0, discarding
> it.  So a successful hidraw write reports 0 bytes written and a failed
> SET_REPORT looks like success.  The GET path next to it already returns
> the count, as do usbhid, i2c-hid and uhid, so callers already handle a
> positive return and greybus HID was the only one returning 0.

The bug is not hard to understand, the issue is that this changes the
function completely...  Was nothing checking the return before?

regards,
dan carpenter

