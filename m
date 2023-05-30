Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191841774B
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 11:32:44 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3f80e055549so21376521cf.3
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685446363; x=1688038363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CX81QWvH6s9KobzrQsWhmRGUwobmqZbLPmPxbjonnI=;
        b=oVT4K3lX8p1VNzyYUMympqQHEHM6dCfrfnHaE0nko9gnJRsyoKv6HPSGk/sqmywVZO
         lDwk+NZmwsIEqfFG5VetzKVHjuPhCfBeM4w8cJD/m5ij5YgdWwjiaNZk28pqL1EUQcJB
         0gwZ/3jBxyhRxQc+WXfEpxss3mudXcoJUjHx0hj6GC7YMLwT7z4oe6vruayKcze0sKzo
         H4ZJ3MAGGzm5WtPzCvw/elSakHIXBL+xKaur1WAqITl4x0E3Dq/5XRiFX6gfzHm+F1bk
         pzQYze0o7dVKCQgXx1rU7YTV8VUIf9kjHJUDeGxCJSsThzMnuT6WhZyB83YgMD/CoQjF
         wsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446363; x=1688038363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CX81QWvH6s9KobzrQsWhmRGUwobmqZbLPmPxbjonnI=;
        b=REo/89Urf25+YN2X6qApFkkNEkrs2sBA2vR1Fz7kkoU9jlbDoHD9Q5aWZ9AjWTaCwn
         h2+fwc0pPmZZBctrS4qm/FMBpZk8qsTbE/TfOpyYXFKLU8hEhZbYDT+moDoL0T9dKlLN
         Ga0GoGWCN3sRgPXtr8Asi/5EC9nGUvdG2pC3f+vMAU7Wd1oOw6nFb9VbHrtYnc7dthEg
         f3FSbgF/AggPWF/LPk/80Sj13eLbnUDv1xDI/oy6UeEaAqSDfahX/uUytd4w+kPtybtg
         r4TGGs/YAmLqu8WLWxK0Y0ioshG2OdN1VaZT4oMmZcxssTy0OdAD1oRISMbGbHfS20hm
         Cc2w==
X-Gm-Message-State: AC+VfDy07M7hula5FEnGAtP3TbCFs0HoDvPJXdeGd6hDNJNPr4H+JYuv
	2plpsyzSH7jRaZxiR5wn19ftrEsfEWXYqVih/kI=
X-Google-Smtp-Source: ACHHUZ6ytsG267MBZ7DmFEntlrmRiVBGiwfzQPpFlxYfxho8sft+/wYtkjKawGRkFqNjx5ngPISYo7Orl1qogtsA6Uw=
X-Received: by 2002:ad4:4eae:0:b0:625:aa49:19f3 with SMTP id
 ed14-20020ad44eae000000b00625aa4919f3mr1670661qvb.64.1685446362988; Tue, 30
 May 2023 04:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-22-hdegoede@redhat.com>
 <CAHp75Ve6rWtkDowBS7z1f=Ot7h8xmXTws8L+Z3eXEfFum2pBcA@mail.gmail.com> <c3580ce0-c43f-8918-ad44-56d512c4fd04@redhat.com>
In-Reply-To: <c3580ce0-c43f-8918-ad44-56d512c4fd04@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 May 2023 14:32:06 +0300
Message-ID: <CAHp75VeDj6HmG4YzU5aOYOoZkWu+J=GkLwu=LuWpa5jXoqkPTA@mail.gmail.com>
Subject: Re: [PATCH 21/21] media: atomisp: csi2-bridge: Set PMC clk-rate for
 sensors to 19.2 MHz
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 1:28=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/29/23 23:48, Andy Shevchenko wrote:
> > On Mon, May 29, 2023 at 1:39=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >> +       ret =3D clk_prepare_enable(clk);
> >> +       if (!ret)
> >> +               clk_disable_unprepare(clk);
> >
> > I'm wondering if _enable / _disable required.
>
> As the comment says the BIOS may have the clock enabled
> at boot, the hw won't allow changing the rate while
> the clk is enabled and the clk-framework won't
> allow calling clk_disable_unprepare(clk) without
> first calling clk_prepare_enable().
>
> All the sound/soc/intel/boards/*.c files which are
> used on BYT / CHT do the same thing before setting
> the codec clk speed.

Interesting... It might be that x86 (under drivers/clk/x86 or
somewhere there) can gain a common helper to do this trick, so we
won't repeat this over and over again.

--=20
With Best Regards,
Andy Shevchenko
