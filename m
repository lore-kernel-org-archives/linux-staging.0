Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757352918
	for <linux-staging@lists.linux.dev>; Sun,  1 May 2022 19:44:55 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id i27so24426877ejd.9
        for <linux-staging@lists.linux.dev>; Sun, 01 May 2022 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=lSkWyJ22j/Gy1+rBPKEz6ICjIB7fl5dNRWyogOjMNiA=;
        b=F9jEL0m5dCExabt9JtdIhocs1L9i3dnwB2TDZqj2ap6Lq+zXvHZ6rHaxGaMOzJDjvI
         kMMdgwzfDyl3DBbW7dmg8TRcHv3hwSG1wTbl8jHJvHExvCr4azznQuC0sT5XTFE+mI/a
         2NT2CkJpVfMdv2oyovIOLaojlIf7wM4Iw6WTvb/mHTgEd1k2QSHOoZzmgDr3uNwyo64y
         aOlVwJEmJasp4nv1V46RVWkxbEwG79jS99v+Sq+5CALFlisDqdlWJy3n/CYcIVD2FWBh
         YHEz0/GiK25AjEBGws1JygK+td5Kfq8pu98IqWQHVbzgCYKCXGAG6XrcLLqkYNFsylEF
         3CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=lSkWyJ22j/Gy1+rBPKEz6ICjIB7fl5dNRWyogOjMNiA=;
        b=lOkwgY2fhVSr2E/lKg5HG+KTnw7JUuamDTNahQI31G+z2R/hkt0AF3FPCG3u0GH001
         TccNZCY1ULs/27RgRc/DcECgWF3sLGFqoWO6hj/FU4Zjxv6yOcrCssmAcbbOtSnTr8qr
         cJOmvWEjvNcyWw/6eYAh8udMwHEeS7ozopPQ/FR6FjvCozqRNzLg3G3QP3HRzcn4+eOM
         lPt3Ikj7RF6Y9PNxpcNbhCDmXPKFUdqUTJWAKHEDpGP3O/wQdzHMw98+IvoMP9n8ENjN
         xpL89Cl4jA+4ZZYA5lzmDPSU5qNkNE+4DGbZd8AqfvXH35Sc6asrVRvDTc5Ei3iWlwoW
         nR1A==
X-Gm-Message-State: AOAM531OxhoXfrvlg1eEOLYOvY7e243Kk1XN0mc22e3pFqAu8+ZiUhBK
	eVg4nFT5CR3vM/yirKchxHCQQEKUr6y14L0klJvhDDwhaTU=
X-Google-Smtp-Source: ABdhPJwzwsI+XJN31grZYG7NyEU0V0hcG4a1Fj6YmOYwOlEwwGACzdjSwvtwWqOAYxPX3hRzUK5vgehrAuAUhgD0cgY=
X-Received: by 2002:a17:907:7815:b0:6ce:5242:1280 with SMTP id
 la21-20020a170907781500b006ce52421280mr8716226ejc.217.1651434293566; Sun, 01
 May 2022 12:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ozgur Kara <zgrieee@gmail.com>
Date: Sun, 1 May 2022 23:44:42 +0400
Message-ID: <CAOFRbG=mGdbR72moLtW87ZQW_T1HkhZtcpHRGzZy3NZ7afGVqQ@mail.gmail.com>
Subject: [5.18.0-rc4+] report: kernel compile
To: linux-staging@lists.linux.dev, ozgurk@ieee.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The v5.18.0-rc4+ kernel was automatically tested.

Hardware:

Asus TUF Gaming (notebook) - PASS
Samsung RC530 (notebook) - FAIL (1)
HP Compaq 8100 Elite (Workstation) - PASS

Intel(R) Core(TM) i7-2630QM - PASS
AMD Ryzen 5 3550H with Radeon Vega Mobile Gfx - PASS
Intel(R) Core(TM) i3 CPU 550 - PASS

NVIDIA:

1650 - PASS
1660 TI - PASS
1080 - PASS
1080 TI - PASS
2060 - PASS
2060 Super - PASS
2070 Super - PASS
2080 - PASS
2080 TI - PASS
3060 TI - PASS
3070 - PASS

Motherboard:

MSI Z170A GAMING M7 (SSD, latest BIOS) - PASS
ASUSTeK PRIME Z270-A (SSD latest BIOS) - PASS
Gigabyte Z370 HD3-CF (SSD latest BIOS) - PASS
ASUSTeK PRIME H270-PLUS (SSD latest BIOS) - PASS

Architectures:

Raspberry PI Model B - FAIL (2)

Fail Log:

+ nvidia driver fail.
+ scripts/Makefile.build:497: recipe for target 'arch/arm/kernel' failed
