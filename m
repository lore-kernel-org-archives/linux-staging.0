Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25B220B11
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328328; cv=none; b=c/nKidfVOjVJE++qbEYH9kIRQ3ZL49u8hhH9AxpdkHVpCDimmBgqISR3IEJMn5c0jKhmS5/7U07nANMmFeL6WANxOtn7MBFO5HtmxgvLQIB4nOeC45rSx6BJNkPJ/YcgySJL0U0jtKlD3mgyFb9EomRMY2nNfYDJOfOR4moeQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328328; c=relaxed/simple;
	bh=NxiEFIBjTY1Do9kn5kKP/w0Pjgi5SqwX9YC+ZSzfghI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwpdLsvywubDxMIFQplC2leg6CaU1ps6wkaTUYZ98s+tHqOqHWWzhed65KBWNm/8UEKRRmnid9NvhMr75dyMj3nCF2FSn172AiTsZQo70+5zzd50+szCfgKqXTZC+qBZhcjKy7isHhjchIIcSdNMb10NxgNohc9E+soJiu95M60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v5GMjgGc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5GMjgGc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so6278355a12.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 23:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708328325; x=1708933125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2UbzHAgsifZLHIRrIwdYYz80lAX1K8yNv65dXow/Z0E=;
        b=v5GMjgGck3IfeAnG1cpuImjOHLieMqtVV5ybfN0Ym0hd7RKdlHjDtxxY7+7eGkaHBT
         4uFPxEM9VIh9Hp4hJvG1tgT5zhh06Wv2WxFQLXeG6WQwnUyTJ2X6lm1IUNRuNai7WUlk
         DMiY9j6iVKqDkiv3uDpa7xBlapyLwHOOmEscQmfFtJr/XpRsilxunU0hoUQFuvyyLBP9
         0ZOy6cA4BlTAAbKIAFZe/xN0V7Gl9lqFZ5mIRPXsOPTjKMenIJl99jKuXo/QgeXRfXnp
         YL/VoGJMHp8ckIwyPkQHhWE6NHj0jGGDssZFViI4mHZdus5ZfW/KfnQ83vMJTj7t4VBr
         3KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328325; x=1708933125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UbzHAgsifZLHIRrIwdYYz80lAX1K8yNv65dXow/Z0E=;
        b=ETI7FK7hODbRZP3XPgKts0E4rnknLBLFTnNR+C3nO1iINOFI1i4F9yPROxPkaXgwhy
         86jbQIlNKEalprUgklZ3tplzB4bbK4lVy4Nd1zJvO2d3mw9EYU6PeDy/wVRvjx3KbOz7
         rJRvfxW1cgad12fppMx7Udhpa4KEcxtpNA7KbyDxxaWdN1HF7aIYw9zxrttL7ViXnOY5
         zN+JOgC1pJQMTApvNLmIAJFw3mUEw1fCn6aZDr07i212Ikq07p0lnuCkt0SOR2AGukNT
         icCLeAmF3UwdVdUj/v1ugNqIzQ05c+Zq1Wq/e81A6c8jHIHhwuPFmy6694OW4V3k01d7
         Wx0A==
X-Forwarded-Encrypted: i=1; AJvYcCWcrBwicRcCEe+P5jQnCuBYfdpwnr/8qYB6p4wO+qDeSf+VTz600vrzRqxLcM388IV9X+pnH/voveZ4HhUwYsmEztuQf+LP3MMqkvbSIw==
X-Gm-Message-State: AOJu0YwVX/2oAoqKnBo0WYxn1y4NlEQPJYICmfJalHOXQSBUy4vRl7u2
	C6XpHei31MPiQuR1XHUQ2YZdDGrdnUKMiihlDEwETfsTHmabBi59eQ24iV3yLHM=
X-Google-Smtp-Source: AGHT+IFKq13yKKtl8d4bo7fen+xKM4HC7jliizmOlN64Kq5IgE0uttWwGfdyIGLRLU/CnfB7DBMxLA==
X-Received: by 2002:a17:907:104b:b0:a3e:979f:fd0b with SMTP id oy11-20020a170907104b00b00a3e979ffd0bmr1021993ejb.34.1708328325238;
        Sun, 18 Feb 2024 23:38:45 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ty13-20020a170907c70d00b00a3d60daaa72sm2654007ejc.41.2024.02.18.23.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 23:38:44 -0800 (PST)
Date: Mon, 19 Feb 2024 10:38:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Moritz C. Weber" <mo.c.weber@gmail.com>
Cc: florian.fainelli@broadcom.com, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Staging: vc04_services: bcm2835-camera: Fix code
 style checks
Message-ID: <510574c4-ad26-4fc2-93c4-7b67737f8eb1@moroto.mountain>
References: <20240217211246.28882-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217211246.28882-1-mo.c.weber@gmail.com>

On Sat, Feb 17, 2024 at 10:12:38PM +0100, Moritz C. Weber wrote:
> Resubmit these patches to fix multiple code style checks for better readability, consistency, and to address errors indicated by Gregs patch bot
> 
> Moritz C. Weber (8):
>   Staging: vc04_services: bcm2835-camera: fix brace code style check
>   Staging: vc04_services: bcm2835-camera: fix brace code style check
>   Staging: vc04_services: bcm2835-camera: fix brace code style check
>   Staging: vc04_services: bcm2835-camera: fix brace code style check
>   Staging: vc04_services: bcm2835-camera: fix brace code style check
>   Staging: vc04_services: bcm2835-camera: fix blank line style check
>   Staging: vc04_services: bcm2835-camera: fix brace code style check
>   Staging: vc04_services: bcm2835-camera: fix brace code style check

These are automatically rejected because you sent 8 patches with the
same subject.  But really they should just be one patch.  In v1 Greg
complained that you were changing a bunch of random stuff.  It's not
clear what was going on there because it was random text and there was
no way it would compile.

Was it an AI generated patch or what one earth happened?

Anyway, that was the issue, not that you need to break up the patch line
by line and send each line as a separate patch.

regards,
dan carpenter


