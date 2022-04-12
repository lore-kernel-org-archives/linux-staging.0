Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D633D83
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 20:39:00 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id g21so23608432iom.13
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 13:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a8eg2yzAecVeUuwX/DvYd1G0G8R3IZjwawoKgnX7++A=;
        b=RoRUBLBNEdFp6tHUcgRo1ArWP9/7EpvS8lI3VgZN4k528t6NxFPQEZ240Fl3J3qPbA
         hDk7g5226Whc1WrnoxKw0HGvFkfSx1GZPBsBbOVUI9c0DDlsXd164UJDlaedPbNPktXw
         NP0r7q73+2fTY9yoBPt5V9WSFQ/+wBCNHlCcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a8eg2yzAecVeUuwX/DvYd1G0G8R3IZjwawoKgnX7++A=;
        b=bzYHyBVE+zRG6vpQC9DKfZT41WhNwv08ISFzaAgXDqyZz7210bCu0LUvQq34lcHDj8
         YNlD4ai7GbW3KnCJ2nsocA3Kt2lHAOcVH6WfjCKHGcNj9wxoGRjsWfcd8k1CwgJvHo6n
         GYZizhMKIRqSK+VVuT55CH6dxx7JbXVD2LP3svzbiv2fKaaYWzLOTRABpv1eVnPOcWrq
         dlGFAGlW3XzXS3IqYP0WVaT/vY4nEFVounxuVc4K4OAxBfk912yTO2ZiqlAN1XgQlbVA
         NC0HRfErhSkJJscG6zdVGuY+0885xbaJ2uu7j4H99/qs87+jBMt4b87YZrUmCri+zy1q
         608Q==
X-Gm-Message-State: AOAM533S+GVLMYTh0kpmKc6eHjKHbcJeCMn6C9xcnRox5pbUJTwxGvFA
	ba6W2Bk74k6FweMpy4jGMod5gg==
X-Google-Smtp-Source: ABdhPJyZwF3N9eKCE+uoniArzYLmJrGKYpGN52eFh5MJtZwJUiayFr7Ejn+4wk0Cgoeay+Yn7sAs4g==
X-Received: by 2002:a5e:a717:0:b0:649:6328:792b with SMTP id b23-20020a5ea717000000b006496328792bmr16283519iod.54.1649795939583;
        Tue, 12 Apr 2022 13:38:59 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id l14-20020a05660227ce00b00645ebb013c1sm25513647ios.45.2022.04.12.13.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 13:38:59 -0700 (PDT)
Message-ID: <34645b35-d857-cb57-77e2-2b913a2a0f95@ieee.org>
Date: Tue, 12 Apr 2022 15:38:58 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] staging: greybus: correct typo in comment
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, johan@kernel.org
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <cover.1649793138.git.jhpark1013@gmail.com>
 <811ff26b07cf61efcc2814ed5033e8864ef16d7e.1649793138.git.jhpark1013@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <811ff26b07cf61efcc2814ed5033e8864ef16d7e.1649793138.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/22 2:59 PM, Jaehee Park wrote:
> Correct a spelling typo from 'Atleast' to 'At least' in comment.
> Issue found by checkpatch.
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>

Thanks for updating the subject and description.

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

(When you send version 3 of these patches, please include the
above line above your "Signed-off-by" line, to indicate I've
reviewed it.)

> ---
>   drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index bbf3ba744fc4..45afa208d004 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
>   static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
>   {
>   	/*
> -	 * Atleast for ES2 we have to meet the delay requirement between
> +	 * At least for ES2 we have to meet the delay requirement between
>   	 * unipro switch and AP bridge init, depending on whether bridge is in
>   	 * OFF state or standby state.
>   	 *

