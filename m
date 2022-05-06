Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D378D807
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 11:22:17 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r192so1690169pgr.6
        for <linux-staging@lists.linux.dev>; Fri, 06 May 2022 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jwgJ3xGvdcAfXK7drFXwrp4QaKarW2SpAQVEU9d/grI=;
        b=e9GFosRQ6W0+vEOkuO7f9LQfl+KbuYNVkpG/PPZfsJmGJiMLAjBTztTOgE2JzHYkTf
         3nUQtkcy3uCk7qsMb/mw7B4JLTBS1p8BGYS6sDtyoLMu05WwYScoOB+a3Kz96/12btf3
         rmYyFTa76Fhv+oc5uc46TGLXdh73MgQkkIThVOKWBH+N+uIV8ClAOD4k6aMkDuloDv1q
         8C9S/TubxZRxdWv5PRtZo6CzQaKpE/0zsnds2RI+k/jD8WK3QIKpxXBaR5ulnXycVyL8
         OHeHbMIswYpmgytQ4ItBvMOzxyBT21vVnrpYSMRwXovv8WMFC8oFfiArYpHUY4kbw7t8
         NA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jwgJ3xGvdcAfXK7drFXwrp4QaKarW2SpAQVEU9d/grI=;
        b=4ft+m61IxF+gCRGCFK6Bbv01MiDpUJbhzwtH7qK7ZueKv53FmeIg198A3IBR3m22y9
         FTGZ52zjMrECLCYmTFJhSxGiFTAjzWahow/jjgInZ1+8n5KvL7wjl3mabXhHy+eecKGG
         5cXLwwYqn6r7Fz9+vpo9bbHHNBgy/dr+0bbqdwsuYSSeEThgTfjKHXX53xk7szYE/SZW
         sjnqAPqjBQem/oaO5uqFENiTsCnosdnvG38xfx1kE2GY39trClL5zfKL+zAUF8wiLbG4
         B/hrK6q9OZHxh/p7BJrKv0OV6iOQqLFag1rHMt4eC4B3pD7078F6FVzs5faz9sYlnMwZ
         1xQg==
X-Gm-Message-State: AOAM5317bTWnU1291Hd0ZS7ogFa6W8aYVrfUVAPlGcjs/lbGN7mwx8Gr
	I/VKRZAKSw7DdgxLI7INhtY=
X-Google-Smtp-Source: ABdhPJyLBON66drf32L+UK9dmJKCWx8kmYbYwrfo8N0c12KPCbuCRYwmVQBtwVik8+ziSv1z/8eytw==
X-Received: by 2002:a63:87c3:0:b0:3ab:5ca7:1763 with SMTP id i186-20020a6387c3000000b003ab5ca71763mr2373343pge.552.1651836137341;
        Fri, 06 May 2022 04:22:17 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id d28-20020a634f1c000000b003c260491adesm3016425pgb.82.2022.05.06.04.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 04:22:16 -0700 (PDT)
Date: Fri, 6 May 2022 19:22:09 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: paskripkin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8712: fix uninit-value in usb_read8()
 and friends
Message-ID: <20220506112209.hslb67cuinntusuc@ppc.localdomain>
References: <cover.1651760402.git.wanngchenng@gmail.com>
 <b9b7a6ee02c02aa28054f5cf16129977775f3cd9.1651760402.git.wanngchenng@gmail.com>
 <20220506071023.GB4031@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506071023.GB4031@kadam>

On 22/05/06 10:10AM, Dan Carpenter wrote:
> Setting "data = 0" will silence the KMSAN warnings but it doesn't fix
> the bug which is that r8712_usbctrl_vendorreq() treats partial reads
> as success.
> 
> The usb_control_msg() returns negatives on total failure and it returns
> small positives on partial failure.  So take the code that I gave you
> before and put that into r8712_usbctrl_vendorreq().  That's patch 1.
> These patches become 2 and 3.

Ah, you mentioned in previous review "But then another problem is that
"status" can be less than "len"." I missed it then.

- w

> 
>         status = usb_control_msg();
>         if (status < 0)
>                 goto free;
>         if (status != len) {
>                 status = -EREMOTEIO;
>                 goto free;
>         }
>         if (requesttype == 0x01)
>                 memcpy(pdata, pIo_buf, status);
> 
> regards,
> dan carpenter
> 
