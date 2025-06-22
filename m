Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B922F2E;
	Sun, 22 Jun 2025 20:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624719; cv=none; b=PRv4+zRFUNwuDRjCP09OYfNscTTjALtIFcfUjwsC2zZUFSvL6bmFTASltEgzup2glpa5wOMoEBZa9ZdnOm9c0yV2OArSz72aelF6uM3TC7rXRk7m5to9oJ08k/91rghSih+ZXt5Bw3Y/EkVxk5tWJnWcT7M/KFpFGdFRpNMP3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624719; c=relaxed/simple;
	bh=WmcUJz5Yg3hFpCBfEpBPaXUjMp4R+nRl8xFq2ZIllkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTuBoXqqcIEdjhVos/h3DJ/PaUW0siM2wvyyydsBZrRj7jyRV9HYmjrHJoXc3dJZa/Ppfahw/jDgpbKmP4vAXBJOUcXM58IrulW9+p8eerPxQ8q2w3hpyDSNbIq1kRLrwvG3/Hyg78AK1Abr3nGAh9uqH/utJ07MJdOu8GUc+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XN1f5Z9N; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XN1f5Z9N"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad88d77314bso727612366b.1;
        Sun, 22 Jun 2025 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624716; x=1751229516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLvpeoBKGxEwHK+9A/jrmaTsC1Syd7TxhtlcyFyT5Po=;
        b=XN1f5Z9NcUb3A3/JoQgjB7doLg1A9A5sUdgRijSMmVRBNF+2dHkao9Xe7G4JmTu0ap
         hVq2HqdS3G3m6f9SY3Dz+nzLZuPsf0gWsHuf7jvgD/UuV8nVQhwferCpDBVqQSFdA9Xc
         f11VvpqHSra7nDyoOsi2S/jpOyoQL1bZRsutA8Prbu8HK5NmHRH0GbrGqtJze/BHwAVh
         zb2UPrZ1pE/BGoJufHxZFWNCf5u31pUH0RgqYlhmsLkFX7PiKYHlr5Inttwr+zw8RNVg
         ruFHp36FtyeH0V3nQcY5Iv7q+6YvEU7NAGlMlL9DetCDdoj4PQNak5jjHujF7LCm4zGl
         qBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624716; x=1751229516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLvpeoBKGxEwHK+9A/jrmaTsC1Syd7TxhtlcyFyT5Po=;
        b=Ky5M+pG6+ftQICkFLOUISF3vORZWvT5PSQ6YyLDfkj0alYF2Sj02XVfIfP+HKPdKPj
         JPVJsn+qqwU4HIOPt3XwW+H1ShkhQpjJJiv4/4ihB6e6GgzP6ScD/tsEHzFdNYCJgPnf
         KgmEXYTZOC4c28z4QQf4no11edCqOAYB56qxpvDIOnx997LTv+Xl53YZBMaGmzQdiaav
         87bq29PH7b/gcAaAGq6UX92ud4HKNvay0FTnZ1vg6knddes0piBwVnrdtasfE6W2TBZ7
         7mCDA94P2kPX1hrM0nYERqWs8gMVLJ/QGl0w3Kqc3+7MpUKdZTmo4CD9rj4R75Je9H1p
         Gb2g==
X-Forwarded-Encrypted: i=1; AJvYcCVexdtFMqFDdrnJY+Ix59M2vTFNxeKhtGWgiGStXv0ZTGFiZ5AKFRD6hUzDgjrKDsa4jb+DakPCA91uffEomyEFG6QoqA==@lists.linux.dev, AJvYcCWOQVG/hyqPG3jelB7CylNqHtboOJuKDYpgqd2aPiCOXblHXUpyQmi4sAq3B0m+fbCuAtoKlITqAk/bdw3FBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/reyny3Ljy+2zoHnzBhdtjVcqm6dLbgfySAy+LRXDqzdvAVkE
	Sss8TmUxPuFjmIDEX+ToMRMoNo/Fc4fSF+EL2BXDz9oRDeT1s/CylTNYz25WL/fJdyMSjbMjTBS
	QGfo35ummPSNyxfT2Dw7f3ItEV50rc1lavwVTzMo=
X-Gm-Gg: ASbGnctKUcHbncPYzGsvollYUxJQC9QD9/OR5m6iFzvEls6jxrx7filYeUzzWMp3pPu
	XwvbWUyBDB40zpMOISxTVfg4oykk/Vsv6PAwbzzcIB5HjsVX/2LF1dl4kX9z3USnAdUt0AbPY2q
	axgW2osNg9Q2sbsNnXM/hvbXMZGjy+HNp5OwDdcpu2tS5ar33kG5izLA==
X-Google-Smtp-Source: AGHT+IE/HoTMfDM7iHL1WEJQzvJZNfhHGo6JhKrsBNXN7rKIGFaxNc8ayyuH0V3IDNIADtg2RI783/alPVmgjMgX8UE=
X-Received: by 2002:a17:906:6a26:b0:ad5:3055:a025 with SMTP id
 a640c23a62f3a-ae05793836bmr899848566b.6.1750624716133; Sun, 22 Jun 2025
 13:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:37:59 +0300
X-Gm-Features: AX0GCFuPJ3qLOkF8NL8wgvWgUOpxetYnW9jsPJWLIWP89I8avEKk2QlvIPatJTw
Message-ID: <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> PAGE_SIZE handling and standardized sysfs output.

...

> +       /* Changing to sysfs_emit changes the behaviour if failed*/

This comment, besides missing the space, is useless here. You need to
use the comment block for the proposed change.

> +       offset +=3D sysfs_emit(buf, "type pgnr\n");


--=20
With Best Regards,
Andy Shevchenko
