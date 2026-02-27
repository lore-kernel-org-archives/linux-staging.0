Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D52B2749E0
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 06:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173440; cv=pass; b=sWwSLqDVArYGKqK08RWhijt2dXKXIeJLnmq8/zURYPssL7hVbDKCaWTr3rD/f0gXZKl3chLMoipL7Wu+gOt2i52qKXO8Msj5ANbzSYE/hO7LiEBDgUHEZXvau/+AVUS1mety11kupklSY4+HL0aYpNW/+rINQS91CgVlKftQrac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173440; c=relaxed/simple;
	bh=RIdu09cgmN7AWnbQ29+6QXVJKh+WbQKElKqTZ8Lvo0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEXXAKvtZji3jvF72PxuT4Ep7c1Te5L1HQ0QNS0uVmLLrq5GTTZT8tRcB6Z3ZWh3yz04+KJk/xGvuzS/VGLJ8aFHKZKWIdibnczcg3MkP8YWcdg0P8hzT0l0fLsrnxmOnt72Eklmdil3jpAPwC+lXq6ScBbiP6NsJJ/rGeIQ3iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2vUWHsu; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2vUWHsu"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6470d549e10so170422d50.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 22:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772173438; cv=none;
        d=google.com; s=arc-20240605;
        b=E1Vkhx86vcidA9SYL+xLDMFf0o7zr8x0E1UX2rvML96DSOfC0cLU34H9F7zUZDn1xJ
         oBRMTPE+SNUUDVwZW9pHnUJKzRWJJ7RvZovwQsF9Dpb8XIBlmuUf41YJ/EDZjyLS0MLT
         WCOioualGwThPKitu1uHdGl4BHtk7+irnNx/fBkZKSxgcVjC6ATxQLwrzjn++veldgSs
         p+pZFkBhMeMxC/K0nCfyEo1gcCHbpnZYQIkn5fHi2ROJ4LfVLGDPiFwbglfTOGmf6Wf0
         mTHiq3VdQMgOz/UXzgK/NcQyHeCf3D2sDg8gP+WT47iCGZnOiBkg8EebwzsgoAc/FMh8
         CUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HnULRIfzoUqDjjh58g+y9yG0scmoZlMzq9iJh7HGpog=;
        fh=aiRgke59QYld/DSa/j8l1wlchb1kvrkKH6Buc13EUOw=;
        b=JeNdEsK8FbSfHhrSJz9MwX4DhHuvUDoonxtmaf1n3vn5+uejJyNChb2icX7P+gIzcG
         WUXM6NUc9jbZvHxY4tnGtvrQq5/SwOWpRhw0CEy2oKSLXUBKYcZrvl+/fq6/qCO8NhWj
         zSPfk8I/YkdIIRqfT+/T8JRBKn57g5dm+wKSa/VKodySninYoU34MmMNdtV9I/mvL/Pv
         3EV0Fg3F4DcpCeohLokVHl5Zm9ehZYUGeynK5eg7wIle86qPcUk/wi+0nJ4nuJsmup3a
         l0jVGE261YPtQD0oSdalUxvBbefJkxCo8xlIi7E13saMstCi0TzKue8lIrF5mynmREN4
         5bqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772173438; x=1772778238; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HnULRIfzoUqDjjh58g+y9yG0scmoZlMzq9iJh7HGpog=;
        b=f2vUWHsum7lXzBYYZNKL/6wWn3SiB8vIyPH2WlSG8KKV9pl2bh7VcSbqRG3kkJFrQW
         nV560d8lt40glm+s6BAQugueZxU+rqzsOdWV/G839WODStPiRDkCgYhb6yk0vegpNvx9
         KxcGgcuXwduN9bQ90Iayv491jvqVbRKEeJeYa1hS+a5Xd0lkG6JLIFhnfopspqNhbNps
         sx2ROEU8WSXBdlg/st66VNDOPIOuhJ4/xIolqRR0Noy6SLfSD/8J9wOfQ7a7vYRNde7p
         wGdmkAyzbh0Z33m2rFuk4fdpdvNTzzHvUErqS2k18gsv2ZeGEyi/BXu+3KNYbhe9ByoZ
         aJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173438; x=1772778238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnULRIfzoUqDjjh58g+y9yG0scmoZlMzq9iJh7HGpog=;
        b=PhPefBY15qGSG8WOsQAa+YQcFD5vkKEo/hDridRU6YU2MXw3Pu5gMpqRh+sHF4tPZZ
         syrLmqYQD5i43qSn0ydp05oWymcef1HVbD/yVMP8iK+r/mIyaPczY4H7NGplh0VMVVzw
         icltorxfbYvDcYguiCrPGq+9NGJmhQ4tA5b2uL58JsUL7VF3HHp4P8FfeHHMcc+jDgGI
         o6bQ1cWRmaQzi3qjHv83oUVEVW/6xv1Gt/Ib/MKhUNdN24qR+PUNYTzDpwdyUWpCF4JS
         29bCHK/hqBPeiJqtcpUQlFaqxuMTShZU+ZC1QlmEUzolgLWXK2Z2Nw6h2FrKGh9nDAsW
         Sb9g==
X-Gm-Message-State: AOJu0YyJNio3wtr+fK6uP/Ayr/teDPdCSBXys0O2aJHnX+Exs+TGeWcL
	WN7i9hu2JhaLOccNzN8O5WLyKn96q+m02oRrqGh+q/UvaTBDYTMpQbi/XPx+E3XM0Dn0UFcH1Sj
	btsfgGcrYM8P5oRTG2DJkV5FL/15f4JYb7CMFlMo8JA==
X-Gm-Gg: ATEYQzzjNlcwxYgklmVCHN2mKMgoA/ovacI6p11z1LBlr3EqU33viMHQ2+snNLdiTuV
	89QE7uZ0afVkJTBwJZYd8VdeZuPkrQZWWxpG0nVP2bH+mNj2924jB6T3Liz8qeXa/O6IIKEsocw
	lymQ3V+quSPCqiZp8nhe+A+QbwO8aG7MBowYh8Ph96bof3D5ddeAYmZxY+UOakLWBwyjZc/5kFR
	D7I0f0xSug3E9s50XtvsDvuW1OlXZp34Inp7CW6s65sf1MaCcXGGWGlOQlQgf9ji86igeeiFqOS
	RxCVXFxwWnH7/1z1csSuyl0DsmZEBkAcKD+EQbNkoIvHOgmNO0DfbdSwPCrRE19WfBnBba8zkwn
	QQJ4rjVDvjiYr4pl8A+xm0g==
X-Received: by 2002:a05:690e:14c6:b0:64c:aaa5:ebb3 with SMTP id
 956f58d0204a3-64cc2047398mr1519865d50.2.1772173438382; Thu, 26 Feb 2026
 22:23:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226100255.167059-2-giorgitchankvetadze1997@gmail.com> <2026022627-specked-dweeb-79e8@gregkh>
In-Reply-To: <2026022627-specked-dweeb-79e8@gregkh>
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Date: Fri, 27 Feb 2026 10:23:47 +0400
X-Gm-Features: AaiRm53FyW16of2HGyrussmIaAxs_YiVN-Pff80xtvm7qQifkTMxXIbcRh2I-8I
Message-ID: <CAE7dp2oXyqwFtJ3Bm3m7GDfDgi9O_WVTZ3U7nq9xiRmzXsL5gw@mail.gmail.com>
Subject: Re: [PATCH 00/12] staging: rtl8723bs: remove unnecessary pointer casts
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 27, 2026 at 9:58 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> None of these are showing up as a series of emails, but rather as
> individual ones.  Please use something like 'git send-email' to properly
> thread them together so that we can apply them all at the same time, and
> not have to do 12 different interactions :)

Sorry about that, will resend as a properly threaded v2.
Thanks for the feedback !
