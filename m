Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA7E1FA6;
	Mon, 11 Apr 2022 21:34:01 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id t2so17706338qtw.9;
        Mon, 11 Apr 2022 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uuFibF4OxkG46d8nG6S8jcUaTPc4gB8s2hmmg7deyQM=;
        b=LgBoifsmSvUQrbTiWoGbY+jOAfZMw/mKBbqrU6fOuWtI/8mTpBb+BauLBE3fJ3ydwF
         bh/oHnw5H1O17LYihx8QKK0oNnAarfU7RI9HM3V6bQMubfD5w2cf93KNRR6xnVJwQGZr
         jqZ7pbTlBEmqum5MA2lzQYDngd0mTcdKZpOtzUUhlTXlOleOlihhlzL1tJVwbVaa6GAJ
         W2ltTdONJ26K3Ov9LAQuoIHbcz1O6NNxrjc0Ms3Zcqg1YrGf+L9uRBu/mGusrknvvp4w
         kKTeJx5invEjUN+HVsmM9RAsxVk3IqSy7r7bREQNXW7SvoUAIqLDFQ9RnXXYKKj7uIUD
         3TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uuFibF4OxkG46d8nG6S8jcUaTPc4gB8s2hmmg7deyQM=;
        b=aep57XqXVkRWvcEcsRJ+4RNcqSyda9PCpb0zjwrOunbkcSE/afmVZS3nyq08/Vhh5x
         QkkUcbAfWFZNQNLK0hQH7Mpimu54Sh/J65z7qXqR/WNQq8/cnNNTIwiRXUjb/ggAYOIu
         HqlrIcSvPddcf2b+y4XSUfu/9o2iqcSbspOdItJpQm2N/Q7e0OVM+wFxrFyvRYiXQsKD
         c6DfyqDMcAyP5XAJMyo9y8mgPXqkP8oHeH79nummalynP0TDK6owLoSDc4lLHXb7SfRh
         PrCEFm0XXhDZdaYMXzL46NyFpev2+7tx249P7IG9+R4IPmwPqLU0xLWcrDzwebNOjJtF
         68jg==
X-Gm-Message-State: AOAM533/1likfvBuNOmClmjSH0h5w3F6O3kE5Cde5Ct/BfKN8AVoNNcp
	fAL3ssikuw/KKI9pb5FouubdBwbfPid7vQ0c
X-Google-Smtp-Source: ABdhPJxCi+h9KO0E/pFpbT9XItBWyZrGY6ORXyiMj9v/kcay5KHFvnl3ek7esmOrtr1BfhVWgBhJNQ==
X-Received: by 2002:a05:622a:1c0d:b0:2ed:1335:97ba with SMTP id bq13-20020a05622a1c0d00b002ed133597bamr1029980qtb.485.1649712840949;
        Mon, 11 Apr 2022 14:34:00 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e15-20020ac84e4f000000b002f02b21f1b7sm704211qtw.57.2022.04.11.14.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 14:34:00 -0700 (PDT)
Date: Mon, 11 Apr 2022 17:33:56 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: greybus: correct typo in comment 'Atleast'
 to 'At least'
Message-ID: <20220411213356.GA2799078@jaehee-ThinkPad-X1-Extreme>
References: <20220411212512.GA2797956@jaehee-ThinkPad-X1-Extreme>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411212512.GA2797956@jaehee-ThinkPad-X1-Extreme>

Please ignore this patch. It was an accident. It was supposed to go in a
patset. I'm so sorry about that.
-Jaehee

On Mon, Apr 11, 2022 at 05:25:12PM -0400, Jaehee Park wrote:
> Correct spelling typo.
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index bbf3ba744fc4..45afa208d004 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
>  static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
>  {
>  	/*
> -	 * Atleast for ES2 we have to meet the delay requirement between
> +	 * At least for ES2 we have to meet the delay requirement between
>  	 * unipro switch and AP bridge init, depending on whether bridge is in
>  	 * OFF state or standby state.
>  	 *
> -- 
> 2.25.1
> 
