Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623593B8954
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076196; cv=none; b=ZUfjYGFqsP8mJJN1us/fK71UTrWHF7zDGNDTR2d/oUELOMAahxOWY4dk27wWGsJNTi6ICReTbhftyDlwkJ8ZynTvMRHGBHKqvS8uKz9/RdRJSkZn+po9vmuDxMqfGgoogxD0VSqMGUbw5M09TWn63R61UTGXH5BXQFbEieTXUOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076196; c=relaxed/simple;
	bh=oKjhpBrEqXisrOBy2xWx1sY6Ds6xRG7gEoYgvCxZT/c=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=cz2hqCfEAq1o7B0Q5iGacZAWJNWKnK5DcdBwHpN6kzSJHGuzg4CpDmgG135X9MOz6YSuqQ/zbuNQMig64ixoXDuPgfdXVMvTDxtGLtHLtyOwsXFss/zbJkwRqh8YRECZ9iesvr44rBCFTsowkr3/bBUxusV4mwrrdRntRkwWEUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU06PiMb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU06PiMb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so12749985e9.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773076194; x=1773680994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKjhpBrEqXisrOBy2xWx1sY6Ds6xRG7gEoYgvCxZT/c=;
        b=IU06PiMbAeaf+WJ9xi0j3XgPhOKMhKU42cTYUkuvHGTrWu2yywLXqKChUi6VU25SLs
         Uu5iHrt00slKUruVcTSoKMPKB/GAZLkN6J3/2kDaxZa1jY7TEimm3g8h3D1/Aw+BvV4N
         lb66ca+ul7rPsMjqNeMrgCl9qswSboPUPshEeVX9CtTXCNt1jijoY1K+5oMRGpg6WVd4
         PW0bdhmTRmzhqRX3522EaJLqiB63jySO4HWFlx2i4P8KkjQd0G2gVPTnPfvcikjYry4S
         3fxm2p2TCAdKHUOVAKqAIEu9SA70T3yCDjgWa6MoIQ1KXDbhKasRoq6dnNPBr1QzWbJ/
         gtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076194; x=1773680994;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKjhpBrEqXisrOBy2xWx1sY6Ds6xRG7gEoYgvCxZT/c=;
        b=CwXqKPpvHI+Px031l5sE7iq2sppN1l+8WKvAavw1bhgsp/KhuFbzM+YQp5fql/WtxE
         efHqsxY3Pfn6rpSdn1O7j0Ul78leDA5ED3ZrS0G9spnQ3Vmvq+n+eLpfxFvjovV68+qd
         G6Uydf7fbhY+O8XPh2HRRkSx1udLtSEsJrlJ4ZPShSijJc/K/7jFT+d6AZ/JIGeXYHRT
         9ZsLK5Lxb/Hsv9UP/FckU1/SaOcWazNTMS7Y+F+gimUdUsWZ5WnCOwWtZx15tgYL9yU1
         QazzgkTsAoxpt7AvTpADXtT5J6pAv+YNyXWJKtpN2beBHKNtQaRttMNKmaQupeTtsB38
         ie+w==
X-Gm-Message-State: AOJu0Yw6ArJgORap/DR0OSPP3HBgODVPTddhPpmAXEZXuN/7WiO5g00d
	o3HsUe2/pybmeSHbc2PDysPuomK6wX1jPA/gsR8kkWbDgR6YmL5UDwPQ
X-Gm-Gg: ATEYQzzvgZjscl95hLi3o6A9tQkwOXnNUKBkcTrDYab26QjWG4ziFc9YIGyqMiU/qek
	ktAj5Ihk9mjnNZqSp1lmbXVq36SmF3uaVQTwF8CqH27A8Nrde41ZmcFlR281PqZ1R+GM9X15k3U
	+3Xi5HRe5HCe71/P2bMxDhxoiCleJOiiPpSRPNO0M7s+k+vL2u0lF0funBGaFJbby2gpcjRR8C3
	83ES33hnHHBb3YNGsUU7pNhmz2KcBRTC8EUq7zILBLCyxiDtgqtTinrTmnpPdH46fXlGp8GQC+q
	t3u+CbnLo/HjDS0zeyEub4ZTU6GEsYXXvmiejsDTIqNvmLKw0fKPWRFghyRw8U0tP7AB2/OcSUd
	H8z+BUKqCJlFXOljQ+Zbw13YWTPyi05BfcJmpvqVoMl8LHXN3BUqpiuxC/L7lPp6f/pLWAs+zuH
	m4O/z6ypgrNfTvG0Sa
X-Received: by 2002:a05:600c:a08b:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-4853fa943demr36405525e9.17.1773076193442;
        Mon, 09 Mar 2026 10:09:53 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm28353613f8f.17.2026.03.09.10.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:09:53 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:09:54 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <4219d437-d0d5-464e-8b92-095690bbbd98@gmail.com>
In-Reply-To: <2026030931-quiet-crimp-e4aa@gregkh>
References: <20260301005019.2510157-1-objecting@objecting.org> <2026030908-destitute-rely-9997@gregkh> <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com> <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com> <2026030952-petroleum-osmosis-50df@gregkh> <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com> <2026030928-smartly-spinster-ae05@gregkh> <e65d636a-325c-41f4-978a-6c09a967a923@gmail.com> <2026030931-quiet-crimp-e4aa@gregkh>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <4219d437-d0d5-464e-8b92-095690bbbd98@gmail.com>

9 Mar 2026 17:06:48 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

> On Mon, Mar 09, 2026 at 05:04:24PM +0000, Josh Law wrote:
>> 9 Mar 2026 17:02:10 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>>
>>> On Mon, Mar 09, 2026 at 04:59:58PM +0000, Josh Law wrote:
>>>> 9 Mar 2026 16:57:19 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>>>>
>>>>> On Mon, Mar 09, 2026 at 04:14:47PM +0000, Josh Law wrote:
>>>>>> =E2=80=A6
>>>>>
>>>>> I have processed all pending staging patches now.
>>>>>
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>>
>>>> You've NAKed all 10 of my patches....?
>>>
>>> You have had review comments on all patches sent that I can see, did I
>>> miss any?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> You missed about 10 of my V2s
>
> What is the lore.kernel.org link of the patches I missed?
>
> I see Dan's response to your v2 series of 10 patches, which I agree
> with, you need to address that before I can look at that again.=C2=A0 Ple=
ase
> don't ignore his comments.
>
> thanks,
>
> greg k-h

https://lore.kernel.org/all/20260301214815.2628942-1-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-2-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-3-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-4-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-5-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-6-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-7-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-8-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-9-objecting@objecting.or=
g/
https://lore.kernel.org/all/20260301214815.2628942-10-objecting@objecting.o=
rg/


V/R



Also, I am responding to Dan's comments, but I am focusing on lib/ at the m=
oment, since I'm a reviewer, and I've had more time to fix lib/


Later, the patches that Dan NAKed, I will go ahead and fix them for you
