Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4F21092
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 16:02:58 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-757942bd912so120112285a.2
        for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 09:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684425777; x=1687017777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOLisQJjbRcDSRA97nJKM/BMoqenM/5IifeJNnHSgD8=;
        b=jqLlediZ3JGzQ5yJlhGvSr5KvxcfHFDPKGj5S6nCGEFZ/myseFfaMALgM0qDIM1n6w
         iEJ1ve4WaI8FgFTyH5Rs2fqRW5dceGuVMC+MhBNt2yhDByAvInpHyv261R00ERskijkT
         2d+KW63Y9zLaolL1cM+mESmPk2QDkA2lpB3vaERjihDmmKorgGqx6/JZA/I5q0lQzQtE
         28Hcul7V2eebBJ69Qhx0oloAfyanu7H5KPY5V7foisqxpE9VYZzkTTt9AURFOnVCfUEe
         1zraetmkJeyppgqfPqLkaZcYujcLTDU0SrU1EDtwWhcfLqhSjtHdGCDS+9ii9MUPhhL6
         OTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684425777; x=1687017777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOLisQJjbRcDSRA97nJKM/BMoqenM/5IifeJNnHSgD8=;
        b=fMniVrPgCs6nOl11PIE+PlT356zuXuPjpGofkNRPPih8dhs5dJVQCJJaLxsqiFtawX
         BW0J9HPwtxe8OKH5khQdt/pSSctws8UqEZ3evuXpQYK3z2fftq+9EJtRldjJVybLx+va
         ZrZCtoFbUPzjQVKgWsDv48CguwpKfLqEieek/+OEUtaWAOwN1Q/WZQXN7Cjw+pkj1BGz
         hKqTqDZGLBCFb5TqFrKs70TdNdkbmC6513Um08oLsbz1p2omOPwumxhgPSTSUjy/m4sS
         G7rUDPmD0qR56OILY93yAlCCn6YxMw/quVX+JIZdKdxnzqOCf1vgBW+q5ZhlQmMZMohD
         aQQQ==
X-Gm-Message-State: AC+VfDzC13FLfl6WWfX6m9Tjl3VWry4NxyILOTOJatiZTQOXRfFrFmFT
	QRBqqvwaZpL/afoFwJUc78zBMPlUwdhcqqaBDA4=
X-Google-Smtp-Source: ACHHUZ6siRdVoKVbwcDOxYidVP+vP1trYj25Q+DQ67Hu09MZWL/4TNolXujjppJbiHl9T74wpDivmIB2Lwvh+hbYJQI=
X-Received: by 2002:a05:622a:1301:b0:3e9:aa91:3627 with SMTP id
 v1-20020a05622a130100b003e9aa913627mr64964qtk.65.1684425777393; Thu, 18 May
 2023 09:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 May 2023 19:02:21 +0300
Message-ID: <CAHp75Vd=0oXwKqwDghX8suK0qcYp8Ny31CRDkYFKa9M6QUax5Q@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 + gc0310 sensor driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Now that the atomisp driver supports v4l2-async sensor driver registratio=
n
> (I'll post this as a separate series), there is no longer a need to have
> atomisp specific sensor drivers and after cleanup atomisp sensor drivers
> can now be moved to drivers/media/i2c as regular v4l2 sensor drivers!

Cool!

But since the patch 9/9 in that series is WIP (as far as I can see), I
think we first need to concentrate to review that one. OTOH I'm not
sure I got this right that I'm thinking that this series depends on
that one one way or the other.

--=20
With Best Regards,
Andy Shevchenko
