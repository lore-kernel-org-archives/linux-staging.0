Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C494F3BED37
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053952; cv=pass; b=OUSh/cQnVhksBhLzC/gw9DvzdcMYBbC0sGSoTAA4eaj3gcbTARn3VooLGdYk03JDRNg8n1o/Cx/oeOO7jweFKv5cCt9ahreTNM3JRYry8mDKXj/GTnYG9g13iRqEFK6jTgKup5mDtttbQ1v2NFGdceL2CN914SSiUKMwB9j2/88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053952; c=relaxed/simple;
	bh=tyqn2TJnhheID9TGsq3UkYy69lM73UdL/LjKv+JJIrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUBHdQGVDrLtSXnNFVojYC7u+EmYehNaGZw2+WkdTWz3eOx5XHqDdjbqlOy+Cmt6AcKqtrriUagC+TGaJk+K1e+6BZ2nB75rPntLs73TyFuvggbM2X5nxmdUWhwIB4PMCr8bKkexEIGDH7TMRzIdR9rqaY19ZSZHZiIYN5ZyjaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=damVx3WD; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="damVx3WD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bdb3eb93e20so1407052466b.0
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 04:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780053949; cv=none;
        d=google.com; s=arc-20240605;
        b=DA21fKphtzDG8bHfraHqt+VSJQG46/9TA8xNlSSEh+Gjsgv9V3pJmMgNgXmS9fyc1T
         K37ywVy9PZ3thoTaOTJGSIrZPy1rbpACwtwfsliDfBZdkqyU/Ey6CEtq2hc42+0bTSt2
         Y3+l9DT9rX7Vs/uKaXhCBCAp4dKCvbxyydAXLH6/xYhcba4Y3EBRwscuvvujXwYvW+PK
         ysTNZPf7RA0vwECwJKwCDPeVKNbWzvmDtGjksR9xoMMkYm2BuFpXVLBCHd39L7j332nX
         TZmuPuRoedTgxmWLnxPvMHnmnYwrVoPQznktmr9UQXh5OOmzZJ5LMMv8HSbdbD5qqpFZ
         gV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cG6fNOfDYvWS7EdllG3W2X3vzmOug6Lzt00TaNQYnp0=;
        fh=p6RgwdoPpEWUjseNPWuEH134MThhgInzAWaohncQCLI=;
        b=IhyBb4ogbyTAAs9cHt6AC1tMuVwRgIDwkEL17RuJxKWyXJ0FCYjcXYBH9MYt3ugFcX
         MGBMfCwpVY8sroNT+LnU19hnJf5+Ami3/PubaYOE9Z5Nw9Q2bggfdqOZ3rSSK68KNrWc
         1HoQLviOlwtx321Ev8OAqFT6YRhv2T9zW4NjjjxJdx1JJxBKiL+F/IKI4EfUVX2rLJuS
         xcv01K3aKjGk9mzkohqJdUpQw0gN3m6HtHTE1iav/nq2yZBSkME8gCbF/Bt/bN6aQ/Uf
         FVWbuKsebxBTH9LE63nO5Z4hnYuzXPuVwRvw4/3dDE57nIVhLz4M/txwkfgN85VpU0Mq
         j58g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780053949; x=1780658749; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG6fNOfDYvWS7EdllG3W2X3vzmOug6Lzt00TaNQYnp0=;
        b=damVx3WD2X5JV5gXbUuUGns/06U6ipIuEHG2152FaR/cKzVW3IKf9wa5GQa5Nah1oF
         JyWnoAlwSvEfUjZaePBnu4P+c6IrENygsPIZpRbCJOjvy8M8vZLE9PvC+s706WXQq63a
         00gU9RX4kvZbPUtHuk5/v+q4Hggt/Lg3qOq7zv9hpJdOvmZnBUUVsCpnZ3UJZi4iXYf4
         Jvfno3jN62JIrO82Et5TbPQvQI4PYpqzyRlT6PFi0/rELHRyi5nzg1L3edpk8WweXV0e
         UctGnv2s0YcGUBIjU52oL2OHmfSvIQMTyiP7w9J9vSpnJoJ6hZVfK3SzYybNrSEd2mAM
         A0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053949; x=1780658749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cG6fNOfDYvWS7EdllG3W2X3vzmOug6Lzt00TaNQYnp0=;
        b=O6zuE5CTl/nNXCWDhlN5s+PNtXfWD023RMbLy8cZysUbc9s0mfZUmDIvD21QGwPGxj
         hKl44cXOzYJXA89eNBmsdJeJ/mrwq80FuY7ULh/FOyr3hTdUyOHzarkEXKWKA3ft73vt
         o4WRUGNIA3tSBRv4ehJvJF+YA2QrwwlQRf069vHBeLYk5bwxUR29wUcq5uOSCywT+hut
         I2qjelEgKVJqAPOMRQHr5PODRjAihwfdFveUQ1t2uIT7QB2tqwhA1VJT3xAqvosj5y9K
         82DOtx7A9uMFdDXb7UN0fGpc1mpMJ5mDipFfIT87+UK7/OXyUAm2SXYAT3VpI2zDby8B
         xK1A==
X-Forwarded-Encrypted: i=1; AFNElJ+mL973uJE2QnOuSL7cQbz1kpa3HKnOzZY340n6SYQOP79tUXETjfNMxmUwgB6b4Jt2iYl5EgsBBSTb6sX5@lists.linux.dev
X-Gm-Message-State: AOJu0Yym+UIOY0HRX48++SgpAzmD5/1R40wX3m5G19ijueS7H2N9hwE1
	mMNoUJQGrv23hvNFXxAjRpJFf8274QPMfsNguWEoCrCBLL5QklfVD5ack6oSRx0LDTCT0Qxvkrx
	b6h2lSxAw3vluaawByNzIMBeZYZ49g6A=
X-Gm-Gg: Acq92OEp31TTwlaFpPQJrQgOX8mJzSrGW59wK8T3GMgxLudMi5WYRle6KKc0L4pr9Dj
	YEiZmFoGrD+HtE4+a+S/uhvAoPDUiSQj8WEbZ1ae5srnbuDAlw+mOb9EyCzAOtf8Z9c+EvxsckF
	uBNmbyc+9v0pDlJvd73v2lWMdXh/J2QKR6Y1IKiy1CQ6IrE9lIblQ/payhzYet3RUn96Jq3VEJ1
	FHmOWKvXgDOlXq5zJ2ZpxkJV4VYQBo1sdbIh6lXgyOrE463Su9hwYkm7eikvROP2tFZlCrOsgkv
	X2h/RevYMORVS6hnPNwiokjQR/drcf8cK8K39jW3i6Eu62QmXvTpljgKeln5
X-Received: by 2002:a17:907:a0d3:b0:bdd:90b8:e39d with SMTP id
 a640c23a62f3a-be9c8e629a9mr130627866b.8.1780053949072; Fri, 29 May 2026
 04:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ahlXYIqzu4O5-u9J@stanley.mountain> <20260529101242.10189-1-neharora23587@gmail.com>
 <ahlszyY6Nd9ANz-X@stanley.mountain>
In-Reply-To: <ahlszyY6Nd9ANz-X@stanley.mountain>
From: neha arora <neharora23587@gmail.com>
Date: Fri, 29 May 2026 16:55:35 +0530
X-Gm-Features: AVHnY4JAyhUqKSCPhpw74ET3c-2bMb-3AMQcUCC_hgyap9vwciL2wDwwedMwBIQ
Message-ID: <CAOWJOpuS7poyE_cDB1xa_te_B_fT2+7zEJwv8hnM_UT1hH8fAw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: sm750fb: remove unused variable
To: Dan Carpenter <error27@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

After looking into the structural dependencies and the cross-casting
between init_status and initchip_param, I've decided that this
refactoring is outside the scope of what I want to work on at this
time.
Please feel free to drop my previous patch. I'm going to shift my
focus to other areas.

Regards,
Onish


On Fri, May 29, 2026 at 4:09=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Fri, May 29, 2026 at 03:42:42PM +0530, Onish Sharma wrote:
> > Remove the set_all_eng_off flag and its associated cleanup logic.
> > The variable is redundant as the hardware should be initialized to a
> > known state regardless of prior usage.
> >
> > Suggested-by: Dan Carpenter <error27@gmail.com>
> > Signed-off-by: Onish Sharma <neharora23587@gmail.com>
> > ---
>
> Sorry, miscommunication.  This breaks the driver.  This is also a bit
> more involved than I thought...
>
> There are two structs:
>
> struct init_status {
>         ushort power_mode;
>         /* below three clocks are in unit of MHZ*/
>         ushort chip_clk;
>         ushort mem_clk;
>         ushort master_clk;
>         ushort setAllEngOff;
>         ushort reset_memory;
> };
>
> And struct initchip_param.  The initchip_param is exactly the same but
> with all the struct members renamed and comments added.  They have to
> match because we cast back and forth.
>
> Why do we have two different struct that have to be the same?  You might
> think it is for API, but as near as I can see that is not the case.
> Maybe it was at some point?  We should get rid of one struct.  Which
> everyone is API is the one we should keep.  If neither is API then get
> rid of init_status and keep initchip_param.
>
> After that we can talk about getting rid of setAllEngOff/set_all_eng_off.
>
> regards,
> dan carpenter
>
