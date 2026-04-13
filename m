Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D890931F9AF
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063879; cv=pass; b=pA29BKbVmbd9f4YNKSzFOq6GC2d1DDmPsjujEu3WMyEv2sMKoDKhuIWum9KB8SrjF+wUsSHlaiKoDa7p7MIZvudV/vhtYVj8CiQ9qZSMPedm60XrMVFZfjwg6jKBncHH6aAFxwqO2nCAb1NjcYjbGL8hkJnRMUp+cOs8QqO0Hmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063879; c=relaxed/simple;
	bh=cHUon7mnOsFivonubjEmKa1tqwPu0cNQ4ngoVsPKvwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kO6WqFwjEzE0fiEwI1bIvfinm1X1+a6NyK0sewDsijF8TE+L+1hg5GCcVeUJq7r/kIFxJrTDMGaBUhGCnBdoy7ld2vxGEvI9nx05OdrrNHyLLHYqcdbs2W6GA2NB/62drgpLHeApEHO3itlqFPGqoBUcesB1f7I5NdHgBYOkKYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aF6KvD/V; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aF6KvD/V"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b886fc047d5so641519766b.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776063876; cv=none;
        d=google.com; s=arc-20240605;
        b=afT/eKxD+OArDX4rzku+/rgQG9L38T+U0wfH6VWQFOEKVaZoGRHxn1SAFJwGH8XFTx
         d4wZA7PBTdcBAMUdJ5uq3abvuyjJrHiGlC5d8J6S2GlW0OkqgZXNGsecGvPDjHz7AtUR
         0BmWOCky5aYn5AzBft6QkrNS4OBfGPwVECexbUOiU/sVcHE/ix2jEQdVzU9cNMixhT8E
         eIuLwttahN9tb6ha0OjLIjwkIzEdhPhoijOvlIix0CmDpszCLPlxMmeoMpf776ACHy5h
         wo/s/eXHzZ803noNwcTBxfSHocxTybOjOxPjQhEg/mzyjAlwNcr3ju+z0a4d73zeWkij
         P4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cHUon7mnOsFivonubjEmKa1tqwPu0cNQ4ngoVsPKvwA=;
        fh=eEvQ1bwrsddKZED/U1ScSXl/ZKLP5v7yObnpLzQFe9U=;
        b=g87QaoRk5eGVPJV38IX/TiTzlmFSpAHZfbzOZL13hcvH3wZCKKzm8jNo5SVr/5inLx
         D8jJ0MlErLPl7BavOrW9LNwPeO2O3LaTrlazVrp8/fH5v0wYwASR5/YkE2dIJ0EVgfkM
         Dbg15LNlyeBkzKCnfpgzfgbJVgPJ6AKSvjoJIMafSCHcC6wI7oJYbsyxXwq2morGwlIL
         YCDZcH46NXx0J4CELbB/CAIbGhSfgaC10dC9QCbwD+mt6sm/Ajsv8wk7e5w8b4FnxLTC
         Buvi9qdF0V1qRk48sddcupN3uBGBqUD8lJyx7oa6LKRz01U/tFXkodtMJbqvC9DZgcwC
         Puhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063876; x=1776668676; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHUon7mnOsFivonubjEmKa1tqwPu0cNQ4ngoVsPKvwA=;
        b=aF6KvD/VIN0vNxcnoGCID9l3snH6KZG8GRO0/5DgqY8X86KGvMqlj37zmvd0aPxtJ8
         LuFLYJH08cW/M5lUtWgcKPp3eGSm9OnlqqwtPAT/YhMvQIBnbH0bVMtU1pTMjeXZddAh
         uU1Dtu9rOB6J8KJlw/35aEDPVC3GtDvLjFSh2OzHS9Zy0ce9n7H3TsD7R505iCjFUpSN
         wV/rOqJRZlzhfwkMFIiRlj9qX1GLX4oL/vRt5/9Aw29+lJYtc67Vnxw+R8uRgNMmpVmi
         dIs/R0FwxmAVDbKd+88jgjNiyk632OW4fdSp+JZRFXF+MB4jDWgaZ0x6lmGCkaKBzlP2
         nRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063876; x=1776668676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cHUon7mnOsFivonubjEmKa1tqwPu0cNQ4ngoVsPKvwA=;
        b=R19j1Yv2G0mnMbdA7wo3aMqGCCmwq6KgTEVaGGlAlk6O0Aq1Zwqzc6CmPHcR/iqAtK
         446p8aqIGYkBXC6Q1Dal3zqfJamwj2YCuTvs32jeNWY3+MgpaLOAKKYuCe7O+xEYk0r6
         ekgq+B56Kt/JTsVuL7ZUCClZ2Og2RF/G8gvnYLYVodDdwiaCSCBmYTPHlJl4DUgC1tAd
         OH2kcwSfC9BAark7ApGzUmAa4N1MYmjuB8VRQzUtxqXU6IXWgmb33iLhcjTqLJVHnoK/
         liMpwsZ1kS/H06ieveo/35b6nVoUSclNUIOs0/nNGETeKREMpAGsoihpy2rX8RMEAlYd
         I7sg==
X-Forwarded-Encrypted: i=1; AFNElJ9TjjeFt4Cdpe5fS9REh7NRF46l/9cnDlFV1rwSgFZYb/4PxSAegRr0/wL08utzLHDKynHnBrsQen3bI9j2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8iIp3YctHIrcgkb5muL1JieGEAJA5vqEjZnbZjLcX+rw5elyy
	Hjm8rppjNuD8T5OkZ3/v/5MB/5MjlGY47q6c84olr3+IpyHjDlGznZ+l+M000F7r+a7ctEXixJi
	wGLF28100ZkiuuPfnL3bJSu/0GjN6RMo=
X-Gm-Gg: AeBDiets6xd+tguW2iKtWez08DXSpP7piKP9LQmura7PqVDOSHzrAkQr7dAv9Mdp0U7
	X+jd39VjQJDU8pdJJfvDY88JFMzqo2ogbBGxB4aGOQ2S1NmVgxR66aiepAmmnMSIR9AuVpg4ZPv
	bMU5A80egfXSpKJf8qcR5U7Oj5nv7Zitegr9gnz0gZzjmrLC/F2y0igd2N8mn9HeDh8MNOfUF3o
	J8W4ZrotFwimb7wuSvUGshv8sow8LIAIypi06GJqjIBQpXq2fGeexVmmgyLehIx+pme84aDJRjC
	FV+XyE1K0VbL5yW6HGppeJOCaIwifoqfoL3Xn6l/WMqP4bJwG2rDrJC3f5U25pjeUp2q3E49kXe
	F1AZbN/s=
X-Received: by 2002:a17:907:788:b0:b9c:2a5f:41c4 with SMTP id
 a640c23a62f3a-b9d72683456mr663199566b.40.1776063875616; Mon, 13 Apr 2026
 00:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:03:58 +0300
X-Gm-Features: AQROBzA6J9Pun5_-q9iTAp8nKuVUe_q0RpEZJPgZRxShTkw4gmMnUf4srXfMbNM
Message-ID: <CAHp75Vdu6pih=NqkYT0CR_oLyr3YgNKBeqYM3+naqVp52UCgVw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Use %pe format specifier for error pointers
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 5:46=E2=80=AFPM Mahad Ibrahim
<mahad.ibrahim.dev@gmail.com> wrote:
>
> The %pe format specifier resolves error pointers to their symbolic
> representation. Previously %ld with PTR_ERR() was being used, %pe is a
> better alternative.
>
> Fixes the following coccinelle warnings reported by coccicheck:
> WARNING: Consider using %pe to print PTR_ERR()
>
> Testing: I do not own the hardware, therefore I could not perform
> hardware testing. Compile tested only.

I don't think it makes any difference for this driver. But I am not
objecting to the change. Up to Greg if he wants to apply or not.

--=20
With Best Regards,
Andy Shevchenko
