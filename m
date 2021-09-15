Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354983FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:34:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h17so4372150edj.6
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+5pkhHU6uSbiTJeV/y5KWHfW0IEfLBUjZh7XULYmJ74=;
        b=BlKiTKWd/n1ZpeCRDDjCqJGDsPFeGpCs3FWwonyOqL7bzw0tmhqIpcUbG8+4OJ7t3G
         jivmRDoWhFAkl13i7JXEg1hf0X3oeeZpYIQafYDkFos1cyuSs7NF6YSA8ylTQ2UIl5XN
         rw/s8IWDIkblFuaeCE1PF9tdw8JED12QUwMZf4FMT9VT8q7abKkIpG2LMo7ZUjDTGJrq
         4Ddjz+v1HMxEGFaC3yUaglhLHkep1RUW5u5yjsXKlb4DkUZqwXVlQuUfzeAejEAGqBRt
         fBlUkXbGlTu6+rH5Y36/utwQcHtzxGqHunfTBi8kxL0Ne/J1MmER1jg9uSTw4a7B4BBd
         AUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+5pkhHU6uSbiTJeV/y5KWHfW0IEfLBUjZh7XULYmJ74=;
        b=zFDnzUKGuN6wH5pePr1xD5DuND2MzsU9rky8T0sEM4JJd4/gg9fZ1lvsncf104kczY
         OwKB0yqbykLeC2lT+/lLk9M86f4cTe41VVyeNMpN2EuaQynpp3xujCmz9lzde8hMCbH7
         0MRgNTy48fkcpMVaN8B8eKQ5E8jcvdWUHn/Qj8yF4thhs5EP8wwF+3PcYAyapIPXodKq
         9HJOZuD0hNX+xiJq8idCW5tpf4MXnQ1xzuly3gHKFT4xlYJ4b1m8wNMDIY2tOyHJglxW
         LRMZDEL8rK8CVbYDwbp0Ki/lmSjbQkEMt6jvwLimXBRHIE3cCcQJReN1ymWW5ioPkHkz
         rsBg==
X-Gm-Message-State: AOAM53099woLsmfana77TPBzh8zwKh2S6XGKulBrDqM1mA01oeJ0csTs
	HCyAgAVYeDNtAH77zoRSAts=
X-Google-Smtp-Source: ABdhPJw/KQLz36+AAF+fr/h07gdt75WX9W7sLMGjsIO51YMz4kat8zMxbSIyRm2B9oL8KWUCaAUUXw==
X-Received: by 2002:a50:9eaa:: with SMTP id a39mr69422edf.56.1631712867545;
        Wed, 15 Sep 2021 06:34:27 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id v8sm6392793ejy.79.2021.09.15.06.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:34:27 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH v2 0/4] staging: r8188eu: remove unused fields from struct hal_data_8188e
Date: Wed, 15 Sep 2021 15:34:23 +0200
Message-ID: <2416232.Kz4EfdPaPr@localhost.localdomain>
In-Reply-To: <20210915090156.4169-1-straube.linux@gmail.com>
References: <20210915090156.4169-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, September 15, 2021 11:01:52 AM CEST Michael Straube wrote:
> This series removes some unused fields from struct hal_data_8188eu.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> v1 -> v2
> Fixed a typo in the subject line of patch 3/4.
> 
> Michael Straube (4):
>   staging: r8188eu: remove unused macros from rtl8188e_hal.h
>   staging: r8188eu: remove write-only fields from struct hal_data_8188e
>   staging: r8188eu: remove unused enums from rtl8188e_hal.h
>   staging: r8188eu: remove unused field from struct hal_data_8188e
> 
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  5 -----
>  .../staging/r8188eu/include/rtl8188e_hal.h    | 22 -------------------
>  2 files changed, 27 deletions(-)
> 
> -- 
> 2.33.0

Hi Michael,

Due to your removals, this driver is now about a third lighter. After fixing  
that little issue that Philip noticed, this series looks as good as any of 
yours. So...

Acked-by:  Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio



