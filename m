Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0352113
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 15:21:39 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-61b5a653df7so97239716d6.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683991298; x=1686583298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlbHORrublJdomHZWC4ReH7UCsQlw5QYjaipc7qMZLE=;
        b=hZNhfcxaRycVWd4dh2+vKNsErLXCwcxss6xkwFanQ+IPax0sZJ1AhwGGS7K3kI1kFj
         GdzmYU4xBe8zzWtRlHmC6GRd3pUHwBoZl6Tk37U5AuMMGQZjs7x+2yG1NueijTO3jS+k
         ybegbrSZEaW4F3VI7YIJg/IaHfVcDMC8z0iIsNsRdRsZz5VKSbJhOxCC6EXCKCb71dZC
         HLlnXQj+3MPrzW2EHBIf4EFC2adfu6z2ZStvrmFtaYXO1yjcJMvFvey7CnzHoja31Pjk
         1+dFFFLZiUpCJdBhJwKZqq+vax4wT0OTBFiaWPhFUEohfin1UCm6jvN5t0VeYS85ovD8
         r0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683991298; x=1686583298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlbHORrublJdomHZWC4ReH7UCsQlw5QYjaipc7qMZLE=;
        b=DTb8n1MDfhIE3GrMMq0M8HbPwKXP0MwbLYE1veNXeB2+6Ws4DomjOzd33HetwDN9KY
         PbtRepwtqcKMGQCsOQK/I0LCYzIH71InujmLTqhm5f0NX8kdGLGb04J8krccSfXFr1Qg
         uAUij4q5heZJ895ag2OMQKP6N4zAWf/qW/q2HQjOxVQEzRUaHC9PieGOCyKrBP8RVDYB
         kRXcJjeWCI3vAk639ePS2b8MPXdB4sWRCAue3NxcejbYfU8lW41OPPUP/AE7SjvL/e/s
         AqAnoB/rFC5j86nZ2NEo+l/KJFjy/HmUb+2XuoLG+vlHd+NeZDeRZTIAxbfYHN5qD3Jp
         Gv7g==
X-Gm-Message-State: AC+VfDzfTVrx7xMzaBTAY4wcRCiumP0MwcATEmP1Mw2fbNLD/YhLx/MV
	ypKXH04S3cWz228T72+5DxNdQulGV/UbMDfTNPM=
X-Google-Smtp-Source: ACHHUZ6KW4VaT0yVq42X4N1BvkkS89YMr5Sbvn+34RneUevxooOOWQtooFefYw0dVMPX/0CoZ8a29ZNJ4+SN3wWlANs=
X-Received: by 2002:a05:6214:f2a:b0:61b:3557:a699 with SMTP id
 iw10-20020a0562140f2a00b0061b3557a699mr50323380qvb.9.1683991297997; Sat, 13
 May 2023 08:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-14-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-14-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 13 May 2023 18:21:02 +0300
Message-ID: <CAHp75VcdMvgkn081N1io5UDDeCxx+fv_X6UxQ=XOZxKW8Xj89A@mail.gmail.com>
Subject: Re: [PATCH 13/30] media: atomisp: Remove unused mipi_frame_size field
 from atomisp_[sub_]device
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Both the atomisp_device and the atomisp_sub_device structs have
> an used mipi_frame_size field, remove the field from both.

I am confused. Perhaps 'an unused'?

--=20
With Best Regards,
Andy Shevchenko
