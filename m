Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4039A2CAB
	for <linux-staging@lists.linux.dev>; Tue, 14 Feb 2023 07:07:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bk16so14575850wrb.11
        for <linux-staging@lists.linux.dev>; Mon, 13 Feb 2023 23:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2CrTfSdCZ8kL9Y45Dpaj6OWp5Cgjxivq7kfQiy/YkcU=;
        b=PeWqRzzvm0ugtXQYxWSFo8ZVorGdIZZljysgCm3eYjurJcaIWpSn8GwMtTPYRJHsNv
         PtP3q/m54YcM1A28lJkwfD3oKK77uCmcCo5CS0NX1fbtTUlme3NSrq2fc/ngj1ro1ySi
         +8LoHJhQV1S3kDa2Y7OoUVyPan1wl7fWPHttYnhmCCOdT0JF9tYw3drFEvDW8ALBF/Rs
         gTSAa430eVUqHGO5aNnU+kgVaebS9S/39riM/N+edh1f+j5OKGUlZTW8UmtCXbVYKxAM
         I3CbUm1kGZen7DB3knjEgHSd4YfsUvVCimoRx9RLHN7E3tb+7lvU/doisOLYl4NBYv/R
         b4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CrTfSdCZ8kL9Y45Dpaj6OWp5Cgjxivq7kfQiy/YkcU=;
        b=0C2u/dZKoMNOooVa88HT9ZeRB6JjdkKVwbasq6fcwTMEGAKu1I6BWaRYhW9n0bTv8B
         TYAKi88qGNT5r9HoAOZz16/Oc+hwSs6blIRG4pxYUSDclm4iFnXHYQr0OkcInww2CKgL
         fz9VIpVMCakXU2zP2Ee8dYW5n2qaNWdAkE2FWRUNQxEHt8UFzP2zXvjZN2s568TCAOGn
         ec8iTQgR6t1eqz+gX/+RsHHi6w5IBTBqYknUBh7ffMl8LEmFSBwt3tidv6RAh+vsdlZD
         SARB2bSMj4M6xtySBsNoXdT2bfc0hVOfzGOGJbXAl/tscufUIbA+Xm4Uh5PnZPheOWls
         XKQA==
X-Gm-Message-State: AO0yUKVLzebJKZ7Ui9pEe4QrgVbJW9G5yrljGCksCiW6HmnZSZCRdSQM
	x/NWZ69TqWXnHrA25y6C+VQ=
X-Google-Smtp-Source: AK7set/u/EeB7g/2bx9z/lATJMIlaAtUQfjrmqR25IF5wouTdISjba3Bb4V91UDgzB/5S5dbZ2bOJg==
X-Received: by 2002:a5d:6091:0:b0:2c5:5847:7374 with SMTP id w17-20020a5d6091000000b002c558477374mr1143867wrt.67.1676358474534;
        Mon, 13 Feb 2023 23:07:54 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d13-20020adfe88d000000b002c54f4d0f71sm7246984wrm.38.2023.02.13.23.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:07:53 -0800 (PST)
Date: Tue, 14 Feb 2023 10:07:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: Revert "staging: r8188eu: simplify
 rtw_get_ff_hwaddr"
Message-ID: <Y+szRoaj2rEz/0KN@kadam>
References: <20230211183205.426820-1-martin@kaiser.cx>
 <20230213195407.15085-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213195407.15085-1-martin@kaiser.cx>

On Mon, Feb 13, 2023 at 08:54:08PM +0100, Martin Kaiser wrote:
> This reverts commit fd48124e0982 ("staging: r8188eu: simplify
> rtw_get_ff_hwaddr").
> 
> The cleanup in this commit removes the qsel to addr mappings in
> rtw_get_ff_hwaddr. The underlying assumption is that rtw_write_port
> uses its addr parameter only for the high_queue check.
> 
> This is obviously incorrect as rtw_write_port calls
> ffaddr2pipehdl(pdvobj, addr);
> where addr is mapped to a usb bulk endpoint.
> 
> Unfortunately, testing did not show any problems. The Edimax V2 on which I
> tested has two bulk out endpoints. I guess that with the incorrect patch,
> addr could only be 0 (no high queue) or 6 (high queue), both of which were
> mapped to the first bulk out endpoint. Data transfers did still work...
> 
> Fixes: fd48124e0982 ("staging: r8188eu: simplify rtw_get_ff_hwaddr")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v2:
>  - use correct patch prefix
>  - add a Fixes tag
>  - use 12-digit hash to refer to the reverted commit

Thanks, Martin!

regards,
dan carpenter

