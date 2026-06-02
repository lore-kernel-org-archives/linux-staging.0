Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657693D9DCD
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405301; cv=pass; b=ZXZGn4YFCskiBKPoHMaoxtrs3k4nJNnlkySZpNuHRzAm0sIjxQ9WnOOsBJX1gyI90Px0+bVegV8pozubpCBF7xYfrNqMa1YgRpJebKjGZsoJpItcE4mq0c33v1utSvMb8lTrFJPM8nzqEKd+tueyc+3cc9H2BgZ1srKiJI63Mtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405301; c=relaxed/simple;
	bh=YZLN6/qlVOWdRYNj8z6+hD/6zsGf8vJ8becfXSs0S5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtMAHYW4FzAEpa9hHZLOs26kZKawH4ZCVVRdS4cRhwJhnZjgum2G/M9IX5efWP+lceZzH9XmnlYNOmOvtKNLtBkREP6nSAjE9tOhrUt+X6MbCGuPEF2OBh0B6Mt0jaVDL00ubIAWnp9X/yivVx76FPL+e5z7/Xzkl8hDkNles2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0CM4Rw9; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0CM4Rw9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so17380495ad.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 06:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780405300; cv=none;
        d=google.com; s=arc-20240605;
        b=GO9eGXsQ75wdjn4vNYG6ifWiOzRu8OV/dkp+Gu8VjsRw9mf8KVMitnAonUuxPhb3nn
         r2rUiNRjQDuHXsbFbnE65UeoERQAJclgEFCSNbvTxWFSy5uSW7xftSKd0Es/ojZoUeXa
         cykpGkFLGCjaxlZ1+4VJg3dijy6czVMi0Vu+/nwJR+K6LX4O1EpB6s1aVF7gXKnHSklp
         p/IGcB6KlJgwdpOSLiOd+0kYea80Zrx2pH2rJpVYykGL60iFwQGEKab1vowhW4Uzdojo
         l6A2qsT2mo1aDXTYjkSsr+fa/rcOP6DxaSaKFE2TToeZoGMWxSB02P7scJ5HZxHQjOQK
         59ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vG1FvZNcNfUZMwTwmESqrt5GZq6fHfiKJBWdGys5vfo=;
        fh=gZtREVGVUW6mcio33jHIKvRGe3Yo4BI0MnnKG/kClFE=;
        b=XkyvQ7SIWLd+zHfzkbRt7cH+euT3FU8NYwl/8zgxrfEhmIXsL6N4dnf+8PhuD8yAHg
         v0h4k8IF6OLle8nraI8ikTSCj3X2/BHBmzg0Aw/Qc62HweCjtJWEdWEnYF9Q2gq8sZRo
         zS2qL2XfmzxS+xJD06b2o22yLSrcNlNk7pUI8SognjTGmLQc/+OM4o4W1NA5YgR0bvB8
         5JUft+GIUkfHqAtXrVnnxR6Zzm5A5YZKgW2TG+n7loJhITwGk6wVXG1zj+x9k/n6sMIj
         VPZ6a7Do449NkM7KrTJ1QVzWTQsb9z8sLsou1lsooQ7Yfg4bkwULOeBIiJp1k0qkvNJ4
         XCdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405300; x=1781010100; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG1FvZNcNfUZMwTwmESqrt5GZq6fHfiKJBWdGys5vfo=;
        b=V0CM4Rw9qbdAcpNTvMNa6cG/2vK5Va2dK94g5BoCN4awTpsOc0ekFNzWURGsP1aHyD
         7d+edoO/n+hingjOZmQLQPNOSI2wyez+qOdzv5RBFrfTgTOOCQCTddSLWYB1sfBHsNlu
         4fToByrhUnZwwde9r/he+C4/OQf/PIjLLBbkbJ7Cq7q0LgUsbYm1Nl007uOQPgWHZRl2
         yZCDBuFJ5IuAnWxAs69kJFYZTuhLdLBmQc9qWMTM4prm9+QdRAjO8jHEDiQc3/FriTKO
         fc3k2u8mQez0/RePVhjsOnXmztfp1kTkG7WM4H4qmGda5N87cMv48NQtwnEk2Z5ywSPj
         KJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405300; x=1781010100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vG1FvZNcNfUZMwTwmESqrt5GZq6fHfiKJBWdGys5vfo=;
        b=AezxHplptcwZsxsMs9j0dPanuXqn7Ofh/TBGc45lv/LXxZQfFtDIOLo8pNB7xPh4g4
         rpWl4YwaGAGvgabEWOWM6HQg2Ba38/ofbrQZcEQ8EjMFSSBMU3mlHdqleC+fyKZUsClM
         /QqUVTU2/nURnkbY8XOOOwAPacqZjLsc+/HS7hsbU2YCsWNFm30gX+uUAbZ1AI20ezag
         XEUozToEQeXx4pE/J6JeHUbt21WwCkcHeWU0Rn12mIpZb7en+PjzhyljsVqvwLQGsyHz
         b9JXTBzyPjRlzXMur3mpC8EAe0Ln0nhWaL7Q8N7BFMMcg+hRO/aLGZO048bXE/S4TGpj
         zVZA==
X-Forwarded-Encrypted: i=1; AFNElJ9db2FANbrKPtKxADbFz2kfNonsdngtZ92heY1O7uYT5DP9sXXz1sqF/c3EXW8hWebE4XJ3IrSH4eYGTZjY@lists.linux.dev
X-Gm-Message-State: AOJu0YyhdunEA4P3mPP84y9wMfbNmE+ybHaCAbLZmVqR/2CNJ19uzE5N
	xaXWsG4gbvlhHB+bu70TzHa5CV6NHrhBePQnPmsc9OiTAAhvbCOmAimxJnk4OcrC5jWJvBL5kEO
	N8fNeUnwPfdMP24OHCkrgO0bu1fG9Zso=
X-Gm-Gg: Acq92OHT9bNjWG2rzUAz8qAHrfx3zJo5zQ3diV+HPk4bPI1fhrUmPUo6NFU6zDssgZx
	LukHOC3CWNrAvd+Nembi/RKbmy2lqWlzSeDm8F9t47JFe+HB85DYcD62p6JCo/AkH/V6MCq1Xv8
	l/0Bm02Z9Ph25beTQ91rW7K7sagP+9U9kyJvHFaUZXzOlSQhLnsKW8c6UdN9SdTHsVqIkaJAIfh
	m5k9yfSTaU1ZCuxfaDNkyGauuum3W6EJbj7K9XXoTj+xFVGbqXCvIwwp5uwNlnAL+ya+zwMItAP
	/CM22raifltYA119jYI=
X-Received: by 2002:a17:902:e851:b0:2c1:42d2:2a66 with SMTP id
 d9443c01a7336-2c142d22ec8mr6752255ad.33.1780405299316; Tue, 02 Jun 2026
 06:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602103208.15799-1-dogestad24@gmail.com> <ah7AYukZ5uzW1NVU@stanley.mountain>
In-Reply-To: <ah7AYukZ5uzW1NVU@stanley.mountain>
From: Grewstad <dogestad24@gmail.com>
Date: Tue, 2 Jun 2026 18:31:27 +0530
X-Gm-Features: AVHnY4KUT9zS83KrHgFi2uouxC23jqAEoz341_iMuo68UM3P5WjtvPZls8aL3_I
Message-ID: <CAD03fjZQwgvDbBdh6A=1FeGVn4Na29ww2DzG3anuk2sOd0-4EA@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove driver
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Ovidiu Panait <ovidiu.panait.oss@gmail.com>, 
	Jacob Feder <jacobsfeder@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 5:07=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Tue, Jun 02, 2026 at 04:01:53PM +0530, Arihan Bhor wrote:
>
> I don't think we should delete this driver.  From reading the git
> log, Ovidiu Panait was obviously using this code last year.  Let's
> also add Jacob Feder, although he hasn't touched the code in 8 years,
> he still might know if there are other users.

I could not find any user-space applications that depend on this driver.

https://lore.kernel.org/lkml/CAD03fjb=3D_kW9=3Dq9YV4qnQ5GD=3DHMB5Bx7pf3+AFc=
gDR2gVc1V6Q@mail.gmail.com/
I was looking for any users of this driver on the linux-kernel, linux-stagi=
ng,
and linux-arm-kernel mailing lists as well as Jacob Feder, and received no
replies since I posted it 1 day ago. If someone is using it or maintaining =
a
proprietary app, they will complain and we can bring the driver back.

If someone is using it or maintaining a proprietary app, they will
complain and we can bring
the driver back.

> Also no commit message.
Will add it in v2.

Either way, let's wait for Ovidiu to reply if he is still active, or for an=
yone
on the mailing list who might be using this.
