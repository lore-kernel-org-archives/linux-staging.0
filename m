Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A60A3FC1
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 23:18:03 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q11so16337521wrr.9
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 16:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ndVrv9LlDSJtPxdQ7srGUgMyCM4NsNR8S4LYvnghJTg=;
        b=XF5zPQpKbCu9pv7P7tqvIpvMlZoq3FvUjlwVcpmfs9wHHTkyNu6D5G8TNGFcuu/t42
         vYt6Uc/eP2y+7YKJ6G5oo1X1FZ/ElQ6c6l+jLwV4z6NXXGiw3yNd9FLXAB36zr8uHe5m
         Q6l4+bvMtlqQVlBVHcQu6sG3Hd98k8uxvFqIwaEAfnIAPF64Yc4UqJ9f9gBtAHFCskjL
         isMCRoA5eaLT4S64vbfOpl8mRd6V6Z0oaG7aDxdUzEhByaDOYqK3Y8ARzflLek7u7P8Z
         wC/4UuRWInhvZBsrEXt22QeZpH+Ni7vwizt3iMpw44EYVmzDEW/SHZyfUP5tcBh9tJz1
         LjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ndVrv9LlDSJtPxdQ7srGUgMyCM4NsNR8S4LYvnghJTg=;
        b=jgTgt01J3MrmzF6FVh6CRFb7l4hicaT/bM8X8CYVk5kBVbT1sI76kdQRNcuB0TqTYm
         bOcaHeHXuiWFbQANL6WbWSxTIKY3dbYw2ZJy0lVXvbr8NZGR39N9Ky+wsXIBCN+kGJf/
         3BjAhxxkx5UzTz9Qs08Uyu5crgl0zLsAq96yPe5+0UAciyEhyD+iyGEpqgHZK8QuILiU
         t6qO3NsqXu9hj6GxACLJJQi3uy8W/apjxewbgSpkXnk4p0IAMF4MyOqmKxj+zVUDh0Aq
         S3+rgMLX8rfPgJp1KynzYAptABDuBs+KH4uoLQjgKNNDIzAJ+afLE5reHeGPhukuzmT/
         1xQg==
X-Gm-Message-State: AOAM531r098RDK1Pb47i2s57Er4sAZDCXqjQsn2fFtAIM67EFvn/bhh8
	SLpQFJkx1D8eH+F40NvQpXsx8A==
X-Google-Smtp-Source: ABdhPJz2F89Mt5pKkgsy0sbPI9dqRbklsMqgiIt7JIP7QWqkNW3HhlgSKFjuBKw/yP8WdqmrMC6p0w==
X-Received: by 2002:adf:db83:: with SMTP id u3mr1140912wri.363.1629501481925;
        Fri, 20 Aug 2021 16:18:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:dfde:e1a0::2? (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id j16sm7321552wrr.78.2021.08.20.16.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 16:18:01 -0700 (PDT)
Message-ID: <1590e1abf3991c4b9023173bddee5b9e912d2c47.camel@philpotter.co.uk>
Subject: Re: [PATCH RFC 3/3] staging: r8188eu: add error argument to
 read_macreg
From: Phillip Potter <phil@philpotter.co.uk>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
 straube.linux@gmail.com,  fmdefrancesco@gmail.com
Date: Sat, 21 Aug 2021 00:18:00 +0100
In-Reply-To: <44a5a4ab2eae8e0deb969028a5488ea892008c8d.1629479152.git.paskripkin@gmail.com>
References: <cover.1629479152.git.paskripkin@gmail.com>
	 <44a5a4ab2eae8e0deb969028a5488ea892008c8d.1629479152.git.paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-20 at 20:07 +0300, Pavel Skripkin wrote:
> Since read_macreg() calls rtw_read*() internally we should tell
> callers about an error on the read side.
> 
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mp.c    | 9 ++++-----
>  drivers/staging/r8188eu/include/rtw_mp.h | 2 +-
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mp.c
> b/drivers/staging/r8188eu/core/rtw_mp.c
> index 601a1fd5d4e7..6bbea1cc364a 100644
> --- a/drivers/staging/r8188eu/core/rtw_mp.c
> +++ b/drivers/staging/r8188eu/core/rtw_mp.c
> @@ -7,20 +7,19 @@
>  #include "../include/odm_precomp.h"
>  #include "../include/rtl8188e_hal.h"
>  
> -u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz)
> +u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz, int
> *error)

Dear Pavel,

Correct me if I'm wrong, but this read_macreg function seems to be
completely unused by the rest of the driver. Rather than changing the
signature to do error handling, maybe it would be better to just remove
it?

That is just my view though, would be interested to see what others
think - perhaps it could come in handy at some point.

Regards,
Phil

