Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FA3FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 15:59:13 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id u14so20515763ejf.13
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6QaIFm64i7sSWcUtZ7j/D41OONg/HLxIveGkEJDQifw=;
        b=IocNyZyWqPtaJCAFm1GZacTlXb6mYB1QZ0+IYZnPzss9hi/oeTUKrQ+BWb2USe8ETV
         J2VZOBOPA/7sbCVkvnlYRQx6stI4zB5O/IMMdYTz5dP0vt40NVZfRav+UlVH1c36xCJb
         sHKrzacXzI8P3KwdR9xdibDIhKhl71zG+GJECxh2tsU5cSiz4UW+wXmKkFVoRtJ3bRdy
         MNMDb3NgQ72zXgktRznoCfdl/wIyAvVrd4nsWb+ccEoJnDKuWOiIVWJg5DdFnzTRLt+v
         GqYFKAEjcayCW5eUeHbSpRIEQCtfs7T0X0ZW74nQZGJBXbrFUwRiNoZ43Wi1yJonPQOa
         Pt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6QaIFm64i7sSWcUtZ7j/D41OONg/HLxIveGkEJDQifw=;
        b=kptC00j47yGH5QM2C7XXeKra1+6Wkkt+m4Jn5vI+V4UHTqj8qp4nubA0uzB4muMhDO
         Hupb6O2MsMabSj6v/H+j3kCTlFHACtHFeKipNdEU8Lx3MPTbCJb5mJuljlsKEUMU2fYo
         cewXLo6P7dxBvSfl4h0iG8xcmjh0o5qoXFAJwYj8RWyIQoXNGFfJF4zKHIilitj9ZcNB
         T1v63BUhRY8Bzw4Hj/rpXTuOwRCIOO76hYJQm1w/ukmjZ5GOvezVfzbWSiWn6X0zQRKP
         jlt4lBcWKAQg5cLtnLueniyKoIOvEiioVVoTqxahzRTbCkjsiw67MGr2mGzlKVWHNQ0Z
         p1gQ==
X-Gm-Message-State: AOAM532qCEh+b0R7O+RJ+lPJ9iw+vSzS1e26T0mDFG1ni4QhrwvP5ieY
	hZR7HbomAmo5axCPq79Cuhc=
X-Google-Smtp-Source: ABdhPJzyDE1j/hj8YWHAlD8Sbjeh34ShlpgUmykNkOStQ24BmViWcFnkq9u7Ottdmmm/30fGifHFIw==
X-Received: by 2002:a17:907:7da5:: with SMTP id oz37mr40309523ejc.396.1629820751850;
        Tue, 24 Aug 2021 08:59:11 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id ay20sm12086420edb.91.2021.08.24.08.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 08:59:11 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: Make some clean-ups in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 17:59:10 +0200
Message-ID: <1730935.6n1DRfr91A@localhost.localdomain>
In-Reply-To: <a5bfab84-16cc-52ad-5cdb-038765bf0b36@gmail.com>
References: <20210824142823.16845-1-fmdefrancesco@gmail.com> <2327592.S5L5zkRU50@localhost.localdomain> <a5bfab84-16cc-52ad-5cdb-038765bf0b36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 5:43:26 PM CEST Pavel Skripkin wrote:
> On 8/24/21 6:39 PM, Fabio M. De Francesco wrote:
> > Oh, I know where it comes from... :)
> > 
> > It's a patch of mine that is in the queue, waiting to be reviewed and applied.
> > Please see: https://lore.kernel.org/lkml/20210819221241.31987-1-fmdefrancesco@gmail.com/
> > 
> oh.... there are _a lot_ of pending changes :)
> 
> I guess, we need smth like public-mirror with already reviewed and 
> working changes

It's becoming a serious problem. A lot of times I see people who is asked to
rebase and resend, not because they forget to fetch the current tree, instead 
because the tree changes as soon as Greg start to apply the first patches in the
queue and the other patches at the end of the queue cannot be applied.

Anyway,I understand that Greg cannot apply a patch at a time soon after 
submission but in the while the queue grows larger and larger.

Regards,

Fabio

> With regards,
> Pavel Skripkin
> 




