Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9B1856;
	Sat,  2 Apr 2022 13:22:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w4so7809234wrg.12;
        Sat, 02 Apr 2022 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bM1qv869mLVj0L15vUr24+B+GszxmRptC2PdqnBJ5K4=;
        b=SlUPIUKCXurYXUIrs3NwfGg0Q69oEQSC4nOx9sE0oKSjX80eII/DdEotFI3Bsbtvtu
         l3jr+SAkdZKyZMX49mQuH0CLAd9dv8kunEEmIrXttd113lXE7z5xMzayFiJ0fHkWqOAb
         TUP8L74xzEv2V1T43r0FZtVnZ3NLmx5MDGJDpKHf/9VQ9gU677ca+83lObYF6iyLdksJ
         d1WoSgAvcktQuGOqpMOZWuFeZZ/56PcyVAAJ7kY4ejRYSbd9WcmJlU4wpnViOyC38fa9
         hKW+fbSCyf7eyAvikq8Ane9Fd0m9j9NFJe1p5IQxW+CNWF+WGGsIFkVWN2n7GzsUw6AL
         jYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bM1qv869mLVj0L15vUr24+B+GszxmRptC2PdqnBJ5K4=;
        b=O7SBSpklYHy7i53gOlQfyrg+G2DI5zlyGASe005XN5vP9oWUJeoqf+NQi1eRiKJx9A
         ty/RjIPJBYtiI6beq9Az7igDcKJ32sk7Z6aICeDNurKZxsUd/PkuMrLGi13H316Izdp0
         +ZKe6dgRNWa5q3YZv4oGRpLsMTbd66+E+8czJNkG38IN2By5x9QGryvao0APrO26CRQE
         sOtgW0h/ACsz5EPaRBwPzMBtr//BBcSQPUQAy07+cvtDNqdMy9yEJZB+MBjGpO9Y7KkW
         ZQOLph4lIYaZ+Bk+d2uixo34oe1xhVYC+R8fmDKS0p8qCfS9EP3DmgSTNDWS60NIXJdz
         MI1w==
X-Gm-Message-State: AOAM530pWdFvQnxkpaVIuvg8r9qseSKtL271q2nlIlaTq0g2/3JxeJuu
	jpyB021BeXx5sS6yABjyn4U=
X-Google-Smtp-Source: ABdhPJxm8EUnxXG3nVLRw1XHSCkv+pnaG7kBoIk60raQSsyVXx7drDSOToewaHuiVxNmCbBNEkL6aw==
X-Received: by 2002:a05:6000:1e16:b0:206:40c:872d with SMTP id bj22-20020a0560001e1600b00206040c872dmr2204783wrb.535.1648905746951;
        Sat, 02 Apr 2022 06:22:26 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id y15-20020a05600015cf00b00203e324347bsm5530402wry.102.2022.04.02.06.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 06:22:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Ira Weiny <ira.weiny@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: Remove goto to no-op exit label
Date: Sat, 02 Apr 2022 15:22:23 +0200
Message-ID: <2108195.Mh6RI2rZIc@leap>
In-Reply-To: <Ykg3Xfb4vjjGSyKc@martin-debian-2.paytec.ch>
References: <20220401183513.26222-1-fmdefrancesco@gmail.com> <1724388.VLH7GnMWUR@leap> <Ykg3Xfb4vjjGSyKc@martin-debian-2.paytec.ch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On sabato 2 aprile 2022 13:45:33 CEST Martin Kaiser wrote:
> Thus wrote Fabio M. De Francesco (fmdefrancesco@gmail.com):
> 
> > > >  	pnpi = netdev_priv(netdev);
> 
> > > >  	if (!pnpi->priv)
> > > > -		goto RETURN;
> > > > +		return;
> 
> > I cannot see how pnpi->priv might ever be NULL.
> 
> Even if pnpi->priv was NULL, we wouldn't need the check. It's ok to call
> vfree(NULL).
> 
> > After the two removals I've talked about above, the code will always call 
> > vfree(pnpi->priv) and then free_netdev(netdev).
> 
> That makes sense.
> 
> Best regards,
> Martin
> 
Hi Martin,

Thanks for reminding to me that a vfree() on a NULL pointer is a no-op.
I'm going to submit a new patch with the purpose to re-work rtw_free_netdev().

Thanks again,

Fabio



