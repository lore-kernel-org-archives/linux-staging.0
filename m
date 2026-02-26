Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433563DA7F3
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120900; cv=none; b=riId23PWUBIMC15QlAil6LOnc/nbZ0ILMSBYCzqH4dEKNRrdpxTLqqziwQ1n50K8SjLSph6AeZgCFFRwPcT6fTR5uEqwJ+bzDC2CCxSQTAAiraqDEOMCxRxFqUpkMTo/9bo5zGdmR7bHRIC+ef4w9CM290iHTi2Z/ESFK3p7/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120900; c=relaxed/simple;
	bh=tUG8dAkOJX/RQt3CRcpNyEXhFnsBK3PhFV6rDaNUJs8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Qas1rFhKmZHEiD3OdOF0+Ch5UDsMC5hPTKBx7PI0mLdhcAZSKLjiyal6hrU7D9uFGrpw97rnTa7EJtnwQez/b8g6s9eivNZFy8ORuf8c3YJzael4Qt7VeCqiQ/w503bVgl48Ot2JRLLFo0fsbL9fX87jrK7qmfKsjwt+/RHqUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ44ecJ6; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ44ecJ6"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7947cf097c1so9799987b3.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772120895; x=1772725695; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCBVo6DOmDS8gGXnXTZG223c8M4LJ2IU3qPLjLLtMV8=;
        b=cQ44ecJ68cpY05hBWx8H5cfBx2WjPNyMoUhw1mP0YulmkwV5OporH4Y6F3fdnUvSUt
         vUNMlDi1imArAfvKB588QPz23VkJKk0CBSQkEKUOTPPAuG2vjTwN3OZP+4nSp8icq4vd
         t1SgK7y3O6FPyrB6uXLNfvHrTEinmxlDHiY5lkfFs9dBryW7u7zkKsnoe8+wYcEwoAu1
         UuuG5eS3P1dlzdczPFhLfwaW+ad+DUtyH0TqpaAweza/oX6B4vcbbZYKD225i4xW9/5y
         SvFpBjOvoqZjLFt0FnGYO7IgT9U0CrS3AyMOlUxqgNu/TlJqHbEkR7lFEXeMclPqSBFh
         hosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120895; x=1772725695;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCBVo6DOmDS8gGXnXTZG223c8M4LJ2IU3qPLjLLtMV8=;
        b=t0YNVOTUjl0I87wSDbYc1chWSVhulDw+Mx6jHgAs7d/FiGCuksUQGRRrjLigbQP39S
         rjRxXCl0OymMqfdxNyKVi+gOE75P4N002Ndb35qfEAgTEeNuMLm+jD1VpXZAKADylNNM
         UjjpQR4QyUdPuxxXJC2cj1SliCezrfwkaShpnwhuqP7tvnMMqoad9AMGbhovnpxm9hs6
         WUEYZS9mavkVESSpCT77oEmaY9xMVU1kprXej5xnJxVronbn+r6GhAYR4OTmuKt7FG3z
         7TyBVwOoPqFENq5jQio7KsNS+osIyGuqVAwpDta0GRtHg44Rt8aA8FWDGpp3g865DL+A
         jnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXekvdfvlbOMkNbWxlVtaLLMwr+hinx2yGjVrr7YpxuR8+0k/SQRGT8l+yBEHIbbrMu1/+kT9FaouGZeNfz@lists.linux.dev
X-Gm-Message-State: AOJu0YymCDMrNI0Y52UssSlgBGuzag16zUHUKN/DVxnzdeFlQx3WGWng
	laEczq3pLn/+zmOIFixkobEqF0pdKsbvJvIGMB+8Yc7v7wi7UK+BZo+n
X-Gm-Gg: ATEYQzygbjtchnBJCkcFebLsP/yUb8bggp583SsllTpJXT1JeO3lovccZGWVLjkubhC
	pcSEobM5A85l3irwOC6dCHwyKWOOiT+IIrk1HRjRyFlXvb6lKubNw2RkTKyIu1HZTMpvGZWZiM8
	ouH/qKygiCyYQgQI1xCZqO2H9cVIevb4Gldksdz1cBQgeiZExRR3HQd0gNXQD9H/Cjz2i8r2jHB
	eMmCPtxQN976fmW+exyr/EuPWVLW6oUsUYJ3ZjKzyz/uH/UHBCgivnw+VrRAvjVsiV2ABE6orFN
	jf0A2k3sxwKPp2wifigoqaAfahVFY9lhtGSnug4cH8PsWlHIBFLc5EqQ8lGeEy6187JvLsLqahv
	MuAfyA+nNRt3ao657OVFTgJRppb016uXPLhWtyQcXJB8hbILBx3Gz7em5tQsajq5bAOwJztv1IM
	wX4oS+VEifkiZZAnuv7VdI/n4Jaiv24CcvDyaSOGDq+8xmyYV9FOUJRZE+sFshV98S2oOM6DU+M
	mxx2gEWfdtXFrq2VByxtCzNv1mH1fTi
X-Received: by 2002:a05:690c:38b:b0:794:cf56:5bc1 with SMTP id 00721157ae682-7986fe23c47mr41622747b3.33.1772120894841;
        Thu, 26 Feb 2026 07:48:14 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a8feacsm10202197b3.11.2026.02.26.07.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 07:48:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 09:47:57 -0600
Message-Id: <DGP0F87MHPIS.1IE1IQAR5Z8QB@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <ethantidmore06@gmail.com>, <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused 'ratelen' parameter
 from rtw_check_network_type()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226141333.9909-1-nikolayof23@gmail.com>
In-Reply-To: <20260226141333.9909-1-nikolayof23@gmail.com>

On Thu Feb 26, 2026 at 8:10 AM CST, Nikolay Kulikov wrote:
> The rtw_check_network_type() function takes a 'ratelen' parameter, but
> does not use it in any way. Also remove the local variable in rtw_ap.c
> created just to pass a value to this unused parameter.
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---

...


> @@ -890,7 +887,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u=
8 *pbuf,  int len)
>  		support_rate_num +=3D ie_len;
>  	}
> =20
> -	network_type =3D rtw_check_network_type(support_rate, support_rate_num,=
 channel);
> +	network_type =3D rtw_check_network_type(support_rate, channel);

I think you can delete support_rate_num in this function too.

Thanks,

ET
