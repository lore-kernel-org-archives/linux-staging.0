Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D53AC0C3
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909615; cv=none; b=c38Kj/b0xN32rjzCt8E6h23X76IJ9HFIEC7jmvxPd7t8d8awg+6fcPALEip2+gcsP0dc6HTg+A3R+E8+sz8qTs9fLeVtMol3qze7gY7HshoZVXHKYiW3N/xbnEX4WqHkA52BkKPy+k/YFxjzZo3hSgfn4g2ynfyRKRAm3FJ88H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909615; c=relaxed/simple;
	bh=jdaI0MjR0gwclUt3ru2XkvtbMY0kBDWt6HlfnVDJtOU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:In-Reply-To:
	 From:To; b=BL8c+vtt4VkDsUoNYTG6Ft+uWU/+ZLrOuyFgXA0focyeQVMWU6diSkqyLfd3bKBDOvCUwOppNot9Yt3kZ6ucoVrrY/0cBWNRRqT1XpteVm+DPj01iIEuTsqlKQ/WiruSLVBY6Sk7Ak8ivc4pMj4cQbCpVIXwUVY942Q2ice7cXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zsu7THGD; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zsu7THGD"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773909611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=DskP2Gd3igkDrr9rV0f84qcle+A6Cs+L0URB679qeg4=;
	b=Zsu7THGDYSvaq7k+ButQVtgzioW4ykr3mMdPw1BoUfZgasK9g3ob9kjmN060M9yOBem0gn
	8uVf24rObGlKnR9JD4ILNUXuobkQwEm4Z4a0ECrP+3Onb5VFPdBu2jyHGnCjMXt/1JGGqb
	Y+8Vc/HVwIuy2ReefK3LUJPziZ4N+qU=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 09:39:57 +0100
Message-Id: <DH6MGYQKECQS.3R3HVA14O8AQ6@linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Luka
 Gejak" <luka.gejak@linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: Break long lines in rtw_sta_mgt.c
In-Reply-To: <20260319024807.7755-1-malavyaraval@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Malavya Raval" <malavyaraval@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Malavya,

Thanks for the patch!

I have a concern regarding the first hunk of this change:

> -	pstapriv->pallocated_stainfo_buf =3D vzalloc(sizeof(struct sta_info) * =
NUM_STA + 4);
> +	pstapriv->pallocated_stainfo_buf =3D vzalloc(sizeof(*pstapriv->pallocat=
ed_stainfo_buf) *
> +						    NUM_STA + 4);					   =20

You've changed the logic from taking the size of 'struct sta_info' to=20
the size of the dereferenced pointer=20
'*pstapriv->pallocated_stainfo_buf'.


Firstly: In this driver, 'pallocated_stainfo_buf' is a u8 pointer. This=20
means sizeof(*ptr) will return 1, whereas 'struct sta_info' is much=20
larger. This will lead to a significantly smaller memory allocation=20
than intended and cause a buffer overflow.

If you want to use the preferred 'sizeof(*ptr)' style, you should use=20
the pointer that actually represents the structure array, or stick to=20
the original 'struct sta_info' and just wrap the line.

Secondly: For a v2, when splitting the line, 'NUM_STA' should be=20
vertically aligned with the start of the 'sizeof' expression on the=20
line above. Right now, the indentation looks a bit off.

Also, for a v2, please ensure your subject line starts with a lowercase=20
letter after the prefix: "staging: rtl8723bs: break long lines..."

Best regards,
Luka Gejak
