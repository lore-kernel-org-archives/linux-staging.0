Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BFE22DFB8
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 05:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771910271; cv=none; b=FcCBz01onAim/NAX+5Pu6pmVf9m2UST8qgcXI3VM0MKcbpKyupUOId1VJqAuz4RqUucFLtsIjQeteLWukzuz2t7nvzjeX0bV8kXHzBaR9gzbuqM+eW9Fdr5BeoNaSoqt+UdNPhdW3Mj0U3F7WO8ZK+cgxfuxzLnkE5I/aI9R8G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771910271; c=relaxed/simple;
	bh=ts4zm73Xb6i9Jx13zjRTvsHphnqqT+ii68dYJ4yoMdM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=eWJMMzgOH3ETZDzCJS4WpP58W4aSZ77uTF12s8tlY+LSE3h5Kmh5+8oCWyRHrUV/5y9rrc3Q2P+xJ1Ze6VjA+FpcixiezK5ME0/4/hUjZCZ0CQlTQkM+pQYyCi2NXG8JdFkzoYYDvaEdbiiRItR6yjrt+J8XbmuyHFBH0pfA4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bx73YAjw; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bx73YAjw"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9ebd1369so328885d50.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771910270; x=1772515070; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggWwj8GlrSgar+Wmo+DQ4yu6YjUBkmUJukFAEwjfZZA=;
        b=Bx73YAjw/avosJkoCzZZUg9HaCIBEF9akGY6bFOD81pD5mCM/R5tlyUH48EtdrvuvO
         nDx6CrHZwoRRVKvLUW5eNy4Ipy6vzeHxBbQ3CnGTXwva5xL1MOsKbLGT2uXTgkGswEAm
         xv2nQHS31uy9JAWliXYW4lkKnNGZ+eQtUa1RQ2ltqFhcFMLvostS+azkd09gcUzWla0m
         bfo2pS5pihQRlRw67HXVnTz374ioSLkgkmZCr752h5VT+L04U3km0bnA1CPhq6EBQyx4
         FH/ztbn8cOrQ1pE4YKoKIQsdsF2d+PKNJ5xR4Jpx+FgORJsz1lcdLnt0ifiGlv40UVfP
         9WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771910270; x=1772515070;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggWwj8GlrSgar+Wmo+DQ4yu6YjUBkmUJukFAEwjfZZA=;
        b=KU2m9qXNeowHuDTZtEhWGUdH/rdQMcRRdJxN++Lvy6Ms+ZlKt9LFa13RFkCv9RaOr9
         TDrzYI7ePDM3OJa5DTYOoGHQTxx/VgpdCF5UBW7juJZT314dDFNZf11GA3BwVH7vkSvB
         ojOCeDiNNPKYGpHb4RPnQA6wYmcu4+OjLymr6RB+tvE9ZnPvi571FzxTrDX2YlRM5EG+
         i536AWCqLeRqX5zrUG31GQwXqMRdlrmrwN+2sM/uS2rymERLIpxDYT3h1JgP7pe8oieK
         t4+ohLGggYcaA/Lgrgfda8ue1wMIno6XW2DeMBOpOr0QEP9Mt/sOGdoh8HSIcDoH08qq
         tu4A==
X-Forwarded-Encrypted: i=1; AJvYcCV/6GjUzk0G9fHBV9hVEhl+OxEmC0JZXeUftTLpPQc0YqAW6mRV5cA/CBcR11GkWb+jD8Znlb8bzdtIu72V@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1INkQBtEC8F5srrM7aR3pIrIMSZgUxs1DqGaxaqsvIvL9F9PV
	gkvP0YX8TQ53QAVO8zuFhGDweeWObbomEv0GY/UzYmVKGfs20L8gByZ9
X-Gm-Gg: ATEYQzzFVIUfude0iYCFH4cBE/hRNIgaFaQtvizTOBVieyKAE3AoFwM8hLXUa79w3oV
	IXyfwN5ZO1qQdgYLmojoW/VHQRkzNLnyCtfyApQ5TLRYJbuTeTbob0OFInOECENqFNf2mysEdKB
	Z/FVOsWr4JBQV+9sW/STeK9uiU452LAYGls25h+iqsiGlbULvEprOmkjyQxD/C9fVvxfYgIQ7bS
	hJGr+0mP3hDWq1yoKqpSkGBsOtasms/xY6cZ3tudidjZcEJMGwGGCiYdk3d9WY5LQFZd3HyRA0k
	dchivtL2d3EgRojKwFMxvfH3EAEtRDkYaS6CzhR9JBHqsW3NNRx16VN0N5cS+cyRkd5dt3ucyR0
	i5mUeUVmdOkFyzDij8V4/QcaRnZzCCm2m8cIei9IpKlPgB/PMeesK3ROJILkHebzfEcKipyjwjI
	2abQz1TvWMFIIjc/CRIBzWBja3ZziM7AZJJ0lGqrjdpEnQPk/f0wehCqJarCMuCDkx/H+F3UTQj
	ItCmACtbI/8m9irFn6s8PZIOduGEyZw
X-Received: by 2002:a05:690e:b86:b0:649:aec8:a66a with SMTP id 956f58d0204a3-64c78284542mr9049513d50.0.1771910269660;
        Mon, 23 Feb 2026 21:17:49 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c9f96607csm258943d50.12.2026.02.23.21.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:17:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:17:30 -0600
Message-Id: <DGMXRFJTVLTX.1XVJNIXBZ01N8@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix spelling mistakes in include
 files
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <tomasz.unger@yahoo.pl>, <gregkh@linuxfoundation.org>
Cc: <straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223115943.69463-1-tomasz.unger.ref@yahoo.pl>
 <20260223115943.69463-1-tomasz.unger@yahoo.pl>
In-Reply-To: <20260223115943.69463-1-tomasz.unger@yahoo.pl>

On Mon Feb 23, 2026 at 5:59 AM CST, tomasz.unger wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
>
> Fix spelling mistakes in comments found by codespell:
>  - sequcne =3D> sequence (rtw_cmd.h)
>  - modifiying =3D> modifying (rtw_mlme.h)
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
