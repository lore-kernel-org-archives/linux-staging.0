Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5921E7C23
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773856482; cv=none; b=bVeoO4vWLkGff8Qp/l3HSlElrcy4wdNs9RYXeNxG8wGG81r7Cc/wjMlK0d11W3GHDxWvByc0WGByPXGH7OWK0eELcshP/yVerfPXEblhpV/HwH2gtQkOHWuTEkXD4DEnKllnMIQMgaThk29F3PTssSs9+zzx8buNYhbetjn5WVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773856482; c=relaxed/simple;
	bh=pcUu0e3xovwt052Og9TvWbZ4gs6kdLvIjyOKkHWa6J4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=QjJSnnNDPkDo1AcKl1i2GTq/pHj/js3zTJcT2AsGmiMAzeacyFSGjdbjoltboBcnj4XqAvRu6BHHvaXe1Dqh3qnmqnH3BdTTpR8t8omzLmrFHkCbFioaQ61iTonQi+8BhfSiud0pjWE0nVtjd5HSumvvrzWOKt+Be1Gbc6VgqHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bn79Mo2I; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bn79Mo2I"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ca6595c8aso238133d50.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773856480; x=1774461280; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjJh9U7NnQVk0xTxi7DU924041k/iGCGcj+RHFaPv4A=;
        b=Bn79Mo2I2a8gq8blD2c93GBS4ibIhvpVBaHCZcS60aP1k3BqudhJ23eruRisTJNxOT
         p9Rb7fe9PY75cIsrzkVqvUAr4/KpO44GQfcyTe33+RVC0BKm2oESHjAN/ke/m+zSYIRR
         FvV6cgeSHD/Z+N6a+o0mEl/GISdvW0BYwk46K3jHlT4uodhOomdxZS/rFCnIPJR6LB9Q
         pXDOFXZJOzROhtop6dWdGvhEMY/iF+kyvWwVMq2FQTQ7hqocoLAyLrKMFmwKeo+WtKbL
         ucCZe7d0uuAdw3tGatEEbtCp9hV92Pc/DmsoActCT4nBQsiRyskpYkfitxnsf3rlQoaB
         GUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773856480; x=1774461280;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjJh9U7NnQVk0xTxi7DU924041k/iGCGcj+RHFaPv4A=;
        b=dIQt+7KpfMW4a357eTpWkf/u42cvt7CvdtqyU+TKf1XZj3SCuRi1UZwiRUSaqSPcY0
         EtSy4DXDddu8UHbJDoWLe394jZPK8JEAwAcC7/rkalvsSjMToEJ3ZX1UgIt3PnOiWIW7
         pabmn6lqkXitAVWk6Ez4itazHXmLlzQkwN51mX8w6fEdz1mO9YdccxhNSoPMUEZUdR1K
         2hoyPCDyAXYbKW6etWou2LgBU+WSv759dcWQLUd17d4zWbIOEw3HXs6g+QnuOdNl9pib
         wYzxcMKmYoIWfQuhJIhRgqcCJvB3+K+prXFQcDwUuQR6NYBkhd6oqGXCGfdkViQ1AaNk
         kysQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpv48Yk+NvVNmYJC3VNBE0gWLmv4F/P3IHjNueeK6YVKQTu5dkoqgq3idVepNGuJYgEy5FLoI/NnCnUTPJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzjKdtkM4Z56snArgBZu837hjaWzg2SP8PMXVtMmTovTXEDcTMs
	ClqdY1YtpCEyLDW1ntE/GCGFmJqAGMJ0QDy0kli6sltyCwIMIploPij8
X-Gm-Gg: ATEYQzxMcqy3Z0LNJ16Uf8LTHQ35o98My3DW/e8MhMswxXQKRJNKXIErdtmP6Ag3cW7
	omKVfJ2g75V1NjjoK7ZylAObQQYBFiscWok9CLf0B1bL13GUChAHJ/YmJcdrb4ir9/niQZkFj1s
	Kl+gtifaHYKV0V/SHCAMRNH6MD56Esfo6cjMTis7lp3MUdVJFUixIMiz8lMbkTHHAWjWZ98iKYd
	Kc8EFmru1qCkQJojS558dYfxnwuCtuAnk8XxbYNzpM2+HYOKolQRyk4ubWH5FgqzWUfkIH1v/eQ
	c7ly32IQySoaO4bIS92U6bgcZ/H5oWwdpgnyKPEejKHhrWWe0QZJVqhY89uaCFPJoqXQL3HXFI/
	ygqz6ciF4sqqzaUu1hJhYKu0ahc/dZFHdhSTSNwo9/Ux2Ua0ha8L14n7Ct84/rV5Q6zQK/p/ZJZ
	txnGB1qqwAO38EbE9C8RYBZIT/Yr9Ta+ESXby9WktOT1CMY+NTJHJuCw0qTkeBF1S0nvhaLutu+
	bQtlrUH2QZvknE1FNJDuIuL3fIUKALz
X-Received: by 2002:a05:690e:16d9:b0:64d:6c77:aefa with SMTP id 956f58d0204a3-64e9159f7d1mr3205526d50.52.1773856479959;
        Wed, 18 Mar 2026 10:54:39 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91a1cc32sm2110094d50.4.2026.03.18.10.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 10:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 12:54:38 -0500
Message-Id: <DH63N4L7EAPC.2TAFLF2BQK8K5@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fixed the trailing
 whitespaces/commented code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Aadarsh 7001"
 <aadarshmandal9354@gmail.com>
Cc: "Luka Gejak" <luka.gejak@linux.dev>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <straube.linux@gmail.com>,
 <dan.carpenter@linaro.org>, <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
 <2026031841-turban-sludge-c8c8@gregkh>
 <CANQQrNO0GzqhYLj7DauWAoO=tVCz=86YaSjWWjAf-ER+UKmK6Q@mail.gmail.com>
 <2026031814-unskilled-scrambler-3372@gregkh>
In-Reply-To: <2026031814-unskilled-scrambler-3372@gregkh>

On Wed Mar 18, 2026 at 10:11 AM CDT, Greg KH wrote:
> On Wed, Mar 18, 2026 at 08:36:21PM +0530, Aadarsh 7001 wrote:
>> On Wed, Mar 18, 2026 at 5:09=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
>>=20
>> > On Wed, Mar 18, 2026 at 07:59:28AM +0100, Luka Gejak wrote:
>> > > Hi Aadarsh,
>> > >
>> > > Thanks for submitting this patch, and good luck with your GSoC
>> > application!
>> >
>> > Wait, what?  Is GSoC doing staging patches for "entrance" into the
>> > program?  If so, SOMEONE needs to tell me this, otherwise I will have =
to
>> > treat all of these as an abuse of the community review process and jus=
t
>> > flat out reject all staging patches until the GSoC application process
>> > is over.
>> >
>> This isn't ok, you all know better than to do this.
>> >
>> > Who is in charge of the kernel GSoC project this year?
>> >
>> > greg k-h
>>=20
>> Sorry for the confusion, that wasn't my intention to abuse the community
>> > review process. This is my effort to learn and contribute to the kerne=
l.
>> > I'll be extra care ful on this. Thank you for clarification.
>
> If you are applying for GSoC, this is not your fault.  I want to know
> who the mentors that asked you to send this patch, where is that
> documented?
>
> thanks,
>
> greg k-h

It's on the actual page for it [1]:

Create a small patch that fixes a trivial issue in drivers/staging.=20
See points 1) and 2) below to learn the process. Only after this patch=20
is accepted by the community you can go and work on the next step.

Thanks,

ET

[1] https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Devi=
ce-Tree-Bindings
