Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD9D2E6
	for <linux-staging@lists.linux.dev>; Wed,  4 Oct 2023 08:19:31 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40566f8a093so17716875e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Oct 2023 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696407570; x=1697012370; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8z/4YehLMwn0d5/6ji2uFPyw6gM7Nr4mX0lM3QuniaI=;
        b=YG4lcp2yq/f6tLdteX13+sIDRgQQwB78PWC6v922ux/KkgJXw9oN6invhAVPliH79B
         uVyPE9sa/1hBz+BSUhYiCA/7CtGjUU+ejmaRReQkvToQJUSFYa4/7ueinN9SR7K012UJ
         +39glT7jXqDMqSIBZrdj3CWfGpaufrEN6Du3i7AATzDDgOZxsN6DQG3JXWHZ7P+3L2a1
         v6J7SyQuMth0XjfMJpjQqPqkTVK6EF90Eh6XKIvSvPxeB+CqGWsKZcA1dJNh7zMKKODR
         iMoJh9FNGbqBjz49NBv4E7ytkCIwZCY2Hqdyll3nrdUg04pPAbP5axvaFl+NUDFlG0ca
         qRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696407570; x=1697012370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z/4YehLMwn0d5/6ji2uFPyw6gM7Nr4mX0lM3QuniaI=;
        b=LX5lvhkt2/Js4ORM7yvmRrASiwBSJDs8C3pIk1K7ehUmAWvOi4yoaI1nJuHR03jT+o
         2PT9pngmVdP7Q8xY/nRxTT3IP7Loj7xb+Dn0J4VI+K4sWC6Uq1Jdd3yVWp2hE0KYSoRq
         jRFx/qdjkHbO74N0jeI7TyAsx/di09MnQJZxVwE+5Ekh5uNkICBZjRzRf6v6kMLFgKTj
         9uDMeUK0/GrmhnDdMbN7BJjGCQ+d7+d1HVgjja30aey6v3d9+CucXpq76FBTHdC/fLgS
         DyCm2xqYZgSKYILtuy+7ELrme4WXOj3ml9fY+cEigqpoCB+pIWtj4ecDLhGlrZqW0wLo
         5bTA==
X-Gm-Message-State: AOJu0YyzJVQ9MWB1SmpD4aaIuiOF7b69FqQg417GkbbDp2MT8qU6Iu8q
	F9UF/HKn9VJD624pGeYgkpYoWg==
X-Google-Smtp-Source: AGHT+IFK4nCCGrfSXMqGa0esse8M51syZ49qBeOft1p8FRmhLG4m7dAiNa1K2GCEy+d277Nub/Qn+w==
X-Received: by 2002:a7b:cc8f:0:b0:401:dc7e:b688 with SMTP id p15-20020a7bcc8f000000b00401dc7eb688mr1540088wma.6.1696407570013;
        Wed, 04 Oct 2023 01:19:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z9-20020a7bc7c9000000b004060f0a0fd5sm892268wmk.13.2023.10.04.01.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 01:19:29 -0700 (PDT)
Date: Wed, 4 Oct 2023 11:19:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] staging: rtl8192e: Remove unused functions related
 to removed reset
Message-ID: <755719c2-c42c-426e-8e2d-09ffefd9e028@kadam.mountain>
References: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696266964.git.philipp.g.hortmann@gmail.com>

On Mon, Oct 02, 2023 at 07:53:01PM +0200, Philipp Hortmann wrote:
> Remove unused functions rtl92e_dm_backup_state(), 
> rtl92e_dm_restore_state() and rtl92e_cam_restore(). Remove unused
> variables. Most parts are leftover from the previous patch series.
> 
> Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
> Transferred this patch over wlan connection of rtl8192e.
> 
> Philipp Hortmann (8):
>   staging: rtl8192e: Remove unused function rtl92e_dm_backup_state()
>   staging: rtl8192e: Remove unused function rtl92e_dm_restore_state()
>   staging: rtl8192e: Remove unused function rtl92e_cam_restore()
>   staging: rtl8192e: Remove unused variable last_ratr
>   staging: rtl8192e: Remove unused variable rate_adaptive_disabled
>   staging: rtl8192e: Remove unused variable rfc_txpowertrackingindex
>   staging: rtl8192e: Remove unused/constant parameter mesh_flag and
>     shutdown
>   staging: rtl8192e: Remove constant parameter from
>     rtllib_stop_protocol()
> 

These all look good.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

