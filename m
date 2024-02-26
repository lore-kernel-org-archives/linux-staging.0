Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5858A5FF08
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708949135; cv=none; b=bVhT3tCzmq89XYkaKXtk+/5LK6elHq5egPeV/l0WEkuP4Oy4yKCOyqQ3UOFqWVmpVFUlmBV7Bz8GFz5iRJg6av+cD1QLonlslz3sZNcnmfJNPas9M4KFwmSWZrp3kY4BlZtub+c6Yy0DM7uJrFYNhqJHULkt2CSSjMQGShoxVmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708949135; c=relaxed/simple;
	bh=HXalZqslNQYwXLbvprw7luRqbREUSPpfMkDGT29SA9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGioCi7ShyazEvt1INN5hW5ijrdi8+WwMr3yM9LBPaOTFhdNOhcadf8kHT2OVCDcO4y+qmLAv9jPgxrWmXhnRV7AAN5KdPA/0eTdMjSL28Qmfq4lcmXor8h/1zYmHPG1ltGkuWsAZqEcTgtCmyCS/M4u9d0gq+rS7uMaMIhrnDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dI8GKlBg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dI8GKlBg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so3774402a12.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 04:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708949131; x=1709553931; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu6KL11qTKrcmMChj9XCg4X5h9VHj+gjehFCETsIZJQ=;
        b=dI8GKlBg+3MAPSzBbtBz++KV4nnXTFLktkpvsiiBksDrwuQROkBpLJUWzO5WnZ36E/
         VNOpTl9eopY3Mwv1NJhxwE3wKKRm8BXq9EqH+T4z6epIUh+DRRojllXuvqyjLvM3ZmO2
         X2lJyXmtR8L9isBRlUE/KDqh7ghZzZ48rmopOyJDldg9AeE0Qo/qpBxk9TWaKLGiOG9+
         oYgu/V5DVWwwy+fzGqAR/nHINRor43huNpkAmglQ7zCpSuc2EuSd4FXqhcS711MH6JE0
         WG5jTA1MTKOZAlH/R6mwQ1K4VMC23KHaWsAYZ7nCK+FkgsasxjJlv5iJv6ZDXdb9ZekM
         95OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708949131; x=1709553931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cu6KL11qTKrcmMChj9XCg4X5h9VHj+gjehFCETsIZJQ=;
        b=BygyXGC8NPATjzbmPsp5vhRmUbQRn9gwqwgL85AOqJs1z2R+Sb/y9dSX2PH1r7FsK8
         sI7iPAmUQruasimfHtn6KLxLAjsDDOuMCJmr38dK4a8Xv0hefoiRQar2oNfL4cVMr8at
         eTonczC4YR3TadmxBNXDIrlGFGLhtl1KJgwPtzrLnGr1vj9ra/hTVNdIGgiTKwSPwsh2
         T0mt7k3U4+YW/HWdUASypGUZ/UpfgY7/OETcSrWMDcl+PwH3YdnPmUgka0y4taHZZ8gL
         kgv/uMGn1CCTexKIdDIHjoXeUjw1cRZ3FXaiyfuUpGlNbKwpU4WYulJJOYJW9GXPMNv3
         VU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUc8pZsWaiWsHM2vqB+baQtVemQvIy0knjXDceCFPWWKzGoNmbRxg87KidTRCRbjQmWrgoBy7ZMDHPMEffyP7W+S0XdscSq7Pjg7KlEgg==
X-Gm-Message-State: AOJu0YyD9BVVyQcqJYN1eMxLpqg9oPv2pIRJv24KJgzoYhcUee20fwL9
	R7wNl234g8w8rkMUq1qNLwblSY3eVkFjnaTK8N47rLrA72286YZ+x3Pn/D6zIu5M9xQV3i/fncu
	ppIV3+XWVX+HSJfA17ZvZETKZWCM=
X-Google-Smtp-Source: AGHT+IHmfjaGpQl0WdulrJo6xIdeIlMXBi5NQiG4QYx3lDG+bwg4WfzJO0SpEobO9IMKBdAxql4xZmiVPncCQOQXODs=
X-Received: by 2002:a17:906:1949:b0:a43:3b2:bcf9 with SMTP id
 b9-20020a170906194900b00a4303b2bcf9mr3251769eje.5.1708949130946; Mon, 26 Feb
 2024 04:05:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240226075225.44881-1-meir6264@gmail.com> <96ab1a91-7682-4aed-a522-ceaed0dbf56c@moroto.mountain>
In-Reply-To: <96ab1a91-7682-4aed-a522-ceaed0dbf56c@moroto.mountain>
From: meir elisha <meir6264@gmail.com>
Date: Mon, 26 Feb 2024 14:05:19 +0200
Message-ID: <CAHdEp89HhwiBuQEqTP8nTTy0VPrLr5PKWi8mKLx6wFzeTb9eXw@mail.gmail.com>
Subject: Re: [PATCH v3] Staging: rtl8723bs: Remove spaces before tabs in rtw_set_auth
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ruan Jinjie <ruanjinjie@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan

Thanks for the response.
Not sure I got the problem here.
In V2 I removed spaces and deleted dead code. In V3 I just removed
spaces after tabs (reverting the dead code changes).
I'll want to create a seperate patch for the dead code deletion later on.
What am I missing here?

=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=91=D7=
=B3, 26 =D7=91=D7=A4=D7=91=D7=A8=D7=B3 2024 =D7=91-12:23 =D7=9E=D7=90=D7=AA=
 =E2=80=AADan Carpenter=E2=80=AC=E2=80=8F
<=E2=80=AAdan.carpenter@linaro.org=E2=80=AC=E2=80=8F>:=E2=80=AC
>
> On Mon, Feb 26, 2024 at 09:52:25AM +0200, Meir Elisha wrote:
> > Remove spaces before tabs to improve coding style.
> >
> > Signed-off-by: Meir Elisha <meir6264@gmail.com>
> > ---
> > Changes in v3: subject and description changed, revert dead code change=
s
> > Changes in v2: remove dead code
> >
>
> Sorry that I was not clear.  This needs to be split into two patches:
> [patch 1] delete dead code
> [patch 2] remove spaces before tabs
>
> regards,
> dan carpenter
>
