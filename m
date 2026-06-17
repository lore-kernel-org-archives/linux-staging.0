Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759F392C34
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698185; cv=pass; b=FcLdwDJkZXBNrzKqojAxR/LjZDnctQNFvTeq6i3HyCm65Qqpur+Th9clhuM6WCCozzT+Lgn+VhcM0e3oR/f9fI4T5OTPKHHEM/OqvZRylZAs7MoiREIdHIiRsambof+8/GxcInCPnH93s5O+fvQwchEl4WdoN7uZccoQrRpFBqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698185; c=relaxed/simple;
	bh=3o5q/WxvQ/o9NQRy+CLSrbzMjEPPQ6IQEZTuPtYi264=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E49pQn93WOOAYuPRXzOq77VMG1OTZnvbIZRyUdI11hAL6Q5UU+v16AK7LrW23pvaG1/LtNEG6m3Ms8IzTGX4nGnAbP4QMhlTaVV74+PdAlaf2Ji8mGcYBeKENGrrgawDW519byeHk/CEciEZnYCMvA0sb6UaS9LkOPNhaXKikUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpM/xeuD; arc=pass smtp.client-ip=209.85.167.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpM/xeuD"
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-4863cd278d7so3397019b6e.1
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 05:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781698183; cv=none;
        d=google.com; s=arc-20240605;
        b=AO5TOoe7Hm9OSK3tIPX8MVISJaPLk8DDwbkJzjOLD9LmHvASNVMu69xjP23dIdtKWB
         4CxB+eaBvwmLKHxMyj3zfhzTkcokXqcwqnFqtETUhGojL6/U5GNTzTMVNzmgKYxn7vYk
         sKhOZYb06h8+zhJ71iVLqpENJwNp0lVpjEODGToncuDa1y440LxVwBy3fbbOqMPJvFBy
         GhBMuBwT9lWz7S1YPsF4VBBXupBUVqFXlR0gHy3BXGTeRYxKxjbeM7HUf8HrgEqZ3g9f
         904GyaL4wFbVsMFQ2PV4MGdT16oKZUPHunnW/8AXBz+X22Pk6B7A5h/vVTvDVI/PMTQ/
         zB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQoEugMsRh68xiP2KCQsFj1TbsIsl8X/WcN0bf03otE=;
        fh=rRev5Y7u4HDjvkJUYXseQDUrnjQ9gtanDLDdkVX5rZw=;
        b=VPqeEBPWsHQw3TX/tNom10zkSc89bMGUR4sTYhasJGE+qeyoYpTga4bCcIg+6XpDSf
         3DM4KdKUxgLhbwCx4bk5436MYhosdzZQ9adcZlaGwfgYETo+D1bpffROHZIFJT5L8Rii
         1esTBmxQb44KN/fsVLjD/76oX0gtj30e942Ye0ABxdefTxMWczX5najKZavDeBMgqF3X
         ebR7z1tmWjpZ2vVgh1qPvs8dAYYt9SlBUPUj1LtaGc91180SqAcANfnX2tazAtUyPtV0
         10NcWvYNb+EALqMeX7288g/I+1mWcIFdmEhf01jxuJitBF1A6h7wvj51lcXnWLz0uhUT
         dbww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781698183; x=1782302983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQoEugMsRh68xiP2KCQsFj1TbsIsl8X/WcN0bf03otE=;
        b=JpM/xeuD+Lad20mzNwhBveurv2WtEBS8lpXKQJ/7B4GUssvc7ZJkrqo54zquEphzxe
         7r8DufZcT5pVImLV4xkaP+TA0/qIsO+40k0NmuWG3IlyTTdNfWl/m0aJ6XtqFM48yIgX
         DEIJFabmBi3qee+6E3dhCvZfvTK0gnxFbo9zLQaivcOvldt4gYAodZCM0mLtO7fRq+1a
         RD+T9mrlph8RRegkPgo6jnDVxQk7UEVx2Ff/2JDMSLnfMuDDapplG5P7YsllUHdolsVu
         fMCmfADchF6ivVkhR2rsIxa8u80OJdVCU9bz1XInENclU4fwev+0ETSEJDBPlX4Fxxix
         BtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698183; x=1782302983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQoEugMsRh68xiP2KCQsFj1TbsIsl8X/WcN0bf03otE=;
        b=YeQuMvkSOnwtOl6IAMU/Tje9z4dUWolxBqwQAFpGDmYEMz77sw8z6vbsWVwF5Jrdby
         pFEjdqYc3ZDq5fRtXyJ0OkmFEAN6vefoQq2FNO5R7EAuT8Fq3GMRoe6H7Qhd5QAb1XPh
         077yOO3JKp2Mg/tk+/1u1AXS+HcqPQG6sOUh7DAKs2v2a7gZxar9pLHqRp8Govhr/gno
         Wk8ua2a3qtZv89PS2Sn1RnGPQpT4z2kNse/JoyGTGcRWq7PWAFziemK/psrr6D6aBx1J
         E9LivfVf9Ez2UTC2aRwZynAoYzNXnhK8eTKRuKg8o/DlB/ICSi6Qa/q9UU+NZaE7slK2
         OZ/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/lpxo8kXeo1X6RyD1wqu75cq6jT6hDT8wi7R/mrDRC/+OTUKTDoPD0AQzPRDqJjeclYar0bSxMVFEvdT/C@lists.linux.dev
X-Gm-Message-State: AOJu0YybPzOf56Ub0g4SVApMr5+o+SSzX8YUNV3aW/tR+d3mWD2fhHlg
	sL56/X+IpTFBcOzasdM/8f3Iu291Tp4Ot80G/GkIAOqrSoBwZJkg3crF+zcWECtDObJ0KbLrcjS
	ViFdZdvXy0sCi72V9Vt0cCHTuw04nR4c=
X-Gm-Gg: Acq92OFbX+mG7Abj46ZX6h7QspY70TUoi8hZjFufAgUvzeTetDRNg0HchelC+nCAEmU
	DNyZEZzRYgzUZM36D+iA8AbvPFdIeuSvJugiFeDpLkRhNM5P3N+WVwlU9XK79hncPDRn+UWui8u
	maAGLtElrxjTTWLv8J8r7Ajp/eP/ren2UsYxXZEiCXXDZRvvnDLPlB3RV7ngKE6k5G3sJZrUKes
	ttEYm9X+8l128iW0V09g1OC9Z8eZUtrS4lU/gLYnH4fircaQwMwouWlMZuKzhCnukP/hLWrqj0i
	Lj+H0Gnuhw7iKoNB8vmHs8HJ1YAIzyw=
X-Received: by 2002:a05:6808:2210:b0:489:5000:5d32 with SMTP id
 5614622812f47-48950005de2mr555002b6e.18.1781698183432; Wed, 17 Jun 2026
 05:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616235241.99076-1-dennylin0707@gmail.com> <ajKKynn13sv-_UZl@stanley.mountain>
In-Reply-To: <ajKKynn13sv-_UZl@stanley.mountain>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 17 Jun 2026 05:09:31 -0700
X-Gm-Features: AVVi8CczKtSFifNm3DbJJ_idTYp239MPDyEgp8lK8CiOFIWaXGEzZl5S_wmfjMI
Message-ID: <CAGEkeHc+gxyu0htaJCOxTLYcps35UpM-giXfS4R2LV2a8p+10g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] staging: rtl8723bs: convert update_attrib path to errno
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:53=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> The first three patches are fine.  Where is patch 4?

Looks like patch 4/4 was blocked by Gmail and never made it through.

I'll resend it separately.

Thanks,
Hungyu
