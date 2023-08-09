Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B1D17754
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 14:29:36 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b9fa64db41so108037161fa.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691591374; x=1692196174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8FitPhYl1bw/RbzqKoKTQcV3ylIG1k/12INyc5DHZ8=;
        b=DV2B5uOxm0xt7UyOES30f0HxFNx+7J7iBW6mvXOlUTaVfhDY3ZJfUIMIAasBloG4fz
         9lvBGnbWWSDdEOvRkLRYdRoix0+UV9YbGEULfea/4wKelbVYFuLfOt7i+b0tC088AYUJ
         IqGdzYUjar3PLnEEqFh88ynZfHPLo5SxBWVJdxcW6D0M04XXY7+9GVB07/vRQ8cwlJ65
         qztX+MBHVWmFZb6Z/2jwuJh4b+XbGzKJT/ZiyTpBVbd4MI6dcJElEIZcOdewAF8B0eGx
         M1yrYYdifX0YMkh/4B4avzvfkoFrn6PiXCHbIkK4ZglSg/yly3sSV/48JeivOiscumi/
         T5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591374; x=1692196174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8FitPhYl1bw/RbzqKoKTQcV3ylIG1k/12INyc5DHZ8=;
        b=NxFNRLKAKGDc779CPOLGLTaoAEBc/fTSB/GSBicwxygsUyf4c9hXYuJAiUCJH9EP6K
         KBfn9fZ76lMdg7r7zpXYDC/J9Z1FFwix7WeVYOfC+Rg0EaWAXyzzzPz9J3kveafrTIR3
         gBWn3wb68y67SbXdQ8oPTUyy+0NRcXAmEvKeRzOIJomrHmD85e2Ab/Y37Pf/xjvEIFIf
         gPRnxNpPhGCUdRXYJXRAK0UuHdtWFatKMzB2NuBr4gd0YPqF4DXZLXYWoaEpfPZeNybo
         wU2t1ObLkh9OwIQAcQrM1Y41H4ImmeVDSmbkH8JQi76n9dcdcjXWhNoDVkYHo3EiKAT2
         eUuA==
X-Gm-Message-State: AOJu0YxAeNDdnI6CJnOi2kqLv6694q9Qq79k5DpnM5dUMjeqegCdXvA1
	4mk15TTSMlXI8kYG1PkmPwVjEnI7KGlyfw==
X-Google-Smtp-Source: AGHT+IH5rkstwyUYASBosdCGaItnG09JoYLdgtEi5/UoDU+8EBPkBlpWWYECaN+yeFMdiryAYsnqtg==
X-Received: by 2002:a2e:9195:0:b0:2b9:acad:b4b2 with SMTP id f21-20020a2e9195000000b002b9acadb4b2mr2206921ljg.6.1691591373921;
        Wed, 09 Aug 2023 07:29:33 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0099b8234a9fesm8186866ejb.1.2023.08.09.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 07:29:33 -0700 (PDT)
Date: Wed, 9 Aug 2023 16:29:32 +0200
From: Nam Cao <namcaov@gmail.com>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: vme_user: fix alignment of open parenthesis
 and deleted trailing spaces
Message-ID: <ZNOizFnDXojT4s85@nam-dell>
References: <ZNJKTLZ62SZMM6D8@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNJKTLZ62SZMM6D8@alolivei-thinkpadt480s.gru.csb>

On Tue, Aug 08, 2023 at 10:59:40AM -0300, Alexon Oliveira wrote:
> Fixed all CHECK: Alignment should match open parenthesis
> and deleted the trailing whitespaces as reported by
> checkpatch to adhere to the Linux kernel coding-style
> guidelines.
> 
> Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> ---
> 
> Changes in v3:
> - Rebased against staging.git and staging-next branch, noted by Greg KH
> 
> Changes in v2:
> - Fixed changelog, noted by Greg KH
> 
>  drivers/staging/vme_user/vme.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 977c81e2f3c7..741593d75a63 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -563,7 +563,7 @@ EXPORT_SYMBOL(vme_master_request);
>   *         returned.
>   */
>  int vme_master_set(struct vme_resource *resource, int enabled,
> -		   unsigned long long vme_base, unsigned long long size, 
> +		   unsigned long long vme_base, unsigned long long size,
>  		   u32 aspace, u32 cycle, u32 dwidth)

As Greg said, it doesn't look like this in staging tree, so your patch doesn't apply.

However I look it up and the last change to this line was 12 years ago, so I doubt
that it is because you didn't rebase to Greg's tree. I think the more likely
possibility is that you have a commit to this line yourself (by mistake perhaps?),
and this patch is on top of that.

Make sure you don't have any accident commit that modifies this line in your tree.

Best regards,
Nam
