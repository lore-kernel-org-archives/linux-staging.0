Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDEC489867
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394194; cv=none; b=F9INAb91T9yE5WoQl9OLpASz5gsyk88xsS4YYAEqlATr4kr1AkBYYIatnB5l3ABopIuy8KCzruz62W8pq16OQXdJOfERizS58m9prCZJTYRR2lvOUYoPHKTNK2OOnt9/2zsT4lfWWYod3V3MIGCeDL35/iIwomMCz3AUet+1s1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394194; c=relaxed/simple;
	bh=Ib/0Jiq2CTtAN56Lsm/P1GvxUcXEmvLrLBBKb9p6EyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5KcyOzi7xwh14J8kGnyfFtxAvKvwJ+wAhXteNykgnxU4UZ0r/3YoTgxBaSoQ/bcD4p1omYEHT81F1fLvZM77JY5Qv08Ik4SJ/tinv+hsYYxK3yWlJlPEqbbpBqPRKKFyFluuIxtjtkZ9KNJubg/KO1pShE4SeWLhYspvzZm9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRdJoUVS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRdJoUVS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so11975655e9.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 00:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394191; x=1792998991; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8UC1h33uTXAmEsOd21N1W9UrPJgvJpD5tf5yIkoy5E=;
        b=nRdJoUVSQS8u85tfIiom4cr5btHak3OaZb8IFoLFmV7lflqW66uZuqItAwInVvKh3J
         v5ch6MXiovfYxzI8vmhYEN3CurhwL3jQIc+Zwu2CJvZsTG0LspxqNzPLyUU6a+IFuTn3
         9Y7fkVTkH79mgJna2adu4fWfZO8NMOzjOC2+yq0emPmZed2MJ1zhI3g4JNnUh3xKOxxo
         kn+v80j6FcpbllUJkkg/TBh6Qnr0g136FrpAgHvmz0DVARi6jLiyu3Yik1vZQqPzDyUm
         +LlOFgzYWyT9xJP4/uBcnFyqIMCdGsQRNYvNNaXeBO31xreSfW0R8GN1W/Ruzs3LllgE
         YH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394191; x=1792998991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8UC1h33uTXAmEsOd21N1W9UrPJgvJpD5tf5yIkoy5E=;
        b=i2lLVD5/JJWNp9WYYUBMZKlsGXDRg9v5nd+2/iT6JGCwdCTw56g4pOh/zq2tEDYkDB
         Q1W6vg+o81kQeDYynGKuaORzd37uHw2/oTQUstlB18Zee/1L3swB5Rhv+QoA71XmpG1u
         Gu3fz2+9Z6ccyI58GDDR7lfs07oYoz7l4QfkU8xwKCOWAwXoMz7oHyzThbiCF0gdDyd7
         msPtroATv0z7pAfonYvFGlOLcC8IFJ1WupISlvWhor8YdyZhZaLbrIUBsXwdrDn4pw+u
         eBW06F5hkiTraKV/ZgKf4DP5lk4v71Ui1Ti8WRiMAwu4miSZjrFF+TdEZm3YJCAlmYj4
         r4JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdRe35wC0pYxXEIbvS1ILnoun3cTcw1EJbCxWseTAbjDCkBKOAm+7oqMByDs+bXx/vZ9RZ/eNbH1Y+sxID@lists.linux.dev
X-Gm-Message-State: AFq9FYIDqx7mgaTUJzoc0Rr7I0ooQ19/mESWYfHbWaG4uNimh2SfNRkC
	P0aS/9ryhLSPePWZCw/IMW7TsnXaWkywQLKFV2auYIGf0wajzeAmsPQqFfRd9CiWaLHhLXFf
X-Gm-Gg: AYBFou1i+nn0y8Bou5hvRbpyDcumQFlQIhW2tzQZkbNKyMAAvljgw58J0NbUwX44xtW
	RWw4sEE5vCqnkw7pQiy/RscDv2ky62+0Ox+E54amUjD4Ho/Wm60ed+vD7c0oizdRNgRU3gAKwqI
	OmFguZXuzZSlRp1ApylRScLVxbNFK+uoEQKUWtFFMsHFvFlGlkl5hWn29RzYIqT+vWMI49Ousfp
	E//XWKSJonvF/h42YTH1Cr5bkZASoNbxHIouaEaXIWt0dlr9524MVXvjUwjtYRvN830b+UXVjkL
	RYQeMVVPvoXt5OHYp2XT3raW0L41BYK3L7trUj1XglPjHjGBDi7TVNfaxmelBoNoTQIuzXw+ICr
	5yOaXxQtDmizWz1M3qlrhEdoehNHPWNaYpn8KjXxt5A/gWDe0sFLBQWhShtgSEwu4/vYyY2PZvS
	HEyQ90kq80uqJM50t3Ne2hjzBiu6pnwnhpUOB0ky5GIlVsDyKA8JWM+2YDUyVlN9VRKxU=
X-Received: by 2002:a05:600c:4e8a:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1d75f8399mr148752645e9.12.1792394190220;
        Mon, 19 Oct 2026 00:16:30 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm303395445e9.0.2026.10.19.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:16:29 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:16:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: rtl8723bs: clean up SIZE_PTR usage and
 remove custom macro
Message-ID: <atXDyq4nVUb3ODKu@stanley.mountain>
References: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018164403.14921-1-work.ashmitkumar@gmail.com>

On Sun, Oct 18, 2026 at 04:43:59PM +0000, Ashmit Kumar wrote:
> This patch series cleans up the custom macro SIZE_PTR (__kernel_size_t)
> across the rtl8723bs driver as part of addressing the TODO item to
> "convert any remaining unusual variable types".
> 
> Instead of a mechanical substitution, each occurrence has been converted
> to its idiomatic kernel equivalent:
> 1. Replace open-coded pointer alignments with the standard PTR_ALIGN()
>    macro, removing an unused variable left behind.
> 2. Remove redundant pointer-to-integer casts where pointer arithmetic or
>    pointer arguments are already sufficient.
> 3. Replace the remaining pointer-to-integer address casts with uintptr_t,
>    use size_t for alignment offsets, and delete the custom SIZE_PTR macro
>    definition entirely.
> 
> Ashmit Kumar (3):
>   staging: rtl8723bs: use PTR_ALIGN() for pointer alignment
>   staging: rtl8723bs: remove unnecessary pointer-to-integer casts
>   staging: rtl8723bs: replace SIZE_PTR with uintptr_t and remove
>     definition

This driver has been deleted in linux-next.

regards,
dan carpenter

