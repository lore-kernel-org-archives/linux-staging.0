Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739F29BDAD
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 06:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002010; cv=none; b=OJo5qhqCGYVplMFKoFjG9B92sIBj71EiKtyI4OEIXWBafciDt8j9jTFdEk+wgZVuRZah7P50eUk1RV0qjUWtkJ/VH+2n0ux6J+Tvd9Xner40nkKUWIT1Zv66+WSsfSlkI3ICnaTdXAgMeMP/MP/WBUaPFMxXDnqdQCCCJhbsRLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002010; c=relaxed/simple;
	bh=OsnoBlqsPRRMXQFggZjPmq6tctmLvwEZvl5IlaqGnas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbjP8q7EDLdUplJydcsiXGSLVzA1h5rL6KfusfgSBKCFWGVwLLnODZKOuW4KmFZyE7wpblFCzAnzkBJBgTDymbhHoZLOP05vE89AEuYYKCRCmnva4GmMd01jkhNt7r0P0Q+HcAciRQXyUPqZ/QqxWzhsxV6NdAWScF58VTwG+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dH5uGaFN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dH5uGaFN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483a233819aso61465375e9.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 22:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772002006; x=1772606806; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4NMqbshYRxO5mZM7OEYhfcX1DI7UCXh3U+W732gQjU=;
        b=dH5uGaFNPrP0TI+g61o3z/v0+iHod8I9ggTeY7rxktFaBsMkgCW7rLOpX9vW3bYOGs
         MlVOGnTvE0qVKPiHZTufFqYHpgXxGmJFngr9J5wefTKoeMmPbmnBN710dyf1HSN3LP/X
         GCEv0BuotK66cWqd1MvRnsd6nfA1GP0RW5+O9BeYXxYhW4uSYYHSGG5mqFjwMOemGXud
         SeI0Roegog35j4XckWJjbhAFBGuuxyPvuHPGYrGw+hQOHzl07vNzpvpflXfDgXeMbaTC
         3cCHBcZvN9DR7DkdDh9JBlQTZ4UsuwhR9iNxuumPGFSqf0FkzVivr4EwvzAv+iPwYvw9
         KKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002006; x=1772606806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4NMqbshYRxO5mZM7OEYhfcX1DI7UCXh3U+W732gQjU=;
        b=EoVq4g37ux8MReqHCZNXYWO9Uwa4Xjj3TfkhBrI9CU9Xl/LqQ/fXJePmEEz1DYAWuj
         7UWprIbfDOoQsHQDoyV2fFS3rx5WUd/CW0lCt48/tkF+NyXNe0leQqzB3UXwEMk2ucpk
         GM6SD/c6kd/Smxo4jf+YgN7XTKTuTm7wD5eKFDw10G4CvuY4hxRi3pEH2ar2Jh5/hqXx
         tpOkL72Epok0lW0VfaHXAR99O/I4x2hwKD/9xd8ugPtaurDCMP9DhteHVO1y5mD0hfxL
         0Y/PHBdnRmG0Q2Fly2R3tLry9k/9//jlRTJu9HDjmNeKxFkBKlBQcmQdaumghEFs+qdx
         H6vw==
X-Forwarded-Encrypted: i=1; AJvYcCVoqwyBCCWLBuuysDaOuNwGPwD6PpHq1MKug7Tcm0iOHrc0lJwgOGG/GPmImD84hChML7W1GGYCieNqUbgf@lists.linux.dev
X-Gm-Message-State: AOJu0Yw79e+UKwzafSKBvIyXkliCzBxPvR/1/3KIeMqWXgDiYqHpbaH7
	LFBwDxIPIDZV4xZxYlkwDWyW7ZRMVZV1PM8FQxHaPx91+BmNVymxNb0tZ5MYtgaa8L0=
X-Gm-Gg: ATEYQzyMsR2kPe9s5/k32vCROSVCSbJWMJlUiHsky/hYm0Y0e0DErsWGoTiA423QHF1
	fhGjLW0c7f1PWyIZoPWUZCMuHOyv1R2xIWBpAuBS4oiwO+BHp/bs056uiF/eHMd6weJLTqMs123
	6qn2I9NBWagYYAKSQjcEw29GSc/gFQM4HkqBB/8JyaJS8LnU7vZ4XEdqqJYhUT7KPvzS0nH5uE6
	YZ6/9jCKI03o2Qd0ex9QAZRtyj+DAO34xhyIhPOlIMO+YC+vaJTy2Ohz2MnXRs2ui21velrOwD1
	Hdd9uMuuVPCZVcsEOIQLMz+ceJn36QbgepqOA9mo8Mrp9HxZQ89iO9Io6Y1YD9hzmMf6m6TIH+W
	Vrzwo9e8M9a6SL1e04jeRx6ygAfDDk8G77RfQnfVk/xBhqUhlo1ea2kP/zCOJ7PhrrgMnqOjRt/
	wqsg/1wpc3sKQQTRDeKfk3UcFWJTQJ
X-Received: by 2002:a05:600c:3553:b0:47e:e87b:af8 with SMTP id 5b1f17b1804b1-483a962e491mr243587295e9.21.1772002006146;
        Tue, 24 Feb 2026 22:46:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70b3f3sm51906145e9.6.2026.02.24.22.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:46:45 -0800 (PST)
Date: Wed, 25 Feb 2026 09:46:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: rtl8723bs: fix potential out-of-bounds read
 in rtw_restruct_wmm_ie
Message-ID: <aZ6a0lyyeUcOIo8s@stanley.mountain>
References: <20260224132647.11642-1-luka.gejak@linux.dev>
 <20260224132647.11642-2-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224132647.11642-2-luka.gejak@linux.dev>

On Tue, Feb 24, 2026 at 02:26:47PM +0100, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> The current code checks 'i + 5 < in_len' at the end of the if statement.
> However, it accesses 'in_ie[i + 5]' before that check, which can lead
> to an out-of-bounds read. Move the length check to the beginning of the
> conditional to ensure the index is within bounds before accessing the
> array.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---

This really should have a note here which says:

v4: Sent this patch previously as part of a patchset, but pulled it
    out by itself because it's a bugfix and the rest of the patchset
    was cleanups.

Otherwise, it's like I remember that I have seen something like this
before but I don't know why I'm seeing this now.  I thought maybe it
was the same bug in a different driver or something so I had to look
it up on lore.

Anyway, looks good otherwise.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>


regards,
dan carpenter

