Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE6A5F
	for <linux-staging@lists.linux.dev>; Sun, 31 Mar 2024 02:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711851587; cv=none; b=BrM5OPM4LhkGPIXl6FU+YsWiHHWk2EzObV20gYWtaVZUe6Eyn7HUT2fMYABiGS3+mE17NQgwWxZcHT80tgwJ5UX285BDvU8FICKC1lDSX86SpGgwhhst0C2LXfWsWYFjCljj1U+5vMTJGPAl88wRvTCUZ48Q7ylu73zLbryFLWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711851587; c=relaxed/simple;
	bh=kHilbW50FabGa+skKea/KFAapFv6c2SdbOWrBStcelU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=hr7h1Q13YqTanJEJzR9YhTXarieEPjOVo7bAOOwOXkviGVPy2m4oCRq3/T9JaW+Ja4ZejuywfNxuxqIpECh8Qy9b6yNtCyWRFG4WgF4cbrYu6odSayEszEgW//V2zJ4WBQOiPXxYXZp7S1MlWbgWlQv/4aO1FJjhghVaX1Im1UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfk7GG4y; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfk7GG4y"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c3daebabe4so1829623b6e.2
        for <linux-staging@lists.linux.dev>; Sat, 30 Mar 2024 19:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711851585; x=1712456385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHilbW50FabGa+skKea/KFAapFv6c2SdbOWrBStcelU=;
        b=gfk7GG4ynFbzzdqXGpWstGLb/aA6uDdoOS++L8Ju+uTooANnPAlQ/dfduzwkY7wHZO
         02zjTq97puPjbeyYLJ5IwlhAjd20teCu/NBnYXG0SrQcNd4AodIjOonnLTK4YoznHBXD
         ou3ssQsmU/Vx5pEC0JRMYtqGrIRgVfbe7YfxttNIh7w25+/xzuWUHuP1gyZrD5za5zZY
         7+JR6Dda4NOiWs28cVhKzfIWW81PRHBxaIGp0FY4aIKs1seiSKTQxqQ2BpnGbas7csDa
         y82W8vS0beTy4CzHmcpkBMfs5b2ZJmkkbsMkBWmcZLh/yeZI0C/CN1jnlygIDWfsKP0L
         ANYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711851585; x=1712456385;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kHilbW50FabGa+skKea/KFAapFv6c2SdbOWrBStcelU=;
        b=IyoDtMJFZNHmnJp5m+XuknbaRNKO8n/n4VHFpl9rw9pZ5O5yUCcIgMmgYadCPTJe98
         r4cJBeEjpYsxHJ1ldZlr/Ivu6D7ZuWWef8vKFmk7ojLMpd3+Jxc4sfYw9dF0WMc0+ToC
         hoYPuR4sxnAFm1CFi1Ac2Jc8cKz6v145z/I8rX4LrV1PLgg4bgsi/RnvsF/NlkDtlKLp
         6T+zH/7ThWhDsX1LPAKQmOmrRFraCjda9o7T2kJL9nOW8D4oXSvOFQeXrd6K7VzjC/kP
         jF1GEu6JAgRd99Fzz5nBf6iJuV9DKOj2Rt7u9lrSvgX3tUD8sN7MArAA1JasarUIvYnO
         QYOA==
X-Forwarded-Encrypted: i=1; AJvYcCXb2NmgDrtOEWoTJ0Q12kvuDadKyY243GIenNLRFC6BzILDfCsUoXzcRSsjIkh2mH0Tm5fINuSNGp4I10iP2tnk7P8/LBNyW4QO/Pz03Q==
X-Gm-Message-State: AOJu0YybftmIvghrq3GgueV89VZa+hL2vRzb8ZHCGO1KOp3y/ZQMVbWw
	pItZnZ4CO2lj6f7Hii2bovV8ifx77RKBehpRGp++3wbbO2ATE7s6
X-Google-Smtp-Source: AGHT+IGUkdXyXnx9MegUXfS8lCbdfE6rmSalJRLyGDV8JdTsSDNviU15kroqV/DfSsf9+rpBDX1OEw==
X-Received: by 2002:a05:6808:2289:b0:3c3:b99c:7b5 with SMTP id bo9-20020a056808228900b003c3b99c07b5mr7622651oib.50.1711851585482;
        Sat, 30 Mar 2024 19:19:45 -0700 (PDT)
Received: from [127.0.0.1] ([122.161.52.153])
        by smtp.gmail.com with ESMTPSA id bn2-20020a056a00324200b006eacefd8fabsm5278898pfb.64.2024.03.30.19.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 19:19:44 -0700 (PDT)
Date: Sun, 31 Mar 2024 07:49:37 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: me@wantyapps.xyz
Cc: christophe.jaillet@wanadoo.fr, frank.li@vivo.com,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	luca.ceresoli@bootlin.com, prathubaronia2011@gmail.com,
	robh@kernel.org, shresthprasad7@gmail.com, skhan@linuxfoundation.org,
	u.kleine-koenig@pengutronix.de
Message-ID: <72dc90fb-79ef-4dd4-b30e-97b1e7058156@gmail.com>
In-Reply-To: <z2ewk44rjutv24i6lqau3adrmlprj524ulqtqbncvfaj44dwcg@2dnnbm75abbp>
Subject: Re: [PATCH] staging: axis-fifo: align arguments to open parenthesis
 in axis-fifo.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <72dc90fb-79ef-4dd4-b30e-97b1e7058156@gmail.com>

Oh, that's too bad. Thanks for the heads up!

Regards,
Shresth Prasad
