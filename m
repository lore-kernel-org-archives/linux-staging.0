Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C03A3E63BA
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173264; cv=pass; b=I7N6FrYQ3ManF/QfBUC5dwmeMjEMmHlAdGLvQNVy8DiW7S2Utpc9tRQy+AfJlyz1U8StRVSNeHLXdLqOs2dZdES8M6FOTHCVqOrLpI7aFkspAiNte46YzdcNlNAwJzZ9Xfc2JxXv/q6oJ8i7WtGMAo6Tpi/XhiOBJsS74Vve8Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173264; c=relaxed/simple;
	bh=KWT3Rcv56+IvnA3mpuzLgWBkmDOqdSGo4ZkDl7QnnKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ir2EPEUQ2V2CJF/Riz9DTsykQW23J58RSsvqzAy5LzZqgO6X0qHJgKdVFwWL8O8bsNO8UpBj2kR3XCGJMBB22j9GfFDGyfQrUQ47wKx1YuU3qSqt1Vlcsn7rq9aCmA86GVfsfp7cZI7Whq0YcsLZPnFIJE8jFH/genrG86smdV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGraSQwd; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGraSQwd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso58088645e9.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776173262; cv=none;
        d=google.com; s=arc-20240605;
        b=SFIi4QhxxrfSZBoGVr4WPTmHFNJizQ+FzY59ileh1mqRfBO1/oWvxOZSBdO2fIfxo4
         zwJUytQuLpqKGk+NSq9UhZcQXMQmv+RHlVG7NTe0ntsx4r//c3alqw3hrB5QNYifBpXi
         lgmXOmA/tt2tFOHSj+d8ef3Anm8xtN0h4P73rnezK48YscLWSiunmmM/vdkIzHsi0434
         D1OmKdGmvIDOaJaYTjwNEG9amRYTkDZeVe4Yp+sH2alt5VRduQyFuCuE/WGa6ei1Dkqx
         4b+o3VL+XLo491VU0Ntcm5/TIujEB9Wf83elMdBRo369KeKmOHKn1QYKX2hEnckPjyDN
         oqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=un0rHxymCkMN5f7gh8gNIZQ+0xDLGUek1PH2ppFnbd0=;
        fh=TSoj7XRIAeM02Q5cp3e8g/SWdjBjChKCBpZDQYUBCYA=;
        b=eBtVDMsDcJUfspl5J0BeE6MZvqFDCZE8DAIGiKk8Wnkpe7vhaao64OgkDSHTF3zvJp
         mx36hgKrWjkvSw/LwBGmpI84jXB3aqKzx+MKQl79OLqJBtPHl0ECA3Hzml0ymp+yRkx+
         Xaw8P7q+Ia91wx7yVRKcI0SC/eoT3/miHMQ8T8n07EAWnIe6b7rLnnEmWK3X9q75FDY1
         3Dvhv6gjnwaM3DlJ3WxBVpj5NpGAXZNk0KRK8SAvrzpm6f6rAVA8dw14GFvc3jLJv3CL
         PE/1uo0jh6F75SAJARC8SHaFGEN+rFbcqtbJgD/qeNfuBncUCV7N2HmkizG/PmVIzTKp
         qxKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776173262; x=1776778062; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=un0rHxymCkMN5f7gh8gNIZQ+0xDLGUek1PH2ppFnbd0=;
        b=EGraSQwdDL2w0d4AV7M7iLMvmQHo0/cVWsaNFgsYg3QUUv97RflPzlIVvMCjIcMfKK
         qVVxGzc9pGpd063Ir2SyQncEJX/eVHkjVdS1Av04z0QYoxGc7kEN+FcQMhi/0cH6VNrq
         jWW4kgVInww4KZvD6c2S6kfe7xHyVdltV9bYC3eL+s1AsXoGCz54xQYAB2FQSULFfVSF
         bQVElHROlNWguZbf+BNllSkJ8Aqh9jr6/yAwOhk5BZ1n2UYijuBB0SbNYq6lo1tuU80m
         sIn0OUF8TtdbqKQwo235OG9DXiaaBc/vqGnXks6LKgqG8/QnKC83rxUMmHn7b7ecixjy
         VGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776173262; x=1776778062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un0rHxymCkMN5f7gh8gNIZQ+0xDLGUek1PH2ppFnbd0=;
        b=W2jJ0t5z4Cm+LBBouqLoYbfi6NRHjZnp82KOPJf+oXndki0HxEbhVTWv9sNQU6GpXO
         gsG0QKgp0LO9+IS0wCSaDRyE448nGKckT176RVzLxlXdoRdIKlYpoOhawxfdMjK00/Wa
         4fbELvcP3sKWx0mgEwkFGFxDqXoUudc3+j+rdx7F/BvQ1IsizFxPbXZ3iUw5hzQV1hdD
         NjiaPJLNAl9FbJaG0KkWZIzHJz8nZnlzI7PAfoUHTSXu/EHkSqnABBAWztuRuJvF1Smz
         W55Xfta+zj5mQ2irOtGUV+OtqfFiwNMkc39YtGMMRSmhhk05J74HupEssYturFTj06Se
         nCbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9q5ICZhrZSxb02EQkiW0LMayyEmy8kP/gRA1zQqvwcu831c8usJPcmlgquBjOQa6gnmck2sB0YkIIFk8/h@lists.linux.dev
X-Gm-Message-State: AOJu0YxB1TQHShYQbP3TqS6Pe1vsccn86xwLu1V7Dmf4uzTMZ5BBERBy
	zTBcOwy13KhZg3zp67xm5OoqJea1gth5Fe+mdKIWtbjP6piljwj+6qpJQJBpjHDHILWMKRFfTO8
	JclS9OUJUtVQJZyQFf/Ug7dqOhcPZW78=
X-Gm-Gg: AeBDieuS9JFcPAtx0bhhgHD08bbwnnc/MojqGzTT+kx8S6RUN9uV0lFfcwJEaxivM9Z
	LEqY4r592n96dAguhGUVUX5B7AkR1CneX2Tkf5kimGgRvPinz5JjfAOECzOOtsYvisoj1GVEXPZ
	8zTfcSdkZDbf/a0qqCWNO1hkf9yhrjX1rV/GvUlR4iuI6RCWwuD1Q+G81Ho6WhqoC0n9QsWUBaF
	EvDzT8kbk185IC5O9WE3x7Kdsr+IcCmggV3+hHtVbefCIxq7jzougXfBx66w8LCXGxY182SLG+I
	zczNCUZyK90UmIeqM61xImpPfeSKqNOLI1VprT3Ck4mAfv+Y5PWlPrsx8NPGu8ESFqLX8hlxFzk
	AOdMpLthwLkAK1/K+P+a3fPjZ1/6OGrJomnVjBIGoJK4CRAxR8bkz9/1rCUi6mpAOUs5o+oXd4K
	z493eork6vLgTNbaLx
X-Received: by 2002:a05:6000:2211:b0:43d:1deb:a5db with SMTP id
 ffacd0b85a97d-43d642008bcmr22799091f8f.0.1776173261580; Tue, 14 Apr 2026
 06:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411123512.84739-1-joshua.crofts1@gmail.com>
 <20260411123512.84739-2-joshua.crofts1@gmail.com> <ad4K-K3MpwD3U4F-@ashevche-desk.local>
 <CALoEA-wikg1aDAfhgHYR10ep8a0Ab+hJ4mAUyAR4nuV4Uysj+g@mail.gmail.com> <ad4oX0Py3T8j9Y7h@ashevche-desk.local>
In-Reply-To: <ad4oX0Py3T8j9Y7h@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 14 Apr 2026 15:27:39 +0200
X-Gm-Features: AQROBzB3_vRmQuXKz884wbDyC6ipYpYDGkHF1IcWEy1WF5xQRzrs189J_mYvgmk
Message-ID: <CALoEA-zbi1VOv86FrU2Skkuota0UGcMyHVJwffyEY7+ZsMSNcw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 13:43, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Please, avoid following the suggestions blindly. This work needs a careful
> check of what's exactly is being used and which header should provide the
> necessary information. While it may compile it might be still wrong. You
> need to (briefly) read the code in full. I don't use iwyu tool with tweaks
> by Jonathan Cameron, old school guy, but you can also try it [1].

Don't worry, I wasn't blindly following your suggestions. After some tweaking,
IWYU recommends keeping device.h and removing slab.h. My question is
whether the swap from asm/div64.h to linux/math64.h is valid? The asm
implementation would be platform specific, so swapping to math64 seems
like a good idea.

-- 
Kind regards

CJD
