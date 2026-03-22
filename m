Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F211FC10C
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774216898; cv=none; b=avzvbO2nDIK2S3oJUq9cT0eS2qCA98sZXF589t9xOzJG8UyhJysHBdzRgREbzkpQUdrDVVbrBo+p3M3/39p1t6k7JdPf8njsXmchpc6N80H+lnW+nQQUINJbHBUKjY+bW+YSmzbyM4qjv9VzPMOQ6JEkWEVVgS13nlS4ggE1zcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774216898; c=relaxed/simple;
	bh=EVZ/G7U+F37g7NCJNxYSf2ubNUq40qfnvnfyF/mYLdE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Fl0kT02QIjuBTZF91fdEB+26iT/PYYFItXd4p3RKc9NuiCLO0AmQtPIdZz6ZKsub6S38HyABamBdgnRJ2JjcDy5U3IESZwVLobpY7l+4UCK15MWGqqGMJBJbhb/8pGjmh+2zIdowsFDrNdHKRBGuCLDcRTea92HXeaRqTLiZleQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4EUL5G/; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4EUL5G/"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ad46a44easo3207338d50.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 15:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774216896; x=1774821696; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgUG1ZQWFuykBrCgx4zA7Tdpq14GaxPeZbocK0CrRpo=;
        b=i4EUL5G/TYLUpamuXu10z2TPtvrD5dYisiUrW22ju2yyBHFZS68FxQihKUZthEykKN
         TKsZyGVAcRCQrMQxrtuOmRrRSimER6X+qun9xZphpmhCB/EC0BANcerWH596HP87MFUW
         1H0whi3fjhW8SNuWaY2x1Tfx/E1rNHPPeRoakff9Q36/IAnq3dAi2xlYJl0cEI8MUngj
         6yg2fD67zSEJrJUie4az+q0nt7tnO1G0cXftTxGd6p/8OSkrUPDKLE6QTgpIoP82Cshz
         CWjuBQSZn5kfgjno+XjHcDqX4Mt8WYawuiKuLAcDjGFo+cL/+ptaMoJ1jex0MksZwhta
         bR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774216896; x=1774821696;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgUG1ZQWFuykBrCgx4zA7Tdpq14GaxPeZbocK0CrRpo=;
        b=nVTdOCjlXANfFOz8AXZges4pFNEkGSuLlY6wJFj1XBqxhX1w6GRQJq51WzdcfzTYAx
         R3ZWf5L3F/rOxUTqCfGcSYBrAplBgC1v8tn8QsILs3Ynuv1aquDKWiZrAnpCdnb4NDOi
         +7gA1Pg9oY6C4kYGIyaryPoqcvlGE/L7ZhlxN1bKmBgIRxuD2IPk8uJacX3Wn11zM/HO
         yztKgaqcBtkmu/lfrt4SAowYv8wQ6RA9C/bF9YJpjjWIAmtsY12h/U/bA2hG0n8kB63Q
         m9u4GRGmT1rs3U93bFyrS7p9VPBQ0r+mqDOuzZsYCCyz8zYTTVEDu67Vkdj0EFz9WkYw
         maVg==
X-Forwarded-Encrypted: i=1; AJvYcCWIpT79yiuF4X4MY5l2VF1PB0mQusxbPUCftRm/yUo36YGY4WoJcVg0x7/4LI01Pl7Rbg+0B/Yjz1A9Gh9R@lists.linux.dev
X-Gm-Message-State: AOJu0YzrdskJ1kZoTOiR/FpuUMAHODqHwcVZWDK0BTtiqc05B/SGhncq
	fJIvBj+/VyJY75kQ2wMWJyIlypp+Y9f1jiQ3WQK3AblKs/NtzM4fc4LL
X-Gm-Gg: ATEYQzwtacnoYky3xHrVcZs9FDNyNbj0dqtrssGtEOGZ/ODkyq7q2zg38yFBLut40aX
	u/fWHvAfkEFlbeNwCKnU+l5Qyqkeu2VCrBW9+A9PCrohkkqdGOhbdIrhQxl1iNju5Mi883DPN7G
	G42Eq6k2gvqGmj+wShvhd4TBxTaa+bIzDRTo/A7M3YSZR64sNvmUnaDmaBKnj2gcuBQkrstf9Qq
	5CBosIXETMdHvpGcnO3byBU8PjKvak9i9VyC90pEXBNKuCtImsfapH9YBld0efBwJrqxXQnXwqS
	6TFDZFUM/Gl3b1rCihjoULa0r6f8N8wSdERWeYAvEuYjbL6rrhzcYu2gpDXCXbTECHXUlAEwpFd
	ObOlFg1jYVbJpYLhLAKB5lkKWqMfCbJNzWjKBf+RRTcLSk7ztlxI8xjZNmePYHo1u7fIuKYSdBD
	XtiS8s7Lcv5gES3+2p82BgGmd3e+6FVC6UIPw1L88FfJfbPQs+pnZvWNgVd9cqjEKKo/CAr4iWh
	QLVPFnbxm35JdP15Yyg5oKokf9kF9JkZKX90tfanrg=
X-Received: by 2002:a05:690c:9:b0:79a:b3e2:6118 with SMTP id 00721157ae682-79ab3e26a46mr19622977b3.17.1774216896498;
        Sun, 22 Mar 2026 15:01:36 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90580d7csm47806237b3.37.2026.03.22.15.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 15:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 17:01:30 -0500
Message-Id: <DH9NEB6YPXX4.F1YBESHIB49E@gmail.com>
Cc: <dan.carpenter@linaro.org>, <ethantidmore06@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <luka.gejak@linux.dev>, <straube.linux@gmail.com>
Subject: Re: [PATCH v6] staging: rtl8723bs: remove commented-out code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Aadarsh Mandal" <aadarshmandal9354@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <20260322114853.11747-1-aadarshmandal9354@gmail.com>
In-Reply-To: <20260322114853.11747-1-aadarshmandal9354@gmail.com>

On Sun Mar 22, 2026 at 6:48 AM CDT, Aadarsh Mandal wrote:
> - Remove code that is not used anywhere in driver.

Probably remove unused code would be better. Also you don't need to put
a - at the start.

> ---
Your SOB needs to be above this first ---.

> v4:
>  - Remove extra space insertion.
>  - Delete remaining commented-out code.
> v3:
>  - Add the extra space that count as insertion.
>  - Remove unwanted addition.
> v2:
>  - Restore braces for standalone code blocks {}.
>  - Delete reindented commented-out code and extra space.
> v1:
>  - Reindented commented-out code;extra space remained.
> ---
>
> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
> ---

This patch is corrupted.

Thanks,

ET
