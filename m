Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF70B168
	for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 07:49:38 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id hb6so7051449ejc.8
        for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKOb2jrXO2dSSh4hiHOP+OblsXWy/q1c93necTd5DSM=;
        b=TCvpTa0V088KqkPjVtGqxQHYT4LYK+5E0jli9OhgQj6ep+Ucitvn8lhjnCbyDLYe8f
         5YPpZYYIoWDWtpCitEYGFfFsesUJPCV59jVXRe/aTwrQIaa5Xe7HTxDbdu9JImVJNNHn
         /Vy4uBE/LSkpdATNRhu07b7tUrmdQflaU00QEgQ6c8PePwUr9Uc/VEXFq+eK1/biQSEK
         JVcN7ld9vaKL3b1HUzdrIrVr5NuGwrV1UycWazcrzVRpCFmnZKv+IBrKJvCSx9aaImy7
         NOjn4nwv3Svfm3keJbeinOf1k3vzvHkKUxuvRqK6chEEEHFFAjGTocjGiT2PdSyOL8Sp
         YnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKOb2jrXO2dSSh4hiHOP+OblsXWy/q1c93necTd5DSM=;
        b=FGlhNZruHFM9bbhVdm9tKwEbP2AYL0RziaQJ8wl7FCEHn8FABzUD0OZRzaJ+Ln91vR
         g5nmeJMorQJbiDwoO/UFKfTgi76fbq+slMc20m9g7JbjAOWk1UOvJEuJqs2TxPGpauT4
         3o6Tz6BU5mOZ22c4A0Y23ckKCMLKt21rzkkg6CVglwrBsIsg9QwUD1GMSOabjGBLLOpC
         OY6RiLwnrPdNcS0tmqPqa96IJDGkr0IbszIXjF0R9QzyShAtIJOa4HEVEqYEuD/aA8rB
         h1P+Ug0Eh8Qqn3jkrcr1QczVNK5AlnJc3832N2tSnWNrfeierOPyoLEIqk090AqSn6aa
         jfyQ==
X-Gm-Message-State: AOAM533OrfxnZoVLr7p6g4iB+fybM4iEqphrhtEKRAnBzjnowv1Wehpj
	2XVWc9cg8LD4GfxRkTnBWU0=
X-Google-Smtp-Source: ABdhPJyq4ltFWGCgeJEh3DTUfadFxw+fCk3pgDMUt2Ts/lEdMECVgyGUbwBoX/Ndjhx9+BDELZ2SXQ==
X-Received: by 2002:a17:906:d977:: with SMTP id rp23mr8209607ejb.512.1627112977216;
        Sat, 24 Jul 2021 00:49:37 -0700 (PDT)
Received: from localhost.localdomain (host-79-26-32-124.retail.telecomitalia.it. [79.26.32.124])
        by smtp.gmail.com with ESMTPSA id n13sm11237985eda.36.2021.07.24.00.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 00:49:36 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <christian@brauner.io>, Hridya Valsaraju <hridya@google.com>, LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: android: Remove set but unused variable in ashmem.c
Date: Sat, 24 Jul 2021 09:49:35 +0200
Message-ID: <13453441.4PhDYAFLLM@localhost.localdomain>
In-Reply-To: <CAJuCfpF37KXw2SG37_XoRyhGWc+uueU0NaxcEfU1=FH-rRm+bQ@mail.gmail.com>
References: <20210723200514.10139-1-fmdefrancesco@gmail.com> <CAJuCfpF37KXw2SG37_XoRyhGWc+uueU0NaxcEfU1=FH-rRm+bQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Friday, July 23, 2021 10:14:46 PM CEST Suren Baghdasaryan wrote:
> On Fri, Jul 23, 2021 at 1:05 PM Fabio M. De Francesco
> 
> <fmdefrancesco@gmail.com> wrote:
> > Remove variable 'inode' tnat is set but unused. Issue detected
> > by building with warning option -Wunused-but-set-variable.
> > 
> > [...]
> > 
> > -               inode = file_inode(vmfile);
> > 
> >                 lockdep_set_class(&inode->i_rwsem, 
&backing_shmem_inode_class);
> 
> How about its usage in the above lockdep_set_class(&inode->i_rwsem,
> ...) call? 

I'm sorry. I didn't notice that 'inode' is used soon after assignment, just in 
the line that follows it. I was also too confident that rebuilding the driver 
would have triggered an error if it is used somewhere else. I was obviously 
wrong.

Furthermore, I usually automatically search with grep or other tools for other 
occurrences of a symbol in the function and the file, but this time I must 
have forgotten to do that.

> I'm guessing you are building with CONFIG_LOCKDEP=n.

Actually my .config sets CONFIG_LOCKDEP_SUPPORT=y. Did you refer to this? 
There is no CONFIG_LOCKDEP in the file.
 
I've just run "make clean && make C=2 -j8 drivers/staging/android/ W=1" one 
more time and it still builds.  How is it possible that the code builds 
correctly with my configuration? 

This is the output (the last two lines) of 'make':

CC      drivers/staging/android/ashmem.o
AR      drivers/staging/android/built-in.

There are no errors or warnings, even with that "lockdep_set_class(&inode-
>i_rwsem, &backing_shmem_inode_class);" left as-is after 'inode' removal. 

I really can't understand what I'm missing.

> Have you tried adding __maybe_unused in inode variable definition to
> get rid of the warning?
> 
Actually, I didn't know that directive that you mention. I'll read the 
documentation and, if and where suited, I'll use it.

Thanks,

Fabio
>
> > [...]
> > --
> > 2.32.0




