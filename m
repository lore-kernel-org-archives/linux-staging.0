Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAE0310624
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 22:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770676904; cv=none; b=TdqTnOSSRjqzGb7Vw3LX3WrIsRZFetEJ/rkxOONarSgiLhS0l6BSc2Nsa0wN6DWqkc9hwSPfp/PO3gQf17nJcD1zYiR7GVijU+0OC2Ak8Xz2wY6InvWjwjp6JdEWgUBKx2ajDLow12zNVuy39EN9B0ai1z/6ZvTigjWpHgfucxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770676904; c=relaxed/simple;
	bh=XSSN8+r2S32xLTZWM5vpCFx3kgJKWGZTmaBIpLcqXM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=CtxHh2cL1cN3N7E9oMnZ+XWIFCnygnbbVk1URWynwfDWNtpYt1Utkh3siYdBCdpyZ+24mMI8pkigU+eKF9M0HqjqZ22cf/irIPYpfCWROZueZSDOcSTwgGlxSfYSQY0sDhgCJI9WjUAW5c/6AMX3JmJHu9w07biHAkI2LtaFX6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLDWuZd4; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLDWuZd4"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-649e97f1e1eso4037192d50.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 14:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770676899; x=1771281699; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSSN8+r2S32xLTZWM5vpCFx3kgJKWGZTmaBIpLcqXM8=;
        b=FLDWuZd4/3FMziXuWXoI028fSWygCdaNc7FFLDfJnz992ghHa7MEaXO7mEQW/rzsnd
         QoBeuuzHXn0onRWDNTZZktXkQ4DCxlQMS/ulxqYGqurlWc9KOCNQ4THPTTo4K1grMthy
         CRh5v3bRKRlZMe+/bVxIVmQSW/O/EHAHSL4CpmR+aMF1WJLUW989gA1+7GWb8LGYlo2E
         ksDauiYwCx3ZLmE0lOh0jUAQTCC35GAd5dd79P62AFvqRIKKS9qcXTiGlCs31XlFPA0G
         h8NNktTeT51NmEajD/nm7aa1C1F7qhtCA37teZ3qgFhwfocZgc7KDStFQqn7Gzxvv0/o
         0Tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676899; x=1771281699;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XSSN8+r2S32xLTZWM5vpCFx3kgJKWGZTmaBIpLcqXM8=;
        b=q4fNqx0jjgTOeXoHxh4VeMjYv3ov4/m9Kq1kkZew6uGZIhVfDbQbPaUb+iMEFk6D2+
         3YqocyCRVg+VyPk0tXKiEwYWrjM4awmfk7+2Jh6EPhqC7MGzH47qtThWFkzLCeq015xv
         bFc/vECtcXTU3sYQmtGYXr7bV+fIV8U63umwjHiA5ewS04VGRft2F/evcABkb0NzbaWZ
         qJYkImbPk9JVg7pzBhzgbm3fQ2Clr5NBe06tPTxA0/3a8sJUIEbUsowKv6Spv2oLhCWm
         xBMk6MZrGu7IUMD5c3yr6CCWYy0cKKBxUGxSiB2G/Ol7HwG8TczX/QpZBYDPo7d7TH6A
         bQxg==
X-Forwarded-Encrypted: i=1; AJvYcCVMME/ETSAkZ9uZGGSfyhevLDsNBv2CQXHsU9iLhnAUiFIRtreTxlmTZiiBkYr8xatmHt7iav7szMrjIZ4T@lists.linux.dev
X-Gm-Message-State: AOJu0Yw50UFFZjyPIz9Q8NN/ppN/wLOjbFyTtS6PgMhLn7zx8GEuYDd2
	Zwm5pvH2/7QKFe6aD2HpLnwLc40/5W+WpTEwPRKNe1WmXC+T+FLOe0p4
X-Gm-Gg: AZuq6aJhC/DXP+OWv7lG1z4mIMJSMCc6AXRuJFzgvX2VuYcF9FFf2sFJNFW+3UXnOCG
	f1aWNqYUGEKaft0SVstdSbW37ubMShuQri0+dwi/sRm+iYDqlBADGqUs9KJQuImkUuBUhcECL0s
	vE2BmP2u5re5V9p5IDj3UU+AXMYa+klFWWgV9GiANWGK0I9i4kl0DV0ja/SPl3qWgUjwqg+6gis
	vwLg0uhlO1uh+qfmjTb/LTEO+eoMx+FRMbzTczGyTM5zHjIIWHmDGkrFLr0dQ1qx121/jSCV6Iy
	2wtpdXPNtCCAXJd9Crth+zVz4KqFm76fEf07/xbiJg9JnmlpVaq2N/xsL1q2kXKOStS2BlhPMQD
	2Tpp53AJcG6QiGQ6M5Z0Knj+4uYExOBX+tB0Y/tHoJSZ+Mjl7csoGUvofgLChXCN1yPJ053g9oJ
	YdjnAx8VEb9IpI0CSCSS2fEJ6fApAciRb3npCeveS/NXDSdWDSw22MbIdYJbbcJz6WPHwbG/oLS
	t/mbvYaREYZ1YNntxxIwK4Pk4JWr0I=
X-Received: by 2002:a05:690e:138d:b0:649:4896:be37 with SMTP id 956f58d0204a3-64af21b254dmr140831d50.67.1770676899163;
        Mon, 09 Feb 2026 14:41:39 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64aced0d603sm10164986d50.16.2026.02.09.14.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 14:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 16:41:23 -0600
Message-Id: <DGASKIRH7WPK.8169S09AJKYV@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Siwanan Bungtong" <horstaufmental@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <arthur.stupa@gmail.com>, <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: wrap long comments to 100 columns
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260209032230.190259-1-horstaufmental@gmail.com>
In-Reply-To: <20260209032230.190259-1-horstaufmental@gmail.com>

On Sun Feb 8, 2026 at 9:22 PM CST, Siwanan Bungtong wrote:
> Wrap long comments to comply with kernel coding
> style and avoid checkpatch warnings.
>
> Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
