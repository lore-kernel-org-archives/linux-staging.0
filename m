Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8742331EBF
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514548; cv=pass; b=HRQrfj59BIRbMwMth1FFyfz3lYS2CEoH1Z+Tdn/BlN/NH9Oj7e46QGUc4cU5BA4Vq67v8/1V0kFDfn+o+A19aJiWIVdKYVrO75tRKIQYL1nh+W1bH6LO5qIe4rmDK7H+D6eu1tTDfTvcK76JzOQ2TlaJO5xfouc6EQGzZEk/VWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514548; c=relaxed/simple;
	bh=9ZixpzfRn1SBCsB0xi/EwTaDjUuInOETTvr8eiZU0dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fj9lSyppGo5XB6HgvrjAhqVXta+xezHQBW77dq+uHl17XxprbFrDzEcB2xdxmAGg7qDlSH2zyU1P8ENIa8qfdzp6i6KTJ0tol8l+xD0QTmI8izor2rU2dTKD9DPZYkTxj76t/Y8b4MBf5gg9EPiM0USLlFLBuHNNc8Jvl0Idy0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQeKggRp; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQeKggRp"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304e5d3cdfeso237107eec.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 02:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781514546; cv=none;
        d=google.com; s=arc-20240605;
        b=dpRMEjAKj+3r2MlcuYg4rQG535TEIWHfUsM1gNIqfRihbkaWCR+QoMBQ+3idwv89lt
         vTO5b8x7mcCKSgtblzG/6LlRp10COI4Dxu5NGc6siP91VWzXE/Mb1QOgmJyz0eOyuY6p
         fK9Q26xlrWQT02Icn4ttY5UXUQ+f2k9y1mTMGFjB39FgfZNFBviRT7MkD9NL9m8xvpHr
         SMrRwKURLHZfo3eaZq0pHDlm0nZArkkmSYXSPUkmbnFg0IYHfATvHWCCFnEFe3vvcqPZ
         Ke5MVlVAjKZAeetFbJzqoeYIHG9d1caYzlbkKGkI5kclJL97R18YmxsATaus3SWOepEw
         rZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AO44qWTQ/piQGvf4XZH5tHBUAczI/wthj8nd/wpLVPg=;
        fh=zyLjVYpuTyKdTdHh0j4wu/fn+WFAhib75L6fcFJyWSU=;
        b=TlniCquG4FGtoGPtlQAimKyHKiO+u1rO6pHWdqCIPAMCsyf1v2QWMRI3K9bo0kFMjE
         o+fkODBv4hGPsC1BgduUFAxuXDHYE+97VfNygPL3A1XQWYCG5HU0bEZo/UyWJVkCIDhH
         di1NshT+236GdBLByPSnBGhhc302Seo52Aect4im7bprCzJyihiln3J23VGsFM3Qorrx
         UTLjgW90kf4CoeoMO823NKi1K1BYP/Jij4qI4fNffKAQEIQ5B9TI1DGAx9pb32mfTa2k
         Qquam631oLbQmE/WiaMFY+9Dk6HuJsKmqYqX0Ousp/wlkdjr6G4vqH/dL3PrSXIiaod1
         9SFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514546; x=1782119346; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AO44qWTQ/piQGvf4XZH5tHBUAczI/wthj8nd/wpLVPg=;
        b=QQeKggRpWaNnwSOuHzKVuzVxm2Ppel8XFHDg4uqGT6cAqBIz8LuXolsuHxtn2NUR6g
         5rgrpkQKbOWmp6Z6yIACPYXY8/sYEntakL7T8CPpFZ30+0ajBxJf6u/Y+Q1LYZKdHjOC
         mGzgwYHOlq+/fBi1/HWfTIgeE7gGvld5N9bLTWkujfy2tGkW2xQ55q4Mm5b0Z9VkpXVQ
         IeX3JKUNfLAo6jGbwsEa9yblR2fXTiJhYGzH8mpZHzQQwGIYtbqfLaYZdJoRb04eHpcU
         0dR4bgCmJugL6uasInEFzcOi+YcCSg0m66OMSjzh3osB4wVJPTh3mJfr6udCXgruR8xS
         GlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514546; x=1782119346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AO44qWTQ/piQGvf4XZH5tHBUAczI/wthj8nd/wpLVPg=;
        b=IvkCy9yhcuQ/ZetHnk0YFJ4A5rkiFEbKeF/zX1aaFJbb19JafglCs/mjVv6AaptxN0
         nmXtaGocJvPw+CTzrlLSEqfquM8q7SCZ2P9i3YJrV6Vd+OGlud8sxVoBxc/vWt+GQhWj
         bPMYuKhzyojZHKSOUz1nLjxIVzt6k+L1w1/Ulwniy2kI5+HPcU5/zmj2YCXccUSdSLvt
         ueTBDuEU4uloS6lmc8S4C/3Qzw6kI2taClBFGUtCS/r+Yx4UD2jhEU9CLbHuljvMnZBE
         GoGUuLTVvsERJJ7wJ22pkCbRxTIqeoC68bVydnPpe7qwQjz0hVFQAf3Q+kc+o/S7nVtf
         Dk+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+hvM7O/jfQY7qwquCdT0VHS3ljsLWR05Jm/eGb2N+RKrBNU58miypX14W5yVNZ0XVyJ87MCF+rtqr9nt+J@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv3XxdSo1/IIXeM5L2nTR+TmMo9Hth/IGnJ4quwNvYWwtBLSgP
	pMqOkwXjD+sakDh+cowBW/aqat3P7NWn9Azds6bVGTBho7gvRlvGWTUv2POT2XEBVvg8Fmsn3j3
	IZYrL91M6u+ssmmGpfsFdbjmburcvCgM=
X-Gm-Gg: Acq92OFn6kHp2guEItcqzbN4WUG/XgOjQ0tm7kC8/Q2VvcRiQVconOCCLD9Txn/laA+
	dyQ2sdOm5p17he8I6ULqvI/nuPoruzc8uZwLoU3w0dWNR4SfGsz7cktJJzErYEFnLqkxT3So1DZ
	+G3MwnDKLcUZZ/dqgfTDPnYqOcxdBLwYqHUiFkV5QD7r6NrdzjzBkZvO2ELBfkd7vo2SVgIBliB
	j0Lg4Ez3u9YmChJoF7V0IF61Gb3d20FIbeJwy9uEAFqH5kfyfCvwaWtkNU/ockxvXy0BZaGlx5y
	P2eQOhoLX1ySVUPE9dN3b36LNhCngW0D4GjtoftMRiQQrebbpExj8FuGdlD/xx/OzgKmDlpYTG4
	GGlsuxHN2uP+fTMcfLmxZoljLvYs=
X-Received: by 2002:a05:7300:4306:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-3081ff5d099mr3585409eec.1.1781514545774; Mon, 15 Jun 2026
 02:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614114739.87061-1-ayushmukkanwar@gmail.com> <ai-1ZsF3dzqXZcbJ@stanley.mountain>
In-Reply-To: <ai-1ZsF3dzqXZcbJ@stanley.mountain>
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Date: Mon, 15 Jun 2026 14:38:53 +0530
X-Gm-Features: AVVi8CdAgOjprRmTsrByqmDewuzbRQiKTUslyhA214F9nI_KRho8JcmBUbG2uSY
Message-ID: <CABJ81biRz2J7AJbo8xZ9TbmwAT8E7x0kdQP4-W2e3XZ729qWRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, Dan.
Sashiko found these existing bugs in the octeon driver when it
reviewed my older patches on octeon.
I will include the required details in the next version of the patch.

On Mon, Jun 15, 2026 at 1:48=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Sun, Jun 14, 2026 at 05:17:38PM +0530, Ayush Mukkanwar wrote:
> > The TX cleanup tasklet can be scheduled by the watchdog IRQ handler
> > to execute cvm_oct_tx_do_cleanup. There can be a pending tasklet in
> > the queue which might run after the cvm_oct_remove() frees net_device
> > structures, causing a use-after-free in cvm_oct_tx_do_cleanup() as it
> > iterates cvm_oct_device[] which is an array of netdevice pointers.
> > Add tasklet_kill() after free_irq() to ensure the tasklet is no longer
> > scheduled or running before teardown proceeds.
> >
> > Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
> > ---
>
> Looks good.  A couple process though.
>
> 1. It needs a Fixes tags.
>
> 2. You need to say when you are using AI.  I think you're supposed to
> say which AI tool you are using as well.
>
> 3. You need to say that the patch has not been tested.
>
> regards,
> dan carpenter
>
