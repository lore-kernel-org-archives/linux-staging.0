Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A923D1CC0
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898045; cv=pass; b=UvFBSpQpUlbXb3W0nmM/ZR6AhU/gwxanHXCBosFHlZgrgu3ADO5x8pXubt8B5A+RAKqe7mqGJG216OQCN383pdX2oE5sHIUdt31i9JJSYFBDEX1RoSb2ogWFjggKMo7LvRLcoiC3ICNTK+2971aAgXhhkXmDRsKlHFzY44PxMa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898045; c=relaxed/simple;
	bh=fdRzuOE2JukbcFuhzpeBC4aQS7QxeNaOt6L7+0oD+r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iE623669vggteFqaDMZV06Q33fzbdet52AjIs7mOlrlMX2K2MDjmBaSk8g4EhBc+asq9jV9cAmgiLbZlco8MDBbHzCbjr1IJ3vqfjoLmgh4wZH6KwkMqirRr61w8Y/SNNUOxkRYhZuinwvO9s0cah5EaTluhZbsnP2en90EjwQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDI+Cizr; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDI+Cizr"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bd5c582c47so32239217b3.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 05:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777898043; cv=none;
        d=google.com; s=arc-20240605;
        b=IL3V8OQz7/qrXHMyI4fSYhi/qtysFj6n2SYkWcvQ0PN9E+Ots/WTTVkOTKguVwYUnb
         63XQyE035FugPM8fGjXEvM4ptdQYxOC/m2YXlWEYShHlLpG5KL0fy4kuziYdtyJSNjJ1
         TUIpko9QI9luF375RQNKupIKdidOvlHXIrJehJeejofw8twUJJnqy3zRghPAEYdyE1JI
         KoIwIVgmkT/FZIE24/vb6JCm22PIuZFmlsaaPOUDQKf7F5nVRdS3pYtJRtkCk4gHcszj
         hqA++YkZWTdxVDb4h526gRNwM5IeH0k5gpJw9j6Hg0A5PNx8cVp98oAmCTwo+0+rtuV0
         dczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lpwh7LTdKk3iuzrAc4lIytt+Woc4z1HLw/5auAee8Dc=;
        fh=al8Fop6rNbqxceEQLGGgBhZAh3UxMb/eRRYsxbGgygc=;
        b=CJnqR5aTS23RcwRDXK10zfevTFugxdYvSmSz3YdR5wjHgEhi4Z+MQBma7qeALGuJrd
         Pb68Wp68Wr7bVE6KbsIW7MR0HQ+L26A/uugQ8c+/BvdcQRg7ry/u1GEsSOUPUumHgxqV
         ekFPQ8g+wLKm2aILuECRZy6Z4ykWgW66w1T1UQ+FDWHfXTgfECxGtasR7HjVegyGfwy5
         bXRFyG8MYzRexdFR0eZpEtUBM+23B6EuqCs3NbkJHgFi85PJacDst3ujpkj0ErgFlk03
         8r5JcBz3/oS791rEH9tP7qSOG+NU+h0vTa3l9loGV1iL44qh8OnZypt/N0hWGQRKowPl
         3B+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898043; x=1778502843; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpwh7LTdKk3iuzrAc4lIytt+Woc4z1HLw/5auAee8Dc=;
        b=qDI+CizrIER9T/KFz/yDYK/odBxhxA5+uyMrLpmg8vlu8XnSxcOm3OXB7KD1vQ8+GT
         VPfpwb0iiTx4vLyH7KLV1pe1tEp6h3/Ww61o7+xFzB+AZACdm7ayvz+BStH1shVIOopz
         lOIhdtMCaz1NilDxxIuHwVdBMTCxcfz6ScG39l+7Hy4ROaDVeY5PCz/wevQKDD48xdiM
         hS48PiZq1IIvDuBrqE0kXwRqRULCHZ457K6ere64OrhPTgZnWY6mkisNHKWsTHgexj4p
         8eH+copMwnkIg1pGvKyAUqlx1ZKIbPFp2R3MCfjaFYaWRrNf7kbRnPgUFA/OtLm/Znjq
         Jbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898043; x=1778502843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lpwh7LTdKk3iuzrAc4lIytt+Woc4z1HLw/5auAee8Dc=;
        b=dJ6Q8kunmyUxI5J6mDwMDsK2CUJkjV6k1hziK/IJQK5PsXFulYG2deRI6mldiqzNcq
         0AwvlaKKCZu6XZ4pP3LQylRLQGww62piLBYBH8CQfAxGbQoTQ+4SZDkyxEJzF48dMyE1
         KVx2ekaUj8i2sq8TWt1511TptmSR/IkOTl9XAsSRYPmpu2kwAA2OVwC3WLSKrmgiov6P
         g6DOb4RszuluuVgc/K6hAQLbZ8tC6TgWu80kYL8PZmXUZ6RfQaNlbUOE2lcltO7jB5yE
         OQyFgdzsHTT8eMJ/ow8LvwI7VYqvhAgXEHMcuuYEUykURVhSI2SmKxHUuf4ncRcbaEL9
         C87w==
X-Forwarded-Encrypted: i=1; AFNElJ8sGerYJXXHzF1Bzw6Ul/lpImMSg02cdwhgOoO90r7U8Aq62xGCBA4uePEW/lAjddUTN6sl5ojKot/X0Loc@lists.linux.dev
X-Gm-Message-State: AOJu0YzdBxWtPTnQxJNvRl9waerLIbOQXuWjhcvhQjR1ZmWaX/Kmshb3
	5CMj5U2ZNW8iZNnr5KmPHRoIlPjwUEXYQbPWV7NnqQQxj1w/OpH036p+zS06TbwNCnIVkVGtswK
	5RVCowZE/uwFqZj+wkMozWwMZwtxndsc=
X-Gm-Gg: AeBDietmFayDU0x9eMLRDAt9w3fZooFUTG89D5TANpIVK/merpamP90xd111dxytG7z
	waXJKTB+XHC8tIcWtNXJo//81KVdLle2NY2Lf0SecKzFLdeIWoaz5Vz4FK/EEVG2JDSQV1oWj64
	ANNoPUM+8Q/FFL7cWaQbA2B/0WXnG0YaGBlA2OPZSpnRhvWe8lBxZOw/FGbTZMCD2DPmI/qC5w3
	x5x6+slg5mreVhk1yEdcyiB2FUdwag+iop364u2aP3xfar4eQLHF2HBu6FDkkeKKhmmiCZEFL29
	gDZ+p6GtDHsYbq0=
X-Received: by 2002:a05:690c:e094:b0:79b:e346:fcfb with SMTP id
 00721157ae682-7bd770df5b9mr91665357b3.32.1777898043205; Mon, 04 May 2026
 05:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504092059.1536094-1-angusg778@gmail.com> <20260504092059.1536094-4-angusg778@gmail.com>
In-Reply-To: <20260504092059.1536094-4-angusg778@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 07:33:52 -0500
X-Gm-Features: AVHnY4JyzW74CEzgIwtXgm7P2OtMfbQwu5ChxR-G6flb6oLVOdZORlY_wrThGGQ
Message-ID: <CAKqfh0Gfwnaj+chzWUvujSVrw6wmqJAhSL9O2eYuZ136QbbD7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: iio: ad9834: fix chip name typo in comments
To: Angus Gardner <angusg778@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	Michael.Hennerich@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 4:21=E2=80=AFAM Angus Gardner <angusg778@gmail.com> =
wrote:
>
> Two comments incorrectly refer to 'AD9843' instead of 'AD9834'.
> Fix the copy-paste typo.
>
> Signed-off-by: Angus Gardner <angusg778@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9834.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
[snip]

Looks good to me.
Reviewed-by: Maxwell Doose <m32285159@gmail.com>

best regards,
maxwell
