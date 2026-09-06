Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D7C3451CC
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788679948; cv=pass; b=n+Bs24Z/MbFOotTM6a/LtkEpMs61+SE4EsV1N76VmsnyN6jzcfxHa6REZHYGhMvezojR7GHGyxu9tSQKjC/mgnVd1gn65eORkJA/YZTJFM0ttMv2t8c6+w//yafRgj7p6VHem3pb0liWRpvZzhiH5uyeIDwxjpTey2MgHFg/+XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788679948; c=relaxed/simple;
	bh=38xxFyuvZIF+Mcb0oDEHyyIdM03D64/gUGg0xDZ+DkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgJurYVsuseGMVWjNdRAYqfIhpaVHcd0mPRqEImqEVloEDB4dsA97PdQQ4FcPaOMkcO5HcOB64wydktR2gpQIkxZJnYzzmVaakPownuiMLkHwgZ56j/j5Nrlh85P//poBdDom4IY3UWpILT3dIqtfx7dwJIfp/+ndxHKa9XWTdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVEcBF1Z; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVEcBF1Z"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e592da74so295444066b.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 00:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788679945; cv=none;
        d=google.com; s=arc-20260327;
        b=bOj+vLpGFCc1atcangVlOHTAAXLNeU8wBDuotb5nBTtzVkDEpGZhdWTvhQY6yf7bdz
         OcubddeKG20qYcHKNOybDIvVvBqz2WViL2RoVxBIBXdV64F59UjLJW68AYYFccbT8dnw
         BP10siYo++rhe9nHX8fUFzYRk5VtiXbF7Q+WuTFNDB0ZAvLz6DIpgql1D0KbawCcZaf/
         D8D/SsDC2IYYl1DFrL7vSGTT9wskz45Sy5Po2098sK5JucdTBN5YRGn3R9hAtMAPrGdA
         F8mcQy+MUq3/QpUlPv7bcHlEVg0bbE4PY2Dkl9KFkWvhT7Y6qwKdOmfbgMPXeCwlyWlx
         hWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        fh=hL0jPl5e+JQFmDKrZJGJ8Ng3Q6y8AnKzfGRi0x1TotU=;
        b=X9eUnAkn/38wpW3K+GsEm/Ntgo9D/9T0GHkacnWez1VCv//UYu/IjA5kNuMT/a15ym
         fUWQwHBVCzdU6JaPNStJeHFVfsdhCk0wm65czd+qWrnqvR3qvWMJQFpClk2IlCrl8Vpl
         79sFm7NKY05jG+BT1eNs5dAqJ3GwPo/5srI4bWeibTako29AlYHfYtk2I3wARI01/Qi/
         vfnQNfzsPcUg4+NVizI1VYkC9ziULcY9aBJ5O9r2ubiYZ0HM2/zJgmvGm3WpDhm6abtc
         u3h5xzU6jkTu4VHv4LPdNG3SGORNlJBmZTDpFTTmfy0NNjmgQ5SObyTbp6i/jIb1TF/P
         OIhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788679945; x=1789284745; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        b=YVEcBF1ZEXq/eYurQwXHQOkIUdDQwneONxvf5G2KjbQ6NbDL391k21FTwvYw5PA9IB
         QkJaAqx+s96pKDGQLAeAjJKTzI73Mf3c2LXGvQQ12GUYKMWhPCrDUh4isnzRqDtBtGSe
         jAXByL4UaY0ufHrXPD9ec5EtI08fpkfnnOXShrcjSpqy0Omz3bymNlWCURjwrtpEm4fq
         XYSU1J78qXPVdv9kYabtCejD31FQ3XPnbFWebSoZN5CImZ7HdWa+7J0VPi2re1suh1ig
         yK34FjXiSO7SucZCYDxDsXCys717B9cK8/S91VnIhZQyOCYezhya6KAhhXGOIgPa2R8Y
         3/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788679945; x=1789284745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        b=nxjs74tzuY1d/DVg5hOKBS5mIx5BPZw52n+MjNBKdHbLnT92A1SVqCCayaigPG9tXp
         9z/kNZ+10G8nS/kqt0Zk2j4xuC7rSd2Jqb1FIxcTtcsFuXc9n6Px8ec11CCKLidZQDQ+
         vNfN0xh4krfZWopBUCuqq6s4C1GdrKNaU9uok1YARv2KTqxx9NfZCekXnZUMcXAok592
         WTXyMNKf7p5ChRAbvD85F9vxrdThJqfAPAq166ZG6dPnIOcqMQv0WVcHnxE77muOLflz
         3LAh2BcBPvc9cNDrA7DveJCx7EkW/whRmDHL3sI0d2O7zgsosrgRzFwowW3xUCb3dM3h
         9E+A==
X-Forwarded-Encrypted: i=1; AKwUvByzPTLgDssL4VaSR11KVJhq3fQx+Hgz63k6oq/U4aTycyj4o1x69XDxOVaautX7uwuwELntwpYe/2X9zyev@lists.linux.dev
X-Gm-Message-State: AFuF++mBhYedM8/W/InbHF+S4JRux6YVEXvj+bj/EefClrv4LyIzsWdL
	XHeZrGB4jzRDdVozaxTEnrE6CjXjGQyea5CPOCaLCdJyEwglidrkPUOMHCWyS8FCz1E8HJ0UuX4
	dOmrvyNYsoNWx4p6pGoaKvd1BJ7bZvrfZj7Axnsw=
X-Gm-Gg: AYBFou11jEzGgGzlkCd++cJI3bXXSdH9MDBndcoHJ4O685SMQOdF4sWhMfPL9NV9Tm+
	TLyck8jUZrHLQ0iO61UbY6bCn/jKlvJy9sasnpKjllNypr8SuFq8gSSjJ80v56J0DCsidt4dxfD
	G1oBFwh4Sk55ZDERHiUiPrfrUYyxG8xAsS9JHvuLv275zwe9iEQjf1a8YnfF9HJwOWNDHbo+FCw
	kLhsQNii+QNNov0tiRzxYUba2B6jOdN9cZ3VwCwvkmkcagMXi80ZrhGXfOEH8LnQhmTSBZdsllL
	27GNY58UxnTmw1pId4P3p7E+8+AAXAL5kVf50pCzYrjTneEyos95kbHsbF+qlQwhDP+tf1xQPl3
	FO0M3o09+f0EHk3S6w7R5tFLV86MNxsBrotj6sptowElFuiYSEk1zY7I8JwKhIaw//x6TU/QOnp
	t+synah+/DZwGwAJ6H9F8zOOAAX41X+w==
X-Received: by 2002:a17:907:c28:b0:c26:19de:9acf with SMTP id
 a640c23a62f3a-c2619dea6efmr444606966b.39.1788679945279; Sun, 06 Sep 2026
 00:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906004958.26041-1-lalitshankarch@gmail.com>
In-Reply-To: <20260906004958.26041-1-lalitshankarch@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 6 Sep 2026 10:31:48 +0300
X-Gm-Features: AcwNN1WzAwLmobc8VQofp4aTL04X2XACY-eMvYBwNFs_k975zra_jqGeD3A71Bk
Message-ID: <CAHp75VcRYL4idPvU3tC1nPO+HbRAoO63SXh_oqATShLZsommiA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Use C99 initializers for ACPI IDs
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>, 
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 3:53=E2=80=AFAM Lalit Shankar Chowdhury
<lalitshankarch@gmail.com> wrote:
>
> Use designated initializers for the ACPI ID tables.

...

>  static const struct acpi_device_id gc2235_acpi_match[] =3D {
> -       { "INT33F8" },
> -       {},
> +       { .id =3D "INT33F8" },
> +       { },

Follow the agreed style for the terminator entry. See Uwe's patches as
an example.

>  };

...

>  static const struct acpi_device_id ov2722_acpi_match[] =3D {
> -       { "INT33FB" },
> -       {},
> +       { .id =3D "INT33FB" },
> +       { },

Ditto.

>  };

--=20
With Best Regards,
Andy Shevchenko
