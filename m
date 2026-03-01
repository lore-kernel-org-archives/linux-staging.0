Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B07242D7B
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400496; cv=none; b=jxj5SmmcjnIfGny1a164osqR6neNjE3rCyY6XOOCxZsvB0tHkMu0jUrR9+dd+gI/q+t/IapDuo8Wh/yEb6FNL4wWWiUq5OtG7mlDTXqpj4vqqN+iZ6NoHOvyvsmZxMMgtT76+ufa3IkgA2AkJ61kT3Qhpv2DaqxLrfuI3cA6/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400496; c=relaxed/simple;
	bh=32teBvYX01xBbnqgqpJYzCOcnX3O7MPeZh+sP6US+Ns=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZMsgKwuNaTJS6KvomeEz8xljT5NgnSLwBnOWTG4on1HGKDU7HoLMrXtbioU5s1PZiGR6hYj0M2HC/2V2lPh2jOE38+4AtfeIjLL8GQeGpYJoM16FvXfGZXYxK/CPPmJTWH8/9lZFqPV9qT57h0JYGjviOB5v1m5NAwfqhw/tvss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBWmGL7S; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBWmGL7S"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7986e538decso34978127b3.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400494; x=1773005294; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32teBvYX01xBbnqgqpJYzCOcnX3O7MPeZh+sP6US+Ns=;
        b=NBWmGL7S2EfrntDUf37PvW2326/0Z+oZG9K5C1Gr0lMjHg+d3u4MTmTODdFeykG4ZV
         VEq/sAb/dr7shL7+l0M4I32isNwdoCTlYp7fX6erhtq7AYgtSPg7+xM6ZACRAFf1EUC6
         LJrkL8+EhJKw1qks/63NJSurqNAeF4EYACGBfPZHifayeuJn+dxbJ/eiinwMytpnaLkk
         2Qal95/cvhEbkXDkQbIdHC6huiRDgcvbpEAKXIcTmW9ONDtd9I8nIEPh5ihNMf/z6+Y2
         EjAmhFZBBr1360R9WiBHcHgZS2AbfxKxrMwxAH87AR6iOFiyiHRa5Y9C811mj6ISKGKk
         AL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400494; x=1773005294;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32teBvYX01xBbnqgqpJYzCOcnX3O7MPeZh+sP6US+Ns=;
        b=PaeMWqTNCFDO9mREQlljOqpPXbMH5C7oNwPC7yJJ0/m6k5oVu0ryV4q1ZkFf+JUTLs
         rTBhjj53uCWwjeQbfKnVPpj1lfEcvasqjJ1J/Tj8sRPw3dD/30NsEOOM9Wof6+fE11Az
         ZWojfv1Dhqe5GBxoCUwqABokLzAb6rojoJNLf2P/7s6Uy1ECk9Z2/cW5p3n0GPz79yBG
         yqYUXVZwzxQ/aN3++DW4Ecgz6iYvkv7XiIL4aamcAYU3F9pr8ndpBM7Z8imeDlWxl9qG
         kuNNpsovrASGY5Uz6Ias1uNNs1M2SB55F1se0Qge1EnxK5zqI2X4JQOYAfwXpqZGeD8z
         g7vw==
X-Forwarded-Encrypted: i=1; AJvYcCWqyP6ooQeAhhtxyqN3dHl7DfazQkCX2Q3s8k2f8nUgme+G33IhdLrxa8//jfb48r+AzXFW53qRV7WyrjC2@lists.linux.dev
X-Gm-Message-State: AOJu0YziOrDiR8iwzU6BtBt72l/xPd8NK/mEDL4Kh8eUB3jrLejzJ9zn
	dW54tQ6g0L0k8YWcQqxrQnm2Ac8LcrL4I9ylIrriOKlswf084NzlJLXj
X-Gm-Gg: ATEYQzxO9ZMD6bwWnIvcfJTkozmo9a9zmhNNuW+EYc3FcaOQNoIkvzWphNUQ0H2dWuR
	lf1Ia+XBeAqc3OFELP1qn9MC7Y+1l/6JC1KzN3qDcI2cfA5zq1Fe6P0Bo/mir76z1Vf/5VchutM
	jSIf364ETtKzA1o5R910S/XeQjoatlDDlj6VFg3B5iPKse+ELIFp8KJBQYBeeH7SH4FXgX46uKf
	1sZDr+bqqjw73KBAWW2BqUyVBPXpew3g9WhWe3BYhVjJeSQmveJFmJNB6TrQVZWDLL0jLlE3ZQ9
	XbQ38eE8gZmv9TftVwT9sB//uzMRXOo+kZLrxIJU/sOvhuyBghCGnyON/qIOFnoWZabLxNb2QEa
	CG7QcIfo2lyk2uu2dwu1FV41UC38bQV3noG9JvUlasbVsCB4UqpqJHPfF3Ttq9sexsd0KWiYXSU
	7luFvhdZacY2doWkhgkTjUsd2xcQioezCUTOVxD0aMl9IfpiO1Ah8mjYbu/5wqZoi2m7bHwsOTR
	/5S3MKGJo9t7CjTPiwZWFlzXEN6a957
X-Received: by 2002:a05:690c:650a:b0:795:1d73:4d7d with SMTP id 00721157ae682-7988544b709mr93097207b3.12.1772400494589;
        Sun, 01 Mar 2026 13:28:14 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7989951c47asm14883467b3.40.2026.03.01.13.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 13:28:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 15:27:56 -0600
Message-Id: <DGRRJ6CO2ZHV.3GMY42TSYGZ4T@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Josh Law" <hlcj1234567@gmail.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Ovidiu Panait"
 <ovidiu.panait.oss@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Josh Law" <objecting@objecting.org>
Subject: Re: [PATCH 1/4] staging: axis-fifo: fix grammar in Kconfig help
 text
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301155318.2596519-1-objecting@objecting.org>
 <DGRO3C3JVCRK.N84RA9RCVOXS@gmail.com>
 <08a72969-af76-4515-87d5-f792516dc5b5@gmail.com>
In-Reply-To: <08a72969-af76-4515-87d5-f792516dc5b5@gmail.com>

On Sun Mar 1, 2026 at 12:54 PM CST, Josh Law wrote:
> Hello, are you still going to merge my patch? I am new to this, and I hat=
e using my Gmail to merge stuff like this (bit unprofessional lol), I am so=
rry for the inconvenience, because my objecting.org email can't send emails
>

Please stop top posting, reply inline like how I'm doing here. Also, I
don't merge patches I'm just a reviewer, Greg KH merges them.

About gmail, it is not unprofessional at all. Lots of people even
maintainers use it.

Simply put, if your From: and your SOB don't match your patch will not
be accepted and Greg will not manually fix it for you. You're going to
have to send a v2.

Read this on which email clients you could use:

Documentation/process/email-clients.rst

And here is a source on how to send a v2:

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks,

ET
