Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117CB3C13F5
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160267; cv=pass; b=I40iGCDdORQamXOEDSfs37QC/tGig9dtXAZcwtvhkqdXJED4zVC8b59NH6iMWL8WSBw0lqh39r4tTD4xvU53XyzAQgUsTsgIwV+LTAadrPypNq29zATNL7yHzI6EIPcdElReALlNOTupOkP2aJckdWiNumlmOa8vAmS1qiQ7lcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160267; c=relaxed/simple;
	bh=4LjW/qXhlw27jyCxexFHShkpdwDpih2uFl9wB6QWweU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8K4HBRRbG04rxd9cWzWDV5N2rwFRh0oAy7GEFrrLFSgIhdABrGF8WjKLFvPTWfdRXDQoMwjFd4RlZ1ZQOoSR939tlO5+P6xUgbgLYs7nwHC4ptGZVDTh70RvEnSeMt2vKWWbyEgfEzVCxl3+F+6O0Qdu/wiGclr9YrpvO3hR2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoMQkEgM; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoMQkEgM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7605ec91so1872224f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776160264; cv=none;
        d=google.com; s=arc-20240605;
        b=O+z9W1yDkFdibiodoxvzcKd4oJ4lkauYziU0JIBvl58CKV1ZP3tHEG6l12DKh7wB/N
         52de4+IC6ghly8a0XaTufKvn5OqxIV2VE66gljrJ2sTfLc1Dh8wY7hNEn/PugIughvwB
         2HH56wvycouvSibdbJ99m7Rbgmxfx+YE9soFiVSIJEeO3EXfmLOoIAXdW5PVTkpPWgrg
         8nCO79lg/jFGVDd8BRPUOpkQFGpkK9S+DARxj/YtAEV6ysA4xOq9qXp0HCdDjTLz1Nca
         efZikggTZUfFgxRxMzn82RpIOY02AkFC14yw0G+1H8BjeciSRhIeTRVO073KXuz36z7b
         uw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kl1qXM31lG42LlVmPxw85Pw2BbaLgJlNP4rATMlCHS0=;
        fh=bhQ54m7Dw/nxglvupnqf8Fsct5X5iIghlqyU8tAO/OY=;
        b=a57hoa2Oe/bKWsWpOWKgNSFIYrX+WCiRUprms1dBz9Wt+/luIccTV7F230AkKhpIjS
         MN9RlEJ7xMoZXaEQitUJRXuiL0EZRmX9ZsBwo9pVkyancCmtrZs/MDg71by6nP3Iyn0E
         /oW7AyKpVzdXLv+EHJYl2kmwidKeBsQJsoO+GtyiEsAuJagSS2STHRY2i/kO2nbbZFOj
         DpLStPSkWKPgWyMcBURRsQwFCGQbW7fvwuaBXol8yzYU1OYLVuoMxAgwNHNGFSvRo+Nc
         b0XRxjH1f0brp9LY8DidLVkIi7vosAnYKzspRyDg3lrdQw3Y/70bMa70tfCOvRd8cJV8
         zuXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160264; x=1776765064; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl1qXM31lG42LlVmPxw85Pw2BbaLgJlNP4rATMlCHS0=;
        b=XoMQkEgMqRzM3iupkWjH+hVjyq+b+qLskbW13Wst9VPGIoXGe3P6ixwC1fM+nLscJt
         IKHODtzoIXxQ7azRfMq45OCacOCU5QjtGDI+UWGBTRnDvkpxoxRrFZDw+jpwtUrVq7w1
         T3+SqKl6lemLuNoo/YjtBNzNQk8xNjNzyWENX1AXRaVjv+FEeVaYaULKZI3bE6J/VYgx
         Or58JGhZQaA5cNSg+8GDY7Bb/9kRbnGe04wPk+wKTyuf1C9rbQdcNsWas0RHso1VNLDq
         k4yHiHe5+qYsWGGiMFLeuozJC6IVJDeyTDKKzWiZHiotJtlkAeMQURnShryITbCcxDhb
         eNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160264; x=1776765064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kl1qXM31lG42LlVmPxw85Pw2BbaLgJlNP4rATMlCHS0=;
        b=c1fYPvTE/UoiP3qV06h8TrlkfdWf6+oKSK5uSF10YZoPczHV053053cJl4eNllwOgY
         LteeRccbv612PeZ9ebgbYyxV1oxIH5WM08U6NuXL+d7qzhzLwQCd+E/9OQF5N+C7js2i
         /7SIZirnS0g00pt8nkzA0bjUNXhJEEHJNpeCe0JMNvmWV274R8wdXQsHiiUP7aZszQIn
         UU5B/wcNo9a3S1ktLve236ulq290hX9S+45BY9ec46IWYPrQw/sNayssCziGFZe5Ff4y
         3jUr9ySpLhTeZtHLLfKJLzICpowx8gfzCzneN6cpg00/+Tr1N+RVrorpzreWpXynzObf
         dn7g==
X-Forwarded-Encrypted: i=1; AFNElJ9TesLcS4rddpZv+8/d8gxZ7eNMGgrnKuvJv4ycu1rqJ+N7sAlRgoxEp1FlX0jiihcbtC79T9Hdxt5eXDBD@lists.linux.dev
X-Gm-Message-State: AOJu0YyAJDHrY0fuc45gd1U+YvBTFj9EoWs9q0EkY/N+HNXNzRrWXTpI
	HpXDn8xFNOjjtfmnbXFIH9WAQaq0hegRF8zEqQ9KpJ2mN7cta300NUPMcmnytYU7RDKIxYckB1L
	oMk1Lf8qXKItz/7Xxo6yy0Xy2LzLl2Vs=
X-Gm-Gg: AeBDiesPEjWlW+48fRrhtbeedyaGQyUUq0fD7aqk6x+kQ+tv09KBxcwTMgLCOkI1KCE
	S8ZyiVINp5o2MwtAyP9F5DIWkE2p9NgyCtO9JufY/tBTvz2sq7RijFl0ywrJoZUykpdGIzicXeW
	VXt9sDBcMm0oJAJ6v89Gy6hikA71wsehcqs6LA4HV7HcJZ97J+OCjdcl9lKLZRwh45UTt9/pnzY
	iaBDKoeYVZWpGatUHIP/+sixCwoowdFlabFhpgUmYMTZ91tKxb4MHvlXS3L1F0EjHxReXY35hgM
	6WnPX8p9C+K3i6uQZb4ba5xQvv1FMIyIZ+7qGyyt1K2K6ttA2grfkA/P+DvKk+0vhoINZIGKQ+a
	8SC+CLsXMTvJ1SlSSvWPjVq2960Gfheezc35LB6xTSFLl9pvUGe57jvsJVFazbw2UKOz0wAEzmV
	qmS9Vrw/0QjHhwdXWBwjDV0P7wEZ4=
X-Received: by 2002:a05:6000:200f:b0:439:b8b2:fabc with SMTP id
 ffacd0b85a97d-43d642a1f1emr25593544f8f.21.1776160264405; Tue, 14 Apr 2026
 02:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411123512.84739-1-joshua.crofts1@gmail.com>
 <20260411123512.84739-3-joshua.crofts1@gmail.com> <ad4MbnpAfBEXKDzm@ashevche-desk.local>
In-Reply-To: <ad4MbnpAfBEXKDzm@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 14 Apr 2026 11:51:03 +0200
X-Gm-Features: AQROBzC6rguiJabYsZOY4_RYkbulpgJEphpTychgiYWAeFDC4PxCQbEE7STdgG4
Message-ID: <CALoEA-ye9aKD4DyciFNZBW2TSd=pw162DD28rdvRw8O2OJvcqw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: frequency: ad9832: simplify bitwise math
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 11:44, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> It can even be just like this:
>
>         u64 freqreg = fout * BIT_ULL(AD9832_FREQ_BITS);
>
> if I understand the integer promotion for unsigned types here
> and the * operator correctly.

Sure, at least I'll ensure that the reviewed-by tag is incorporated
correctly.

-- 
Kind regards

CJD
