Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8040C18E28
	for <linux-staging@lists.linux.dev>; Mon,  9 Oct 2023 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sJZuYV0Z"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-352a3a95271so18490375ab.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Oct 2023 10:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696872171; x=1697476971; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FyrHUncwIbuAenfVDZXIgy/WAecJiWycGhNcLfrs9wQ=;
        b=sJZuYV0Z27j+gwZhvMLaaVmG9BrKKkRPOx8GKTg4uv+195BfGU0aLmh53Ai7XOzlQd
         YxOUGoV8RLFGNGZGx96rY1AT7hpOA910CiY8LQ0Pq4yNic3qMIfwR2X658ntLq/wt/JK
         iccKkq0JoxOi0K9+jc0ajLVLYiRCEVCIcHM16Ay8uQENKKcQUZembqwbEefM+20MAi3s
         EIGDh9Vt6VY7upIfT3Ajj6yBrwLEQpOpHEB2rVDs9aVcn9A3+slMVrJbsIDFNYxi6sd2
         iJ5VDCDyVy2CL/MMoXWOi+/MzaRKhCNnbYTp4hSVJeoEUK9MomljbskU8ZSeU+ri1OIg
         cMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696872171; x=1697476971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyrHUncwIbuAenfVDZXIgy/WAecJiWycGhNcLfrs9wQ=;
        b=Hx62ul6YSCvFDOr8dRasAz0RcieKaoC+cDFTH3/gufv0Cy5Q/kciCGjf7zSxh5tdBO
         3fkRlLnq3k4Uxm+lr28I60u6P9TEWP62IcGWZ9CbXgc6Insj2PCDmMtvlf/SIZyWWz5t
         A/VkoJ1fSJz4Lkmo+Nb/uGj5JGevQ5wxlVIBKSL7L4lnoPmuI8SaJtobqjw6QsWo78a5
         NXo41yqTjG1xPXZ9SsO5gNMwRlLB2MRCPeQykMQQrDj3j/pCPSOJg+iYb+PPed06hOhW
         doVviikk3KiH7SRCKWwAFHENxMQtEhZ+AmVnx49q+e4E5WcNz1WDl/djh/73sZxEN2k1
         mb3Q==
X-Gm-Message-State: AOJu0Yz3+0VnaQ7EfIVgGZtcNE/ximIBesc+Dua7ursLXIbUFdOpluV5
	h+9lYSoj/1K7DB04ubvazSoxjQ==
X-Google-Smtp-Source: AGHT+IESGDL5JZuUy4WjDigCmfDdd2PwU93Z9KgGz2t770bhc/dWPwn/PzFLzV84RY8/doRRjiQqFg==
X-Received: by 2002:a05:6e02:1c46:b0:351:57d5:51c4 with SMTP id d6-20020a056e021c4600b0035157d551c4mr21254542ilg.1.1696872171467;
        Mon, 09 Oct 2023 10:22:51 -0700 (PDT)
Received: from google.com (161.74.123.34.bc.googleusercontent.com. [34.123.74.161])
        by smtp.gmail.com with ESMTPSA id cw19-20020a05663849d300b0042bb6431487sm2246205jab.65.2023.10.09.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:22:50 -0700 (PDT)
Date: Mon, 9 Oct 2023 17:22:45 +0000
From: Justin Stitt <justinstitt@google.com>
To: Ricardo Lopes <ricardoapl.dev@gmail.com>
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: qlge: Replace strncpy with strscpy
Message-ID: <20231009172245.wholw3yhu46l6xiq@google.com>
References: <20231006161240.28048-1-ricardoapl.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006161240.28048-1-ricardoapl.dev@gmail.com>

On Fri, Oct 06, 2023 at 05:12:24PM +0100, Ricardo Lopes wrote:
> Reported by checkpatch:
>
> WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy
>
> Signed-off-by: Ricardo Lopes <ricardoapl.dev@gmail.com>

Nice patch!

It looks good to me and helps towards [1].

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
> v2: Redo changelog text
>
>  drivers/staging/qlge/qlge_dbg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
> index c7e865f51..5f08a8492 100644
> --- a/drivers/staging/qlge/qlge_dbg.c
> +++ b/drivers/staging/qlge/qlge_dbg.c
> @@ -696,7 +696,7 @@ static void qlge_build_coredump_seg_header(struct mpi_coredump_segment_header *s
>  	seg_hdr->cookie = MPI_COREDUMP_COOKIE;
>  	seg_hdr->seg_num = seg_number;
>  	seg_hdr->seg_size = seg_size;
> -	strncpy(seg_hdr->description, desc, (sizeof(seg_hdr->description)) - 1);
> +	strscpy(seg_hdr->description, desc, sizeof(seg_hdr->description));
>  }
>
>  /*
> @@ -737,7 +737,7 @@ int qlge_core_dump(struct qlge_adapter *qdev, struct qlge_mpi_coredump *mpi_core
>  		sizeof(struct mpi_coredump_global_header);
>  	mpi_coredump->mpi_global_header.image_size =
>  		sizeof(struct qlge_mpi_coredump);
> -	strncpy(mpi_coredump->mpi_global_header.id_string, "MPI Coredump",
> +	strscpy(mpi_coredump->mpi_global_header.id_string, "MPI Coredump",
>  		sizeof(mpi_coredump->mpi_global_header.id_string));
>
>  	/* Get generic NIC reg dump */
> @@ -1225,7 +1225,7 @@ static void qlge_gen_reg_dump(struct qlge_adapter *qdev,
>  		sizeof(struct mpi_coredump_global_header);
>  	mpi_coredump->mpi_global_header.image_size =
>  		sizeof(struct qlge_reg_dump);
> -	strncpy(mpi_coredump->mpi_global_header.id_string, "MPI Coredump",
> +	strscpy(mpi_coredump->mpi_global_header.id_string, "MPI Coredump",
>  		sizeof(mpi_coredump->mpi_global_header.id_string));
>
>  	/* segment 16 */
> --
> 2.41.0
>

[1]: https://github.com/KSPP/linux/issues/90
