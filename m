Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D12F80
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 11:31:09 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so2743273otk.5
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ftY+Tuj2UjU3Tjbqx4E9LJS0pxqonG7yGZODsQv5qaU=;
        b=R+JhHyyQ7Z68LMMn5MqyDQXgkFZ2ZmEW3tecSQMzTCoIpJxWFePtGmjpbSWypNTW+P
         Q+pXoXEJTtC7RtFOZfB5ceHmpzT82n9T/7dcnV/Dtidk1TkmAA/MGH24lr1lz6L7A8oo
         QC7Wxiec18W11714Z9rTAOfpViQJz2XaFu3WnnzdzYfpGUcrUpAzyeJRV8EkA69M3ULI
         0fOLrsHqfiJZsAj1RPaYMrDRDuIeZ+7sL7LJUULcX5j5b0vMvp6F9iMtgl+LGRHvm21v
         Z4SEeOe44OCRzQTBckqt6dXDuR++DvEQSAltOExdY+Mt9XSUoWav/X2Zxe6UX/ZSaiBt
         ZzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ftY+Tuj2UjU3Tjbqx4E9LJS0pxqonG7yGZODsQv5qaU=;
        b=AJ1Hwj0MgV9wFqA/FPKt/hNEAYHPeSVJvN6XJj14ugj/RFYDY44srlh0J6/lqIpqiQ
         Qd0A+XnTxNXqMD6JtTAmMqtJIDCZC8cpsmmVh6DBtnmb3HpzPMULmb+31x+b9AIHFy2+
         UaZHtMTElnkhdB9DAlNYOnWujr91jsBcypUJjvaKScPgcVYbvNYwD2YRW1gK5vctcX+e
         VqR3Ne4wMVtisnMHAUvcscNTkfLEhjNgepWiPvaS58MmEM3QGIrt2vUa1L3rtvR4QiAs
         skhUu4vtEUiHYiMQwlSw7q6z3uJx3ke0a/Q5Zi62WDeQ+f8Tl2WMVJ3cAfCi6ShyAWKA
         /iTw==
X-Gm-Message-State: AOAM531D2nirTZ2vhFJ5YzLkmf7hzNqybtHuaPrQ9L3tk/JN0RQXd4ZE
	aKbteVA3DP6jVTATa/J5ttc0LKhdOqt0prcF98s=
X-Google-Smtp-Source: ABdhPJzKVMqNs5UGVQfemsvi4pea++xD0DKgxt5GWcbD7cI/V3hCxXMO/5f+jAIBp/C7JlDMugo87ulnfzLq8rjRQmI=
X-Received: by 2002:a05:6830:99:: with SMTP id a25mr3953314oto.72.1623065468884;
 Mon, 07 Jun 2021 04:31:08 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com> <20210607065934.GM1955@kadam>
 <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com>
 <20210607103736.GR1955@kadam> <CAMhs-H_6g86wF+M-0iGUqFYRQhHdkuciTLgjSvbPdvxE7q+5WQ@mail.gmail.com>
In-Reply-To: <CAMhs-H_6g86wF+M-0iGUqFYRQhHdkuciTLgjSvbPdvxE7q+5WQ@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 7 Jun 2021 13:30:58 +0200
Message-ID: <CAMhs-H-X8njQxVG=d5929HL1H4sJ3g7-PQ6T-rzzK4e00QQzYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Mon, Jun 7, 2021 at 1:10 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Dan,
>
> On Mon, Jun 7, 2021 at 12:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Mon, Jun 07, 2021 at 09:11:13AM +0200, Sergio Paracuellos wrote:
> > > Hi Dan,
> > >
> > > On Mon, Jun 7, 2021 at 8:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> > > > > Properties 'clocks', 'resets' and 'phys' have been moved from parent
> > > > > node to the root port childs. Hence we have to adapt the way device
> > > > > tree is parsed in driver code to properly align things and make all
> > > > > the stuff work.
> > > > >
> > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > >
> > > > It sounds like this commit needs a fixes tag?  What does "to properly
> > > > align things and make all the stuff work." in terms of what the user
> > > > sees?
> > >
> > > I submitted this driver to get mainlined and when bindings have been
> > > reviewed I've been told to move this stuff into child nodes. Until now
> > > all was also being properly working but with these properties defined
> > > in the parent node. So I don't think any Fixes tag is needed here. So
> > > hopefully changes on this patchset are the last need to get this
> > > properly mainlined. I've been told to just make a 'git mv' without
> > > zero changes from the staging driver, that's why I am submitting
> > > changes to staging before.
> >
> > I'm really trying to understand how this affects the user experience but
> > it sounds like you don't know either but you were told it was the
> > correct thing and it seems to work?
>
> What do you mean with "user experience" here? So to work with the
> future mainlined driver we need the dts file to be aligned with device
> tree parsing code. If we move these properties into child nodes
> (previous patch do this) and the code is properly aligned, for the
> user the change is transparent. This SoC is mostly used in openWRT
> where new versions compile new code and device tree completely so I
> don't expect any compatibility problems also because of these changes,
> AFAICT.
>
> > That's not ideal but I can live
> > with it I guess...  I guess hopefully no change but it's just a
> > correctness issue?
>
> Seems that the bindings are more correct, moving the properties into
> child nodes.
>
> >
> > Btw, we moved from devm_reset_control_get_exclusive() to
> > of_reset_control_get_exclusive().  Does that mean we need to add a call
> > to reset_control_put() in the remove() path?
>
> Yes this has moved because we need to access the child node with
> 'device_node' instead of 'device'. It seems there is not another
> possibility with devm_* like the ones we have with clk and phy apis.
> Ok, so I have to manually call 'reset_control_put'. Will add it, thanks.

Should this be enough for error and remove paths, right?

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c
b/drivers/staging/mt7621-pci/pci-mt7621.c
index 2e1cd5cc1eec..8e20c5ede48d 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -294,6 +294,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
        struct device *dev = pcie->dev;
        struct platform_device *pdev = to_platform_device(dev);
        char name[10];
+       int err;

        port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
        if (!port)
@@ -319,14 +320,16 @@ static int mt7621_pcie_parse_port(struct
mt7621_pcie *pcie,
        port->phy = devm_of_phy_get(dev, node, name);
        if (IS_ERR(port->phy)) {
                dev_err(dev, "failed to get pcie-phy%d\n", slot);
-               return PTR_ERR(port->phy);
+               err = PTR_ERR(port->phy);
+               goto remove_reset;
        }

        port->gpio_rst = devm_gpiod_get_index_optional(dev, "reset", slot,
                                                       GPIOD_OUT_LOW);
        if (IS_ERR(port->gpio_rst)) {
                dev_err(dev, "Failed to get GPIO for PCIe%d\n", slot);
-               return PTR_ERR(port->gpio_rst);
+               err = PTR_ERR(port->gpio_rst);
+               goto remove_reset;
        }

        port->slot = slot;
@@ -336,6 +339,10 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
        list_add_tail(&port->list, &pcie->ports);

        return 0;
+
+remove_reset:
+       reset_control_put(port->pcie_rst);
+       return err;
 }

 static int mt7621_pcie_parse_dt(struct mt7621_pcie *pcie)
@@ -596,6 +603,17 @@ static int mt7621_pci_probe(struct platform_device *pdev)
        return mt7621_pcie_register_host(bridge);
 }

+static int mt7621_pci_remove(struct platform_device *pdev)
+{
+       struct mt7621_pcie *pcie = platform_get_drvdata(pdev);
+       struct mt7621_pcie_port *port;
+
+       list_for_each_entry(port, &pcie->ports, list)
+               reset_control_put(port->pcie_rst);
+
+       return 0;
+}
+
 static const struct of_device_id mt7621_pci_ids[] = {
        { .compatible = "mediatek,mt7621-pci" },
        {},
@@ -604,6 +622,7 @@ MODULE_DEVICE_TABLE(of, mt7621_pci_ids);

 static struct platform_driver mt7621_pci_driver = {
        .probe = mt7621_pci_probe,
+       .remove = mt7621_pci_remove,
        .driver = {
                .name = "mt7621-pci",
                .of_match_table = of_match_ptr(mt7621_pci_ids),

Thanks,
    Sergio Paracuellos
>
> Best regards,
>    Sergio Paracuellos
>
> > regards,
> > dan carpenter
> >
