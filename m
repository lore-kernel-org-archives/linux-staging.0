Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE21369
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 19:23:33 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id o10so4717810edi.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 12:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/sGKoUhjexzOv6MxuCzYFaugzS1Axdf9CUus//7k+E=;
        b=Cxb3FS8bYsb0gqq1BjqVzPK8TLAW+S7YjyjW26mw0QManmpT4gyz0YdjOknP4oLHRK
         fv3M6zrSwyYLPNmVpIiPyPwN6XjEOZFUFjLUb6H33k6uUWFz6GTMg9cDvwkmFV/VgZZC
         x1Zts1b7fU8o1KBGTlSpjjwGLi/sSpK9w80Rd4BZFovbMvuAAdGqzFhRSVIhUaK/jgG8
         31BxmtA1PFhERfF4VApJzaKxxKz5CQtvwFCYe6u5WbuYQJQCN3KzbUzHKvP5garJvdNs
         8iV0uZXqszw+NLvhuVeyzzwfTgaK2hrvzSQfRDj/lVrZwmqSFVcA8OlYA8RC68oGLSl0
         +CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/sGKoUhjexzOv6MxuCzYFaugzS1Axdf9CUus//7k+E=;
        b=26PgC5PxWuRUAnvUA4Scsn847BXs2TwsiwaTNp+BjjR6CNRNPQCY2X6o0QVOK/OJ1f
         dH9WW/FO28Zfl1jSd9sx8X8Zz14dkOvZcB73Orsq7i2HfesLMZY5s7q9boE7dCw+6Ils
         czXylZRroFY7MkeHo2jf7JhRSDCohYdKDg1pl6XDF8M+T3Mq5JD0vKvsUIzdlHWwkdAz
         6iKlrzMR35m/ZvcGFYIReJjSY5MGNG5u6QPf1KD3DA+sDdeww9IWaDYxDjMJ/hBdPWAt
         lPLE18rBnjVocJfmUgFhXmzK684x+iRwtkdG4vtRK1rPs/zlp/3dAfvnGERzAKTuAlXV
         jnsA==
X-Gm-Message-State: AOAM53042RutV/sc9TFdyFyFzyG6pPG3AwzEqROkDMYgZ6ZkzHYfuqVK
	jpo4BGQcv2VHSstoFFH0VvyxWGcEuzVUyJ0nb5o=
X-Google-Smtp-Source: ABdhPJwyUsTZEa+zdUrjd//Q3O2bdXeZ/L/Pk8NflRaROcpg6uSuSFdLlynNRGS9zmcT1S4HmOeSCARE9Ehmm+EqMpQ=
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id
 b1-20020aa7d481000000b0042dd5fdf963mr62172778edr.209.1655061811811; Sun, 12
 Jun 2022 12:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220612160556.108264-1-hdegoede@redhat.com> <20220612160556.108264-2-hdegoede@redhat.com>
In-Reply-To: <20220612160556.108264-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jun 2022 21:22:55 +0200
Message-ID: <CAHp75VcNjQ+0=LcMdi=64U5qvO2f3PeZCPAf9AKbrGLx4PdKmg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: atomisp: revert "don't pass a pointer to a
 local variable"
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 12, 2022 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The gcc is warning about returning a pointer to a local variable
> is a false positive.
>
> The type of handle is "struct ia_css_rmgr_vbuf_handle **" and
> "h.vptr" is left to NULL, so the "if ((*handle)->vptr == 0x0)"
> check always succeeds when the "*handle = &h;" statement which
> gcc warns about executes. Leading to this statement being executed:
>
>         rmgr_pop_handle(pool, handle);
>
> If that succeeds,  then *handle has been set to point to one of
> the pre-allocated array of handles, so it no longer points to h.
>
> If that fails the following statement will be executed:
>
>         /* Note that handle will change to an internally maintained one */
>         ia_css_rmgr_refcount_retain_vbuf(handle);
>
> Which allocated a new handle from the array of pre-allocated handles
> and then makes *handle point to this. So the address of h is actually
> never returned.
>
> The fix for the false-postive compiler warning actually breaks the code,
> the new:
>
>         **handle = h;
>
> is part of a "if (pool->copy_on_write) { ... }" which means that the
> handle where *handle points to should be treated read-only, IOW
> **handle must never be set, instead *handle must be set to point to
> a new handle (with a copy of the contents of the old handle).
>
> The old code correctly did this and the new fixed code gets this wrong.
>
> Note there is another patch in this series, which fixes the warning
> in another way.

> Fixes: fa1451374ebf ("media: atomisp: don't pass a pointer to a local variable")

Dunno for media subsystem, but for ones that Greg is maintain, the
point is that revert itself is already kinda fix and no need to have a
Fixes tag, instead the commit message should clearly have the
automatically generated line of revert (with the rest of the
explanation why that is needed). Just sharing my experience.

-- 
With Best Regards,
Andy Shevchenko
