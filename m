Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B047CA64
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216571; cv=pass; b=kwhfNrtw2b0/91YUVMYPuWh5gYTsMLJFveDJY647inBcM0B2zMwVvlT3XdX0QrmXiylnapg762xOssnidnda1vXRDLfi/wUdG/yVOIh8+D31Kq+Mx50QIrsu8v65fLyxSPAXhwD7bInKO02sfW5cBWhWwkizwYuwgZLoKXC0ZTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216571; c=relaxed/simple;
	bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1zpPShlwx1rxgbPy51f85RLYPsSBe14cRRbd6OT2s5kPGCKHNERTU0XXEnzq2He7zevENKlliXFhr8P6pilZbAvhm3TKrhLhi/YfnKSbD0FRfk5deKfLfvE13Ulg0p7wn7f0M9qLNxStuvUabjR6GlEZA9MiFsvUXXu6Vu8cAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtwagqMp; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtwagqMp"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so777862a12.0
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 05:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789216564; cv=none;
        d=google.com; s=arc-20260327;
        b=bC39Q6m/KD2RTXyaeNqoKslPon6Dk1zJdUWMceT0ZKpx4be86Q3DnYhc8EIeX/Q+KF
         Y9lCqHAJltG4oX0EGsGLyd67m8MWYKqVsBaORE+M3hXFcWgay2Ds/gwrYZOihians6qx
         vMqJ7t7sTRrmZCM+svnLtNn5btlfRg/2IVYQR2YF6xANyQfVmxydD+65Va3kL8lJEa+W
         KjzyGsDRfxKnx0leYjvhmutII2iLATRYAl4jO1iirS4PkS9oXAa2rGj59dwSjbpTgbyP
         B6SqeUY7YjHYZgVT5olHtRGk75p3xqm4UQmPME63S69zbbpMq2nGJOFiP1g4Woy5Qjc4
         Vj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        fh=uZGztMvIV3DYWOJ7i4/Aw4i09vOJkBd8atbEjsJ/Ko4=;
        b=LNV+EKqJ0yVMOz0ccP2tPjX/0HLYXCcymGlTSM+XMmAFggGTGEa+ni7KndQFkdP/Rv
         NcMd+d9/vGQl8RvMOapzwOIOQ5NTkNa1kgOIt9PImrn0ymYDT8Eyliz4iHHA147oK3D8
         tNBljZbLde8SfyEDWUE82//g18Ga4f6ie/GvZ54vjksFrsY+NP+sjBHFUXG5qKuGyse8
         KddQr5LAXj3Xtnzzx0wd3UFHAaiHR8sKsFArLmJZPx3mpd4iGj6UXiwMBEfbYUc2BVKD
         PYsjfUNVLWqw4sZe3rvTnPMR02ELyBR9T8JXKARweliiO5J36FiDp9S7JLS0J1n5E89g
         gXNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216564; x=1789821364; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        b=qtwagqMpprHjS9gQPRIAkjrkUf9S/rgVG0izTxIrmBQs7zswvh02yECiWL5aBGbeo/
         jK00uyVQJp740R3NjeLH8VgFqzcQfYQd41DB4kQ8Dx9YhtPjHXtS7bnHRRlGfPcaxPmp
         /ddaTahFRo3+NP7ohKsJ7IjclosySO3qjkFAjBpiKbE9jZyIWThhL6ho3EpD76E7TOTW
         E9jeozwQ6L9BVF9X0JJisvRi4OuAFs5kXgjI/3ypjFg26Xme5beQexN8RZQZXdvvUXaM
         /4lUqN5AZh63ntgJkilG4kev2ybyorfeIfeMSLs41lTJK/iutu1J7vwdKzyPW6bCT78X
         5+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216564; x=1789821364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        b=QqQfmhdTQj6PAKp390Hz0pGeUUgrsXp5elWppCM4b/n+IrcwD0Gnt9zGk8t4ZaBAgm
         m236o/IjqCuwvziOAGnzNYXz+vlOsoFpf72kYUYLpAQ2ibhpn5V8GsasxviZIacJu9yI
         nZmmm/45H6Xvf7Y6q/B5x0+zP1ZKpJVz7q1DONnq6uaS6bmiRbUpM+gUpVkZkeZwQLvT
         vDysHX1zl7uMU3l7NxWxKapRhSPCKku/ylCsd0LYbB01j9fPm0sxjb56BVlYSq9A8QQb
         OytDi988YHLD3x6nS8UMcr7uIEAkXEtVb9m5NWce1PCdiybGc2LFAxbnUBv8Z2J5/rv4
         8SHA==
X-Forwarded-Encrypted: i=1; AKwUvBwzta8sbVRA58HFHck3MlJlvtsFD+z8hIvQQta2C9WHpgZj38EqxFSJF9YV80YY+XCNx6rvvJKoHuC7D8wq@lists.linux.dev
X-Gm-Message-State: AFuF++muGMjz/pCLIfu1NZBKnNxCy54qbJB4KyWXjhm4msxQHGmlyWdP
	HJcHULoCClziA/l0P1hZyzyVPqhMIZnj4nxmh9hXd1x9Yr78sTtHBeu+O73097KznHZ2W4PG0xi
	uto9nTmZEBzGJYvuwIDVfwCqayR/DpjY=
X-Gm-Gg: AYBFou2uTkYoY6P+lRjDgHZHuKup2blcbw6m2a8aRjbRS3hKMUBR0UnfPACYT1vFAso
	ZsYxyREAr5MkrpCplYh8g1nQn0k9V7hYt18lswTXKed5FGr28Xtd0Q5gdZiwMOISS+SnR34UPHA
	V+IsQe3myevdUeXlpAJUluMMiD4+wK7AwARETlTkC9FDZqw85K48hMCU91CQBNLNTKPJTtmzNJr
	u4i+hb8kJdb5OsgiTdyLwiUY7qfOpi9PJU22ShjmMPA3ln74d/HPVuuayybQem6fMdKBi907dPD
	WeG10G8IpFyojIbl3b3pZ1ZEN755ENkii1Xb9Ppuk+PRdRwt9iarWhd6hnAD/MJYGzSu665E871
	rhMhnqupeycflbCijnYvD6cAtJIVeJxouCZ+lOq3WTZsR3RLO1Vkz/4JRUsEVpK2YyLVHpVC4Iu
	e75aO9ups3USETpB+bNDMoWU25qvgboGoxh8dW2ebJ
X-Received: by 2002:a17:907:1c0f:b0:c29:367b:b7ba with SMTP id
 a640c23a62f3a-c29858bb1cbmr152369766b.34.1789216563540; Sat, 12 Sep 2026
 05:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
In-Reply-To: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 15:35:26 +0300
X-Gm-Features: AcwNN1UYah4FBpIaWcKb4z1tHoJBx3miuF5_P4HDrhgh_59ZX4pBct8dP13O8rk
Message-ID: <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
<ricardobarbosamscg@gmail.com> wrote:
>
> Remove an unnecessary extra blank line to clean up code style
> and fix checkpatch CHECK warning.

This is the lowest possible priority patch, if even considered. If you
want to clean up this driver, there are more interesting tasks.

--=20
With Best Regards,
Andy Shevchenko
