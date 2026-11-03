Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793745166;
	b=3u7oyXMKcu7KJVFfGxsNl6jIn7NrvEVmP4bZmdGydBttoZZQO6EhJho6dBcGKLyr65Xh
	 RFCV9WfMZKRLgB7GRq2Mn1wa21kvJ99TMtP0JAetFWV0meDp5CnkE5XwIr3r7zuw7nwlR
	 eZ+I9dXffajR4P6QxDnqFsmX3KxEcpzPpLVrGlnLmAYkueQ+9YM40k6pcFgK90y+6zlUx
	 jZ2GWeHAUkDPvr5MyYR4FbpiVphkNi8VgG+jdo36d2Gezov9CXsI1arttWdbev+waPCB6
	 NMXVFlHT7SF0zq0PHc6QIZeDRpRhTHUy2Nx29maN4/xbSdOgS2mpCy3axQ/362E+qvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5BID5yKv/9UrmWUEUD9UK4fIG+bBGjc3x/e9izWEr5A=;
	b=Wf4cKtR+tpQmnwaqt70+875SQAteVEOWQtXdbm+wwv8l0vhV9qt6DpGyAIdmBzj4wuFk
	 6oVnpyvtpy0c8JG+y+RbcEBNZKJFdvswEWRfi5Pjk2H8qPEg40EuaUlms1sT0J8ms3XiM
	 2OP2JLIQMZAGyyFSGow6vpKaeo3ScWClUI7dKiX+SGYCu3caRFU2aG04RVAFoQyPa2075
	 pTC728RRVV9Hanyl5ii5XsYVqRUSlsY+FI1K3ZCAb5lmkNv+4ee31nSlPqh0vyQw9UDkQ
	 aLdZYvwejq74RQjCyalce2y4ioXz0XL5caO5spDNl/6pu23i26Cz4tWsws49msvhYuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0uH2A5I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD73606A31B
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 22:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD73606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0uH2A5I
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so16398e87.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 14:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793745164; cv=none;
        d=google.com; s=arc-20260327;
        b=q+/Dq5nL3lKTQgjBMaqYX9ZqjGbjCovFthCE8TLuBb2AjC+l0Zk6JPGfVx6Y1y3y3M
         AG+eo0SnnrBiW5qcFoGbBTOGZfVGpZummkO7T7ZgcZDvjTAV088/Sf6zxr6NIgFe9Nmz
         hUfOI4JhMoeJ0c6AjdjlkJO2IchzRyBAU3RZmM+4dL/pWpK9vzbJHZHg8acGzzom5SYe
         d7Qco9IQqEsgvq9J4+G114bMFTzhaAkb6XJrY0pTwlwtHeEQRdusSQ6DyO7dIMjXnZTE
         bK0KbjjJg3u1xUsxs+T0wkXh+X7YvJ5wr/iaLmZAYxN/uGJn7i9mxq4dS41KbJpuF3/Y
         QEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5BID5yKv/9UrmWUEUD9UK4fIG+bBGjc3x/e9izWEr5A=;
        fh=TJZ6WrXJNtxlRdsswvEXobXhiYe3L9KOPR8APu5iwZ0=;
        b=c6FRoSAkQsccAmwseFnAoaCGJo7kAy5Yby7vJN42kYqiGVM8b0g72QJgBCiF8hwssM
         LLpx9xDjEJPZETfS6uZSovmK6R5HTjqdbnK0dR8XAIDrsnrz7CsOJjK70crDxQSZsxk0
         Z+TcasiOXdp4MMvJbAmQyuvfM2ijEW1rdbbkhc7xUBK2zQqhnahWXNexQ1objTKc6NNl
         0kA0zskaCVzHeCUotxx2sFNWD1E7bKX2mv7QQed4ZjGs0PXSw+MMveVF50soM7bqrWYW
         SW81cYsc0lXQdot+FCBMPLFVj/Ij+viOEppc18LYe9uXOJvDyViXF36v7u/qau8X2mzd
         i9BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745164; x=1794349964; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5BID5yKv/9UrmWUEUD9UK4fIG+bBGjc3x/e9izWEr5A=;
        b=w0uH2A5IFtwQ0QzfavqBN2rXMQKuTgliQRRREhHwsj9iXR6wbr830ym4oM+mZlVhhP
         6aDN/Zli4TVmZT2014HBm7NrP40kLEX63UERS/KNNdBeqw58jPVXihr8W65jbpV7wbSG
         UlK71pw2p2wkO3dPKDFg079yuOce2Ab6b75E/zoPlIVVWIeBQe5stfVT983Q7qQMLKyI
         5KBT/disG+qMt+sPiHYJJzOU8VV1NajnJmlmaYL1bCVsPxZcrfS0Lhwa8vF9etDcEvir
         JWVhpPwNWz2ztOZyMIagKC6St4LEx5hP3KpMIRVz8dLXtLkaarNrnFIvgafmrydvV+o9
         PZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745164; x=1794349964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BID5yKv/9UrmWUEUD9UK4fIG+bBGjc3x/e9izWEr5A=;
        b=i463Y7aHY272JISgtfDanJH+6AExINZXq7uytxQJl4Kr7CDMcqIPXHasvV+YC2+Poo
         Hevh7KwZDP4k3taey8Y+Aku0XjnY0+AlIkhRkDVzb60rOzsK438oNcs8cQlxQaQXoaoz
         L4K8+kKBBNlGCYDHuHkuVtsl8LNfee7QzEAPspMk3lQQNuqU9aceHvA3vVNO/728r1g/
         nYVqOImyrKMzfE04Z0TXwidnEyGvMRSJqGuoNmLWk8JU+HxZzgXZvsBo3Pk3FiV5is9U
         e1Bh3XascwtxM0sipt/ai8nD51671QLNmn1HMwLbEqxBPlPfgk32W5LNfmaHgb3HUsh2
         T0Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwKkgD3+yhnw53y8b6KclkWbCXP29Jjs555MXbo0O35n59cHm45dNSdDvHe/DbKFlMneE1IW8WGShWml8sk@lists.linux.dev
X-Gm-Message-State: APuU4Z9d1JEST4C6NTQgw5VCW5JwAJ9Tom2tDyfUB8Op58yJmfe74g+G
	Aj1QsHJtxTcWUwM5AutsX9ngpp/3LpclPo5SqLr6LCDVPqFM+24Sk48PRuZT26PCnY8kZyU02Qb
	PCNe6H6mF4bCOcsMQPJt2ZpwviTigGvM=
X-Gm-Gg: AYBFou38zfRqQMKtMXqGFtxl0TcAttsyP4zsS+yVVfH2V85qR0PwSQn29BsRDE9IiC3
	ExzXSXwHNrdWVlqK17tu89aBeMEMqxM/4fUOhjfiKI+y72mBnKCeQq7zvYhMKGg23blLd7jPUOf
	x2Zcr1S7KIzFNcvQRir81hHMX71V+W4DuZ4wz73fB9W/vHEFg88bmHPtIC2Qt8vfF48E8BaxJpz
	AkkGBaa1a4f+sXZJJN7x3fb5hh1ClZVh4FN89qQi+jixzRKXo2EgPY1XDEz9Ue7MUI0CFOjVgca
	/O8bP4I80Zy1uVk6ykoNNi6escH/re6kCQUFt/SUgOncYYG6R2/1M4AVSy9ocZM54PUdcPkwf3x
	RNKYV0ngKkgDEp39UjrmzFjybSyezc4qXFkIOGfRbGa6Ct0eaZkmKwbA=
X-Received: by 2002:a05:6512:130c:b0:5bf:e7d5:c22e with SMTP id
 2adb3069b0e04-5bfe7d5c338mr2656695e87.65.1793745163648; Tue, 03 Nov 2026
 14:32:43 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
 <2026101402-spotter-stitch-056b@gregkh> <CAL4M7k4kABFmDrReZ0dnuYHiEb0Jn2N=iutncNJ4X-S=HPAYXw@mail.gmail.com>
 <2026110322-axis-wispy-1081@gregkh>
In-Reply-To: <2026110322-axis-wispy-1081@gregkh>
From: Rishik <rishik.yechuri.code@gmail.com>
Date: Tue, 3 Nov 2026 16:32:31 -0600
X-Gm-Features: AclHuK8A-NQfFx6x1E94e4VUIEtshK8qcRhPyXPIT8gvbVXDtzDYV2Awe3jTmrA
Message-ID: <CAL4M7k6LGK8Cvn=vVYw2XOmhsYEPre-6Or-bEndyQT8HO1jphA@mail.gmail.com>
Subject: Re: [PATCH 00/10] staging: rtl8723bs: replace private 802.11 header
 macros with generic helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <epicrishik@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just saw that the driver was removed.

On Tue, Nov 3, 2026 at 1:22=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 03, 2026 at 12:21:18PM -0600, Rishik wrote:
> > I forgot to add the assisted-by tag to the series. I wrote the series
> > with some help from claude. Should I resend the series with updated
> > tags?
>
> Please rebase on the latest kernel release and see what happens :)
