Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046054266B8
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831938; cv=pass; b=G6hipTKk7gaamBUNikml8sKzVjE0JpiGByj6tI6S8oct5V+PlwCIWmJOwWSjtua7FERsZlBe3Mhd0x4WBEC9jMynBkgNJrkPnoz+rAWoBt7z94dtAtLKVWaTmd2+K1rYMBKgTjFXuBFZTsCj8zMZx19m6L/KV3r4Ae4ulmC16NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831938; c=relaxed/simple;
	bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cu8cKOuFTACWSG/H5t21752p5l3MWrEdZq4Fj5oceJYoVdm6bMg4/JUFmZMKtBP9y50tB1SbJyAqG4IOwM3bdT+tjAvSF9VdABPF/OCfc20DwqtG+klCa7Lg9Gqu5M84VozKZTpijf1wmCTVb5coxOBULn4M6kCaEP2SIL1LD54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/LxP4os; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/LxP4os"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a75f960be4so16994831fa.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 12:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831935; cv=none;
        d=google.com; s=arc-20260327;
        b=QzwO1VxsWFOaX8CYCq1z669Eq6o9D6R+tpppc0HE9r/dthG0JlzoWn0Z/x++nPUR3P
         VYOq2ZCDhrJcGpR/X/LAxK4YiOMtG6VQwSu458eq0Y/o2zUY3p+bzKaQj9xmZlLEVIOc
         EW5rCt3TWS8MuAq3rqApAo3h+2QvTcVBPTxq/YVgump+KPe2llJQjDSyy22OgfFQL0Q/
         UxbwfuGTSgvFTbjwbFckzHxoa5xSSqr8KK/UwIvPxLoKkjmxZ0ETMes+OH+and3hZTNh
         +ymDPPIK02z4p8ow0B53sMgCdN4iMxefvGzxHa/0xREgYfh4hwUeGIgSSh/rHUBrnrnP
         j+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        fh=EcJwIwY9Ag7p3ntYba8Vc4UHG0/rJ8tCqCSNh1MGPvc=;
        b=Ib/SYK1ejsHC8AlL5j2/ZJ9FcDuLAV68yLigpg1g9kNOPxwmQfiOooqmGVMtWisUr1
         I0RXOzqMmtyKvjDITh9yhbttAeofwIm+TrWYJrDWLV4IKmiQptFfPpYGgL0UvLUfTFtS
         sFQXfpnRy0wQVtmdE15/DXVb1xPaSwj9E2fBE0Lz3EQYjYmFUlA6dHFdvHvoOMEdGwUr
         hgl1P5LVWetxKfFP04X9Dv2/kWkSNlltOUwYhL9eHWSLm9Si4b2ZggoOqD/YVb3zrbBv
         JXMPAHb4MK9Dk9rFDEmfRSqqv2sWYUKguM0GSgR8RTagqVr3lanBehgTSszaspjzKKXJ
         9xgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831935; x=1792436735; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        b=T/LxP4osqE20tXgjkFp7U6XG+yqPoK7clM8Q8G97rpvs+LwXApT7nXx+4+S2dhKnq8
         2V3qoB+hrJQGEWYNUhW6COveBsOy2YIW7iC6sHLV2p4mj/Cie/yKgeIjhnpnARdRX2um
         K3LWmQqzYdr9+I9lQxtVHRL9krsJRHGg42OLGNn2LFPuT2HFRJRf9+o5AQacPxZ/Uu/k
         vR8Ua0B861cmXscyb8QzyUQhfiIxNG4q4ZCzl8vYLDOIWnUXabnfrInOFJ8dRNKQlNBi
         M5PyHDuT3t/v6ulgQyv9haEqXLBR75nMpLIgHCu+eGP2Q+sqdO9Oi6alDam4CRDItDOB
         kAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831935; x=1792436735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        b=tBNP1pV2HnA0f82PTOyTDCzY8xQkbhgJmu5Gil9u5yMGJA1kx0jyJLfecG22ot/4EM
         6eR8jzT7X8iT+4NWF9RpL3Xk3Nxa/XjSKaKlnj1qAAXXJxJO8inFenRT5tuTbMbV4Y35
         cTSXPssRQ/e/SOGr19w5wt7NxwfDAcgStQwZwHQvx7V2OTn1OiPR3t/bUPV5dk3AKlAA
         bgBDwaLuDviok6V9FiAw5dUECqRs7ajVqdPX8tD1r8pr2Z44x76gL7ZMNw994o5tZkTo
         +tZjJTmotiAE6a5vLYq6/1I4O+izb+VrFmmKF+a0NxOWBJbO3VU2HLb1ZLy7RnofLEGB
         Bedw==
X-Forwarded-Encrypted: i=1; AKwUvBx+14rywe/WU3NqfVUojDdcMgu5JBVnlJ1hLcX6G4o+NaD91PHKyqK9YL5dVRWwDeyqcc2kHrJ5cJIidWYS@lists.linux.dev
X-Gm-Message-State: AFq9FYJplkgZIhx72Ud3dS+E3mLgXP1+B7OaaTJSDvEUm3MNgoOpkVtx
	AdYpVZUe5L4YowBbKCn6VNG4GTt5NBKDBy2b/PcL6v4QhF5UxZHROQNvWPVDpT6R4L3/LhGyqGv
	7SyMUY/kPf+iqRjVgX/qcF7FrjlSVbEQ=
X-Gm-Gg: AYBFou1MIiXwN00KGTuQUv4ddybCF0vOUQMzGoybQ8YWIl+oPAiT7Zogd3IXDDBjpDI
	F5pEFLfW2/jbklfb65UuiTfRN9ZVuLOhbGMKVk1jhQctQiBLf6L++ilqGGY9mxYJgzcGUAurdKE
	++VOzr39WbiIzoQg7FxJruQzTLS7lWooN4RLpiY60TWtjGuSPGitgDY0Zp9xwyLuK6/9dHnn2D4
	425lWkK3YjTrWiwPPfW2X/dgm7FlKnucGrwVtFFNl9OGRXi9MmmyvYF59nt3ECCWdno85Vx6EO5
	SMLE8cIQ39E+4+KbxFsUDvxlILKI+/oEZISH7ytok4cNRmJgeaWoz3gvkqx5MA81tEbPfSKLKhr
	qZqlbjq6kLOvea2BD6iBqd4CAzW21lIZWMqTZQY1Om7C4NxVBErDkoSCa9fuyfJH1lHBlkrqKqq
	RPvN1cwDFrw/VvON3AfJM8MhXPzO7L/ya0DnLa2nuZ
X-Received: by 2002:a2e:a7cf:0:b0:3a9:d937:7533 with SMTP id
 38308e7fff4ca-3a9d9377a0emr13474991fa.8.1791831934709; Mon, 12 Oct 2026
 12:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com> <20261012161322.930099-3-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-3-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:04:56 +0300
X-Gm-Features: AclHuK9f5aLsO6tRB8JPOO5i8tyqnBzEGNnnFSk4_j7LARmv2pkfbPldrYw1a8I
Message-ID: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: media: atomisp: Fix parameter indentation
 and block comments
To: johnsingleton@google.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Replace leading spaces with tabs in function parameter lists and
> format multi-line comments according to kernel coding style.

Please, read the mail archive to understand why this patch is no-go.

--=20
With Best Regards,
Andy Shevchenko
