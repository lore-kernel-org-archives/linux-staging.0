Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC86B2417EE
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515643; cv=none; b=ZCw7VnW1dExmhRDCt1suQ0n8fzlIOOonqQD1bF7ERHjKHzXv0WgJwLBu4oI/bwytcn58/Bn7w7zImLmDcMvcU8rRvBDhe/mgJf/DoLsSVZ/LWMEfnKZ40Rf5+Wg9qx3eIamFlj8KrHbkUfo9N6XDYsHrirGx7JzKWpatsmDzPwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515643; c=relaxed/simple;
	bh=rEJnYsO7aThmrtI4Y4NwN/xzWZ1RQqHVYInx/S7jT0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WY0tcWUirHNKmEUp6q7u0kqGeEAKnMrB1hZEejEVZo6zan6yp3dGKUfq8MaJEu14tAYPbzTiVDn4IbBdkq2j1NWkCjS7MafjpGg182iGapqR4oIG//DjCfKBjhbm7ARfBMVgyzoZdc0HL1AsxILJQ2wWAY3Mdhiqh+l+bYaYiuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5MWtAk1; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5MWtAk1"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso7520088a12.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 10:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515640; x=1753120440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BAqcBqjfk8mxQc7/Q5Ppm/61XcxJGDgiWH1KQzom+8=;
        b=U5MWtAk1K++lZskWamVoT2wyej/Ne+Xk9zz0b//yAOkAwlBa66Ex0BdNQeWMuPzJ4q
         gJFH3eGkj5XSIcrh7v8XeNS2ufEDzCmiesgBMWKqudMqK3gfjTe+wFaQiWn37y8FTdKD
         fRCjltrp1/AKBQaEPIgMq3ow/66GPrILCCuwEtG6x5vDGfs2/Zss2QNngLpOTNYUc4UP
         2pWevDH57+Mnq2TRdGH6/YMUAK/IuUNyT6Sw/6V+4Bj+Jn1A5m0o6v/mVin9VWe9bBxA
         XnHYZ81QXMQRX/u2QurWtDgecLBFV7743h/+yiVb/T7mzShNj+YIvYza7KPCVj6WxpqK
         kt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515640; x=1753120440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BAqcBqjfk8mxQc7/Q5Ppm/61XcxJGDgiWH1KQzom+8=;
        b=TbnNpevKXSiTOe6Lv2TalEY/bqujbmEKuZGa+EOjq/g76sCbUxocLeVyMvX7rqkqpx
         1KSKsE4syIroJnXEB+iw6uceTsaOZK471vEdEp5+okXoCEqLijKShh1YSmQC0zNoR4ys
         WgZ4D+vn2ffvGy+6lXEAjqwOpeNo0Ixa5/oVH+5736sTZkt12/GQ+cyqq3RSF22YXycI
         wwYIhVGE8I7ylV6asH5QKmB/HqhKdsV0pPbbIrK07FLCIOrEZNUqB2U/v6cDcZCdB0vN
         RlIbnyp6LJ6P7UTlZ3sxEhf6zoDeL53F0NmR+MoQRvjD4Q/A9Pv+bLdL4fLXBRnmS8dg
         JwyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzLo6Pv5UJp04wiB4/GYEPHuxGJdz9aWoNzzA6e5zBSdmSLHtMrJuaG27q/dOkqALIU5ctLvCZdeRUb5c7@lists.linux.dev
X-Gm-Message-State: AOJu0YwxV8nPQQsttJxFueV6e/anJpSu5BIKZLFA9p8os2bZ+FXc2128
	nVtmtViaCk9EbC8xR4r0hLMq7ISkaoncotj2d8sWNrpNmnQdrTFpfOXuELmzfCbrGt5laVsqiN5
	yB2qII1NDpZIrSdlnLN9GJaayi+TtmUY=
X-Gm-Gg: ASbGncvhIfePC/iIP2x5UXJVwjLUCUBE0DdZGUdjjKtOliEVjGTPb7Neksr+8l+a+ZJ
	QFhksyFrNA/5Cxc0udvjvHrUtjE4U3SfxN4ui5NYSUoNh0By6ZWuJmUvs9n/98oPU/pYfWUM+FR
	0mLXSWFnsG/Oyt57lV4UJ9VlxK0ylbndgthsPh4c3U0vftCNDzxKUcljiRnwhbWFW+5ScqYV1C6
	UmvToo=
X-Google-Smtp-Source: AGHT+IG9FNW4SNwWqFdFje1D5etTdMT9T3XjTgRWfU3MakkjxIgXIpoE3Ty603+VSp9VAxU6+9bFAes8QkeS+IuF74k=
X-Received: by 2002:a17:906:6a1a:b0:ade:8720:70a0 with SMTP id
 a640c23a62f3a-ae6fc6fe275mr1336963266b.20.1752515639962; Mon, 14 Jul 2025
 10:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714142645.88038-1-sina.hz@gmail.com>
In-Reply-To: <20250714142645.88038-1-sina.hz@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:53:23 +0300
X-Gm-Features: Ac12FXxkUNXyhIJyRHnCUHrp1VxoDR6DYi17bYnDSxnyJZhwSDxKeSLeJRLeORo
Message-ID: <CAHp75VfFiO4U3ge_xGw7JSwXtK0AwHO1hWLZdCv4huX0cey_+A@mail.gmail.com>
Subject: Re: [PATCH] media: staging: atomisp: stylefix
To: sina hosseinizad <sina.hz@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 5:27=E2=80=AFPM sina hosseinizad <sina.hz@gmail.com=
> wrote:
>
> change the spaces at the beginning of the line to tabs

You have to respect English grammar and punctuation.

>  int atomisp_css_video_configure_viewfinder(
> -    struct atomisp_sub_device *asd,
> +       struct atomisp_sub_device *asd,
>      unsigned int width, unsigned int height,
>      unsigned int min_width,
>      enum ia_css_frame_format format)

As a standalone this is useless change and just a churn. Try to find
something better to fix, please.

--=20
With Best Regards,
Andy Shevchenko
