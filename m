Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B526393DCA
	for <linux-staging@lists.linux.dev>; Mon, 25 Aug 2025 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756124922; cv=none; b=GYKQvLughGUe7xmWQ0hjaNhk9/3cX83Te8bxQM18PQ3/x1Bw5zGhMVvoC6YaWzaTATQVkG7kOIFUmbN9HnOsKeTJwDktJR98ajNObHScyiHTDEbxCEaGVg/t7YGKv8kjY6dfufzXgxYwMAP8bLG623ZIkIuZ0ASRkUx0O+tFzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756124922; c=relaxed/simple;
	bh=4Lk7NoEo7FPFpb4K/8g11ONHGWOBy/M5/m86pO9dRsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMinGohn7wqfeX3dMbHgSF6dVP2kDRNzLbQvxLte0g4Rwv1S2B3vxZ1/aGir2tTObBSH71t22cVqWcjYX3TgFu8tdMOfUwcZ+gm3j9OCxJe/Ay2rpWvsKIVUhYDUh3IArFxu3oDYJGJ7cR8pgEBQsd6L4Umf+23vqmz3NAPPq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdbCo/ow; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdbCo/ow"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb731ca8eso680824766b.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Aug 2025 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756124920; x=1756729720; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Lk7NoEo7FPFpb4K/8g11ONHGWOBy/M5/m86pO9dRsU=;
        b=UdbCo/owZgMjdOTiCcliWJMDNanbMZcf2booByae1mv0VLu9QNaA0e3L+AZKrlS2+a
         eSDVneq0/yMzrxn7pL/Kv3DJK2wZ+bXkaoTCv9JKnVRNUeXD3sk4gkWtfACo6/ke+b0b
         C6roZhpJKcgLkjup/CKmpCcwklfAyekt719Wrh7uFgyAvYd3cBcWG78nUP7GNiCjRfvN
         GVEnz5V1ucRI2f2spg6bdxbTZ6vb1lEj+Q23AbU6BUejysIOA+Et365UnVxff+rC5EfB
         YjXbemuw4tu2wjvaPcoYY6HTIIP1TyMK7mvmj4gQoQxHV9modpnTiXsHcJssFqWTauu0
         2BSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756124920; x=1756729720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Lk7NoEo7FPFpb4K/8g11ONHGWOBy/M5/m86pO9dRsU=;
        b=j1J+sWEcE1KaY97iZcfVmMP5TqNo1Acy0JlnfD09cGdkWYD7eNzYqUIPDowMoqV0XA
         eQax1uau4Jer9UuNG2L7KDwlkqxS+XblLuTQLWchhiMMPxP9jl/mAgHrLSX1oxId05Zs
         3n71G9JHZ30Y0tU9oyDYW7WUqiCEBJg2rUygqihgfD+WlrDQGWcz2A5er9kP+Z7GfvYG
         BjeEISHQIBd4a9bwiqqGRbi6fwJvPS2xfNYUbj9Bv+OWl3xk3zkkroGwFjD0+uQXagST
         rzfP1DliESdtGFYk5FxecgoXAGy3Rn4k2vD3sLeXM+g79bMm4BFgZfsn4RLgYB/osy+R
         1WGg==
X-Forwarded-Encrypted: i=1; AJvYcCWTwYe82mHsJqLFUgKspzRovEKuywbqwKHBUo/LSAhVrmrF85vqCh3rF922Yf+q70fzP3BwvQ5SCapIE1s2@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+ik8kHU1iNEG0cftjp1oi9wCRn7y8mWWUREEQqijh7iQwrQHc
	5rEZjeWtAb9hhAhwWFxzqrbpuhge3/K3SgBrthhjrr757kFgHNbRAEyWys+ZzWBKdnh4Qx9StQi
	buhf4Bgeza3H4afoE2FKm+/KnmYVL4XY=
X-Gm-Gg: ASbGncsiqXnxsJKjsR+1WUJ+PM11lDGJpc4B17rggiRQ5sIKGjXziPKOvcXBexrKl1w
	LxrKQxM9a8dvgTDxzf7K8u3+H57iH3TmRIRmw4nt5RZvfnFSV4Q0rq0PZg1s2pWhb+jlYZUuvN5
	gSWucrJDKwzFnALn4c0yOSOBpH/eWFX7iSiQVJd3igjDRSCm+73fVRkTNtt5b8Jdi4f0rNF5zKj
	JqltjPwCA==
X-Google-Smtp-Source: AGHT+IERnL55xCKZRXy1X8l4fOupr66TO4qOx1FUypqB9hww5LZNEmyNeZy2VYLMnVLvQkoSA2f8e77OAuUIJKypfkk=
X-Received: by 2002:a17:907:1c1a:b0:ae0:da2f:dcf3 with SMTP id
 a640c23a62f3a-afe29615646mr971179866b.59.1756124919511; Mon, 25 Aug 2025
 05:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825101515.953993-1-chelsyratnawat2001@gmail.com>
In-Reply-To: <20250825101515.953993-1-chelsyratnawat2001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Aug 2025 15:28:03 +0300
X-Gm-Features: Ac12FXwDuMLoSewvb7LjGv4A-zke8mMbHcj5k5vh_asaK9ynJpHY2pt33pTiH-Y
Message-ID: <CAHp75VfRFjC+zmp8VcaGQgmjzRdV=XP-ULM629MuxcS=RhQwFw@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: Use string choices helpers
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: andy@kernel.org, hansg@kernel.or, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 1:15=E2=80=AFPM Chelsy Ratnawat
<chelsyratnawat2001@gmail.com> wrote:
>
> Use string_choices.h helpers instead of hard-coded strings.

LGTM,
Reviewed-by:Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
