Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801E23FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:09:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id g135so8626282wme.5
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=v05CHMGkNy/7iRKZsqcb072iAMcR/4Py4W7Z6a3AFlw=;
        b=PRZsfWp4uIvlMEd8zyEQdp3H+MRjz4psg405lNjW2xPYzAd7ITYSWIsTHWSpzEv+2v
         t/mnwGLByQblAhZXVo4OcTWDLMlY6tL/ajNMcy84H0Zd56W4aj8ddouXwuM8ScBwOTI4
         wsNP2rUsSd+ef8fx9BZXIaWs0H0ndPKKuJXnjh2SpIg6hO6oH4UZhFoZe+R/T5Bs9EfP
         cw6RAzowgH+GbZqk2l7AkKSrI6wMjWlh72biVrbR1HcLT6tSh/v0ehDBpcAlZ0iD124C
         Sp0Xv/9Y1NsDqqXbWDilB4KmxK3A4IzuMKZnpEO6RiELM1BXLrWRfir4SjWFIBpUhpgN
         xt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v05CHMGkNy/7iRKZsqcb072iAMcR/4Py4W7Z6a3AFlw=;
        b=nhjAlQXpKQj0+OH6+/W9k0dYvIhNo6p/PGGZ/J6Xvz30tPEnYPClApHmS2NcKRRIoA
         /GVqxOh1uqsncld2vJSHQseWtmf0AdCZghcWDOt6CkZ8fRKczu46Xn8iK/mMR1aJTySL
         +43mk34vj6WeNNfGoqAuwUeUtVG5RhJSodBABr7J7bfiAhD5fcZ2eCzX+pTHVKX9CqzW
         iHsyIKM2Hg9eTiCBuVv4o04/esjOvgl67VTyCwSBtfi6C+dYRmw09+DvF4VyKYMKjQ0j
         mkkQhN1dnijWJ6ccFLdn6GIH3zuhRAMyhL/qGNRKShWs4Eb0iNXk0zquZxDmP9OUzNj8
         Iezg==
X-Gm-Message-State: AOAM531C5Al+f3j1hIgufakdGP3wNR6d1p5eWyU8g+jlYmJZmembq5dW
	9QBZ6ttx0D7oHbAEFPjwTPKFprPCB5JLRQ==
X-Google-Smtp-Source: ABdhPJxLHc72SK8sGt4caZFSMgEUzyl7jwMEiCsgAu3q+ppOzWXNQYC79UJDO58a4NHQSaLk18orRw==
X-Received: by 2002:a05:600c:a4b:: with SMTP id c11mr21717493wmq.97.1630325362003;
        Mon, 30 Aug 2021 05:09:22 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::16fa? ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with UTF8SMTPSA id q13sm15116117wrv.79.2021.08.30.05.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 05:09:21 -0700 (PDT)
Message-ID: <bf3547a3-bca0-cb81-b086-0d7a9bfe6e7c@gmail.com>
Date: Mon, 30 Aug 2021 14:09:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH v4] staging: r8188eu: core: remove null check before vfree
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YSu9GQa1A3s6FYQx@user>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YSu9GQa1A3s6FYQx@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/21 19:00, Saurav Girepunje wrote:
> Remove NULL check. NULL check before freeing function is not needed.
> Correct the indentation.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
> 

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
