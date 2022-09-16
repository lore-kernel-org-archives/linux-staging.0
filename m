Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC5B7E
	for <linux-staging@lists.linux.dev>; Fri, 16 Sep 2022 07:12:10 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3487d84e477so248714997b3.6
        for <linux-staging@lists.linux.dev>; Fri, 16 Sep 2022 00:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DE2ZdUL2HYhPOqvwzzPmLYQHO8bsfIjtF25iTHmhmzI=;
        b=KrbJtjgM5xbKvqJfC2o989PdTQXSpiSqy2SKQ/metYG2t/49AANGiRKkiNwqu720vS
         CqctyZuZlgH33AT2AMOAPRf2ltzR/iZDNIBPB78Gu99f8OJLK8ARxlsqVyL0WyXLedxy
         UEE3Xm0iM3dT++9xmZOwI7mqItq8Lb6E2nMijcDIaTw5k9JLVABEZYcZMGY+V12T/Ijx
         c8mT3uvnMmr/YMFt0Xe4qgtE7tjQw5KA5OfpDuYdqGZnLCBr/voNtUr/wttl7zuL1LBk
         H/c45izjZe7osBitG2Nx4pl/AVEMr7iwRA8LszzjTlZpSkCMeNS195FHqT74A3HH4Ni3
         c+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DE2ZdUL2HYhPOqvwzzPmLYQHO8bsfIjtF25iTHmhmzI=;
        b=44Aypv4UMCgkS5YjcCLInOHQnYWWtmpioAplBY7KbuFDtoAmvTrEAXiehM4aYArHcA
         ryMsApOY7MTsSE8Bv9c65ajYpUgEHoc0O6NJocQjtbIgHmYGV3st1+0LjkePzoLVRJQf
         C9L+XRaknv5yYec+k3EtiHb8iIt6iECaksnVc7820herLDdcpwnK6Q71Rxg4/mtTyriU
         ID15Cp4mF9c+uCzqyvYZ4YloEpZX6RRBGSQEt1R67jaIFHi3JV51ufImFBq7DZLzh8X4
         BDLI4NPzkitHbT7JhuiLuFYQacmCuHxx07HEyP1x19LoH5555I624g76paw+oMZcI5zx
         YsBw==
X-Gm-Message-State: ACrzQf31KwYFo4HLZrhGpVoIkrtOJJURql5sIpCyHVcnRImKsDyDAoxv
	lU8XLDoJXhlCqIJn+HA83QaFGiqb/pc2v2+QxnU=
X-Google-Smtp-Source: AMsMyM4esr4q3s7N1wM9ko5dALsiqR8ZdczR3dgZiLToL3UdRlZEWO8PyLda8yb76Pqk8fUv66V0X226F4UaXZLoH3E=
X-Received: by 2002:a0d:f445:0:b0:345:89a2:9a8d with SMTP id
 d66-20020a0df445000000b0034589a29a8dmr3264191ywf.107.1663312329210; Fri, 16
 Sep 2022 00:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1663273218.git.namcaov@gmail.com> <a046af7f-7b60-108a-39e8-9ac3b5ce7733@gmail.com>
In-Reply-To: <a046af7f-7b60-108a-39e8-9ac3b5ce7733@gmail.com>
From: Nam Cao <namcaov@gmail.com>
Date: Fri, 16 Sep 2022 09:11:58 +0200
Message-ID: <CA+sZ8B-93re5277swkO51hMuxqgKaKcR3AWcEJAfwcOS-ytdjw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] staging: vt6655: Implement allocation failure handling
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 15, 2022 at 10:58 PM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/15/22 22:29, Nam Cao wrote:
> > This driver does not handle allocation failure when receiving data very well.
> > This patchset implements better handling in the case of allocation failure.
> >
> > Nam Cao (5):
> >    staging: vt6655: remove redundant if condition
> >    staging: vt6655: change vnt_receive_frame return type to void
> >    staging: vt6655: split device_alloc_rx_buf
> >    staging: vt6655: change device_alloc_rx_buf's argument
> >    staging: vt6655: implement allocation failure handling
> >
> >   drivers/staging/vt6655/device_main.c | 41 ++++++++++++++++++----------
> >   drivers/staging/vt6655/dpc.c         |  8 +++---
> >   drivers/staging/vt6655/dpc.h         |  2 +-
> >   3 files changed, 31 insertions(+), 20 deletions(-)
> >
>
> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Thank you, I really appreciate your help.

>
>
> Find in this email a comment from Greg about RFC:
> https://lore.kernel.org/linux-gpio/YwS4WDekXM3UQ7Yo@kroah.com/
> This patch is marked as "RFC" but I don't see any questions that you
> have here.  Please resolve anything you think needs to be handled and
> submit a "this series is ok to be merged" version.
>
> May be this is applicable to this patch as well.

I add the RFC tag to "tells maintainers should review your patch thoroughly,
and provide feedback. RFC is typically used when sending feature patches for
the first time, or anytime the patch is more than just a simple bug fix."
(from https://kernelnewbies.org/PatchTipsAndTricks). I was not aware that this
tag may be interpreted differently. I can send a new patchset if necessary.

Best regards,
Nam
