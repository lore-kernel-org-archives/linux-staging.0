Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792842655;
	b=HXwUAHnrYctdz6vffE+0nxYLRVL7vOmHpEo+dQ0sojVJsNQp6JBGnpo9vJs7SsUGnUL5
	 bBfA+9ZAFKnPIatOHp2iufU/lafRrEPonuVdEPXr7HekkWAw2CIcwAnUf4XYR+7AnS8OV
	 GKBY2jkBlpgEUhqx8m9+mxaSLjnWBGKuk9TI+tQTQhMVdTH64tv3yYJHhkaWHXQb1b7IG
	 olrcOrS5WTmxmazF7DGH8x6HSDr7oNY3FR9dy+z5CNVgaWEwr9/YTqdZdDYy+ki9gXzps
	 dpQjSQDDGDfGqYfugp0Drr4QPpGA+sdwpbBdkV/zVjP1EVhdTlisgtjd8bYhL3A2HxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Fk1gBgZ4AUPxIMy56kMymtAhp/DJX3lqyPJTQrRewM=;
	b=mnR1xIyD0TpICWr7l31fphPmvB8pc1+dvjWGVP6RvXqVqe+ZgOuV/DokVaRxpxtymdDm
	 rm0ScNHke6EBBq8Bd5UsBHC52qt41IAEjkiXaX8klcUcCW60vVTKBriRHNTkEAKZE81Nh
	 UgUBqJmg8uc98NwJVtWeFKgKG4Saecu+cmul+BB4BfOq/pKLN+X3YpmMXSQVu/t/CHQB8
	 icDpbroD/EY9/PJvCYDQbVWVDl/16AoQ/MpYgl2jB+pFw0DGnw/VxokPf32PA76bcDKf+
	 F2CAa6r0WDyOln8POk8HmVF8thSMMwe/UbqIs2FN70RkvzEqTnKFYl74XaAKtvqRj1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WdDN8n3G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2EF606A31A
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 11:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WdDN8n3G
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6f5a0893610so1099830eaf.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 04:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792842654; cv=none;
        d=google.com; s=arc-20260327;
        b=p4SZJ2YQMKCiT+n4Tg6xiiIbf8TdHeoV8NMuXsQSmyBaC2Do8PgNzVi5huEuaqePAB
         G9g9TAdf6gJcCgFhM73BSlWqbT3AQJhY3qt9iQxZE7nCMtTiRlPmc1KmAL3+2Wg1puxD
         KWpr75OlnnA81BdjwvSEoBixePHZ3oLhrAAhLHkVcHA4JMpYlXn5g76dureSZR1c4+aw
         oyR1y4iSJbep9ZAdvgghL7VYncrud3kkmruXJ96IAMltDYOFjqWYJIdsMD7Ht3p2ENcb
         u28C9ilQTt8wGkd5MCqj9AntQO1pAKKO2CiITaDlQvvKOHl5sJrvSPCLND+e6JlEOZxn
         jEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Fk1gBgZ4AUPxIMy56kMymtAhp/DJX3lqyPJTQrRewM=;
        fh=tSOiPPetaSgEPUThY9qkKRVpzy5iCmCpBIkhzUN+hOQ=;
        b=aeGna4JEarKQe5zT/FXI/7IYigYuHV5j4fP9NUpstECEyWF1Z5OOqgBxQaMzvR5dvp
         Ja4cukcR9iqM3U9OFlFeKwLHnrdxw9J7cCuoTgxExd+H4Xx8/E1Qqax/YCz6jKCBDi4M
         GjSiXoTGSqPb45Hh90G9HiWaZJNcZ+DLFnAaXGaIIeU7CKdbSJ9xjSRmPfAomt+ktuHQ
         bQp/Eb2kZv+hbqHggM79j8FjSYGwOO8w9K48T1L8M4UOFVszygiXfom0xpGs0SsooLn6
         fNo/lycrT5k0cver73ky7P7H9I6ykrS5+/WB9PEIeF/NvZ4ndiIkFlEm0Z+rWgljChdi
         yGCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842654; x=1793447454; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Fk1gBgZ4AUPxIMy56kMymtAhp/DJX3lqyPJTQrRewM=;
        b=WdDN8n3GU8MNgrFcjOt77Ahm9tHyG64JTtA/zCSdLh33SU8pSvCqeh3NoxD+AowH8v
         G8w17YmkHrdN7/W9grohk8Rf9dkQ27sDyfNRl1ng7fkJhld1XeRv+KdkQglEQEcizUFF
         +I9hCT0YaOXhuDSMvL6g8sIGK52AfaUCbGLW7rpX8QTrjThDmq7623v6SwItYWFS2OfW
         H1LIKKdFYq9nT5Cuog3w9K78FVcdu6zefX93t/SmJae06M3lkxNh6FN9ONUSEEXwALLo
         fOf0vRMqrAxuTQXjdeurfXiYbySqEdgBO/VMuJIu8RA/5vw4H8h0IWLp05BL3hOvoslO
         zIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842654; x=1793447454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Fk1gBgZ4AUPxIMy56kMymtAhp/DJX3lqyPJTQrRewM=;
        b=ERNoVOTz7EqEOz34hRf0HnfC829x6xgKeR8nBDkykzrXc1YKcHx7o1A+vd/VFTdmIg
         COcRjqj5dcAShDxa15lOjIQfbrPmdkTWSx218r0WIKQEpjZ0AP9m4L+6+ODliZRBmMAn
         QFlL8yegHQbQWCL/9oDyV7NUUuYiOYt5MxO0fuKDhpb4xvl4TVjTVOVrEUINoAI564PZ
         AUpzRa6NwafaUu3ULs8HMPO3irTGnF085pyhAjCreYrEIscjdS3WDJre28sRREvLOwKT
         Cx4SUiiAZ0B7R2izlLmvSNycefXUW7EFPz/zmaqEOSkXzmHs8QsJdAyilnrSAA/7rNdX
         1twA==
X-Forwarded-Encrypted: i=1; AKwUvByLD/WQquSU1/WdeVf03m5c/SbSjulUhMTs3dSOkZ2tRkpvh0kwquGeqinv6qmLyCO9rDb/NziKe62NyDBD@lists.linux.dev
X-Gm-Message-State: AFq9FYK3LHSf4GWePjgMRXboyCDfSrHpgNAtFgkkpGsi1/fMohPGPRi6
	q16wJsidnnGESA5p/hKv7aolQUAU+xRd1m56nug+PcWD7EFLZ1B9jAI/bND8q01YJZRA3/B9tJe
	XtZmmwxDvFR+J5V+oiKQUE1WxKGNFJtU=
X-Gm-Gg: AYBFou3XrV/aWxJK1ure3/k0F1AgEO7Sdy73QVmKEwZpEiJgx1R01n8kQinKc2NEy2R
	hDhTw3x/uGUBSsf9ju7i6Edbm3DIKW1ymJ4lwJ7ISFsXVfbyqJEOnrNcZTDdmInab1J2JJ75Wyr
	Ek68cjq7xodO1VrWDhSCJAwFuRcDz0N184EGBOroS9gCseeShtRuEoBZ3XurqWEH8ixSP//82Qg
	T7t9WVIg+UNhW1j+SDydXbhthrG/ye3yi2H0trAO+zw+1X/cAha/aYT6VH0u5GN6hz/LBHLWsoJ
	0VEPaqaK2MFGcpT29ZCWCIH36PykWDT3Aqo35SMH8dQWwh8QAwq2GqeUfE95dlM/GKRi6cQO4kg
	3WUrUePbuERV+metaHPLU/IRFN9rkhQDkiAXeyUr1QrbXHfc+K7IA9gztU7ioObzi2k0V7xU=
X-Received: by 2002:a05:6820:7041:b0:6ff:6b2f:a11b with SMTP id
 006d021491bc7-70ba0fb21ebmr627518eaf.67.1792842654085; Sat, 24 Oct 2026
 04:50:54 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024073549.29531-1-himanshu.bakshi478@gmail.com> <2026102448-tackle-footnote-9ca0@gregkh>
In-Reply-To: <2026102448-tackle-footnote-9ca0@gregkh>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Sat, 24 Oct 2026 17:20:41 +0530
X-Gm-Features: AclHuK9RPNdG4PwTXd2ZHIWGfUPuk3tIjaYeZzEYcbczOXET7r-HnUoxLVjvyWk
Message-ID: <CAGLmz9+J-s98cT_ZFHF5EU7t=beK8m82fjq20+n5dmncdrMSEQ@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: clean up PLL calculation code
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

I found this while reviewing sm750_calc_pll_value() and looking for a
cleaner way to handle the PLL candidate calculation.

I tested the change as follows:

Built the sm750fb driver successfully using make -j2
M=3Ddrivers/staging/sm750fb W=3D1.

Ran a standalone C differential regression test comparing the original
and modified algorithms across 2,010,084 test cases, including
frequency sweeps, boundary values, and randomized requests.

Compared the return values and resulting PLL fields. All tested cases match=
ed.

The differential test uses standalone copies of the original and
modified algorithms rather than executing the function inside the
kernel, so it verifies that the two implementations behave identically
over the tested inputs. I have not tested this on physical SM750
hardware. If by any chance you would like to see the test c file, let
me know.

Thanks and Regards,
Himanshu Bakshi


On Sat, Oct 24, 2026 at 1:32=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Oct 24, 2026 at 01:05:49PM +0530, himanshu bakshi wrote:
> > From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> >
> > Improve the PLL calculation function's documentation and
> > readability.
> >
> > Simplify candidate selection by skipping candidates that do
> > not improve the frequency error, and defer updating the PLL
> > parameters until the best candidate has been selected.
>
> How was this found and tested?
>
> thanks,
>
> greg k-h
