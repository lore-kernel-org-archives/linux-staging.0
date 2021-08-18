Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C527A2F80
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 05:58:16 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id i22so1269053edq.11
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 22:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+33Dw5Q2efUACOK/im6UMmJQhcP/Gv+10S0CqUotcBU=;
        b=L8BDnQT8dSjC6pPMY2/gI8Jhl7qL76VLTYo/0QvFNVIV9VPzSIu8/jRZxL+zo9A7m8
         C5NgGPCZUa3Iawy8NaBcC9H8xvZHnjIyPFZmK0kt7EeZKt2F6KvjbjHdNBJLbQJMbuuo
         ML3VUTNLeLiM4ui2pDgoAXDJeAjrkkAQ0OKoHNXBEd4sBrH+63swSUajvHuMNG1z+M1J
         zPj+bJ5QS5XH816OZ8/nuMJ70P/bwg3jjGO6SjzGEHuNjOaJckjUiuIXXL+mmcSu/aLn
         kRc2UbzB4yuaD95qFCW/vfgvVhSn+zsGQckHXuP10wj5j5G9oAybQxtUg5g3bxgyi4K4
         6Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+33Dw5Q2efUACOK/im6UMmJQhcP/Gv+10S0CqUotcBU=;
        b=nGCEe/hZVeDtGUsto3pW92W0R7W2Gb6KbvLNetr9Ns67JtaWjvtc1gwHsm1LP4SKQZ
         c0Y85g+4u7rhP/8Cg9i0y0lpNWQEO0+amxwbmeGwjEc/V0o+91lkim1RzP5QeukFSM72
         Z08kBzG4uhHaUeIB3I3V2d9biVUUdlPSRaQrxSq6tr9bU8wGNgY3O4M5P45yx1Id/iI/
         7mZRgPh7zsVx1JvIGTV2gvf/nRnS/kG9nMKpsB1ocn8KsfxX++WBuLgpG551C0yc1NRM
         dNlp8bKO6aJvahP8xVbACcVXzAxT0X0IBeMYVz+9WH1vIR0EUxBhXNio9aUNKW6O/5f9
         L9SQ==
X-Gm-Message-State: AOAM533EMfFPIES5KgGT3pHlCHb6N0YsmTDYBq/7nJ9Va5l4MeGND1lU
	BOyzrxAJSJw3BPe9y7aPQFY=
X-Google-Smtp-Source: ABdhPJxzrUvtdM8TTbZsSRVUa5R10cl2QYnbxhaxsiUqRat7sQKbfrhTONE38HGIM8w0JGD9TM3i8g==
X-Received: by 2002:aa7:d404:: with SMTP id z4mr8025699edq.255.1629266295133;
        Tue, 17 Aug 2021 22:58:15 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id nd14sm1515245ejc.113.2021.08.17.22.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 22:58:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Aakash Hemadri <aakashhemadri123@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bjorn@helgaas.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: rtl8732bs: Fix sparse warnings
Date: Wed, 18 Aug 2021 07:58:13 +0200
Message-ID: <7025395.Gq2ipLbEtH@localhost.localdomain>
In-Reply-To: <22319634.U67b3Ei0OZ@localhost.localdomain>
References: <cover.1629135143.git.aakashhemadri123@gmail.com> <22319634.U67b3Ei0OZ@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 8:48:48 PM CEST Fabio M. De Francesco wrote:
> On Monday, August 16, 2021 7:35:05 PM CEST Aakash Hemadri wrote:
> > This patchset fixes the below sparse warnings
> >
> > [...]
> >
> This warnings have been fixed time ago against staging-testing:
> please see commit aef1c966a364.

Hi Aakash,

I see at least two of your messages never made it to
linux-staging list because the address is incorrect (you did not write in CC
linux-staging@lists.linux.dev, instead you used the nonexistent
linux-staging@vger.kernel.org):

https://lore.kernel.org/lkml/20210818044200.tvpr4j5vcaimexsn@xps.yggdrasil/
https://lore.kernel.org/lkml/20210818044049.yd7tnjvj3j4j3ddb@xps.yggdrasil/

Please, send them again to the correct address.

Thanks,

Fabio


