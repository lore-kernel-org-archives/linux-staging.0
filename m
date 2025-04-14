Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB01A2632;
	Mon, 14 Apr 2025 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622284; cv=none; b=b+Hl5wyWgjbnumeE6Cs5jdeEpiP+CBzG9GBey43FrzV9l6xtsiuVI3NOYDDRB/f1g08Hjl61IxcFRicdMg7kcko5j315hwBAjPBeeDSMW6v88ficaJNv9npDpsMNPHatimbF8251uufRyZ1pj+hIff+sMPXgBi/nPqkd9n8hPYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622284; c=relaxed/simple;
	bh=nWGWz7gx3wRO7wvWED8anmkf11j/4oJGFor3onQDvV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZGXWGQCoJrXg+5IxgYDqnB/hBhsUSCGb+vbKOduxLHfFqhm4PN7G1oEdnl9NXjvdDeSIhOyHRWulrE9S0rteTBRIeBAqrL+0QN38szjRKHBSRJmy/pZO2yUfyis6yMnfuZG4o09ftCSE80K4BQRgLzCxfDFy0qJS4gJ5bdgkIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIRO9iCJ; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIRO9iCJ"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso4603538e0c.1;
        Mon, 14 Apr 2025 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744622282; x=1745227082; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej/M8tGd0QF3qMptwCllDvUV1oGCDzjxoGAMImfkRz4=;
        b=ZIRO9iCJUo3NNo4GcyiGRBVd0Vwb0WaqFgWWoNPScu98HZhTQY4kLbrsX/rHk50v4s
         1PbXI79dA7nXygDpka84Eh7oJtbyIYwT0zCfeRYp4EIELT7zc7QvHJJAXPKdb7dMvo8I
         VevxkRdVOMc5z88SqkyNA/UWO1DSuiBZg465dGt+wvPlrjU6IY6FLYWCg8rzWj46kEbn
         YVwlADiCFfKlyAfWf9HcrjGPWy74fHuoRg64MiAAiGoS/+5JKj9j5LUmYwVAL6i6/UVk
         O/4Ur29ynKleWB0LbvS15vvS8HnIurlN1rRVN0qkuZUYsscTM8tnh8ziAnUi+9suqNbE
         chIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744622282; x=1745227082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej/M8tGd0QF3qMptwCllDvUV1oGCDzjxoGAMImfkRz4=;
        b=OCaasIQRf9CLZ1WdX/NqYwnlOXUv5veOUn30iaHiwyQ9vWERD56Vz5kmQZZ+nbUOJ2
         PiL159E8L7mqPNCY+J6+5T35I75PdPmIRZ5vBe6MzEhvNITWQzIH+z1PqKog0gA1VJW3
         PHHQqHF1mrYTeXWfK9NLEL0GmfL5GJ2ehC/W/mWhd67MBLnQO93w+vDaJpKH7/QkJW+A
         Bge5G8APR9wb1rbm3Je28jbeguCpRxziXv65iJ/bQYp5YVpZbai+16IyrC3eYWVNz1t1
         /aLxAuPML2To+uSp/F7nTP0d0lpTznSqZA0vtE+Kmmx93iClFFS7kiYm2Jr3HVPtyk7p
         axew==
X-Forwarded-Encrypted: i=1; AJvYcCX1cRL8DxPm9KraXnHRV3vDQNdCUe34O7bgCCt/mzMNWI8DD4lMO269RuD2a7nATstQzNolYs6ApU85mGWy@lists.linux.dev
X-Gm-Message-State: AOJu0YwvP7FEa0oQ8MOulYc1+1nAhVtGgezL5diaPaYKy0PXE39chBkv
	wwkTRR7Sc8I/tovQ+qFlioEie0U7DdQqAAdmrdyCsn5yh7vQ/xW3lNs/JWbk1ObDKM3E8qUaqwS
	oPmS6PhaovEKcOdDWbmnzfyeqZw8=
X-Gm-Gg: ASbGncugRN9pYH5/5USEhAhIVPVeQHCBTcO7Qw55HGXe5SMef02k1wknYZsAHvyvAYu
	tBOC5I+BrA6cM8ERSeahsJQI9o60AGoEuNW5P44hGFW8sDhC/vqwKkC7zWcvK+eqrViqL7U+2LO
	bQ4AMZb86Zvav35cNUD+OQg1s=
X-Google-Smtp-Source: AGHT+IFQC6uuZ40TbQruHZdr0nq6Hod3dCu0XOoxZQmsT4eU4wt7n2uRkotT254vBWuU82O70uQzN043EhH3URbaaPY=
X-Received: by 2002:a05:6122:a15:b0:520:98ec:b25c with SMTP id
 71dfb90a1353d-527c34834f0mr6737922e0c.1.1744622281568; Mon, 14 Apr 2025
 02:18:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <2025041402-colonize-rocker-1db1@gregkh>
 <CADYq+fa18G25hfTeWTxwyxc+A=xHmk_je_9kjWbDdwbo0seaZQ@mail.gmail.com> <2025041448-destiny-hate-1b70@gregkh>
In-Reply-To: <2025041448-destiny-hate-1b70@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 14 Apr 2025 10:17:52 +0100
X-Gm-Features: ATxdqUHLCxLwd47Na9H9cZWxhOVPBk_GxKooGFaEgRvTGglaeptpiBNOUZCNAvQ
Message-ID: <CADYq+faNzo5+V3sGzLozK-vi7MYgr4ho8EUivXzM-Cq7ypFhzA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, dan.carpenter@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:00=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Apr 14, 2025 at 08:38:53AM +0100, Samuel Abraham wrote:
> > On Mon, Apr 14, 2025 at 8:23=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Wed, Apr 09, 2025 at 06:48:02PM +0000, Abraham Samuel Adekunle wro=
te:
> > > > The sequence number is constrained to a range of [0, 4095], which
> > > > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > > > used to perform this wrap-around. While this is functionally correc=
t,
> > > > it obscures the intended semantic of a 4096-based wrap.
> > > >
> > > > Using a modulo operation `% 4096u` makes the wrap-around logic
> > > > explicit and easier to understand. It clearly signals that the
> > > > sequence number cycles through a range of 4096 values.
> > > > It also makes the code robust against potential changes of the 4096
> > > > upper limit, especially when it becomes a non power-of-2 value whil=
e
> > > > the AND(&) works solely for power-of-2 values.
> > > >
> > > > The use of `% 4096u` also guarantees that the modulo operation is
> > > > performed with unsigned arithmetic, preventing potential issues wit=
h
> > > > the signed types.
> > > >
> > > > Found by Coccinelle.
> > > >
> > > > Suggested by Andy Shevchenko <andy@kernel.org>
> > > > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com=
>
> > > > ---
> > > > Coccinelle semantic patch used to find cases:
> > > > @@
> > > > expression e;
> > > >
> > > > @@
> > > > * e & 0xfff
> > > >
> > > > To ensure this change does not affect the functional
> > > > behaviour, I compared the generated object files before and
> > > > after the change using the `cmp` which compares the two
> > > > object files byte by byte as shown below:
> > > >
> > > > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > > > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> > > >
> > > > No differences were found in the output, confirming that the
> > > > change does not alter the compiled output.
> > >
> > > This is version 11, right?  What happened to the list of previous
> > > versions and what changed down here?
> > >
> > > confused,
> >
> > Hello Greg,
> >
> > I collapsed this patch to the previous patchset I had worked on that
> > made the same changes to the same driver.
> > So this patch was collapsed into PATCH v10, which is the last version
> > for this change.
> >
> > The change log in "[PATCH v10 0/2] staging: rtl8723bs: Improve
> > readability and clarity of sequence number wrapping" explains this.
> > This patch was collapsed into patch 2 of this patchset.
>
> Think about it from my side.  I get hundreds of patches each day to
> review.  If I see a v10 and then a patch with no version at all, what am
> I supposed to do?  I would assume something went really wrong and just
> delete this "obviously old" version as it would have been the first
> version of the patch, especially as there was no version information
> below the --- line.
>
> So, what would you do in my situation?  What would you want to see if
> you were in my situation?
>
> thanks,

I am so sorry for causing this confusion. It was not intended.
PATCH v9 was the last patchset which had all the recommended changes
implemented.

Later on, I proceeded to check for more cases in the codebase so I
could make the same change.
I then saw more changes and sent the patch independently (Which is
where I made the mistake).
However, it was suggested that since this new patch was making the
same change in the same driver as PATCH v9,
I should incorporate it into the initial change. This was why I
collapsed the change and made PATCH v10.

I'm sorry once again.

Adekunle.
