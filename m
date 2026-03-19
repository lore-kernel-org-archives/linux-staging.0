Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E93A9002
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908340; cv=none; b=Pswq/Knj0P739Jfp8bTZsZBz2H9ETm99N17APPPM4BpCI1DLqDoHUSLkuB7+nHF+rIA5C3CS1ECiR50EcNkwCWnk10FvvwxSKd3vBASc8sY3zZMmAzIu0mBS9IejYsCo2Bzcev/SD8SNEXtbkaHSTLbonr18hpHYkhALoZmHB6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908340; c=relaxed/simple;
	bh=yYPFeR+9rZHguoj4BB9SHq5TLXklflUZ5MPugf3pC5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoJ3oTAcwCVnpnXzN2tAT5Cm2fTFSEs9r1LzpMRx11B+hzrg2oSyjF3WBwzZDCqzNsBH8r1KGAAiPfDEiwZXb4cFkOaAJuAUdDav9mOU3F/AfH49+3avMX90vOm1QuXWIJH17vbxCpjYtGRlNs3tt++KJscsLixFhJZsusxcx28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlIe+H7g; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlIe+H7g"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b9b1900bso369019f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 01:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773908338; x=1774513138; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=amjYQZfBKkEkQUzU1vC0opHZdoT0Y5MlykYOj+Aru5k=;
        b=vlIe+H7g4gPYDL6xmI96dPL00IclNd4nFaebxCw/J1T3CAgEOrjNWevVHHXjIynH7d
         1n59nSFRrG8y9PxKGed6tlXNxaDFXb2ljG+OfN8hrdZEaTgxuatQRQMq+9EJb5eeOtYy
         P/UDHmGH3tAZDxKDw7WkTaMBe3MmsPP98IGMFjK7KGiHE9jvzk1bvD07YILmbe4MOG8w
         RM0TCVroh1K/PmQjz8c3qFZAYQKybglg2TXucYGyLGLqpUFN6H6gStlS8k5nFR9htuDo
         Jbh1jfrDfWfp8iyRcVrWmlA6llKbAkWQ7KLuUGsEir8nXIuNNsej/i4V1bUuJpRI5LTp
         gosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908338; x=1774513138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amjYQZfBKkEkQUzU1vC0opHZdoT0Y5MlykYOj+Aru5k=;
        b=Ea8mQ4E/jOL7QdTarWByNHkWlVEBhCNrAo4wekpwYVlVPs8jGyjg1Ui8qJFeUDMVdL
         tdypwxrUCKYx76pi+XNLmwqT8ovxMHTfCkK3S+0LInNVyTnXhisAqY65HU4b/ky8Nq5N
         Wl8g/MthTjoZgXltpqYerf1wVpJYirBmx5ROViFax2kNUzrsc5msOwPinMflbxMyUKPy
         MId1gTeqt2s4ytifao2ViLPnmm++Lu+P9bTqwhgF5cpS2DKqra1DgQEWwHILoaKM4Llt
         +L/ZAF8UwnT6mRaDCNHTD7Xry75O0M2QExlfXoZMDe5EBSLiZLyNJh8FtzIcH0XJWOkG
         rRFw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Lld+zvaEUhfQzwHf4eTZLFYO/MuR/qWLoQaJGNE07WhLHy8j7uGDUc4ROhaJd2LGRx5ZljVAYzXo2lEz@lists.linux.dev
X-Gm-Message-State: AOJu0YwtXIMajvn+e9SGIQzXD2Sof5YwcrGDv38p+P3P6v/YrM3bLvYO
	WmlZjYSYsk4vXRAtd64BoOFCjgma2SMmrDxCol+a49j8SSUBux12W7wKFl5igWLTuP4=
X-Gm-Gg: ATEYQzxPPmz3+BXEzrbj99AviJm6EAuYosPBNZYVs35YZWoOgll7VuNSAdN3/ttyG+i
	OdIYBXkY4S4Woau2ljRYeHSJ8jNAr6dXnEkt6QDUVHykcgPDbDKEAuKrnmySDmj+YB3rVATwaCd
	9ePem0R0sYoOyvu6J8mzFmyoVVBEVZnja8muT5R0zF9xVb1nZ4EOz+Ieu0G3pk1B9KVKno5jM7J
	TX9a+j4o4bb6C7m8EOVaQW9noBnOYnXNnPBoqp98oXcS+beNLoBYM55eFKnDliTbevaCt++MSfb
	3/rWBTsV/EzED8DJJF9qMh+7RmmdlsSsHssm971R1LRjFTfPA7M4gqbRt7zua6GwX/MT4W3EbJb
	wYU7R4W4YTvpZaRJNmlBDiGYe9LjBTkNPKa5+fOoQzq19sOkrQ/y4MKHf07EZaUXxAALQpYH55A
	zYCuIkrpAoquzipDTP5b4I6wH/uMH3
X-Received: by 2002:a05:6000:2011:b0:439:b486:ba6b with SMTP id ffacd0b85a97d-43b527ccd84mr10947850f8f.39.1773908337569;
        Thu, 19 Mar 2026 01:18:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51899622sm16181985f8f.28.2026.03.19.01.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:18:56 -0700 (PDT)
Date: Thu, 19 Mar 2026 11:18:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, kees@kernel.org,
	ethantidmore06@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: most: dim2: fix race condition in network
 info delivery
Message-ID: <abuxbTrdWgKPvZ4F@stanley.mountain>
References: <20260318164906.262225-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318164906.262225-1-s9430939@naver.com>

On Thu, Mar 19, 2026 at 01:49:06AM +0900, Minu Jin wrote:
> The previous implementation could lead to race conditions between
> deliver_netinfo_thread() and retrieve_netinfo().
> Additionally, multiple interrupts could lead to event loss.
> 
> 1. Using local variables to store a snapshot of the network
>    information under a spinlock. This prevents race conditions between
>    deliver_netinfo_thread() and retrieve_netinfo().
> 
> 2. Invoking the on_netinfo() callback outside the spinlock. Since
>    callbacks may sleep or take other locks, it must be called after
>    releasing the spinlock, using the previously captured local variables.
> 
> 3. Introducing an 'is_netinfo_pending' flag to track the delivery
>    status. This avoids redundant wake-ups of the delivery
>    thread when multiple interrupts occur.
> 
> Fixes: ba3d7ddfb5c6 ("Staging: most: add MOST driver's hdm-dim2 module")
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> Changes in v3:
> - No code chages: resend to include missing mailing lists.
> 
> Changes in v2:
> - Add 'is_netinfo_pending' flag to prevent redundant wake-ups.
> - Add Fixes tag.
> 
> Test Note:
> - Compiled success, with no error.
> - Verified with Smatch, no new warnings.
> 

I had really hoped this was tested...  It's difficult to know just
from looking at it if it's correct.  We could add a FIXME in the
code:

	/* FIXME: This is racy.  See:
         * https://lore.kernel.org/all/20260318164906.262225-1-s9430939@naver.com/
	 */

We wouldn't need is_netinfo_pending because we already have
dev->deliver_netinfo.  But I'm not sure that this patch is correct.
Probably it's less correct than the current behavior which will
eventually set it to the right thing even if it goes through a corrupted
step first.

regards,
dan carpenter

