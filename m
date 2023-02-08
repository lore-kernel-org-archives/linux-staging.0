Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4910F33FF
	for <linux-staging@lists.linux.dev>; Wed,  8 Feb 2023 15:51:03 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id d8so1555428qvs.4
        for <linux-staging@lists.linux.dev>; Wed, 08 Feb 2023 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0FCUAdP8fR8HGttmQ9FRjYswWv2Z/w5870k5xh2T9xE=;
        b=Z0vAmf8Wt5sM/ATT3uuyPoQCnJHEUTPXqlQvKzH5WkinYxQRZTvkMYCNjjIhDZqvKW
         4eOkr/MSyG8OFENquuYQC6Uw48EgEc/rPEvsekV3K2sYGdKA2B3/ME4RKLe2oaveIbJw
         h79kWuoSesE22XqQHX+8LtvO5EXc43jfv9W6hV3fuKfpq1+BUnJDYWJ5WEmqt2f9ETEh
         cKMyWIPh2S/VeqCFOpBM86Ic4VelX5uj0rz1WhwARPkyjtKy9cqOacotztcoeyNCEBh5
         wpdLQvD3OPyZrDUqkDE7K3ybW2TmslqRL8A0V2bZ1rqvhN6htkf5iaH1evfBxXDc/B96
         t8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FCUAdP8fR8HGttmQ9FRjYswWv2Z/w5870k5xh2T9xE=;
        b=BhX151lWDlIiUMErTZEDoWC4hQEO53CFjcDIiWIf8HY9N55QkrTmgh2dxHW49bDX4W
         hmPCmMP7+J1h4CSLzsyZUqawLpLqOuZxq2TY9mUT3xdr5MmakRAf1G8fb2WV9mJ5kvew
         R5VkHGj68GW0wFCX6JE2X6YchrI/hPhhr7s3e4XIXSmzbfz0w7+Raw7ZewreKDxjHQK/
         ojmFzYpbEMFg07K99tARydkdmKEixnYL7idxnjJxsSNugprhq84aAPbRY9Vxz93dkLqM
         eJvruzBmD8Y4rfSM1uW/YJxFP5DsUmmU6xPuhhFnPC7U6en2+iTIkRbuepz70R38RLgl
         hSJA==
X-Gm-Message-State: AO0yUKV7t3bDTX+xmn5U1aDIEhB47rhlMts2/Aok0oTkbp3tOT8Q7WIo
	ZL5BD3sccFLOVD6ctBAvatquwdnfsnu1tNsypb0=
X-Google-Smtp-Source: AK7set+EvCQEntsJ4kMRBwUZNsL+UT5UDeEFU32hz61aliMKZXDUg7gXm5BG2ssE7v//m3jeQEq8Wwbd2HcWAPuFfRA=
X-Received: by 2002:a0c:9d42:0:b0:56b:ebca:815d with SMTP id
 n2-20020a0c9d42000000b0056bebca815dmr715571qvf.57.1675871462172; Wed, 08 Feb
 2023 07:51:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230123125205.622152-1-hdegoede@redhat.com> <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com> <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
 <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com>
In-Reply-To: <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Feb 2023 17:50:26 +0200
Message-ID: <CAHp75VcEaEwFVyAm1QijXjw0tF+D9JSr2JET0RJUNMea4nGMew@mail.gmail.com>
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 5:41 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Feb 08, 2023 at 01:27:37PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart wrote:
> > > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:

...

> > > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > > versions of these register access helpers, so that this code duplication
> > > > can be removed.
> > >
> > > Any reason to hand-roll those instead of using regmap ? Also, may I
> > > suggest to have a look at drivers/media/i2c/imx290.c
> >
> > While this is a bit error prone example, a patch is on its way, ...
>
> The two cleanups are nice, but they're cleanup, not error fixes :-)

It depends on which side you look at it. I admit I haven't dug into
the code to see if endianess can be an issue there, but the code
itself is not written well, esp. when one offers it as an example. So
definitely there is a fix on the upper layer.

-- 
With Best Regards,
Andy Shevchenko
