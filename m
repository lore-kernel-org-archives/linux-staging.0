Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4255966E8
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 19:14:36 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id lc7so29855583ejb.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=3BKjsumQ8PtZhoAH3wD+jnO31UagiaH9PNpiRZwb564=;
        b=kDK2HYpzWhIuokBAxXuR7doJoqzUmdb0JgO62oaM2YyYpTYjj6pSXKTEFf5R80TCwY
         B6i0EUSnUEAumOY8m/GGZZ0fHQHQpMdJnwVuJbacf6FQHYjFiiW7Yn8tUawz5Kv9ARIt
         BqKUUOWHCsy0vO6i/W/280bwGXCThouhQjt9GzalYhCq764wfr70QZJc0Em7a/d683L+
         zl0/4gb2Wud+SwROYX6l00eGCRraBpikLTo2Tth89YQIo0+ICZkhS9leTWJqEcQcW+t8
         f33Dcdg+k4uzG3QPFf7b7AQ2NpW/L+mTCo7OvgSfijU8LTiXRjS1vwpDmvXGmVcHmdHw
         e3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=3BKjsumQ8PtZhoAH3wD+jnO31UagiaH9PNpiRZwb564=;
        b=4A4dlk/urnE/mFe/Eme0ffekCrsu7P+lhXrRDarVewZFbnIcsrkv7iwjQJuJmgdV22
         X7seQxEXZUZHq78Fe0eC6yWlDRVLREltpe25tFkgR6URgt1qBnI5HDrIiMX9O1z6JcX9
         81LjAJon8uYJajQOAYWuslWzCPDNERY2Kn7kNri3cfPCySuUNdYwgS4ASPPcnVK4nBB2
         BH38ebUtVzikD4SD3AcxMUBH4M8ywqfuo+oqvn2+6su0DZpkUTlmEG6xsTLKz7G1d/53
         bYlc3na0DLpKxTBl7wwcVswdbcFeac9AnbEKQZUZXKjw9oyHCWAplMk19FIyO3NIf1yM
         IOvw==
X-Gm-Message-State: ACgBeo2eYKLHamkkPpS4ZIp9yTiKXK8BsZUKI2nVcOYBX+u7dZfnHUAe
	x+7lnJJ4Xf3n9ujRWbH9GRTLaQPt94A=
X-Google-Smtp-Source: AA6agR6C38/7IbmTPId+e/ANohIoyswB6kx9wrMinFcEAPWjy+BZIsmrNsCdQIGdT33u9TT7L5NuVg==
X-Received: by 2002:a17:907:2da1:b0:773:dc01:877a with SMTP id gt33-20020a1709072da100b00773dc01877amr19075731ejc.567.1663096474384;
        Tue, 13 Sep 2022 12:14:34 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id pw13-20020a17090720ad00b0073ddb2eff27sm6540846ejb.167.2022.09.13.12.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 12:14:34 -0700 (PDT)
Date: Tue, 13 Sep 2022 21:14:32 +0200
From: philipp hortmann <philipp.g.hortmann@gmail.com>
To: xkernel.wang@foxmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: r8188eu: fix a potential memory leak in
 rtw_init_cmd_priv()
Message-ID: <20220913191432.GA11048@matrix-ESPRIMO-P710>
References: <tencent_1B6AAE10471D4556788892F8FF3E4812F306@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_1B6AAE10471D4556788892F8FF3E4812F306@qq.com>

On Fri, Sep 09, 2022 at 07:45:57PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated
> in failure, then `pcmdpriv->cmd_allocated_buf` will not be properly
> released. Besides, considering there are only two error paths and the
> first one can directly return, we do not need to implicitly jump to the
> `exit` tag to execute the error handling code.
> 
> So this patch added `kfree(pcmdpriv->cmd_allocated_buf);` on the error
> path to release the resource and simplified the return logic of
> rtw_init_cmd_priv(). As there is no proper device to test with, no
> runtime testing was performed.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2: simplify the function.
> v2->v3: rebase and recover some whitespace cleanups.
> v3->v4: update the description.
> v4->v5: rebase...
> v5->v6: update the description.
>  drivers/staging/r8188eu/core/rtw_cmd.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 9c700ff..e38a826 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -58,8 +58,6 @@ static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
>  
>  u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
>  {
> -	u32 res = _SUCCESS;
> -
>  	init_completion(&pcmdpriv->enqueue_cmd);
>  	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
>  	init_completion(&pcmdpriv->start_cmd_thread);
> @@ -74,27 +72,24 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
>  	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ,
>  					      GFP_KERNEL);
>  
> -	if (!pcmdpriv->cmd_allocated_buf) {
> -		res = _FAIL;
> -		goto exit;
> -	}
> +	if (!pcmdpriv->cmd_allocated_buf)
> +		return _FAIL;
>  
>  	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((size_t)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));
>  
>  	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);
>  
>  	if (!pcmdpriv->rsp_allocated_buf) {
> -		res = _FAIL;
> -		goto exit;
> +		kfree(pcmdpriv->cmd_allocated_buf);
> +		return _FAIL;
>  	}
>  
>  	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((size_t)(pcmdpriv->rsp_allocated_buf) & 3);
>  
>  	pcmdpriv->cmd_done_cnt = 0;
>  	pcmdpriv->rsp_cnt = 0;
> -exit:
>  
> -	return res;
> +	return _SUCCESS;
>  }
>  
>  u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
> --

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

