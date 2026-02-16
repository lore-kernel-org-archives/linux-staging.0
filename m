Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A151391
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 05:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771218253; cv=pass; b=NtrBO5UNTt3zkQ+hOfAWmmHIxw4VPgntUK16gKJA+Pa6yvvqbbXWTvZKsIj9KK6Upurc1EdMZPL/zfeEqOWhpk4fwPYcvrN6nTj6InOQdPhJCuCy0hZkyn8cj6mVfhx/tgTyhtjv9DkyIW54bQ+gVrG/6KMVK5XpN1Xk6/ixXI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771218253; c=relaxed/simple;
	bh=mv1TdG6YeiC4xwG/z0WTcQFvTEzPxBLRtDPQveaK8Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpN6ZMqbYPvTLgH9jSf8c6QWaxWaUu3LqEeA3TWjnAtpifTpaqvhFXG4GpuXFTTqdaGwSZfIXMQpvSPDtSHGIjZ0XNzkr0+uLc/RIr9Y7WmNc6GkaYcahs7qr6GFat3CaISaEBMtnDjU69JpCzm1svUqlrk4EpKgVTHEf0bMjjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdO/FQjx; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdO/FQjx"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124afd03fd1so4088102c88.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 21:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771218251; cv=none;
        d=google.com; s=arc-20240605;
        b=XKuUWFRQ7TPrbG8czRA2j8T8cyptLZp++fjr6fDKsBlcPd1vgs21Riu0cQMryXahnA
         mFBBETI9dp3BLfXJo27XErFBQpwjs6gXq2MCsJAF7z7af5trqQ92PJxhYPLJLlRtRyxf
         lG+Ia/rb4DerMkVh3T/iGYyzKnTnSk8kCIR0N2UiZBGTm5btjp7F8Qfd2b0dvjJ6aSjA
         JfXwO1sY1tRG9lhM49A5tQoxQiLAfckYJrhpPiJSqtwJi2YITMarelcyfS2QdRr00J1t
         bJV6Ksi4GWjn3SJEj3CRgeC/RKJuU2CzdorzbkvNU99eB/uwkmMlAPaqEoNykN4bveWz
         irRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3nEvUBQpGt7TgPbViNAbrgOhYGBJeReReSUJUzf2nQ=;
        fh=qXUtjm7xeDDlmF3SuSCujKbQ5PLE2wKVdw3L+AQ/Vy8=;
        b=RIN+uvmv8PdFi9nMn4RoimKRfTD03SGBjTwbgzn2xMi4d+YW56SEIEwPaQ5lbSW/+V
         Vj4Su3oqzbzvSHmuJtdlYCDtPoccrt0uVfflpkLHac0ZcGrRd3cz09avvjqPgKLIxGwE
         WSX9vRNNCuxijH84fxbtQYBYjGBIW9bH9Gq15WXVBTE45KO9znEHxq3evUp5s6I1RgNF
         CB5UYcEYrQDs3c/k1j6QazGNdJn7H/xwtmwEztqi4cQLuDquGG5SODvei0DyvILGzf9X
         RHdkSJBv5nuY6CSbYNINCOLkNA861ZY+m2yeexx8ZQ9S61qtT7gIxDA8YdBcOQyejuyE
         AHgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771218251; x=1771823051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3nEvUBQpGt7TgPbViNAbrgOhYGBJeReReSUJUzf2nQ=;
        b=MdO/FQjx2WpIOctyBhEqSTcubAnvIpcKW2/AXU3eUE7cwN7YRRudk7Z2KpXQLcdzrK
         KckIYqD1mLO0F31MFu9trqs1AYDowiHdx9Xw2eajUgQnLsugplT1fBAkBmKphxoSEYFh
         AIMiVH4KzGLdrvx6ZE4hW/6tDjG3ulYyC6fV8X7LDJnUaUPe0jXdJrBsAbH1plaBM/Yj
         bJeu4QXxhqK0wplb3TlKZFpZORWK+A+pXHa82Hew3mwP+LCVqW+4OA7fuC3PDfuaPN5o
         LNM+UkVXWTg9f/FEnN+jKc7mrIJjW77qdxfkWz/+SQV5pArgY9KGHqeYQx306V9cpDSn
         dYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771218251; x=1771823051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3nEvUBQpGt7TgPbViNAbrgOhYGBJeReReSUJUzf2nQ=;
        b=Q+TYPRIefa67xIjxJc3FHCWEW8wBRtMRhuEjnbzgO+TuL/VmMfn9ECgNZzSUVIhrd+
         t0h1NEiulhkdrDBBT8X3LYQJcZ0/EzlRJnqU4P2rx/VTn9DY8HSBib2E8pH19LBd/L87
         rFEJtd4MgmEc66MZ5FeCK5vCxfnPNoO1FToju0zMQs9Lb/AYCwE2jsFqgjgPjlcySI31
         220znxRXVmfLtXe/jCzDa4ruTvDxtQgl6+iTKo6rqg1kZ7c/0vJYm50sHoYPeJsn2bap
         7a1t9u8a+O75c5rv6zLJwLQlO74oqwu9LFFZJrPCaEFNv5E2L/Q+teoYWx9pDZH/rWti
         CJRg==
X-Forwarded-Encrypted: i=1; AJvYcCX714QEL1HMGvt3Zv36eb3sSHqHzO78dxZf3Tdn5tnsNbvfrf0v+pIapq2ecdagyJgrfbjjbgLqRJTI64hA@lists.linux.dev
X-Gm-Message-State: AOJu0YxuUrkbzFgKiQmeZFXY6GUZnDgSMY3srQijzsJdDnoUCsiV45oj
	Ectno2omU3Peh6GXr42y/ho5L8m5UQ3nHEVZ3x2bCYwRQTkX8ucdTHmdxk3FyThwbVdRmYmGpSE
	hBG05M2S/yaEZYGy0sKfu6jaOPeFQ6aVSiA242nA=
X-Gm-Gg: AZuq6aIX9oQeY9wPy6HfE5+CyWX7roSlQ1ClRsOA/5Oko/+KzHY1pv3GcYtXogKOxrI
	ULCr6pjpeKZD053S5nR/+Bla8OTdpgz4HunF6qWy9DC6ETea5UuUGRY1IXnQ0E06Ui8Ayj8kFBJ
	wA8MaX9ryOHnVyxvIhOaGOAWt8BoFcCwHclpPggK6z1V2eIIZ7/LL5uSMT7662/zLX7q00cAsej
	kWKdJPeIRYp/UXmTHUC3JygEAvjZdy6Ra7hkVtE/0KU5WBeeQlUyhY9/mpA9m5u9v7gCLh/gvRY
	snaE1UIGbKHkQbGinTcwcYDGouhCzF3/qUUNzOVW5nQcZpc+toGc1z/DIQeVCB1Z
X-Received: by 2002:a05:7022:698d:b0:123:2d00:1668 with SMTP id
 a92af1059eb24-12741be513bmr3050148c88.49.1771218250917; Sun, 15 Feb 2026
 21:04:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204183033.182747-1-rchtdhr@gmail.com> <2026020714-tightness-atonable-8a17@gregkh>
In-Reply-To: <2026020714-tightness-atonable-8a17@gregkh>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Mon, 16 Feb 2026 10:33:59 +0530
X-Gm-Features: AaiRm50bZXn_jW7aisr3FNiN1B3kMc-JleUusT9dOJELqOyAttucPwk81Q5Yi9E
Message-ID: <CAJH1ELAO0VXJUC5s8W6KhVO4=4BA_ir94KDte+V87Vt-Sq6Ykw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] staging: greybus: fixed styling issue in fw-management.c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 7:08=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> What specific style issue was fixed?  Please be specific.
>
> Also, your patches were not correctly linked together.  Please use
> something like 'git send-email' to send them all at once.  Otherwise
> they get lost and out-of-order as you can see in the email archives on
> lore.kernel.org.

The style issue fixed was for the following checkpatch check:

CHECK: Alignment should match open parenthesis
#437: FILE: drivers/staging/greybus/fw-management.c:437:
+               ret =3D fw_mgmt_load_and_validate_operation(fw_mgmt,
+                               intf_load.load_method, intf_load.firmware_t=
ag);

Thanks for pointing out the issue of out-of-order patches.
I did use git send-email, but did so for each patch separately,
which might have led to this. If I should send another patch series
to correct this, please let me know.

Thanks,
Rachit
