Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C54AA1EB
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333678; cv=none; b=XOYXIjES1h65nc164qAb6tBnyI2q8jXk0eY1vTuW0Z/oQhj93AUCfR94PaNptbvL/ss2T/KK2Ln4u4ABAsITaU+BQ0HlGYhm07/zMRg+SLVZ85hkOfTsp4JLoCEzZR6zNSp6Pmu0rupKw/2yr9GSL14dYqnu/2nWhAZrBbwpKgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333678; c=relaxed/simple;
	bh=JrJwckTOeFLMYbWPldwO5xzUhS239iwNp6VMQuWtRPU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vF/v+5xUm1pml1WnfKu56d3wjT1Ql821jqVFXdmOExi+uCdF2x5t3oJIv6xHHbbDUBc4fWnexd6imx/ZhCwmLCuMOFjYCzL6oXMKzaf5WxZ4yHUOndylaPTRmyG6R3232kiLiDF1cT+0ZUtvEcd3r8Zpz33C9GlJhZrknhWZV4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/1lTLNs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/1lTLNs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so4050315e9.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 07:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333676; x=1792938476; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Eb46/O1NYU+eRR79pz07l5QZJgv8lcTTRms1awqeJB8=;
        b=a/1lTLNsSqRMSG/9j+UcCmQegCqQSZb5s/IN8ZNP5vBAYLUMLAHqpdgBI0QHx6S3RX
         aZqwRTQ2LscRDBIz13EfW6HhobpZf4I4SNZnwMIRyTFFQ8jZF8pYDK6SQXX+gtcsyuCM
         u+QnTA/KrAYcdiTvhDFtB1BayWzACU634P6+bAKx2k0S6+59H8KGR15CH4RdL4i3nP2C
         LeBFN16ZBauT0cwaDKM+PrZI32uO0fkt3OzkMobxv+DmLe48QgUZj+dIfdM8sD9c6o2I
         oSqMzsN5x1I4CEdGsIfFE+vsHuQxQG3VgsT0AWPhW57ZZuAplTednRPnMn0BhRbDrRee
         ZE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333676; x=1792938476;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eb46/O1NYU+eRR79pz07l5QZJgv8lcTTRms1awqeJB8=;
        b=MSzxslFU1TQMemEuYY0o8nqY+icYS1VGQ5MGalYUFAb4SM7/I0usR8qhoxGZfb1awd
         g73NGM3rGMFWUc0z/JdhTfUFLfz6bNpqUJAwrq1wKQf74TwUcO1dHZzJg15uvVs3pEfT
         jTSAIYjpo5KXiUC64aydDvmLOy1jrOg82IBYcP2vsC1hInTzCMvWwu0isvJXVsgXF3M4
         N5x82D3Tp6p1QAxPItAZlAl2KbOitHFxCWPv/De/IhqQjaldr9kwXm3Fw2lSJ90lbFc3
         opsJqysL/xwWBDI6iQ8imUoQ7sK3suD7T6dyuwwrtXTHuu4MZIohpmYzeSdEipJ2/2OX
         ULhA==
X-Forwarded-Encrypted: i=1; AKwUvBxjtMp4cGGIcOs3jUawOd3IVIulSh4++vHld8wUQluxTVUFAMO9+3EKJOLAyRg5T8A9qzDgQSJEiJwSHNLW@lists.linux.dev
X-Gm-Message-State: AFq9FYLeQPnxgMKs2hVahA253b99MCTBM/UjJGNkNMkaTQEGJyE5YKIk
	mBjyjf4Qi7G29ZV2iclq+bd4HaXBJG/Mwz2WfbLrw3WtqcGIKIookXUc
X-Gm-Gg: AYBFou2bkDHMPa6Q/7uj0PxA0FmLP5SlyqqshfSZNHdLH4hU018rKGyP5E2DXbci5Dk
	NFfB+Xi2GiCklji09gnybQP987ro+IXGk3N/WltcBGuMHQ6lp0v57KDuH5XU4r1efDqQvt+4VrJ
	l9PcxZ7av/VHRRJ+ilF8UaMBnJ2NDy9RJpand5WNIDn0UI6cU+kD/zh5nJDv4yo7ACIPjws1iFb
	Xxc4cw/+SDRBY+7wzy/flqnLiFBbAsgLe4X1lUnS0jnqBIudh/IumYgJXoMdzFZqiAViLXxdBQ6
	5Exrf0ediFp6u3vU53VvAbii3ZRMxcD/svJZ03FTrKhMiYfktuOIcje5Gng7eCxekzs4AaFvnAr
	0pz6OazzToBEjvLU66yVwFzmlwF8LU1zanMBsP6CHNJaO3YqbXOVxHZ0CqqZ7aSxhht/rKl5PRa
	hhLoSvyMHtkyjdhLxcdfWLk3ezl97NUMn/rIQqNF/83JSZNs95aW590bQfYfsltwgMwfL6OfjiR
	w==
X-Received: by 2002:a05:600c:6297:b0:4a1:9ec4:d939 with SMTP id 5b1f17b1804b1-4a1c66cc3a4mr217236155e9.17.1792333675391;
        Sun, 18 Oct 2026 07:27:55 -0700 (PDT)
Received: from [192.168.0.50] ([102.91.104.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm19037389f8f.27.2026.10.18.07.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:27:54 -0700 (PDT)
Message-ID: <b7a4167f8e188d7a0dfe72c2a3e6e51337a33336.camel@gmail.com>
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match
 open parenthesis
From: Comfort Oyewole <coyewole7@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: abbotti@mev.co.uk, hsweeten@visiongravers.com,
 linux-kernel@vger.kernel.org, 	outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev
Date: Sun, 18 Oct 2026 15:26:20 +0100
In-Reply-To: <2026101818-banish-scarf-eb6e@gregkh>
References: <atTFT49xpaBEb7Wn@ubuntu> <2026101818-banish-scarf-eb6e@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visiongravers.com,
linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to
match open parenthesis
Date: 10/18/2026 02:30:28 PM

On Sun, Oct 18, 2026 at 02:10:39PM +0100, Comfort Oyewole wrote:
> Fix the alignment issue in order to adhere to kernel coding style
>=20
> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
> ---
>  drivers/comedi/comedi_fops.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Why was this sent twice?
I apologize for the duplicate email. I thought my mutt configuration didn't=
 work the first time.
