Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1D3D78
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 07:03:44 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4545d8a95d9so1781504137.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695971023; x=1696575823; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yVYuURB2cheQTyHOhbnV0CiyPuHwKJiKEUrZ0k9NBTk=;
        b=M3SPJyNF8HD+DR3O+oa8LFsdL47iuS7+sudQISJSnsKCHtZU65KpbogJvTeHnab0eR
         m9HnyfsQZw+WUHG0RvYwMwGbmyQcHRsPxFhSUW6YLsW8kADGyszwZtphWKQntpyzm8L8
         ZKSrDg8U19PwZmIrXw1fg1twXy2BJcG85YLxkRdt8aq6cRh542ImufnE/sppjv2MktSJ
         RpUuKrKdyvtU0ape5vFZXmlyIbvos3DqVAtb6SJop8hrxYdmNfUTuYVa9fVzeYoZi94/
         Nz30PPxyNUC5ph8/pCFzn6FAfiRt3rQTp0yk4X6bSQ2kpKxOSlyylz91YC0xOeJ/yis9
         zPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695971023; x=1696575823;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVYuURB2cheQTyHOhbnV0CiyPuHwKJiKEUrZ0k9NBTk=;
        b=Bttn89dOGVe8rxF2rQfm0xQV1MFJ42Pih2hVGm4VqygV0tAqkJUOedT1ycOZT8vXC9
         DI4Wo8Rb8WY2uiJocSRwl+xzeqK5pPyTmNqNjTa0X4sbc3YXC8XHZdanDlY2cATTKngm
         S1iQ9RMegxldGugG76baHjvec9g5TEy/W1YysvokrPvEsId0y4+w6D9fgBbIwjsFhc3w
         GOfZom0AFEC7Nzhf0diQ7dFUuvrM5QF8Gbkn/NFcwjyVU3RZ8lrwBpl5gc0OuPzULton
         kp2TPQ8Ojo7LFkCRpirhB562/kRhh/LMPEK9a28KC9/d68Mj4z216eIY6CKBTC5dRem+
         Ea6g==
X-Gm-Message-State: AOJu0YzQCoob12rIwAbL6OpJp1Xf0FYFdG8oT9yGqZN867huyXOkK5qd
	4gnT+i0DTMziLgSVnRf6JbWmQgFcoa93gVQeZeI4Jg==
X-Google-Smtp-Source: AGHT+IHQAyrtYw6eFyGn+nC8nJKCAAl7jmDDfoPwLpeWUIuOh3FxqsVtkdL3fgC7qCAGj2sBL8dOQY9dTeRAdFaA1BY=
X-Received: by 2002:a67:cd01:0:b0:44e:9afe:c5b9 with SMTP id
 u1-20020a67cd01000000b0044e9afec5b9mr2704237vsl.23.1695971023130; Fri, 29 Sep
 2023 00:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 29 Sep 2023 12:33:31 +0530
Message-ID: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
Subject: next: mips: cavium_octeon_defconfig failed - drivers/staging/octeon/ethernet.c:204:37:
 error: storage size of 'rx_status' isn't known
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-mips@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: Oliver Crumrine <ozlinux@hotmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

The mips cavium_octeon_defconfig builds failing on Linux next from
Sept 19th tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
drivers/staging/octeon/ethernet.c:204:37: error: storage size of
'rx_status' isn't known
  204 |         struct cvmx_pip_port_status rx_status;
      |                                     ^~~~~~~~~
drivers/staging/octeon/ethernet.c:205:37: error: storage size of
'tx_status' isn't known
  205 |         struct cvmx_pko_port_status tx_status;
      |                                     ^~~~~~~~~
drivers/staging/octeon/ethernet.c:205:37: warning: unused variable
'tx_status' [-Wunused-variable]
drivers/staging/octeon/ethernet.c:204:37: warning: unused variable
'rx_status' [-Wunused-variable]
  204 |         struct cvmx_pip_port_status rx_status;
      |                                     ^~~~~~~~~
drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
drivers/staging/octeon/ethernet.c:801:22: error: variable 'imode' has
initializer but incomplete type
  801 |                 enum cvmx_helper_interface_mode imode =
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/staging/octeon/ethernet.c:801:49: error: storage size of
'imode' isn't known
  801 |                 enum cvmx_helper_interface_mode imode =
      |                                                 ^~~~~
drivers/staging/octeon/ethernet.c:801:49: warning: unused variable
'imode' [-Wunused-variable]
make[6]: *** [scripts/Makefile.build:243:
drivers/staging/octeon/ethernet.o] Error 1
make[6]: Target 'drivers/staging/octeon/' not remade because of errors.
make[5]: *** [scripts/Makefile.build:480: drivers/staging/octeon] Error 2



Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145550/suite/build/test/gcc-12-cavium_octeon_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145550/suite/build/test/gcc-12-cavium_octeon_defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145550/suite/build/test/gcc-12-cavium_octeon_defconfig/history/



--
Linaro LKFT
https://lkft.linaro.org
