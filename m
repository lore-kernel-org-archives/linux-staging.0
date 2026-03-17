Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD0131E83D
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 04:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773722013; cv=pass; b=jVqUhgwgnWkS19D12agS1YnAms+w7ktfa87rO8Wy55lBc0RtCP72tKft1i4wA9sRzz6MJWrMzXQu/uZMK0jvYGLEDs9xKFlZowA3gvstFGkTSa16S7Fp406J31HE4kXI9Ica0jxScZufW/ODy4xJMgbSWoXHDQf7epOnozcBQnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773722013; c=relaxed/simple;
	bh=tiOslg2ijiNLvUEule9D7TB3nKCRsqgcCv7YiVviGdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVspszNDwkJFW9tg2cGBeKMaUVCnte6lCQuQRHh3JUULPeENzsSqF5thg2waSUlcd6+1G8opp5a2xLrpOGgC3pEGgE8Om1ydNKqokLoPXdtQWrkEDWf0mZioJzz5D4VOP4fkHxonCZPnF53Zp3NzpG0dlqiatJsGJXAlieISmbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AciGqrw5; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AciGqrw5"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-509062d829dso230891cf.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 21:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773722010; cv=none;
        d=google.com; s=arc-20240605;
        b=KlvvYAGxy/cNf2FUj9aQ9+0se00IBXhrMEonIP7atzCfVSoBaBPS+qPF2k26qlxP84
         lRXsL82jUD3xDApNJU24dbq2qmOwiITQnfssIbFiFQgKNIEr+3D6pBeRzBChU4Z/ShF0
         +gK5llXLwMbKJS0HUmVRdQwmjkZrl+4HaykCTSxTgusyy1SbiZWSWZeaQbQF9cnYVpOv
         pAmP3mwB3hFaA83zDZNvJiBtYs7WvTlwsCaJ9WHGMv6h1ENvee559waeXAKdMQTa0Vx8
         Slxham7aQ55rdEpo7M1h27N48JEN9dMnX2Lm991SrNnRqy9O8sqOKuA/3u92JvNvhBoF
         +/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        fh=BZHgc1a24Koz0swyjUE/BECvdGQPeIsi1ki/fvzg7CU=;
        b=b7cPiuZEXnA0VmI/ac27WfYFIJpSoSvQ4Aj/Gv0k8kxyOuUyZay/g92MtqSy5KNjTU
         jgEhqVxmUAAgoMH7b/VcA8uq9bSf38OL9xGfLjcv3TXCNwBo9sA9R75xBpMO7TjJodph
         37EYKkC5BZNFWMnKyXNqkXqUlrpuVK5mQor7ZiXxTPaxQu7jTY10Nclc2gSLSwILuq4K
         04WTainhpLhYEF65F3oWLMhWIZG+lRUbx7FMU7A9OGB9Zf3/RsyPf0IZD6NxVph95OWA
         5sDgtrq4wuSqQoAkkse25V7lbxnlElwrYJeL/Helb5nH99GLvkMm7ZdbdscX+OqQj2Lf
         yKiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773722010; x=1774326810; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        b=AciGqrw5u1qilxjhLeD1llLP6t9nLt2Ke+Tj423Taa1hTOTYD3i4kGHdzMTJV/aUVN
         35aEEbX0oGK019EZEtIGN3sXuXOACZEPzPnPJot4Mw7pU4ROcYeGa8VGHyu+fxVTNKqH
         92lAkLz9+wnwzxIog32N5l8fOj+mxnM6S1oczxpfHo5R2O+HCTwbueZY/cx5GJYyMUbf
         J6+4H4mXtSAgAA3AMz7T9WxRODN1k4B93T0hpsuWOP5CYnY+AamNmHDWCJNQRUt2cXVT
         poYceM5e8QAUaZxufHCjLEqKLz346t1GFxC+o6yhv0HXBxPnlRy+YkGfq7mYsvFEdNnK
         Z4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773722010; x=1774326810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        b=l+DuFRZ8Frhazq0sodVTxFaJOmK99qeD+8pf54if0P2i1gVWhfqrIeWPjc04DEOy8q
         QyomoL6yvTZBvRuZcILuvFDigdF4RzMzDW8QtFTHN/bfxvBwtK0vcftSJMEz7L4/M159
         1MImM8wjp3mD8lNY1hToX4j4JKu30Bcelq+sLgShuraDOvrnIk1E3cTw0WQ8a4I13Uw6
         K/42w6ErZzAFxocztGBNbU5p40EDclcqN5k5G2j9Xwj8WNARfxgzJ7IewLtB/j5hQ01l
         mhH5yt30nYUFMB+V1D3pbxTLiPILfrlOhwl4V4Jg3z422bIi2/KdPTrBmsPqHk+gRLol
         ll5w==
X-Forwarded-Encrypted: i=1; AJvYcCW8f+qx/CQILnsruUmI18YUR6uWnOTJcWw0l+46h+GDNYaLsd91VbncYpkRDQbHzg8G/luEsm5O+G/jhg4/@lists.linux.dev
X-Gm-Message-State: AOJu0YxjnIME3bQcNKmi4wARNCwbV4noxvpyN9Grv88mA4UajEoSEHw+
	6mdB2ECXE6PVt+BuTF9iALJEBKfULyMuf21IX8J8/r+aHOktI5rv+lvB80a3HRTy53jJbAT0LTg
	D8bzd6NyDY+WiybJZAi4BAxBptn5CmEUdcYHT+eK+
X-Gm-Gg: ATEYQzzOMz+OC+MH/5WOgsEdOjvKvTey1IgGzPwX2vFkjf3qGCgjqE8nQlh8h5dgJRA
	L8JxtiuPxaxzsC9pn0lXkFxgf/zym209XdXn6BcVMSdiciNZUYJwOghm9tYTKTOTsouNUOpI54I
	8EzKTKEtnBkh74IQN4v1QvH4DiqSUYNgoasDGpdrXs8QYoXu4elyQlrVOCUsyoYnGP5q12jh9rU
	AJWYYKKihdsRU5dqEUpiUJ9K51gQ22m2vHa7nDWk7wR41C1XsrZV7j7kmAkktUs2xFcbORft/zB
	PkYssA==
X-Received: by 2002:ac8:5844:0:b0:509:cd7:aa18 with SMTP id
 d75a77b69052e-50998d3b42cmr9273521cf.10.1773722010151; Mon, 16 Mar 2026
 21:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
In-Reply-To: <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:33:19 -0700
X-Gm-Features: AaiRm50Qx7Mej7rYBXyqChXz1IjfagNMkbSFlVwOhEN7Z-gN2V6TQSUIzNbqMWk
Message-ID: <CAJuCfpHBfD0zO60tPCEeNXSRJSoDi5Azs0LzutpYFEBW2z6JJw@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] hpet: replace deprecated mmap hook with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
>
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  drivers/char/hpet.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
> index 60dd09a56f50..8f128cc40147 100644
> --- a/drivers/char/hpet.c
> +++ b/drivers/char/hpet.c
> @@ -354,8 +354,9 @@ static __init int hpet_mmap_enable(char *str)
>  }
>  __setup("hpet_mmap=3D", hpet_mmap_enable);
>
> -static int hpet_mmap(struct file *file, struct vm_area_struct *vma)
> +static int hpet_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         struct hpet_dev *devp;
>         unsigned long addr;
>
> @@ -368,11 +369,12 @@ static int hpet_mmap(struct file *file, struct vm_a=
rea_struct *vma)
>         if (addr & (PAGE_SIZE - 1))
>                 return -ENOSYS;
>
> -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> -       return vm_iomap_memory(vma, addr, PAGE_SIZE);
> +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> +       mmap_action_simple_ioremap(desc, addr, PAGE_SIZE);
> +       return 0;
>  }
>  #else
> -static int hpet_mmap(struct file *file, struct vm_area_struct *vma)
> +static int hpet_mmap_prepare(struct vm_area_desc *desc)
>  {
>         return -ENOSYS;
>  }
> @@ -710,7 +712,7 @@ static const struct file_operations hpet_fops =3D {
>         .open =3D hpet_open,
>         .release =3D hpet_release,
>         .fasync =3D hpet_fasync,
> -       .mmap =3D hpet_mmap,
> +       .mmap_prepare =3D hpet_mmap_prepare,
>  };
>
>  static int hpet_is_known(struct hpet_data *hdp)
> --
> 2.53.0
>
