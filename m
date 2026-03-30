Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E853B52E7
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863328; cv=none; b=Gg4o6+wfDK7Heh0WPXSJFNZz32576ejeAt/HIkCdFJLocnoP4YN5UOpvBBsgHwcB/O9MXB8L8POyDdtqdZaGzNZPFdPRlJW0qj0SOjtJ4SEqGu3AVrVZCfH7wT+to5fEO1wjn0iLg6uErApaeZmuQ1PEVq/+kOI6NF7Q6pL4tkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863328; c=relaxed/simple;
	bh=ipfpOKX2JiHD7zjNhC6JygPwjUI88vtU81EfO4uTgks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qidg3gtPoAqV/4F1h/FqoJTL/Nic6RicYN2G98p0Ibhcg/gUuQbf6y/HukxdCt1gJtCAfqI9HJHIcXmNo9NxRUvD/N2GG/GogzE74hSidAYFCenf1QdS27juTFuTCAbrsDKNMAF5Mk2mpRbXLQJAJuH0g8MJXQNKrxtskC2pYuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+Ttw/gd; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+Ttw/gd"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38c01150eb2so33066361fa.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863326; x=1775468126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ipfpOKX2JiHD7zjNhC6JygPwjUI88vtU81EfO4uTgks=;
        b=P+Ttw/gdE3fwL9WRzborAYssojd+3sElR98IqKDUZQ3eAKoYfx06xNVIl6eOXn6xYN
         2OquP+lfQCDCxEA9Db7BnEZWBD/PGlDQ4B3H5h/VKBU6BHs0LSEC/iTcFjaeqCbalJq5
         vfR24WQjW3Sk3uWPr7RYUT423nUun/qN0PfSB5qyo127KJVT8RlKYf2nDNIg4zs3ZSo3
         a0l116HYaXP+jySO0/kHQJQv/wACNUBc5ysl3X+d0eV6z7Q1UB9tfc9C4etXTUuQ+QGw
         y+POmKx/dsWtDIl3RXekBu52aV8sOxT6MkPyArQdC3fU/QUYHiFUSoUxqnMBS09G6KIR
         5I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863326; x=1775468126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipfpOKX2JiHD7zjNhC6JygPwjUI88vtU81EfO4uTgks=;
        b=lm145JTXW4wkXeDg4qZa6nP+fkjgPWofq7bE9P2Uu17P4YHz8zPnDecTl5bPyLaN17
         xmLXA/W5rqevRfGXv/F+F5Fu4y+1JVi0PhoW6FB5J0zxIOe+8KfKNMU/tXPzDIxFe5Nh
         0IiP0sVM+qveO1gBT5YERi4k5b5g8uKBBLDgpq8LYuLw4YRT6OA8Z/DAalAZ+6ahKqdZ
         jVCR1I30OlygaHpaxXkaCg5kytBHmiwNV5F4RJ+KNEUzITW6lDZ6DNcHJPFz6uvNLMZT
         S7KWNwBh13RRgPgPfh6aJafd7r3pUVK/0wjqHYTVt5jOa0/ifzKHQU0wzoY0Rl6fzRg8
         ctPA==
X-Forwarded-Encrypted: i=1; AJvYcCX7xsIg9bG72PrfqJtLIFQcUA1YVeq2CRvh/ni5z/RARwJvQzW0DJ88k5U8Z//UwfQ8EFTzXWrfJaiQGhDZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzjfnMQHR2kDlH8bpv4w1EYvzXMfmuVkA4xHrv5RruA0NWiZzNw
	dFpnHakh0EtlrIXRW3aS/57B6PaGaoCZTTIJIswZ5hJ08OZEYVJ49Y5a
X-Gm-Gg: ATEYQzxhmnxjuoE9m2EKAdzvTTi/iGIXn1rCPmMJ6pTKcqAf4p5jYg7vlyjcfKKF+wT
	VHa1ZubeU/uRm9y4XHDsUTQOgmQhqBQPaZ99uyNYodbyr1LnkgrcmzXicAf5R2CMWttM1UyaNs8
	Me84uP3h1M3hxkodYUDaQN03hnV7kBD+SixDcyKX7JewuAcI5YSwOPqpmWx2UfmY2y2pqRlC79E
	y5zQJ6gTTKpWHQGgDtnjqvhNDw4kPx+/EZzVsNRA6hl3IDtkn/hoLPLIdLhi+5ikArIDsbkJojt
	ubK/BgcSAoWEV6CAQ5BGzFfjGQhxQ4SX1pWfIkv3qPqgtY70RpyyBbL5RF+Q1/72xNg/Hkr8doK
	/RvP8WALluPjR/ASKEWbKz+1ZYXciNRKf/GcP2ATvi74QzweENaQKAB8dHfDjI2/FUikCXzF6Sh
	tlvjopI73zAZg9k/jWJuQ=
X-Received: by 2002:ac2:4e01:0:b0:5a2:b40b:3f76 with SMTP id 2adb3069b0e04-5a2b40b3ff5mr1554208e87.21.1774863325706;
        Mon, 30 Mar 2026 02:35:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm1564928e87.19.2026.03.30.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hadi Chokr <hadichokr@icloud.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Shivam Gupta <shivgupta751157@gmail.com>, johan@kernel.org,
	elder@kernel.org, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: Add missing newline to
 sysfs_emit outputs
Message-ID: <acoi3_Pv8x4-FeZC@stanley.mountain>
References: <20260328044527.10489-1-shivgupta751157@gmail.com>
 <2026032850-riverbed-distant-f96b@gregkh>
 <6c54c6bc-7c1a-4a3b-8135-eb9c5925c9a8@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c54c6bc-7c1a-4a3b-8135-eb9c5925c9a8@icloud.com>

The "don't break user space" rule is more important than style
guidelines.

regards,
dan carpenter

