Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436EB3375C5
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775393677; cv=none; b=R3ltB0RdCl5oBJtKUsE260kllYXxt+N8aWCzVaF82+yTV+NEbPUfo+Xouaz37SXjZorH8CeFgrGa9WrqehP6qUaSZxStzet8QblCKt+C7wm3KcGmpLIhyONpvpmcFTx/qn3oqbvllpsUV4tqDFVYpLRghUZCNocSpQqCphQu3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775393677; c=relaxed/simple;
	bh=VyZf2lboGr0OX1ynodyiMVByY2rCtFwyJOWQ/0OA4Uk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pLcbl3L0H5gLfYhHtiLMWeJf2D9cZTPTUXZGlXCsKtJyNKC77mXy203874/0kl+49SLFtOcPjaEqkq8XcNKtTKaIusXBW55sZpCJ9Kz+3DnBzVGWOutKrJpkHPHHsKGcDgXZOqLzEuaiyk1VD15PuP9saju5+UdJbdojHkINVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L97flZu/; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L97flZu/"
Date: Sun, 05 Apr 2026 14:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775393674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDgdRQrXAdLxaN7ikAq5H5IMD04hrOTLiLpaZxTklU8=;
	b=L97flZu/ps6biGG0xBsfRFrJhkQ67Oa+NZBgiVpoISdHtZk3CBtw/gGStjIrCoU0EuQP9n
	JiyEtCPdG7Wl+kBOH6jrwXKInIGa55sc6vcmkek+aVvezCuWz1jfVYPpzAM+WsDMCvVuuy
	agUa+r3eVNy9t6czg/onwmtMpsw07TA=
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
Subject: =?US-ASCII?Q?Re=3A_=5BRFT_PATCH_v3_3/5=5D_staging=3A_rtl8723bs=3A_?=
 =?US-ASCII?Q?simplify_boolean_return_in_IsFrameTypeCtrl=28=29?=
In-Reply-To: <20260405114132.310774-4-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com> <20260405114132.310774-4-activprithvi@gmail.com>
Message-ID: <02440596-66ED-41A3-B981-80C6D00603A2@linux.dev>
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

On April 5, 2026 1:41:30 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gmai=
l=2Ecom> wrote:
>Replace the simple if-else statement which checked value of
>GetFrameType(pframe), if equal to WIFI_CTRL_TYPE, function
>IsFrameTypeCtrl() returned true else false, with a single return
>statement returning true only if GetFrameType(pframe) =3D=3D WIFI_CTRL_TY=
PE
>otherwise returns false=2E
>
>Signed-off-by: Prithvi Tambewagh <activprithvi@gmail=2Ecom>
>---
> drivers/staging/rtl8723bs/include/wifi=2Eh | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/include/wifi=2Eh b/drivers/staging=
/rtl8723bs/include/wifi=2Eh
>index 230b2c4ffd3b=2E=2E2876f15f13d1 100644
>--- a/drivers/staging/rtl8723bs/include/wifi=2Eh
>+++ b/drivers/staging/rtl8723bs/include/wifi=2Eh
>@@ -275,10 +275,7 @@ static inline unsigned char *get_hdr_bssid(unsigned =
char *pframe)
>=20
> static inline int IsFrameTypeCtrl(unsigned char *pframe)
> {
>-	if (WIFI_CTRL_TYPE =3D=3D GetFrameType(pframe))
>-		return true;
>-	else
>-		return false;
>+	return GetFrameType(pframe) =3D=3D WIFI_CTRL_TYPE;
> }
> /*----------------------------------------------------------------------=
-------
> 			Below is for the security related definition

LGTM,
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
