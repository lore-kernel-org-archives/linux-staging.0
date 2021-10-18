Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151142C81
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 17:02:30 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id f3so9224702uap.6
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 10:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kACQMzGQVwtKPf4S7jQukhStJiqLKcGmYg6R1UeOLfg=;
        b=YcjIdDwSK5QCwxFwg5TEVD8tP4xsJHqgLPAHZTLBkX5qAu/aGiF4wbiJ2Pqzfq6AV1
         UjZdFDmcxWWUpkw5FoRr3o3zzxH5c7GAdzLp10CozlGObG1w9eIVjj3aNmmSYhj0C9fJ
         HshU54PKAmP+FB1Wjt23Vjof4Jev0OIaQ4ry5ylw1fXNvZlm63q7K1ZYKJqtxdGmfUbh
         R3ez3jeeuq8aAKGRWoG+wzEBGIz0V06Jfy0peegpWDjN0S3WTP0uPTmgr9hYN5/nCeFr
         Vtsuk+2P8Md8DBx2rCbNFw9dW0VWjzQJC6fN73z4RUsmcJZ1L4m6XB5g+9r0j45npWez
         vbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kACQMzGQVwtKPf4S7jQukhStJiqLKcGmYg6R1UeOLfg=;
        b=0kQk8XgPDtQ1jh1nk5ytmit9Lxjj7opCFB9k2BfpbwGWcEj38HLVs5YroAKpfyUphr
         BghJhS/Oz/KJjCm9gvWANX/3zYHEQwf1uf32jx3uxY/2oBN03YXgp2JsHgAi4ZJNj8QB
         yV94vQMistXs0QKaVYN2VLNscBViQZblS1t/JR5sdTnwL8Yzd1fwmpr8fDIEXtJU5Yvc
         dA/xBKy/G9S74znKnlRkHMfXotvItyFmUUiVIjLqWI5MOGEPscHqVTCdsVNZk91+SNb+
         kzGrYk4ELjyjHeKZN8OU5si7ohp7AcHtQBBAJHpjunvnFwter8X39IyqddatGlNjlVGD
         kuEQ==
X-Gm-Message-State: AOAM531JpEo1Bq8vPARwu/WGixuDR9etr8zH7+UcMG8bOBC7E7O8vDOB
	dYT7bHLqVQfBFfL68cKXhtVhSPCrdNAi/dd8LLM=
X-Google-Smtp-Source: ABdhPJyMy8NDk2LnfVGbqhDNIpmK6C97UucXwYyirgx04mjaGykUZIE+37Nq6MgmUyhrtJXz/EdmPTdf9TDPIGv2tm4=
X-Received: by 2002:a05:6102:3ec3:: with SMTP id n3mr28638862vsv.48.1634576548974;
 Mon, 18 Oct 2021 10:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211018153554.10471-1-sergio.paracuellos@gmail.com> <YW2XMkfAdbQm75j+@kroah.com>
In-Reply-To: <YW2XMkfAdbQm75j+@kroah.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 18 Oct 2021 19:02:17 +0200
Message-ID: <CAMhs-H_8XLkyFZAEAE98bGUb+raeX8hZW_YPmv7nowWJBmWX-A@mail.gmail.com>
Subject: Re: [PATCH] staging: mt7621-dts: get rid of nodes with no in-tree driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Mon, Oct 18, 2021 at 5:48 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 18, 2021 at 05:35:53PM +0200, Sergio Paracuellos wrote:
> > Nodes for 'i2s' and 'nand' have no driver present inside the linux tree.
> > The normal approach for a dts file to be mainlined is start with those stuff
> > which is already mainlined and get rid of the other stuff. If needed it will
> > be properly added afterwards together with the suitable device driver. Hence,
> > remove both nodes from the device tree include file.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/staging/mt7621-dts/mt7621.dtsi | 36 --------------------------
> >  1 file changed, 36 deletions(-)
> >
> > diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
> > index dd7d06c5f234..787220d4d3b4 100644
> > --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> > +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> > @@ -102,28 +102,6 @@ i2c: i2c@900 {
> >                       pinctrl-0 = <&i2c_pins>;
> >               };
> >
> > -             i2s: i2s@a00 {
> > -                     compatible = "mediatek,mt7621-i2s";
> > -                     reg = <0xa00 0x100>;
> > -
> > -                     clocks = <&sysc MT7621_CLK_I2S>;
> > -                     clock-names = "i2s";
> > -                     resets = <&sysc MT7621_RST_I2S>;
> > -                     reset-names = "i2s";
> > -
> > -                     interrupt-parent = <&gic>;
> > -                     interrupts = <GIC_SHARED 16 IRQ_TYPE_LEVEL_HIGH>;
> > -
> > -                     txdma-req = <2>;
> > -                     rxdma-req = <3>;
> > -
> > -                     dmas = <&gdma 4>,
> > -                             <&gdma 6>;
> > -                     dma-names = "tx", "rx";
> > -
> > -                     status = "disabled";
> > -             };
> > -
> >               memc: syscon@5000 {
> >                       compatible = "mediatek,mt7621-memc", "syscon";
> >                       reg = <0x5000 0x1000>;
> > @@ -355,20 +333,6 @@ cdmm: cdmm@1fbf8000 {
> >               reg = <0x1fbf8000 0x8000>;
> >       };
> >
> > -     nand: nand@1e003000 {
> > -             status = "disabled";
> > -
> > -             compatible = "mediatek,mt7621-nand";
> > -             bank-width = <2>;
> > -             reg = <0x1e003000 0x800
> > -                     0x1e003800 0x800>;
> > -             #address-cells = <1>;
> > -             #size-cells = <1>;
> > -
> > -             clocks = <&sysc MT7621_CLK_NAND>;
> > -             clock-names = "nand";
> > -     };
> > -
> >       ethernet: ethernet@1e100000 {
> >               compatible = "mediatek,mt7621-eth";
> >               reg = <0x1e100000 0x10000>;
> > --
> > 2.33.0
>
> When trying to apply this I get:
>
> checking file drivers/staging/mt7621-dts/mt7621.dtsi
> Reversed (or previously applied) patch detected!  Assume -R? [n]
> Apply anyway? [n]
> Skipping patch.
> 2 out of 2 hunks ignored
>
> Are you sure you rebased?
>
> Hm, ah, I can handle this with fuzz maybe:
> patching file drivers/staging/mt7621-dts/mt7621.dtsi
> Reversed (or previously applied) patch detected!  Assume -R? [n] n
> Apply anyway? [n] y
> Hunk #1 FAILED at 102.
> Hunk #2 succeeded at 358 (offset 3 lines).
> 1 out of 2 hunks FAILED -- saving rejects to file drivers/staging/mt7621-dts/mt7621.dtsi.rej
>
> Nope, that didn't work.
>
> Again, are you sure you rebased?  Against what tree?

You are right, I had another staging-testing branch in a different
tree and had one commit in between there. I hopefully fixed it now and
sent v2.

Thanks and sorry for the inconvenience.

Best regards,
    Sergio Paracuellos

>
> thanks,
>
> greg k-h
