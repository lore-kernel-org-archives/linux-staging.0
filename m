Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E0110A1F;
	Fri,  4 Apr 2025 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754758; cv=none; b=EhN3nE1EEx0RbV504tET0uMXLjD2Kp6CsuamgIoMJTP1Sr3sfIpdB+vy1RU5q4QPk8Q6CRmG201nhaEVUYjgD/v29gVQ89rmHi3OenMhZ/TWtTllDZ4D+VZPEQcZkp2HQRGgPH+5kxFyAOzK71h/fJt38Q/B5mFxSTLtH0UB7Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754758; c=relaxed/simple;
	bh=UnTiiwGjll352fuy38kYNHOtcgzcSSL7sIaeSAESYPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTAAO73mdryrWgdX3slPB9q7OdDthYtkvqFvBIufe/Ti0rTKfY/fyue9Hpl9ghWdnQL3LhEx831yIaeD5fj3ik6FUfu9bnU+yNFVtLqR/nvPxFVFvuBUdvggmgYhTz5/yTkZGAwCPn4ElOmMTn+s8FXGW5iW+rt3LKknq9HliNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgWgFvv4; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgWgFvv4"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52446b21cfdso814951e0c.1;
        Fri, 04 Apr 2025 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743754756; x=1744359556; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnTiiwGjll352fuy38kYNHOtcgzcSSL7sIaeSAESYPg=;
        b=YgWgFvv47Og/SPieTp/sx/GVzAy3mNcyUlziIHhQJvtT/JlDCcnNLPCy+Onzv8fN9t
         mw+K5750/BculhKC31qay4JKa9OTMai+anCCMkKauroj+hZDLV3kkfuXTavtKc5KpJ+a
         0RP+m0q7dcBN25WjoQbzqNKjFqkXMpmZKWz19mxqaivl+DL8IZKc6PYpHz0d8mYhBwdY
         pWBv4YS0A5ZN9aqVFPZNxRfOoMiE0pRufT15ZD2mgA1cywsktk/NnJK7z1auLLlyoE7g
         RqGafbvrIQBaXRhohJ3v3GgYCnZJnxxp4yMOUkuQiGhLVCJZx4eEkPmwxJVdAl2oY8AX
         k8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754756; x=1744359556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnTiiwGjll352fuy38kYNHOtcgzcSSL7sIaeSAESYPg=;
        b=r/x0NjsUtWCJVBmGEK6Jvi2Fat26PxynkHsRoUArhV/tL2ZWlBfRYTgy2fciEE5gsK
         EwXItjx1G5o+WHRXjl8aPj9WkL2FX7UNz8+ybZg2XmQNzdwO22r+4Sx1bjC/SBQNjNLP
         fm5QE7qdoLjWtD6lwmsEY6rJHxC2lYM3RqGGMSmHP79xxO2c2eOoXTPrG3g1oZ8rKq9t
         zXyFtkFgFUOIxAogdIj7TNwBv+aQ07RMycAEyKPVqs6mARrY6N3V0wsv7j/s2gQzlZxL
         5jzfE0RpDkPzuvF0zbee+GMf4FGPVVRH6HQrtzzwx4Mw758PbGt12XF+/qzJ3myij0K9
         Z6fw==
X-Forwarded-Encrypted: i=1; AJvYcCUPVl8wGLYOLzg/gqpr57bvlGhqZL0O74if3loPrif1MiOmKj0WCJrVrC1/4VgpXzIsCeVppcSDDZMlyfK7@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2rz67sn/f7wPYql23GnramTZEI0Ue9QAtPSk3fAQUIaVtdGGn
	pAYw5R3eWAQBaC224cibqe6py8iwolSe/+AdT8dWh7Ke7YpQEzRsexFlKk82W6kVfonbb3lUjNf
	UyL8cBWPvDx5jJzjf5B9u8RcTrwc=
X-Gm-Gg: ASbGncs2fKgbuBgaLNsb1zMoJYwarbhGajHpCXsnFR20CumYn+EGLRwo9nEkncAiFn2
	sWT6hHKLC5sP2OgTR9Lc1ib5qq+Fa7vXrJXlZkOVPULktoMGuvVUOKxz6Cdly/fLVjSAHPEnC5a
	dhvR87pxS2LIos1nHwZ2BLSxHyh7I=
X-Google-Smtp-Source: AGHT+IFtxDYsRzMSKIc0QCc2Y4WfE9Tca88AVoywoddO6xi4dtlJ7EOtWaoyu+KewXUs2h26omegK7hRdmOiZNaja88=
X-Received: by 2002:a05:6122:310c:b0:523:bf8b:5dc3 with SMTP id
 71dfb90a1353d-52765d6768dmr952043e0c.9.1743754755827; Fri, 04 Apr 2025
 01:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z++PnxFQFe+IexUi@HP-650> <2025040401-disobey-flop-d7be@gregkh>
In-Reply-To: <2025040401-disobey-flop-d7be@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 09:19:07 +0100
X-Gm-Features: ATxdqUHq9-HuOR2QpkWmZ8t-cvxT2IgQ9oi2XQCgWFCc9Q8h14HfRxpSyInJV-s
Message-ID: <CADYq+fa6veOHnQTuAh+rK03_UNR=_k19UsnwV9-vkJs8Bu34DQ@mail.gmail.com>
Subject: Re: [v4] staging: rtl8723bs: modify struct field to use standard bool type
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 9:01=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Apr 04, 2025 at 08:51:59AM +0100, Abraham Samuel Adekunle wrote:
> > The struct sta_info field ieee8021x_blocked uses the uint values
> > 0 and 1 to represent false and true values respectively.
>
> Nit, you don't say "PATCH" in the subject line, why not?

Argh, Sorry
>
> >
> > Convert cases to use the bool type instead to ensure consistency
> > with other parts of the containing code where true or false have
> > been used.
> >
> > This change causes the struct field to change size from a 32bit to
> > an 8bit. However, the change is safe to make because the sta_info
> > struct is not read from the hardware.
> >
> > reported by Coccinelle:
>
> Shouldn't something come after a ":"?
I meant a "."
I will correct and resend it. Thank you

Adekunle
