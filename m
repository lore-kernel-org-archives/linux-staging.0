Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743A2F4B;
	Sun, 17 Apr 2022 22:01:05 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id s18so24164216ejr.0;
        Sun, 17 Apr 2022 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HtwSwKHxvQg2zlm6kaPIkHmv4vJJ4TgMpLArTx9nMTk=;
        b=N+ftmGGkeBsUXnMkxCA7AVVmpWQRA+37MSw9ui2XtKchj9xLlk9Ue/kT1eDK7IP+tn
         mOKzprMirSfavzuBIp7Tg0Whdnv5cD9R/O5k+XdmdMm50r4rfufypffv65bqiN9QkSt4
         prXrbeNdBaHLDLFY8N3eHvHLh7fPSZ8jI2+AZvfAPr+ipEiQM8HVqjiX/FH9mbmzUIXr
         P1578CZhRcRELAmfZxxYAoz6T68uat1uVtDkLSF1bhRki1Z6IBns0FSbZa36KZf875k+
         czM7S8qVbpyuUl7+e5fbHD4gZq3EsHbT6n0FMAXGYvEaslunVuWOBHNZIqUSEk/Pivp6
         YJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HtwSwKHxvQg2zlm6kaPIkHmv4vJJ4TgMpLArTx9nMTk=;
        b=j/ZT/7n6pjXE6mcI63wMNql1oiUk3IPYA3z/1LRKBvjVpaCtNKtttTwDvS2AYyehxF
         hn2Y7Xo8S6v7L7gQeUhqbizoCQU9z1vNz8BAC1hhy4C+T+FSG7WSKP/Ha4xMn/arj68U
         d0ifmvTQlaV0OgCVrGtO6RIGtOuc+XUU4CDMJn1b1MSVF0Gzqgd1bR0K47tS3V/GkQ7M
         ZDf/w4AE3yQQlCy0sGuOLqEn2qbatt3O1F/+J5MHRNgrdVPBQUHM/an08eEw3QytIrfr
         sl4+vtXdOTRvuAZ9qYASI/M1r5+kEpq5tuQwQRKwyqh3kL0DILcEM+3b7UFf/1aldKo3
         8GRA==
X-Gm-Message-State: AOAM530T6l1KaUsqaBzzg5UFRmy9q5EZZSYAe1CYiVBNyEbiq1OWUGIF
	UPVmOqKBJ5Oe+LBzhoJoF+4=
X-Google-Smtp-Source: ABdhPJyOcrwE+vW0uWdyga/v0UvMb+hTCda7Xrxo4w+xnODxG8gFJS4tGjUDMkuZFKLLou2A3BX9Xg==
X-Received: by 2002:a17:906:974c:b0:6e8:9453:4209 with SMTP id o12-20020a170906974c00b006e894534209mr6993992ejy.755.1650232864313;
        Sun, 17 Apr 2022 15:01:04 -0700 (PDT)
Received: from leap.localnet (host-79-50-86-254.retail.telecomitalia.it. [79.50.86.254])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b006e4b67514a1sm3996407ejb.179.2022.04.17.15.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 15:01:02 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>, Jaehee Park <jhpark1013@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2 1/6] staging: r8188eu: remove unused member free_bss_buf
Date: Mon, 18 Apr 2022 00:01:00 +0200
Message-ID: <4396697.LvFx2qVVIh@leap>
In-Reply-To: <3164900.aeNJFYEL58@leap>
References: <cover.1649990500.git.jhpark1013@gmail.com> <20220417204200.GA236965@jaehee-ThinkPad-X1-Extreme> <3164900.aeNJFYEL58@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On domenica 17 aprile 2022 23:13:50 CEST Fabio M. De Francesco wrote:
> On domenica 17 aprile 2022 22:42:00 CEST Jaehee Park wrote:
> > On Sun, Apr 17, 2022 at 11:16:38PM +0300, Pavel Skripkin wrote:
> > > Hi Jaehee,
> > > 
> > > On 4/17/22 23:14, Jaehee Park wrote:
> > > > My understanding of Pavel's response is the free_bss_buf member of 
> the
> > > > pmlmepriv structure wasn't being used anywhere and that the
> > > > rtw_free_mlme_riv_ie_data function frees the memory of the 
pmlmepriv
> > > > structure so the second check is redundant.
> > > > 
> > > > However, as Fabio said, the free_bss_buf member is being used and 
> pbuf
> > > > memory is not being freed.
> > > > So I'll revert the patch as it was originally (which was just 
> removing
> > > > the {} around the single if statement).
> 
> No, Jaehee. This is not what I said :)
> 
> > > > 
> > > 
> > > Why just `pbuf` allocation can't be removed? This memory is just 
> unused,
> > > isn't it?
> 
> What Pavel said is what I said, but using a different argumentation.
> 
> > > 
> > > 
> > > With regards,
> > > Pavel Skripkin
> > 
> > 
> > The free_bss_buf member is unused.
> 
> Correct.
> 
> > So it can just be removed right?
> 
> No.
> 
> 
> > I guess I'm confused by what Pablo is saying about causing a memory 
> > leak
> 
> A memory leak is caused when you allocate some memory and then you lose 
any 
> reference to its address so that it cannot be freed. Right?
> 
> > by getting rid of the pointer to the memory allocated by pbuf.
> 
> No.
>  
> > Sorry if I misunderstood. 
> 
> No problem. Let's rewind...
> 
> "pbuf" is assigned with the address of some memory allocated with a call 
to 
> vzalloc(). Since "pbuf" is a local variable, you see that the above-
> mentioned address is stored in free_bss_buf using the line "pmlmepriv-
> >free_bss_buf = pbuf". Is it clear?
> 
> Well, you decided to delete the line that calls vfree(pmlmepriv-
> >free_bss_buf). At this point you have that memory leak.
> 
> Pavel noted that pmlmepriv->free_bss_buf is unused, but it contains the 
> address of a region of memory that was allocated for no purpose.
> 
> Therefore, a correct patch should also remove the allocation that was 
made 
> using kzalloc(). 

Sorry I made a typo: kzalloc() -> vzalloc().

> If you merely remove the line with vfree() you cause a 
> memory leak.
> 
> Please don't revert your patch. Just fix it with a new version that also 
> delete the line where "pbuf" is assigned with the value returned by 
> kzalloc().

Same here: kzalloc() -> vzalloc().

> 
> I hope that now I've been clearer.

Did you find out where is the line that calls vzalloc() and returns the 
address to the local variable called "ptr"?

As, said before. You should delete it too, otherwise you lose that region 
of memory until the driver is un-linked by "modprobe -r <driver>" or the 
system is shutdown.

Fabio


