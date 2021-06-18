Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985B71
	for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 18:29:01 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id ho18so17240941ejc.8
        for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 11:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BG4eKVHKznlsObIX3tbztA9VJHzMPAhtbR7iiL8ePI0=;
        b=Q23TrU3E6GAes3b7ZQW9O6WJuns8aX+hTXQnaJWCorE0GnA1a2diqu7X6Yt8/wdOiJ
         EsYzPVuFCOl4NQzraLZZH9TShwuxSzFuaYEsBFzBFA715CUqRAMIS6TGhG7VYJET8ZMS
         eIXMyE8eiH6kgzpB0UBiARyD83F77tSrL50PgHShHfvMvz4jnMA82dhiHfsD0fRaeXT3
         ibHDleHxO7zqaxEr3BXRZzEdCCbcP5rwDLFiJyLkQ/f+xSQpL2bZ6Zsy6wmTgS9RmGcI
         +Me/lDMtyPQV+9qfqhunBr9yI3A14aXJAKEcFlh63IjjJ4rCbCynphRaPTdQUY/LwIPg
         hHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BG4eKVHKznlsObIX3tbztA9VJHzMPAhtbR7iiL8ePI0=;
        b=lkMtI7WJryJCud+bBfhyaWir0aeO+Fda0MWfS6ucPVBDdpogcrYyek2gnFfyfT3W6p
         yNGtpNJ5Hcd6YjRZ6g6d9Llm4m2PN7b3OdWxg7p5CwJSgY5r6KSTGd9r2S3kNIhNEUfE
         QoNnk/cU97efdor2GSeSBxEVAffGYW4X1AUCdR8EOt6NfU4cDTAKGM1rhjFv9Q89QyGO
         RA/lJV4qci0oyuvZUET0TQVZ/QcG9u+hnY8tZdxwIYJfAZzWESR8xRIHkLgBY2VywcVk
         gE7GXV6+VFeZCAKzI8x729xix9/hZj2gCYQyfe+iYn9YMawAkOhyCl+mowFILvMUulWs
         HfBw==
X-Gm-Message-State: AOAM530FjgeO2gXn3MYPORqW7Ip0Xi7OQ5PmY+8SGiZy4lgt1edZVEjm
	ApxtQ+xO23ZKMtgyr2Fa0THXpT/Bjdgwx36+gL8=
X-Google-Smtp-Source: ABdhPJzUTmuFnxnrbs89PnRsUk432kebaSBEk+xc/xA6GneetOr7+kC3P1prX2ZGQyxB/ZTXnzdLuDZlvYJVic3Vhu4=
X-Received: by 2002:a17:907:7848:: with SMTP id lb8mr12777004ejc.494.1624040939644;
 Fri, 18 Jun 2021 11:28:59 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210613122858.1433252-1-fbihjmeric@gmail.com>
 <YMX7SRSPgvMA/Pw1@kroah.com> <CAKgboZ8QUQpiinL0xCxUmcp6nEVU20jXkDXbrK_QisUMiLEo1A@mail.gmail.com>
 <YMdkN9cft6KHcFn3@zeniv-ca.linux.org.uk> <CAKgboZ9P2afm7-eOE3COrKVDkFZ_g288KfJAyQiwzC6fN75VmA@mail.gmail.com>
 <YMeL7PjstV601pbN@zeniv-ca.linux.org.uk>
In-Reply-To: <YMeL7PjstV601pbN@zeniv-ca.linux.org.uk>
From: Jhih Ming Huang <fbihjmeric@gmail.com>
Date: Sat, 19 Jun 2021 02:28:48 +0800
Message-ID: <CAKgboZ9NnN6FZ6XX5MhRk0T-TLvmPvsRWogSPuXu8m940mWNZg@mail.gmail.com>
Subject: Re: [PATCH v2] rtw_security: fix cast to restricted __le32
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, fabioaiuto83@gmail.com, 
	ross.schm.dev@gmail.com, maqianga@uniontech.com, marcocesati@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 15, 2021 at 1:03 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Jun 14, 2021 at 11:27:03PM +0800, Jhih Ming Huang wrote:
>
> > Thanks for your explanation.
> >
> > To clarify, even though it might be false positives in some senses,
> > following "hold the variable native-endian and check the conversion
> > done correctly"
> > is much easier than the other way. And it's exactly the current implementation.
> >
> > So it's better to keep the current implementation and ignore the
> > warnings, right?
>
> Umm...  If that's the case, the warnings should go away if you use
> cpu_to_le32() for conversions from native to l-e and le32_to_cpu()
> for conversions from l-e to native.
>
> IOW, the choice between those should annotate what's going on.
>
> In your case doing
>         *((u32 *)crc) = le32_to_cpu((__force __le32)~crc32_le(~0, payload, length - 4));
> is wrong - you have
> crc32_le(...) native-endian
> ~crc32_le(...) - ditto
> le32_to_cpu(~crc32_le(...)) - byteswapped native-endian on b-e, unchanged on
> l-e.  So result will be little-endian representation of ~crc32(...) in all
> cases.  IOW, it's cpu_to_le32(~crc32_le(...)), misannotated as native-endian
> instead of little-endian it actually is.
>
> Then you store that value (actually __le32) into *(u32 *)crc.  Seeing that
> crc is u8[4] there, that *(u32 *) is misleading - you are actually storing
> __le32 there (and, AFAICS, doing noting with the result).  The same story
> in rtw_tkip_decrypt(), only there you do use the result later.
>
> So just make it __le32 crc and
>         crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
> with
>                         if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
>                             crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
> turned into
>                         if (memcmp(&crc, payload + length - 4, 4) != 0)
> (or (crc != get_unaligned((__le32 *)(payload + length - 4))),
> for that matter, to document what's going on and let the damn thing
> pick the optimal implementation for given architecture).
>
> Incidentally, your secmicgetuint32() is simply get_unaligned_le32()
> and secmicputuint32() - put_unaligned_le32().  No need to reinvent
> that wheel...
>

Thanks for your comprehensive explanation.

I just sent the v3 PATCH, but I replied to this thread.
Should I create the other thread?

For the secmicgetuint32(), I am not the author of this function,
but you are right we should not reinvent the wheel.

Let's focus on sparse warning fixing in this commit.

thanks.

--jmhuang
