Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AFD2F21
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 11:43:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a8so14575016ejc.8
        for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 03:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=QCeTPktxYJJYpqPYNifcdFoiHu6/qXeJE2j2d8aAenI=;
        b=GL1Cbh+/CgSAL4lkyOLwKOefU8vLz3nQuwMJBGYj4mM1R4XztOovNGryf1iPA7iQVW
         IYKceiJLM4GOrm2mE7d388efnhqADBS13cq3+itEgsnhIY6xh+i2zh0QSH/+QrdSodx4
         W7OJXxOpJoU/ga13bNfQTxrhrc+OE30EE6opusgub5o9laAkX1QPPLjIqFrrOA1KYLCK
         vhjcL+il0M5n/asvPF/0+bd+dhpqn5lATZigFV+Mo1bg9tZU12m2gZTMXSOxxEBqFP18
         HVF77tUtqaCvCyl12CgFI1CrBtPp7+66CCxTn4JGc+mkJE+QgNJ0CeO42mkBdozQN6+Q
         g6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=QCeTPktxYJJYpqPYNifcdFoiHu6/qXeJE2j2d8aAenI=;
        b=w+FrBn4SVzF1eayQsObXYIpleuA7+KUl+9dhs///Ys+HhOl7VjFPI/wjE1DBYp03Cx
         ErpDkJu4Auxhf/XzUA7MZ5344PdYRoJ8/Fl8d/WdD7XQcTzfTG0xw35F3dxIWQiV4tD6
         pOVEdVZg2LyeysxBUw8sOuM9/xKQLK1JZQ28BKXx3+zrj9H6VunaYEAjcrBHvlNniPfQ
         J7N/jjSv1RBbmMlb1qbHswPRD1WSXra97PKkPbwXCGRURhiSCALs8UllEtbdDx2nM/dE
         oPM+Cd7jrzAnJcUE8sDzmSqcB2YHhjqyDV4VEq3ZBH48h52OKY1RP23THFZa2SX4HeI5
         5cSg==
X-Gm-Message-State: AOAM533W+8k/d3R2/U1y5weAd5Vhg01R0hLMy9HSm6nr8xPg9J+I0Ay0
	LTAX0+5+stXSoxiW1zcY/pkMPN7+Kw0=
X-Google-Smtp-Source: ABdhPJwn1ys3+LzoRmVn5YCRWkSIxHeN2Y4IO6ubZzgATn0CsloRfh34+fPlncqqFtMoyKx2cT2V7w==
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr5941529ejn.652.1644493430745;
        Thu, 10 Feb 2022 03:43:50 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id j9sm3365630ejb.189.2022.02.10.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 03:43:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Feb 2022 11:43:48 +0000
Message-Id: <CHSC9NU74XQV.2L2R0WCT1UZLA@arch-thunder>
Cc: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>,
 <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Minghao Chi" <chi.minghao@zte.com.cn>,
 "Zeal Robot" <zealci@zte.com.cn>
Subject: Re: [PATCH] staging: greybus: Remove redundant 'flush_workqueue()'
 calls
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: <cgel.zte@gmail.com>
References: <20220210060205.1607792-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220210060205.1607792-1-chi.minghao@zte.com.cn>

Hey Minghao,
Many thanks for the patch.

On Thu Feb 10, 2022 at 6:02 AM WET,  wrote:

> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
>
> 'destroy_workqueue()' already drains the queue before destroying it,
> so there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>

LGTM.
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
     Rui

> ---
>  drivers/staging/greybus/sdio.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdi=
o.c
> index 37bf04c22dbc..25bee5335c70 100644
> --- a/drivers/staging/greybus/sdio.c
> +++ b/drivers/staging/greybus/sdio.c
> @@ -858,7 +858,6 @@ static void gb_sdio_remove(struct gbphy_device *gbphy=
_dev)
>  	gb_connection_set_data(connection, NULL);
>  	mutex_unlock(&host->lock);
> =20
> -	flush_workqueue(host->mrq_workqueue);
>  	destroy_workqueue(host->mrq_workqueue);
>  	gb_connection_disable_rx(connection);
>  	mmc_remove_host(mmc);
> --=20
> 2.25.1



