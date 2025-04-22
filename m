Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8711EB5F0
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309060; cv=none; b=KRf4xdnU6G5ed11edV9UdxsYhcJtINPOQ5JV2HxYHzuw0yLNLwkkelZUQ9F482jKvMSnLH3knZwDRSoyv4BYc4TqqrZjhAiOIGQxvH1+6Vcj2L2kiKdQZcRlmdWYiWXMsIK9erZYvs5Ft3ssDnfUja1DPFQut4h1YEorUfn4yVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309060; c=relaxed/simple;
	bh=YJ5ust15cgiLPQ19Llb8Yxmg2OdhLgYoabERjHZpRUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAhfUUjRdllAQuzgcO1P9web6oTrDbrJBhxQe5qnVXdLpszKdQlGvYHajc4w39dhpoRObgkyCh3y6ZEMU0XicYqC9CV7V87DRg/CmjTmC/6u9YGosh9+gAUKf9EhRAkrQduj0vBhM3OnzyAQNvKrPjohBTEPEgQ4+P4cTXhKTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5Tk2g14; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5Tk2g14"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39efc1365e4so1595006f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745309057; x=1745913857; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIQ4PP9wG4Vz2xc0LFXVcoklKGB+kLgAg0ewlEvxW4M=;
        b=s5Tk2g14yjm4K9HTv/+vgrB4HnVVsadGbmgW+/a0E5IEg3ZYqeLCbpi1q4X1sfShD+
         cS+RLXtfMEGmrNBHitIJKllTvUM/BW7JitexInZ5+Z+5CYfsfndXLzyB5oXno8Cj66Lu
         Nf+ijfqs2D0dMcZwDYi7Z4RvBY203r5LaPTPEwOI68RCGaAQNywXwSSmu2atezu3z58x
         Dzc2w5TPE9Cpsgs3uvgKH7Lhbnikr0h5IgDufAzinrHAzNozwMX5qm6unqeUeQBkS95q
         oTyV21TU6yHMGZ+L76pbx1RuQrM85I4z13/20UcTJjSuRvXXki2IE4XhXFvebpBxO+q3
         5qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309057; x=1745913857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIQ4PP9wG4Vz2xc0LFXVcoklKGB+kLgAg0ewlEvxW4M=;
        b=AxTfuOg8nNpToOaHlzdXmo8r1j86kV8nIYGG+1uO0sxRJcXM+m3LhDeIE++OY8gmhY
         Jcz1RrWFteTb1LZurmPMXGvOY+Yok8Jz6I3SMqF+s51Uy7NzE0+sWiwU912lUQnc5UY0
         QlqffQbav21SGWIF0i7MoVQCwSshRzl8yQZJrjsQVzkLvV9Mgk4+PLejMtMaErzqDPVv
         Q7fo3BkIHlBmwO1m63twe8MZj3ggwdBmIvl2GohwvHIOOxw9dEwl4x+kzVZtjyi06RZK
         jpvuUdmGgpTg9B2rMwIPDzVSRyl1aTlgGjRWNBdWGFFZC97K+mIGvlVhxDWQ/5V/kyEW
         w6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlQClYH3KCS2a3uVJlptQTFO9z6nR5iqTS6jBbsAysBCGgD9t9mZNN/eG4qvlDCFSgRlzlzc5+BkIAaCc5@lists.linux.dev
X-Gm-Message-State: AOJu0YzHM3wm7NsdzsKfWhLCWJFyHRn5SKC8S7oypjMUTTU9ZlB/Jcsd
	BYOhjRcY8xDQUvgfar44zrGf9/8AQub0wc7XAtgCI34suzLR4pRuhmeQzG0dmtU=
X-Gm-Gg: ASbGncsVu0FxZtPc3JCgSM58YlyX+7tg5MWnfwz174iL2rY2/KjrGeu1em0y8aEi7Ic
	H9c9dzfqESDygIJcjCUWubD4OttZvBKfvnwZPIJ9+JyB9Z5PnWdEGUg5FjayGwmuMb+DK3HY/ox
	RGOy6lGp+W/UGaPJw/jYz0RmJj5pzDmsOyNKIYeW/Fo9BRX5aI3gGQpB7imi9yYlHZWJYnQN7a7
	THRh1SFRty97FOM5AQrTK1rm5osgpq+AXA/yUO031Ts/hXvj9QvJEbU3xTpuXOu+ntlV2lvUqEN
	RK6q8YCuISlaDoWRM5/cVqFoC9d1xUwUxcDmHRK27g7k4ZsHnGUPFhoW
X-Google-Smtp-Source: AGHT+IHr33bB7haku99h9x2iuyH51ldW8W+dBOIW1fajfkUYidpN0vXAbVL+B51YDs7qeUHWyJNcQg==
X-Received: by 2002:a05:6000:188d:b0:390:ed04:a676 with SMTP id ffacd0b85a97d-39efba4b204mr10956448f8f.22.1745309057390;
        Tue, 22 Apr 2025 01:04:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43315esm14111416f8f.26.2025.04.22.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:04:16 -0700 (PDT)
Date: Tue, 22 Apr 2025 11:04:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: atomisp: Remove unused
 atomisp_compat_ioctl32() declaration
Message-ID: <260a005d-a1bb-48d7-89ec-ed1b6b151b4a@stanley.mountain>
References: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
 <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>

On Fri, Apr 18, 2025 at 12:48:18PM +0530, Hardevsinh Palaniya wrote:
> Since its definition was deleted in a previous patch[1]
> and there are no remaining users of this function in
> the codebase.
> 
> Link[1]:https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@kernel.org/

Instead of a link to lore it should be:

The atomisp_compat_ioctl32() function was deleted in commit b4c650f1af68
("media: atomisp: remove compat_ioctl32 code") so delete the declaration
from the header.

Please don't say "it's" to refer to something mentioned in the subject.
When people are writing commit messages they sometimes treat the subject
as the first sentence of the commit message but the subject and the body
of the commit message should make sense independently.  Look at the lore
link you posted above.  Can you even find the subject?  Most of the time
when people see a link to lore they'll just read the body of the email.

regards,
dan carpenter

