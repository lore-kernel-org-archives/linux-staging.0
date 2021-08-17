Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BBD2F80
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 10:17:17 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id b15so37504919ejg.10
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 03:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NWO6ngHHlNHXed0S7kJGpMxcXbrSjDwtrLrfdQYyBg=;
        b=Ul1sBQ84DdaXgLuqsa1OHtKPtr471qjFhsM+kaJqV179HfbZtdkkTVegqYgKC5pfC6
         hWdlsA8tnoh1CNMBZUa/bsamIQ5FSKUBRByTFNLO6C7f6ywVDyAPC/JZ6T+frKroyehM
         TirOiks3GBMR0c72MeYprKiKXEMPzDF087GKCAsKIlCExr93yW/KeL+CfeITu3Kw5l5w
         KhN+yIJRS6Fto1MHyJ7bDBz/JoTuCbW+X2A6UhvRoWWVccba6N8haM0OCfdrEJDBk0/6
         93VDn3jd1wvkiz5dH63ivrn81omg4UGMxkURMaM2wANCAJfmqcgJKacQ8/TTspNoH0wq
         ZB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NWO6ngHHlNHXed0S7kJGpMxcXbrSjDwtrLrfdQYyBg=;
        b=qp3Ck5QUqcilNNdaGejafWFAmZhnXbpeK/2/ZTLHNNs8Ut947Svp/NP2nn0iFlg9Lc
         pg7AGERYbB1DwtREMkqlMLQQDAay1/66FOaIErgDU4fTxOuV4OSrR5GDuxLmqYB1qhWl
         iTivAnbmHA6D5/7ERLOMVz7GxehtKDqtyb5fF+W1TYz+doW3fFB5ZPWuVEEcpeGdJ7zp
         qWtsgooq7FVfj/ZmC6LFJBbv6srEGq0IOF/i5UeBjfDoV/EHET5stY+9gTvhU6iNMbY0
         MCArZhOcT/gCjPonw9suNfYk3xecaoQkYiJyizbmDT2PgyY4Q43axoD2ClplZx0oQTXD
         FQ4A==
X-Gm-Message-State: AOAM532CNLSn/9iXXvKMjd28g43s4xnpTm7OjNgb2b9fDdBLzy/gf1ow
	kvACwIQcX7XLkxC+TGBesck=
X-Google-Smtp-Source: ABdhPJy4Yp5lFmqUSAONjnFD5pN+tyukzcJDHoKMxBYIStSJOhK3Wz+PebwYGK8h3OOEDTQSSOyArg==
X-Received: by 2002:a17:906:53d3:: with SMTP id p19mr3148097ejo.509.1629195435792;
        Tue, 17 Aug 2021 03:17:15 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id cb4sm558106ejb.72.2021.08.17.03.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:17:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: Convert uart.c from IDR to XArray
Date: Tue, 17 Aug 2021 12:17:13 +0200
Message-ID: <2337511.Rlusi4go5H@localhost.localdomain>
In-Reply-To: <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com> <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, August 16, 2021 4:46:08 PM CEST Alex Elder wrote:
> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > is more memory-efficient, parallelisable, and cache friendly. It takes
> > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > deprecated because XArray has a better (cleaner and more consistent) API.
> 
> I haven't verified the use of the new API (yet) but I have a few
> comments on your patch, below.
> 
> 					-Alex
> 
Hi Alex,

As I promised in another message, I've already submitted a v3 of this patch:
https://lkml.org/lkml/2021/8/16/1188

While I'm pretty sure that XArray should be used in place of the older and less 
efficient IDR (some time ago Matthew Wilcox agreed and confirmed that this
is true), I'm not entirely sure if we should also prefer XArray over IDA for this 
particular driver.

Initially I had decided to convert the other greybus file from IDA to XArray but
then I stopped because of the above-mentioned doubts. 

I really don't know if it is worth doing this work. As far as I understand these API,
IDA (although it is not as versatile as IDR is) is more  memory efficient than IDR.
In documentation I read: "The IDA is an ID allocator which does not provide the 
ability to associate an ID with a pointer. As such, it only needs to store one bit 
per ID, and so is more space efficient than an IDR.".

May you please say if you think that the driver would also benefit by the 
conversion from IDA to XArray?

Thanks,

Fabio



