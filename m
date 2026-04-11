Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F07D2E8B8A
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 08:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894982; cv=none; b=TWacH0HjLQ4ADA8n7tJ+QJDWA9EcYBxTtNArbQpp6vG/EcRDNjx9EdkcL7034ToZfssuZJFWN0/LiB87E6gohP4FMw1Hv/jLq/cIBAKLZI49bNy9qsLG56+R+hB34SARkmKEkESfhYhAOX3f6grqWZgmeBEZUPk2vCEBFmWHYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894982; c=relaxed/simple;
	bh=X/Owopqa2S1NblxKaMHeWMjoYbUWyW8GVNCG4NVsplc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbs4d3vigICRDbzJpVX06UmAMuTRJdHh1N2oOSoIs5m7nOo4NTcoHDzYrFw4aGcb4paWwL81a2VwfqzkVGRbrhjOMWH3EjEY8FwDOzOh4K79mm2MqeAZqWl6OfZD2bEwUMO3nLktjjRRKR/s7EJ0S9dOyY1u+3zVXB2KuVNOxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDVw5K/M; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDVw5K/M"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so1620653f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 01:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775894980; x=1776499780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCIDCtXAFs9RD/uw9KJW8YhWAfzATP1tiaaPG8i8cv8=;
        b=DDVw5K/MW5zPZ5nb0JqY/nR1Ce6+oJsuGijhHKCN00jbhfPTvH6ayDwRU4apAiggJ/
         e0WVzFyE1QwQlld9wRzSElgBDx2kW4U9h9CfntK3dhxTZcuR5J0bkurDKGPR63AvSzo+
         wRsX/X7HAdEs1BtetnbMkxDBg4Kb25EJbuH0o9BeTwFgKEGJ6stlfr4w1hsoS1q6GsZF
         eS7d7Xglu23AFyCYypXHjP5aanXVr3htjalX02yWHCsp4R3GxBHKXcAwMfqIbJkNu4Be
         c25Cz0KTlX6c2nsjDQ/eVE6H78opCHmNLMQeZYxgA816LsaHy98sX19gDFS9y9OdZ4fL
         8jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775894980; x=1776499780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCIDCtXAFs9RD/uw9KJW8YhWAfzATP1tiaaPG8i8cv8=;
        b=k1BoeGP3OzMTZDopgpmjBeleLnzVzWYcPnDNzVbTJWcgI8DeTSdxnmwU/HN/RpMSrs
         hDmGnP0pXd7Ge6mef/ox9uk1LTpHlGJLVeVf0WqnFKG0LmRhaxilbRWGDtLB4Uv4EXPd
         cH3nGKwZk5fg94UnTFOkBjN49OXqqfadmBE9ZxOkTt8+5aWjvgW3uhah1Dsgy1aUq7O7
         ir1JXQ7tSMBU+xOxluqbFEOuMemdmYbYXHmumQ3YjpWHlgGEXyCaRACpJjsvE4xHSEe4
         FrEb45z8Av5PDQC1bQlrQnD2VrYxidsuowMRwZ+FcMOvEaLXzmcUa3+tcUtMLu9BZaNT
         9alg==
X-Forwarded-Encrypted: i=1; AJvYcCW6iqYfl1OykLDyuQB2n/kDMuZ4W/1DSA4kvzgDVaqc+O9/Lwb/zJPuiLgv6nhFVPglGVLaQuFXliMaSBg4@lists.linux.dev
X-Gm-Message-State: AOJu0YxpVkM0lDHLEvz9Da2iKXNAqwXo6nHVJ/iQ9z1czKwUjtqz2USL
	0/JNnOktQMtipqUHolZFD30UjsDfcqU2qVSwoUHLAcFy+RJIk5e8QzTk
X-Gm-Gg: AeBDiesD9b39Iv+BZcBKwqgpOLykpYFoi8xtcS4WDfq4OUtwU6ANdr2+kooiweezRBY
	HLhRipT93qPUKaF8swXfw5Hl/4RNrQd3ylzFFAXVL4XFfPZ5Wrkbs3yzHqvVVpE0QlKXb2fU+zL
	vXVIzwexOb6GhD5eDeKsjlhRZPXY0LcOdgRKvUME2Jk0kkDgSlux1mK5laBb9pXQfSeezXOuUcs
	zpDjOFzUmwgEdtFMa5L83H0ncpehsl917g5XdMpcU3q0xC6h2SeLdSMHiLlGts7OUCseS6JpWMr
	TmxC+e7zUX8p7yZ/KUiDklfpqAV0vrldaZe3FlUE6SWkAywJButdS9hOuRuhR/A3uk+XOzqjSps
	/4D+ZOIqWGi0UdQVyVFgE0C1Q3YhDOEl6sYRl6x/GaV8zSXQ5PFEgA497ybgjTHdeLfJImmT8il
	SFujJTTD8bcClMpDptAbQ=
X-Received: by 2002:a5d:5d83:0:b0:43d:300b:2285 with SMTP id ffacd0b85a97d-43d642702afmr8462151f8f.11.1775894979808;
        Sat, 11 Apr 2026 01:09:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm15002555f8f.27.2026.04.11.01.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:09:39 -0700 (PDT)
Date: Sat, 11 Apr 2026 11:09:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Advaith Neelacantan <advaith.neelacantan@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9832:  use guard(mutex) for
 locking
Message-ID: <adoBvxrqMS1EDim2@stanley.mountain>
References: <20260411072503.106621-2-advaith.neelacantan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411072503.106621-2-advaith.neelacantan@gmail.com>

On Sat, Apr 11, 2026 at 12:55:04PM +0530, Advaith Neelacantan wrote:
> Replace mutex lock/unlock pairs with
> 
> guard(mutex) for automatic scope-based locking.
> 
> Simplifies code by removing need to manually unlock.
> 
> Signed-off-by: Advaith Neelacantan <advaith.neelacantan@gmail.com>

The original code works fine.

We're not accepting this sort of patch for old code unless it fixes
a bug.

regards,
dan carpenter

