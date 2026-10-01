Received: from mail-oa2-f7.google.com (mail-oa2-f7.google.com [74.125.231.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96234A0901
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847781; cv=pass; b=foT7nIWZWOF3Z4vHAERa8/uMR37uXvCaeJ3t5RSAp/HZDymgjWSwkOlwGwWn9yC6fJlQB6+E2RyPFU/OlLXLCrH5eG02qfj5w9WEJY+KtqXgp901eDZiu8TRET5oARrLh/N0lot7mPawhILet/mvDmYCb2EmFwE5bLSPgyDoVyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847781; c=relaxed/simple;
	bh=ddo5FpPKSa3ZD86JRNpiQ5RAfQ1PENUBjsbjZZ4aBUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcrqJqoFDLzLoHGnshIFXZpvZleVCgyUQ3w0rBdT5hccPa2/VkKwfd64XZRdpSPM3Jg4emKWyZgxwIZZF7fB2XbGS4pqUw2/ncHidtW+8s+EXFGI9ExejBLDVv2y5gyaKpdF9Eq4IvBvTxsc7tPhHy3OeFhrRGIl6GP6Cg/pniM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFH/PPkL; arc=pass smtp.client-ip=74.125.231.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFH/PPkL"
Received: by mail-oa2-f7.google.com with SMTP id 586e51a60fabf-49de31ad0baso418281fac.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 02:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790847779; cv=none;
        d=google.com; s=arc-20260327;
        b=QpRJ+/pmLxVrBjilXTApfL/fNWb7SvvoyHZcWD0VCkMR0U5w5R2lNUKzMq6YEaXBtd
         fbiSE9yo2T7YnLZUM/UdYNViof0ui3B/CAduwVGDb0ShpsZDZN6OK0Y/PJ/pqDOFlzTx
         B3wUgkEnB/4oo+p4QD90twTCwVXy1c8++5Ay3hYNNRGWpCoUd1ZbU9sVHr5AU53eEybJ
         GkVlzU+HqUa/Z5jovqecIxmvV69ODhkSXA0bYQ1VJwfuTcnN/f5LtICMvfmYpPULlzKl
         uLwDfKmOQVaWdI62/vpdseeJNw6uX4It1tcpDnsILNpqtHMXEO0G8io5k72pAUtXYLsy
         JooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXVuhUD9j6xV/vHmdo0NZBylAv8WSnTWtpJsuQCbSwk=;
        fh=IZDcIbdKjU2LklQd2vMsw1EzdafiqXTVCO44oNweHD4=;
        b=p52piO/0MyDpEQK2g4/jiazjaW5ZXkdzK3vAHDlmKMXt8WIahGiqxM/Pmb92zvHK0e
         IAv3MrT9OYqaJMWQCvMY7kam9npd1u9I7bmHxxGwv3d+i9lr6XaikXaCf/+IGUH3SOhB
         ss0rYHJKsb+k9AA8AV1TY+bX7oNf0zBXAg4hsqsA4fq3L8+iwmVmmve6mgmapNBl3txA
         vg3UzBBLMiQZ77bryRbU8T1qtOeAbgRM59oD6vQ4QktBGs90Dn8Q5AN3Azmz7G3DJy/Z
         ug9rOmDDPlxy8fy6bub0dXIOiWcIWXkN2O5HX1ZKdqZL9jLTqX8xpBkThe57tgpqvtpl
         VLTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847778; x=1791452578; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXVuhUD9j6xV/vHmdo0NZBylAv8WSnTWtpJsuQCbSwk=;
        b=nFH/PPkL9QKYaJJUZYsUI1Ob2KMxeeeYqdGKyQ7b3kTY5OEesBX9S/G/sWinW2u9BO
         eYbkdcLqg9aBahqc7f8BV7Vok9oazDyddI2jTYhTpEk5Clv5x2WnmsSL0/Cyr0Qa9a8B
         F3pOP8ZcuaF+7qOQMoIcdPPjRMAE39j/xvzuZeg972fh7iOSK5xDJoIK5LeN4Q5TgYv0
         BDGbs5CdpHuABSLIFXVTeN1e80z57R4s+9Jn0H5SFBA3JGFUaXLOs7+UpWDmzBCRVzVF
         ylvgG+f4bEdKmA4lFBXlS1BqwYyI7bQnr0CJH7ZyVvZUvAgJWHtMWJ2QAbuxQ7U0kglZ
         7rUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847779; x=1791452579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXVuhUD9j6xV/vHmdo0NZBylAv8WSnTWtpJsuQCbSwk=;
        b=Wuna2e0Zhup+MOoyU1FjMsa/JHXr7W0ZgJ3Bf9xh0dmg0EGEeFdmeHOQMyfe1VyR7k
         f/+u2ITRJejiS5v3a7rF2lOU4A0QKF309lW68hkohzsMSdkXouFaNNdjrPCPtBeSqQO7
         QReMx+iEFjukA94t0MJTzXYU4cgS6vdQOUUO+nSbTCshtfX/JrwW6B7oZwEX6f6g9oTB
         26hpqsIjcMZGraB3YbQSrKKCM1/8gRcu2ijsYl1og/VUIdp548l2dstRXznzFilJA3Po
         nSjRl0AZdU55H+7mibJU+C1lUIFE6TF8T1eEbeloxqr41ZdTdF3alTlr4MB7K5JWFbY8
         b3XA==
X-Gm-Message-State: AFuF++k54vMtn4u2mcLqbOpnHJHigEcLNVokQzUws2ndTQM8+/lYa7Au
	wj0jX+aexjU+GF82OHn27eLkFJrnDll0l+8r2+BJnvNZtAZJBeYR4DohUQPLcU4+rdfHw8PTrpZ
	uGHODhdwF3nar9Qb3nV/ubUpI0ime4DM=
X-Gm-Gg: AYBFou0pCLbfr6EXCSDf7HpvtkOMJztyFgUxeICLhj2S4NDDw5UPxGwrix8a4iWkPF1
	1mo+V95JKE3eJOpglWJoCbTpuUV7VRPiZzW0CwKm3EbAOINzZYwndmrjZXe6bxBRCxRI5yAfE0h
	ov1k9kPYS6WKaQxErxBSgAyzRr/PLY3J72xasKe3fMy2nsfdxY9mIsLTnXJ1h8vWpOOU0ENjMts
	7cxcLLRACGhvTvzGRuv9zYdyjT/yRoxvDLwpdLE+5jIr/398DGMt6LiYBmmsU/7k55nBP0Q0r5i
	I2qndli8F44RA7sX1HjGypKw0jIP+t3vTycn4Shzb9P5fm6w62nJSeh3yxyhRwvouQV4aBuubCr
	Bdo9EMmH/kw6ZFw==
X-Received: by 2002:a05:6808:1582:b0:4d6:9153:2968 with SMTP id
 5614622812f47-4f1bafc0673mr4267319b6e.57.1790847778626; Thu, 01 Oct 2026
 02:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926105827.3760-1-dennylin0707@gmail.com> <2026100145-unbitten-playmaker-8ac5@gregkh>
In-Reply-To: <2026100145-unbitten-playmaker-8ac5@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 1 Oct 2026 02:42:47 -0700
X-Gm-Features: AclHuK-M9zWtkr3sM6tGYy3SnQUDCk4tJdBSX-r7cGl5515IiBuM0oKAYfVlPSM
Message-ID: <CAGEkeHd__+Vc9cUuYwUWcnjtBEGU-Lt58TpEnHf_dQGQpUErdw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: make rtl8723_dequeue_writeport()
 return bool
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> Please change the variable that is assigned to the output of this
> function as well.

I changed queue_empty, which receives the return value of
rtl8723_dequeue_writeport(), from u8 to bool later in the patch:

> -       u8 queue_empty, queue_pending;
> +       bool queue_empty;
> +       u8 queue_pending;

Were you referring to a different variable?

Thanks,
Hungyu Lin
