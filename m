Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A2B3002DC
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508503; cv=none; b=Daj8GznAzJZ732GrB4zYjgDWDE8CzLS0YbejqP2hn7KrnlqikzmehyUV8C053y7GpXQyLmj0D865DMMjKPfXZD3nK9Cm1HdcGaZj0YnCeJhVklC588N2jRZpdCzfJJaiF3D3crj8tIgxtaU0PF/wz4rqm5Jma1vhnJFv8U04Qgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508503; c=relaxed/simple;
	bh=8rYtEBTfK8IfEJt82Xp6z03QDuWaNhLL7UGx0DtG/zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFISuTjWiVMH/cD1XwO3rVvtu66POL/kWZJIohiZsV8KTCIOVWH3tgd8dCCBs6ab08EUJ1Qm+ZzAodD73DuOK79sIDtMWAuUeHnSym3/EL3dVvuW8tMutNIjpWirht6g5V9NxOPuIq2iogxFiaDl5XyHWY4RX+D94VvTqDBRYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOIWLBOk; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOIWLBOk"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-915e1354934so323113385a.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508500; x=1782113300; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wPVkcX3iZ0QCbbNNiMLGuyb0koxQNh+zefG34kFGMHI=;
        b=JOIWLBOkbDfh4qxxJT12eGMbalDxOhOIGFZn+1e++T6PrsGh4/w1wZngEvqiwWZ5FY
         KzlWWIafGwdcDup0+YPpXcO7nxLfmGu2BxR9/bMzoMO0vpLOc5pUQYhQX+G13Ae2nqe0
         zJflJo7eIuK60E37mZmaAU+Zo739i9yotBIWFNdlOXo1G77Od10uVHyZvXHf80Ja6SnE
         zTB+Q7PLOHnQWmFg55okpfJzYWX/5nRzVmXsc+cbi7GxnX5pkd9J239g5PNcTVYiqItZ
         /TCSYIBvpuflaMKbF/1t96+2t9HpItCWfV/WlGSohO1OJlxJ0SgsNSNwOKm/s0IMfDeA
         vAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508500; x=1782113300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPVkcX3iZ0QCbbNNiMLGuyb0koxQNh+zefG34kFGMHI=;
        b=if6Eayo8YUcC6gJujRftJ5C9avxX4kvkMN9Fnasltf7z0uRt2Jytz/322TJHdcDdiU
         c4vyDuYcha8Rec12a6jyv/vUf1VCP9TGxlcs2coAOr/40TwUlpzv9FUgObAztgKN4leW
         6MqHmKxAvLRSXfsWs4nKle0vyKCeQTngcf0esFVX82gYrxAVOcF3EgI4IiWay9tOyEkH
         n4TpgM4Za7NZUpgH4KQ/ZnlA78L3Cekkv2a38dHapkUhYGCH6cgPajZagMd3Y1vncdQM
         9aYXst5v2/aRj763A5xXgomFSDo+ogPCH0FqG9+RerwA44ybMEcS9ZXR38PQdQQlCA9Z
         wWcg==
X-Forwarded-Encrypted: i=1; AFNElJ/v6WWFTrz0HlEkEYxuiyBbZoH0Jdkv+9CwUAbF4wL8pOMzADvbp4dbVeWEISdaiV5xiYwE+z3oK1ZHouGN@lists.linux.dev
X-Gm-Message-State: AOJu0YyvnSdpB37BIShdRM3qsdfFyCYQ6d+DFrhfL6UpA2e4zgS1pdHW
	vdzibEZLS4HzUTWQvfbnq86TdPdJbup+I5DBBrAQz08elxkbmtao451/
X-Gm-Gg: Acq92OH3phDYky+z1r+hDZMR0PyEvQPkqbE08o6DBSSJnlpvNS03mMSIPHMEi73Bas8
	9WYMLxsDJwtnlhmTIqBUboj77Hgz8k3TBWSDLj1PZzBra3CRNXrJi0twZholUmU18tVP9ohf4Vu
	5m1lO3xQ6OusNAPs5WJHkaTOWCplvO656NDlZylhzzz1h7yZ+d4dNscZAQwaYJ95+aa+br5p3Pv
	k364/RhnN+vgxaMOqTt376qgt8AUYd0rv1ecWzluADF0b/tNH78PvGFEFQuLNlffFS4uDXKUrf0
	yZtQBeFNPQ3zMTpeyJxTuJiPWVmqU4PQskItLOJog0bNMkgTb0gYp0Sv4DEIUqXqfc2eUFXEpCc
	VzAhczhpwCcY0G1vLk9BzHLkdUJIlEuk7/jJhWER2Z+DAFH2QglVcQcxXv4w9H0kIViLPAEbXfL
	BMWdXdi6SaE7NbD0oR91s0baVOJY4=
X-Received: by 2002:a05:620a:2a15:b0:915:e932:9f2c with SMTP id af79cd13be357-917f1a5c959mr1550702885a.52.1781508500323;
        Mon, 15 Jun 2026 00:28:20 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619ed7540sm1038564585a.9.2026.06.15.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:28:19 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:28:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v1 0/4] staging: rtl8723bs: Fix missing spaces around
 operators
Message-ID: <ai-pjZQbgUiqMAgt@stanley.mountain>
References: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614122155.20034-1-mokshpanicker.7@gmail.com>

On Sun, Jun 14, 2026 at 12:21:51PM +0000, Moksh Panicker wrote:
> This patch series fixes missing spaces around arithmetic and bitwise
> operators ('+',' -', '&') in the rtl8723bs staging driver. These were
> flagged by checkpatch.pl with:
> 
> CHECK: spaces preferred around that 'X' (ctx:VxV)
> 
> Each patch addresses one file independently.
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> 
> Moksh Panicker (4):
>   staging: rtl8723bs: Fix missing space around '+' operator in
>     hal_sdio.c
>   staging: rtl8723bs: Fix missing space around '-' operator in
>     hal_com_phycfg.c
>   staging: rtl8723bs: Fix missing spaces around operators in
>     HalPwrSeqCmd.c
>   staging: rtl8723bs: Fix missing spaces around '-' operator in
>     HalPhyRf.c
> 
>  drivers/staging/rtl8723bs/hal/HalPhyRf.c       | 8 ++++----
>  drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c   | 6 +++---
>  drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 2 +-
>  drivers/staging/rtl8723bs/hal/hal_sdio.c       | 2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)

Just combine all 4 patches into one patch.

regards,
dan carpenter

