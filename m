Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6371D72
	for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 20:21:41 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id m1so7255084pjv.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CaGEdpDA93dZP0T/+1LD+f5/OqGOURSdBO4AdBPyvbk=;
        b=AI4mpHFjoc+Y2m9BVS+3RhJtiRCm72bWPg5xeFX3yUwqR9Kdvzh37YFqhkJlkxPQt7
         kgl/LMUCRXv8Cpzf/xkr1Mk29l5n/cBKw8q/Pzzs17W0xS8iRR0G/dA4p2WktS3yTBD5
         vkvSfAvXlt7/VtugQrsqlNR7rSq+e/qVLW61GE+/jOBJCTfHwLRuuX6u0aRQ960n8uab
         2P+UTPnucB2iQqQRZ/IIdNbmc/T7yfMNUddULY9b7pa3CzHYN5sitUrElKRkuglqSVqd
         hD04yQtRjEzvbJneJ2RZwezrBm7zI8/YRhcxZRGfhuKJax+aTmEryBLZPU1NqIUQicG6
         qFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CaGEdpDA93dZP0T/+1LD+f5/OqGOURSdBO4AdBPyvbk=;
        b=XFh+3Q45kWEVAK7jLqc10fHip2PmBFsjt7NTxxKXI5zKVXBFvh9bDUgPnW6LdL0oT6
         NANNNTgtYvlkJbTxmYVOLqGYFhMtjkSZFGf/ppcYlXOCbtquYIzquZPlGfCM4RsFDgbP
         fSxBBknkNnE2maYo2AcDpyZbSyv16metwWQIliEctIZsq92pJnnFOQ/rmgsPJkneDtua
         cgqm8pQ2wnnbPeK4P+JPEDfW6E7rwAOPQ/oNF0QIgNF3FYo2xLOkOwMw8oqHwHh45czM
         VZ7XvI6CkLhN5qsbVKgDM10LkHBxvLMkMIbd1kQLx5JfES5KOtAsuACciNySGypewXaL
         daVg==
X-Gm-Message-State: AOAM531qlFRIKNCPQP2GmNvNw3u79F5O7Jh6OoTQbDNXhyjHc3gHfGSB
	I5cFS2+Qx1UEeAPbnG6E04bhjcPw4dXb22wIdho=
X-Google-Smtp-Source: ABdhPJxIurtl+fyEVAfteEQTQRQm0hJYAmrkxEIc3ejHJa8Sxk7bXTxc+lF8kHpmsI9dOr0LIZjXQdwtFgfOfFRHTCw=
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr11150254pgg.4.1627158100931;
 Sat, 24 Jul 2021 13:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210724151411.9531-1-len.baker@gmx.com> <20210724151411.9531-2-len.baker@gmx.com>
In-Reply-To: <20210724151411.9531-2-len.baker@gmx.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 24 Jul 2021 23:21:04 +0300
Message-ID: <CAHp75Vd+ZM_yO6CU_6oJieePMt00Sp6oKEU2+QEyZxLDg5PN8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] staging/fbtft: Remove all strcpy() uses
To: Len Baker <len.baker@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Phil Reid <preid@electromag.com.au>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 24, 2021 at 7:05 PM Len Baker <len.baker@gmx.com> wrote:
>
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. The safe replacement is strscpy() but in
> this case it is simpler to use the "%*ph" format specifier.

...

> -       char msg[128];

128 / 4 = 32. So, this buffer is enough to debug print only up to 32
bytes. Hence %*ph replacement won't cut output earlier than requested.

...

> +                       for (j = i + 1; par->init_sequence[j] >= 0; j++);

Why is i + 1 initial for the j? You may rather access the 'i + 1 +
j'th element in the array...

...

> +                                     par->init_sequence[i], j - i - 1,

...and get rid of the ' - i -1' part here.


-- 
With Best Regards,
Andy Shevchenko
