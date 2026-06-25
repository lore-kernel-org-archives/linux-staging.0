Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A21832B10B
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383437; cv=pass; b=JTL5qaUUj+u0XW7NUJlW3xREUA7Bghm8wP2iSmSgvCcFic8RWbs5mqgFzvrNwXNDLVWo3B4gA+2X9STvJXvm2poLvYCHAYf71neLed2pnQBxBuXo927N3kiy5xMldLF1WLnbKxbHrR0BHT95ZlEhhWC0KC3LU/KFnBRD7gKer98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383437; c=relaxed/simple;
	bh=AvoQHghqbYYBynr9L28jSbgEoJOOe82Wl0qq9VqZVeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWC6rKtCM2rh7by5LyJ49WAJfQwv9Vxpj6S3QH+1rQ5k30veBRoxWzoGNzqGnxI1oJw4TCZSvC2290L9lGkD6oQcG7qPw1ssxKZjFq0aCuAW3fHOk4yrfKd1lt7ACn7DhJyOj0zk+xaTUZk+ANA5+ik+CcWPDMX7LMUY8GtcydE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtJIjuHE; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtJIjuHE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8894560c89so613907a12.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 03:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782383436; cv=none;
        d=google.com; s=arc-20260327;
        b=gRRT/GXyzj2vFgnV+xiWkI/w5glcxvEO3mVdapCwvcqHsfvOk74qbCgqvhhHZDO2lW
         LqaUsHtkXVRce9+1OQPU6Ad4LXe3qIBVGdAPh3jC5SVu+vlnOFUFQLnF1inzbgQfjleK
         UjLjw5BCtdxPUlcknDj1IIS8qkfqtoUUmx1IXqneUyRbi5PDWub00HCuGqF0Br/kTnAe
         afW9SMcdvrICm5bQaeMbVkH+L+itvXR6cHcvOtSdkJN0fdlSyew3XQsNokIelkc3Lxyo
         ocisSMsjb4qtXzAdhWEWm+ns3fO+5tdr3zyVDpAO9EuWtJA69JltgykkPjVIVQPFNFYK
         OIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AvoQHghqbYYBynr9L28jSbgEoJOOe82Wl0qq9VqZVeE=;
        fh=texEfJUVDx9/eWFj9CiGewuhBGQM2FWpEDalaRpKt14=;
        b=HZNBdd56kYPg5mAJENiEXGYLfeBtBSTUJooUk/jNPMlxpQrn4LEgkxui/dnF6Vr8Du
         d4kuAWiLOsSHz92ovlmBS2e6XSEV5gwUwKaADImSERn791Y+ND7xMVf5SdVi5oRDO9Ri
         /qFdbwU5luyO1yNsPHpX+iFk0l29lNc5HyhSmb4l59ZhnErAxZLsafYPjACC7TJ3eNff
         vb29xtBQ2aje5vO/rwf0tavSxo5gl6l7UndWUBVcqPmi+wFZ0NUgNXV8sHzm3xWsZ+CB
         bUOLD5RACA6MbcUm5q2VWteO5IOALfzp3z7yn4BqjgnR26aUiqm2KK6tCuVyAMzuf7XZ
         f8jQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383436; x=1782988236; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AvoQHghqbYYBynr9L28jSbgEoJOOe82Wl0qq9VqZVeE=;
        b=WtJIjuHEo2yRQAlVqXvhRBui1DXmAOHunN2aTLBAiEeX9RsyzxnefUEOZenaqdQgVr
         OF44RP+Rii9eV8nBQNd0fUTKNUSofu6RuY/Vc4nkLWqqhWbtKe7ilnJVNKK6bMWXpjon
         L27aLs2nod0IxrQR+Lo0OtrOpG/XfO54iFBqgfWgfDgkelonka4HY8fpX/PbN9x5Oa0t
         VkvMcRRcLpdnOzoP8GwdiY+GzYZYaPNtcxO5/hikWbnzbwIuBOKRePikBOjLWrw5NZFY
         QflclAmOQa+wekgoI2t+LG1OLICgS9N5K/6L+bu+ML+y2HlNajvJuxF4ZnVdJZTtAXY2
         SOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383436; x=1782988236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvoQHghqbYYBynr9L28jSbgEoJOOe82Wl0qq9VqZVeE=;
        b=pR06+cNcPNte5r5QCJ+CXnaXsvwsRMOzYe7mCCuKVLB5i01j8o7s9elpvVHy7Y9SUs
         09/Ikhy47xefvfM25D2dDVbteqmJK9QqqFkzpPXC/QUgqysUuTpsgfqH/81LpqEow4K9
         /onwVtsoqs9EEApaAnYS4W3zLC3/HOLYQjYy9kzHlmWxxMODhJmOAUYA7J5tEj4tI9z2
         KvKQNrivHpIQODojKX+9u5ruMeP2pA4UsHnrDEKmIMi2BeiLcNcnm/clofb6p2+Uwg6J
         /ImFFW9N2qIRKkd7chS/2QrsAH/QZBn1x7LTSgFDZlmyEJiQUYgCe47YvY1JUWPCiMW7
         0GkA==
X-Forwarded-Encrypted: i=1; AFNElJ9Fkedb4FjW+BUAPb/JMNw/o86DmSJDbx4No0cfCMml+TEPghvbvtEu+p87lKA0k8yQVFP+DbB0kbNH+98X@lists.linux.dev
X-Gm-Message-State: AOJu0YwedVGRCwzqzSFN3ps3CizE7IuM6UipS02sLPgcbcQKCzj54Ahl
	hHd50CXj0ri1YWmOTwd9WcJKt0kmaObkxp22J2jtj4pZR+vGm6v/GAvNvDU/22BmLYv6z7E481l
	608EUEU3o8aOgxSiF3qvLFsLSUg4LANc=
X-Gm-Gg: AfdE7ck9boF46MW665EkPaczs3hhHXKiJWuiaqwlFA+jGWzYJfIzbuB9lf7EOmzcG4t
	EDDpZQqNKEUswjSuyG0foExx3uKXeQ4jmoDRw3EVghsPQrbd/DUQLKSWNulnM4+ce+Nh5HSX9eh
	bkfGw2wAEpfRJ9MXoaLDmIWfHU1Axn5aD9xLE1BmZ67H3R/jvBMol3qnj2dZKCujFnUz9Sm2wob
	U86Nr7OTl8o/3yN9mX06dQ7VEIPsKhEu10GYzTTeFGQ3Rwoi6KApJJt3iF24cOs5YWxP1haa8A=
X-Received: by 2002:a05:6a20:914b:b0:3bd:187e:2d1 with SMTP id
 adf61e73a8af0-3bd4ae0f890mr2352631637.23.1782383435568; Thu, 25 Jun 2026
 03:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625092721.238366-1-suryasaimadhu369@gmail.com> <aj0Cv0Wzb3rieNqW@stanley.mountain>
In-Reply-To: <aj0Cv0Wzb3rieNqW@stanley.mountain>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 25 Jun 2026 16:00:24 +0530
X-Gm-Features: AVVi8CcdIPL3-1B_-CzFZpXWUulit7-jlDYUNVs_z6-h4OjuWGoke0kaVKBdZ64
Message-ID: <CAB0uMAeMOV4Xhq2cNVjxne89yqF8vdubM8-OpPYGK4f4yBLMNw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: replace empty modifier argument with
 no-op macro
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thank you for the feedback. I understand and will drop this patch.

I have also noticed two pre-existing bugs in the same file
(unaligned access and buffer size calculation when startbyte is used)
and have sent a separate patch to fix those.

Regards,
suryasaimadhu

On Thu, 25 Jun 2026 at 15:58, Dan Carpenter <error27@gmail.com> wrote:
>
> On Thu, Jun 25, 2026 at 05:27:21PM +0800, suryasaimadhu wrote:
> > Define fbtft_write_reg_no_modifier() as an identity function and
> > use it in place of empty modifier arguments in define_fbtft_write_reg()
> > calls to fix checkpatch errors.
> >
> > Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> > ---
>
> I don't hate this patch, but I think we've decided to leave this
> as-is.
>
> regards,
> dan carpenter
>
