Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9C7C
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 15:27:43 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-5ed99ebe076so27864516d6.2
        for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1685287662; x=1687879662;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HageycISbSSx1UO8biOw9yDuyV183bJnOZAqf4f2IBo=;
        b=N2Q3HAR5hu05Fr3VKHJjxtu4xCZtgsQ77PxLBv+AvKnFLiGBzwYrsFj+6NpiNGMFN3
         ZhODuC+ls8jGmlHj929+4A7dAewHqaDiULvT4nRxHa/sBQaZii27niMZdHBZd6ec4O9g
         dxJxONiEdi3MnX7/LlA7vctIy8janQiZBfCChXxvoxYnOipaxwDKKm+D9MxWaCJ5bph3
         XhQzVagi3qksPhfgoklAkFM6eykb86ZxDD0kofUAVv1wW9Zs8SOi1Z/zj5pFAuf8SFUc
         UY/PECnnyGgTJJhbXZ3BtBQl+kSl5cZqLNz33rHDCJco1NnxIyVCb2X2CnnMRg1BbWvk
         1ABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685287662; x=1687879662;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HageycISbSSx1UO8biOw9yDuyV183bJnOZAqf4f2IBo=;
        b=K0BNUrxR6bnQcM8GhvDu8hutaoq7XCI4TGB29EwaL59zGMyMELm+JE9vKfzZckbsKk
         d2t7ui2w/ivJMR04NSWP+sCmFrX92KsvGbWoeyeniNYisIY1l+uidpj/2ZRE2fqd/h7D
         YLPEv6g9/66birpFhEBX6vbsX6XtRg/U2Wp8gTv3j0P1nMcxoE0ujatU1MEichTJ3eyV
         mbUl0GrSd/nU2j0XuqENtQHpGSL+bbOuQUKi4kilyOimEq+VP2tEM+H1O4bNocr+2K8O
         urGVLpL5KO4JUZ4vxRHxHjZdumpEZJiDokqjuws3uGYTPPHLh1oKcl94RhE9YXoBYe8g
         Mf+Q==
X-Gm-Message-State: AC+VfDysw/5IUggOhqll9MuDtpE8OkqjGi8CriatLthbcSzrnFiHnbSP
	39iYlzzq6gZjZxJ/LlQPkHhH8A==
X-Google-Smtp-Source: ACHHUZ5dWlq2uk1j1aFHgK9e9qvV97x9ixaOX8Pm9TynMA1mR1PWkW4cN7JTRYDDieQFdJ2iqNbDCA==
X-Received: by 2002:a05:6214:2242:b0:5f1:606b:a9c8 with SMTP id c2-20020a056214224200b005f1606ba9c8mr9332307qvc.22.1685287662428;
        Sun, 28 May 2023 08:27:42 -0700 (PDT)
Received: from smtpclient.apple ([2804:14c:63:8ae3:1d73:c16f:91db:4626])
        by smtp.gmail.com with ESMTPSA id q2-20020a0cfa02000000b00621623264a8sm2944202qvn.35.2023.05.28.08.27.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 May 2023 08:27:41 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH] staging: rtl8192e: Fix BRACES warning
From: David de Barros Tadokoro <davidbtadokoro@usp.br>
In-Reply-To: <2023052830-steep-runway-fceb@gregkh>
Date: Sun, 28 May 2023 12:27:38 -0300
Cc: linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <80495326-3EB0-4AE3-A328-D93BB9109AD0@usp.br>
References: <20230524040051.235250-1-davidbtadokoro@usp.br>
 <2023052830-steep-runway-fceb@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.120.41.1.2)

> On 28 May 2023, at 06:10, Greg KH <gregkh@linuxfoundation.org> wrote:
>=20
> On Wed, May 24, 2023 at 01:00:51AM -0300, David Tadokoro wrote:
>> Fix checkpatch warning "braces {} are not necessary for single =
statement
>> blocks".
>=20
> Why do you have "BRACES" in the subject line as all caps?  Where did
> that term come from?
>=20
> No need to shout :)
>=20
> thanks,
>=20
> greg k-h

Hi, Greg

Thanks so much for your feedback.

You are right, this commit message is horrible. I based it on
a previous commit that cleaned the same warning instead of writing a =
good commit message myself. Going to fix that.

Sorry for the mess ;)

Many regards,
David=
