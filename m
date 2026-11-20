Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795181754;
	b=4VCIWJ2NqvzSr2DaQQPZmVFo4Iy3E/I7m7a5eBaL+tqKuW60a7umz1ZhorGFP0cq6/zK
	 1w3tDyerFMHuL27I4ubJROFZMXaBLybbvpo2QgmcLGBJZ0z5+yhFYKdxkrj9ZLlf6Cjlj
	 ICfIvZvAdujOrnUMk15ePHu+e8BYp+pJjN6+c+wjYvWJkW/IN8Ak0LMotXxKffpO5cmEK
	 YhtQZj0L9TzQ4OspA1Deg6OZ7FLm+Y+YKajG5eZp1Sig9yO+0jciQI2GPXtyiQH0/0Xcs
	 WOeKh4SaS4goNPWZCcjM6VCtBSik9UOrQtN2xYZPowotaag8cSKNpgWFjKqu1pxu1Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=J2Q6kSYqAb2M7xnO/BmL/Zj8uMeaLz2NE83csOGtkY8=;
	b=lG9/TxWqQaqd77zLn1+BqCmohcq5vL7dunTAlKuJ1LH1Lzehzg2c0jMw3W8aJ97Z0bcH
	 C4fenFx8Kdzt0knQ3bhgpUYJtIaf9KOni9Y/nl/tcxKS8j2+pZLhPRoI/cz3jGAyDqd00
	 pMBi6Vm5SdtE6s4Ui9MQYeAdriUhU45MTVXgCUQ5kSB20zYtbiUZzWCr2NxV/QDIQSL7H
	 O6xJ2lD4OWgVRps/2tA4y74hddl5zDySh9Y3pGn2jG+pK8PShqfgEa6yIk5ZLIWgn7fu4
	 BgvusNCqHI2gxiHszI7idFLZTyvSrpNuA693PBS0S5B+zrxNTBZEvgwLrK6P/3Vf9vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohyZv6XZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F68606A320
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 13:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F68606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohyZv6XZ
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso8277241fa.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 05:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795181753; cv=none;
        d=google.com; s=arc-20260327;
        b=g//qbvTnFcY0+bqRkWbElrmXLZODP2vRKxa1gtBoBLjSFs8y37k9tbJL/MV6A8u+06
         n7fzuDtmTK/J+DchMtD2wr8BV3iQlPMXL1psds6ZGn5p+qxgqZv0UX+Q9pcVgknShkWm
         8kcD/W18FJODwv8yscNrpsII8qrMoQY1EwEMgfDkZsEYxCluUCqZBDPX7si6vf5Nfv9t
         EWYjC8LJThZBMa8REVRB1waecX/BikUpwyM25frHESp0ZbPvF6V2x0WIevxiWwhwmx8W
         5GHzObq3JAnfoZ1S9WkY4a9LteXbJBmEs3+GEVfdq4jF47XDRA1Bz2gllYG6w1jKq0An
         /v3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2Q6kSYqAb2M7xnO/BmL/Zj8uMeaLz2NE83csOGtkY8=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=MohWFiBWqAq2gyGJKqhdujZiS2ZNoluZdo7BGnfrVsO7HCZV3PSzUIf//9qaRmtpYl
         xxHQruB/ktX8Vboad7pfZ762pSgqCYVJx0Ya8HgTSDh0OMuYIyLrpdR6ZMJ5dVFQYFF0
         JhVbM5jAmIKyk9Xw7NVdTXWgO5dsUyepr2tj7gfsiUze+SqMXlz3bj9wOx5C2QDlbjOp
         1/RAaZZYm7Lp5LdJ2Q9/fSvE8buwZIqJtQ+BIMsaHwVg8UPYu2byEKU1tHrjvU0zuwPG
         cVi82R5KTlW5NtaT+t5r2bn833IHX6f6LBhZS8j2RMcC/ndfXn/YAj/zGTFMaZcZ/PPr
         Lzpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181753; x=1795786553; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2Q6kSYqAb2M7xnO/BmL/Zj8uMeaLz2NE83csOGtkY8=;
        b=ohyZv6XZStlRgv6rQC21tb3CYWrXLJv36Wp2uYFdBfjF7JXa1rg1zoLRDZ0yd7aYCg
         jHGTyTAGwMHGUiIWbAOe5Qkrtkv2SOAUtuAQCypCI6bXpmVnrROL0FqNV3t+dZejmlJO
         7nqfVr5qtfmcI1XjgRG4uBB/njGZnXTEomP69UAY9G3Zcb3d2+65a8L7A0Y/oPa/Km5e
         New61qllf7cbWGBlJtcKPIfXFK0Nsx6vfH7gQxk2qdZL4EHe4EicHolPIZl8cZgwSCb9
         d7lFYTSopBLBaNJmBUiZRZd+8yldyzhMlzsZuPie2Qoygklxh10PYjeQOtcMYybVmhV6
         tSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181753; x=1795786553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2Q6kSYqAb2M7xnO/BmL/Zj8uMeaLz2NE83csOGtkY8=;
        b=doymFCy5kwFEzu4n7M87G5nVp+l5KfGvyei0r76KiX8ShSn5mGa1teCWcWZ8XMdjm6
         u805geMVkZRllaOvq4vST4LJxIXggfeDmXo733K1W+pO8LBUQ0RvRguZm/8TZpj5C4kO
         +vHshEOkcv61dXDBioKbrMi/X48Ci8yTMUOxjndUDL/4x4uTErQ88RjVg06P06vHimQI
         yqdYlCAWBioWCX+N9cYkOoH14ArdR1M7ut4ot/uLDfs/13husoY3KEmYLjMGA7bJn/TS
         cpX+FoYjqIbREBl1dbWI36dviEpN922awixHkKte2G88nnNSk0uW7s+Uldy4vaJ3MXN2
         ukoQ==
X-Gm-Message-State: APuU4Z8ZVADJYHUKbuPM5XK396yEvSzRsS4tlBuUk8hI9b8j25SYIr6t
	L3SXYediUCyV3XOkKT3jYb+iX6xFCoYqsPmDqs19/RmU7goa9zJO7PGgR0+i1AN8mjKUa3JRwsV
	3Vy1LnkgKmfKORk3Okgw22TLEr/TqUIbgL1Agkuc=
X-Gm-Gg: AZFdTZeIl/iWcAFwHF7GLlXPqxva2CSqZiyH63d8T2yRt1NBs5p2uJf/c9e44Y49TFP
	mysahu603ReNekt8Y5Mn9dOZEU+cqMLNICVweoZtN3IZMPwcloEJucrasMPRNYP+oMm6DjUyZdo
	JCaMHlw56A9/aKyCIv0vOCC0F2IoOVNQub8izATKXPWKy3Ly/KkrR/k1iOxNvk6rQ9g3bGzdPik
	2Dp5ri+T1aqAKUjsbHiJf/mVWv56/SBy6/tcg1LSCmHEIF4Y0iZWT/dAFGbVfvTV0jRjbvGm/Ya
	lK7V3zG5e53YSVoxuNsdGsPIuuC0N2iz987kEOFjIMXj0n1/AaZp0OZvd4HpkCOFnq23kIowKr6
	ScZ//EbDCG92HeTiX9YqJNu9g6n8B2IaFT2LjNGlzR8aa8KBlxfe2cEqJFYHKc9h1mVxI37wMIf
	a6p8TdvtZfbEgTa0Iomw==
X-Received: by 2002:a05:651c:1474:b0:3ab:f9b:974 with SMTP id
 38308e7fff4ca-3ae7fac2697mr9367171fa.29.1795181752650; Fri, 20 Nov 2026
 05:35:52 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115135413.13482-1-tarun.k.lywait@gmail.com> <2026112040-unshipped-muscular-6354@gregkh>
In-Reply-To: <2026112040-unshipped-muscular-6354@gregkh>
From: Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
Date: Fri, 20 Nov 2026 19:05:39 +0530
X-Gm-Features: Aa3M54prlbb2_-Jv2VL2KNpvwTnZJxZ-C_4bCgn6KViclSm-c0KY9eYGCWh1yr8
Message-ID: <CAPmeTTDDU3vQ7rzW9qVtruu5_RA3WNm3OQYsUB=+U3HMaQJfTg@mail.gmail.com>
Subject: Re: [PATCH] staging: octeon: Align function parameters
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 12:49=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sun, Nov 15, 2026 at 07:24:13PM +0530, S Tarun Kumar Lywait wrote:
> > Align the function parameters to the open parantheis and change the par=
ameter "pko_command" to "pko_cmd", so that it doesn't exceed Col 100.
>
> But this line does :(
>

Hi,

I am sending a v2 patch with the correction you mentioned.
Thanks
