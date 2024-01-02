Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091936A
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC/sweiY"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-680861506afso22781856d6.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704155077; x=1704759877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaiJZ+1PQv7/0mpttSPKEm/AJHOOv4npbJUTIzhsZ6M=;
        b=dC/sweiYG37Bytqb57nJMQLI825RaO7j7TvFSvEEnGAX4q11aVkk/XQCPfT8qOCbQc
         j0atvh6iNmf0dNw+347QFquCB48zrNNo68Yca2+0E8/spQQbpFV5d9Hd70roICLo7rPy
         ohhjngd30/cgJMIVjPqBGdU97vXp6r5TiFCRQoTyWHBhI9PQ+AgfsbKEV5Qe0u00iSPw
         xaxlE8Bh473RxlZle+56actF2X2Fa061tJfamFa0eJWo7mBDLTK+3VgLv9tGbZQnjY/+
         Fi8HImdihg+fzd2P2bexn4thPFWlqm4mAUxb9YASLLfdO8MQMz5HPA4xAJVNQgVkve7P
         vy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704155077; x=1704759877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaiJZ+1PQv7/0mpttSPKEm/AJHOOv4npbJUTIzhsZ6M=;
        b=ghWSt2b6bXqKDQIWvKd1X30lFMFl/RlZBN+rfy/Ln3krCyNivyJDWqCL97H+cu+dWP
         u5yVBC50zHnaAylimdGSNt71Xt/nPHF7R1W+MAcfJdSOMSQMYe01vkM7wsX+rTbGE5rb
         doCeJbZilHPeq8dL6CEmCcW+UqvVeZXPThXe86vmel2yx6jN1KX/jW56qiQ0xGo634ir
         oCrnVOkGbMGjOZAIPY/KMB3FXd+kbMgf1iMLfy1rV4J6DLmjbspSMgvvxBtRGaXwOqBG
         virfZVaD1LZc34p76+w/xAK2+VAO9KrRuPU2SRhqj8gjdIi1jgupZ1R5w67gKk7K221J
         f9lw==
X-Gm-Message-State: AOJu0Yz72SYgSkS5hwx6jXsEsMnIHJbcZyDd1tMLuwlj2rKB6eYVfYwM
	Cw2nIOBDJQwUbtnQiaAbg8HvdM75y2zJGta8Aos=
X-Google-Smtp-Source: AGHT+IFE+JgRxFRrVoBhgU+q+r4F6gOKuEZGzUpjJOp9I2bXEX/2SzpfsCKxNGlpYDZZhAmEqyfJDTmovbg0c3T1DAo=
X-Received: by 2002:a05:6214:d6a:b0:680:c0b2:8cde with SMTP id
 10-20020a0562140d6a00b00680c0b28cdemr634688qvs.50.1704155076874; Mon, 01 Jan
 2024 16:24:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-8-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-8-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:24:00 +0200
Message-ID: <CAHp75Vd2cNid4_oxQ88uRAGEnbrwEC_bUq6hqpcrB3vz=5kxPQ@mail.gmail.com>
Subject: Re: [PATCH 07/15] media: atomisp: Fix probe error-exit path
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:

...

> -Remove the unnecessary pcim_iounmap_regions() those are devm managed
>  so they will get cleaned up automatically on an error exit from probe()

Yeah, yeah, but to eliminate unneeded churn in your series, please, do
this early enough (before previous patch).

--=20
With Best Regards,
Andy Shevchenko
