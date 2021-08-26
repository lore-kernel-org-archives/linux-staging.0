Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97463FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 18:56:15 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bt14so8482802ejb.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KvsflDkWCpoXreowakAw0AK8LR1AdIFSNtPrQ0bbYKA=;
        b=Iax5JdHSO25jzMdGpGlFcbTS4M1JwI/9rDANeDgNfRC0gTNsw3xctsB3T+wSsghh3I
         KovLg45CVQFbtcmRNSSskWUkrp7Rjqj9+coIzQJiQEAn7IDPB3pp6qXFCYDbjdgjO/wA
         7RLXeZYCeiV1Lvmja43d6amw2xjSaChiX1v8KB6vE1b0F/Bs10JpW3rYQWmk67uK7TWq
         HFaRxh92IrGbyzlraTkYfSILab3idPhbBXSzgqUS0CuoOYvUcpLqKcYBk+wV0N1v+0GG
         IqKRGtFsVB8ta+dXo4w6h2mICjpsPJHl61omxBk/GXUaHH4GgTmhVNXpFyOt84+jDiyb
         6F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KvsflDkWCpoXreowakAw0AK8LR1AdIFSNtPrQ0bbYKA=;
        b=rvETo34pGWWB3qdmRJuCSvcOHpf0YquRlTNn977QoQhjHi6XFOhaCLCvzR8fHecR2e
         8TFKsiXGU2xkl+Md7JJUo16IkLf8HCqDubr0jEOiEg45QbBO2OQZ3oyYhAQdiVxDJewg
         c726GcQY7PdBH7+K9+L/nvcvV2DrDXnWAwONpVjrVa1F9OJsJ0LBwLi0UvzpPUa9SyYK
         g72PIN/08xZ05I2LD9eMacbvaTZOSAn2+FWagNcio/p0DPc5mZe/aqmDNy628VLC0OVI
         TqdDyvSaHUEzjhiewrADbJNsHUksgo7La3tFU95TldbzH8ycEMkMn3S8jHGgszPyjE3i
         f1uw==
X-Gm-Message-State: AOAM530e1wHJPNsAU7JWjv7R5sF9NiyR7/wRi6Vij3nh6ZMbCXPVwY2j
	ueqEO2qOGlruys4yIJ1Y7dM=
X-Google-Smtp-Source: ABdhPJydXFiZSOFxFhWFdXE6EPtNX1nsMbnIY4T03nP/8c2jVk7Vm0ANbA0yUcpGMuSXzKJKts0WzA==
X-Received: by 2002:a17:906:3497:: with SMTP id g23mr5875986ejb.85.1630004173984;
        Thu, 26 Aug 2021 11:56:13 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id r16sm2255443edt.15.2021.08.26.11.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 11:56:13 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v3 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Thu, 26 Aug 2021 20:56:12 +0200
Message-ID: <1954117.IISOP8hFdM@localhost.localdomain>
In-Reply-To: <f2360c8c-e001-70d6-daeb-03ca5b718d84@gmail.com>
References: <20210825035311.8910-1-fmdefrancesco@gmail.com> <20210825035311.8910-2-fmdefrancesco@gmail.com> <f2360c8c-e001-70d6-daeb-03ca5b718d84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, August 26, 2021 8:18:23 PM CEST Pavel Skripkin wrote:
> On 8/25/21 6:53 AM, Fabio M. De Francesco wrote:
> > Replace usb_control_msg() with the new usb_control_msg_recv() and
> > usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
> > Remove no more needed variables. Move out of an if-else block
> > some code that it is no more dependent on status < 0. Remove
> > redundant code depending on status > 0 or status == len.
> > 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> 
> FYI, I've tested this patch with TP-Link TL-WN722N v3 + qemu :)
> 
> 
> Tested-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> 
> NOTE: I am still not able to apply 2/2, so tested tag is only for 1/2
> 
> 
> With regards,
> Pavel Skripkin

Dear Pavel,

Thanks for testing. It was very kind from you.I'll add this to the Reviewed-tag
that you had already given to my patch.

However, I intend to rebase and resend this 1/2 and the 2/2 of this series, because
(as we already found) they logically follow another patch of mine that is still in the
queue ("staging: r8188eu: Remove _enter/_exit_critical_mutex()").

The patch above has already been reviewed by Greg and he found that it looks 
good, but he cannot apply it because it is not tested (for the reasons I've already
explained with a couple of messages)

Unfortunately, until "Remove _enter/_exit_critical_mutex()" is not tested, Greg 
won't apply it and the 2/2 of this series cannot be applied too.

Please, if you have time, do you mind to test also that? It would allow me to resend 
it with your "Tested-by" tag and Greg will surely apply it. No worries if you have no
time for doing this test, otherwise you may find it at:

https://lore.kernel.org/lkml/20210819221241.31987-1-fmdefrancesco@gmail.com/

Please, if you are interested, read the whole thread. You'll see that Greg would apply
it, only if tested.

Thanks very much for your help and kindness,

Fabio




