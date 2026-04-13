Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B839539A046
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066795; cv=none; b=MO/V4gCKdkcPLwa4HdmPG1h0jqovNHFhRiFeKHUj/ITvIwCA1Q7DbTBFISrbtjfDmCT5BcN2QGK4UTbr/iE4paXd5Vuitj1h2LvEV/Bxy/sLcEe2BwN3bGO/ST0tDBHJiJMRf9dYl35s0YK69W9OyLvHJmFo5dEwnse5xyOx884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066795; c=relaxed/simple;
	bh=qURxmoeHtBYQQZeErf/My6lgX3gSGhOBzfCSynLVIZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp0IjIDIcr1Nk8LhYHnL+J/NEugcoMfIrhV6IAzHdbTBpvkhApP2OAV+lBdR7ObbLsxFdAPrDkKzS5EgHfnecjvepcBn+RZ71Yb8KHkq+5nwG/d6N8o7Az6MkK8rkaEgnOsxqTA/I3WM6+EL0gHl6r6jKm7aJAgbZPZSsZnl5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaC7B5KG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaC7B5KG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso38133895e9.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066792; x=1776671592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5p9ZJZXABKCmpzl6zl3MItAQjfacdhE/eXpBJaxRNq8=;
        b=BaC7B5KGCR3oo2th/EQr1N0ucQfBJyqLS/y3u8Id7hVcW8Eh95wUXPN4Ytg42tSMKp
         EfEy43PL8jok7GU8CruKJQLeq70tfG4CuHicZ94Zo4Mesbl6DQj6IqXhWVJPdX8V+nar
         nBJN12YQUnUDxmHyKj2nNOz8UWbfzExbgVQ0NfXv1fSckAbuO2q4xmLArFU7o/rZtwSs
         dz2BtwSiEkZ/k1FAp0PWNv2fWoGCDsAyP4iixWEwZAX7YLbuGyu10OCj7nOKTyDRMO05
         YhKm5wp7wayPC8eI/eb5JC93QlW+Xw0rgrpEykEm6cF2wpsbvtGkv7YChlAr45tNRgLF
         fZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066792; x=1776671592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p9ZJZXABKCmpzl6zl3MItAQjfacdhE/eXpBJaxRNq8=;
        b=VD+4JvMvKi2lISoaTfyts4ipZ2Wws4fh5C7HxXvm83GFLj3Bwy5UIw1FRQFrMrzIDR
         irVCJaL0xN2fpKNf+SdOAqagvV4XGDj8gmtvkooB5EcynZTA+d+jkyo9T0l7h7HQOzuk
         6/mmGQnVDMLewszsfR+3meKv8X7fpuYCCtubCVDp5BFohCu/FUbXydSTNsk8F3q8eNHK
         b52+qmhgKqOBuDSPNBMHnHOWCbYezIu1m/s1ZsYAcFXiP52hPmJO3LIL0oQqDB3Vqo+8
         iMJhXYMLRxlCu/E+Z/EbxGSp/EX5Nm1/+Ck0HhBYRRFp4nGqFbmAyCcKk179EnlGNVI6
         H+Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/RmP4xHLf/9Jfi+EplgWTXQ7jA69OyGtIXhWQ0aIDcIfSyFgLZ9qCnHKpan4mQa18drHqEYnJhc1gzbRST@lists.linux.dev
X-Gm-Message-State: AOJu0YxbFM0PR+UrB5kSwN0avkd8mBoMTyz0h9IV1+8ExZQ5A2k5XBup
	dkn/7y5k3H4n2aZYlcVCOFVmRyAG5YN8obKF3jt3cDVdL4/t77deiHaT
X-Gm-Gg: AeBDietSsYAFz/NMyef13tXr5u5q3gyuIFOWhd9f66WalyVfRZc0C2LJquRh8JerMGr
	1L4znVG1jCRyqD/Ge0y20fS3bciTeOgmOHZVUcdxmgygxn4mKsukwH8Ys03jkSGB0qHMun8MzkH
	EldKzyaTFl/oWLWUEi2GLTRc6Mp28dC1peFSaus5MUllMg7njTlI53sdA0IVgC4T6ZQNLUBtpcb
	l31IX84g8u3w/uDtGYnFlNhOCQdaLT77Ag4yc4gM7P0Gik5g31DITIDRQ5i/R7iYYe7yXm5s60p
	wSIh5m6ProdE9KWBGOh/yCs76i352Ho8dt5c7pB8MyekMItY6A57ZHniXSDvam79IjrKAWD7AWc
	VUbbnk8zLm8U3AGiA6m+sf73YneEiqT+wBT6ZBxsgZ/hMtuJrPhU9+FMyh7Nr6fFHtfZV8X2kEE
	sqbuMAnOFOc0YuU2IgnSOOL2k7HMm/5w==
X-Received: by 2002:a05:600c:a11c:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-488d67fa40fmr115755205e9.8.1776066792070;
        Mon, 13 Apr 2026 00:53:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5934a6dsm303076735e9.11.2026.04.13.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:53:11 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:53:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: vi: validate format index before
 bitmap_set
Message-ID: <adyg5BpDpi5I97-s@stanley.mountain>
References: <20260412154843.29056-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412154843.29056-1-dennylin0707@gmail.com>

On Sun, Apr 12, 2026 at 03:48:43PM +0000, Hungyu Lin wrote:
> tegra_get_format_idx_by_code() returns -1 when no matching format
> is found. vi_tpg_fmts_bitmap_init() used the returned index directly
> in bitmap_set(), which may lead to an out-of-bounds access when the
> format is not present.
> 
> This can occur when TPG is enabled on SoCs whose video_formats[]
> table does not include the requested media bus formats.
> 
> Validate the index before calling bitmap_set().
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

This isn't a bug which can occur in real life since the index is
always found...  If there were really a bug, like say someone were
writing a new driver and messed up, then this would just paper over
the issue and make the bug harder to find, so in a way it makes the
code worse.

regards,
dan carpenter

