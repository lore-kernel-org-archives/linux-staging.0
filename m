Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F7233E5
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 19:10:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id d6so3042574ede.8
        for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 12:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y5lCisNhN/rSDkKOgQN7B03/+hLMtfamY/3MRihZhX0=;
        b=GhFd+VGd5iuBnuP7FJEIFLPhTiJo0F/QYU04R6qLTHU0PCAZOlHzgXDp0J2w1elBun
         zs/MoRPQs+UPqBkYH/e/yC1dvRSHF3CbC8OL24e3Pf0AgIMzU5yBgTKFijQehBLznCbZ
         RkmI3toYmhQdDqXh4SdlMTsu1jAiAZBAoRAOyGURw3Wf8qvtc6YzgoVDx85ZbIP/Pedp
         wmR6wL3m8L6FUuXGoNmvBL+LTJWKUfBZABdk0sj07XbJgMvs31697X4J7wi4+L0ZhFug
         4ay7sroibmKzBN/8xwxHVq3YxL2vJH2I3A7X+CQLyfMjlyjc+AhRk4jg9I/1L5JetTER
         SVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y5lCisNhN/rSDkKOgQN7B03/+hLMtfamY/3MRihZhX0=;
        b=K+Vdu4iLSrjifhFkpfZQrLuLyawOp8RY0IMF/+fs6l62e4HOGydPI+3f/dAAwSKVLE
         h62c/gT1fyVhh/aqNBVs+8UBEJjC/fFxMCbB7liLZPNHhqpEho30FEg+sUW5et6c9Ydc
         ObjiF5HISYGgfbatGpyK+6attYBgrU2+keUnTXpuT+bFZGAUL6eM0CEdtvSYZU0jhIil
         SZa7xuMotCvlLoAfqaFqHBWc84iPW1GF1dwbmV/fMkPyviKv9eoZeaICPdL+L7qG9KjR
         lQ4qEG8s5OFb0SvTppvhmHLbTZP3KpshmaFG+pLGn57S6UkDSvj2T4FUrLhBtFjt6Ztj
         2wsQ==
X-Gm-Message-State: AOAM533JRwdP01f87YZSaJxdTvWSsPFbfHLnRHZ2FJBUwf3vOcMtLoh2
	maqfgEej/oUbnhNbN+eWZ0I=
X-Google-Smtp-Source: ABdhPJyuZAmm4ifPqBIZMUFu7IpZS+G47tKesflY8YlZDbeSLGfuUzk8t9vKimKmEJ7FxntOp9iiOA==
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id b10-20020a056402084a00b00426262d967emr299381edz.286.1651086608934;
        Wed, 27 Apr 2022 12:10:08 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f1b:f056:c2a9:42e8:8d4d:7789? (p200300c78f1bf056c2a942e88d4d7789.dip0.t-ipconnect.de. [2003:c7:8f1b:f056:c2a9:42e8:8d4d:7789])
        by smtp.gmail.com with ESMTPSA id sb10-20020a170906edca00b006f39ffe23e1sm4140257ejb.4.2022.04.27.12.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 12:10:08 -0700 (PDT)
Message-ID: <748780b1-12ba-34d0-1ce3-36b74b1b90b7@gmail.com>
Date: Wed, 27 Apr 2022 21:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/3] staging: vt6655: Replace VNSvInPortD with ioread32
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>
Cc: Forest Bond <forest@alittletooquiet.net>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
References: <cover.1651036713.git.philipp.g.hortmann@gmail.com>
 <7a5f7f98379fb2af2741f613f5ddda53e5d4813e.1651036713.git.philipp.g.hortmann@gmail.com>
 <Ymjaxby2vDJYz6KA@kroah.com>
 <b8853bc9a9d041009103b76bd02ce08d@AcuMS.aculab.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <b8853bc9a9d041009103b76bd02ce08d@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/22 10:01, David Laight wrote:
> Actually I suspect that 'iobase' should be an __iomem structure
> pointer, pqwCurrTSF a point of the same type and MAC_REG_xxxx
> structure members.
> 
> Then the code should be using readl() not ioread32().
> I very much doubt that 'iobase' is in PCI IO space.

Hi David,

here some infos and questions:

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ sudo lspci 
-s 01:05.0 -vvv
01:05.0 Network controller: VIA Technologies, Inc. VT6655 WiFi Adapter, 
802.11a/b/g
	Subsystem: VIA Technologies, Inc. VT6655 WiFi Adapter, 802.11a/b/g
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping+ SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32 (8000ns max), Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 19
	Region 0: Memory at f7c00000 (32-bit, non-prefetchable) [size=256]
	Region 1: I/O ports at e000 [size=256]
	Capabilities: [50] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: vt6655
	Kernel modules: vt6655_stage


---- In file device_main.c line 1699
	priv->memaddr = pci_resource_start(pcid, 0);
	priv->ioaddr = pci_resource_start(pcid, 1);
	priv->port_offset = ioremap(priv->memaddr & PCI_BASE_ADDRESS_MEM_MASK, 
256);
	dev_info(&pcid->dev, "vt6655_probe priv->memaddr: %x priv->ioaddr: %x", 
priv->memaddr, priv->ioaddr);

----- Output:
[  +0.000018] vt6655 0000:01:05.0: vt6655_probe priv->memaddr: f7c00000 
priv->ioaddr: e000


So port_offset is derived from memaddr.


----- In file card.c line 742
bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF)
{
	void __iomem *iobase = priv->port_offset;
...
	VNSvInPortD(iobase + MAC_REG_TSFCNTR, (u32 *)pqwCurrTSF);

Please tell me if you need further infos to see if it is PCI IO space.
I think it is memory-mapped.

So is ioread32 wrong, right or can it be used?

This article gives more info:
https://www.kernel.org/doc/html/latest/driver-api/device-io.html

Thanks for your support.

Bye Philipp









