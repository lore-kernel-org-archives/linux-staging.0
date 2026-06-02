Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A583A8FE6
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 06:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780382284; cv=pass; b=TX6cwfQI6POsbHXnb9IZADbqnWbwEtqqbqH72CdTVrX3hTj1Mf1l78M4+I2xjaT2FWpFzvrMAXE63O8zgPQuJ7kpdEE5Hh2krgMm0nQqL71F3MEU1mCVfmph4tiQnAWk8THLgqZisZe9OQHQc0M1seEqjZ/CcWLjjzucqlGWPRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780382284; c=relaxed/simple;
	bh=JbxGCQikWsjtiU448LSzqt9IDhzgB3hvRcjsRFezC48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bM/msJyhuE+q4JftRZolsgXKdV8HWLB9/ZXlY+PnUb3praTztfHXkLh/kVP0+bWrtHZ6d4aI0rV0XrlD2voLnSBLiNGLslZyN6Ib7yMeUqBjRQwtkTd09EJas6vtrQUrtPkLbOgeNxWzK9yQSlIHNUze/LoSYQrg+25EgQzJ3eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCsNIKlD; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCsNIKlD"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so861548a91.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 23:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780382281; cv=none;
        d=google.com; s=arc-20240605;
        b=dWyJe8YCmdE9niNUZMKpNtKHyaeFo5TnqlRWFCs7b/g4j2YWb6oBdkP2m5xlX3D1XA
         PnOM3mPlVndmeITqgi9K9rwzXRicTJk+dYrm2GJY+bvBf2MJLSs8nbaItf4tRM9pRy1x
         1p8j9v54uwc/xSbfDRROHm0MFsvWK0LQ0R0J8Z8CNNdl30ZepFHJG4HXbUgp36ng7qwA
         U1SGnAaRGE36+MqfgdibsepvCxisLgw31G3Y3FLo4NKT6mQP3FadLX8vhzcdBQkpDpDZ
         1jd5pSmycxMHyItVl224TFDVvkPPtxdoNkl4g5kvsSO/A2eLzFn8XoXhexqeQjcSn9/j
         jeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7nLSxnJo2ojzbc9ZCEria5uzbpX3eTCBAbiyI5bsEg=;
        fh=huCVrSN+JY4c5fakZoYM4qDMw8zTdIWJ3uDMVpwKTvs=;
        b=GhyA3+l3Iv9c1Y8aPP1MCkviaH3GogwMUaKtmtawQ9OBJ+SyKh7uCpRpf3JlfM6eYP
         w6OuSeWwa9/h6OkNZ9Q66+Hw3TkCcI7q8SY4psCAaPJEQ0uAmLygnmOCEmDmQvB9l5uH
         aAyHyNRuAo9qmYWSjupVGsIaMLDzqUtIxbjuX9vpCCzrhhe2kFRXd5/suU6QI+q06N2O
         m7gj2mAT1nI7F5VRZuRWrZFPceqxb1OYUk2Rln7ZYsOasGrRSsmH4LPXCE7m9+N9gqHa
         w+iFJ6GsoQNgKFYoh+Ku0XlLtK3020KCemAd0mCWHS6Mnd0Ci+XMGsY1Y+qbjU1vFLNk
         Zsgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780382281; x=1780987081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7nLSxnJo2ojzbc9ZCEria5uzbpX3eTCBAbiyI5bsEg=;
        b=PCsNIKlD/eMgdj9RMNGc/ST5C88ll2xcehFKCAzFS3hTnYHR7YtkKaVJI73nO9Agxm
         NymWXH6RvTd44WQz5zXuvAg5AyaUF/jyldb0u83GlyarEwd9n4cG+e2W9s7DnatgcTTS
         t64uJc/I6QiQhPefibgGIsbn2ZJe5U8uBooXhjhsI11FcLUAWbR+LqJClcOzhYVcnazw
         Cd30nnDHJr8VGkiyeKHofPlL3RqX3WA3KWyMW0rzJQ6F9i9byNfaJMVTwubEnK2oKTf8
         wJGx+UJg5F4PvaiNDjfqMdBqVCGNUD0477YfYvF8/NW/3RwUxZ/KflU/whFXF3qgDCl8
         KmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780382281; x=1780987081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7nLSxnJo2ojzbc9ZCEria5uzbpX3eTCBAbiyI5bsEg=;
        b=RIf0kKS50eIJVR7CU5webM/OXp0tyzQgPoU/TV4GctE0rZBxLQOhUKSaEOEtoDL8CO
         GYizzcnkp2ns11ftZjmYAhQOFm2qSWm/Y3HatNfUssBO6E13dETu5kpZOc+gOKjMrqDk
         Zxjp1yJbJNdhft3Rw04o8DVt8TcrLoTytNaLDNzAF1zU95VG4p9+fLjuiA5HZXWcunhj
         335Q6mt/lVMoxNnCd4/YcznLX8A0EpXZmYDJqNalpaKEE0dFJf1N/eJ0XeWiEuPlbt8F
         ReQsXZ7uCKij1UGvy+VBPCbGD3HBE4eP6a7nZiaJPZWFPB2LedEexNZ7KvPcnnT+d7VA
         HElg==
X-Forwarded-Encrypted: i=1; AFNElJ9Pk9dBw51O95Gbk3jZoS/bdw7V4dwQgnrS5ovQlNyfDOrBq+BQvUanSTPQqm6bsSwxB2QmXfIeUMTUFyCj@lists.linux.dev
X-Gm-Message-State: AOJu0YxDJF+nFGJ7eWwDDpssY0OSLAqzWGa0aOzMmQOE827PyHUD2dY+
	yVSkD/zQKHqy+6fx3PT3D9vFsFUVbSVxhXBX9QriRv7A1Cjo4rzhEyNqAfSAyFuWYAlHJ5lJe3S
	QUecmJPS2y2q5QWpB+JHdf28vwybA4nw=
X-Gm-Gg: Acq92OGZJM1lhPIbXyMJX0tU+uTxAdyzVOBMXdFWV1LgaBPqAxTlsGXdfeAtPWTxs/1
	6bfpfmYgaMnOjrgN5Gi+JX3FfYn3qOXcQmF3kYHG3xRDTJUuSO65fLgOXdkdFH+9S1xAxRJXIA2
	G7ZW9ZvmxBPobW8aqk6uvpqRRnvilHDEyN/otkbK19HvnF/T7TB5/yOw7mdMw0K7n221Vtt+lD7
	qmwohFqcldHK0LKJeLRSVpZJvyQ+A6fvEK9dE74B5PL0TgYe8Okfe7m2M3Q64x5dPFMZZIu/E7c
	ZF+QbDJhGfXeCDbeiyg=
X-Received: by 2002:a17:90b:2747:b0:36b:9c70:3367 with SMTP id
 98e67ed59e1d1-36c501e8716mr14091662a91.17.1780382281075; Mon, 01 Jun 2026
 23:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch> <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
 <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch> <CAD03fja5oG3-BrQoy4+LEmCWPYGW_JWDEkaPndjSVz=PbRj4wg@mail.gmail.com>
 <2026060202-wad-skittle-263f@gregkh>
In-Reply-To: <2026060202-wad-skittle-263f@gregkh>
From: Grewstad <dogestad24@gmail.com>
Date: Tue, 2 Jun 2026 12:07:48 +0530
X-Gm-Features: AVHnY4KvCpb-kqDRYenuUh8abdPrvzxl2AJlcWi_F64K9qRgblLI8vRI3yS8KdM
Message-ID: <CAD03fjaHmsYpLj_PU48AW7h=E6XdMpqKsS7wQtDQKnEkGpa93g@mail.gmail.com>
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Lunn <andrew@lunn.ch>, jic23@kernel.org, jacobsfeder@gmail.com, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 11:28=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> If no one is using it, why don't we just delete it then?  It can come
> back if someone shows a real use-case for it.

Yes, this is what i was thinking. These boards are generally used for
development and research teams can probably maintain a patch if
they really want it. As you said, it can always come back if a
user-space application depends on it.

One drawback that comes to mind is a development group may
currently be maintaining a proprietary application that depends on it.

Thanks,
Arihan Bhor
