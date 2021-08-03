Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D5170
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 12:39:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n12-20020a05600c3b8cb029025a67bbd40aso1667871wms.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 05:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7bd/TC29f1jODC6XC/0L2lVyB65HK/Gr36P+zQrr5uk=;
        b=hW52omMzvHHZ5R0EKchB/LoeRd4/eU5N57SVV8ghFPb1FZWDJCDTrc0FjawPXiPwSH
         psELRLn6wqn38WzGj0SwoGn1HiRO6STVE1napRYA79w+VCP5uhtQmz9Qwm9SUtJONmbl
         +z0Ux77j3jPW2uOCD+vGsgStNpDWtch0LUoEgP1DnXBFgVYAuDMcEVywAzwoAuV7gzek
         SmB+kCmAoPIpiEvoxfih9d6fu5EmdNBGgqeXsmKkjaiTvLm8vQpNkQrrgjc+KD7RLBw8
         hIYxxzBtczhT3dSordX/+IGlpGtCiQ5Gzhy+m0jJ46IPmroxV4vuIiTqT9uGk9u9BxuI
         wzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7bd/TC29f1jODC6XC/0L2lVyB65HK/Gr36P+zQrr5uk=;
        b=KKH35OogXcwpORJ4XSfM9OvPi5ROqATXg9o+obVYGw+rYaGmpbAru8D/bmtizXxcs5
         raoB84v8p1P9ktb7v9bjhdAu12VJz9bgfB2QZZWgmlBmhwIgHJ1V/AI7Sj/lKBLP463a
         8fhv607R/sDvVFtHr2IQT/MnPxF8etsZBJTzoRTy0URl9zsunHRoxYowUANxeENJlHe3
         jFcsH0zvR35qhyu+iHRUXCXiSZqc80LUSEtx2Nij2DXCqLj+4ALNHTKiNnpziSKKRcB1
         y95+Umvj9u0tnQAo90EV7rVVgpbHzChk9PiRP2ASCg2o6OfXu/Of6KeuAv5N/dFVaHr+
         Udeg==
X-Gm-Message-State: AOAM531Pqpi3BXWw7gpgJQuIcKQa1Xe9AcdEsNunACqgMjZNI3pN5tRe
	7BOQDTyd9qknOOZkmIkxgoE=
X-Google-Smtp-Source: ABdhPJyvOXaLmbNeXW5Vnb4awG18xbtqYPe/ef00jLg+n9UAgs1goNhVcy1F12M+IpTdSqQBEvZEng==
X-Received: by 2002:a05:600c:213:: with SMTP id 19mr4226192wmi.2.1627994374122;
        Tue, 03 Aug 2021 05:39:34 -0700 (PDT)
Received: from agape.jhs ([5.170.229.20])
        by smtp.gmail.com with ESMTPSA id k17sm3050185wmj.0.2021.08.03.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 05:39:33 -0700 (PDT)
Date: Tue, 3 Aug 2021 14:39:30 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: commit c7e88ecbe328 ("staging: r8188eu: remove rtw_buf_free()
 function")
Message-ID: <20210803123929.GA1898@agape.jhs>
References: <20210803072129.GA1422@agape.jhs>
 <26260563.P9vmH3Ooqy@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26260563.P9vmH3Ooqy@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Fabio,

On Tue, Aug 03, 2021 at 02:23:25PM +0200, Fabio M. De Francesco wrote:
> On Tuesday, August 3, 2021 9:21:30 AM CEST Fabio Aiuto wrote:
> > 
> > Do you have any idea of what happened? This
> > topic could give us all deeper understanding
> > of kernel memory management.
> > 
> Hi Fabio,
> 
> I've just briefly looked at that c7e88ecbe328. I have no time to dig it deeper 
> but at a first look it seems that the following line is the culprit:
> 
> kfree(&pmlmepriv->assoc_req);
> 
> It should be:
> 
> kfree(pmlmepriv->assoc_req);

I think you are right :)

I didn't noticed rtw_buf_free's first argument is
a double star pointer.

> 
> The second line frees the memory location whose address is saved in assoc_rec; 
> the first line instead frees assoc_req itself.
> 
> Regards,
> 
> Fabio 
> 
> 
> 

thank you,

fabio
