Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E22F25;
	Mon,  4 Apr 2022 18:47:36 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id z8so11004126oix.3;
        Mon, 04 Apr 2022 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1Hoq9zXJV39q89hBa70SrMFhPx8RZY0vhEzpf12yaGE=;
        b=LSDGLhsnVOEx9ODwTEz2zHFdkwTWjGz5Yo86ybGpgs1MipIaI4GOjquCyXvF9ddLuM
         VoaKZ6VLJF53zEIJDCd4sMGtAQFALWJeU5zPvaToQUZ0owHRy3bMhnaD2Lgjr8O4sfEb
         5UuE4j3b8f5YfXQt0y6PC6UZljX+obS8xTeM5hh6Yh1d2dNhmGJE+WOdiQmqLFHTaHTB
         USikjQjDFJ2FnR/mouImDqGzIdaPd5up5AHTQvOGmZGSabhc0sAMMwcuHHitW+3Ay2TA
         QntueumZ9NdCyF/kx897lTqDNdgz9Z7lx9lwsZbIjR0B0EsRsCiWp2+gpmM5suJQGgVx
         oUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1Hoq9zXJV39q89hBa70SrMFhPx8RZY0vhEzpf12yaGE=;
        b=493eCLvauXI7pOw6BEs7jues5+x0Lk45JfFiy0Gtz6GSPriQgHQPEjQ+W73y8wcCwO
         Ai6JR0q0hf4mdHePZ96G8md91DVYM6beKEQnH3odrUprMUJ2SGzIv3XvDfEEILv85KhY
         /KauzgJki1FoqHsgkFjPpS0yoyTae7WRC0MO++xAmeQIV3vxXkTGIeun2FStGfSLqL/i
         b6x8g0YuGq09WeIyIHUGrnbtG+6EVdMqTH4X8Gfgxjhf7qMJAe4ZbGtXrLCvqEdZ6O6Z
         nI9Kt1Omhg+jimDOG40xVb5pRo0U2CyPQKhX2O6LcQQkptgxWGdz/nOa81El74xgohf5
         Z64g==
X-Gm-Message-State: AOAM531VIvq+ica2x3M1YNgssqf1oxnqX1cJcwZD2jmQ1eCBjGPA7FLR
	864HeMiFOKHVXuLw3v5jTrk=
X-Google-Smtp-Source: ABdhPJzEjbx27tmxLs/LVr3uhQkFFqUI9HaEIAsh0oSN0nUwdqNC2wsAJHzzG7/fEE8PMynXI3Gtkw==
X-Received: by 2002:aca:2b14:0:b0:2ef:89b7:a885 with SMTP id i20-20020aca2b14000000b002ef89b7a885mr264764oik.16.1649098055299;
        Mon, 04 Apr 2022 11:47:35 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1004? (2603-8090-2005-39b3-0000-0000-0000-1004.res6.spectrum.com. [2603:8090:2005:39b3::1004])
        by smtp.gmail.com with ESMTPSA id u16-20020a056808151000b002f734da0881sm4708936oiw.57.2022.04.04.11.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 11:47:34 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <c8461d9c-dda1-3c1e-0e3b-169073e8c4d0@lwfinger.net>
Date: Mon, 4 Apr 2022 13:47:33 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] staging: r8188eu: Add line after declarations
Content-Language: en-US
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
 outreachy@lists.linux.dev
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <860d8e222e2b695ce5cb4f48aa46a7f66e05d8e4.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>
 <19d8f316e43d16c9341f7fe94e68534cf60cc05c.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <19d8f316e43d16c9341f7fe94e68534cf60cc05c.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/22 09:39, Alaa Mohamed wrote:
> Reported by checkpatch:
> 
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 7c664f80fa99..f7811b46db1c 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -313,6 +313,7 @@ void nat25_db_cleanup(struct adapter *priv)
>   
>   	for (i = 0; i < NAT25_HASH_SIZE; i++) {
>   		struct nat25_network_db_entry *f;
> +
>   		f = priv->nethash[i];
>   		while (f) {
>   			struct nat25_network_db_entry *g;
> @@ -339,12 +340,12 @@ void nat25_db_expire(struct adapter *priv)
>   
>   	for (i = 0; i < NAT25_HASH_SIZE; i++) {
>   		struct nat25_network_db_entry *f;
> -		f = priv->nethash[i];
>   
> +		f = priv->nethash[i];
>   		while (f) {
>   			struct nat25_network_db_entry *g;
> -			g = f->next_hash;
>   
> +			g = f->next_hash;
>   			if (__nat25_has_expired(f)) {
>   				if (atomic_dec_and_test(&f->use_count)) {
>   					if (priv->scdb_entry == f) {

Acked_by: Larry Finger <Larry.Finger@lwfinger.net>

That applies to both patches.

Thanks,

Larry
