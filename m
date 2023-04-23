Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB653D76
	for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 23:14:50 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-94a342f4c8eso114360766b.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 16:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682291688; x=1684883688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRxPl+Yy6WKstlVVudzzEelVVl+1ufbRFvrSlt7z3z4=;
        b=kKOr+CR+YJWTPgQArTZ5On01P8r/uh4X01AVj7ePQgsv2jzXHor9eIOpBtj/FQjrur
         aOR8WGhX9Q3KwgcuzcIwWN7v1ZuPU08XnRWCtxs4wOy4/bfXFxO8qaQENbVeQ82Qk2Ky
         SSPP+FcMP0CnjpdkhqImCFkMpduo8JwpWB2KP5PZ+5qJ4aRGFyA1XBO4mVtPkeHAXEyt
         iQ6qKBBK++b9EpEM5HBx4GOGkyL1uwPgXW5Qfkb0EnnkdRYF40xhxc/a9aLxU91YVcV1
         UHc376JVSTHGvFpS89KVvxkTlrsW/kDGqgKoLTlC4HxnOWvb6VUxGeBy4RAoyMDlBlhH
         nFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682291688; x=1684883688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRxPl+Yy6WKstlVVudzzEelVVl+1ufbRFvrSlt7z3z4=;
        b=JMKbK/U2muxBFILJKRiS4C9jwtm9e0+wEsJYpb8dZqA21B07QDUjz9jQXcgFHi3eEr
         nFwldzccmXkNxmJMMzrP62nYLyRLjq7NrratjAOu7yK3Ehao9x28053jd8/pls9WTq9M
         g0nZD9EDx0/c/4K8SCVSJ1JUbwlRMcw6MIxPenSMS1ZlMVy9ZZAM3IsqN06q9rzUlD8d
         CFFNqTLeWoBqWVtvP4rQCXEESO/oY17QAH+qXMW/p7YBO30KIF/f3uIAoxTpRESRapQk
         wuwAD5O/n9KGdI1c5L46lL5P4YpVdJFmlzyOQ0fY5Bj2rRLlneI8YHSaCByTUke96V3I
         1DUA==
X-Gm-Message-State: AAQBX9dculpfj2tKvFcDYekabcZC8ar9qGKRwxdqYd4xjfqPI4Uv8jBe
	sZjnrK5ex0pSUzl9KK0Efr4=
X-Google-Smtp-Source: AKy350bVOXeBaAJ4fnHSYKNM5U18nI3auHL5CNTy3KyZN5eIxFKc2kX5h+finBW15PFl8Bj5lT7tuA==
X-Received: by 2002:a05:6402:5202:b0:504:b68e:9676 with SMTP id s2-20020a056402520200b00504b68e9676mr10930685edd.2.1682291687923;
        Sun, 23 Apr 2023 16:14:47 -0700 (PDT)
Received: from [192.168.0.105] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id n20-20020aa7d054000000b004fc01b0aa55sm4178723edo.4.2023.04.23.16.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 16:14:47 -0700 (PDT)
Message-ID: <33083972-9a37-adf3-0a1c-39de72e79e3d@gmail.com>
Date: Mon, 24 Apr 2023 01:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/4] staging: rtl8192e: Remove unused
 _rtl92e_wx_set_sens function
To: Yogesh Hegde <yogi.kernel@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1682257566.git.yogi.kernel@gmail.com>
 <5220fec656830820f0dfd116edddbd0941a5cafa.1682257566.git.yogi.kernel@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <5220fec656830820f0dfd116edddbd0941a5cafa.1682257566.git.yogi.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/23 16:22, Yogesh Hegde wrote:
> After removal of rf_set_sens variable, the _rtl92e_wx_set_sens function
> always returns an error code.
> This commit removes the unused function and the respective ioctl.
> 
> Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> ---
> 
> Changes in v4:
>      1. Split changes into patch series per feedback from
>         gregkh@linuxfoundation.org
> 
> Changes in v3:
>      -- None
> 
> Changes in v2:
>      -- None
> 
> Changes in v1:
>      -- None
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 20 --------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index e4a726cd0b31..0bb657fda06c 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -803,25 +803,6 @@ static int _rtl92e_wx_get_retry(struct net_device *dev,
>   	return 0;
>   }
>   
> -static int _rtl92e_wx_set_sens(struct net_device *dev,
> -			       struct iw_request_info *info,
> -			       union iwreq_data *wrqu, char *extra)
> -{
> -	struct r8192_priv *priv = rtllib_priv(dev);
> -
> -	short err = 0;
> -
> -	if (priv->hw_radio_off)
> -		return 0;
> -
> -	mutex_lock(&priv->wx_mutex);
> -	err = -1;
> -exit:
> -	mutex_unlock(&priv->wx_mutex);
> -
> -	return err;
> -}
> -
>   static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
>   				     struct iw_request_info *info,
>   				     union iwreq_data *wrqu, char *extra)
> @@ -1042,7 +1023,6 @@ static iw_handler r8192_wx_handlers[] = {
>   	[IW_IOCTL(SIOCGIWFREQ)] = _rtl92e_wx_get_freq,
>   	[IW_IOCTL(SIOCSIWMODE)] = _rtl92e_wx_set_mode,
>   	[IW_IOCTL(SIOCGIWMODE)] = _rtl92e_wx_get_mode,
> -	[IW_IOCTL(SIOCSIWSENS)] = _rtl92e_wx_set_sens,
>   	[IW_IOCTL(SIOCGIWRANGE)] = _rtl92e_wx_get_range,
>   	[IW_IOCTL(SIOCSIWAP)] = _rtl92e_wx_set_wap,
>   	[IW_IOCTL(SIOCGIWAP)] = _rtl92e_wx_get_wap,

I can apply the first two patches but not this one.
Did you do a git pull before?

Thanks for your support.

Bye Philipp
