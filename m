Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC773C0C;
	Fri, 28 Mar 2025 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175076; cv=none; b=DLJ1da1ZdZ++RHmmZBK6hZq35wATRxTi/mkqajbAeOn3dL5ssJfHPHy0JXRweyJbmezvCXgRHPtNtw4BvsPED/AicNe2+7z1ZunS3wtwSGUwpph+gyB/CcAn/fffPrb6H6C1eIo6gPR3PcRWXd3eE+qpIlWu3the23pxRlXZXas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175076; c=relaxed/simple;
	bh=jEhtVTn1QWFoySaUXbkHkCIjovKC7NhTpAQFfzMoxEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gc9C7Hq90apUSapcD+Edue/OXS0O6fKxdkHV7cunoLoRG8lRZEG30k9QuppsCweHf3I433z2Klpe6mjGUHyUjJuRGZdXyZmpLQ1nL7vWbl7iE3UhguDy241NaCVx1ZwNLwtYfQPV54/NEa1G7VDIdKZ2TlBHBkysTFuxzQ63rpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSf157Wq; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSf157Wq"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-524038ba657so2211428e0c.0;
        Fri, 28 Mar 2025 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743175074; x=1743779874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Jn0e09I6pw9OL2TVwRIfefTbq7C/d6a62JusO5U0Kc=;
        b=fSf157WqosNAFw/6KCK1UBzDGCLirfSQmDMImiNyi27ZpSj5ZEIlL9OSxFizMHHoJ/
         /qFE84QsaEVJ8QBWyx+Mj+PX1yAZOJf1HbCbevBsxiPBv2MCoE/OXAga5cKU98JLfq10
         IrKgsFe/gdNYvLlAAq0Hbu3kSoJY74FnM37GNM4x/yH3qJeS4gA9elae7BuKuB6DEdLq
         eNSAT6bLU+3NXIGP6IQ7BTj+UGejcFWP8gmGnhdQE6Yjpz+qYzVvQ3KdK6h0Xo4fSf3I
         VSiZudvMNyUOQW63jiEQcvi/SGU8IWVgo9ArR5yz9EEZbJgxXI3ysF+1ztgh55FZL8MB
         leMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175074; x=1743779874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Jn0e09I6pw9OL2TVwRIfefTbq7C/d6a62JusO5U0Kc=;
        b=VygaCEv6F6uotAx9YWXlE5pUd3vVmF1S/77LiMRW/u1KM4S958a86cEEGfpHqAL/Jv
         HnzRuwEuS+3f7SzGNwcjTqYTXNSHHCEZ7l+L3UyauqdCNVmIxorfx9W2sEE57Ga37lfz
         oUA8pMozAZ09shF8IP8Le6p9GQjXb+23t/eW6a0rYRpGW1KBD4YwlIwlVs4tgp3FzZwc
         y2Q/cFICmD1Vgi0BYZS1k1lNVkoxU57ePQmlNMfetEDzPckaJu8nPVW1tMdgaPRyU4U/
         u6XekXZekH0uTUsfsDvnaT8BEwnIXrhCGDFdCmI7k9SShZ9ou8FfMOGVaSWn44GKNbc4
         KUQw==
X-Forwarded-Encrypted: i=1; AJvYcCU70hpPTFwvelm4D2FipLzzaV0NCThfYOmE40DcreyjMr7t4mBRYoigqdIAJqwq6ETPVrgrcLaMIuOwcvcX@lists.linux.dev
X-Gm-Message-State: AOJu0YwxctIwNRs0eW8GKtowy3XnrH7FW5kTrQZXv0svlwMJXUlj8zMn
	lu47iBsuBnEn4IlM4e5M8QOUi07eIMZCN4eejjGBGiOVzw0J1e8YChwGjOIYTVBAreeJaN615se
	Iv8cqv9rIBJ5hZ+zh+7pbihQ95Yg=
X-Gm-Gg: ASbGncthGOfFJ7pgLZBDpFBXOfzElFZp/qsa6l5JJba+9eOcA5JOyjT3IwlAamvG2Jd
	lsG2FqoUG06dn65rx/ZUL0rd6uf0+W9KhZzpim6IGJ38Wpjlcwqo6i8xLJEjtgptGHxfkfamL/b
	jK6uO8FJJuMQRoZltRGHYNviw9kw8=
X-Google-Smtp-Source: AGHT+IEqrBEH5TDL81Y5j3ZIzOBqupeT+igPlWE2szhh0MEQKTWwtxcEL2xqXu4qp0Tz0FWhtqAPB67lgvSSjeeodZY=
X-Received: by 2002:a05:6122:889:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-52610fc715cmr2676350e0c.0.1743175073764; Fri, 28 Mar 2025
 08:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743163800.git.abrahamadekunle50@gmail.com>
 <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>
 <21e624e7-c18f-6aa2-2a16-7cd46e706d47@inria.fr> <CADYq+fZd=C-EydjBmkP6Rh6XAJS6Kg1nM7zGhyLrGYiLGkZ8mw@mail.gmail.com>
 <acd2df4b-6865-d2c0-7bc2-babcc930d03d@inria.fr>
In-Reply-To: <acd2df4b-6865-d2c0-7bc2-babcc930d03d@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 28 Mar 2025 16:17:44 +0100
X-Gm-Features: AQ5f1JoIf6U6Zu3AD1_fwccY3uYCCIVmv3RFHYcdBK_5pT0_ajsEDqFotfNCPoc
Message-ID: <CADYq+fY-UNbpWeefGuo_Y5OG98AQRu1=uZYu2cqpONOTpar4YA@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply
 with kernel naming convention
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 4:13=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr=
> wrote:
>
>
>
> On Fri, 28 Mar 2025, Samuel Abraham wrote:
>
> > On Fri, Mar 28, 2025 at 3:55=E2=80=AFPM Julia Lawall <julia.lawall@inri=
a.fr> wrote:
> > >
> > >
> > >
> > > On Fri, 28 Mar 2025, Abraham Samuel Adekunle wrote:
> > >
> > > > The variable names use the camelCase naming convention which is not=
 consistent
> > > > with Linux kernel naming convention.
> > > >
> > > > Modify the names to use snake_case in adherence to the Linux kernel=
 approved
> > > > naming convention for consistency with the codebase.
> > >
> > > There is another naming issue that checkpatch perhaps doesn't warn ab=
out
> > > which is the encoding of types in variable names.  You can see some
> > > variables with names that start with b for boolean and p for pointer.
> > > Those letters shouldn't be used in kernel code.
> > >
> > > julia
> >
> > Hello, and thank you very much for your review
> > Do I send that as a different standalone patch?
> > Or should I send a v2 after attaching the patch to the patchset?
>
> Perhaps find some different files than the ones affected by your patchset
> and send a standalone patch.
>
> julia

Okay noted.
Thanks

Adekunle.
