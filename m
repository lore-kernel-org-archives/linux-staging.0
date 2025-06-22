Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA1813AA27;
	Sun, 22 Jun 2025 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750625560; cv=none; b=bU6DOaKPIDfRTQgn8VAYKj8cm+G38iYixNlbRTKBMaiD+dxXYNYSZGtdYpPEhzAYeLAaojXbqgM85P3YipsuVbHCTan1LitC2vD2QwcJFiL4FrfoYStnQGU+sLOo3Osn2jVJ/XQTATNcvIpNDAqR0JYAHUL5ZiMH9w2R3MHeLLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750625560; c=relaxed/simple;
	bh=R2UBeNBYcULuRw2pi59GwqeuYVxQopy59/u5SIVP69Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKrI+1jIUAHKWAgQt4A0Ychs5/oHDCQOGcOKiRNNFHDbl/VW24c7bpvRqnwWmNvbF+BE394pFmXtI4m1andfNlfY7Q74v3WjkX5BPgnznQ1Mdz+b1sRL5rg8r7iTzc6RVzEzGGzx3KB0DCWpLPdyh3qYdE2odhjh4AmwsU77NeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCo7Vo7W; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCo7Vo7W"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade4679fba7so682908866b.2;
        Sun, 22 Jun 2025 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750625557; x=1751230357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAf+0jG0AUw6LWitXHvxoj49OUYpodhaHnqwUI4Oedg=;
        b=fCo7Vo7WOometsKUhbWDYjXKJkJBfarLS1g8iPI7lmyYcxfHgNFsboGfU6L0+9o7VK
         mOnrjY3YxvuzDyFMs1CPYYPfCoqaJ05GcK7D23H96L816lole8bJdmfinXNhzNGCyGCb
         0z/B2V4wvqItUWlVD09ZiRhax6CmWlwgLjlPPIFJKZwn5sNULS6wfzK44nqqQKGmRRsl
         qdIqkZDsqvsJE3cPqNBohm0Hxks60MRGHjbWa0zobdHwHAP7yCii39VU9jqx77DYvnyw
         Ed+cYvAeHWi3Jas8cCMgJY7lb0a1tKkn3+ytOzoVLOs4GletLzD8V0ySy5vOfsmt6Dlm
         J0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750625557; x=1751230357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAf+0jG0AUw6LWitXHvxoj49OUYpodhaHnqwUI4Oedg=;
        b=aTgmHQyVScrGt6vS+NLELxOxSxlBteh43YQHX2vaOG5KDfTRqWAeapHjbh6aR5S9hA
         +tzQR4+J9R7fucO6Xb0XgkJVkksSeQZbdKVZGLgdPNg8EI709isrsCn3ygjngaARFNsR
         0xFl/BdbxxJc27jFMdbgWus/Ha6KnaqkyyNF8dUEjgcLiDni88kAA+8WxxBSzBrOA+Uh
         IHA7hSF/EZaYGHo3hN6eLWS3V74jO4K/br0QEMKK//COgVllynrKAzbWH5XYRskUQHg/
         iIBZmaVLQdEHyWqmCaN3MmN+uTIW3Ob4t8iRWXdqYnkMGIcfAByIm/saxvv8qbFO7Wzy
         9I4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKoK35u+7NKqFfJggiOG5B6ZXxZvqWiNJPZT9YuaxGH8QjnwhkoLci/NasNfwFMR0hgXOcIbqKlvxHVncJuA==@lists.linux.dev, AJvYcCXwyTFCaXKKpmK0PNwze3DSEnZLk/8l7ZFAQT5f3J3uDD9FBOOmK62r4ELE96oelzwpuzz/L+ifgym+gpcKaqfHqtzQAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzF7wgD0SFJqCfhK0xrLC0LJxjvQT+XIyMP9ZnDfGaMNUNZQgap
	KfUnTZVxfaPHB2FXCcAqniPxQSDh/w5SVtsw2nNq5TnQVk8/reK1zD6j4hrVWgZhqtXWGWmkgYK
	mAE4Vw9sKAs7Utzv+lYThqvjyQ+hV7vs=
X-Gm-Gg: ASbGnctC/ChFP308Uwwj2ec/CQdrOuJjtqfAQ6tb08erz/KIrNUKjFZ240XpRtHhQx3
	7VJg82tTGKKEFZ2cV5Oi50B7ace2Gnd4pH2YqwJC2XHdXG6Nr20wWC0D5Y1WfiF765s5Jz/B29C
	yuE5S4mbnGEAT49zFPY+moFwSeWqvNXQmf4RJNL9/JTzQ=
X-Google-Smtp-Source: AGHT+IGE0Nm84BxJVBfgJK7xoWrkgP+TXpOyV781uNHUxD8p6X5GCK+FLDCNi58BLWcAV/v5kSnIkOElD9c6ZKvhD5M=
X-Received: by 2002:a17:907:7e8d:b0:add:ede0:b9d4 with SMTP id
 a640c23a62f3a-ae057413febmr908334866b.0.1750625557391; Sun, 22 Jun 2025
 13:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
 <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
 <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com> <CAGn2d8M9_NG5f1gpksdrMkUs_0Q2LBS=qAZeAciF9-j38Nq6Nw@mail.gmail.com>
In-Reply-To: <CAGn2d8M9_NG5f1gpksdrMkUs_0Q2LBS=qAZeAciF9-j38Nq6Nw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:52:01 +0300
X-Gm-Features: AX0GCFu3kMpWblYdOlAmUTNgRy6pJxasbC-PUTWd-9zbTQa3PPPKPHbfsp7-CUA
Message-ID: <CAHp75VeTbMORBBd0N65w3m4nZ8s6GUKaK8u40P_+Ki8yPPyCxA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:42=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
> On Sun, Jun 22, 2025 at 23:39 Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
>> On Sun, Jun 22, 2025 at 11:37=E2=80=AFPM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>> > On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
>> > <abdelrahmanfekry375@gmail.com> wrote:

...

>> > > +       /* Changing to sysfs_emit changes the behaviour if failed*/
>> >
>> > This comment, besides missing the space, is useless here. You need to
>> > use the comment block for the proposed change.
>>
>> Also the text of the comment is a noise. You need to explain better
>> what's going on here.
>
> Noted , so the comment is enough if well written or i should do something=
 else?

First of all, it's a bare minimum, which means that you should go
deeper into the code to understand the issue to begin with. Second,
the comment should be put in the proper place. In the code it's
useless as it describes something that is absent in the code for odd
reasons. Talk to your mentors and ask them for help because explaining
more is basically doing your job for you. And IIUC the purpose of
mentoring is to make sure you learn something and have acknowledged
this in practice.

--=20
With Best Regards,
Andy Shevchenko
