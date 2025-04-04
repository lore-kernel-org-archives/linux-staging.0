Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171011B0434;
	Fri,  4 Apr 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743761645; cv=none; b=GmoHT3nq+NyU+Rvzkd1QOgX9z6UzdueeEWTWQ8IJcuEs1qUngUCX2e9+Ri//cA8jrUCJCh2NHMWqNP7XJXKE8V6hLU7y7olwSQETjo6sI4Q9y8lvtxscAk3xGQYZLTAQZi24QEZnRQG6VcPByv3hTc9ycQuMSo6AQ2q4dPM3HyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743761645; c=relaxed/simple;
	bh=M1xR/ehUTlCqt5flnpbVHWZfT9TJ+6ACGN3OWuyHfIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLIIF1LJhJUKVfy9sxTHnWn7VPwJlb5WObvRoC83o5Y5rhEpqpCN8+DCGCNQQZXXYufNp/uRbfQirmo+K7c3t+eweiLmo5FiJivdY+zOjnSDDkXI7MGulFpf/Pxz35RtNx/R5CegxFBYYv9WCtvvpFQyLET91SN7VrF/x1QmbuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5ll6N4p; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5ll6N4p"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-525b44b7720so882626e0c.0;
        Fri, 04 Apr 2025 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743761643; x=1744366443; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6kQX7J4iPqcH4qqAuoXo8W2m8I6TgoA5VFu2BQ2/J4=;
        b=S5ll6N4p59lqo2XJ6s2n++0WPdRfxn7d1H+urO77yCHiyg9HqAKInb+vjstZpDqzAk
         RBye560cowfNQ9Q49aBaK/TAUCaZjQQRcSissYeU9ObB0uwqVaaY37Im55p8M9KQ7lE7
         hLlchpGAmfouxqoBM4GQAkBFcR3B97FIpCpBNkqISyhyVsn0juZalCmNzc2VN4af9kd5
         qHPJHyLOSY1rTwejaquqwiOxqiLNkclW4r+uCkxnOLyWDN0LrXI2N1N9iZqI8F7+fM2/
         30O+fLttaa6zF6qhgcUh3ufkeh2rFRqikgN9cVhG54AOvY1U5yMmX5SgxV/ueGTlHHf1
         qabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761643; x=1744366443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6kQX7J4iPqcH4qqAuoXo8W2m8I6TgoA5VFu2BQ2/J4=;
        b=fWKHpN5aXU6NB45LzsOq0fZyejmhsmVl+vODSrTUHDhtnTPZeD/pWHfy+kTUxSwQ08
         dsh5/c8BqnbrhkiAENDd1SEeZTrdQkJrQYxi/GybgH/yAHumYqGQ7zDZLr+fzzVFr7zU
         eOiHw+yy34na8IGwOnnv2gUqABLopH0qCN1IyQSA4nL/JZwl07DecR9tFSOZdm+Sjt2B
         0xWXLU6w+D4A5JrGXT74J9T1qaN8ztgco5fHx2TSFRD/Z/c1mb+80uKl9kRxt0kkoLaB
         4gK1Cg08MRFmGs7FcdObonuoaQE1aU7bcpe9d5egmt5fYZcQkQ9adzeO92VRFQuVXjog
         0CgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6l7ayEZB/brNynxW8EU/72rhgeFcEm7FsprcytaNw41EfbLrGEMbvx5KSxgzS9u1VeTBYtnuYrQ5IDrXN@lists.linux.dev, AJvYcCWQz+daX0kwjumfnh/dL83ssrAOqh0Ftg2W1AhqbmSsIbjy5OfLartRdwQKM/WBxIxXy38oPJ9H2gur@lists.linux.dev
X-Gm-Message-State: AOJu0YwEBL2RHEFB7kjVblH+PKV/FEpfppEN9Ogc//e4ocSsfAIobjSR
	3DNsVKKD38NfBTIeKYtRCwt2kd62SXrG9f+o76L7xtqK7qnFuF59Pv25qs7kc4D1ptNsS3OhNWi
	oGbj8sQiGFB8WdxzZItHevUetITs=
X-Gm-Gg: ASbGncvQ8vtyBt0nskmFsd13WhzNMWSaXLTVyloJT4Uy5AcYodGZHi27AVmIR5vWEhd
	IkThx+BNu/l7fXd5ABc0PQGNv1UHV2XnVXodwZ4PO5zSaKis36QfxojFYBmR2WsNCU5Mm/S7pj4
	L+4KXPRzyMrKSk2tnbrC3g6U6+a0S91Lhk4vXr9A==
X-Google-Smtp-Source: AGHT+IGHJ+mgde1bUNXVhTgyaQjWuFJcTsikHax7jYFsftnczff4N6TcT+1V1i3kwufL5PXiMgJCDcJcyRn2L3U7q74=
X-Received: by 2002:a05:6122:886:b0:516:18cd:c1fc with SMTP id
 71dfb90a1353d-5276458254amr1626212e0c.8.1743761642817; Fri, 04 Apr 2025
 03:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com> <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
In-Reply-To: <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 11:13:54 +0100
X-Gm-Features: ATxdqUHTYgCeSt-ecqfOsTN05l_d53aRnie6hB7s9Rdi_fEEr2uHtQiBk9h1w2E
Message-ID: <CADYq+fYKHsZCBN-z4ogcnAC_gK7i0P1=DHbfm=AC8o-uSUQ-7g@mail.gmail.com>
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 10:06=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Fri, Apr 04, 2025 at 10:53:22AM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 4, 2025 at 3:03=E2=80=AFAM Abraham Samuel Adekunle
> > <abrahamadekunle50@gmail.com> wrote:
> > >
> > > When a value has been tested for NULL in an expression, a
> > > second NULL test on the same value in another expression
> > > is unnecessary when the value has not been assigned NULL.
> > >
> > > Remove unnecessary duplicate NULL tests on the same value that
> > > has previously been NULL tested.
> > >
> > > Found by Coccinelle.
> >
> > ...
> >
> > > +                       psta->sta_xmitpriv.txseq_tid[pattrib->priorit=
y] &=3D 0xFFF;
> >
> > > +                                       psta->BA_starting_seqctrl[pat=
trib->priority & 0x0f] =3D
> > > +                                               (tx_seq + 1) & 0xfff;
> >
> > > +                                       psta->BA_starting_seqctrl[pat=
trib->priority & 0x0f] =3D
> > > +                                               (pattrib->seqnum + 1)=
 % 4096;
> >
> > Logically it's obvious that you need to align all cases to have
> > consistent approach.
> > Besides that the commit message should mention this change. Something l=
ike this
> > "While at it, convert '& 0xfff' cases to use modulo operator and
> > decimal number to make the upper limit visible and clear what the
> > semantic of it is."
>
> No, I'm sorry but that's really against the rules in drivers/staging.
> Don't mix unrelated changes into a patch.  It needs to be done as a
> separate patch if we're going to do that.
>
> To be honest, I don't even want people fixing line length issues or
> adding spaces.  I would have accepted small white space changes but I
> prefered the v2 version of this patch.  Once you start changing
> "& 0xfff" to "% 4096" that's not white space and it must be done
> in a separate patch. I use a script to review white space patches
> because I'm always nervous someone will slip something malicious
> into 100+ lines of reformated code.  It's really fast to review
> patches with my script but once people start mixing things in then
> it's a headache for me.
>
> Also if the change accidentally introduces a bug, I want it to be a
> one liner change and not something hidden inside a giant reformat.
>
> regards,
> dan carpenter

Hello Dan,
Thank you for your review.
Please can you provide some guidance on what the next steps should be for m=
e
as regards the patch?
Thank you.

Adekunle
