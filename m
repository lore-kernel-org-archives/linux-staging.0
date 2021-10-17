Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E72C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 12:48:13 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k7so35669304wrd.13
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=me2TIHQV0+mexzAz+QSM8aL7ERExKXxDrQ4Wy7szewk=;
        b=ZC3VhWctorrkUnyZigLBDwV7NrY2xSJIyFY33Ce3Qt1lqOUqb8SwsWG2s33Tf8c6Gk
         Yjxi1rgSu0aRUXYfHrJQnqsDHJedFrkmxYqtb+OYLvX4W40T8VyGx8l3SK4b9a3qsnLe
         RIDxrPnzN6v4cf9ZSIpGknDjVMtItcd1YThD6Kg5+0UpwVoSp8wzfLZo/XjpU7GpEwGw
         06km0E1IE7rzpcjOY293skLrg7SE1F7xDFbL46cM8XDevLWZjt7aXCCPAuSEGSq8urxb
         LCN79dXGPhBp9VMZi2hph1ELm5/6cWGspxsBUFGinn0rQLddSBb7sQXK1qRhGoNxjDH/
         rrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=me2TIHQV0+mexzAz+QSM8aL7ERExKXxDrQ4Wy7szewk=;
        b=oIAgoH763oNMOCyuTl1cb/P/PAasy0R1vr0Xp8cBA45ciYDFDt153U0xFBkneSVlbm
         KijuG/LwQ8ta41vbZBzAiQNGxFIi9YylLHpq3s7QAMf8mFgL6PsdclPkM4S7k6mr4L8+
         eHD/BbQGmgu3liS3dXi2pNxTgaJFupkGStESUxLZgSzXnUt1OGcP2XDCtZuXYsKyCiyo
         oZWcuk6kPy8exnD2LkIwaaTuqneP90YEsurN1SuenZNGjUWUCpfpRzUgL3I4MPmuJAjM
         JrjVSNa308CzMv0OEseu/yRfKhjY4/nzvDBli9el8KttKbtt/z4xMv/FVbiLOJqQEWYc
         k/9w==
X-Gm-Message-State: AOAM531d4FChFCBTU4JEz56txL6lqEoCjha2guk4IZH7lO9hj7v09UzB
	XfqmCqbNiuO6yOR/bOkeydY=
X-Google-Smtp-Source: ABdhPJzDrQhfqQlwnp5//tKCEb2Y59T77LZVehz5SmrozGokJMAUocwtCcZgKx1pv7rnbs5CShrZLA==
X-Received: by 2002:a5d:6e07:: with SMTP id h7mr28750509wrz.316.1634474891998;
        Sun, 17 Oct 2021 05:48:11 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id r4sm12454719wrz.58.2021.10.17.05.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 05:48:11 -0700 (PDT)
Message-ID: <7c86d763-930d-ec80-3ad1-f3d056c27291@gmail.com>
Date: Sun, 17 Oct 2021 14:48:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] staging: r8188eu: daemonize is not defined
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016181343.3686-1-martin@kaiser.cx>
 <20211016181343.3686-3-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016181343.3686-3-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 20:13, Martin Kaiser wrote:
> Remove dead code that depends on daemonize.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/include/osdep_service.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
> index d148137adf39..ee8a64bb3126 100644
> --- a/drivers/staging/r8188eu/include/osdep_service.h
> +++ b/drivers/staging/r8188eu/include/osdep_service.h
> @@ -162,9 +162,6 @@ static inline unsigned char _cancel_timer_ex(struct timer_list *ptimer)
>   
>   static __inline void thread_enter(char *name)
>   {
> -#ifdef daemonize
> -	daemonize("%s", name);
> -#endif
>   	allow_signal(SIGTERM);
>   }
>   
> 

Acked-by: Michael Straube <straube.linux@gmail.com>
