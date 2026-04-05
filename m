Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B053368AA
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 12:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775393730; cv=none; b=Ev4dC6y47tGzvIYeTUFQk9GrrWZrLdePDXyHLpijzrRq0LpjRpyP7Q59A0gXcsQihGMppOrwBl29kqAHbVHDMO7OHJYJucYnnNW/Z6gIKKX2TvQ2bam3fnPkQtUQ/ws4drzSSqV3hAtkt9lNQltNxN0Dv5DX31U0pIvT2L+oFb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775393730; c=relaxed/simple;
	bh=20hd+ule1L2NoXQ8f2J+WtzptOOf1DdymkhvmpVArj8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HgxV69bMuGTrE7iRyoVSJHcr5y6XAP037ZzMFCQ6nZy/KjL/hKWJB+ULoqfHrK8iW5x91RCZr0i3Ii7BwyevxspN8n05Wldjwu22Rc0sbuvF51Y07mLzgXiL707YoLMESoAmeIQjlhEVSzIfD9WlC5svVUYirLN9W4IUBxY+RuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ik1OONOZ; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ik1OONOZ"
Date: Sun, 05 Apr 2026 14:55:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775393727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDrWKuXdsZX+WhkM/05L4z/5CeMfPkOlZ7D0s6RWfFs=;
	b=Ik1OONOZcZwVqfCck/KO7X3OsjDPCgtSGY5Y3CaK5LO1KfTXPqzsxowxmeiEX3FVotF1my
	0TvwYsW6lKAEqpM1g35l0QlNPBeqcw45+5pS0kv+JSj47P0MGZF4UnjFxe4Bgn+jf8h1NU
	2iOxguK5S38mNmJhzZetWeY21HLCyls=
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
Subject: =?US-ASCII?Q?Re=3A_=5BRFT_PATCH_v3_4/5=5D_staging=3A_rtl8723bs=3A_use_?=
 =?US-ASCII?Q?read=5Fpoll=5Ftimeout=5Fatomic?=
 =?US-ASCII?Q?_in_=5Fis=5Ffw=5Fread=5Fcmd=5Fdown?=
In-Reply-To: <20260405114132.310774-5-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com> <20260405114132.310774-5-activprithvi@gmail.com>
Message-ID: <E90CF5E9-69ED-4869-A707-DE93F2D18FAD@linux.dev>
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

On April 5, 2026 1:41:31 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gmai=
l=2Ecom> wrote:
>Replace the existing rtw_read8() and do-while loop mechanism with
>read_poll_timeout_atomic() from <linux/iopoll=2Eh>, in _is_fw_read_cmd_do=
wn()
>which is a standard Linux macro, ensuring polling REG_HMETFR efficiently=
=2E
>
>Signed-off-by: Prithvi Tambewagh <activprithvi@gmail=2Ecom>
>---
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd=2Ec | 18 +++++++-----------
> 1 file changed, 7 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd=2Ec b/drivers/sta=
ging/rtl8723bs/hal/rtl8723b_cmd=2Ec
>index af6cdda8238d=2E=2E17e135cd3e0e 100644
>--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd=2Ec
>@@ -8,6 +8,7 @@
> #include <drv_types=2Eh>
> #include <rtl8723b_hal=2Eh>
> #include <linux/etherdevice=2Eh>
>+#include <linux/iopoll=2Eh>
> #include "hal_com_h2c=2Eh"
>=20
> #define MAX_H2C_BOX_NUMS	4
>@@ -18,20 +19,15 @@
>=20
> static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
> {
>-	u8 read_down =3D false;
>-	int retry_cnts =3D 100;
>-
> 	u8 valid;
>+	int ret;
>=20
>-	do {
>-		valid =3D rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
>-		if (0 =3D=3D valid) {
>-			read_down =3D true;
>-		}
>-	} while ((!read_down) && (retry_cnts--));
>-
>-	return read_down;
>+	ret =3D read_poll_timeout_atomic(rtw_read8,
>+				       valid, !(valid & BIT(msgbox_num)),
>+				       0, 500, false,
>+				       padapter, REG_HMETFR);
>=20
>+	return !ret;
> }
>=20
>=20

LGTM,
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
