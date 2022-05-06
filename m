Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25C0620
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 03:07:29 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d22so6146762plr.9
        for <linux-staging@lists.linux.dev>; Thu, 05 May 2022 20:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3ZByRT3W13dRTMM5enzqx7Ee/WWHJauBDk1QFBEZYWw=;
        b=Mg12Qtv0ZM0LhpjqHsYBTtzhGoAwMa8SQB5W/EjZKXOFHI04Cx3pwdzkWOeu7ekfn1
         BFmxxXu009tb+amypixj4lsdWYm4cdt9mgdehcIk8ClEE+CvKr35yEOs7oDL81vbaNaB
         MbMJwPjY3+6Wz9dp8K1UXVSsf9YWgXF6s/w9T4X8PqArxD5hOS7qC/u5EVE6yyf/GeSK
         oRV76j3+mmrzMKGFHntwJhGIUQnDpJ24rZkcdT38AS7/t5OX/aZDiarD9MhO/TCqVW48
         /Q5TRi5fffE9yttPFL/j5tJwNUxxYfziQLwVMEEAgZ8NwieshH8Z9jo6/b5GmOn5l+n9
         0j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ZByRT3W13dRTMM5enzqx7Ee/WWHJauBDk1QFBEZYWw=;
        b=cUP08pQMveBk46+xuwy2K76/T07evgp/73fPQrS3UKb8ij6Ch+KfI6QRvyHqz8dunw
         /eWKUozJc4F/FEttRwgqtoe9iMWpLXieZgFI2rygQsDktzKVDxUBPMnd/0gnoM/eSV85
         DmFuy1ixG2F++OTVjjalsMFB3vjDRLkZRNfEf0LV1Zk1WWHDcTDI75IxIwd/qPAmPca5
         R/soME8lZVe/Zzfk4pIk1q9U6E+4RjajOvMDPbYQtt/JDe9Y9pkmHTATFJMggGSVh27k
         OEnKnPR8qt7JW5dImNE9utQi28XMt3qThR8U8sykpK5vS7hKitupzwDV+oKSOYuycHGn
         Jx/w==
X-Gm-Message-State: AOAM531oVZVvIqUhGIdd8fKy2dTcnfq6Feiu5pnas/PgasYMAcI+OFtg
	ryksMB6xXX2W19sTgYRsHxc=
X-Google-Smtp-Source: ABdhPJwh2T2F23dAug4Y8Cyl2dnBafwB5p1U9LWuACgExswv7MHbLuufj2qC1170h/Lj1rGgkdfikQ==
X-Received: by 2002:a17:902:ecc8:b0:15e:9e46:cb7e with SMTP id a8-20020a170902ecc800b0015e9e46cb7emr1398821plh.111.1651806449179;
        Thu, 05 May 2022 20:07:29 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id y13-20020a170902cacd00b0015e9d4a5d27sm395853pld.23.2022.05.05.20.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 20:07:28 -0700 (PDT)
Date: Fri, 6 May 2022 11:07:24 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: dan.carpenter@oracle.com, paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: fix uninit-value "data" and "mac"
Message-ID: <20220506030724.bqa3braybukvnp7f@ppc.localdomain>
References: <20220414141223.qwiznrwgjyywngfg@ppc.localdomain>
 <20220414154215.GL3293@kadam>
 <20220415094705.aibh3jr4wzhddmud@ppc.localdomain>
 <20220415095721.GR3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415095721.GR3293@kadam>

On 22/04/15 12:57PM, Dan Carpenter wrote:
> 
> But in r8712_usbctrl_vendorreq() you really need to make the other
> changes I mentioned as well.  If you want to do it as a separate patch
> that's fine too.
> 
> 	if (status < 0)
> 		return status;
> 	if (status != len)
> 		return -EREMOTEIO;
> 
> 	if (reqtype == 0x1)
> 		memcpy();
> 
> 	return 0;

Hi Dan and Pavel,

Sorry for the late reply. A v2 patch series is prepared, in which the
uninit-value bug is fixed by adding error checking and initialization.
In that case, r8712_usbctrl_vendorreq() is not touched any more. So
WDYT to refactor r8712_usbctrl_vendorreq() in another patch with the
code Dan mentioned above and usb_control_msg_{recv,send} suggested by
Pavel? And for now, the patch series is just confined to fixing
uninit-values. The patches will each focus on one thing that is easy
to understand.

thanks,
- w
