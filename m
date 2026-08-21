Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96147ACD2
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 12:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314058; cv=none; b=fJbVuDd+OxSxXbCpM1EqCY3TEcWx73zK9Itv1LtMeiYKqjRLixBClzL7+nhQaLg58zpVPa6r2gDGhOfaBZug0TUxHGVnQb0o07cBT8hOtsKaoHZBz56jIk96Yo9IjB6MNAigiMPdGMag/bsm1pO+33jUfSX85Cy6NXvIGPI75OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314058; c=relaxed/simple;
	bh=WND98xi4kcaiDMab/piGwPQUDbHFz1joQ5NWcGKi8PA=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m0IHNr0eYBjZMnJxmmOh6ErCvuoFwn1gLpjQkSbZhZCllBtGahsi/owDGic7MRpH/BnyJ98tAhScuK8+fJDdPI8RaIsN5XS4YqSw4U4zew+/Dk4V9dxE/qi+TGSqG6nJFaU0EyFTXR/GHNmg4ORl5vydD1ui/qKY67rHZ5SA0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DemVVd7M; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DemVVd7M"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1070040a91.0
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314054; x=1787918854; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41yW1mpvijPpCXEZxWND4UtxVbGlZc+eTbFwWYCv4fg=;
        b=DemVVd7MyMp4dsJjbCHPKT7jJi/mpiCzCauf5inbfjBOefWKGAkl/jm7c+xE1Nkev2
         keVa7ni5XY5WA26G7IyW90dFsRYF2XS0Zlt5VItrv23hNzUCxsAPPShoHdzMxT1+9IuD
         Bo9+w0qq/jsyx06pKjzvJPuSRVmUzKtTvau1pzU/ih1cc3PnK5Vhmh5ChOYUlzx5rpxu
         SylSLIYTGSXLfa5rdI+ubq1lxuRPyDihbXK//aofUQbTIRpiWHJUI8/j1s9ttPnaBkWd
         2uvEcH+sTdR5N0ZbSKyE2vkFdi7TpLOPfLjRtmTEWWUl2cYSpxzWJM2Z1VnFRq1BVE/9
         EOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314054; x=1787918854;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41yW1mpvijPpCXEZxWND4UtxVbGlZc+eTbFwWYCv4fg=;
        b=Jz+idrqkTpz5j/7Q8Iv+djpyyAruHdcUspzQbIKGKJqikTusdPC+TYuyXXxCvypsrC
         fJoVLCJbrOjBmo4qIDVd6K0Hj6pn2QTCHBW+zC6OgAS9zk4h341yYxmscWi6NpLvPU/z
         JC5Kb2Gl98J/f1EM6IF4zH4SIcTmEFEjP/KErBAoM7x4w6uOaYh5fQykGx4PUIBvIW69
         Jc/YqPh08DwgohSIN4D9YM+RkwAuoonDNRojP20q1kfWHdJYOScxgm5X5IerSTyY9vtu
         fd9nwYAezW9ojbK6g5/p2OrLOvwCbQv7tc6KX4oSXEeO/g7BoHdkOk481F83lEgYLFLb
         a+cg==
X-Forwarded-Encrypted: i=1; AHgh+RpynkpmR+MUaG56ZKFIZy2tIsCHVFdEN96r/EgLFwOOO6ZspydfoYT1qeR94Y0OmNv3EPygJx2WL5zbfRSO@lists.linux.dev
X-Gm-Message-State: AFuF++lHibv9AxU2ksxw7Gy0n7lxOzTlDUB7guDMSi7GODe98qVR8d2V
	VWJTdhjLtWHE7cCGJLFUrDiRV+jJ2spKwcKHFh11Fywd7114knWCW5gW
X-Gm-Gg: AR+sD11yibVW6uIxRms+OXcZe8grIGVz6CcQE1svbyXQdZuC7AQz3LT9eWv64Ex1TW4
	nvIiIBsB+Kpz6IT+kNqRaWs9pmpRrhSTvstulE5pUmOwMqrUkstjGTTr/Z8+sf+/JWgrvmCsfzo
	qco3RKP/yx0Tz2988kA4JzfItVnDejuCS982ghip/JRJrPMCSImDXiAdP2I4bW4QRLAs/1QYAD8
	+B2meuuBB7DonvUFItS5KgO/6A9bIN65hZHSdbinQAyfALq5UcBdTIs/JcDxCp7JPMM+3Id0S5o
	hZbN7p4zZYGfcDO/qmSfXGQEe1k6Tx7SQwjUeYeWEzZGblg4FroxbKztKVahgBGILHsTlfR3YyY
	ouU+BFe4QWdrvbXzw5Vsj/BTsHIg4xtGndnEn/yyfq9ODVf+Iu5HWNq1hvNF0BHP/M6Fp5scCs8
	RcwHOFESwvq/QIWuwrOVw4AlSXa2sy2Ps7MANLsDr5Ul7NljQteK3Bzl6yKJ8x0esU2zpFqHrrF
	ErM6GMLa8+CPcuQ/Wf0n7wQ8NjCz1rOFQAPttuVyrzflWF72RjFzQ==
X-Received: by 2002:a17:90b:3142:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-395c35e27c2mr10129319a91.9.1787314053985;
        Fri, 21 Aug 2026 05:07:33 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4baa594sm2918858a91.17.2026.08.21.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:07:33 -0700 (PDT)
Message-ID: <6a883f85.f375f8af.234495.358a@mx.google.com>
Date: Fri, 21 Aug 2026 05:07:33 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: bootrom: fix potential NULL dereference
In-Reply-To: <aog8KROHA18VIZtm@stanley.mountain>
References: <20260821113540.1989561-1-hanzhijian1991@gmail.com>
 <aog8KROHA18VIZtm@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, Aug 21, 2026 at 02:53:13PM +0300, Dan Carpenter wrote:
> You're using the word "potential" but the commit message correctly
> explains why a NULL dereference is impossible.  Don't say potentially
> for things which are impossible.
>
> A lot of people would argue that the original code is easy to follow...
> It's not really fragile either...

You're right on all counts.  The commit message contradicts itself, and
the refactor does make the error path harder to follow than the original
if/else.  I'll drop this patch.

Thanks for the review.

hanzhijian
