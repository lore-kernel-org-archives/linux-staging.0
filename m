Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ABD250C01
	for <linux-staging@lists.linux.dev>; Thu,  3 Apr 2025 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696368; cv=none; b=DDp2Z3XlzdoZG4/0Z8SXDNUKuCRonbYjSjJDe7U2AI/Ov9UCA8+X3HUovnqgNz+JjZwfJW5o7A+frc0cQV2yIQFxUMsCMujd6hcE0LHCpCbr0kp5rlv7G77JnIpKH96Ovz/RL2ERUKr+2poPzpMVG90epCAUy5PQ2G7wsRTKIC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696368; c=relaxed/simple;
	bh=YjGjdrzIlECzocgsLLX2osfw8C9zWevju6nHuE11dbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZjwoAvVQa5hK62cEDUsVQpzviTj+QlqqnW/RFCPyWZg1nnUEA8tMbtEFhMDTsrqdH6ZOECbGKESlE+0y5uFscEU49x0hSQ3ClXtwR/moFmf42tJSHy0shr3kyg+ttk26/HTbeitAi4ZYzlJO8KD1cU1c169TSvOAn/H9pctiOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6WUNyZD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6WUNyZD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7376dd56f60so846446b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743696366; x=1744301166; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6CUM1YGBsiV36kXf/ewqX0Mf86Kw8OHi0hTrNzy0FCQ=;
        b=B6WUNyZDTF95s7UaT3aicKMekVArbg6CrpmP1rEwLByIb1WVRVx5kuB1WOStg/eOzj
         Qk6822VIPTyvSRxaiI3ph9fnFXnQD/PjJIzbyR1PmZJ9LbNwdtCqKPMkse72Af+QAhyT
         ZX1H1qp2bnENBARxBvMFR8TBTxjfyKHM0RsUni4UfAp9x3ZhiW5UiQRIhwk29IRfnmEl
         R+lgJpAL7Zn2xWHxisc4JRfG/RqF3IHcoJ46r83NILP6eRILHWhobthTtVxHtBrBhlYN
         bk0Fw37wQfEG52LKnK4TS1AsNGp5G09JfbfC37pJbynnwhmLBpYZO0UpNH/iIHWsC2eY
         3FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696366; x=1744301166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CUM1YGBsiV36kXf/ewqX0Mf86Kw8OHi0hTrNzy0FCQ=;
        b=V6DigWrip0CDmBmMbRGH93OHhDiK1Uugvmp9Y3O0e/GMoCCOVju4P0bv3Cf+ggwYlh
         bkxjTsrJfDLfyUVf8uiyj8wzT5FR8Q4POhW7gZTSxa59bQt0Fv7CFF9SLri3gG9xTTTH
         vvcp/tSEFrXHOjaQ+fL35vk+qlesqei8SsfZTXqn9+FJc5jBWD+utjy7tkU50iAuI9l9
         7DoUKjB9PQ1rGjXnSL9PKJlUFdwqqFbuxDzRUbR6LxYE0yPYrALo5kWHe1ygwvrvn60o
         uT5MMJdxMBsti6Wn2twzarjLxqXUi2m1tWI3xGrrEGkr7D/Bs33OjE8WJ8fcycADjbI9
         /M8w==
X-Forwarded-Encrypted: i=1; AJvYcCWBrqNLXA0StOmDRqQV2f0RXy/BXRCREFrr08MQQgMfXKTS2M3baONEQZcJ44bAR+mdnx4F8w0laXRpdmxg@lists.linux.dev
X-Gm-Message-State: AOJu0YzO0VDaRtHoxhu8syRDP4QBQNiIkvsc8bt4Va1URXHVVHsvX67D
	Lk08FfoJ78S4ol+dJjn30e9n2ssALVHpmwpTsOlfBmQ1TajDzvMk
X-Gm-Gg: ASbGnctd+1JyLS8p8DYstL4PQ/iZ/yLU8nvQPYgYjaqxWJo5HiICcwVgf3ElM+dM4N8
	8cVdazx/MtHF4KUgx+fENvTUkCjSdgaN2n2VG5lQlJhnkHt8o/TOib1dSCIkeNYlkqRZTTl76Nv
	1PD65UBChY16iAM5kCUo7xLcwD8yWYx9BcTMV1rXv0uZrljo7O1rRnAJTItvcwm9ZhriJDqe0iu
	pdwYVwH0MxHpghpNqZ9y8x4gzLHqH8hmqIrNBxQHVfUuJ2acm49zTEQLG75yAIPnYGgD3rHBYf8
	nK7POhTH96h7kp8p0vrcQJFSTt3GWAtjedZanGzlV1t/MuTXC+U0wO0=
X-Google-Smtp-Source: AGHT+IFuyj8PnUH67QJmQuVRh5chNtphraUZc7jj56nG+Xj2gh/lxU2i3HorqQk0IXcClAQRgY6fUg==
X-Received: by 2002:a05:6a00:c8b:b0:736:3954:d78c with SMTP id d2e1a72fcca58-739e4b49da9mr162206b3a.6.1743696365725;
        Thu, 03 Apr 2025 09:06:05 -0700 (PDT)
Received: from localhost ([2804:30c:1f4f:6800:9245:316f:6226:cc1e])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-739d97effb7sm1736215b3a.60.2025.04.03.09.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:06:04 -0700 (PDT)
Date: Thu, 3 Apr 2025 13:07:09 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	jic23@kernel.org, Michael.Hennerich@analog.com, lars@metafoo.de
Subject: Re: [PATCH v5] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
Message-ID: <Z-6yLe1GyNsFJlph@debian-BULLSEYE-live-builder-AMD64>
References: <20250330135402.105418-1-simeddon@gmail.com>
 <Z-lm8l1ILFuJE5YS@debian-BULLSEYE-live-builder-AMD64>
 <CAGd6pzPe71oY=+cy3WqKPyZ150q3pOM3LrPE0_ENeKgd+OvnfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGd6pzPe71oY=+cy3WqKPyZ150q3pOM3LrPE0_ENeKgd+OvnfQ@mail.gmail.com>

On 04/02, Siddharth Menon wrote:
> On Sun, 30 Mar 2025 at 21:13, Marcelo Schmitt
> <marcelo.schmitt1@gmail.com> wrote:
> > The previous implementation would set ctrl_fp if val == 1 and unset it if val == 0.
> > This patch seems to be doing the reverse (setting ctrl_fp if val == 0, and
> > unsetting it if val != 0). Was the previous implementation potentially buggy?
> 
> My apologies, I seem to have made a mistake here.

No worries. It's okay to change/update device drivers to make them better (e.g.
implement new features, fix bugs). If the proposed change was fixing something,
then it could be put into a separate patch with a Fixes tag. Though, I had
another look at the datasheet and my understanding is that the freq bit (bit 11)
should be set if the user writes 1 to out_altvoltageX_frequencysymbol (ABI
documented in drivers/staging/iio/Documentation/sysfs-bus-iio-dds).
By the way, I now think my suggestion of doing
st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, !!val) was not a good idea since that
wouldn't follow the proposed ABI.
Anyway, it's okay to propose more changes/patches if you want. Just separate the
patches according to their logical change if you make more changes to the driver.

Regards,
Marcelo
