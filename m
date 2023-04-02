Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F42820FF
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 07:45:54 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id de37so8082017qkb.7
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 00:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680421553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vH3FQmCip7UxEf9YwzeV9cRGtTOWxZu3UxGvMP0x5s=;
        b=GKH3zR3EOxaPFkrRtMPg4Y2LrLJ7r5/S1c31htLXbt82MOSaqQLZNqMC5F2IJxNee4
         DKbIAAt3F+Dv5aLrf9l/tFd5QTn6SkVY8G4RleCbKCQtkF6P59hRjB8tqlVQDoLfKqSe
         SL+tcpEtpVHlF+WahlGlL8fUENKqeuFeV4Lt8mNcYFi+VO70wEx0GL+dcn6rUFIDdisw
         /OfYcRtrs7HvX/F63W/jJO5ScpWISoD3ucN1n/RhldKc89gF6JKbDDcDbdMq1wpJXZKL
         DXxDZQjVFZm6rtSDu6AAxBtUo9wtMzMh9fqcNeTfi7l6OzZofbzCZhe7fuMhGJJHrYTa
         /leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680421553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vH3FQmCip7UxEf9YwzeV9cRGtTOWxZu3UxGvMP0x5s=;
        b=5OoIoXFMmC+SJQsS34B7tEWIQo9RRAJhWDBu4LlaOB71upqD6vwAb1r7d414G9INCl
         TTuqTN7/oamLrwAv9uZrG/3p9WFgzUJZIBcEIKqWabesxtp9fBxgqnsvAtT4fpQEw6yf
         UBp1R1zv1cy0b95s3smMX0rxJH2qpTuYGDTomcpi81sFsZrdcO6dJWxFv1rzAaKGdbU7
         2XPE7hgml2O79p/TcQ9pKhCNdwce8cJRk9ucmzUKJYzYfbCI228xaH5gXnd+SQc2MX/G
         QLXcZwOaxgjAg8Sx1AsJAFwPWrV9VX5Z2SP6dWYcBdpaDA8ImAujxmuXlP6Wyrqn8IvK
         zs4w==
X-Gm-Message-State: AO0yUKX+9bVPNIAXZd81j+z/HdgYUjCSRuEPzUxwosX+9JSJjjYrxzCw
	p9iYXK8etEE5CKHX/6wbINFlRdfpJt2Z9E27RwQ=
X-Google-Smtp-Source: AK7set8yuBGHmQt7MyBki8CgANN3aXHOKVBA3e8707BaQLWRKgGIj61DuqG3hLMw86z/wzHSPhkh2oKaBERPN3phh+8=
X-Received: by 2002:a05:620a:2f6:b0:743:9b78:d97e with SMTP id
 a22-20020a05620a02f600b007439b78d97emr8576967qko.14.1680421552972; Sun, 02
 Apr 2023 00:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-9-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-9-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 2 Apr 2023 09:45:17 +0200
Message-ID: <CAHp75VeorjdJ5mHOfOtdqVeMMeDJiH7w=f+7ci_071HD2TN9qA@mail.gmail.com>
Subject: Re: [PATCH 08/28] media: atomisp: gc0310: Replace custom reg access
 functions with smbus helpers
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> The gc0310 uses 8 bit register addresses which makes it compatible
> with the standard smbus access functions.
>
> Drop the custom reg access helpers, replacing them with the smbus
> access functions.

Ah, cool! That's what I mentioned in the previous email.

--=20
With Best Regards,
Andy Shevchenko
