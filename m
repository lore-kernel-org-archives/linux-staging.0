Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96121DA5F
	for <linux-staging@lists.linux.dev>; Tue,  8 Oct 2024 05:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728364054; cv=none; b=GKfc1LSIoixpAeaxDprTaN148scTADmO2nwoeD1DVRokYCZAjw9RUtd7Iiyzqiv2hdhKkQFY6XDSpav8pWK0k6StuNGx94vjdolGt6aO4kOv5c/hbSiFnN95++BiSmMoJXvkIp4roMSjxAGjD7YVB8GqqhmJ2jbukw6xD6g4UVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728364054; c=relaxed/simple;
	bh=cs08hUINLa1tlIJc1zutA8MoZsueAc8wZTaJqeQFTH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpavJhCAsilRa/x3yUG638FkkDvHM6kohtU5ZhX8NvaNlk2Om2XzRises/ZvtdR6q9427NoT3dB9s/lL8lBlfNnxDryTM8oSqbnbifzAqQU716g8ggvxR+cWFjxzhwrPiDGnDPKT3KExcGD/kSP+Rt+HqJdgLrUFaxMAieD1uOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NvXBqvgH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NvXBqvgH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so52572485e9.3
        for <linux-staging@lists.linux.dev>; Mon, 07 Oct 2024 22:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728364051; x=1728968851; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=84v3jYX53zy7Wa0lGMm3t9R0biCjWmrfDRpiGVo6OyQ=;
        b=NvXBqvgHXKZtNmfqI6jm5vRvu+e3kRVXPz0jrTowUAdtIC4tdH4/1Pk97oG/dVdk8x
         FUYmd/O2v/uxAapr1R08IZQyVlczVW12df6E3pSRoA8KXmsYYO+7jUPH7SaYaj9O+z/e
         tb2NlMe2rLFMRt4PiqBj9GTY5grjwvbF6W2Df1W6RXgXvGAO9kyi67AXx2h0Sn77jVwk
         2yXqwcY3p+q5GqJK9TqsFI66FFehU+N4Qqp6ysTM3q5C2hgfMFCbFF4MTz5T942sVy3U
         lDfqWrZbVs9heRiql9RiyWt0ItfJgzBm/rK552PsnIAz4HJ51SlFCUfBOqwGE1XuF174
         Ih7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728364051; x=1728968851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84v3jYX53zy7Wa0lGMm3t9R0biCjWmrfDRpiGVo6OyQ=;
        b=KB4ObTEcVKiZlsEvv8M54Odkmt+87bPFw3r/3gxCq/mR5qfxcF2eumFUYpWgpQNW8B
         nrZ5Ndm4T0gtsQFlUR6NwdUIuOv/rP1h0McuUyMB3q1JTgcGB5ybAq/FgaJskVCYs3uq
         u2voXatS6rLMKBYVVZ3Q20CN/5KvoxxP9Emrt5H0oJ0vXX59xxH8luuOR8YF/Jkq+c1S
         miL+fxokWVaUiaogjEMCExYT8nJujEwJEl5JMI6LTtdBlqdpm/n2/vQL3kPaHc+ArNXh
         hYCBWBhI/CnPduadoLdJBkTjHEY73Ah4UAzOuMDU8BNnaYYjoNZLN2Nxh9NFNUkBSYtG
         i+3w==
X-Forwarded-Encrypted: i=1; AJvYcCVUOE+T9innSTjZXc1cLdCwciU0gF2Plrln80b1j57cdlD++KuAsoq02H2GlGyM2/vG+Io/jjJqTM+LDoa7@lists.linux.dev
X-Gm-Message-State: AOJu0YwVn/LZZ7mXAqskj4gRncZJdVI4P43N6Bgpjws6BC/JGYXZ6E40
	kifFfWXc9kpVQh6l1K4dR4DHwkVMtGZI20wbF8Xj5eKJVHYGe0zd5N9iESFikYg=
X-Google-Smtp-Source: AGHT+IH4bDBi1UKehbkFaXFJoAQiq9eJL5S6z2YFW7QYwTtih9HbBqO6OL21q/hrn82RdbRuK1CGGg==
X-Received: by 2002:a05:600c:3b07:b0:42c:b8cc:205a with SMTP id 5b1f17b1804b1-42f85af039fmr96877525e9.32.1728364051187;
        Mon, 07 Oct 2024 22:07:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89ed9d4bsm95581635e9.42.2024.10.07.22.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 22:07:30 -0700 (PDT)
Date: Tue, 8 Oct 2024 08:07:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: jonathankim@gctsemi.com, deanahn@gctsemi.com,
	gregkh@linuxfoundation.org, ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gdm724x: fix returning -1 with return
 equivalent errors
Message-ID: <15bd50de-94f3-4976-b819-6942e028898f@stanley.mountain>
References: <20241007211124.170540-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007211124.170540-1-rodrigo.gobbi.7@gmail.com>

On Mon, Oct 07, 2024 at 06:11:24PM -0300, Rodrigo Gobbi wrote:
> As in the TODO file, use proper error codes from PM callbacks and init.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Changelog
>     v2 minor changes at packet_type_to_tty_index() and gdm_usb_lte_init()
>     v1 https://lore.kernel.org/linux-staging/20241004203458.6497-1-rodrigo.gobbi.7@gmail.com/T/#m258452a56ddade60b2209479f036213e72d43f02

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

