Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB04386562
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 20:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679577; cv=none; b=PI+cK93cZQ/rDk/26AM++KfwL3U/y0X+hom3Yi+GqP7QYUBBK/g+SLou2ISkZdsiXcF2iL8LLp4jarAjMudndSyOf5+K4AvOlUvIgvDp3lyYHx84l3v6f/7ty7Sl21m0UqWgKRwjKosZy+BHi/u5v9TcqqOFV+hlDf4/8Z1BnvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679577; c=relaxed/simple;
	bh=+rXHiYOEDHgcYZSUH9gpFOIq8At4FBblpQP1kpVQ8AI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JmEaX6SyEaKLQyEIOExpIfVxV36xjbT0faHZb3X66tn2korruIGjmc/23MJOEzrOLrapxlRh3cCImHWShh9KQlvV7Dlx6EcfjN/pO3/m0WaA2ttTPnEdMUvIMneY25R2CBd+QZWG1uR8Io/uStngDgvxbYKrZRFQOSgU5Sp7HVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IU32XA9W; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IU32XA9W"
Date: Wed, 08 Apr 2026 22:19:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775679568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rXHiYOEDHgcYZSUH9gpFOIq8At4FBblpQP1kpVQ8AI=;
	b=IU32XA9WFVsmZ5qXGZqZ/irrOSOVvF0Oz0aWnMf6ZAnfGyGTLQRNvoE5UxqLRaN3KLoUUU
	gn6uOB2wRXVGc0n7II9HcU0w5XDoVUORLyNuiixY0G4Y+lxkFNx7LYhJWE7B8kPFbHQgCK
	XcIdIBL/uc/ttzqx1erjTBZg3YsImx8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Prithvi <activprithvi@gmail.com>, ethantidmore06@gmail.com
CC: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com, b9788213@gmail.com,
 straube.linux@gmail.com, andriy.shevchenko@linux.intel.com,
 dan.carpenter@linaro.org, weibu@redadmin.org, knavaneeth786@gmail.com,
 ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFT_PATCH_v3_0/5=5D_staging=3A_rtl8723bs=3A?=
 =?US-ASCII?Q?_Code_cleanup_in_drivers/staging/rtl8723bs?=
In-Reply-To: <20260408195940.m2nz4xaz6vdquda5@inspiron>
References: <20260405114132.310774-1-activprithvi@gmail.com> <20260408195940.m2nz4xaz6vdquda5@inspiron>
Message-ID: <1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev>
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

On April 8, 2026 9:59:40 PM GMT+02:00, Prithvi <activprithvi@gmail=2Ecom> w=
rote:
>Hi Ethan and Luka,=20
>
>Thanks for taking time to apply this patch series to staging-next; I=20
>apologize for it not being possible to apply this patch series=2E I just=
=20
>realised that I mistakenly was working on mainline kernel's staging=20
>directory rather than staging tree - probably thats the issue here=2E=2E=
=2Emy=20
>bad
>
>I will send a v4 patch series to rectify this issue=2E=20
>
>Thanks,=20
>Prithvi

Hi Prithvi,
That's kind of what we were implying by saying, "not applying to=20
staging-next", but don't worry it's all part of the learning process=2E=20
Please rebase on top of staging-next and integrate all mentioned=20
changes in v4=2E
Best regards,
Luka Gejak
