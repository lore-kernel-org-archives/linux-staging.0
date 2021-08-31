Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241993FC1
	for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 14:00:09 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id t19so38926862ejr.8
        for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vRGPL2VV0o0ofi1MfhnuV5PKCRKMFsjdi8ZYFs81Rbo=;
        b=TFUmVVnvAGbEyOtfIM5WS0pGceGbjylSZdrAYoM4kkWEqFDQ6PCg1u/t88NaO8M5ej
         m5hQkCSJQR886X1TdmNECS4DM/nPNz6TOY0aA9sfVE9T0Nxww1tVbd/+xmckkUzaGWH7
         2GjMY260nBKw8WpBPnQe7oyLeLd1260wjhi095cfN0X/dFzxiz7WtJEAfYOj9ZL2gKB4
         s4873MuRPe7EQAwv1eLcV9y93F1wXbozwKeYsWsBIyE7O4ESJTrspA5eUQBBONuY4WTj
         ohyVkdwAKjkN4ce7FtDpv/fFP+KdtGcAWPVnkm+QRj0ya7P7q6od9rz0Nu05m/71haaY
         McyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRGPL2VV0o0ofi1MfhnuV5PKCRKMFsjdi8ZYFs81Rbo=;
        b=i/Cb/bnjU3WK/5VQi9CsG1uMDnlw17RH6oV1pdmiPi+Y1gum0kTAxbOdyi1cYe4aiE
         h2FALNtnPmtER21FBJOIZyqtj4dlUbHZBOk4u4j7eJ4mQBRKzRwEsFnZEeyiYmi97B5u
         TsTTqyrNnuvIPyyMYf508nnHnhckuscVAnwxhBSxu4W9rxdYZtlwpE5gP3fuYaM4uJxM
         ozIpWFhZWxjmPBBJNA0+8T9+7mqTIcATVYdnaDukJTNYpCuf2Hheh5Xdq5T8UTrP5kTK
         J24KMzVu8bzV0m7i6FSGvv6NaGloYJ4tpuHcIVnsMbbdqv+l68+kL44piyfxM/WGgclH
         WONA==
X-Gm-Message-State: AOAM5302dpdU15NWtpxVIh2DiyKDu5K+U8E/Jz7xyFXAyw9KTikDdS6m
	ZlcYVsh84QhJJ10905O5W9g=
X-Google-Smtp-Source: ABdhPJwaiCI5jhXKCGrECvcCcBYeMyn6JYflAyIN8g+vpECD4nNbTdOPiaHImxWgEUF7dcChGGVpow==
X-Received: by 2002:a17:907:2492:: with SMTP id zg18mr30707319ejb.233.1630418407083;
        Tue, 31 Aug 2021 07:00:07 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id g9sm8321266ejo.60.2021.08.31.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:00:06 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Krish Jain <krishjain02939@gmail.com>, Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Declare the file_operations struct as const
Date: Tue, 31 Aug 2021 16:00:05 +0200
Message-ID: <13366651.n50aozgL3V@localhost.localdomain>
In-Reply-To: <20210831133533.6aayzjghdakrhy56@h510>
References: <20210829144531.c2syu4vv4s22dlg7@h510> <CAPGkw+wyH3Pj6DV_m8wqCV5yujhjRwTwVNs6dK4i9JO-Y3ys6w@mail.gmail.com> <20210831133533.6aayzjghdakrhy56@h510>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 31, 2021 3:35:51 PM CEST Bryan Brattlof wrote:
> On this day, August 31, 2021, thus sayeth Krish Jain:
> > Hi, could someone help with this? Still stuck. Maybe someone else has
> > some insight into this issue too? Or Greg or Bryan.
> >
> > Thanks

> [...]

> If anyone else wants to jump in here, feel free.
> ~Bryan

Hi Bryan,

No, I don't want to jump in here because you already did everything that 
would be conceivable to do.

I just want to *really* thank you for the hard work you got involved and that 
you carried out with one of the highest levels of professionalism (and 
patience :)) very few of us could ever equal (not I, for sure).

I thank you also not for the technical hints you gave to Krish, instead for 
your your choice "to not rob [you] Krish the opportunity to learn".

Actually I was tempted to write something like "first do this, than that, and 
finally run this tool". But I was able to desist, by learning from you how 
people should be helped for real.

Most of us here should learn by your attitude.

Thanks again, seriously.

Regards,

Fabio



