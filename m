Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790C72
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 20:14:58 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id v46so4163604ybi.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JW/rwU7b6kzp3YJbh941iVFxl/dOjxShWSeuq57arn0=;
        b=ejuCBxTHWoDQk2rpo3CBOdisKE1Idn1+7jR7tmspL4j95vYcWJKKFbcfRnk2ovHRKA
         HKkN9ZlHTqU3TWNnvq+NoX4qQq5Xct/bm2s6VZluUEnzpXuSddd2jEDmB7+w6x0x4Psu
         MdhYeED/cqsTIeNpHVEsSENL6O5N16imzeylZp7NFGjFJO4S2nVScbECYhBuS6g8+6Jt
         /wjXgNHDvrMu6HXfNZhhWMHst9hTvn1KqJXVWZEPafheEXztF3V4L43TrPahw97T/O0D
         2sO8vpMKo4e0y+Y0YGaR8/Qzm5kKgMQRChvpuurwT8wgNBam0ImxXlQh1u1YnekkY3sH
         Psvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JW/rwU7b6kzp3YJbh941iVFxl/dOjxShWSeuq57arn0=;
        b=cS17CM9LvG+d9f6CX8P+ToKbEceQppjUPfzkrhy2tTxzkWUhA2A2eSQhIg0CgautVR
         f9O44lKBATe+U7P6f+SNS05LqdBaojeHlOLdGuaRl1FKbLXxp136/L5bqg2xHByIwoDv
         gqtmOxPyne+qdc3LkMzmRl+NdYZgW6uBc0yFsueLqaInpLNhLAPklWNbxtLnx+NLkAwn
         9joT9HVCr2ofh+yA6AXZ3xbtdgMn0QjKFRIdouKwtdv6YAu1OZopNOb5e3S59fFbBIdq
         IVBsOpRpj4Lhjto1lcPNUoJwlk1gTeiRzKnvA6t8GgfIiNBvt3Aj0S7qqbI8QGESOtL+
         32GA==
X-Gm-Message-State: AOAM531nMVm+CNzuvJ5g8Fde9Cdy6plxxAclContyvqbJRuNHScn+iw1
	RJFWxBPo84PBOCpr8KsVJymHBfJmwlskLBCHyLWogw==
X-Google-Smtp-Source: ABdhPJz77EfUvYsyDTWGOFgpEtmRaxbSsmh1wSynvlFpZ5iu4xrBUExPDobX8h47Xs9+dj6RzdBF4mHzsx2bI9LTF8s=
X-Received: by 2002:a25:2e49:: with SMTP id b9mr9041411ybn.250.1627071297518;
 Fri, 23 Jul 2021 13:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723200514.10139-1-fmdefrancesco@gmail.com>
In-Reply-To: <20210723200514.10139-1-fmdefrancesco@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 23 Jul 2021 13:14:46 -0700
Message-ID: <CAJuCfpF37KXw2SG37_XoRyhGWc+uueU0NaxcEfU1=FH-rRm+bQ@mail.gmail.com>
Subject: Re: [PATCH] staging: android: Remove set but unused variable in ashmem.c
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <christian@brauner.io>, 
	Hridya Valsaraju <hridya@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 1:05 PM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> Remove variable 'inode' tnat is set but unused. Issue detected
> by building with warning option -Wunused-but-set-variable.
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/android/ashmem.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index ddbde3f8430e..606e988d3f63 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -406,7 +406,6 @@ static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>         if (!asma->file) {
>                 char *name = ASHMEM_NAME_DEF;
>                 struct file *vmfile;
> -               struct inode *inode;
>
>                 if (asma->name[ASHMEM_NAME_PREFIX_LEN] != '\0')
>                         name = asma->name;
> @@ -418,7 +417,6 @@ static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>                         goto out;
>                 }
>                 vmfile->f_mode |= FMODE_LSEEK;
> -               inode = file_inode(vmfile);
>                 lockdep_set_class(&inode->i_rwsem, &backing_shmem_inode_class);

How about its usage in the above lockdep_set_class(&inode->i_rwsem,
...) call? I'm guessing you are building with CONFIG_LOCKDEP=n.
Have you tried adding __maybe_unused in inode variable definition to
get rid of the warning?


>                 asma->file = vmfile;
>                 /*
> --
> 2.32.0
>
