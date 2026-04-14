Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DCB3BD224
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158979; cv=none; b=Tk9mhuBiKUYLpuwD1LvMPaBVuLuAjpn2qUNT1JonAnYzY3LFWmarEKytNcMVg8ChO2Hm6mx42baWRontLpkTS2RSvIFurER3yxTAXXQNtogfX3oN+hOXNGZMGmvHbCfHEEhcv7jg+CWPG/4oYEZj1aw9feY1pVEHALuX7t19xcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158979; c=relaxed/simple;
	bh=KKkFrGAQuLsaKAfGMyDZsQ3k1diSwHCT59e7mADutEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ed3maKL2q5GjeuPN+0QRsPVuaUmIf2BC4TghYshqglvWbU1WhPt6euBPuZwRfFVKgXsB5kMOBXKXET+yf3JBiDIpKwGag9pDZTBRJ7b/eboTUXyVU7F+J0YGmXTJ0Kam9MP/KQXOIzqdyYVyiE06JKR9axGeeXS49L9m4FJtjzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+Q+4Pn6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+Q+4Pn6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f454be5bso56335525e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776158976; x=1776763776; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DE30NuWaHREAKnzN3Ic0cEm1QnvslG0UVfsef9rFBsM=;
        b=i+Q+4Pn6BNJH94HbwqeJGEtL8EpmP/2LaSpAsUpHc4p0s1bsKmdO4eqx0H3Iq2HfES
         6ZFZ6QX/hjXIty1+hxVN1RAH0f85Qb/hZkuiKa5OVOb3gTa/7/YQI8NDEjfSXwFDG5eR
         GEx6k7ORWoHAo2oCeXiTNci8csJvbtzX0eJhMhwhL3po9bAXBBIHFoKBPyk6iIckkD/i
         y96xHfSqBUDXYn8yrp8CfnaIBTYFKmC4Xy7C2geAQqAoLoH0I0k3U/goqdSCgLJKI+/W
         KrtkeMPUzA88VETfXCCuUo7xqEH5Z1bQJgW9aFuXX0Y2vdAK3fKEZD4ZsJk8fmC2et8M
         dH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158976; x=1776763776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE30NuWaHREAKnzN3Ic0cEm1QnvslG0UVfsef9rFBsM=;
        b=WFcP83tot4N/i3Xpaik6B1oN+ke3H/fTuhYpK0CAftSFpUvbziqrPWWG4ew7Vm0pSq
         0GojeTJ0wlsVe+uvhmysugcbdgXfTqRcdcqIip7+FnyqCEeEhXkFIX53VJK6KM8CKXAT
         FfM0dlpNdKR5J07XAiNT1nNySn3nbyS+fw1NtA3cfNcxPyNjbYRUfNjhwPatqcgArkG9
         gUXzHtBwDjfnMiWA3CuAKAPQBTqBxDwvXCy6pcrSMCC+uOS+Km30zADKun64h5IVoMHx
         3+aI7pJq/sj8d6vSn9w2YWlciOdivqx+3bqbfhw3EtBWaRaYlj3ZWqV3a6Bz7Ts0LOye
         6xFg==
X-Forwarded-Encrypted: i=1; AFNElJ/Fd5oyB+4QngUjN/7tkWr/6m27gho/T7Y3Tf6HjAVNf5RFnk8oLY7Cpf7V2RhmNOIUC8OjFojTWWXpfhBB@lists.linux.dev
X-Gm-Message-State: AOJu0YwRiHLDwQcIzN5SDFFH6lFMY8vcaXXhe5X+IDRRadunuZdfozZW
	sq3ERow8pGEtPhmcJ0n5Ug3YRaEyo92y5ub1Y6IY8ET01yen0A+rRdJM
X-Gm-Gg: AeBDieuYUD/JethCla59BUar93O7ZpEvCrv8NiAdS9zD49/XLkjYultz/YXgrFJhqwY
	id7Gu+mil90rRUU0YBW7aMMQDEgz+UzcFlS1v/DR7pZoOnisZhQhyb3G0ZvH2o73OSgzmKJqlxz
	XG/RftTN+Kn2G0BbdzOCpMoLBTyvgoqaq7xM2Z/UgUOmqGJMn+fuzPQzmsxuj28Itkx1I2DaFHx
	QbEFn/Gc5WDLtWa5fCTIF83NzYkfjCkc6oc0HHYgfDOl+mfqcqwSy3qRihk8qaZk0ycdVwWKBMy
	T0NntShOxPXRibA5nfCV5aMqI7jN5Cv3ii7VCJgEYgOB1dv3InU1SwmAfSkMzSldY3msEw6eZCC
	OQHXNY9tNQuKJedslDc5Xec91wr78iFobsm5UmGztgmhskoNPCOSgyq6zyrs4nE04uhFm6wHo6T
	EGyh2ecqy2/skBcejtk1WHeSt2BSUX97JmHmi4
X-Received: by 2002:a05:600c:c10c:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488d68cb8demr138530075e9.12.1776158976282;
        Tue, 14 Apr 2026 02:29:36 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488e10d69b2sm84509625e9.8.2026.04.14.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:29:35 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:29:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: frequency: ad9834: change sprintf() to
 sysfs_emit()
Message-ID: <ad4I-8ulJuScyHh2@stanley.mountain>
References: <20260414091250.1295-1-joshua.crofts1@gmail.com>
 <20260414091250.1295-3-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414091250.1295-3-joshua.crofts1@gmail.com>

On Tue, Apr 14, 2026 at 09:12:49AM +0000, Joshua Crofts wrote:
> Change instances of sprintf() to sysfs_emit() as returning
> formatted values to user space should be done using this
> function.
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Someone beat you to it.  You're working against an old tree.

regards,
dan carpenter

