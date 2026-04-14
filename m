Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE223537D7
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159374; cv=none; b=Ce4/MgpkkCO+9on0Zeud5grXerrI1/mGY6nTh/N3rWbxjeJxDFPlHeJVZAom0ApBERQgDMqgtY5CfqRT1F3aVLMoZo4ntEO9U/OzEvX1BMqMBewE2olhdg04/5uUFk3pbV0NGvXvApIEB+IzbT20t2hk19ImmixuqtgOjkpWi/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159374; c=relaxed/simple;
	bh=I4E3BJ64QNjlDpPRGxu26mcEgdKOcJ4HAqG0DuEZpuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQpQ+5OTp738REY2PWfJhawgwCOzT9Ndk4S3hhkZQuiaMbSD3NwqAf2AlLg/oUeyKdXHZjdz39XFmc6WxK761CUKKUH4gk60v5EQGCcMrgA3Ow1UYP+HcWaHn+Ds7HWSPixABgucaAV/PBNLWzJjNbZkbwDn5E05JcihBwLNWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tsz2vnLQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tsz2vnLQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0046078so52995095e9.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776159372; x=1776764172; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kq5csPkEyD+lw4ZkaxgkRlgf+I1PvGk3IpXK+2wCzQQ=;
        b=Tsz2vnLQ7Ze3uP9NuDd2Mg4ssrknF8CclG9/aCJAmLzvvKM9H11o8DCT5QN9aKuYBs
         5aheUfhhLnEoQ6xK1NeQnA+wLrN7ZotT1bSscYbx5W7d9ZLb0AlagIowwfVnDb2CvXio
         D7/oAOMwi/vL17jKkbiXHQOVmHPTOZL5XdlPZ81ZuOheY5kX0DkBNDOeyTU+vVMtAfHc
         FKtzfKpiMkFfk6s9A90RdDUKYp9qotlT7ijCQX1jSTMV6RoWOixVelwECuYNDMee6Gss
         TgDMpMwVAoFdHiv/dtLfC03TI/mUzWg2ioCNc5zfnGz6MRH1S+rDDvUBX6K/QsGS2LtN
         jADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159372; x=1776764172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kq5csPkEyD+lw4ZkaxgkRlgf+I1PvGk3IpXK+2wCzQQ=;
        b=fqjBhvfURarlsThM8IAt1qzgD5HWMolHlhAAEBDDtW4a78aT995myukDdRli5LpT3h
         dVG4du+lrsQsg5dbwsdDHiP8Bfwju5R5yjncZCccsR5Q86z29NMizLEkpzNQofj5MeeQ
         lztVofpZvyUAtVKGfVIKzJl7+Xi/UKJhIVxhrN8kwy52T9M8YqbtDo8OduhxJKFJO3qD
         dGHqHetGGMB7+IiAn/92fEJBiZiTUVT9omEVS8NBOwhUWmev7aDxLGltMtI6cqKzcv91
         ja/l5+ZNMt0+4ZY3fKqDzya06liA8SD9Kbc7i+HhOWvJUTsKWiMNwoz8lQlJqQwLhvpA
         Uv+w==
X-Forwarded-Encrypted: i=1; AFNElJ+dI9HjVRSgKZR7BYUWp5GtYl0u3C/9bA6mOfqKlSV2omuzYQxoeu2kYJjd5QmFaExxWGb+EMClV3s5NFKA@lists.linux.dev
X-Gm-Message-State: AOJu0YxwE/WEC0UDQ1qSJvSmosbKCOCYrUm5lBPM0PEnZMyzNSUFSz1I
	dEU9sVRE4da2lOyxu95cAc3YZ74Lu2hiHJFzGROc6JS5OeybMFmit1lQ
X-Gm-Gg: AeBDietn46AioRTaO/DA197LROjeuz0oWL7R7Go02qwrRFiEN+9ntzmoJBynNvUO9YB
	+zGvH6uWqGfE1Ks6PKuaMXyMEu3279a+jzGohaN4KWL34AMJ0kzbHTEFsXJ3orkPYDarA4lnDUN
	AK4cwndZbPYA3zA1H/zWr/5DOiq2zWlPxUN/n5BYPxAxckF9f5i62JrCe5tkOjc3u9x0np2lqSr
	vC52mNhQ21NMKaZK83/QMx4Rys0ICrf1aZFLmgjhZiITbpYz8C4p+AmJtAZO371NOsHCw3zYRko
	Ud2FCnzbpff+phPFWNyw46eoQ7ygFhibhNNvOwlspj9ku4qTivGigfZLWe8peq+soMVTfSnspAl
	8GuZ7vU0dBxmmeRqUsE+BXjnRtuhH1p0UxZnIGKXb7+nFv0mK6kd/aRiO6xraCMR0tzdRbtsuGy
	hlu+vLjEdMclmtitXOr8oBqU4y+kM=
X-Received: by 2002:a05:600c:c088:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488d67bf744mr163761685e9.4.1776159371565;
        Tue, 14 Apr 2026 02:36:11 -0700 (PDT)
Received: from localhost ([41.210.143.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ea764eff2sm2500276f8f.27.2026.04.14.02.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:36:10 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:36:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] iio: frequency: ad9834: add mutex_lock() when
 reading st->control
Message-ID: <ad4KgkcR58lQwPaD@stanley.mountain>
References: <20260414091250.1295-1-joshua.crofts1@gmail.com>
 <20260414091250.1295-4-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414091250.1295-4-joshua.crofts1@gmail.com>

On Tue, Apr 14, 2026 at 09:12:50AM +0000, Joshua Crofts wrote:
> Add mutex_lock() and mutex_unlock() when reading st->control to
> prevent data races as st->control is actively modified by
> sysfs _write and _store functions.
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---

This doesn't matter in real life.  "Oops, the root user tried
really hard to do something stupid and got "square" as the output
a fraction of a milisecond longer than they were supposed to."

Is there a tool which detects and complains about this?

regards,
dan carpenter

