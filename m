Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8FD3FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 10:41:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so1968782wml.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 03:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5rDmhIw6VgN9dJ5nGPffKFoni3qJUX9jTAANRGcjZ2o=;
        b=YgLXGaQpZBMKnEU+ZfWneSFhG9KqP7L2XH1a4tFQ/Okmsg/6TOCrc3Pau30Xn12GeD
         Dhpk0P520kQHQIBmayDgFN/WaBXtOUxdx3a3ZOUsxqmUWQXNPtctchz6d34gGbLWDvtJ
         RmrJZ2Hvb1ZccmvLPZ28cfrqLKj4fwk70sZNcsJKqM1HppgZc5JTz5MgYyu1YWLuRAEL
         VUpVjxHq+Fw6/LQ+nXvIAynwjF1LsxbQjRsZxspYaOcy2dDASJnOM7JuO1RlM8cW6pDS
         LGaXGijKfqpc//33hnH5NWZuL1MB75nuEVc7IkInwTX5FJtj+tmYe4SNQVVwO8fv7qPL
         27kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5rDmhIw6VgN9dJ5nGPffKFoni3qJUX9jTAANRGcjZ2o=;
        b=bLZUct17FLp1f5lu7nkREc/6lNZ0ELcnaaSwFppeFirmrAkbGYQY36enpOWHyoQ+W0
         bh+YnffI3zDZRToMsBVAHrDVnrrb3zi3DK46GF/T7b8kmzOkvsZAPzuS0hlRc45IFzwm
         sx5FzSHtKHyWIqemRsAVX+AXc2h9eg19Vqv7me+wC8GXp4vuRs0cGK6ES712wndWjFch
         jE3wEDuxh8f6uSaAykHxww0ylugSRrLqtw7JHOb7A6hrt9BgZWoHfTf/aIAQCal9CkTG
         rR99EIzZO2H7u2sAkyvnVtV364CDVMl04vResQbmWVpaNmsZxSMyYhX9vLZHueblxDUH
         R8jw==
X-Gm-Message-State: AOAM53252ADuVMPg6VHS4qns233SvinP1GVh/0Q8qbp7hwNO+hO3na+6
	dEMwSl4H9VumMJYZZXAE+0s=
X-Google-Smtp-Source: ABdhPJxZ7vOstgAq9fZdvAEstw2edJalQi43WfTs9VFGrWdlDkYjqBFvYJq1C8P2kRJy3X29XJgrvg==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr3451832wmh.188.1629801710436;
        Tue, 24 Aug 2021 03:41:50 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::5d87? ([2a02:8108:96c0:3b88::5d87])
        by smtp.gmail.com with ESMTPSA id n4sm3118612wri.78.2021.08.24.03.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 03:41:50 -0700 (PDT)
Subject: Re: [PATCH linux-next] r8188eu: remove unneeded conversions to bool
To: CGEL <cgel.zte@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jing Yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
References: <20210824063443.59724-1-deng.changcheng@zte.com.cn>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <e851f9b3-768b-c628-a066-9c0529803db3@gmail.com>
Date: Tue, 24 Aug 2021 12:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210824063443.59724-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 8:34 AM, CGEL wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Found with scripts/coccinelle/misc/boolconv.cocci.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>

Hi Jing,

thanks for your patch.

Just a minor issue:
Perhaps you could add the patch subject to the changelog message.
I'm not 100% sure if that's a requirement, but common practice
in most cases and nice to have.

Aside from that:

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
