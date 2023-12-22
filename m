Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3581DDDC
	for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1XjorRc"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6dbb650ad59so1373983a34.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703277254; x=1703882054; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9AGtrpk9mhnPkcDUK7l2V4SwmO/cK0FW1ar5CBt55w=;
        b=R1XjorRcBOq0Kh794K4GsWVhDbfWRz7iKyI4pZtCrDXbXIK1Jfvv0pkuPzrM9TgwFR
         XJoX0cs+ANbT6Fbi9A25eZjLiRyMhTXUdt9rBTixKXa8iPcZcTAnxDBdailSbkyZlj27
         X07L2KST+x77dPSIZuu6hlZqTEa+4RqZC+KCYLU/BuXeqvs+ujRDhTDm9i9DWy2xNKki
         9slokXk46YQjwjYrsYRadP39XBMzPTtffqMC1nl/4QHz9b2bjv8TZ0mZyEFF75XoOzNN
         svLmUprqIFRgzQSfE8cjQVKB/79phaYk/H2fv3GOtGPBKHpZEMqnRSJ2DzI9sUecTWZy
         ONZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703277254; x=1703882054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9AGtrpk9mhnPkcDUK7l2V4SwmO/cK0FW1ar5CBt55w=;
        b=WnBML4SEPAXOOwdpPPhycAhdoiKArmAGP/lIdK2yW+dh06YANK+83fVImZJ9jQcMXI
         PwEIttfC1dXryuiGMZfHYi858c5X0zsis7hrOqbQZE+Ltor2e8lDhFWFAHiAwt3FaI5K
         FjAJn5GSiB9ivevBjX6Bp2GEUlzSd802ou71zxV0oujm/LLL2tEUv45wgHhjjEJwulg+
         e+CSN8HefRbkqFGwBBMQr/x1Ys7ERoOH6/Amzd6p4Iy/eByLP6OhYwapos3KZJ9h5DRZ
         AEqK7Z8OqjFbLRdrKEQFQqVyJnoaAf9l4QBRUWqiPUfuCLJunreyNyEoB/i2s9YUNpTO
         t8cw==
X-Gm-Message-State: AOJu0YySdiRp+ua1vxqX47XtEHvSJq9utasp7qLHUNgSDCFyTl9HC8QQ
	n4jxvbjI99DRmX+6j0XkGaD3o+2MjW6urm+YUp0=
X-Google-Smtp-Source: AGHT+IGJN7J5vr00bGcCmpBPu9O5udn3QTr35DetlYFkKB9omxFqKHM3YQ2mCBuNJgq3oYdYUvxBSjvmxRiBHJi8qOA=
X-Received: by 2002:a9d:67c6:0:b0:6da:f9:ae99 with SMTP id c6-20020a9d67c6000000b006da00f9ae99mr1474742otn.0.1703277254389;
 Fri, 22 Dec 2023 12:34:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231222200350.2024-1-kdipendra88@gmail.com> <b4ad9a64-53cf-449a-aa18-d19ff3c72c52@infradead.org>
 <CAEKBCKO4uGKxXPZHO9iqYZ_8ibgY3HS3C8Rsogcv1XU+qGkudA@mail.gmail.com> <a0945bf2-72a4-4ad9-ad94-74d539555862@infradead.org>
In-Reply-To: <a0945bf2-72a4-4ad9-ad94-74d539555862@infradead.org>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Sat, 23 Dec 2023 02:19:03 +0545
Message-ID: <CAEKBCKM3nHYS6V8RzM1f8wuTsGWxpm+b9qXz9wd1vAPpc+66Yg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, hpa@redhat.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Dec 2023 at 02:16, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 12/22/23 12:29, Dipendra Khadka wrote:
> > On Sat, 23 Dec 2023 at 01:57, Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> Hi--
> >>
> >> On 12/22/23 12:03, Dipendra Khadka wrote:
> >>> The script checkpatch.pl reported a spelling error
> >>> in ia_css_acc_types.h as below:
> >>>
> >>> '''
> >>> WARNING: 'cummulative' may be misspelled - perhaps 'cumulative'?
> >>>         u32 padding_size;       /** total cummulative of bytes added due to section alignment */
> >>>                                           ^^^^^^^^^^^
> >>> '''
> >>>
> >>> This patch corrects a spelling error,
> >>> changing "cummulative" to "cumulative".
> >>>
> >>
> >> 'codespell' reports this one as well:
> >>
> >> drivers/staging/media/atomisp/pci/ia_css_acc_types.h:411: descibes ==> describes
> >>
> >> Thanks.
> >>
> >
> > Thanks for the reply. Do you want the spelling mistakes reported by
> > codespell in the same patch with this change as well or you will
> > consider
> > it in the next patch?
>
> That's up to some maintainers, but I would prefer to see all of the
> spelling errors fixed in one patch.
>
> Thanks.
>
Ok sure,give me some time and I will send the v2 patch.
Thanks.
> >
> >>> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> >>> ---
> >>>  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >>> index d6e52b4971d6..ac6fb0eb990a 100644
> >>> --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >>> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> >>> @@ -84,7 +84,7 @@ struct ia_css_blob_info {
> >>>               memory_offsets;  /** offset wrt hdr in bytes */
> >>>       u32 prog_name_offset;  /** offset wrt hdr in bytes */
> >>>       u32 size;                       /** Size of blob */
> >>> -     u32 padding_size;       /** total cummulative of bytes added due to section alignment */
> >>> +     u32 padding_size;       /** total cumulative of bytes added due to section alignment */
> >>>       u32 icache_source;      /** Position of icache in blob */
> >>>       u32 icache_size;        /** Size of icache section */
> >>>       u32 icache_padding;/** bytes added due to icache section alignment */
> >>
> >> --
> >> #Randy
> >> https://people.kernel.org/tglx/notes-about-netiquette
> >> https://subspace.kernel.org/etiquette.html
>
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html
