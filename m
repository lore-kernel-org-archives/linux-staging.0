Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0892F80
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 06:44:03 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id w16so6729596oiv.3
        for <linux-staging@lists.linux.dev>; Sun, 09 May 2021 23:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=p4QVkoSceAD0cNWEBhxG7I+e5PtbXU/V6ZHwSLEEg1A=;
        b=lZTydeU3Odd/M0wXuPJxS/YMhYeN5mCiEpBi8Vnn85eGvurhAW2fvB13yKPa8gFJRF
         0LQDpzGxrf5XOsCmOWK3bmGRLCP60ZgyBB1U9XyHo2j7vDwRDXuu6S1CuHZjYi1yw1uX
         mWlT2pncAbnEhESFceelHU/uF9tVUmeC9gyk7zK1y4D9Y3ZhLVJgF2XQQ67Ccrulb0US
         KgyO0iHt9Bi9zhg6YkfV343/g7WYy27P13SRhuNMPr8ItoegAlT9mUUSQgZubtVb6bwB
         3zZJjAMM//hDuVr/G6QMv9xTxPUhYm33hKQlmoD0S562zhfRFeM4eZdfNN56EUTQ2XVw
         Yz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=p4QVkoSceAD0cNWEBhxG7I+e5PtbXU/V6ZHwSLEEg1A=;
        b=D2V8lBq+pDuXFGa10uwja0HaWT39hsbtpAoSw79y/SkV8yUNDPJ0Wg2nkFl8f9qY6W
         h+HTQhtB30G+yE8EK7AWlES6Nq2CdKcVJpzh8pHIe6vBlivynCMZ3lw1g0ixOJpBUOeD
         7BJ3YUvEPCSJvqr5T0owCOODw8izEFfNDHpbSBCSp8/kTk7UG+7nb4/khpPqP7XlzWo5
         Cexqvzs4zXQmrUqkyTBsHmjHF/2rv904VUSikFA0v4S3WjCCEKt03qv/zdrj2AHXBLkt
         AU2ZfrKm7uxjojKb4WPV5SZfrDGqqwohRB+Jf6LhxLp5nrEggZ29+C8s3I/CAQQeHbvC
         PR5w==
X-Gm-Message-State: AOAM532UPmhCPSFM7O7WUIX3jq/4trbDlwrj0BBhXzNLRZIfB+CYh9ny
	zN0dp5Qe0JT2ZoDVSXIjsPbTycszD3+4gz+MwGU=
X-Google-Smtp-Source: ABdhPJyVdzqsP+rLX3WJ06Fa548PdjAPpu5WsmTRzTVyrvsS1mL0XEd0wQQfYD9tsk1p+FGwkPBSHAcU2C79xQXsKWw=
X-Received: by 2002:aca:b5c4:: with SMTP id e187mr17106264oif.149.1620629042789;
 Sun, 09 May 2021 23:44:02 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 10 May 2021 08:43:51 +0200
Message-ID: <CAMhs-H-1f72=7C3j1jCmdLU8+5LurPO6nRVcvPJO_rxPitQBnA@mail.gmail.com>
Subject: Some doubts about mt7621-pci mainline place
To: "open list:MIPS" <linux-mips@vger.kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I'd like to mainline for the next merge window the current mt7621-pci
driver which is in staging now. I am in the process of validating
current bindings to make first all the need changes in staging before.
This SoC is based on mips ralink platform. MediaTek MT7621 PCIe subsys
supports single Root complex (RC) with 3 Root Ports. Each Root Ports
supports a Gen1 1-lane Link. I have some concerns that I am not sure
how to achieve before getting this an attempt to put in its correct
place of the kernel. This driver has been cleaned during its long time
in staging and is properly using the pci generic APIs instead of the
PCI_LEGACY which seems that all other drivers in 'arch/mips/pci' are
using. The driver is generic enough but it needs mips iocu region
configuration that is done in the driver itself. So here it is where
my questions come. Is 'arch/mips/pci' the place to move this driver?
Is the driver the correct place to configure the iocu related with
pci?

There is also one issue from a while now that sometimes is reported by
the kernel test robot [0] that I'd like also to fix correctly. please
see the link and my comments there.

Thanks in advance for your comments and help.

Best regards,
    Sergio Paracuellos

[0]: https://www.spinics.net/lists/kernel/msg3617511.html
