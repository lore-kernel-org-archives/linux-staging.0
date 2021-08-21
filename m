Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025472
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:30:04 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id bo18so9404467pjb.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ogRJWET2r0ZEOHnVOELtmeC7ZrMSpFkdcuNji551as=;
        b=aUYENPN6rgHJHIRtDP5SuOnqohDKnGFcuyLASbIkSAy3azEHLpSODmRch5t/Cq2IfS
         PvxMEbzkDP7oR66bsaFh5CILC0rew2lj6omiRKv837tANzBXyDDQFHKUsYsfMlgh0Bjf
         vEm42pmLu6/UOEKcE5DUUuz+2uMtBUt4ljsYBuw8J53FGJcHy1qGgoa2qswkb7r90uiX
         fY98svuX56unTOCQ8sLc0naH3XYLoV+tmIHQJWNswyqpe+tUuOYvyNBG6Ozq7rwFqAAv
         c2LyKQ2tzzBdTcIIVlbPEZt/xYebsME/t+0/8pcgMlHvilxbYtpB3OMHopshP3debja0
         5qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ogRJWET2r0ZEOHnVOELtmeC7ZrMSpFkdcuNji551as=;
        b=U5P5wsn4+XdYavXOlMHcZQ7cDFt4EN86HWY9NG0QnDdAVHEwQxmepp359B0buhjY3L
         zwDQ/XLq5waGombEOP/KXBExIjrRS/LdimJvIjs/kcd0HaJoBWiGM+8oqaHMK2ai/5Td
         SRUowIQ4lfosBXrCVjCMOX0NmkrJ4PknpRHnVDGaK75+nOdrnmvyVFZY4cKDVHeGvJL/
         1m7+BO8947bgZTQ5wQtu/0AnVT2BQoIQmyin6iHg5vG7Ymmvzg4VBGwsnWRkPqL9gj+7
         KTbbSccHVRrxw38nTIY3xb4K0lHsi/U7wnEc9BeQpD54qJKraPO4Uq8l2+ff0FRkeFAX
         qpxA==
X-Gm-Message-State: AOAM533zF+w+lZt6wtmrU1ctMUIqCYq2injrA2VTjeYF2+texPREl3X9
	4C2jmpP2RQqrd9SyboOFqCXAPJ34rN7RMLscDfS5w7/e728ah7lE
X-Google-Smtp-Source: ABdhPJxmh0gJTtCE/GD6VPl0t7VdpfwTluLfuU4t+pukNp5dVZFizZlMmaw6KVYm5WpxKg09hYQoiAWuu6sOZj3lN6E=
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr21501619plo.37.1629567003980; Sat, 21
 Aug 2021 10:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <20210821164859.4351-9-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-9-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:29:53 +0100
Message-ID: <CAA=Fs0nq2hHCY=kpeYCVX8-D9abnPqi5d0E0fe98kn77bbL1kw@mail.gmail.com>
Subject: Re: [PATCH 09/10] staging: r8188eu: remove unused members of struct _io_ops
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 17:50, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Remove function pointers which are not used by the r8188eu driver.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/include/rtw_io.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
> index f1b3074fa075..4b41c7b03972 100644
> --- a/drivers/staging/r8188eu/include/rtw_io.h
> +++ b/drivers/staging/r8188eu/include/rtw_io.h
> @@ -100,13 +100,10 @@ struct _io_ops {
>                           u8 *pmem);
>         void (*_write_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
>                            u8 *pmem);
> -       void (*_sync_irp_protocol_rw)(struct io_queue *pio_q);
> -       u32 (*_read_interrupt)(struct intf_hdl *pintfhdl, u32 addr);
>         u32 (*_read_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
>                           u8 *pmem);
>         u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
>                            u8 *pmem);
> -       u32 (*_write_scsi)(struct intf_hdl *pintfhdl,u32 cnt, u8 *pmem);
>         void (*_read_port_cancel)(struct intf_hdl *pintfhdl);
>         void (*_write_port_cancel)(struct intf_hdl *pintfhdl);
>  };
> --
> 2.20.1
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
