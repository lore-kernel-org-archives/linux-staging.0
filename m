Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B181D1F4C85
	for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748259441; cv=none; b=qGds6EQpVtENuw4Hqjlva8jZ7TH45DeWFxuG+x7RzGjfvOX54H08LHTGaekcHKGEFnkaD+KxeyNFNI5gUiQ3NFtSwEQwfCj9ewHK4UQMcO6kcvMUp+a11ARBIZmW+DoG8bR1yz48PbMsJbtSVB1X2E4FP1cdlaUw9p37deQFzME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748259441; c=relaxed/simple;
	bh=nSDYH4WEhkI0c4mWAbs9ei0wGtWyyYjJxPJ8Zztq6V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MowomzbFDUnY+o2zW5l/TyktTeg29C3DZTzEO0gWj373p41tS9XeXzEacSHx+LSUsDPpvSsHZTlWvrUSr0/tUWYR/PqWhoIZYuIxer1GyAIkWBDddL3ox61yVqxuTqBt0tkTU8Ul0z0yK5XB+jpI9kbx1gnBB+qElZFtbPF0NeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juo77kYQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juo77kYQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a37d24e607so65525f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 04:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748259437; x=1748864237; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+rDiPz0qSiYsyHG9zqVRKjQE9VlYlwaE/0xL4WFAXE=;
        b=juo77kYQjsN0HskqJ8KvgD/q5l9SQYHyP0FynbDq2s31iR7uXSgXNyQrqaAvf0Svc8
         RAusWU7Hcc+lLlYBHWrvgmuqiFVXJbBhWeOF1pCEDYO/fsgpJmTnFzYt1wcXB32jWUKz
         /xXJEFr6EUEHJd4SlogKsi4/fvoKFblNiooonbTh3MM3wUyc99dInD0wiJiFWpoHGye9
         cH/euvOf/rd9fX42UjtPCJZKtxHSp5U4lBT0yTVYp0JAzXLACBhDACs6G304yOHKQXXZ
         zTdmVkO05euySofBnteqZ911k1+zIeONkOB/hx5g9Je8VTwN2hjBcQEdJ9ViefwF1onC
         Mazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748259437; x=1748864237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+rDiPz0qSiYsyHG9zqVRKjQE9VlYlwaE/0xL4WFAXE=;
        b=e1l0uTCPLzEVCjNaR/hwlpDUJpugcr/XsfT+WZo78OZNVcDer7+NpnY/YSWiSENNYb
         CjyriTCStRsolfU3QiLtpVFxQ9D6kRvbB2Y+qJjG6NKK+FT83cuWzww1dwUlg103nBYv
         SC5bvXxwp7vV9FkfF/pxNNhyudO06sbuqYid1Y7y2sB9Xcxjmm0Tz1v0N9PwWdzPwAbU
         orOvm4moNmo/qX4B5uU459j3XFxkw7l5Xygu/4eWin3hbMLt+8u9eipCLj7fNNBkf4cW
         L8uGxYxIfCd8dIk2NoS7OJOML5Pdrr8URZVt9nuxnFfy3IjGU6QzMpvxoetMcpgqdezc
         qqEw==
X-Forwarded-Encrypted: i=1; AJvYcCUkCgcHb6bFhl7L8nODiaFuRUAg2xDSkSIfS9h5TfrimyssmN560IpmKrkqNArLMnC/iA78BDDuni2n+GxT@lists.linux.dev
X-Gm-Message-State: AOJu0Yws6wWEYlCPDOMxtOysOAeRZ+mIMRk0JhD5j4aSY5DUM/iFD21R
	iu+JZPMTA5etMiOL5hJAZ3T96f+lQ3vFpZCT928/G0KSwQ8od+2ahIl4sJCnV3gc4tM=
X-Gm-Gg: ASbGncuWZvme1Fiw52/zW6/fPLDXHR5TV3T2XL/S8N9e1KETlWwn61EZ3+gDfDnuG2E
	vH6l5nS9dZyFbsvGkjD9Uck5CvhSH/5i2dYFoKm3O4MIHlsCNEch7DVoIKMsUEfq5u84Wi1Q+rK
	Smdv+fg1krr7BNfA1hUtq7RFlIt8r87qa5TG1pCpaoM8V0QQZ1525bYhax/lCmRk5L0sFylB+GP
	cp83VS6QGjo9mS4LNMiZsek+xbmWehDoTtJGIzSDfeglF55f7LhTFBTNiDmF/J4Ogtwk9VXJRBi
	7axB6pxMQ86IWpVHAsB8ee5sVrx2fByMq7saGCCpyY42QjivQ9KfHdIB
X-Google-Smtp-Source: AGHT+IEv5PUqkz+rdGK7cMHOMrelnch8JlHVRcoDJFXgNKq4OweFef3f63o86S/y+HO8Dwb3Au7C2g==
X-Received: by 2002:a05:6000:40ca:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3a4d8f8fd9dmr2806239f8f.2.1748259436914;
        Mon, 26 May 2025 04:37:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4cce08411sm7388745f8f.51.2025.05.26.04.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:37:16 -0700 (PDT)
Date: Mon, 26 May 2025 14:37:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: clingfei <clf700383@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: elder@kernel.org, johan@kernel.org, vireshk@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: Avoid fake flexible array for response data
Message-ID: <aDRSaZ4Rq47hjMuY@stanley.mountain>
References: <20250526110654.3916536-1-clf700383@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526110654.3916536-1-clf700383@gmail.com>

On Mon, May 26, 2025 at 07:06:54PM +0800, clingfei wrote:
> As https://lore.kernel.org/all/20240304211940.it.083-kees@kernel.org/

I don't want to have to read a link to understand the commit message.

Does this change really affect anything in terms of "enforce the 0-sized
destinations" rule?  I don't think this is a destination.  I think Kees
enabled the checking he wanted.  You should probably CC him since we're
refering to his email.

> pointed out, to enforce the 0-sized destinations, the remaining 0-sized
> destinations need to be handled. Thus the struct
> gb_control_get_manifest_response and struct gb_i2c_transfer_response
> are removed.

Here is a better commit message;

"We want to get rid of zero size arrays and use flexible arrays instead.
However, in this case the struct is just one flexible array of u8 which
adds no value.  Just use a char pointer instead."

I would have ignored it, probably but actually the
gb_control_get_manifest_response struct is not used so put that in a
separate commit.  That's a simpler commit to review.

"The gb_control_get_manifest_response struct is not used.  Delete it."

> 
> Signed-off-by: clingfei <clf700383@gmail.com>
> ---
>  drivers/staging/greybus/i2c.c             | 9 ++++-----
>  include/linux/greybus/greybus_protocols.h | 9 ---------
>  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> index 14f1ff6d448c..2857c2834206 100644
> --- a/drivers/staging/greybus/i2c.c
> +++ b/drivers/staging/greybus/i2c.c
> @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *connection,
>  }
>  
>  static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count,
> -				   struct gb_i2c_transfer_response *response)
> +				   u8 *data)
>  {
>  	struct i2c_msg *msg = msgs;
> -	u8 *data;
>  	u32 i;
>  
> -	if (!response)
> +	if (!data)
>  		return;
> -	data = response->data;
> +
>  	for (i = 0; i < msg_count; i++) {
>  		if (msg->flags & I2C_M_RD) {
>  			memcpy(msg->buf, data, msg->len);
> @@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
>  
>  	ret = gb_operation_request_send_sync(operation);
>  	if (!ret) {
> -		struct gb_i2c_transfer_response *response;
> +		u8 *response;
>  
>  		response = operation->response->payload;
>  		gb_i2c_decode_response(msgs, msg_count, response);

I like when parameters are called the same thing on both sides.  The
name "response" adds no value.  Instead get rid of that variable and
pass operation->response->payload directly.

		gb_i2c_decode_response(msgs, msg_count,
				       operation->response->payload);

regards,
dan carpenter

