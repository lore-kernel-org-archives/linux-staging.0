Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB041FDA
	for <linux-staging@lists.linux.dev>; Sun,  9 Apr 2023 15:12:49 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-947a47eb908so105752966b.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Apr 2023 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681053168; x=1683645168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+F3m/Z1uNGrSrVyh1TkFgL4DP+S57DCP37l7qhIJQgc=;
        b=M1RAi9Y3eZ4oDqaOiEgfRPTe/gFBcbz7h93AcksETsvCtZ04/kx4YmzrlzVm/ifNwu
         MCw6qFNZE7iA5jmtIVXIcNLwlYMfAi+E63iZ93a7Ytms3b22G4ePknBKZDCe+Q3pVkql
         VM66Rosv6gKKASVmYOozZKyL7ALolz7ckIviCyEpfJJcHpmBjXQlOJhnvWxONOHzuNq7
         scmSYOLPLqzOiUxkLdmhX3OVRXmtY4LC3F4GQqyt245bn44/7xEuG+Q40g6EMBzvI5ZE
         b10UhGc13YUmGnL/gaddvWvVTW/vT9WxZWfMni2/nzZA6tFS+e030DPw0NAtdCbY0GTD
         iE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681053168; x=1683645168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+F3m/Z1uNGrSrVyh1TkFgL4DP+S57DCP37l7qhIJQgc=;
        b=jrJPorjHgqaw3pFuC6QrECjeQESbdycpKBcpJjTfShR12gjki9WNdpDUTOnNYoiZ5e
         TmhUxMKCEoP2uqUXEnq0qZo9QJoW+6fMoRMUbUAd6GElbFcXkEPPGCHLa/i8YbcV7B6l
         dlXQPA6pesYpMeil95IO0H0bis5v8ofoVzy9R9E4SyQi+/g0VtrqX7iad3EeiHIo0l9D
         /N9oJNjDq0i9edQg4dOMSPuBjxN6elk6fivH391bQwUN0M0LBr9cfQlq9VE8PubQ9rIS
         fOLspgpkBm0SpLjy8dih7DazASnnIpZ91KlYFtZgyM7+vVEB5Oz6RBt9+7rIBefbHxu/
         wzOQ==
X-Gm-Message-State: AAQBX9fe8mswkNtb/dN7bh56eYvYSfohLKx45KUp0ewSef2csmMRYozn
	H1WWPAJG7EpxbxvTywP66XA=
X-Google-Smtp-Source: AKy350aXdP/4zcTH5rfZ8DrW36jFFGlRTxXaKkWpBLRu6s7JDmhShcva6dhqne+aieO/JmSVru2nIQ==
X-Received: by 2002:a17:906:10c7:b0:947:f415:db23 with SMTP id v7-20020a17090610c700b00947f415db23mr4727852ejv.1.1681053167642;
        Sun, 09 Apr 2023 08:12:47 -0700 (PDT)
Received: from [192.168.0.103] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id dd20-20020a1709069b9400b009475bf82935sm4177550ejc.31.2023.04.09.08.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 08:12:47 -0700 (PDT)
Message-ID: <004210bd-0ed1-58d5-0315-47499c850444@gmail.com>
Date: Sun, 9 Apr 2023 17:12:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] staging: rtl8192e: Fix comparison to NULL of variable
 rf_set_sens
To: Yogesh Hegde <yogi.kernel@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZDK5UvVHa96ejEfU@Zephyrus-G14>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZDK5UvVHa96ejEfU@Zephyrus-G14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/23 15:10, Yogesh Hegde wrote:
> Fix comparision to NULL of variable rf_set_sens as per Linux kernel
> coding-style. These issues were reported by checkpatch.pl.
> 
> CHECK: Comparison to NULL could be written "priv->rf_set_sens"
> CHECK: Comparison to NULL could be written "!priv->rf_set_sens"
> 
> Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index cb28288a618b..a67edb81a820 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -311,7 +311,7 @@ static int _rtl92e_wx_get_range(struct net_device *dev,
>   	/* ~130 Mb/s real (802.11n) */
>   	range->throughput = 130 * 1000 * 1000;
>   
> -	if (priv->rf_set_sens != NULL)
> +	if (priv->rf_set_sens)
>   		/* signal level threshold range */
>   		range->sensitivity = priv->max_sens;
>   
> @@ -813,7 +813,7 @@ static int _rtl92e_wx_get_sens(struct net_device *dev,
>   {
>   	struct r8192_priv *priv = rtllib_priv(dev);
>   
> -	if (priv->rf_set_sens == NULL)
> +	if (!priv->rf_set_sens)
>   		return -1; /* we have not this support for this radio */
>   	wrqu->sens.value = priv->sens;
>   	return 0;
> @@ -831,7 +831,7 @@ static int _rtl92e_wx_set_sens(struct net_device *dev,
>   		return 0;
>   
>   	mutex_lock(&priv->wx_mutex);
> -	if (priv->rf_set_sens == NULL) {
> +	if (!priv->rf_set_sens) {
>   		err = -1; /* we have not this support for this radio */
>   		goto exit;
>   	}


I would like you to do more.
I you search for rf_set_sens you will see that it is declared as a function.
But there is no definition of the function which will cause an oops when 
this function is called.

Because there is no definition of the function the priv->rf_set_sens 
will result always NULL

Bye Philipp
