Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC1A34CFD0
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776496255; cv=none; b=rX/gC2fcdaLtfQXO+ZK9RT4MM+pA4t6MrjWT72Gw3+hH4aHUUaVe6TRkz+Sr4XGdNi8/hTYNNftLOuX3zMHCfMHho6qMZCn5VzPrAWKTeY0FllLwZ+LcTFyjkKcPJcRJJ33rNbqaVTF1B8ygDuUtcL0z/4a4YF3JOiylQP2DRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776496255; c=relaxed/simple;
	bh=tdSAqqHshCNNqQXCUkj+tJa2ggIbIdaYcdfmm8njlyw=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=aDeF4JHQ7EoLlLHh8Y+nosOCa0UyfTAEgu8gkvo2YRtTIxLjYij2cwdlAzKs4eau4uwDenm9bmphAmvs3TcCXDLBIFRIfHIM3ax5u9aRmQFf+HYcnijqHTeSp/BsU0KhpUA9mdb2t1cjTk4HdPOdBBdFMDIPquyXOMYIM9DkNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e6yjT3aY; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e6yjT3aY"
Date: Sat, 18 Apr 2026 09:10:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776496251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=NKsJtyDJIedOwEeLNVJ2zpjDZqZsxX29oLG/CIl4KIw=;
	b=e6yjT3aYn9qoJmY43uIAr04TD7RUSo3F+5dqiMle2N+5Xv6Vdaq5RtUvlUfwZ6VGSrHW7Y
	XGJZkMbCtQEAPYm/WGEH0DgMIljzXWHIw09ZVppDfg+twqIGMvgHcBmLcZrlOj8IauXYJZ
	XjYL2qcIyiOImhiPms/FBHeqH8CefHc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: osdevhari@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_staging=3A_rtl8723bs=3A_remo?=
 =?US-ASCII?Q?ve_trailing_whitespace_in_rtw=5Fxmit=2Ec?=
In-Reply-To: <CA+TGEkHXoCfY0RhmKFnfLrnPO+dKwKXAnGu84RNsNcE0=MaGAQ@mail.gmail.com>
Message-ID: <6C4D65F4-8955-4B96-87A3-3FB25F5743EE@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Hi Osdevhari,
Let's start from the top of the email=2E Firstly attachments are not=20
allowed, only plaintext=2E Secondly Signed-off-by tag must use your real
name(Firstname Lastname <email>=2E Thirdly, you should setup git=20
send-email and use it to send patches=2E Now let's take a look at actual
code:

>ret =3D xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);

>- if (true =3D=3D ret) {
>+ if (ret) {
Here you did completely unrelated change to what your commit says=2E
>  ptxservq =3D rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8
>*)(&ac_index));
Also why break this line=2E
>
>  ptxservq->qcnt--;
>  phwxmits[ac_index]=2Eaccnt--;
>- } else {
>- }
>+ }
>  }
 Here you removed an else without readding it
> }

You didn't even do anything related to trailing whitespace, they=20
weren't even there=2E Also please don't do unrelated changes and stick=20
to atomic patch rule=2E Check Documentation/process for more=20
information on how to create and send patches=2E
Best regards,
Luka Gejak
