Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4022116
	for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 10:26:39 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6237faa8677so9225356d6.1
        for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685183198; x=1687775198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1/AcRXeVao/wwJt5rTG3N1RcEL2uWTIWvqLQcGfLUU=;
        b=d8in5bpA23yjI5Z1PU6N01b8p3a59z9Xr4SejTnF0QTg41GTNn4ynvIaOsbSFIXWKW
         mkjklpNwtDSvc6c4PVJFWFNzNhbEXpHN0WBBVozNgeokGogmZs938dXNQ1GnMjOnShtK
         QaixRTiOusvzFISFZCWeiuDS+23nUXucn31OEIe2ypxiJpMpzn/2fITtHialSr7kwb4i
         dEuL7Vthaxfr6ihvRNXUohHRPeHRUhOiSOE0WUXf28OS/r07V4CQTWDavv4OefcPmios
         6oAgyIYi3+wgL+/5B763TmtoyCmKnZWa9iV/JPrsH8kvY3KtNZTY1ccOaIouyj2sJ1ai
         HYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685183198; x=1687775198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1/AcRXeVao/wwJt5rTG3N1RcEL2uWTIWvqLQcGfLUU=;
        b=A68YrY+YA7P+ODO94Z3YD24gFGdykutK8f/xmSarlzhLAlSpE1fj8cYeOQ4S7EH5BP
         vEA1fAk7sS+xTb32IYc7Ss/TswlHkGqVJEV5Iq5pBDQa/8Eekw4vs35q+hK2t1NH7XR9
         +Qy/yroLt3GnCLvUucKpq2x98nwhWVu6j30c2ZkVN3y5RP8T9WlV6fTyqUZ+gTCbEEFw
         FTv0A2ZvpDSxHQjsTkGe4WnaGrjeTwUhPXHZIgaT/vVXDp25ejCsytp5447+4qyOKh2f
         gN8EOQycxNBc0m96x8nWdmjE4FfL6COsZitX85awWXRLWfZKoH0xyILJ9y1wmnviWC8n
         Hu8A==
X-Gm-Message-State: AC+VfDztV+zgo18OAPjidylrFVUNdE8Og5XjJbuHU/WXomToSEOYojX1
	k0AUo5YcDa4vJxfpqFWcB6SLGzcg3frByz1oC0E=
X-Google-Smtp-Source: ACHHUZ63To6LhEdRSBsxtOJ5GSsFFkAdBEhL0lh12kFmlNVDppyXhQk/DTeZ7LLLtJAUXr1fsQ2MBbVr9BLHizECc5A=
X-Received: by 2002:a05:6214:21ac:b0:623:a5d0:1daf with SMTP id
 t12-20020a05621421ac00b00623a5d01dafmr3830230qvc.48.1685183198108; Sat, 27
 May 2023 03:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230525190100.130010-1-hdegoede@redhat.com> <20230525190100.130010-2-hdegoede@redhat.com>
 <CAHp75Vd1ijQM7b8Z2ip3TXJyuhQJfAqk0MNBVW-Q-ooi_-dBHw@mail.gmail.com> <c53ec167-9211-9d27-db06-f4b2db5f258d@redhat.com>
In-Reply-To: <c53ec167-9211-9d27-db06-f4b2db5f258d@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 May 2023 13:26:02 +0300
Message-ID: <CAHp75Vf9SsjYAH+jBhMQ4+MOvrs4zB1HZEWjK4XK5vGKV+39Xw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] media: atomisp: Add support for v4l2-async sensor registration
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 12:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 5/26/23 22:30, Andy Shevchenko wrote:
> > On Thu, May 25, 2023 at 10:01=E2=80=AFPM Hans de Goede <hdegoede@redhat=
.com> wrote:

...

> > Besides that since we have a handle, wouldn't it be better to use
> > acpi_handle_info() here?
>
> Yes since we are purely dealing with ACPI / fwnode stuff here using
> that would make more sense. I'll switch to that.
>
> I also agree with all your other remarks and I'll fix them all up
> (and test things again) before merging.
>
> Andy, may I add your Reviewed-by to this patch too after fixing
> up all your remarks ?

Sure, go ahead!

--=20
With Best Regards,
Andy Shevchenko
