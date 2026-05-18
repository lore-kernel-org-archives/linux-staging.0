Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3073B992A
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779082637; cv=none; b=ipn1JsxnU/2vYXFU2GI1nKbYWbMkuZVmF5J+1R0R+wHCGsWqVkkI9i4WUCbEDQdws8AVah1+zceDk3redWuVdlKbd0LO5JvIDTZuIa3l4l3IBLFGT8YdYQGAUNb5JpegCwSCGgoA+gc1EqlRqYjbH0llgTVrWiTr68eoKrsw49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779082637; c=relaxed/simple;
	bh=i/8evbMQT3+Aqe+4HEcKlUiszrHv+CvLja7xMB7h6VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj08lc2/lUQ/kpCC5Tf+Zkg+st4AIrLecd3rhuBZPfSl2VFT/2v4DWv3WIvA0ooauyQVTi60QGvSGgPXijdpomn2sdQnYv3w1C7MOmNF29fBuBSvG/hqmm+9nacvHD5zzTn6aMSYvVh4D4ErjLyBna/xydyuzlOSAMpS1zwSTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=golL9Fb8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="golL9Fb8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so21302265e9.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 22:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779082629; x=1779687429; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/8evbMQT3+Aqe+4HEcKlUiszrHv+CvLja7xMB7h6VU=;
        b=golL9Fb8LDHhIOxvdKOYZ08tSyQnNsyLb5ljZ2+PK5vKb3YhqWkn8Ouwjg7pDpd6Ho
         rC9XzbJZwai7Hlrh+q7kGDDnbAYitmK0tHoV8niYf+3Wo6dOLenC6GF9a+aBksCheKSU
         uT2UZvWWOqyYUvjAfE/Y5vPXXcwI8LN9xl7+lx2tBr4u6m8kX5P+uMOyB3XlqiycMsFo
         IN0xmeewbiKF4ScC9TX4nmYhJQCwjmr3mFm6M3UrMDF3NROOBdf5bAiGrf/uBhzgzaHy
         qnjk2mikq4z5v0775gLZv9rSWqK/BFz0hF4BOeKWCm+sUCLRYgfVqleAzYQmaT30crtR
         fJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082629; x=1779687429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/8evbMQT3+Aqe+4HEcKlUiszrHv+CvLja7xMB7h6VU=;
        b=F7RdbU5G9r6TMjW9cHBgbOrYMKPWxjJvjVHGGBXwk0o8UEiieImTH15n4Brun6G3cE
         1HW4uS2x3fPqxxPHSi0nMWR6Z6WQE88b+WU9keCcPRDO/FYL9ZD7Z9zB7i/TRCHpQvz8
         buHZXiMUnTjrvroZEQkZ23JqZfSPYU7NsqPNOsabSyAjKHT4IogcnYXLdx4uJF5EZUkQ
         lG7/nT+iTzkXbD0RfdZK06Gz+aPwqhttYYNSc/YSW0tzbYzN1MtKhuI/djrwqmDCCRPL
         d1Me+WPPRVtaRSpWClNVBm1qXguQZDFou5FvfAYajrfsLfnysN3trNVievYMaAz+IQQf
         3oZw==
X-Forwarded-Encrypted: i=1; AFNElJ/AnNWF4MJUPvk7Y7V5J0vCl2r6JsmJeRJwDhLxAQxkZqHTcO4CNQMFDzn6j+WrL7inwk04yfchjLgepJek@lists.linux.dev
X-Gm-Message-State: AOJu0YzpKnw8qgYqiIndQc4BkPobVb+f5lcZnR7UmNKiEptlbWNPkfJR
	wq+HebnoHvNL0PbmTlOmS6GaFItIsH6nFqHqK2qkTE+Alr8G2ElziEbC
X-Gm-Gg: Acq92OHcXosqaQOp/ue5AuknCt1CukjT5AJf9xSi4MGFD4mGIhwi4iLK/x+VgUQJxO4
	v8ijRJVcYxoOYchZ+w449q3EENHMi3cMj6Ea0Yzs4BYDJp++BcT2Rwm/eId9zgEboH3skyS48+0
	TJJ7lvZMsQpAfFpL7DpZZEfuNAgF28CT/Yrvq1NbPZ4vXcIic03MwdvWGGjIZihG7kYRfz2iUzi
	TYzPqPOaAddMF4rlM+qIJk4cUMRWXXYA+YFTH/tJa4pSkWvkkybFDHOJi4ZLo1u4Rt3FPZwB5HW
	GL7tUtU94B6MoKN3hhiMRkhT5Jfa9pWt9UUsrKU9gjbDXRdapnR2zWN4vd01Qx2Ahl81NPFyy2E
	Tjo22d447m51KW8dUWJNGCICCwzyj6ITyAybfeZkcbQ88Xi/PFZYmg56E8aejLfAcJecMZw+r7V
	CQgrD74ZS+KVHSSsGNWEc=
X-Received: by 2002:a05:600c:8905:b0:48e:5d91:cffb with SMTP id 5b1f17b1804b1-48fe60e7d6emr164968345e9.10.1779082628934;
        Sun, 17 May 2026 22:37:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c744sm42956175e9.3.2026.05.17.22.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:37:08 -0700 (PDT)
Date: Mon, 18 May 2026 08:37:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>
Cc: ahmet@sezginduran.net, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: clean up style in
 hal/sdio_halinit.c
Message-ID: <agqlgeaakrF1wNIu@stanley.mountain>
References: <27a0c849-7aba-4ee6-89b6-362e1eb9c43d@sezginduran.net>
 <20260517210237.27136-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517210237.27136-1-artur.ugnivenko@gmx.de>

On Sun, May 17, 2026 at 11:02:37PM +0200, Artur Ugnivenko wrote:
> Fix checkpatch style warnings in hal/sdio_halinit.c:
> - excessive empty lines
> - inconsistent braces in if/else statements
> - long lines (very long function calls)

Do this as 3 patches.

regards,
dan carpenter

