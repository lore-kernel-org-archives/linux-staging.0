Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127563B14A5
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 05:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783316237; cv=pass; b=aPmd6wg941Xyfj33sV57qYcx9nICz2borjPtmyCo6LtsSOAbsTfUTRV5jnrHp7Xm9UGzLXFYOo4+XVDZxwLHWO7PKeO5BT3DY9vZAbFgBcHwekgmwvBJ19OY0NCHxqEpx774xH7t697LOqtfSSTzNl0Tlnk+pN3AUsZ2jAT3mO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783316237; c=relaxed/simple;
	bh=CcnB2qLcUnvNos/QLkV19B3s0ALvCZX53wLvV0ri8Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5eQ/fOkDqAEBqHybh6BHVn1p+RqtVna51f0COguL8GsdgANtPVVgSKeVRzh8QXcEYrkBzMefQRq2qaOBG3tu1soz46hm+xdsnLqSojm2pQEQSu1iROLnLI2aNWcaAwVnVvUTJTE9oKsOh/ZyqJ8aX07lNy4wIXSjLe83WfGOWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZPQ2lJ4; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZPQ2lJ4"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1268d56234so320703266b.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 22:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783316234; cv=none;
        d=google.com; s=arc-20260327;
        b=h39S3xlzsR/FNY6Ud0wBx1ZI5dX2ZLw5fDwWC0ocAin9HY4pLdZvIlNaTbO32qUQ4c
         CseX5erO5OeyKYyQBly8gl4ffBERy2jQMYzTr4XVtiundbB5EPkm5gvx+PKjcXiihie7
         oWfD/a2KvCUy/A0SaIG2Ppp9TQ5HmNlXBaK61hY/uvCw6PXLd4AD5t0YrgXXI2dSPqtW
         5jQ1wRzWqWILPEr5R1o2eCdxEJrCohy8SDgmwAERw71RwX4cv1h5ep462vcDZmWn/AzV
         sLjuyZ28nbsVGnsnlqPW5ok3KIZ532XodX4yS0Mo3+xQi8jMddsNeNRNyiiBdgSbsUo5
         SLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h7ekLPgUPsB0w3gQ1kcqf+MPOC04carVdMq/iLQTPeE=;
        fh=rA+1ATJEcTE7u6n4TVtPpmUROzsQTjHyF39o7+1woz0=;
        b=WP3ZRV1RQlFdm/md4SLvFojZD4BPQ71O0JldaZTzcZ0LUbkAqAiMpjAcM9inDOg2AL
         89ilWD5dsLszAFMLx/loNpX2f+Nzh7mu1RJ40IRqkUSIbadJqTJjDN8zfqLst227aHq8
         4XfzLThMqlxYRR6XLzl4xPBJZ/JnCbcKqs2ddXB4myOevtRs2FIr+ApbjMO/aEKgY5MX
         ZwuJZuP3Jis1GHYpRROTfqqycYwPzwxXVpvmQ6fYX6P/di3Rm/c+7QA6KrAm7KRUiUdp
         NsUELKig3lVfiy7mEjDE0WYtp2/KwUdBUBTFvcuWdUpV24jjCsviMniu2HFggOPxkzya
         9kKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783316234; x=1783921034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ekLPgUPsB0w3gQ1kcqf+MPOC04carVdMq/iLQTPeE=;
        b=DZPQ2lJ4rocv64rmwsJWnedXHghVLuk1FcGtqN1VK2wi80ZSdaNJHWxaDufrVdp0AR
         Ho3NFuAU60lxOyUepUNhvZuder1L7SXTe9G3ZWN6KL8FXVRcYZYnAbGKsQj5BSCZ/NDa
         3Hc0dRN0yUu+XYTleFUE4FEuaB8NI7JevHkaWuMj6917ryaGTE5tabUdLyUML/LuDSnB
         8N9jg4iMNHsXg+/nWyGUkR9usL81GuqwTwkqbucFZQcgRdyYLhhRg8CutkWNpaeWeWMZ
         q54dO6zd6Kq1bDuTrMzzxtn2UI1lOB1sAQLTTmZ1LpIJSqUOEXv9WTALiJtfwovekbT8
         eSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783316234; x=1783921034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7ekLPgUPsB0w3gQ1kcqf+MPOC04carVdMq/iLQTPeE=;
        b=V7QHXxMHOJwWhupG3PKqhMiEn8nbFT18+nzbzC8Fl3YL7Qp5hthr2wsiVx5LQ5p1RC
         itsRN8XdC9EiIrJKNaARfHDca0PYGmSfiZlujkl8b/wFXZAs8u9njS4H7SeorW82SCe7
         BRSQuWHFdNeFGh/+Xf/FPCnlFPw0me04M5RBcJOHwogKdPtRNvVMHmLfmgxcM/EOTLK/
         tF81S4J5QxfNXNW429tYNX9BQBMCoFbapLlvIWZgRUdyOZYlngn4z2u5WOyxtO9yOtCs
         wrbX/IUlnpI52w80LQEIKIvk5POP9PEQUB4oMXCPUqR++ClEyYyLNYjHsVujtPmvkCMf
         zh3w==
X-Forwarded-Encrypted: i=1; AHgh+RoOqi2Dm4++PMbPDW2FmB89RTpLgz3HgpgSJGP0tXMKjIzKldhY+1q40aXiz6sGdnW6p7w8v/dhnKRNHjai@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxj18DvhVry+JkOmmszN6cvci8q2F1sk07b/p/diIqlk9Qv5Xd
	4N5FEIIk25l2Q/nqq8imFUJQulG0u9/sqSXtvkUSy5GtJrtoi7odzi8jTyLnBKt1DkFQ0LK0XRs
	a3VY595tJmzrJQZcW1ieqJf7XqM/rR4Q=
X-Gm-Gg: AfdE7cl0LyM7/t9RUEsqTFghe7uNgMwjvVPTwqJIKRi+esVZzl6abWzk2BF0INryJ/Y
	VvKVMiet7Tk+bOvC3Ixux1Ob3UY6rKOeJvszRBltGBKZgvPzoYqHdfF3bXcL1U4ZH2qIn3niyDO
	h7mz45zFVA70WLu+sXcoXuzLHEg6HRzS+X+gZAWxrmJEN6260Eqf82QaSkVl7EesNcjmGMbXHos
	sA2OaSHLEyVU+u/8qtWiC5e4l6t9lhCPMgiSkxoVlcfARu3oxW3dCrkGxLu8nEHCZJYDwVZ3Jsz
	wpZdiaPm+mQXyUyKFOtkR2M7Q546n4Fj9MEGhO5weYjW92yipzFHen43FTDfTrsyP5Na3ZpEE/+
	GOhcq5RSiJFuE/R4m7Iko4lHIZo0+efjWc76KT/HplvgndmjoqTfGF65MMw==
X-Received: by 2002:a17:907:86a4:b0:c12:1dd4:13ea with SMTP id
 a640c23a62f3a-c12e6b4b6c0mr263440566b.30.1783316234307; Sun, 05 Jul 2026
 22:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706000738.18478-1-nealpatalay0@gmail.com>
In-Reply-To: <20260706000738.18478-1-nealpatalay0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Jul 2026 08:36:38 +0300
X-Gm-Features: AVVi8Ccs0fENx974odzMq6Kfd8aznTpy2TJ9OPLzskxRndR1IFnawe3x5Y4OW2s
Message-ID: <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 3:10=E2=80=AFAM Neal Patalay <nealpatalay0@gmail.com=
> wrote:
>
> The original implementation of ia_css_debug_pipe_graph_dump_stage()
> includes an off-by-one error where the original strscpy() size dropped
> characters immediately before newlines. It also allocates over 600
> bytes across multiple buffers on the stack. Address these shortcomings
> and reduce stack usage with a single 256 byte buffer via a new helper
> function, ia_css_debug_build_info().

Please, slow down! No need to send a new version immediately after
replying to the previous one without settling down all aspects of the
change.

This version is no go, sorry.

...

> +static void ia_css_debug_build_info(char *info, size_t info_size,
> +                                   int *offset,
> +                                   const char *flag_str, size_t flag_str=
_size,
> +                                   int *line_len,
> +                                   int *num_lines)
> +{
> +       int len =3D *line_len;
> +       int off =3D *offset;
> +       int lines =3D *num_lines;
> +       int len_written;
> +
> +       if (lines > 3)
> +               return;
> +
> +       /*
> +        * If new line length exceeds max line length,
> +        * replace the last ',' with a "\\n".
> +        */
> +       if (len > 0 && off > 0 && info_size - off >=3D 2 &&
> +           len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> +               if (lines >=3D 3) {
> +                       *num_lines =3D lines + 1;
> +                       return;
> +               }
> +               info[off - 1] =3D '\\';
> +               info[off] =3D 'n';
> +               off +=3D 1;
> +               len =3D 0;
> +               lines +=3D 1;
> +       }
> +
> +       len_written =3D scnprintf(info + off, info_size - off, "%s,", fla=
g_str);
> +       *offset =3D off + len_written;
> +       *line_len =3D len + len_written;
> +       *num_lines =3D lines;
> +}

This makes helper too ugly and unreadable. Again, study the case
first, when this can be true. Do we really need to cut it? This whole
thing AFAICS depends on the dtrace facility in the driver. Is that
HW-related? Is it pure SW? You need to perform some homework.

>                 dtrace_dot("node [shape =3D circle, fixedsize=3Dtrue, wid=
th=3D2.5, label=3D\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
>                            bin_type, blob_name, enable_info, blob_name, i=
d);

Yes, I can understand the frustration, but this driver is not an easy
low-hanging fruit even for (really useful) cleanups like this.


--=20
With Best Regards,
Andy Shevchenko
