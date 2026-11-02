Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636669;
	b=omROv4+6dvDw6h4aatXj9OnQhRpz+w//inYUzk3rT8HJ60hO8YgpJ1QQcTbgLYguE0Ce
	 1F+0FK5HIpojyD1EQ5rlqR4t4Ag5NGVmB+txG/ntR7yB6eDxRXdPg3Tr1tynTjDhgXHDe
	 2ctuRqhaCPNBhv16NzhDcKbYiTs7gpirzBZX1jib4hf6LQfYJUpxfHinM4/5QUZpEk/Kg
	 H5pIc99Mo8fcB4r22mram3GEmJxfaf3+Gp3hRJUP3DrJ1WH+jALF0JxDPdW3BDeQObHRg
	 BvgsfnyDTdhBDeeUzbKwsN0nPDX3wSCAeGkySf4Sr1zptRl/9NITQ0YeyA6SI/HtDug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IsInZ5Wzr3QiIRMPj8wd933XclFm0HYROGclgVCpdDM=;
	b=q27HlnCAhcdHYJiCDWz9VZ28zBmc+tP7Vt3nLh8/h75oqKxiRgOpu4iLjfXi1BxGMghK
	 4XV3pGYsyLq5lL+IBGOLEg+xJuuOW3h3SkY81gGZOi9xULamzCBkB8nKC2EvJOCS4bL80
	 cqPZujxB5XH617X1Ti1gFr7o9jPh+ZLuTTeyvQdSfOurZbq7OJsaRtFvgcrMMx9eZCPOY
	 dXZbhrnoIg0Sfdo3t2nWBsM8OUsZVbtYDDMlmwImxOspjIMs7N+c1VYEqGwuRw0Ktm3IO
	 iApSuhZNQGdu3lAjsBCM249AHDh5idEuuipC9InRtmLfgwOfoX0E3ToWt4iSEXdm89Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmesra.ac.in;
	spf=pass smtp.mailfrom=bitmesra.ac.in;
	dkim=pass header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=k53VkOGW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA366085088
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 16:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA366085088
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=k53VkOGW
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so23178581fa.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 08:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636666; cv=none;
        d=google.com; s=arc-20260327;
        b=RJtyYSmViiCuAQVC8Zoj0/aoxpYMxBfB9NCQbNgvFF3BOGAzLnTGKm7VdyxWQiAHjl
         CUoeabidxHfC2SuOB0/hP0UFJ4nrKL9prkjGXx6sQxNxFQIjHXG4/87UOO5wsapjMQPg
         o3GliH7YazSIvfbd8aHkjC1IkIRTm0N6XFGPOdEQEmjXRKH5ZFJsQNROLGT/mWy4p/pO
         FpKso2fZRhQnl1u16y5dijNaAXQg8K3b/UqqsvT6LssDkaPZ3fTWlFJm0vhrzkMIpc6O
         vxBgzn2HjyzXIns8+R05yjKvt0GmJMPF/0YKbsobBB1+Amzc/RVzSSa5Bdl3+ZTnr0Kh
         rSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsInZ5Wzr3QiIRMPj8wd933XclFm0HYROGclgVCpdDM=;
        fh=iMpgRwPpvr29Z0AgiaCZRNJ84o7h0M0WQG/e+BzBvGY=;
        b=EIhOVmBb94h8LM5g5oNpCdbhEpYnq8Leu/fC0O1hlhdAfmG1QeGUrz6pcwr76W/KqY
         Cyp4I6XGmKUt9GouAMmamuMhyPeQsiINEky97fdY9yoc8acwZBB0timegMr9t8FrwtJK
         r4FFXu8lhMmjDCnHJaXPh+bwiGMenkYSn+D5K87VzFCvQjFoYWQo/0RXf/ryTE3mxo8O
         qe2lRYt8NuucPoMocVRZK9CPLWQs2nZCRGTzE7TEgA4iyB/Znu65GAY0E5Ak2Jd9RFjp
         qjtpsVMZffoZfkfZvhkq2NBXpwLG+FzfSwgPTjdxJqRnhgP3/f+8wpIOOoen1XOvvRdK
         KHrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmesra.ac.in; s=google; t=1793636666; x=1794241466; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsInZ5Wzr3QiIRMPj8wd933XclFm0HYROGclgVCpdDM=;
        b=k53VkOGWPOjL3I6G9amgl+rusOLQYbHrV2R9R3e35p9ZN1UNeud/nB7Mz7P5miwYE5
         3pF93IICGGwGV+aQ2KEnKWlIkuPYYL7qc/17JlxJKqpdkj1pTST1/3Kfui1inzGA83I0
         gd1DI2xtgZPYlh8+Da9gK22pLHIts4qliInSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636666; x=1794241466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsInZ5Wzr3QiIRMPj8wd933XclFm0HYROGclgVCpdDM=;
        b=UOIt6GA6TAbXog21r73eNFTaLd0xIbZCaJ26sta4BpX3R6EMAe1gxiA1mxUGgI1GV0
         ZN3yKqwVtZccwjZXriUc4YbK/6+kYTViwg230vWmF19BONTJ3BaQYJ+XqCtq7tWxKVxA
         1E0yaf1P8WJdt9sS0NFA7woOsv4Hz+OOvOzy6/G5Nd9hzggArTEeS8dXOnnAE4HTRD5h
         8Yuw93ypwxduCXiapUdXdA6J/zoeTznZ3lyZ3DEkd36OiLZvH+y7jFpn6BazuZmhnW15
         eaJkru6y3b0bfnTpi0wtmn2PNGjUrpGzs53dvVUXZyMPcSudcOtM2AxxAFO+Q8jykt9X
         MNiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlJH0A0C2QA3XvS5hZ3NiA2ul2kEYxvuUsDIr29qGvdAcMlRxAfM4iBjeLM8zz0+VOva2bVJ2f9DyEPfHX@lists.linux.dev
X-Gm-Message-State: APuU4Z9yh+ezClwKPgMn/ftr6DlDUfNVhn+wLnlbD80lP7IXTvUETm4W
	437bRwLrspZoo6Gi9114yHJcye/6cdcW69StD8w/9rS2c+9v8RZl93r3l89zIhSjMW9QNk9e2Ix
	IU7g0hy0l2vc26dl3tTo0oz2ReZQO+Xiso3hPnXwX
X-Gm-Gg: AYBFou3Q7AxnN9WDv9RzOvQTQi3gM1F1aauh2uYhKMVhGuPdUGXLKW8fwCyL8g0lsHL
	FNWeqdgjl/Cb9gnqOmUXElLkzkEdsM87ztEqQtNOKgYfH2XGwJHkfVsWjzVMeZVxj5hW8RCnkpq
	ZhO8ubUQD9xjKJlZIc72/T9eVs0hnUTthl4h4+XD786fQ2G9bJk9ZZPcedW4oKdTVq+yW8T1qzI
	G1RvDd8LWeqnrMLAb7r/7qgNyNlab9hA9r8i246x2Fc9RKHhmAORi6rWLJX+8lqFWP8bURqjlft
	JlM4D8xnkI0HQG554EToSnxVubIINihk+aeJwXSHEnseNooVw3hK4do6s+ujhLIIdWO5UHy+QkO
	+0i2OjdNvo7/W6tQNdzEbYsRGWLD8y/UE/lmEfQ==
X-Received: by 2002:a05:651c:248:b0:3ab:483c:9149 with SMTP id
 38308e7fff4ca-3acb7add2e7mr20838351fa.17.1793636665894; Mon, 02 Nov 2026
 08:24:25 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
 <auihq9nm86d6D3MW@stanley.mountain> <CAPwSj7W3HxLeMLHCdjEOQ2pr39tSKD1_VyHwMpq-MshTpaiP2g@mail.gmail.com>
 <auiwY5ReM-rqeG2I@stanley.mountain>
In-Reply-To: <auiwY5ReM-rqeG2I@stanley.mountain>
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Date: Mon, 2 Nov 2026 21:54:14 +0530
X-Gm-Features: AclHuK_Se87ahnZas561XVaIRSBRgo71RWDM89AU0HyMe8bpdXo8Rnq4aEXc910
Message-ID: <CAPwSj7WaNPwkrcMmyi9enkLFn4z6ihXg-VVde3CNc-Nj58j+Sw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: fix string termination in firmware sample
To: Dan Carpenter <error27@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the clarification. I missed that this was a user-space
sample and not kernel code, and I apologize for the formatting mess
with Gmail and attachments. I will set up git send-email henceforth.
Thank you for your valuable time and the documentation links.

Regards,
Kurmapu Sai Devansh Prasad


On Mon, Nov 2, 2026 at 9:16=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Mon, Nov 02, 2026 at 08:49:58PM +0530, Kurmapu Sai Devansh Prasad wrot=
e:
> > ---
> > Hello  Dan, thanks for the advice. I've attached the patch this time to=
 avoid the Gmail formatting issues.
> >  I also removed the extra commentary from the commit message.
>
> This is userspace code so the original is fine.
>
> Also you can't send patches as attachments.  There is a whole process
> to sending v2 patches.
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
>
> regards,
> dan carpenter
>
