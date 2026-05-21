Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D930349CEE
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 21:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397754; cv=pass; b=gx5k2Tb4J5j71u91tNERm7hMXozB4mwgYs7jQAqYFH38m739pTR+zS8bf9yvFTNW4bfxmZSYXDJJMvl0BM1QAKLCqD8gA77vOV4fH63Y75iH7CFt5C5DNJZcE0qoWzOJ0UHNar6rNYa4cpWbhLhrbmx6t6jFOg/RCWxb+thUnJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397754; c=relaxed/simple;
	bh=K0t78CZtMYss2xYQK3R6dzfQhwWCKmHBSj4xZqVQMJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lW3cLRccK61LDadNXbf4uRUWOQzgsBW4dopbzZhOfw3Kcc5zuLEGSvwfP05DcoujLdqo2OlrlJ5PfkUbc+q/nalRlg7p2AKmb/GSN9xA+1c0Eq6iwGK0+W6wGPxwlcYvlwaftTmsrmkJpAj4IitrKhOt7674XScswkYmGBWTtlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+LzBy8c; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+LzBy8c"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e5bea4045so50092761cf.3
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779397752; cv=none;
        d=google.com; s=arc-20240605;
        b=cmVjQqjRzBZm6HSrvvRr9E1u3uXdJmPDiaRma5q0TS8tsU2WTa8nU7U11i+nFJmEYm
         1UvNC3EsKPgwfVWP9I2ltUBN881asQ/KFgzvFDez6gWBId+6X5/0ZdKfP87FO8KTsb0h
         +fRoG8AXuxp0YLdUD6hOPVKss9fxN0zToq7CjN2Y0yMzaxkj1QIwUlJeuvqcR3LDjqof
         ezcr8AEaNux+E4A78ldHFsqyHUARpESNz89DpaMYi/K1qd94dOzNS9eVLwc9tw1a9KXh
         VPLBd7W06Lwb3Z0CvNOfVTcy7NDGl87E/dJs+J/+XjjDWA0xYqyGMMtwyeM/GeMvA7si
         bjAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nLY7a+6FR/cRTlTJLR67mUh09SFUfwlJHPCBLiMhr7I=;
        fh=z0Lug7Yr/F14+w6IP+I4rRfbtSb6V43VWNI9D4xNbjk=;
        b=MtQQZE8OiRQNI8naa9s3FGQJXN7ZbACLvOq1HzBhVCYHp+1S1rBldvCDq6U0B5Y+fa
         HpFHO7w9OTOgC5BWCZ/I7DKjY2XLRA56jzrssDlQTyEtJQv5WI5169rQj5DncQWlN4/+
         yNeTKuzWB3YyY01By4N2lwh1wUm/ShNucIUkhe63V+Kdql5SvqihHE7BBSmMg7IH7/Kt
         9CRSespp4VpwWjoXNKk5D1WxqIjJHa/Z+drw/LbeEH0kNyO3H97pC2Vq0Qxsm0vGs6/o
         JmnoEsoPVt0ynJGcBdaeHM+pkfY/3hQFW4iFNyuDq4rRERBijMS3N1owEOmveBpnGFhI
         oJIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779397752; x=1780002552; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLY7a+6FR/cRTlTJLR67mUh09SFUfwlJHPCBLiMhr7I=;
        b=D+LzBy8cl51EMCGMehYenUdXAvJtvJvlCfseCxG7eZYMMTY9lG+AbKaFl8a/NX+5BA
         EHgmBDMAR2j9CEK4hmFwTD5dTUaveTg8E9XOaoF4t1uKV6l/LZ9U895m6dEWxP2pBQjR
         3WpohhuDulkLzFncSWhn3DFlBF8XAfhtHIhuCAYoYD3Yjy650ScR+5GixBvhJmuyAOg9
         /ka6pGwEeqfUzfqeQDQwZV2qQ11bewsJpTNNC1hBpoxMlHcwYuDYn7t3p+Rpxayy7WzD
         i59wjX2PD2PhMOzgWRv1X/c4WCVFwSjp94vsFrbw14ZoH7aSWYKj25kci0Jp1C8EnXA3
         8Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779397752; x=1780002552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nLY7a+6FR/cRTlTJLR67mUh09SFUfwlJHPCBLiMhr7I=;
        b=klDZtqd3qU+hzN3Q8hv2tSGazHVqbdikVN/aRXXArE/uqqOt1ImdadogNmnPK9/S9t
         Nw196MwTByQwBBV+GeWfMRca97fmURuWPdg5pEzWmjvPE6ASq/xBD5b7rVOVn0rQRwg7
         87kF3KnTEXXy6Pgq0YZkoMBOBPD3CIDOnmBizK8RBENElKSeNDloSzSBow5Jay7XhizC
         4UztY4O/JGYQDpTEwbCUByTS4+bQ4K7VlzZ15RcGeAIr5S7UZ1NjuwVYFFhd9Lu7vn+C
         ha7rtOG+RUNlvnzPeUuTZECandQs6L111ZodESObF+Df4bBe58H19nqsdfpbx4LGqM8w
         EkYg==
X-Forwarded-Encrypted: i=1; AFNElJ/ihaZtyt5loccAKR62IT4z8Tuvqm15PWXwLsvW9XofjsY9Wv1JMRMGBhae9iwfdyjU1FhLaiiexQem/IMD@lists.linux.dev
X-Gm-Message-State: AOJu0YyourQ6Z8RYk03ME7Bb3JiMMg2cGC/11hYkvnJCcxsUTeuyRq+C
	Ivz+Ny8U1PpaF/XGdKcHiDKWqGrQWBHhO/wnsD580/Agz2kH/sJg4wnM1u6T/6RofukMzFgBIKp
	y/N3njq/XZ5+1/12Dhf4sCOfJc97vEF8=
X-Gm-Gg: Acq92OEukHPW7V89oiDo9+M43RskY+y21gpx1S+O8H0OH9+TiFn3xyIIw2pJe8El+Mp
	qPu/WN3WYF279zbaw7apVqVP4zU+fEDr/sDpklm6Jmysyu8c0GksWyOeeieTbrojpPw5UpRFRvy
	wVN111n6WLpxYnuAO92cDodOABihnS1psXio0JSk79t2izJRkA6QYq/KFUeOx1RwIzjKsdDP0HO
	NRgMzf83mhagzWeUg0X8KbpjvZCzaSQfyLukDHeNMsoqb60MQ6dxajX7MlLpkPWrepBJK8xfXks
	cR1y9AGE66I3XM7vERCjBQr5zPa2oIoqPe3V4U5YEBuYnWNltpU=
X-Received: by 2002:a05:622a:1e08:b0:50f:ae44:515b with SMTP id
 d75a77b69052e-516d45924cbmr14289361cf.37.1779397751478; Thu, 21 May 2026
 14:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521210523.133725-1-diegomancera.dev@gmail.com> <20260521210523.133725-2-diegomancera.dev@gmail.com>
In-Reply-To: <20260521210523.133725-2-diegomancera.dev@gmail.com>
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Thu, 21 May 2026 15:09:00 -0600
X-Gm-Features: AVHnY4LWnZAp_HAYR5mjkfAuCHvXFZRdiPIzEWDUjLwakceMiCVys4Wl8JfJUQU
Message-ID: <CALruWrWoqtOiZdW9TJKH-utdMhAY7XF_b9PGhfC5OQVHS-ZWbw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: add const to g_fbmode array
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: m.steinmoetzger@gmail.com, guojy.bj@gmail.com, straube.linux@gmail.com, 
	error27@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, please ignore this patch, as it was sent by mistake. I am
retracting it due to compilation errors I found earlier.

On Thu, May 21, 2026 at 3:06=E2=80=AFPM Diego Fernando Mancera G=C3=B3mez
<diegomancera.dev@gmail.com> wrote:
>
> Signed-off-by: Diego Fernando Mancera G=C3=B3mez <diegomancera.dev@gmail.=
com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm=
750.c
> index 89c811e0806c..8f533f3b1b42 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -21,7 +21,7 @@
>  static int g_hwcursor =3D 1;
>  static int g_noaccel __ro_after_init;
>  static int g_nomtrr __ro_after_init;
> -static const char *g_fbmode[] =3D {NULL, NULL};
> +static const char * const g_fbmode[] =3D {NULL, NULL};
>  static const char *g_def_fbmode =3D "1024x768-32@60";
>  static char *g_settings;
>  static int g_dualview __ro_after_init;
> --
> 2.43.0
>
