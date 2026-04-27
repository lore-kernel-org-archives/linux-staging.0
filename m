Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790A146A66
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 04:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777265201; cv=pass; b=CmX4XFXfPe2Ft0YLo1HRN/9P+xC1X8Uymiho3l9675YnQTeIuWjdaU3TV0XljtBoyIPAIpv/BSIcP8MK2LKcD0HR2KAtPo7FarrrstYGIl6iRXuSjYzuS9z8Rh6dnKaMnUVsiWLlvGrL28nL5ZQ42MqzPMhkCktC/ULAqy9VQOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777265201; c=relaxed/simple;
	bh=5JZeRFDKCCj0UXOmMlU58MYFaRDR7tjOdPKJxFgpsH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUvMcurNtDLdPVlaTGUKqDUVA9d8RKpyafqSRy66YaY5ki0H0Q6mD0kkNDoQ5zuKnqEtjg50xTe7r2rr7ZXxVY/+NB3kinhKNxGAtOfzgMdjKhtkHeQ7Kkj5X/yniumz+vBRI+f2P78cjX9nA72VpXf3mPnEdEQE0JuDJCTXLtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pchCRiPV; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pchCRiPV"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79827d28fc4so95822347b3.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 21:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777265199; cv=none;
        d=google.com; s=arc-20240605;
        b=A2aJXF7S7HVsBnMIGgEdojy/PRbtHRJaCrneVXac3Ad378Ia2YeWrbCkpzEh8S+sOj
         fYuWa2VlGX7Nan6HWDWeLYq2VguF4AeiwnSD1ACoYekrwcW4anhV2aTyZIMfR3Ru8UYV
         Carn+S2aPTtwOQJ2ib4oUclgMBQPK05xy0qSYv/hOJFCJwA300eEw9c4QUPMtVg+HBs+
         e8ZAsbKjoFFgBdP0pyGRjIzIbQua1kZKpkFUYjBd2GBGhyj6Pu1Nhm2guX0o2T/KaVJD
         ZwvJok2bhQB+10CCam2fnwCUjggr6SbKl4oY4gq6a+BMrebmBmmI+DnLTxDz/G2ko/WL
         /MCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hg00/cHwiPVqI1RE0q+t3jeQslbJkzQrhi3CAPPDlvg=;
        fh=vVkMI+GbwlsOQevIuw873avgkjUzHztBk75K1Hgv70s=;
        b=UinmGeO+ZneZq4F9QXWICR+GNOu3gvAyOwCR8/Fh+Fw29uii7DQXaLwe1kaa13Wmzp
         Ji7ZXvTCiuQMhwLx2dS461WmmGabJIGqSnRDGAiDULH45OHguWH6gs2CaS10SzQLbEAa
         Lf0Laf6GedA4dTG2iQP+XFRmWGAB5SwUysEYxXG1sYSHOTue/2CXT5yDSN5FQ/eMgQ5a
         ch2bO2hHURPdxqRk5zmVabqN2Sip5XaCDkXcqdq0NPhTUwHLfGy7nfWvXUQjpyhGCUvi
         7a2uu0RcQN7O0Tx5Ur749KbhD4uTrfnTLC0PthiZozbYuzpU+eW4Z/ESBsKWn4o0KzpF
         woig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777265199; x=1777869999; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hg00/cHwiPVqI1RE0q+t3jeQslbJkzQrhi3CAPPDlvg=;
        b=pchCRiPVdloVeTlQ2nSZOEtI68wEiEOtCNziepc+oDh9avuMFHFBsTtB0K0je8s7OV
         fk5cmoLzgBUZtGDEjHKeIb3WyuNGM+dH2/CaiO4ZTo8ObIai/2QE41mo2CahObJ3K/fA
         Qr+75WMWcXax+7eXxTmkQn7mm8MbHQjUZjPOUacuCPAGuII27SZHtS5sfXUq2hSh1h3F
         Nz9qwRrAoJBOwv6jvel9jGi7C6pLjnl2pkK4ts9G65pjLvKQoaVlWizO2ieZbNzNy+ya
         VG7ypm/fYP+36wv12YzInKi88WQBGhAJw8JVUBk9lvMHj0Kjl6NiaontaaeCMdCf+hQ/
         SXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777265199; x=1777869999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hg00/cHwiPVqI1RE0q+t3jeQslbJkzQrhi3CAPPDlvg=;
        b=sdE0WcZGvLgEnHZmeb4mMIlZyiwgA1lVJfU4A2mlEDopgyIIJrLQ2qCTBjqAeqDc28
         moLsgxSkORYIVUUJICqzxR7JsdB1ULkKAEbir/u3SfTM5Cizk3Ui+zh2ciPKVg/IPeLh
         zgqa6Zh7cSIIS4QhDM7TEndYEw1Y9S6VK6ZD0lMavtmyF9WCg3qUzK07eOspegMGhoGM
         U2yyc4iuZBJMpOqjegJ20kXV3PKn2tRn00S1pKRlyTeF9fQHJpisi8yA74c49WfdMykL
         chq4dcmo6iDUKCNxyh3zGxDIUVrVmPUrE5UirMK64M8s7UT1x/s12rfJOU294hT2dO7o
         DU0g==
X-Forwarded-Encrypted: i=1; AFNElJ8+gdfz7aLIOZ6zp5bXyuhtsZUUByp373H6TJHy6iDG/Fis0kVpE/ffT9TkJBZSkyvtieaNIHPKRcjUPq2n@lists.linux.dev
X-Gm-Message-State: AOJu0YxsW5u43P1LpIAicDhtC4PkDgdHT5On9768n/N3JiZo78MJF+tC
	4Tmhc37H+LxOrwWpnWJP29h4IZkPpdTStdeljael174BZ3+qAYII244GiZy1AmxzX3VabjCMRzU
	Ueii1KwwtaTh4D/vct7gOjPpkEY6HZq4=
X-Gm-Gg: AeBDieui1sG5OvY74DdXs97+rsgFXMNOOnRsMlwmE10G+EGLl9gCDfIutbjMdBVw99g
	2r9cSeT5FLxO/P3QxIEePJ/oCjOdO//4OrEB/8ifC5AFBYlTQhpMHpfvSYA66FxcOxzV25Zbnjm
	PvUXt30EIfXUIJS+DUMiHRv5Ow+WwFvFLUnps9X9qqWuJvTHjm5EJC9wMdyULQHCfflgJKet/14
	lPUPI1l8ns4VUgPpFe1h4H7dGwpDyDAmPJ7Y8NBpozZwuKCSty/wxAYewG8tRMtN7oWOuy2F7DV
	RMTS9xshN6/yvj8=
X-Received: by 2002:a05:690c:84:b0:79a:c40d:b701 with SMTP id
 00721157ae682-7b9ecebcf3cmr393988477b3.13.1777265198689; Sun, 26 Apr 2026
 21:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418230344.44242-1-m32285159@gmail.com> <2026042615-ambulance-upright-3041@gregkh>
In-Reply-To: <2026042615-ambulance-upright-3041@gregkh>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sun, 26 Apr 2026 23:46:27 -0500
X-Gm-Features: AVHnY4JYJCJpwaNFhEBEMqRZCuWUjwn5I8y4s2iX74zQEaUutzdg1tyyke-60Wg
Message-ID: <CAKqfh0HJtz+hjJGMcDGQDQeUQDP2u5JdPh8YVwV=Q0MWhs2tTw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: octeon: remove SPI, POW, and PKO typedef enums
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tsbogend@alpha.franken.de, len.bao@gmx.us, yoelvisoliveros@gmail.com, 
	error27@gmail.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sun, Apr 26, 2026 at 10:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> How was this tested given that the previous ones all were not?
>

What ended up happening was when I did my test compilation, I'd
forgotten to compile the arch/mips half of the driver. The test bot
obviously then caught that and it ended up being fixed. It's also
important to keep in mind that this is (or was, rather) my first
*ever* patch, I hadn't learned all of the tools of the kernel yet. I'm
almost certain that this revision is sound, as the test bot hasn't
reported any errors or warnings, and Dan Carpenter hasn't asked for
any naming changes.

> Also, this should be one commit per enum, right?  Why not make this a
> patch series?

It /should/, but again, this was my first patch. Obviously for the
future that won't be my excuse again, but I agree now that this should
be a patch series.

Also, I think this v4 will be my last revision of this patch. The
integration between arch/mips and drivers/staging has some serious
friction and I think I need to go focus on the subsystems that I can
actually make positive change in.

best regards,
maxwell
