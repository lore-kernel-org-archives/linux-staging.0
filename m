Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7F3F0AA3
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775148382; cv=none; b=Sw0ufMeNPlP9fXdyK6apnm0V/QFytMuKL5MtOwVebZGlALj19/+uatGP6q8GZLc05I3u1FoDlL4OAkQJy0oe0zfVYebgSiRBioSdMGQUmXHBieIknmxdFM6lmsLNUFHBoEqC4GhwoPN8lLB1m3bTUWrrcr/9Fn+wbKJlxDFUsio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775148382; c=relaxed/simple;
	bh=YeqRbLOvNhRMOzpWN3mKJWKwr4ry7BH3GcQicvH77xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B27KY/hjlo+snM7duiUNwVw48Ompz6d/6plcXAsGRqqbKwhOodz2KrQrqiOhxUblj2pFUSj191wOtuJhLdWaQhocQICFagg7dK+I+ZEXvU+aECDnkf7QKFbQLV5IUNiHEKzc6jKpG6L4ww5C1hLRHRigcrm1SP5+RjSduKWmvzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oma5pHJI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oma5pHJI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so8696335e9.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775148370; x=1775753170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zNs6uWaMKXxrWogKqcZW6z/kJqvyu5LlKTIn1ZvHs78=;
        b=oma5pHJIKQfeMvC1AYyTf5LNRPitoHNd6noJMstIpK/SC7Hxf6PvhG/z8+nmvb72kA
         475x2m4+Mgjq9wQtKE5j9jK+guJ2Oga2+m5D/Pvz3aYX1e2Z/jkL1tl57K/5gf9AhNGX
         KEs2FnGXYSsrfH6RQBKlweFUqE5uI4ILEDhc1qH0iRnW53ya5dCYWKNvr2Rqhv8aoa5f
         lRIR4MYtj3eG/RAXMb3rc39BMtsr5jDmW6vVXDzkyD/jWaaisml7t37d5SwpJ3L31fbp
         Bla7Za/rXWcRuIOBePFa7f7fcBxLh+nWPh/TnYEkX43FPcZN77OO9ph/ZIYZgGerRWWY
         OXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775148370; x=1775753170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNs6uWaMKXxrWogKqcZW6z/kJqvyu5LlKTIn1ZvHs78=;
        b=j+sD6QpDqXzhVTCANLiPK+UJdWSjdThZZQPNLIagrguVOVVZ2sBwVbiU9mt85yw3a4
         MRI4UPHl32DV5W59dygnd2eeCo3lZOSF2XOxU7m/PMKhp9Ka4JiBsQFqZTydNwrhcR99
         43qfsU+lcceHhwUlP36nW3GEAgtE/gIhjlM9+XViRD6up14x8yPQMM6nPXNJJYDxYk99
         sghwCH4zeGrkagk5H22VLRTn4YxBn3AsjShaSKo95Xqsq/j1+kx+FN//l3ibEXWSRIAZ
         /JsI+9QPs071obdygf0vBvUGJdfeGwstu28QaIMgT0gTF4znbDxT9+SvivQ9aDJxtqcP
         4guQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKj55hskVgt52oWdpAYZ+1rkozUT3vc2Cnsfr1mdGwrGyyTuy+tWXKLnHdLVh7qBJa4ENZny8O7QWXm714@lists.linux.dev
X-Gm-Message-State: AOJu0YxV0cbUCcu3RGbfa1mfWlqVgDHlbIOAJB+2h+OkHITU/p+c2R0f
	WnPt8o5vEsJbp+dd75ND4tjgwg6t1OGNzUypyzrlO71nj93lZlcA51wD
X-Gm-Gg: ATEYQzyUvIDWiPXufZk/GIcX1rDgd+dVEfjENJ4p170NOk9c4LpmVJyRFKEmVdYAVNg
	58ZvqLxuTj09jiBHvXomoMo7LpVxY5KYTH66sic1vVAWCKYo+XuytH6YMdEy8UcJEq8DdKiExMf
	9JBYePK8QG41CHzbEC9VmIextYdY46+vwfW2C/OXs2/dHUu8LMizMNpZfqoElBhPf6XwoZP6R+X
	/Z0PkA9WXAR91rELUyjBBiu7OM4ZmlBgRVOpQPVwj/t5BwHeKJA/IHRSjkwyvXbDj0bWdOnXNYs
	HH6tcHfkhEypO+iLxgm2pSZ9dqVnaQ/E4o17uy108EHNw1W9onJvK/E01tfDqrLja5zijmxkhUu
	YG+9PGce9U7Vr8obp7zK9oMzl+koDmSKd92broPgTkWef42Yl3vwWOosBRUsepx8wRyrRkbOwWd
	82OO7Z5fGUc1Vo5+WpaC0=
X-Received: by 2002:a05:600c:a11:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-4888355e7cfmr153380075e9.6.1775148369724;
        Thu, 02 Apr 2026 09:46:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fc26bdsm740995e9.4.2026.04.02.09.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:46:09 -0700 (PDT)
Date: Thu, 2 Apr 2026 19:46:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 5/6] staging: rtl8723bs: hal: style cleanup
Message-ID: <ac6dTuXc-tVunC8f@stanley.mountain>
References: <20260402150429.14761-1-khomenkov@mailbox.org>
 <20260402150429.14761-6-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402150429.14761-6-khomenkov@mailbox.org>

On Thu, Apr 02, 2026 at 06:04:28PM +0300, Andrei Khomenkov wrote:
> Cleanup coding style errors in the lines modified by the
> previous logic changes. This includes removing extra
> parentheses, fixing line wrapping for if-conditions, and
> adding spaces around bitwise operators.

Two things.
1) Generally, we don't like when people introduce a problem and
   then fix it later in the patchset.  There can be exceptions
   where this makes reviewing the code easier, but I'm not sure
   they apply here.
2) This patch does many too things at once.

regards,
dan carpenter

