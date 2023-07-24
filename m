Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC15184C
	for <linux-staging@lists.linux.dev>; Mon, 24 Jul 2023 07:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690184415; x=1690789215; i=markus.elfring@web.de;
 bh=SKJKsWxifWL4zMX024t2IjEchvTuVcHlLNLZambghs4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NcrrZB+yx9h5TLHlE/rQqxZNfOxiCOUf4B6EOUSvf243fXgSbAwwVNCn+T+/941dlpBEoE7
 CB4kc2HBDsJRQM6mWxN4OpBSSaqCGK2jP1pfMS91+4xrmrCPdpC7disOqurrPXifkRixv61qb
 ADVvm028FiC3o1IpRc/KLIINK7WueRJ6V5jZnAOqABrDEsMYFSp0FQjWPpcfGgK3Q/PxsBMSX
 8Jmq9yvY57ollMY4fCAYcwyOwjhEMunqxHcBu8Wr82qzmAo9JqzDxOTRcSid+DfcJvmtiKyoc
 QOhlKq9AfitbRTupbfoSQU9T182wf3pOGzqMGxHFA1A8g2kmxJ3A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0qqv-1q1FFK0qbF-00wSUQ; Mon, 24
 Jul 2023 09:40:15 +0200
Message-ID: <67b16362-aace-28e3-6776-aefdeab0f183@web.de>
Date: Mon, 24 Jul 2023 09:40:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [ v4 1/3] staging: rtl8723bs: Fix space issues
Content-Language: en-GB
To: =?UTF-8?Q?Franziska_N=c3=a4pelt?= <franziska.naepelt@googlemail.com>,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Emily Peri <eperi1024@gmail.com>,
 Guo Zihua <guozihua@huawei.com>, Hans de Goede <hdegoede@redhat.com>,
 Kang Minchul <tegongkang@gmail.com>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
 <4b9fdaa7-bdcf-ef41-0d54-ba41520cde4c@web.de>
 <CAAUT3iPUaNRUyvqP1O97M0AmKri7Ghc06ku4TS6vcHQ=Sb4ycg@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAAUT3iPUaNRUyvqP1O97M0AmKri7Ghc06ku4TS6vcHQ=Sb4ycg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D0ezGEUZ3+rarCnJeuGUNteQxHldFSHEU4ymC3BJmYg4EG1mVVs
 8fGMmwOAA46dHkL10C2E7XslTE7iUSDkiep2+xVWGMU/Avf1N1y4oVzNfrM6gt+VrJMkoVj
 dUWfTgrr00jnkJY/TV0vPyHh/DEwCxYBFGXQIlnLHyqAhs288ujuRf9RyW0Dx5ipsnU7exV
 yd9n1dw0AD1U/HE14p72w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KR9lAgq7B6g=;DuRHTl88uu1RUtQPB+rppuXYoUV
 BTsg3bCXS/ivRISHeEZnBW0jXn9sxsCocWy7D55iQWoeCQ6xX8dmlJEn5Efq52zRSLA9MU6LZ
 XTiibgNc5QPPiXAoVNYJ2P7yPAvy1o9x7a+1/c6XFjK0cTqqEuQHpzJ7WkwokyT1nD7Hcb1s+
 DGRMtICo+SXAjBvNkNPTe6KzTt9K2Du4j/H3ClQY+Wj8ZwRTRFJfSbkoRSnHzUNaHKB380ou5
 HacbArYsFwh0ktkPbq7aoc1rKYF3U+wL+fScgSsNxLCmoorXKaiUWDva+oFTt68RbUfY8Lt5R
 SxHYvBugfrwN4STWuWTxC4B3wdb3VdIdX4/xoo6gfFeYgWmv2yIToAp5XDP4JF9ZKCZ0REQZi
 aQ7Q112CVsNqNd0vcJ1McYddYCX/8/XBlOxVB3eNSs4SwNPiR5EgKlcHrvAkkBGupcgfZiHwM
 0ek6vvkXmpGZ0rHvCgGefMIj7VUm1LX9WDlEMecgx4ktC681xbg2Tj50H2i0jGk2eUPaH8grM
 t7KUMTJxiAHB/yvQyauVpVSOLkXlKZnJrhIZ43d5x7Cnq0UqPgybq/Sek3KSIyvpIgg061lei
 nPGg9s8jIp9G4HYecKxz12nqK1oLH3qopvngmUyTF1wC6Ag1OddVteCqcOfCp/wAYQfC82Exe
 V1Q8P6KhDidW5knr+uIcK1pDWFAXSvuSh42m7+JpmJuB1oqXzSkFpzDpujtznm9nEsIjp/5WZ
 Y/cNlZSqDEpzflFL3D3tRj5tqquHk9NK4G6wIPDWivXQOoAMCChV7jwAhAUY8HyS3mLn1x354
 onufVZIu7jfUqgEHOD+3V9xT+AFk9urZkFZ6oR4G83mOa5wd2lcX4Dw+VrxnwYumzcbjRafRj
 TJ4+cUdMDAKQ9uendGzV8ukIodu0eN+3q0DPV+hgTvrTCniwdmgkGdegnm/FsQjLQgI/AeGiC
 cXFgyA==

> I'm just struggling to know what I'm supposed to do when the maintainer
> is saying somebody's comments are not helpful.

I suggest to take another look at the circumstances and corresponding
background information.
I would appreciate if the involved communication factors can be reconsider=
ed
any more.

Which impressions do you get from my previous contributions so far?

Example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=
=3Dgrep&q=3DElfring


I imagine that my recent review comments can eventually influence
the =E2=80=9Cbeautification=E2=80=9D another bit for subsequent patches.

Regards,
Markus
