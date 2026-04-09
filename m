Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774F2346E55
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743861; cv=none; b=UVaHf7Vhd2pfqEcbxKxFMxowb1zoNgqXu7Tv9qVp4GfPiObFfLp0SLIrNOtja58ykclxtsepA5DBfUsIkl8qgefsVKiN7cHHhEr0KyqW/NaY68CBv26PHyJqJPgA8dxbDYaEO79e4GoapG311jZwtZDXzr5jz84/gNpYHZaPibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743861; c=relaxed/simple;
	bh=pvAJ8ElMBzJQh7OQeb6nrwfSUeZFJ/rJkhzMWdNIGqk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dTTr2fLcIwaqdcsfSRrar9fb8rbCq2I6GWgsBi82cwga6UT2//HEETCBjYJub9zhpDJ9p7JZ1hY6gEYRdwjnZLaWMKWI+YioAM6wd6g9fS/b62Y0CtRwsEfjjuGiiC++UBdvIhyTjs4n7j/PckzLG8XY1845/UG79pAfIASenjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bMXp+oSM; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bMXp+oSM"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775743854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g4Ts08G5NX4pOxKQZXfteSHOTwA9ZdFUzMZdVghQmvU=;
	b=bMXp+oSMwJYK+jvaG/ag6klETpsih/QgvZsNuT/T1J6O4t//V05ld3rND1uLkArRsh/s7x
	44kdSLCPr2C99/XPLIYt05CIw9YKaF/0Nnhk9LcRfo77+CGNs/p+x9DuGz4ULTs5WR2R1t
	q9WrhL8qleqxfATc6aGYRCPT5u7pn/o=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 16:10:48 +0200
Message-Id: <DHOONQEVPJFK.3M1OMNX0JDR5B@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [PATCH v4 4/5] staging: rtl8723bs: use read_poll_timeout_atomic
 in _is_fw_read_cmd_down
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Prithvi Tambewagh" <activprithvi@gmail.com>,
 <gregkh@linuxfoundation.org>, <abrahamadekunle50@gmail.com>,
 <b9788213@gmail.com>, <straube.linux@gmail.com>, <tmimiharoen@gmail.com>,
 <filippo.muschera@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <rayfraytech@gmail.com>,
 <david@cardinalsystem.net>, <weibu@redadmin.org>,
 <dharanitharan725@gmail.com>, <ignacio.pena87@gmail.com>,
 <dan.carpenter@linaro.org>, <karanja99erick@gmail.com>,
 <luka.gejak@linux.dev>, <khushalchitturi@gmail.com>, <suunj1331@gmail.com>,
 <s9430939@naver.com>, <nikolayof23@gmail.com>,
 <bryant.boatright@proton.me>, <ysinghcin@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <20260409135026.137904-5-activprithvi@gmail.com>
In-Reply-To: <20260409135026.137904-5-activprithvi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> Replace the existing rtw_read8() and do-while loop mechanism with
> read_poll_timeout_atomic() from <linux/iopoll.h>, in _is_fw_read_cmd_down=
()
> which is a standard Linux macro, ensuring polling REG_HMETFR efficiently.
>
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/stagi=
ng/rtl8723bs/hal/rtl8723b_cmd.c
> index 12416e499ac3..4bdc8e314015 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -8,6 +8,7 @@
>  #include <drv_types.h>
>  #include <rtl8723b_hal.h>
>  #include <linux/etherdevice.h>
> +#include <linux/iopoll.h>
>  #include "hal_com_h2c.h"
> =20
>  #define MAX_H2C_BOX_NUMS	4
> @@ -18,20 +19,15 @@
> =20
>  static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
>  {
> -	u8 read_down =3D false;
> -	int retry_cnts =3D 100;
> -
>  	u8 valid;
> +	int ret;
> =20
> -	do {
> -		valid =3D rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
> -		if (0 =3D=3D valid) {
> -			read_down =3D true;
> -		}
> -	} while ((!read_down) && (retry_cnts--));
> -
> -	return read_down;
> +	ret =3D read_poll_timeout_atomic(rtw_read8,
> +				       valid, !(valid & BIT(msgbox_num)),
> +				       0, 500, false,
> +				       padapter, REG_HMETFR);
> =20
> +	return !ret;
>  }
> =20
> =20

LGTM.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
