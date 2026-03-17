Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F932E121
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 04:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721850; cv=pass; b=mrP7f8As/z9VBtv4XInLSC8yz3FG05tDCSA0O6fzLzV1khWt1htbBbYRA2rdwRd1eVVlXesv7CzTgM6nQM794RHGO8wek40xClrOkstZlMXUTUepcfthxgBm6JBDYHTSu42YUXGjvcrbaXvDf5n7Mi4sTTLgOTX+EUQnwWf15Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721850; c=relaxed/simple;
	bh=+qEdsUsTBQ5PdU99AN+GVBCS7vF9AHbvt2iuwIsGSck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ai96EJPOmM4KMKahOZ0eKCVSG69BznNVaACGqozJr3JphXKepnkc9Q7SpjgkdHEm+Yz3SZwJwmAMqMxk5bwq9G6oh/vwNFCCcPzcQFv9U3h1yIWU0/zeLzG9wvhr3heAk1EAmmWZBtOeJUcbog/bthjcNhFMKbGkCr/HtCCvBuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nu8fKPXO; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nu8fKPXO"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50906a98ffeso374341cf.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 21:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773721848; cv=none;
        d=google.com; s=arc-20240605;
        b=QPfkkAf1POJJBpavra/qCvaVVX3Wlxj3xBhzng640z5bV4bBG5XsHGmCNKIV7xUMK9
         yZ5FyQSV2b/JPDl5fmcXkvFMBcNAQfqN9pUOqme7Ox+2krTezynrLf2euU+3lQZzbgVx
         DRRUDTUFz1SQ9yTT7taeRsqtpkZUMm4g4VTnBrc5gWPbkYBnkxiUNCLBmY40zTRkgClg
         V9x/Rngc54e3WCaoppsM+DPoVTRTm/uBYu22ZvdZLemAXkjUkNHxYdNN+YBNw3glucm/
         NN+CA58RNiJEEDvm+Frl+3xwz0ItLbqP+TVuzO9EnsP7i3nB69W7K7di7rAxCFmPdFUJ
         JYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        fh=5v5ywOdgqEMH1Nyr4g4r/bOb2DIv5h16oeUfpoUFmSA=;
        b=dF3elA57124napisCfo1yTMUh+sRwTCx+JwHAvUwCKnPG5sJBokKPcJrsRXZiX5WRJ
         aa5PQ/akBTyzumEFFIc0mj5kVmPL3sHtxE5Qc8U5EzuwgfTMVQtPPVLTc9ARAwIGtn5Q
         tpPCC5QXq/xCRWukTJn2iVv3CagXKMYxPGmAnVJjnr/4cWzpVAd/uIKhk6/x+gui9h7u
         Artz5D5NQUOiEmdj92X5N8eHoegr6esiSSI8uMto6Dm5v8NdBXdyA0dLaa9qgTjSv+NH
         O44Ud9pIoVUT2VaJeM2U8Nb04CaLvvoMpMrdTF0kqkgojEbedVbTlM/fpJDEQklco7fv
         d8FQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773721848; x=1774326648; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        b=Nu8fKPXOG6+wx/Lr2cZcKpwPz0siHUUE0taInoRKKw6I7ZtoHjDW4Chsbo15ymrIz/
         4jSvMFv8veBLBsYsgK/QApCLkJLd/MXrJTAqX6++PBvru+KxrKpNmnk7ONGtZDvdcvMt
         y44nJPJFUBLjvtdQALdTrL0geJXIUB/c5uP54aoTyA5Xt4MmELStdSCTT0ls97kh+/mt
         Y7FZ3Vh7dAj0n9Y+eSCJbL500PThVb3yuwyW52T1jXAoBo7CkfkDEzgKpTqA5OJtRvu+
         cjqkgLM5vDjMgFzl0A4+UAAMVMF/OVEuGSIlRxkleOMj4tyyiZ+XBZnpCrcfw7GftGbH
         ki2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773721848; x=1774326648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        b=VTi7HNoWbmuVpDOItPIlEEeB/hfs66v39YbhGb2Mz74cIRydtka9h/4Dvj+gxVLqJp
         8c+AKiN6iDV38WJxJMqHhNStaWL8rs/yAsxGiAyuhwGEEcwSP7fB9p7Y0kuM7XJ6nE1i
         Ki7LCtQhqpVVDJRRyEEIcO9IDDS44uIhI8P/UTU0zaI0S8lmziNwO2uyY0fxmAIkK8oY
         fT4/sw9NotwN2WzdsjRJatP6zFL5hZNFfQpAH4BK7N3Esewt54tOJX++/or0C4AvOwp5
         tkG6GCfGIhbNhH2ToXwCXPw4JOK0HXddjnEaKTf+K6Y2WTKj82nZpZmHS3xgShz2ZvSP
         LXMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL8ZCrHasRsNzB4ZJY7x7Fv4XfDbIa5nm4lfB22QtY4II+YmJVw4l2+0NN3mS/uLfs3dRs6lLHc4ntvEPt@lists.linux.dev
X-Gm-Message-State: AOJu0YyxW2hEY3G/U+Xta44pxoP6UWYfx3vqbT3xIQWxHpPI3Hf1Bjnf
	pN6d7wnuVO1n8PVQnX14ACv1VCKVi8Jgg0hb835RkJsJ99MLqNqKP2rZRmb0+ZZzM+R00cQ0hrO
	FuSL/D58l8dkV9DhycMq+uhES5Ot7CPzW6apOSDvF
X-Gm-Gg: ATEYQzxS7lvyD5nEvFkhKU0Wxpe46vCztbTLWUFQwygfuLzBQsue0X1PJLk3ai7YXf0
	RToWkWmLzgRuXyignmZQMM8g8dOCRHnBvHH1Wjxlfdaou7qM0qNoI8GA2vPWCyT5db/Fpr2aYJ5
	8WfLgSzORa1MCQzJ+hT1krvVAxSmV+Qvn++rV0NN2lnqLw65najJeUT5jt7X+GH77Zq9iPfMsF0
	eAtJjjWcdvPHnfy3X9c9hEL0mbgTMgj+VSULu0ys+u5xqYv44AwkfuBliWMfzMfKFPvDX+X6tpW
	jeOnag==
X-Received: by 2002:a05:622a:1b92:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50998c190femr8741161cf.2.1773721847648; Mon, 16 Mar 2026
 21:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
In-Reply-To: <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:30:36 -0700
X-Gm-Features: AaiRm50ZCLTl3QDNivnPnY48qRQMsgXcmE9SOEgt_D7vDyjlZ8af9f8bQZf6tcw
Message-ID: <CAJuCfpFdKjix2fEdZ7iSrd_nk4-5e7EUNAoCEgUc5snKzq-3Cg@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] misc: open-dice: replace deprecated mmap hook
 with mmap_prepare
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

On Mon, Mar 16, 2026 at 2:13=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
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
>  drivers/misc/open-dice.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
> index 24c29e0f00ef..45060fb4ea27 100644
> --- a/drivers/misc/open-dice.c
> +++ b/drivers/misc/open-dice.c
> @@ -86,29 +86,32 @@ static ssize_t open_dice_write(struct file *filp, con=
st char __user *ptr,
>  /*
>   * Creates a mapping of the reserved memory region in user address space=
.
>   */
> -static int open_dice_mmap(struct file *filp, struct vm_area_struct *vma)
> +static int open_dice_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *filp =3D desc->file;
>         struct open_dice_drvdata *drvdata =3D to_open_dice_drvdata(filp);
>
> -       if (vma->vm_flags & VM_MAYSHARE) {
> +       if (vma_desc_test(desc, VMA_MAYSHARE_BIT)) {
>                 /* Do not allow userspace to modify the underlying data. =
*/
> -               if (vma->vm_flags & VM_WRITE)
> +               if (vma_desc_test(desc, VMA_WRITE_BIT))
>                         return -EPERM;
>                 /* Ensure userspace cannot acquire VM_WRITE later. */
> -               vm_flags_clear(vma, VM_MAYWRITE);
> +               vma_desc_clear_flags(desc, VMA_MAYWRITE_BIT);
>         }
>
>         /* Create write-combine mapping so all clients observe a wipe. */
> -       vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
> -       vm_flags_set(vma, VM_DONTCOPY | VM_DONTDUMP);
> -       return vm_iomap_memory(vma, drvdata->rmem->base, drvdata->rmem->s=
ize);
> +       desc->page_prot =3D pgprot_writecombine(desc->page_prot);
> +       vma_desc_set_flags(desc, VMA_DONTCOPY_BIT, VMA_DONTDUMP_BIT);
> +       mmap_action_simple_ioremap(desc, drvdata->rmem->base,
> +                                  drvdata->rmem->size);
> +       return 0;
>  }
>
>  static const struct file_operations open_dice_fops =3D {
>         .owner =3D THIS_MODULE,
>         .read =3D open_dice_read,
>         .write =3D open_dice_write,
> -       .mmap =3D open_dice_mmap,
> +       .mmap_prepare =3D open_dice_mmap_prepare,
>  };
>
>  static int __init open_dice_probe(struct platform_device *pdev)
> --
> 2.53.0
>
