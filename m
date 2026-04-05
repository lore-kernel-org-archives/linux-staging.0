Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC92BEC2A
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775393635; cv=none; b=BBN4nueJEWtBMkRuitT3TUItukVZpWzrTBmb/lRltc5oCvAOj4/C9V5iVxKeVBc/yplLvkh/D+nC62nFV6H6OP6h2THd/lSeIC11kVcxYdR+v1nWD2YXCxwrtRrPmmk39lzrRrYq58lxxoQuDzGvAFgu65jZ+jrzvXHS9ban+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775393635; c=relaxed/simple;
	bh=FXtsjt7dWhXUnpsoqT5myzGx9hhPVSZWzaVsMz5brkE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YTrZGT/A3dXFq7kZXXwYYlDt25ykEDOP6ag2vHGT5v8/vmmfFWjCf3ZabPMebtFYIB7IMcVjfg4l130jkKsAc9ljJCnqVFGbDJ59pJTPOL3FEhAa8FexofQP2BFTchRFJYc0STzTmnXKbUUdHdlPrV3gmRqykt4A+zn3KXSR6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qc8LwoxQ; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qc8LwoxQ"
Date: Sun, 05 Apr 2026 14:53:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775393631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=URgQjwRDWVuMfsePESGqmFJnuHtmxXLi14maz2SiNtM=;
	b=qc8LwoxQ2vfVCdhhDfYYF965Sh35EDhzeWHsnQIGreW7nktgHRx3p6DeMD1+3NJgCw9mYG
	k5BHMMEOb/IoPfBIUE+vujS6F+gRUpPWo3aa46nX5lMs3LjIhLMIogPH3g2dchouvXVlyN
	i5N4bwoyG70oALozvGGLkZQwk9TGyAc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Prithvi Tambewagh <activprithvi@gmail.com>, gregkh@linuxfoundation.org,
 abrahamadekunle50@gmail.com, b9788213@gmail.com, straube.linux@gmail.com,
 ethantidmore06@gmail.com, andriy.shevchenko@linux.intel.com,
 dan.carpenter@linaro.org, weibu@redadmin.org, knavaneeth786@gmail.com,
 ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFT_PATCH_v3_2/5=5D_staging=3A_rtl87?=
 =?US-ASCII?Q?23bs=3A_remove_empty_if_statement_block?=
In-Reply-To: <20260405114132.310774-3-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com> <20260405114132.310774-3-activprithvi@gmail.com>
Message-ID: <772A2512-E903-41A9-8561-69E371E16729@linux.dev>
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

On April 5, 2026 1:41:29 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gmai=
l=2Ecom> wrote:
>Remove empty if statement block for cleaning up code=2E
>
>Signed-off-by: Prithvi Tambewagh <activprithvi@gmail=2Ecom>
>---
> drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec b/drivers/s=
taging/rtl8723bs/hal/HalPhyRf_8723B=2Ec
>index 9e7eebfc02a9=2E=2E61b35173aa4f 100644
>--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec
>@@ -1425,9 +1425,6 @@ static void phy_IQCalibrate_8723B(
> 		}
> 	}
>=20
>-	if (0x00 =3D=3D PathAOK) {
>-	}
>-
> /* path B IQK */
> 	if (is2T) {
>=20

LGTM,
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
