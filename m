Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB533EAE6
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 06:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780293928; cv=pass; b=o2PRjLlvwg0WTia3AogE/XBA/PBkIrs1BEJcPU1axf3g94ig2tdcBFpJB0cbOxvJEF733vzKMpG/3gzmWMYCuODYMukSBAeXafcRGflENMEXeMVBb1cqGgurorz8s0ChWk1WsmBRC4+vnhGRKQ0Pwt1/1grGzju7Dqrfd5siGCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780293928; c=relaxed/simple;
	bh=B+ge0q+NK7KzDZMKIw1oop+AtAxI77a6GtO2I50sGsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWPoYBaK+Ub3B99x0K+Yy/qeMObzx7XjSeKTK6xgfU8JdeVMA7XQ9CwOXAy1FPRzyFl62bMW5hekeP+gIFInFOuG5yRaQMtbO/cDf5tlQvx0xc3Y5uQgByoKwguDzu9ygAdTmr+MQXaDHNEr1lwokGSJc41/7GGR2TFQ03Ig4Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgBXGUc7; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgBXGUc7"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36c68964315so831132a91.2
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 23:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780293927; cv=none;
        d=google.com; s=arc-20240605;
        b=kO73jGUrBICyZuYEr8uLKbcFj5hENuct+GS0ULFrIUDrN+8nxlcUv3NKnUlG0MMn28
         O8mrlSh3HdKT2lE+IlPPXemZsMGQ2JlxoLVQBtk5e4M1SqCZQ8WCnu76tnW88o89zfqD
         fj3NufnsNBBBvixX7FFz+KtflwAL7p8dEXJLqsOAUlExgevc2o9vBJvVdTmxpps8xkPz
         2b1qrtlDYvZsu/NoTMM+bkWcAU6YT7lFNu/cLeGHblLcNRRapbVPmsD9yvai58u75ETA
         j816F4nFlakLFZ3rIMNmU5OU9H+97PFuJt4QxQC+oHIr8hbSG56fX9tc0pllYUtvFPsG
         JAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glLTXShkm5YP1+5MR78Yj0KypTdD3fdo1XmOBdHITCM=;
        fh=xkeQfUcFghl2+m5nA5hsO4UdzIpnnaUEhb0NwwUuERY=;
        b=UK4DwCTj2B9GxnXX3zSHN++gxK3jRJ/+s7y4tJK2xZ+C9PEaoV6l1yEuXCAgK5XW24
         4nz2I/V4NCJoke85BhjPpR+AxUuitqSTJzi832m0Qcxy3MpGtg939CI9tfCZsj3wul1P
         tNEif7+C/MC+RNGRi/XilEKB1mqa8C0MpXh2/UXz6v5egVaOPcKPn8qjfsrdNH5QBQ1l
         7Qoq3NeQFCR/YDW0kCTd9jN0QyDIfxjlwC1044tCVuUt/dTKUuQoHNpo7S9dihEmAl+z
         3608tZyKvB3iLVr9dL+/smlCGKb97JwAWp4JOuzEgOqeyeHSis5HD52RCfTdpur9vu6N
         4JQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780293927; x=1780898727; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glLTXShkm5YP1+5MR78Yj0KypTdD3fdo1XmOBdHITCM=;
        b=ZgBXGUc7uFWtkIF72L0itGGNCxlFhZrtEk5/Cwt9hVkdaQ8fsPCcOjgu/JaKUs5ENm
         A1bPf6ODYlxv3/cL0RvtMaozSMGdxZMbVdTNqknhfajsSMAoBzu/JVDM2F1JpMXfW3YG
         EYZtWsnylm1yTblTgkN3sjfEoCkFhIq884qdkl1+eOGte+W70h+rR6MzPJkIldzqF+o4
         37MXCbxaK2/cE0+vaw5I4vXWqkz3sN8/hQGY9hzbElNvLkC3+d8PBdBbQz4GuCP8rsxp
         qfTs3Etv8uWZZJmA16FkJjGfeb2kp37y4nAynV4kJKeeXj8WqVMPlYRr4wS9/lM/0nVK
         9Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780293927; x=1780898727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glLTXShkm5YP1+5MR78Yj0KypTdD3fdo1XmOBdHITCM=;
        b=DpJ04cl7W90WNibCtA+CeQ66bgi2EH+lsyUX3VNGfrmSGj/YrjEa0tH6ruEAIqdO1l
         B0pRtQ5BCw5ZCvV5CESEMOSeoKJllLkTPEAyI76g6sW/UAfR1HwV02DWPcESUrztSABG
         iM3Rz9SfKEq6UCxc0k370FA1CWtg+F+XJBs1vGyCsviRsA0pKq2qA0DB3EcTCYbp1POZ
         saG+67QxGiZ2WjodwDF77OZA1O0k4S2paDKI6v9W2RQNp/Txn2lLQFqIvec8GlMzGe4L
         COb3cl6j/92dWrKzG2k43VvC7Egr1+V9+DhuoHGULh9xYacSo9z5ap/TH6+b5Q8+Ee+k
         QpMw==
X-Forwarded-Encrypted: i=1; AFNElJ98T23RZSALxd8RIRLJlM2CJ9MI4r5SdxvsmiENlxMO0mjQI2Pmlj2CTNuEtwbIAarE4NWrUs3D8m7PjouK@lists.linux.dev
X-Gm-Message-State: AOJu0YyJDyISneMF3zbv3w70O9Nvw/9HojF/orZ+txz51CDj7JhaONU6
	mrzAaMZC72ZwTsXgec/VD84A2YkNC+VwlLuH14C7Eo797dvvy/j6NIc71jTgi/usSi1sDNbPDRw
	fWCXjtZ3BRfrXZ2bvH65T6Cm3YdYZnq0=
X-Gm-Gg: Acq92OFOP8dtlMcIvTzabaTev45N1meQZ73Xg0I6uqWl62Rt2DDBj17CwaTzZ33irjv
	kqqIsJRRUDHfV3+sukCh6WYE4yTJtKzQhqrHlq1/G8N7i7W9CgoocBrp4g2H76iE3Z7qz8Ef5uD
	78qL8pXtp0sk4HxGj3u9KTvbd4m2SCSlV6q9LRBELbSMoBvvci4upGABh01+qdAcaRjF4nUgMwn
	W0vEhjKKK0yNxmlL+ZRMm65nsumnOZUqWH4HHztbOpQHD/g1hj4PXQ1Q2mhX0c7JIjNJV3C8yK9
	MAC3cvKzJE6ZBwP5LY8=
X-Received: by 2002:a17:90b:5704:b0:368:b01c:85a0 with SMTP id
 98e67ed59e1d1-36c501db7b8mr9360839a91.14.1780293926650; Sun, 31 May 2026
 23:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch>
In-Reply-To: <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch>
From: Grewstad <dogestad24@gmail.com>
Date: Mon, 1 Jun 2026 11:35:14 +0530
X-Gm-Features: AVHnY4LKTOZKUlPxUKSEpglGPR9NoZNvIqTRTd9Vh-G5jAMDbvZ2ZfNVIZn_hGU
Message-ID: <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: Andrew Lunn <andrew@lunn.ch>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, jacobsfeder@gmail.com, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 1:22=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
>
> In addition to what GregKH said, look at the vendor information:
>
> https://docs.amd.com/r/en-US/pg080-axi-fifo-mm-s/Core-Overview
>
>   The AXI4-Stream FIFO core was designed to provide memory-mapped
>   access to an AXI4-Stream interface connected to other IP (such as
>   the AXI Ethernet core). Systems must be built through the AMD
>   Vivado=E2=84=A2 Design Suite to attach the AXI4-Stream FIFO core, AXI
>   Ethernet core ...
>
> when used for Ethernet, a uAPI is not needed. The FIFO driver would
> just expose an kernel internal API the Ethernet driver would use. Are
> there any Ethernet devices using it? Is there a driver for the AXI
> Ethernet core?

As I said to Greg K-H, it's 'chameleon' hardware because we don't know
what it'll be used for. It could be SDR or Ethernet or whatever it is
programmed for. The main thing is that it is a streaming interface.
But we cannot assume the use case.

> Does drivers/net/ethernet/xilinx/* duplicate the same
> code? xilinx_axienet_main.c says:
>
>  * TODO:
>  *  - Add Axi Fifo support.
>
> which could be this.
>
> As GregKH said, find some hardware using these IP cores, or synthesise
> your own, and then work on the driver.
>
>         Andrew

Yes, the Axinet driver's TODO suggests adding AXI FIFO support.
Currently, it routes
packets through the AXI DMA engine, but the TODO mentions:

 * TODO:
 *  - Add Axi Fifo support.
 * - Factor out Axi DMA code into a separate driver.

This suggests that the AXI FIFO is merely a different configuration of
the axinet
driver, allowing a Xilinx AXI FIFO device to be used for ethernet.

It does not, however, establish how the AXI Stream FIFO IP is intended to b=
e
used outside of the Ethernet context. Since the AXI Stream FIFO is a
general-purpose IP block used in a variety of FPGA designs, it is not yet
clear whether the Ethernet use case fully defines its role in the kernel, o=
r
whether it should be treated as a more general streaming component with
multiple potential consumers.

Thanks,
Arihan Bhor
