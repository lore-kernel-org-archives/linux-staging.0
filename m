Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E1633B6D9
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627492; cv=none; b=Ar9hjBDcmvR2Cg355Uc8/nzGeu5AHev4ban5zjdj4oJJywmfcsu8lyNNk2cXqkyBq1D7oKX5AdY29M8hUu+3qIk5CFzA02pZOb0t4Vslx0dbn+SeVHVw7dslToOalE0SwLLzqr1Yhhs+8EcAozjVLnKOtqjI+qrcVuUUyOq/AXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627492; c=relaxed/simple;
	bh=uPZVyiAd53cDTvNL/1t2b4sfEKOy3/3jXwxTHQ2I98A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fyGNqCcy0wI9W3okamU0DU0YhEJ2nPpo9MlZp+CISbOUaIdZu5Sns9vvnLxvYXxIj8d1wdHp7yWwvO2ZQul00DE02lFGZs9veTfU2EwHUA7Um7wAFXTKbC6DlJuPY7jdotP0ZTqEiRGUjZQyWvsZT7U4ET0oFjDqhEmkWvX4azg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDCrJNrB; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDCrJNrB"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fdb90b670so770667b3.2
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 07:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767627488; x=1768232288; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/gWPzgaa5LfKzS4YfDBDSuINDb+qBDf38olYVcxwSU=;
        b=aDCrJNrBwNI60Jgys+wPjO8c02AV6N9q/AiyQVphtpLbYFrSKN49gFn8dNi7DwGWk6
         YtjLXzfNGflMqdG1z65H4TS/OyMCSrxGrsao4+G4i422xcEdo9DTfyg6yYxs159UmJae
         3sKAROoirSeNfbWzin6cV9pumQ8kA3WZdhaX7TxVgkQMb4yP54/g3hcYk1Nh5Fm3MFhs
         Q1yBoZqWFmMRqI4q3Ic/3bPbh5jw/NtZAsqkeQ75PIRH5BNvlP/nZrDrIUTZzGFOcBZQ
         HcgaykPqfOqE0eqQY2kcyQ1FHhnZnWeR8cW6ut2DmxO7S0ZAdk6K32nDz9LfdXXtKNJ+
         QkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627488; x=1768232288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/gWPzgaa5LfKzS4YfDBDSuINDb+qBDf38olYVcxwSU=;
        b=HpG1nemneA5iqe0BItjwgv5n/UC7u1OeXkjXJFSGHY0nHeEyS9/G9usad/4gyE/Afo
         J9aLHncmYdwIswbq/hAgt+8Zs6lH+10rhiMdCd5ZFz+jF1XpX8WYI8JtHS9wFZRbTOCB
         mP1b9W6pk2WSGYRwHBTC2SNEK4Aaz+c08dcpXO+QHmcZcL8YvWaUpX/GWBhRrz+n0PYP
         dNBorWg64QIdhNXeixmV6w67OU0uokc7BpopvS9lz7RYvTwTef5WiLvRGPI/Uvqqbi3z
         3wXgezGeZoAIm0ihluM3x/5LQ6wFJ8NYo8X3Tq2bxHpu1QZveHJVPENaDPtnRi4kkWoG
         YrxA==
X-Forwarded-Encrypted: i=1; AJvYcCVx59nEbNTGv6ADYv2phULAK0wuMtXBBKiz4wlUNFYt1tpp+97cm9XBWLnfZ63GZv9xyzlFqiKNIglL1vGf@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7dJZ0xZT2sM7dFYw/u0h58f0vk5mqiCCanWY0jo5/o+QGDGPT
	Fnlvg0KxD8dZcz9VunsaFFoJXef1E6sRDU7FHXUP5lbGGvJEnHCGzRsr6NmsmPGUHF0V3AOsfT4
	TLL5SdY7zvCbnjWanYw9bTx83uqdZKhI=
X-Gm-Gg: AY/fxX4eLX5YiaOL34DG79P/6FWiTNk6NAfK+b2Vwtz15JbMwv57qRSkrW+uA4iGk0U
	v6yLFM7TN1vVvvlaoCWo/4DeCd9wVupmvoZH95CcPdMd5/lPnnUCCSEW/Q3pxlVVobD9Vxjeyyl
	ZGNiaOvi7GofMliYYw79NHa/D/L8gIHadbi8xAFc/SZZ6lk7zjsGgb0qD61qSPMGvwgUF6onRhC
	MZR3CVMrKwLBBLWlLx1PAqir6Njz2v5uFTlFU4tgniDCsM1INnoI/eJgzW5vtBdXqE4WYoQbZPq
X-Google-Smtp-Source: AGHT+IGl87GGPVMUN6FsjpAQJ4VKxCFefnCPMdgk+GP3o+7QVSulcegVZl3+LNvQ6jZg7L+xQKVP9NhHQ157u/7BtOo=
X-Received: by 2002:a05:690e:b83:b0:63f:55de:63cc with SMTP id
 956f58d0204a3-6466a86bfefmr38238597d50.31.1767627487533; Mon, 05 Jan 2026
 07:38:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
 <20251230012908.214959-1-sun.jian.kdev@gmail.com> <aVumucN_RFQwfgj9@stanley.mountain>
In-Reply-To: <aVumucN_RFQwfgj9@stanley.mountain>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 5 Jan 2026 23:37:55 +0800
X-Gm-Features: AQt7F2p5VcvIirf6mh8dvM9J3boQMIoPyg3Rrs3N9TrU8ra2Ow6u9_l82iDGyCY
Message-ID: <CABFUUZEhxz5n8Rf5UvxZiFRoXQ+DuZtpa9+iS46Rt4rpb8hD9A@mail.gmail.com>
Subject: Re: [PATCH v3] staging: greybus: audio: avoid snprintf truncation warnings
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Johan Hovold <johan@kernel.org>, 
	Mark Greer <mgreer@animalcreek.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Laight <david.laight.linux@gmail.com>, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Understood =E2=80=94 I'll drop this patch. Thanks.

regards,
Sun Jian

On Mon, Jan 5, 2026 at 7:55=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> This W=3D1 string truncation warnings always seems like a pointless thing=
.
> dmesg output is really only intended for developers.  I don't even know
> how to look at the dmesg on my phone or kindle.  Who cares if the last
> character in a really long device name is missing?  I have looked at a
> lot of stack traces and I have never once been stymied because one
> character was missing in a really long device name.
>
> And also these are 90% false positives.  We just add bounds checking all
> of our output to prevent memory corruption and not because we think that
> we'll actually hit the boundaries.  And the GCC is not able to analyze
> these in a sensible way, it's just going based on the variable types.
>
> This patch makes the code worse (more complicated).
>
> To recap:
> 1: It's warning about a non-issue.  No one cares about truncated output.
> 2: The warning is implemented poorly.  High false positive ratio.
> 3: The fix makes the code worse
>
> Just fix the tool instead of making the code worse for no reason.
>
> regards,
> dan carpenter
