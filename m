Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FEE33AD99
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 07:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780298151; cv=pass; b=hNBjlTZta/t1nkoyHF8P+73C79u26kgw4mkasS1wrxtjadFRKv+G2tWg9KRTSDq1cwPd+vPqMp4F1qEEuXdPtBv5cFDfF8EoXUYzZzvcyB6kKREURAuDKYWD5oyzdnXk7ZSI2oJ9DcjUiwck/JTGaQotmbxMSpwaeZqlc3KPQ2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780298151; c=relaxed/simple;
	bh=d2D3DQjzyB/3EKzRVyHtuFjn/P2A4FEpG+JgwdiWCJ4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kfPq3RoURvr2mKtchE9gk36eIHAqposU13jURerD6jfWY3h+DvbekXmaDYyRmOlOA668ofBeCa7Hy7XJtLt0zMVGm8PrbUvAUzM2k3CScLjeU02RhF0xAI7lwExgPtKaI6oAn49g0dYi8WVCPFsqFkJsIP/ItIIItRTufGXTX08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioR/wGZm; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioR/wGZm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2be1dd4af34so144495565ad.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 00:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780298149; cv=none;
        d=google.com; s=arc-20240605;
        b=LbAv/M9nbvTS+H0bWTL8mwgsQMGQKxldViH+g2lftk0xfjE1kDrd/DS17mIOEj1WJV
         Ljg8u320+41qIwWIYu3QfpA8IWMSkNVelEqme6YFeT8NUuGJbmsfNFA6LAkPQsUANGHm
         OLlCVI0dVdR30qSR3SOLfs9zKOiss/Ec5LhPTRqF4ZmOoHHcdiJQR9FoN/v8ToYQDgdo
         ycjnPL1kG3EeJxb9UVO/cmFdyr5cfndg8/KK+srEAUQL4N5sx0xP1D1AvvqvTmFV5/Hv
         i4rNT0M7w6XFmhq56+orWOSGJWyKmo1wa8s4+porxRF3H1sJfgCgAseIgACgykZpT4tC
         ayeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=I/B3iWz2lj18m4P9RjExUmXdiUYhhvyFBGz6pNiCe5c=;
        fh=i0uJAQGuCKeYlp2/MgYIbxHRsucJf0KBTyx2ORZM++w=;
        b=DWsdML0blUzYwL34Zkzjn+dKdsnJwrmf0DgqkhWmGQk7kdFvggfXgzZ4XrgeYnu+w2
         POCJb0wZbOjEDCWMU5MiApyvvh7rJbqDWfhxFlgP5DO2uCHRelOPN0Pabzsmkqu72Prl
         1Sn2Bsbm9gUQvBORoyEH6IjaUHQ0la/GJkNjpXRuG6D3sXycUeuffzlA3gmqI3ri8Heu
         OvLMsDXAvigLHWbIFqhU3ozM8Dsich8S2QmLE9xcgLUS4UubG0NhCyfqznfL6VPiUJNV
         Wgy+X9knVKPwU4+tE+NH6JdtOsHQvue7iF6XkxyBRk7fSoSYCryNsnwAGtqiZ4TNe4Mb
         8PHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780298149; x=1780902949; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/B3iWz2lj18m4P9RjExUmXdiUYhhvyFBGz6pNiCe5c=;
        b=ioR/wGZmbYa2CxWX92ABoWw6ZLX4ayxSLadeX46EJYcCS7SE40CV75HxRWB/WxsJV3
         3FFntEDgkp03l7/O2nHzHzCAb/cE7LbO5RlWAckijz7AHVnrGyJObfeyhznhIsI6HXrZ
         s6IrB6A6b7bPZNhNxzHHcOndHDYwvyiAVfSY69Vec9aOsbo4hNcuV+8zq1KCOX5tjMIE
         Xr3plOdohIFZE+K9Cv+nT9j/RhmnhGQM0yqxak1moyK7gL4/hy6+uPO0t3KgagcsQofb
         bMqCXeXY4kkEYPSzaHGGdaIZAEV5evfA327fxgslsvaFcuiV1S/qADv/B+4kkb8EoEVw
         Uxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780298149; x=1780902949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/B3iWz2lj18m4P9RjExUmXdiUYhhvyFBGz6pNiCe5c=;
        b=jVU7Lc4W1ie0zCotsUYYCzSyrcfPF7jF7s0zQ5ErtPAqBLZOsyPITuCuHIUiz8J+6J
         7b3kWjrhoI6fEGZlWIYS63IBwzTXrIvAScW3NHTY6QrcWoxALBg/sRCVMNt2grzOtVX8
         HIhxp7hxlrxR38nagefp659OBprLa8mWp8d8zx+cpKLX8n/fKwIlZ60rf5nju31BKcRH
         0N7RtSyCIai1OGXFC7bdmTN/QndGd8TL6C4JaLjwljQ1jueDtz2soohUWrtffGOxtTeD
         nqeZNuGOTOq08sKsx83GTnjmwLIO05dUuD6Yv6CZFq/nvvsmWx21XZ50jZb4xHfkj7P7
         v0hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FBJO7tznCLRLkjyRazVr7pxREVqndeKJK1ItaeA1a9/9cIN72n/tgtDXs8pHS6ypInLC6usrz/yB22xXx@lists.linux.dev
X-Gm-Message-State: AOJu0YybDhoERho8T6TlrGOKStwhOlpjE5jCgRgmf+cDGtzYtCF5w2ud
	BSwhyg5EYwx9pmHsIX3XKXvZqkZke7QmmwVqjQwgO0NuKM6aD48vh1G7aufCP9yxVsOHos6VwNC
	AIhxbLD5vTAxzWgP/ktW/ermY+t/eQV4=
X-Gm-Gg: Acq92OHFZBAlTpFAX/vwzrInLfDdFuKRtVHNp0X6o4ihD9HzpZnqoLAbbE08Pj/Enud
	pGGbp85OPFpg3sKrfJGGxxbi8CjWEJhn9hZ9+Mz3zgjF/MDorNvuoqF1ADgQxRPOx7tsm+lDQAS
	gg9iFDs39XDJqVrYugWgwjyQfH3sXMyyuEW0CSJybfIZTV6IiBLD2Rz6ThPoBYwxoPO+gRqQC1a
	kaccOEYUsQn5SVRc4NpTVlu4YfFUyulLtP3FxBToR/cQo5o9GsWra+C9lIafDz0DJat+5xk+W1Y
	trrVtegLgrPi79oQ8Z8=
X-Received: by 2002:a17:902:d48b:b0:2bf:2114:ecbe with SMTP id
 d9443c01a7336-2bf36809f57mr119845635ad.23.1780298149509; Mon, 01 Jun 2026
 00:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Grewstad <dogestad24@gmail.com>
Date: Mon, 1 Jun 2026 12:45:38 +0530
X-Gm-Features: AVHnY4JjQ3sDDnKw9Gxw2BXpaCJJzflQjNMzpqOep-jaxZKghv2hpZ4f9tPu0iw
Message-ID: <CAD03fjb=_kW9=q9YV4qnQ5GD=HMB5Bx7pf3+AFcgDR2gVc1V6Q@mail.gmail.com>
Subject: [RFC] drivers/staging/axis-fifo: Looking for users
To: Greg KH <gregkh@linuxfoundation.org>
Cc: michal.simek@amd.com, radhey.shyam.pandey@amd.com, 
	Andrew Lunn <andrew@lunn.ch>, jic23@kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jacobsfeder@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
The AXI Stream FIFO driver has been in staging since 2018. I was trying to
understand whether there are real in-tree users of this hardware today, and
what the expected direction for graduating the driver out of staging might =
be.

The only in tree reference to this driver that i found is
drivers/ethernet/xilinx/xilinx_axienet_main.c, which states:

 * TODO:
 *  - Add Axi Fifo support.

From this, it appears AXI Stream FIFO support may be used for some AXI
Ethernet hardware configurations. However, I=E2=80=99m not sure whether the=
re are
any other in-tree users of the AXI Stream FIFO IP besides Ethernet, or
whether Ethernet is the primary intended consumer.

If there are no other in-tree users, it=E2=80=99s unclear whether this driv=
er should
remain a standalone staging driver or be integrated into a specific subsyst=
em
like networking.

Can you let me know if there are any known in-tree users for this driver,
whether it has a large enough user base to justify its existence in
the kernel tree,
and what the hardware's real use cases are?

Thanks,
Arihan Bhor
