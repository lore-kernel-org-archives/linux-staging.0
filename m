Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459D7B
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 12:58:18 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id q8so7999444qvr.9
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Ytt75Rwl5ykbAZeDOlwL77SmXTm3rgZOkXBD2cpJoDg=;
        b=QuOCFXUkEEGKV5452uivChgBrRmCIY7lxxC83ObtIaS9h62yRcpNfwWi2hFpCvB5K9
         +jNfa34KqOdwcsrWoNGvaO61ThhXWnCC1ET1UePyBGqV8R16w0CrJrEv9Dwe33JpVX5F
         lG+/AcCqkQZ6YlU8EoEIQo1Q54f2lusOmne//tUfnpdYJfWOlqqFAdrdRpfB8pKUCT1k
         1jfVSFY83GlBzVmEAEBxLv+STPAtlVS0PBpdMXDlsBLnFjxT0n2sr2INclJIqQJKdPuq
         iFWUbp8DvCBwWht8kHWlUHz+9OqVAFMk1I62CK301pwk3lZ1T6/rvMGHvJwwlh5LUZOA
         4vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Ytt75Rwl5ykbAZeDOlwL77SmXTm3rgZOkXBD2cpJoDg=;
        b=YQjjfZcKx6GYTKPmWK/yctCBAsEJ3ujL3r/XDomJCPnc/iS8BQl0JTmfs+9S/KXRlO
         jedd8SglvKjQ5ASl0jVXDjSkbg/jnLn5ErcEKygpJdDW9untP41rXNGB8t/ZbiY1DGeZ
         PLg3K8bBmQUjeZFc5cxvAxVBbGSrhm6UQ1qkOeqTH5/AQmCpowE3n/oQX489OYDJy6KR
         mKj0ffe7hmC9Tu+MZf5yZLeYqXrI2plK+5sXn0VasyyvwJKPhhglWr2gfSfMGx1VxQ/J
         wOOhuZu/TMTQh51M3OiTzXFV9cZboJzfKP7bgDPcFhyts0cGwj8dWXadYUMeYBZixYtQ
         8H0Q==
X-Gm-Message-State: ACgBeo1HDVp6zdksRIDI9IZ/SQzzuIXzdDumrw9j4nGuiw5rKsFp1fq/
	/sZhkE7MZDvyEkgcvSM5B5HDkk4ZMjjZP426+Ro=
X-Google-Smtp-Source: AA6agR7Fm78HblHKkcPzQbvrAyg0Q05YzFVa2PlSBTZ3DOET3ZVDbg0r/4wNS3m0vPeYS6JnAJZzNOdHBktai6IB+Kw=
X-Received: by 2002:a05:6214:e69:b0:476:b991:586f with SMTP id
 jz9-20020a0562140e6900b00476b991586fmr15175158qvb.48.1661173097078; Mon, 22
 Aug 2022 05:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com> <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
 <3834201e-95a3-02e7-c549-e5630fb64892@redhat.com>
In-Reply-To: <3834201e-95a3-02e7-c549-e5630fb64892@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Aug 2022 15:57:40 +0300
Message-ID: <CAHp75VfxR6zfBzpdnM1RKv-ewnPCMejdLgY2QTnhfZ+sFFqcMA@mail.gmail.com>
Subject: Re: [PATCH 01/13] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 11:02 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 8/22/22 00:31, Andy Shevchenko wrote:

...

> So let me add that here, then patchwork should pick it up:
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

You may also add
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
to all patches, but the 1st (it has already SoB) and commented ones,
which I'm going to do soon.

-- 
With Best Regards,
Andy Shevchenko
