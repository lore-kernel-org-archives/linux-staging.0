Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE1F261590
	for <linux-staging@lists.linux.dev>; Tue, 25 Feb 2025 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474005; cv=none; b=NA9xFvVOr0nQZ+X1iKcjlBVarTGuawWYjZbBHDKBo40fdERgfg+ZyxfWWrjNCrPLtPWATTuG6C+dJgCI/Q0IpAZ40oHPmAv1vdb2oyJeK3ckFgOWU2H6Wp156Qx9UkmgzSf3UtGk8MfeCOJJ1OwQ1+fTyZS3nUEVhrYp7mB0BUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474005; c=relaxed/simple;
	bh=boTfjNidvkL9xSdsP+7mdkh2MyGP2uPcA28blGXnIoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+oxoparOibZwlPYL1lI0CkO0YiFsWUdjrriLnOcbzFpLFog6TcalKWcKwEasbHJSpND7xhQxmGLK4Zcc6/FHxgSUuHfqBQBK8SSSmvBnJYI9f3JAbW8UhAFb/BouScOl7mZZMdkiceWpd7iMGgofM7OI94Aj1TgIehfls3K7CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TkZF9JxY; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TkZF9JxY"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaeec07b705so882193466b.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Feb 2025 01:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474001; x=1741078801; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3nWDpO2Hjvy5Jf1DN3BUQOgX67wDnAHnQxhRWc9ZcCE=;
        b=TkZF9JxYZNCfmQ1icqSbsSf0zb1wXjElsyiAo+eiMdtogcyyd7cwhuMcFm/4EbPzdX
         7alxMI4eq2QOdTIfAHIZMuKl2WX7qr5vfRsxc2AIqgSN/+k+q0+gGP6sdk6NfVoi+Ces
         9HJ9hJylPEj731hKBjpECSa2a819cYXVvp9pEfawTfVH5MntaomHVK9JaUIXUeukk1hi
         +Xvn8B2i1m0/0IiukIWrSr8sbziCg+Jnf5uZTcCp0PjcBP3ROviMtTH/RKxOfGMjTyxT
         xIg4a854eYfQvCykKVaX/HHE0L23iL5EEIoKQw5PdVaaUg4OiSwEiXlGrVEAff9J6m/x
         w2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474001; x=1741078801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nWDpO2Hjvy5Jf1DN3BUQOgX67wDnAHnQxhRWc9ZcCE=;
        b=gepy9BNzxbLlw9BEZzE42qyXKe/PLRKxie15hXX8efQbQLfgDERMdtKOsIFaUEkNdm
         SseynOCnc+Jeepr2P5be8MQBsAmGyjgqLrfvjt0zZrsmA9b3pWXRaS09p3LVbios7UkB
         gU5pUJut1voSiTS5IATMGHX8fqIVo2VF0sWA+wMCSfSRJnYjOtR1+itby14lRAXIS2v0
         Tk5HnuZcLIKwZo8jJmqGK9u1uoeEOfEozxVgFZzqOWD2NVly0Zz5z2Riqg0XnFU1QBN0
         AUP9eWJn9m+/uge5yFGiIgDwqREKz0WaiHVXopAqbjN56yFbBZW0DRu3yzhqrMnZo3CG
         uvIA==
X-Forwarded-Encrypted: i=1; AJvYcCXvQomGAO4pqNyW1t/bTZnId1eXCKBgDGAHyLUv9NUZFbkhbyR/esx9zuT0r31Dg1Ser+LPBAP9lw4FnLvS@lists.linux.dev
X-Gm-Message-State: AOJu0YzQJNBxjvqxdHcYYPSpWcRATQwGExO0Vi2Fd8igQwbm8JlJvxxY
	cKOVxMlmfNl4hx5abqJJK+AVlZ+ypYmxaCSJ9fq3HvX2kg1p8PxBEF4j+QGf81s=
X-Gm-Gg: ASbGncu7MQUPufPC/8TVSTpvGKYQwci9RENxv3S5VLhTov13V540Ukbd+JrYddbrsJ6
	DI1sZsG7BIkkYuCI2P9tjMhoEMldpbaYSyInYeWbaVCWMSD+dkKydy+f1jz5lSB+TZ5e1pKrYeW
	veL0KDu70fl3B3xrxq995rt9J8ZcSrnvBAO+axXjDHSCVcC+g+uz3aPJ8QfEaxx+Lmnm4dGkWKi
	BY+PiDuKRtGDeit/3phZyZFTERJn9sPEWuELWUb5zA+uw7RTUlxaVLIx4beoWRQ+V7PBlzKV5ER
	6xLQZSLuBQm5WYE1JL4YVyUnnOJadTQ=
X-Google-Smtp-Source: AGHT+IHamUcVmT0cGXoadH2vs+yJ3faYw3PpkiOoCJcL9UZbYnBclxMPxwyo75rCi5dXwBfvFaNHbw==
X-Received: by 2002:a17:906:7311:b0:ab7:cfe7:116f with SMTP id a640c23a62f3a-abc0de0de62mr1522518766b.46.1740474000688;
        Tue, 25 Feb 2025 01:00:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed1d68de8sm105893666b.70.2025.02.25.00.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:00:00 -0800 (PST)
Date: Tue, 25 Feb 2025 11:59:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Add return value to request_control
Message-ID: <f7521c95-e69c-4618-b078-283c156ca594@stanley.mountain>
References: <20250222202301.3729-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222202301.3729-1-dpenkler@gmail.com>

On Sat, Feb 22, 2025 at 09:23:01PM +0100, Dave Penkler wrote:
> A number of drivers are unable to release control due to
> hardware or software limitations. As request_control was defined
> as void - no error could be signalled. Some drivers also did
> not implement request_control correctly by setting
> controller_in_charge instead of system_controller.
> 
> This patch changes the prototype of request_control to int
> and adds the appropriate checking and returns. In the case
> that a board cannot release control EPERM is returned. The
> faulty implementations have been corrected.
> 

This patch is hard to read because it does several things:
1) It changes the functions from returning void to int.
   This is the overwhelming noisiest part of the patch so
   it's hard to even see the other changes in amongst the
   noise.
2) Returns -EPERM if request_control is false.
3) Changes some stuff like SET_DIR_WRITE(priv); and
   ENABLE_IRQ(priv->irq_SRQ, IRQ_TYPE_EDGE_FALLING);  I can't tell if
   that's related or not.

You'll need to do it in two or three patches.  The first thing is to
just change the void to int.  That's a simple mechanical change.  The
only worry is if some functions are returning an error code on failure
and I don't know the answer to that.  (That would break git bisect so it
would be against the rules, even if it's fixed in patch 2 and 3).

The actual logic changes will hopefully be easier to understand when the
diff is smaller.

> -static void agilent_82350b_request_system_control(gpib_board_t *board, int request_control)
> +static int agilent_82350b_request_system_control(gpib_board_t *board, int request_control)
>  
>  {
>  	struct agilent_82350b_priv *a_priv = board->private_data;
> +	int retval;
>  
>  	if (request_control) {
>  		a_priv->card_mode_bits |= CM_SYSTEM_CONTROLLER_BIT;
> @@ -354,7 +355,9 @@ static void agilent_82350b_request_system_control(gpib_board_t *board, int reque
>  			writeb(0, a_priv->gpib_base + INTERNAL_CONFIG_REG);
>  	}
>  	writeb(a_priv->card_mode_bits, a_priv->gpib_base + CARD_MODE_REG);
> -	tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
> +	retval = tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
> +
> +	return retval;

Get rid of the retval variable.  This should be:

	return tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);

> diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
> index fd2874c2fff4..3d51a093fc8b 100644
> --- a/drivers/staging/gpib/common/iblib.c
> +++ b/drivers/staging/gpib/common/iblib.c
> @@ -418,12 +418,19 @@ int ibsic(gpib_board_t *board, unsigned int usec_duration)
>  	return 0;
>  }
>  
> -	/* FIXME make int */
> -void ibrsc(gpib_board_t *board, int request_control)
> +int ibrsc(gpib_board_t *board, int request_control)
>  {
> -	board->master = request_control != 0;
> +	int retval;
> +
>  	if (board->interface->request_system_control)
> -		board->interface->request_system_control(board, request_control);
> +		retval = board->interface->request_system_control(board, request_control);
> +	else
> +		retval = -EPERM;
> +
> +	if (!retval)
> +		board->master = request_control != 0;
> +
> +	return retval;
>  }
>  

It would be better to reverse some of these conditions are return earlier
where it's possible.  (Always do failure handling, not success handling).

int ibrsc(gpib_board_t *board, int request_control)
{
        int ret;

        if (!board->interface->request_system_control)
                return -EPERM;
        ret = board->interface->request_system_control(board, request_control);
        if (ret)
                return ret;

        board->master = !request_control;

        return 0;
}

regards,
dan carpenter
