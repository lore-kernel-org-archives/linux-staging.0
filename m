Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC213A86A
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 18:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713206654; cv=none; b=ECrxZhX85uu1WpfYpFvZo3nzFCMTNoJDoWm3PPxqB3Ko/76BYKv2fy0/eqCgswpRRxdNAcEC1FdjP9MbFq2uO7I/YZKURP1HEcJHaBdjixmpA0NF3PeJ5xruP0SOzYHkdAfgzOJtl4c9hABnL+r4xyRgyaZjSy3PciJvok25CmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713206654; c=relaxed/simple;
	bh=60i9If0tq0o2mZLjvpsyWL4GCs+3OULSbJ4F5ixEQh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM46RRfKowwyY8m3q++mfo5WjKFr9BTV5mbuBJK8Mba6nhtffKxCtBfMrpFc7HD14brN3pCJYX56R5kukVMTT1QG2b2qhlc8S1L+eHGS6MvGhEniAUJP4acNPMklMfzkWlxK0y56IgiwsKFcNXtGjH82hE3oXgsZjBHgZUmMyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aUELXZ2l; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aUELXZ2l"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516cdb21b34so4537731e87.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713206651; x=1713811451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oD18VQRDP+ap0IgBvoFVrf3gThgHXlFnC51QDZapYN0=;
        b=aUELXZ2lNqg7CcRovuwbQEz3BZ540JvKWuNZZakKIwrR6x4QZXIzOV59h1yIAw/bVV
         Qk65BwOOVj2FPHh8wi66LQ8Jf0Xpm7bPceb1m4zUknzxZzWsZo17hHrks7s+x8OxIl7K
         5KHgh2KQcPNvmzAXiB68Ez2i/qQsR6OFossVxvD8nrLc7yqhoHhjvSjRE+4qu7SGmE5s
         Vx7BbK+WzO8pPfi2c0H04xShQ+mMYTY1XLTLhr4os3aDD9UvTYs1Iu7tzx7tVOZUbGu2
         4Yy+e0JW74y2bBUXxZE9KnmTvufTAdFuTTJOcy63hFKh/DNMiLQ4iDpLRuDSCiPKkTG5
         R/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713206651; x=1713811451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD18VQRDP+ap0IgBvoFVrf3gThgHXlFnC51QDZapYN0=;
        b=hZjX/0tLr633CTJq9uGqdvEeIyEgMX6Qe0Jz3Kxvvxo5cRkEmiH+kNOBkvwrkU75aY
         jGUBLPzoKVIO+FCzqweXGfznvDJfQJYbtd8y0rjAm2G4n/kfe7Smz1YQtd6thI/KDeXM
         xnuTT/gXZijflh0anxUiwAcBKrw/mRmWh71qFZkIUdQx4iafPrGag6xlu7fVZe2+AhnU
         HiezE80QsDi5+2kHOO0qfpSpBTEzOv4vDmVRFXn5rdnc0zjWL3mN0iux7T3iCeGnFD0G
         +psNXyUPNxJSRnlpl7lI+0GX12LZMGMib9t8/XrItOR+BeLWlsREwLE76a/WHYUGnxPz
         440w==
X-Forwarded-Encrypted: i=1; AJvYcCVPgFb1wbM1CTAi3w6CMFLt6Asp5XtKZ3U1Zlw+glr6Uf0hX7kxM6ujkTDan1+9ZvUw0VMHszyHiFfUQ5q12KrljKuFf+g4Eomx20xNnw==
X-Gm-Message-State: AOJu0YyaGcrSXRLiwTegVO9/RLsUzAMQOjypii3zwJDzVOJcUV7crn3S
	SlR6sw71YrLTW5HurUpxYWVkL3508UjttnMk+GrcV/ZAyAYXDFkl4SUSjhhPjXc=
X-Google-Smtp-Source: AGHT+IHknDAe+KUxipXpx+FV+BhpaJIDcUIdMXSJOmosuICRnKv+l0P7B2XTRrhaFBoyLOftrYjAkA==
X-Received: by 2002:a05:6512:1081:b0:518:b7dd:36a3 with SMTP id j1-20020a056512108100b00518b7dd36a3mr4385673lfg.54.1713206651050;
        Mon, 15 Apr 2024 11:44:11 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709060d4a00b00a46a9cdcfa5sm5742455ejh.162.2024.04.15.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 11:44:10 -0700 (PDT)
Date: Mon, 15 Apr 2024 21:44:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sumadhura Kalyan <opensourcecond@gmail.com>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] staging: vc04_services: Re-align function parameters
Message-ID: <1791cc7b-2ea9-406c-b958-61f83736a986@moroto.mountain>
References: <20240415171138.5849-1-opensourcecond@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415171138.5849-1-opensourcecond@gmail.com>

On Mon, Apr 15, 2024 at 10:41:38PM +0530, Sumadhura Kalyan wrote:
> Checkpatch complains that:
> 
> CHECK: Lines should not end with a '('
> +typedef void (*vchiq_mmal_buffer_cb)(
> 
> Re-align the function parameters to make checkpatch happy.
> 
> Signed-off-by: Sumadhura Kalyan <opensourcecond@gmail.com>
> ---
> v3 -> v4: Repharse the subject line.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

