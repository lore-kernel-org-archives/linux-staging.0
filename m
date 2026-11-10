Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794301260;
	b=A/fyKMNleSkLfkCOn16nWNyhHUxXa83DPUWIfp4SJml35qzCDBkQEDgfC/Jg453buCW/
	 gYq61B+mKOb6aA7Q8aHzectJcMQ4Vb/Qy13Uj1bsHCYAhLMRs+oXB6XJOqoriFT6UEziB
	 sJDngnx8+70ly+4IlKo4szbfKK44d0xnXtoRpdU7bLZu3PQXt/3Myoj1rlZeDJOVB4ZUx
	 q6DSyUt2xx+I1OVzeHI9Ft9A+ECRKrbluhAggSDPcvclE4gzWurv1C1c93VqxQxnCAWNW
	 HFsr2PCKN6vCHvJ+RSNGR3BPcgJaySO0juU+MYwiH6y8Aqp28zoBfOhCHlk8AudoB6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D/l1DG9pW0EG2fGxLRQvmW7PF5RxeWs5LWhd8jRdOqg=;
	b=T6jeNfznqtk5D1VtWRjFXWb0fxgDSCZlwTql89usL7kqPjlN4Pt49h5CRd08G9ianLcG
	 3jOA9kQq2gHh8MfwNp+Nkown118TV34JEcjMbikzpNnc3QlouZQwwfkh/b32840Sr886I
	 VbyUy6VFw905KE2/N6+yXKqoxMr+31U1GTMTI2pGI4LooEZTKLgknd2bho2SJM1q4uPLJ
	 hs2RVL50bRx/L0x8rzblYNFI8ahEd5jKwfvDcYoQ9QAsGxyVQn6I71hnUqJcYNWTnVFcf
	 5PWLmPyMi3WlEFRRKlC1u/pQ+nepPzwCzJDUwcIYINp/4IE9Uj1d6ExK/vGPKQOy8PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O4Xp+jeT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABED3606A31C
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 09:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABED3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O4Xp+jeT
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b331cad3cfso13728957b3.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 01:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794301258; cv=none;
        d=google.com; s=arc-20260327;
        b=hgRpVTZc6UxETel3NPR6yQF/2KdZ4lYRZiIALzXIk6ZLbkxUVYqkk08IqXHOXlMeJE
         S3uwKDAC/vhqyEPZN3RxXfbKC/8XFT/p69nrTW0filu66CY6M0q8DXjMSSOtabRjZB2w
         s3LehLM/0eVoAcX2nPa7MPMEG0vN+FSSJJCb8Hy6wshA8yOlGvoPDOQUQjBkhKiSQhuV
         MOPx9Nmz1PH/sYKQoEAopvpEJ09k+p0xT5EG4c2YDJgC8/nDbaSKorBo6l1XlcjzCmwG
         yP7Tq+S6W7JlBPsamLR6O3iNDz6bRLgld24cYlse46wFjJNg6k8g6dc3Bsw1+Aj07jLd
         aQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D/l1DG9pW0EG2fGxLRQvmW7PF5RxeWs5LWhd8jRdOqg=;
        fh=r2uMFsaiiobtnHQ8yXzohCeFP1tVX4sb2zNiJczKzNY=;
        b=jGsxOVloLgFdEA1FETly4gMQcW4D7W/BgWFBjPNLwM1/72ZLI6pt13D8uLtDpSVW/0
         fqMf/MfLbM3osOrWKKryeEzSwfcugLVUp5oDd+5rBdkTn4wWpFfNW9mxMMHBn2zikbEg
         LMpTc4DJJSndDja0P5N7BmdahXNz+eDn2Sm7Ver4oTSWlfZCANN3HpAKkOkJdYsFlHs8
         C95YbHcveD7eJk4+wqg1qSZCnKrfcENQxrnlGPvyJRMdwXkpFt1Pv71OGfi8L/udDJLy
         ay/rnQLJQv+DDj0pBDH9lsMPKTbWBSIuv/L0MJ3QfKWwrq61pXY3g4IRsf7FjJw6jUAe
         VR7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301258; x=1794906058; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D/l1DG9pW0EG2fGxLRQvmW7PF5RxeWs5LWhd8jRdOqg=;
        b=O4Xp+jeTj2R8Z3fW0uoIbG7I1IUaSyW7LF0KN8g9yotE8LDr7iTcZ+mXkRuk5OIPOt
         s1T4nQfaUzLbYt1Qx96hdQC4XuyFm0XHmpzg9cPHlAkBhfKDqrklHoHWM6Xgrm3/cX+R
         CiJcaanajfT/3SUm9ldjzFL4thPXCNpGdV8Gz51rHKYtY6qYVmYdRxhWGaQEsfosJBDD
         zJ2CFdQ8AmpDzgojLJQ2g9hOvmE+6EHsMhHHS+51JAVjibZrrwQwb2PoFEADmE9qQymI
         gD+UmA6vz+YIKujtccEkj9uMmtuWDEsFdEKZapyGi4vbgiuP5ZJpKaBGhuIdew4XpbdG
         zzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301258; x=1794906058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/l1DG9pW0EG2fGxLRQvmW7PF5RxeWs5LWhd8jRdOqg=;
        b=KTqsbh/3nEqZIG9ErCWiJIyPeYwzvfRymH63djKCWPOS6kMpKHsB4Qd5lnaqyCFV5k
         D2l1sDfJfl0lwJFRoomGVhm55zPADJKWeGml/XCE/4TfEiMI3uV/QdKg99ZTiozZhz0d
         Xi5DFpm0Gqizf8F3l8zIK8/3mMEzzLpVjOf4zx5n+cyn5LSzjkn9kCOMZiDuo8Rrse73
         wN29YwVaysOO4KZLkOT/BwolOGbfI6bV7SiRf/pvKzktPEE/IQ03j4u0zl/MdHug+vlG
         F4fpanXeF8tSo//6flYLcZNweZTXr0ounKZBnUc+Vd/XmmCLx1nMAgt+Fnv0dlnMX8g+
         eAAQ==
X-Forwarded-Encrypted: i=1; AL+hErG4RZBj0mbQSnATKv8/CLRp4YSmspGwCbS070plhPa5ychk8YvVR/vaFEn+z1sn/fGv0Ee1A/zs+0YDVKxF@lists.linux.dev
X-Gm-Message-State: APuU4Z85rpXef+A6tvbkaVx8UDuE8jhVn0jVB+g9J5IAWT6yLdyQpYKQ
	tlYShSvnEaczfAfyXJbKNl4w3VUEoojRdXBrLZ1hSSxqybSDo2dLcNk9lERmxEgalsFApCisRWg
	hOmjSCW3ADtXTl8BNECiT8p9flduBshQ=
X-Gm-Gg: AYBFou1piguHv8h7YCW73309K+fPgI8BdWODRz1D0MsSyHo1lZAb0mjYWLk2Qr/QK31
	L2jqSsRIyDAx5A+ZjJa8FPKp4sPQ1ELxQQr0IsZDi5up8rKC18bQSI9y5AFArBt1SC3ZN8y0mLp
	H55/Eu9aSLvn13ZIE1p/MA6DosImkV3HbVE/nLySNnTzHA6a46NjWcIAEL461YSdt+h48+lIlR+
	r3bPi02fbSRJ005KRoARsvHoKaV3PaQVwiOY/lDlVxegfwjVCsHO8EpWsJzUhVaa6ZIc3p0PWQu
	1RsCTyJRU7cg4BcWgt7yDofp+9b5vI+2yAleKg1bcH32tC0Nhwx5cJYPFf+utda53RDaP4qjoGu
	RSM9mMwRim1wFBH6TQc9kbPhzuhQEH6rsl3UgnPoBZT9J+14UYgultETmqFM6593qf2Vs0ddUQi
	edjuHeUsHODenJtzKW0iYmMNSq2cQn9U5sVS0hBQ9wCZhyTU2hvecSfyD65u/6/RfwO4O1a8GcK
	p6LOSg18khddnYd2ovQ2lM/sU0w40qv/nAXFaY1L4N7XkYivzs67zWVKDFEjoY=
X-Received: by 2002:a05:690c:6e83:b0:8af:1843:a9e5 with SMTP id
 00721157ae682-8b3929e7519mr14686337b3.23.1794301258389; Tue, 10 Nov 2026
 01:00:58 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110050448.69521-1-patelshivani2283@gmail.com>
In-Reply-To: <20261110050448.69521-1-patelshivani2283@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 11:00:21 +0200
X-Gm-Features: AclHuK9lhRV4tkWDS8XhwM4LHpotMMW9vXUbmZoMQV9ygME13b4eHzMp8NHQLR4
Message-ID: <CAHp75Ve3E7qCXOQi_q9SmTkwhfSnPdWZy1cse0G=BFJ0FBoptg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix leading space indentation
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: outreachy@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 7:05=E2=80=AFAM Shivani Patel
<patelshivani2283@gmail.com> wrote:
>
> Replace spaces at the beginning of the line with a tab in
> atomisp_find_in_fmt_conv_by_atomisp_in_fmt() function parameter list
> to conform to the Linux kernel coding style.

Nice try! But, sorry, no.

...

>  const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in=
_fmt(
> -    enum atomisp_input_format atomisp_in_fmt)
> +       enum atomisp_input_format atomisp_in_fmt)

The whole format of this prototype is broken (in v4l2 is a strong
requirement to follow the 80 character per line rule). On top of that
is it really the only issue of a kind?

>  {

...

Also note, this kind of patch for _this_ driver will be ignored, it's
not a priority for it *at all*. Try something better like [1].

[1]: https://lore.kernel.org/linux-media/20261027230807.2407261-1-vladurare=
s@gmail.com/

--=20
With Best Regards,
Andy Shevchenko
