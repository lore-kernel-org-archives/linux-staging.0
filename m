Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B91E3BFAD1
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334543; cv=pass; b=u7zfGeoEMn+b9SBf7xJffNLuHkdLvNqe3ON7L1yQn24RMrL45J7cCuQn+xJmNdTJYx3D9QA57XZQj4qeO1tTQV4VRovXyjK6zfWfKz7ljQJb4v6cdkQT09NP/hhh6D8z2LlsMENNwQpPYYRjv3yIVwP/oI/gobo7gc++wtSvzzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334543; c=relaxed/simple;
	bh=1Y5QC9VaR0WOBQ9xrknlymia7s1s/X0KyolGNg9xbT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDfn1d7IzbShDBRu2QbH7SFnjsjzBlWGKaexOEbodfCMqCpjHC8g167IbRkA4aa9VfVYjrNU90Mfo2I0hNbVWE2V6LPz18Yu3Q7oG4aPgf2sLMcqdQiJK9iyuVxvyN3O8SJ3S70tJ2nJYsoqbJDBozpsskOy+ZwHxc8q5qcaQFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amL6KgdW; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amL6KgdW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so989385a12.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Jul 2026 03:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783334540; cv=none;
        d=google.com; s=arc-20260327;
        b=R9SbKXF4o3EWHsmzzwwpEWP06Kz09Tj2AbeBjgDLD493hKPGp/77n1FwJhb5fE2Q2u
         ZPCZfJnLGG89xwbIlf/CeFGnM3Yq4k+3mrfdEFD0L33RCqAbdrsIVipU9ZtKgb6w3Tz8
         EbBfJCtGBhvlja08TUMQW3Ui9Ah+xEk9beuVHAw6Yv7BdSEgKejmOgrhj6BNvKT2hMOK
         2v8rYXUHucXNyLweOVNIk/4HnOx+v7V5Vemn1ULtU4j8RcHKBRyjRML/4+KBHUw8yOAb
         eJcGIGZiQxCEeUIiggPv3NtkhYGktugJcgz5iHGQKWrea2LP+76xidFzc9VHsIL9HN+D
         NShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Y5QC9VaR0WOBQ9xrknlymia7s1s/X0KyolGNg9xbT4=;
        fh=6iJzKPpHZJCrpNsIv3yFBQGzIpv1vMfKYWBhYFtInUU=;
        b=JO4lhzTd0eEhteiBIpILgZVouF+VVcOpqh4Wg9edLr2immGnu4M9Mc2SX/Qy61QBjc
         DfdarSyB0ZeVyYfVe5Q+23T0T5RNzM1b/8yk8Qr2wf19J4mvoN9wixqpNd4ZHOKcuwOj
         ksqbIF0dNZvbwuClUMkHQAMOsDGzx4YTcP+CM048VX7jvabxIVR7xOvjQfjEUTYCoBx6
         axz1tc56sN+7wEiskLopXprNeyQNxMRFS2TNZcBy21qjlCcYlLVSK31bLtQbhjkxFS+M
         oj8yWL5O+EKNwz1rXyPSCYwHz6DQtt/YktGHpHhzF2ousovF2t4c4ZocCRJedytKWUv/
         +cxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334540; x=1783939340; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Y5QC9VaR0WOBQ9xrknlymia7s1s/X0KyolGNg9xbT4=;
        b=amL6KgdWoief/+UrEj0M9wHuHX57cBxHeWtzeQLowrOXE+CyftgzHwlVBOFZYJUj0V
         vY3TU6T0tQwlRZVneT/tUgqLKsofIvbQpJpBXXqZhiR4y4wcbr4ytej2bVuAWcWEcWFB
         fTO0rZOsYOhZlG+w09tiZ7RaJ48nx5xCkjlBeJ0XAwzpC/lvAnYxxtXBZlQ3eC6XmbMe
         2iwTClKm4blyLvGTDEkkFAsWPNfb+cVt8tIOm8XGZNxtQtu/a/oH3aqiAN9Ij9n/vmal
         h+l4oYpATY0/loP3wVAQ5ANxF+58ufjY80iigmuX3rZIJZ4hoF0sxzCl6COSFINUiTsR
         9d7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334540; x=1783939340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Y5QC9VaR0WOBQ9xrknlymia7s1s/X0KyolGNg9xbT4=;
        b=aX0PPqPIpt6gBe13Y9EgzlG1fDWnVpb46VS+f85++9Ke4hhYpSZRgKcTTE+XLdVMko
         +rzU2H7gFT6LxXxdETlMtWLZNTnfYHYrYuUs9aBlLdcwyYSJOLCFfyG7zlLE7ftsUY9J
         QVr6gQr8PBzvJ+WUCJqoq0N0MgL/oOk3OLddvYlo4JbWgLz8Y35wDiYlBKMaNY7flpsu
         kKm+a7pS4yjpVfv1CbmvmSPnsTyTaBPvHq0WDFGhhO4fVBJuh2JD+dxOah/NTZJN3Tou
         TbvQHQtyseDvXQBIi7ydvjrl4abwGpv5MUhzbeeFqrR3+/LuUQTShQbNNFpE6Fnj9JYC
         E8NQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGWSfug4JhL2PpbVXPtga4z76z3uHckppppKknxCkHxlriwus4YEXSlusJgaRIXn+nvcqBJV29y5YAMTQa@lists.linux.dev
X-Gm-Message-State: AOJu0YzkyuVMIipT/hMEPcZexnJRvS+7ZvMz4sFZMcYiTUzE9PgwfeDx
	u0wQqPrQuCexWOEi4XN3e0yYT9D+82+KxVl+TSMIqGp3P5RS3U/eNQdu46i7E0kaG/dicW8z+Hb
	1IecHKO5L4wEjg0pJatCGgnw02VRMXfo=
X-Gm-Gg: AfdE7clQ612EGd3tURNI9gY39c976slCEAAoMqDQmogmGUgV1WFMNwOJNTQiniGf6g+
	p2b93Q0KioFJaQPKPY097yji2sT3BlG9Fjs1q3JLYxPBcry9HS4twTWVDiMMS3TYwzttalIJPqO
	OdxRnKdQWPb3LPluCJVZ+mj9jygpgkoN12OuLsfqaD5s8P4RnR5IaZNsjgJI+AXZznERdP9TJkN
	IiYiLsAEg4KUlXT01axpxaWpWsnWE+fpXKamxeksSYmcGQ7Q/HKK8aZfFgwlomJkVnQiwUfTA1o
	YmGEIZNG6veK7d+tGac/1+X1Df5cINCvPF6wkxbhnbq60+ojDVu41yOdO6L6VA==
X-Received: by 2002:a05:6402:5107:b0:698:b23a:e54a with SMTP id
 4fb4d7f45d1cf-69a85c281cdmr38340a12.31.1783334539697; Mon, 06 Jul 2026
 03:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
 <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com> <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
In-Reply-To: <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Mon, 6 Jul 2026 16:20:08 +0530
X-Gm-Features: AVVi8Ccgnjmj7aT3AzMNV0fHJdJ2rWbK4zfohOMS4OfJCoMgCokRFN11TnO--ec
Message-ID: <CAHxc4bsLGj0fbVuez2hNo3tRNBDef3U0N4UTiwQc0SqWiEe1OA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 1:04=E2=80=AFPM Dileep Sankhla
<dileepsankhla.ds@gmail.com> wrote:
> I will try to send a patch addressing all the "else is not generally
> useful after a break or return" warnings.

Hi Andy,

I have sent the patch for the same here:
https://lore.kernel.org/linux-media/20260706103810.71919-1-dileepsankhla.ds=
@gmail.com/T/#u

--
Best Regards,
Dileep Sankhla
