Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBA670
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 16:40:40 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ba2so41528367edb.2
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zRPRNwiv+Qa7LFNhBGliyXNB+ILCSmwq5eW3TGTSNt4=;
        b=Ir8CB+iHpFkcvuC0iayj4871f+XLzvhX6J/Kt97Mt3KEOnhKF2FuoPmCgCXiyFHVZb
         a3vZ1bFlfJqYsgReA//8fKfvmfAw9UQ9L3/FROogtXl5Y+0Yg5/PdSLnMyCqRq9wloMj
         c8xEpAkHe1qMxWqPIzfxymaDwcEWycewdrirLQW5fQ1KX1FzjvOTpfvXdrZ1MU1hqc0c
         rMXOCxvDfsS2Hl/dVNhr7LxGEB6v70IW3ddxeuBeK6C1UCVhQEqVklTR+kXXr/isMR3L
         m8GVKj/SMqD9dU+fdcwhkuCbMXWfF9S5kS3y5eJj6PZqeVG10KUByzLXnFKoSlvftplU
         Q81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zRPRNwiv+Qa7LFNhBGliyXNB+ILCSmwq5eW3TGTSNt4=;
        b=VZCB00v/gvzbgr9oXyPsu1Nxh1ukxQ5YQA4n20j9A0NvCz0hUrcL6rKKZtFOq/O/ha
         gebKBTOf/CXhGxgTt14hqhmLQc3tLn3xi0EzAjgnScCXeFKdybG9FaX5bX8X+78rReWT
         X3WZEzHpIBdOZ8ttZawn78cdiQP4sKeZHUiKdNhW36YciAGArxxyktSfZbVRJmRrUFnx
         zYf4qZ9B7kKkm8DLLLFLaFLCJ+TNESyQoZgy3gG1dA7NV3Ap9jhsCRZwwRGwKdZLJO06
         ofgRqfhQkW5aqLmWbq0VH/HWd5HwtqKL3gecKqGskbTUAXfrponPGdwT+G6kyArju8mZ
         GL6A==
X-Gm-Message-State: AOAM5311cN3NcYXQ3NGQa56K5fzIwW1VSOo7edko3JEfYTgZ46mujmlq
	+Iy4HZ7oSPTd6lzy3ytI7nRWJMv7Y8JahEJDriEFa+RkmT0fdg==
X-Google-Smtp-Source: ABdhPJxrUobJ0ZeGHRd9i3Birfg+SOyHtdoiO8WUhzM4VEBRpOW85ihfvEdSnxiIhRdS435p3BLfS1Ka3cwS4fldJ4k=
X-Received: by 2002:aa7:c7cd:: with SMTP id o13mr13362281eds.269.1623602438426;
 Sun, 13 Jun 2021 09:40:38 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210613122858.1433252-1-fbihjmeric@gmail.com> <YMX7SRSPgvMA/Pw1@kroah.com>
In-Reply-To: <YMX7SRSPgvMA/Pw1@kroah.com>
From: Jhih Ming Huang <fbihjmeric@gmail.com>
Date: Mon, 14 Jun 2021 00:40:27 +0800
Message-ID: <CAKgboZ8QUQpiinL0xCxUmcp6nEVU20jXkDXbrK_QisUMiLEo1A@mail.gmail.com>
Subject: Re: [PATCH v2] rtw_security: fix cast to restricted __le32
To: Greg KH <gregkh@linuxfoundation.org>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, maqianga@uniontech.com, 
	marcocesati@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 13, 2021 at 8:34 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jun 13, 2021 at 08:28:58PM +0800, Jhih-Ming Huang wrote:
> > This patch fixes the sparse warning of fix cast to restricted __le32.
> >
> > Last month, there was a change for replacing private CRC-32 routines with
> > in-kernel ones.
> > In that patch, we replaced getcrc32 with crc32_le in calling le32_to_cpu.
> > le32_to_cpu accepts __le32 type as arg, but crc32_le returns unsigned int.
> > That how it introduced the sparse warning.
>
> As crc32_le returns a u32 which is in native-endian format, how can you
> cast it to le32?  Why do you cast it to le32?  Isn't that going to be
> incorrect for big endian systems?
>
> thanks,
>
> greg k-h

Thanks for the fast reply.
Yes, you are right. I did not notice that le32_to_cpu already handles
both of the cases.

So it seems the warning from sparse is false positives, am I right?

thanks

--jmhuang
