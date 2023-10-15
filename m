Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D38D79D0
	for <linux-staging@lists.linux.dev>; Sun, 15 Oct 2023 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhuAe07A"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9b0f27dea5so2188235276.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Oct 2023 09:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697387156; x=1697991956; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQgMATkq2MXd1DlYkpDG2LW0MTByZbFoPNJaperpgo0=;
        b=DhuAe07AMQU3JGvJcyWmotJAuo+uZMgxw2/Xnu/x9Q61dqSzJkOodKMU1yJfeNHe97
         R7UOETvk0LVQV6k//HfHjsgKjf9WXCRFR2lSppf3kElNFqs+A2mphw6gXmMV/+0AFYhy
         +TJyaZ+v5/8MLjr1UtDq61HVQc9ZshgDQ+T4FPxiKK39/J43nU83NUbskJfg1Nwf1iYU
         f9z2oRK8hd2ZbnB8QAzRXTiPGDZgNWtYRxvtzGgWq18OVVmcld3ZmKxMd3adJ1jovsiW
         oe4iw5P8l5HRzb1623dwsCxpcIy2jjF3CuHjXEsIEHDdeiSOq342z20gNJsbzlthLDDv
         1aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697387156; x=1697991956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQgMATkq2MXd1DlYkpDG2LW0MTByZbFoPNJaperpgo0=;
        b=kryfwuYr99AOP2BPAJf9Z+Axvn+jpa/goD8PtsljKtb8YpwDca8dvFowaxhAM27K/N
         g8vZURsAU2dg+FNZTzZdsHsF/nNq6vg5GP3B6krJFQDdhOgMmjd/Dk7Mst0/GT+ESbLh
         8/gXYFw3R5WVgt/SgUusOIHJv/hwIbt1jhS5Q4yAothU/UJM6xO17fVVpt3U2YGlTlp4
         a72m95vtApf1SJX1TIpY+NVgqhPUhf6gqwZSEo87jVjmZZd0zZZ2ozPKgcIC+JPxsHhh
         pEDeuZJD+CToEVPU9S9B+C7CH0S7unsZjJlAdGMNa7LDpVXxMyw6LM78nVJ8qcbFSAyW
         DXbg==
X-Gm-Message-State: AOJu0YwBSNQlRU/DBK+OtwRF6iXIn9clCO4e92VS2SfwOBpv1JLFF7op
	OHYavGTt8fwHBDqmWE9HKMXOAJ57wsV2j7D+SXo=
X-Google-Smtp-Source: AGHT+IF2qK86/Tj2siScr/Uc46MXzSA5b3f1wkhIahR7xLgOtlmNztNqesmjUDm0ChPyIlSFdcpP9Hd3mqMHPjbkhac=
X-Received: by 2002:a25:4608:0:b0:d6b:1531:bc6d with SMTP id
 t8-20020a254608000000b00d6b1531bc6dmr26012732yba.30.1697387156142; Sun, 15
 Oct 2023 09:25:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231013002944.14607-1-edson.drosdeck@gmail.com> <2023101548-catalyze-employed-a617@gregkh>
In-Reply-To: <2023101548-catalyze-employed-a617@gregkh>
From: edson drosdeck <edson.drosdeck@gmail.com>
Date: Sun, 15 Oct 2023 13:35:47 -0300
Message-ID: <CAMSsBRzKnrQivTPD3zN555-gtAfKjt4ZKM0D0+BbU6TjSqHzpw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Remove unnecessary bracks
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net, ruanjinjie@huawei.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback.


Em dom., 15 de out. de 2023 =C3=A0s 13:19, Greg KH
<gregkh@linuxfoundation.org> escreveu:
>
> On Thu, Oct 12, 2023 at 09:29:44PM -0300, Edson Juliano Drosdeck wrote:
> > Warning found by checkpatch.pl script.Remove bracks than are not necess=
ary for
> > a single statement blocks in hal/odm.c
>
> "bracks"?  I think it is called "brackets", right?
>
> thanks,
>
> greg k-h
