Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837543FC3
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 19:38:36 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q26so16398953wrc.7
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 12:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=c6DbKWeeuhyIQk/sjR5gJ2Num3qwAgw1fKp51/8HpbY=;
        b=Q8+5Fs8fNNTZntiKDFNbaSpGrjYmQD7GVzFqb6ch5BoIw0spXXKGxehoszaG80RNTz
         hhMxqj6D0QZjaYR8f0LhVvzVtczxcldm0lWur3fRndY8bKFt1MnHVZ0jWe/mDr6IgS4C
         yJAOnWfyT1nEnMDfvyNesKRTBjovnmyfKEtnD5IQKVDvLyCnHqKOqjMHeYqZXBEkYwk0
         cYTYAY63t8JchWXbwcTZ7yTkgTN+OVX1QpXvoyNV18YTZsulKtZ55x8vO11aSDK6TU51
         W4yCZTjPKDTVZpgk8xgydcxFOs34xXCgEar0pFlwnlTKhcWL6PXum3lVGetE4opx2I0g
         /1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c6DbKWeeuhyIQk/sjR5gJ2Num3qwAgw1fKp51/8HpbY=;
        b=PlmqzxxBH0toxqWN/+6bkKvNnligjqD8vVKA2rB5cfglZYZuQZ7OASMeIN5JbeNVEl
         XLtNPYAYl28obrD0hHTxGBj4T2kEoySUkgbeO0RPyW4blLlmwIVnLBfCEsTeUlPnZ7g+
         kdlY5LqFMYRD95g+qzWNGjcOXqqtHYTwNU2z/O0489Eq22GuHlrFOeRmlLNLXmfDxlQx
         nNWu6wyiF49KFD5SmsbNY9yHQkie+JwHU2b3CnAk9sAoBbEgPi8nZ4RAGq4eAkXM99GZ
         k0ZOkjTgRSI+D1CENj1yX/+7pViG6GlJIIzqxTdoD0G/NeyrJI/Jl7e0Q4LAsUOEEISD
         2dLw==
X-Gm-Message-State: AOAM531+QXawcHK8lHk9By14QtKR6WuFL+X+kk4dKWka5DigZVOTcc6z
	ArvJPaAZ1lkuuMBVDlX8pvg=
X-Google-Smtp-Source: ABdhPJyeNb/QodalatxHQ8M39Shvt3YxxNv1ndi5rl5f7lljsUhavpCTCWIs/1+XcvvnU0ACRJxvRA==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr14483338wrq.59.1631561914937;
        Mon, 13 Sep 2021 12:38:34 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::1db2? ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id n26sm5745365wmi.43.2021.09.13.12.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 12:38:34 -0700 (PDT)
Message-ID: <1feb008a-d13b-6b27-5e1f-e56fed37cd3e@gmail.com>
Date: Mon, 13 Sep 2021 21:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v2 3/8] staging: r8188eu: _free_pwrlock is empty
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210911141521.24901-1-martin@kaiser.cx>
 <20210913185110.3065-1-martin@kaiser.cx>
 <20210913185110.3065-4-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210913185110.3065-4-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 9/13/21 20:51, Martin Kaiser wrote:
> -void rtw_free_pwrctrl_priv(struct adapter *adapter)
> -{
> -	struct pwrctrl_priv *pwrctrlpriv = &adapter->pwrctrlpriv;
> -
> -	_free_pwrlock(&pwrctrlpriv->lock);
> -
> -}

the prototype of rtw_free_pwrctrl_priv can also be removed
from rtw_pwrctrl.h,

Thanks,
Michael
