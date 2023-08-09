Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BC5613A
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 10:42:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe2ba3e260so62883445e9.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691577774; x=1692182574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuNy8g9v0XZLJnfH4Zk2WUp3xF2RINxa9KJil3UC/Bo=;
        b=qIN7uy//9FCYHPPoZ3x7PzQL1tihFLzKJlhr+wXS1AvgxdhrwU37O8BmJm3G/f3lq7
         Nv4TE288fgflxk8n8tNaFGHl5R7kUmSAdTv9KTd4Dbn2NtVcUOUVp0gc2hMWxW3atcfT
         ew3PH4Y3OWVP5pTm0zCUJK4D/psuV361aK0vZZtdZswcWGIssOdbnJdnFI+XCy4mWFyc
         3XMK2bKlE7mSUPV0E537ASiAOWSYBKeR2OAea/bnL8J1MYvWgUszn564FHwqHov1IRzt
         1i9l0so4Z27BvYBM7NJdT/oIfiSIMI8+nfM35H5OUgm92BykSnkfujyp+/ce0ZpFNnxM
         wq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691577774; x=1692182574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuNy8g9v0XZLJnfH4Zk2WUp3xF2RINxa9KJil3UC/Bo=;
        b=LHD48xRfMUHD3jJUMoVPAUpJXkemZTB/7qS6B8uwqXeiQDRUqx0G/1MohzlTKWfjkU
         FGihkZ5sOSpSE+YxgYDcpu0F4lE4a9zCMrA9+YaLhSRP/yV/6DmYyuFJYO3eKmVbM+FV
         vzxPwY2Al61xveS5KCIGzSTqWUQnjFb7s1Lk4brNLNef/KHYTBPN86K7bTyZhQbNKunj
         NsnYd9y7kkr0Mfm0INfZyxCOshEfHiaGALv0EMtXsGWyK76vyejj1dVryfv5tSTgm/jv
         NxLvDMsJ5F8ZnD6nd9MZHaotRQV931UIjX0LKSAbtXPfkN16tR4M2o1TJQdHVoeZBQfj
         Qa+Q==
X-Gm-Message-State: AOJu0YwZ101mziWAvtNvbv/WobOwLLHMdqC24OKwuOu99EgbK8hATXq7
	Vd53wvBp4W9uJIZ4MWHyzn6Yug==
X-Google-Smtp-Source: AGHT+IE2p1Bk+C5vt6M9KxyfM0nYfTWopDI7PLc5yJE+1vsBtyC4zU3p7uMr2RygHc9Q9YF/zvZoCA==
X-Received: by 2002:a5d:4ac5:0:b0:317:5168:c21f with SMTP id y5-20020a5d4ac5000000b003175168c21fmr1397789wrs.31.1691577773976;
        Wed, 09 Aug 2023 03:42:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h6-20020adff4c6000000b003176eab8868sm16450196wrp.82.2023.08.09.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 03:42:53 -0700 (PDT)
Date: Wed, 9 Aug 2023 13:42:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: cfg80211.c: removed unnecessary
 parenthesis to match coding style
Message-ID: <f651cab8-d6ff-4bef-931a-ca7d666f515b@kadam.mountain>
References: <2023080951-escalate-unnamed-e6d4@gregkh>
 <20230808231424.3270-1-diogompaissilva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808231424.3270-1-diogompaissilva@gmail.com>

Please, don't resend this patch.  Greg likes the parentheses for
readability.
https://lore.kernel.org/all/?q=prism2_get_station

But also you re-sent it in the wrong format.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

