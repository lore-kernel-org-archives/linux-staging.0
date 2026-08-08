Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23E1AA1D5
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786173828; cv=none; b=LLNaNNntNfvu1CG7RBxF0KaoTbggX8BPTtOKVpd9JMbIyiu4/XwWiPkF7sFRrD8+vQ4suoFFHkDSKSrKuq6Huno8JZlYTct4w2GTkt26Gr/ZeLCnsISRzFZ2kXiH23MbODm4FtoHfAXP+P5mo9MdTi07o8tCe5lRiBrCQge1ZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786173828; c=relaxed/simple;
	bh=kjxw2Q6l+XQciUjwv6WtFGuxME1n2kpduCrSzL144ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWOQNlQX650ZUv/V80LOrBA8lqltP2pY7vzo/tBdpXNwG6rtC6jKUQcnwzN7zb3Fl9HBGnVpVGmbR02odfSZcvxnUqi+SZqOm1Ji6Sk7x8NrgWAXCKZ1UgBE0Gfw5ZPwiW/uYNgEGGEs3dWr/rDxLvJJSh1ngwDT1YSmUbEf9bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI48/QHv; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI48/QHv"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52cd38ddcdfso1602421cf.3
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786173826; x=1786778626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QeHEWfzax/2BIcrdDHYJtRbgpFUEHFskYBkFqnlbTZA=;
        b=nI48/QHvqntyP8wsXfTmgqavUjZBH0V98dH/YngL9wPvyKndYKCg0kVwZLnhY3b86a
         L57dnI0YJqgMG+JG0ZDMQapYWqzd/pW5RdTbLTWZ4Ki17h6f6DO5tjAtlKDwo5vCCeSZ
         2bbBCiUYB9WcJN0RrmHDzbi6EL9EDyg/I9TPm6PhGDto43G+vkoYQrzP1VngNkcQ8Fwa
         xtEkb0sEpn4qEyu4YVfcMIi1dbb/0rZeLMEopmuluqN7xCxVnITVXCJyq2EiwDH6U3mm
         1xM2Hh33UGjgd88pskYus9HHSoLnY6YIv7fQJNEyvtjocpqUER4fXnsIKbpAhYkRDbkh
         P8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786173826; x=1786778626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeHEWfzax/2BIcrdDHYJtRbgpFUEHFskYBkFqnlbTZA=;
        b=l4DXwZRvCv89OdfBnycCLPvdkRKJbHCqnea9lWU5hBNEd1VFnb9aETEr4fJrFr1zm+
         D3TrDya1XqsP+BheLGU2na8k6P7XdjaKJm8xZSbmR5UBfnvlmuX8c8A1HQ0LEAfAJ4GD
         raU/L9NJ+LEDSUfNcMLJC1gQy8ejGVwqxa2ee70vCn2mXnNQigf6e68vg1Ve86+eFjhi
         lq2LHxGtyQscw9rRutlp4xdvVC1h9VAWy8mZ32VZX4ooKgw0dv6RLtSOAxEJmbw0xRiO
         ftNiAFutGWm/X6ynbu73ynD/uQeOgFKKI7a5tJEekYuzOHybe9caDrYU3vvDYlKsL1bT
         HKkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxHE8TqUxZ63wsZt0VLb5YI8KWlOZQrxYG3npOLNqtNKt6SfFMh6MOxVd60W6PNCmdrexN8UYHlQWulBzz@lists.linux.dev
X-Gm-Message-State: AOJu0YyGzLLJm2ka3U/Q3qqy4PzGZnlHon19LeEl+c14P4UrbxPORKvV
	bZehiZkhUQJfzRBC/TOZM4URDV1+v2Nvc0EMiDmK6Xs2cpNulJ9LGon/
X-Gm-Gg: AR+sD12E4NxQwLlld5QpOj5KaxID7nS8NPSdRqtHuMgcFzgaFtAckbACgW+EKhDTWQo
	icdiyn1fXjmuXL2SkPVQAHg5cZK4SlFKI+7LLlE8fBI4gz6lirVBZTsZWRl4icYsBxA1eOWM5z6
	CSI7hgj+Z04lnuHm2m7KtLNUUiIstuzghHwherody/bShG3jNn1NuouN72l/8hwkWC1rEjmAAxu
	77s7CnFWcMa5l/JbhGh3A/cujBp+ge26h9bYWG7Gr3mNW4OIOtNUJDMwMZClerM5JZpqU81/5Ye
	T/cXw3a+bg3hkTLQ97FzLm5r5H0V49J6J4eHI4s8A4Yy14qJSlInlzJY1EjOjvhtQOy76Cu9S52
	CZMieAnTNQgEU2j95+vEAq6KNNEXXnt4vyTw46fZkCgj7N5KgDdeHF8xsLPWJ6xARmBeIQpGLee
	iVEm3ecSzSp3QabB00l4gw+xNXMUpu3nsHUDQaietFc5zBoifbbPRhQg==
X-Received: by 2002:a05:622a:4c14:b0:51c:2633:9ddd with SMTP id d75a77b69052e-52ce61eabd5mr320157661cf.41.1786173826442;
        Sat, 08 Aug 2026 00:23:46 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03ed23sm321602685a.7.2026.08.08.00.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 00:23:45 -0700 (PDT)
Date: Sat, 8 Aug 2026 10:23:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Noah Techoueyres <noahtechoueyres@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: Replace strncpy with strscpy
Message-ID: <anbZeXqXbUAuAFUE@stanley.mountain>
References: <20260803012620.5503-1-noahtechoueyres@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803012620.5503-1-noahtechoueyres@gmail.com>

On Sun, Aug 02, 2026 at 09:26:20PM -0400, Noah Techoueyres wrote:
>  Replace deprecated strncpy() with strscpy() to improve string
>   handling safety. strscpy() guarantees null-termination and is
>   the preferred function per the kernel string handling guidelines.

This white space is weird.  You did't try to compile your patch.

regards,
dan carpenter

