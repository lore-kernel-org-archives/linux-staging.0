Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA54A945
	for <linux-staging@lists.linux.dev>; Thu,  8 Jun 2023 09:59:43 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b24cd75989so1704615ad.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Jun 2023 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686218382; x=1688810382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JodGdzWAkQDzujxM3bm4FSKShtDx7dEh1i0tt1xVWIY=;
        b=enpUwJ9PRdhzHjoORDXHXE/Oyp0MBfozoq0hN1FUx5LwSOnisf+D2DR6FGwrzpnQ7D
         J5UPNNwXyiaRaRIx2ZeEMhSEfeK0u3LS/A6hxXOAgDeo00mVPaWfxx9yeRUi8jjoIDGD
         /gShvKf4tAgC2ZMDo/Gc+cpGcD2rAIk3bj7kQkzCgom52mvMVdwykw08iPZxXDcp2jMj
         VAvv6e7FCEWKSq4nM3Iwdjt80sjs3uq6g+PKHh1noZgAVmau5BDC9If8M8k7udeq6b0a
         iv52k28kKEAlNcsBEN4uh3+yxYJgVZkXHeUxjWdJrdj9KI05hUnf8o2+7hrw7+XD0h+C
         IMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686218382; x=1688810382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JodGdzWAkQDzujxM3bm4FSKShtDx7dEh1i0tt1xVWIY=;
        b=RrsIbfNmk+fLqRriTg+8g8aSQAk8gU1qnjCdujm6yrapBozVrckCBCQ1aFqmhIWpB8
         uypx6u/DgvqkSegqjouauIwRBEyEc/yRDmQBX+biFYM+Bf+PqHfXIyIYejR4hxT9Yp0F
         +iO0NOA6DuzS397TvzMilpSBudZTYu5u1wQ+E2E9UyfXZ7iUYJE7joJIE5aMzZ0BfdoF
         k7y9MyEfMQdgD8Z6pEwNiAgvUYMdkvUXDpqIuYtoRwh+240UUyU6eXxYJqDLhogzjA3G
         FgnUBiv5S8diiuuwH4TNEmQziH4//4U6iijzYZwS5ip7XSycPSa8begT00VoJlbSSRGi
         zCDg==
X-Gm-Message-State: AC+VfDzBgUDOKnZ35g110i1LWQR5d0ix3HeZM0WV1vtQvzUaLdFUsU5B
	GMqyf55XIemgEYABDy9GWe0=
X-Google-Smtp-Source: ACHHUZ4KuVPFxMt6n7hmNrAWcUnZHxg8FXaTgHSPRl7iSAZujGtwtHa+BAm6F8D4ucdb1I1ixTBzzg==
X-Received: by 2002:a17:903:32c3:b0:1b0:28a7:16d1 with SMTP id i3-20020a17090332c300b001b028a716d1mr4882353plr.10.1686218382556;
        Thu, 08 Jun 2023 02:59:42 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id l14-20020a170903244e00b001a9bcedd598sm1062511pls.11.2023.06.08.02.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:59:42 -0700 (PDT)
Date: Thu, 8 Jun 2023 15:29:38 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] staging: rtl8192e: Remove variable SetWirelessMode
Message-ID: <20230608095938.GA598514@yogi-Zephyrus>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>
 <01a162c5-f0de-47b1-97e7-8a451a89df80@kadam.mountain>
 <90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com>

On Wed, Jun 07, 2023 at 10:18:28PM +0200, Philipp Hortmann wrote:
> My compiler does not compile this patch:
>   LD [M]  drivers/staging/rtl8192e/rtl8192e/r8192e_pci.o
>   MODPOST drivers/staging/rtl8192e/Module.symvers
> ERROR: modpost: "rtl92e_set_wireless_mode"
> [drivers/staging/rtl8192e/rtllib.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:136:
> drivers/staging/rtl8192e/Module.symvers] Error 1
> make: *** [Makefile:1978: modpost] Error 2
> 
> Did this compile on your system Yogesh?
No, while sending the patch I partially compiled it 
`make drivers/staging/rtl8192e` but when I fully compile it `make all` it gives 
me the same error. It is a mistake on my part. 

> But I think it does not work because this driver is divided into two
> modules.
> 
> To load the driver I am using the following lines:
> sudo insmod drivers/staging/rtl8192e/rtllib.ko
> sudo insmod drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko 
I was not aware of this and assumed that ideally the driver has only one (PCI) 
interface so all the files should be compiled into one `.ko` file and loaded.

> So this line is required:
> priv->rtllib->SetWirelessMode = rtl92e_set_wireless_mode;
> as one name is used in one module and one in the other module.
Yes, this makes sense now. 

Moving forward, 
Dan, Greg and Philipp what would be the best fix for this issue, 
1.  Patchset to combine both the modules into one module 
2.  Revert back this patchset to v1.

Looking forward for your response. 

Regards 
Yogesh 
