Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA51DF74F
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 23:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772927699; cv=pass; b=Tt6iOaDW6YkANXv+W7YQzxbiXZ1FCqmZNvlUH7y/qnuGd0e+9PPzkuzpITCjE/TcwFBjpYoL1QSncPmH4hQzeBpGN2v1CpUvXdk9D+Z3A9RcWEPC86uSLHrKSFYOlAgDjMzdJz59iCW27RNeApiW4NP9p9VfHuFxjAIsG7ByHro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772927699; c=relaxed/simple;
	bh=B7YZ8dYkC9FalzgGlMNozaLL3UdRqMw5OcQ+guvSNCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoFxtgW0BHjcd5YKdoGCqmr/UCWgnNPX3G4JdprGlW4WrJtEBtoJTsH7wZSbSVb3pPq2faF/9na0tXPohWT+FA+tGgGPmJpdahdNdNuRaC/n714C6sitzMIxLAK3Bl56tQ8gGir77uSudAawxB1ptumdfpfwRua/l/NVDWsbp+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Svpznv5J; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Svpznv5J"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso5110075a91.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 15:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772927697; cv=none;
        d=google.com; s=arc-20240605;
        b=BfvVWRDJ1TUWiv73Wia/qGu2GVub0s8mSKXjHA1axMfrrdGWqw8OEGyMqxSnznjnpu
         GGUqBPJAUx/qFwg83ChI50E4D+KGzBIQ99dOCRdze9SUUmDq7HaeowvxKkU/gj5sm4j3
         d71/gwWPgN+c9T7XWwDfJPd5fCcr8tJVoCFr1PXZsy82HRIL86C4mDLFGWW9d7zdTEuO
         Nc0vJDM4a2+uoAhJw+KsZBsdq8+4aly4ACM2MvmYozbV4H3e/MBVJEi6TucNKjpYUlyK
         HMBHpzUJJsonEY4zxmVIi2PsyXAhWSX4SWBJx/j1+/K/nhomKmU/m0TaEFVlUOZV118w
         CPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B7YZ8dYkC9FalzgGlMNozaLL3UdRqMw5OcQ+guvSNCk=;
        fh=O5QRnHrIJWE2i59zxayP+aJIdx8IcNoPZLh4qGyCnvM=;
        b=QjbIIE3yCe8jIeP29/Ze3lWyLcRmdJsD7Whbmgn4fVrPj1VNh5A8cRBP4L5jBdt3GQ
         vum42IXHBeauimgLugH6mOgsuIqLKoQBLALQ8HQzY2RkMOQa62UiMJ7cXVj4olbyYaSl
         aNEZkWX2VvssZ/GwEIJlMN0BioDJ73uTnzsdYaFwlg1ppvs+Z5XZprnJte/PwgZr7F6O
         SxYR7CRUNTyspmJmtH1L9SeR5xexwjCVSf14Wl7c8paZriEByMJ2+nPUni7oUKtKpSS8
         NZqbdkjO5a6mbKsMrdjQm8O906Og1b0vhw3JnbdC0Tr4gBxRQkpfzQnxnw61etAihxcr
         0dKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772927697; x=1773532497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7YZ8dYkC9FalzgGlMNozaLL3UdRqMw5OcQ+guvSNCk=;
        b=Svpznv5JcaASLmHVJPVB34ekRorPzNHILx/aPV/KeP63L7fTWwP9TXunFq79zuldMK
         +gfSIJxLn9c0Rn2KoWuuYyRIB0X2vyg0cS7AuRLvvMeEjWy6MWElcmt0YcWsTCzjyxVM
         HtO8nxB9T6AhaHl+K9cfv6t2Uyr/fGt2qy2ANUnaYzw+B1CXbOLSq5Ss/hcIdauVPSMi
         HWJfGh9q3eO3fEO+8UozSMnVIKRqgwqswJ00cLXolpGFV8SVzxqtZvofk3OqAQ+uUbz8
         ncchzIs2y250oTPve1xniUZ287XuZ5b8yMH8UDzyEbA1134zgvFSkUnigjD5UfYuI/GE
         zLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772927697; x=1773532497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7YZ8dYkC9FalzgGlMNozaLL3UdRqMw5OcQ+guvSNCk=;
        b=S52XB5/Ry/4LW+WR+VtYaF5Nwk0VaswQGC7PibXyt1mVwFLJKwCdbn9hxeXg+40e+a
         GKu2tT3eox7kAwr2jNtFui/P5WFQtoMJo1r9iGFxWFG6o9XK5n5Li+Y+JI8H4XUYCdsZ
         gZNem8ecMZO1Y/s5+GIUeDYBnY2YT039L3gwwdgDCvSv4vqOrGjCvfRkYK9O82RXk2Ls
         B6zFYCmhgu4DUJq9ebFdsYDhd0tP4P7rRQQPpMJNG3AKtgpgQ+vrtG3NgLhJxHM4uDwT
         Yv0HDPG0155D5uUONhLiLJxJSb/TZ6YZMh85V2pyqAWZ53wE7629+jaEN78sSHN96Pim
         Mu9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOvPdbI5suGdg4PbqgVNJxCcrKpX5bI6JSwYbMQR/DAX5DrrRDLY76gZuc03l5pGwOyDEUshVW/r9VBSBf@lists.linux.dev
X-Gm-Message-State: AOJu0YwlLuI2Fzg5dHHSB4poXu/MQIdqGP59zj5iY7DwqepjB2EVuRbj
	MwqU3B+HwKCdUIrj89M6L0xCzALoEyCM+kh5pljcMmByvgTbyAWuN9nB2bKK7FJ1AcIShSZmjzG
	Q5VM6mZbEyfmMSnAm4FDiJHjXncKIfvA=
X-Gm-Gg: ATEYQzzwW8NsrQd1nuJjOUvNgboDPSAwlma/jbSxzTW3M45+Lq7sah5wgQnxqyFTSq+
	CBxVRp3Izf864n3YjPa5Om4GnzaRCaDwJTZ5XxJzizq5613N8yQ0P/1anXcQHYMHjh4QLHouQt3
	PDPFtODDiWTF3otP6uLeusHnxugr2Ty2qK9vpvZEHs2dpMOD12RG2nE34nVzaRlIfFfPjck9LqW
	fvO/B89/T4uuKYkkj1HVz4OwPS0abkjuNpgKiiaXrrixw6Of7nKkn1mrNc8poP3eAh7gBchE5/P
	/NXy8hhBYfqXcl1eRi+0+hN8cH8RSHxV8wTC
X-Received: by 2002:a17:90b:1d43:b0:359:1130:1047 with SMTP id
 98e67ed59e1d1-359be344adfmr5956232a91.17.1772927697613; Sat, 07 Mar 2026
 15:54:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302090803.4796-1-esty5664@gmail.com> <DGSHDT7BCYTC.1TFCJIZHYUB6E@gmail.com>
 <CAPMPFbjpTjwMfK_hawUnF_CmiKPaZ0w6V+f5_NcGVKC4B6UhGg@mail.gmail.com> <DGUATZH7A7R7.UIOINNCCWP8V@gmail.com>
In-Reply-To: <DGUATZH7A7R7.UIOINNCCWP8V@gmail.com>
From: Esther Zilberberg <esty5664@gmail.com>
Date: Sun, 8 Mar 2026 01:54:46 +0200
X-Gm-Features: AaiRm53BlgonceHGvCenl5fEblrPJRWSPqh9sYP5a4cMc45MboC81ApUKp9swW8
Message-ID: <CAPMPFbhMD8KM4d=gA6vueshwQ6jZouzRcztxr4TwZOakvvs3PQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: rename supportRateNum to support_rate_num
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, arthur.stupa@gmail.com, jannik@jrehkemper.de, 
	william.hansen.baird@gmail.com, kaizhetan@yahoo.com, s9430939@naver.com, 
	straube.linux@gmail.com, ysinghcin@gmail.com, kees@kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 11:01=E2=80=AFPM Ethan Tidmore <ethantidmore06@gmail=
.com> wrote:
>
> On Wed Mar 4, 2026 at 2:39 PM CST, Esther Zilberberg wrote:
> > On Mon, Mar 2, 2026 at 7:43=E2=80=AFPM Ethan Tidmore <ethantidmore06@gm=
ail.com> wrote:
> >>
> >> On Mon Mar 2, 2026 at 3:08 AM CST, Esther Zilberberg wrote:
> >> > Rename supportRateNum to support_rate_num to fix warning
> >> > reported by checkpatch.pl.
> >> >
> >> > Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> >> > ---
>
> ...
>
> > I am using the mainline (master) branch.
> >
> > Thanks,
> > Esther
>
> When I tried to apply this patch against staging-next it didn't apply
> cleanly, so try and rebase it against staging-next.
>
> Thanks,
>
> ET

Hi,

I have rebased the patch on staging-next and sent v2:
https://lore.kernel.org/linux-staging/20260307234430.5439-1-esty5664@gmail.=
com/T/#u

Thanks,
Esther
