Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F1749B
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 04:58:31 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4053c6f1087so117579515e9.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Sep 2023 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695877110; x=1696481910; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xGs/aA9aOh5XsFAEpc2ofFBAtNcAT8wgme2oNok1KUc=;
        b=tROXo8koGk3yc/XVfg6smiqTprhc8/kr0NPiRNajnb0QXg9ezzqiB9bZBnsd7OGFon
         Ol5JmLyOM73FbKMO+WvDeJfWhlA8aED3zAQVDhiOZzHiLKPcgcJMUHnq7ohVqlr4qNGn
         I3lZLW4iGE2U6LEHNiyEHDnckglzg4873sHvniTP4PpgyqeRFYg5yMVrzUZYCfnxLqqb
         nJM1R/Dm8ye30jBtdABGR1JyaYz0xlD7LuFAtOtDPsBWw2303nEMgVQrdvUQVQl0vPN5
         dxxkJeQFSdbrYQFAV7/OrXzaXxgtzhdXSfaQWwDIIpL058l4Th67V+9ykU8MTG3JbkTV
         SjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695877110; x=1696481910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGs/aA9aOh5XsFAEpc2ofFBAtNcAT8wgme2oNok1KUc=;
        b=GX4C0wb145rMQK0CbMZ5nbNzPS/Bs8r2vgpwbF5xZaFqsR/qhhjxzkeCZgdCM17qOI
         SiuGxWmd0fm0gTboNPUHkV7UoeE6utS4bUv72c1CqgPSC/DinS3qHSpNe2Q8M12H1VhP
         /+ydO1598A4cDVdMcTTnGRHpNpWLPsRVsXzNHabCrLwK9BVBZt0jnQkYV8eDFZmF+OgW
         rP6HHtdA2A7kFYuaVj7N5f96XI7D34X/5xk+1GIwPnu8AQ/PD/1I52swt9bcvKB5v0/R
         vKCqs/1Ktbh9/027WJbZxjYA/SRxJtYNv7+gswfgy8FmXnDtv/wOVpR8mYcjsZyE0GkB
         Im2Q==
X-Gm-Message-State: AOJu0Yze9XUACP63iJzZUqDmeMT7/J8rxyOTnwkPSxRQrXx8z21/CbaL
	Pb2OWwj0jdXlpg5Uvpycx/KkbQ==
X-Google-Smtp-Source: AGHT+IG0Cv1pjWH7ZQwQVEN+3+R9m7dfeHRMc2ejLD4pjtTlo4Pni2aZ7HIRQilezMRQ3XpTvgYUpA==
X-Received: by 2002:a7b:c858:0:b0:405:40c6:2ba4 with SMTP id c24-20020a7bc858000000b0040540c62ba4mr159135wml.5.1695877109938;
        Wed, 27 Sep 2023 21:58:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c230e00b00402f7b50517sm19278473wmo.40.2023.09.27.21.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 21:58:29 -0700 (PDT)
Date: Thu, 28 Sep 2023 07:58:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192u: ieee80211: renamed duplicate
 variable
Message-ID: <469feda7-80db-4f22-8396-1eb10d07567b@kadam.mountain>
References: <20230928033220.31783-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928033220.31783-1-garyrookard@fastmail.org>

On Wed, Sep 27, 2023 at 11:32:20PM -0400, Gary Rookard wrote:
> This patch renames a duplicate variable found in both rtl8192e and
> rtl8192u causing the preprocesser/compiler to compile without error
> when in fact it should throw an error/break the build.
> 
> Prototype in files:
> rtl8192e/rtllib.h      remaining as ht_update_default_setting
> rtl8192u/ieee80211/ieee80211.h   changed to __ht_update_default_setting
> 
> Function in files:
> rtl8192e/rtl819x_HTProc.c remaining as ht_update_default_setting
> rtl8192u/ieee80211/rtl819x_HTProc.c  changed to __ht_update_default_setting
> 
> Referenced in files:
> staging/rtl8192e/rtllib_module.c  remaining as ht_update_default_setting
> staging/rtl8192u/ieee80211_module.c changed to __ht_update_default_setting
> 
> Linux Kernel Coding Style "cleanup", no change in runtime,
> staging/rtl8192e and rtl8192u compile/build before and after.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---

This doesn't apply, and there is no Fixes tag to suggest when these bugs
were introduced.

regards,
dan carpenter

