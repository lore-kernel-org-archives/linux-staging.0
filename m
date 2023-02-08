Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A773B2560
	for <linux-staging@lists.linux.dev>; Wed,  8 Feb 2023 11:28:14 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id 5so10317682qtp.9
        for <linux-staging@lists.linux.dev>; Wed, 08 Feb 2023 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7YpfNmkAKeiQRbYqt6rvLG7n/PQqFPtfmCT30QU4IU=;
        b=HtYsaoBpdOlbY8Y/b0VGrVOb6VoCm0SqSgiczMXLiJaeTc+04jtzQMskjCYB5C5OcF
         GEXov6ehfj+3N27qvZJH1yGjVe4bS/LxnBeDqlup7mvtgnDiJGO/svLv5QaOUxvj9u1L
         snLUJWFulzRh0Jlse/Yx3IUPcXKOd1yoBUG4rNEy2Bd96CgegybuSzb2fgGFplwladqp
         VdBYtxQRUTCMYT1ER6bA4gHXGKAaqt3B5YpXQlFjA/VG9JBzivZioaOFTpVbqaMIMuPI
         pgl25io1KqoV+BCjj225IdxMROPdJxIFK5D9U7rnMndGcSCO5jfJc0lK+Cv4SKfqhkOU
         8qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7YpfNmkAKeiQRbYqt6rvLG7n/PQqFPtfmCT30QU4IU=;
        b=NLVbYhfzTgI4RPdoDWYyT/O3cRDMTrzu2s5Wua+ScYmh6fdmo3m0Yp6k/No5QCwCPI
         eW2piMH1Kx/O+3g8I0LjFb1O9bUnUCse5+RHvtp4ynwRVHU7kEhlU4BHE6VNQqQIjFxd
         aLhb1H53xjyfopa7+4m0bTzEd/rV4mjQ/fWjj+UavPcQK27+euDm9yDV+Kp3NEKXdqcH
         4vsPumSu7ZG4uetVKSaExtEJ781ITWMXyw0dKKztfRU6JPMEogjvzP9cK9P7z3F1N21d
         1SojSPL4P+P8p6N03L7qednC006mjy+7SK/qiZN66QSJI+P6rTCbHWIIPYnXvXXA4F30
         s2zw==
X-Gm-Message-State: AO0yUKUVnxsgPtxn0dtGhQse51miajl+H8ejePIHVrKdbm69I8d4dpni
	y4mwor8z4Bf43V/AZQs5QJ+DIWtw50Cg190WI1g=
X-Google-Smtp-Source: AK7set8jaCUipbc0hNu7gRUHgc2ylVfsf9/2wYfCf3Q8JN0SrFk+CmXhpHcX3sA3e7jkR4OQup2uADLHUHAsZvZTHMk=
X-Received: by 2002:a05:622a:1456:b0:3b9:a4ee:be1c with SMTP id
 v22-20020a05622a145600b003b9a4eebe1cmr1241819qtx.391.1675855693515; Wed, 08
 Feb 2023 03:28:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230123125205.622152-1-hdegoede@redhat.com> <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
In-Reply-To: <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Feb 2023 13:27:37 +0200
Message-ID: <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:

...

> > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > versions of these register access helpers, so that this code duplication
> > can be removed.
>
> Any reason to hand-roll those instead of using regmap ? Also, may I
> suggest to have a look at drivers/media/i2c/imx290.c

While this is a bit error prone example, a patch is on its way, ...

>  for an example of
> how registers of different sizes can be handled in a less error-prone
> way, using single read/write functions that adapt to the size
> automatically ?

...with regmap fields I believe you can avoid even that and use proper
regmap accessors directly.

-- 
With Best Regards,
Andy Shevchenko
