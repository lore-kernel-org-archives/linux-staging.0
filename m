Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54B73FC4
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 23:45:51 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id mf2so1985152ejb.9
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 16:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kv1+3PF8NoBjdGENhso7cF1mXXZBYI7ik/JgLEIWEFY=;
        b=I9g8+mQ5rKWvAzdrQlNKi/je8uoX4tqgS0TbgFbhvZ4T97rLTo2hFzqVn3SmxREX4Y
         S++l3DYcSCuyaf1cK83t/nuMCHI6S85HPv5MQToG2zNIol9k/oKTwkndE6wNUDGnHVct
         2Sj+gXedYg4s1atCrUZYrJLkB1mwBNiv9MhylJkZifxFP5F7MhZ1+efByjvYIkyWrpQU
         1D8AP76CpkjRAj7Gc5J3umyH8BwCMIyIwGUUZFWfYW6DqC+HSxkprQzO4ewaRunBh+Xa
         BwCdN0mhaMu76d7F3MlKoHE6q20CndzLGeGYGU2siHrn4oeDAoYBKQ8NQ1Zh/hCPHifm
         odIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kv1+3PF8NoBjdGENhso7cF1mXXZBYI7ik/JgLEIWEFY=;
        b=h+aAMWwRUjTPSIgTwxXbOOfnq3f93S5i9SJ6N+DjWT01Od9YJtg1ZZjkUKC4JHQDML
         AdFGm73Lz+x/GQFId8EShIGfIRchGsUDAlxP7padyvoDfN09kbzswDcL7Ob0S6E1zZOV
         EAN/VoxXqTU68M2BDlcfdfm6Ek62CkAHEePpRxWfNij1FGQyfXiN/Undbf7fmu7TpXWV
         9TAl+dqPnWuY48TtZhAc0Tbl+PLJxlH0Q6tZkhviX6c8GYYbEPNhk2n3Wq46Omt7Gwml
         EQpjMHcx1yjUUoqONNinTnnTXkNC7EqyW2p2IOH8S9HNl36plgW19ae7k2/3phiBnAij
         cpwQ==
X-Gm-Message-State: AOAM5302QM4A5hMAbXdJkMGcG5WytEx2NCwLWTq3UpFYiXqvMbrAFU3u
	NXRzBEj3IU0jLh5e7nL83SQ=
X-Google-Smtp-Source: ABdhPJxADK5L+azPcbkWSGJuU3YC9SPUcS4q3XWCss7G/UGZ3RFuy4PW/J6QsImPpB8WY2dU1GnJvw==
X-Received: by 2002:a17:906:9401:: with SMTP id q1mr1183144ejx.313.1629935150013;
        Wed, 25 Aug 2021 16:45:50 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id x9sm649417edj.95.2021.08.25.16.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 16:45:49 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v3 3/6] staging: r8188eu: add error handling of rtw_read8
Date: Thu, 26 Aug 2021 01:45:47 +0200
Message-ID: <3591772.nrefL38gfN@localhost.localdomain>
In-Reply-To: <c59d5d850bf9aab208704182c83086609289cb9c.1629789580.git.paskripkin@gmail.com>
References: <cover.1629789580.git.paskripkin@gmail.com> <c59d5d850bf9aab208704182c83086609289cb9c.1629789580.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 9:27:27 AM CEST Pavel Skripkin wrote:
> _rtw_read8 function can fail in case of usb transfer failure. But
> previous function prototype wasn't designed to return an error to
> caller. It can cause a lot uninit value bugs all across the driver code,
> since rtw_read8() returns local stack variable to caller.
>=20
> Fix it by changing the prototype of this function. Now it returns an
> int: 0 on success, negative error value on failure and callers should pass
> the pointer to storage location for register value.
>=20
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Dear Pavel,

I have to inform you that building patch v3 3/6 with gcc (version 11.1.1 20=
210721=20
[revision 076930b9690ac3564638636f6b13bbb6bc608aea] (SUSE Linux)), gives
the following warning:

drivers/staging/r8188eu/os_dep/ioctl_linux.c:2258:13: warning: variable =E2=
=80=98error=E2=80=99 set but not used [-Wunused-but-set-variable]
 2258 |         int error;
      |             ^~~~~

I'm sorry, but I guess that for some reason previously I had only built v2 =
of your patch=20
which had no warnings at all.=20

Unfortunately, introducing warnings is not allowed.

While we are at this, I can also confirm that GCC 11.1.1 _does_ _not_ emit =
the warning=20
that has been reported by the kernel test robot.=20

Regards,

=46abio

=20


