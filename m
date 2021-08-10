Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F60177
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 22:36:24 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso6531475pjb.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KyLzU1jfaVAOmtKaZRdXJ+6c2xTKLNopZF4d/eV+on0=;
        b=cwVgqrNxO6fUitc37W7Flhdj8P26vPMPrmosnYTS9KIhGzFjr3bz/EeTrgW5aEZnBH
         Nd+EuhmOdeFiMgwjawwPNMgtGrz9G2qiIwDTRI8jLeYySXGlCRl2q3qfWbldXsUlzUBt
         38EIYKZYr+s46ZqhsvxSsXWsxFN5KeQvXgBQSPiM30SbqOI2sfbxxNL9C/eLU02T2I7B
         AzCIlBGLQsls5Ra0KLlchhEhPsxtXCXUF7z7kc3LACrU3rWgImlyTrUCcZNa5erz2rdX
         Q3VR1YcpIAfJUUYmJMg07hId6dZpWiFOGZMM9oXFugbrgjp9rbyb11pXNiCojTlk0iOa
         2DFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KyLzU1jfaVAOmtKaZRdXJ+6c2xTKLNopZF4d/eV+on0=;
        b=INbw3l2lIq5KQp+HTHzWAVi4l6spAfqJczBm/fXYwM7XVLXBj5nN5BDHDQtXHO0F1b
         JDq6umqpNiFXZyhIJB1Bs4Sek1X/ui5eKhAhmrxMWHJWQE4vxqBh5YhTGIJOaVJ2kdq2
         CAnoDotDgjbIAgWd28ZGYdZVytsR4MwAFOsLY2zELpKXrze4/5WvNvNhPPWXyrsGAc+4
         Dl6oiJo4b+RbRbnNzrZLBXYkYHOHvsuIWtFtw9GPxwAz37TG+usOjMMh2l4KPt6ViTxF
         B1ogWLOdvfK5qvsIFnCqOfYcXl8Kt1qS6INMf1MTKXxHD5icJ5OJK8keiksJjlg070ci
         Dk9g==
X-Gm-Message-State: AOAM5337sOfnCFhrNPDVLGmljMnLzhbLNlcj2ndlfYUWue0Q5KUfdCrs
	9ESrTtccNb/0oP7zc0Ehh5mpjn7PNp1O3WGojVLGdg==
X-Google-Smtp-Source: ABdhPJyV8FUMwdMg8PfFOJwCLAIrusVoyrcLD9RjjfO2tkmyno5xATT7Mc/YJO4XHPQG9iC1bnxBPZLYbWQgAGb/xOU=
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id
 189-20020a6205c60000b0290341e0b1a72cmr31080061pff.71.1628634984338; Tue, 10
 Aug 2021 15:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210810074504.957-1-phil@philpotter.co.uk> <20210810080640.GV1931@kadam>
In-Reply-To: <20210810080640.GV1931@kadam>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 10 Aug 2021 23:36:13 +0100
Message-ID: <CAA=Fs0k04m-4ySt7eWfrKTPBdUHTguT9j08pgYJUbDOYE1yuyA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove rtw_ioctl function
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>, 
	Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Aug 2021 at 09:07, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Phillip, Michael, and Martin,
>
> You are all working on this this same driver.  Could you Ack each
> other's patches?
>
> regards,
> dan carpenter
>
>

Dear Dan,

Certainly, will do. Will keep a look out for Michael and Martin's
future patches in particular.

Regards,
Phil
