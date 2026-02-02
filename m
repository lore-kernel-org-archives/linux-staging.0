Received: from outbound.ci.icloud.com (ci-2005c-snip4-11.eps.apple.com [57.103.89.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DC730F7E0
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.89.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016104; cv=none; b=atH8XZUgIOMTjSyTz5P8AG27j5DNR8KBaDY3rYuAX+Is0luU5aiHO4W01Lbkx/10OsvoZDvxOY0Sk76ltu9qmdXnaU8+XvSz4/72kpZlG0Yl7hizBFNF2HG1rYzwHHAufPa8BJhKrxrQXZOKo4Z639qX59N/rnfgkhqYtMwuxsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016104; c=relaxed/simple;
	bh=1P+Zg8Fo1GwA4xBa8sLrvHE28pJBcMrE9m/3meNi1uI=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=XaDI0hA+JZlUARdBdfMBjw6X2FePVNuKSH0B4s0+K2Jkx/f7QqEmhJOly9fIZNLLFEAd07OYYHDi+Gr6B2s2xqrPo4LAxrNSD1nP1dNTyN4+gGCWkmxbPALGm3bMD7mZ0yoEzVKwD2BQFeY1NG/02ADuxp+IW/Xi3GuKOmml5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=r1v92eh6; arc=none smtp.client-ip=57.103.89.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="r1v92eh6"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-13 (Postfix) with ESMTPS id 1D6871800255;
	Mon,  2 Feb 2026 07:08:15 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1770016098; x=1772608098; bh=rMx4ypA6C54tRe7WPiErGUobyfzZydmiWKr9A436TsU=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=r1v92eh67yqKos2bvJcTbroTu2TueszjoiaTO22ZLgsgcg57FeFk2ZjH5kPH+QB7jf8C5LYkxgpFIglutg6Ui/CGDMdRcwiQawKlq2pMyqbvJLGEv6GG94+uNhACxOQoaBfgmGZ1FUhY2mXtsS7LbacqhtbDk7w9qIbd+sY30fSBoFoAWrEJDb44mXorfOeywTzsv/SgcyTQ5lqXbG/pVPbbBx6apVhZgawe3UCqFlXuKL72G35gF2jO9uuP0nxkmtc8uTpejTqPKsj9avCYjHMl57+gqf/ZM13gXDifHeMwsj7T1Hsr/pun7vL9VJU6xxeAtMmBbDRPaOZ7zAbukQ==
Received: from smtpclient.apple (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-13 (Postfix) with ESMTPSA id 18C4E18000AB;
	Mon,  2 Feb 2026 07:08:15 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "M.samet Duman" <dumanmehmetsamet@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] staging: rtl8723bs: fix whitespace issues in hal_com.c
Date: Mon, 2 Feb 2026 10:08:02 +0300
Message-Id: <96821010-58B3-49FD-865F-E9F420E4699A@icloud.com>
References: <20260202021845.265051-1-skyline@noreply.codeberg.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 =?utf-8?Q?"=C3=96._Efe_D."?= <skyline@noreply.codeberg.org>,
 =?utf-8?Q?=C3=96ner_Efe_Dasg=C3=BCney?= <efedasguney@protonmail.com>
In-Reply-To: <20260202021845.265051-1-skyline@noreply.codeberg.org>
To: =?utf-8?Q?"=C3=96._Efe_D."?= <skylinesytbe@gmail.com>
X-Mailer: iPhone Mail (23C55)
X-Proofpoint-GUID: FL-eS7_Odda060CCEsC1IHljQZCHnjEz
X-Authority-Info-Out: v=2.4 cv=DPGCIiNb c=1 sm=1 tr=0 ts=69804d60
 cx=c_apl:c_apl_out:c_pps a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=x7bEGLp0ZPQA:10 a=aRhIMoA-k8UA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=L1lHFKR5AAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8
 a=kytAxuxsAp6RXE_V3ioA:9 a=QEXdDO2ut3YA:10 a=g6nvcUJ1dLNwJD2y3AQe:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MCBTYWx0ZWRfX4npQCZG3nHjr
 dqN+q1S/OWMCEtaZYhgdUSUJdTjOzzohprxhtS+Vu3KXpgPkMmR3qhJrN+enjmMX/MVYW6KbfGi
 uV+r/Cho70fh/bA4JpmhxoCO7RJe6VNxMsgZYvQyMpWUvRa1IWD8mGuicsQo9TSxKNBpjfUxE00
 zvR7Ag63g05E0azdSSWDrHLUkndPaQ5YHevLc6FqP2rBnYShN2vf6hkMjmghxFTH0823qN9yyaA
 6BstoXwos2VDGskp7YA19tulQ2C/Dxtpjxxd0/Os/tLDOjUWCoVxpESHm3v+cnz273zBiHdUP7z
 kOC2T79lmMO63C0roAo5RgHgOmIqfStvrSpvWqThTBetyICLi0gvEhEwiSm4FU=
X-Proofpoint-ORIG-GUID: FL-eS7_Odda060CCEsC1IHljQZCHnjEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 clxscore=1011 bulkscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020060
X-JNJ: AAAAAAABPcj07bg0uBcskqk09ze4TesnbwPR9AxE4g9qAgut9AGHC+tEm97gXNM87Phix7sTvdXgW5+2/5YcsqpmDCxkQjJRF5GfTz+rI1NI+eoLgZjmpifx1gsPi8uy8mJhgtrW4FwJdl2F1Za56GcF6Shz7rujYbYskHlt9f62x2529MN9k6DOplL//GuzXhM80VLqwVlVIcvP+EYsHAKvcBjFuT8LbBOi0nD5zEB4Q7Aukwtfbmzu98PJ+PgxMGOKMyIxOaqS5yz3e3GppQ6swFGswK+R3ONQJWgHgfqWGQhW2kM0tdEzLvS0D5atCED6jDOksWXtFnv3am7nS99CqAQFMdi2V1/qfY5C82O61O7O0v65RQm8E8ho1GgIn1b2xOHrc3ct6rSUV2x6CTC6hluiqav/17dCreTiZnnnGrxatHMh97k5/hI72k8NQrByCnUawjcru8z2g9Ka+kBVvHwFtxg+TGk5LStHjTdU5mVEJgxc3/R/N2DSpj/7VaM4DezUQeuaUAzPtojUW7LbIp85RcnkWIJ02sKr0Hk0e6nBkOLRX+XuYNqp13Qiv6tgsPs4OFLrsA+co5NgZscg9gq9Ft8nAuy+SXNzxzGB2Jxmv5wQtfRs1Ze8Lh0kRzA9WNAOi50do5IoEWIhQPknIPuRS5h70pwjWwmQ5aivxn2GMbCnjC53Rn5iOfAJT5WO3lMfJfCK4sFEwSlCRiQYMgFb9MwNl24cmR9C8Crhv9DDAe55TfOgJne51A==

Hello =C3=96mer,

I wanted to share a brief observation regarding the patch titled:

=E2=80=9CRemove spaces before tabs in comments to fix checkpatch warnings=E2=
=80=9D

Looking at the diff, the change is limited to whitespace alignment inside co=
mments. There is no functional change, no meaningful impact on readability, a=
nd no effect on build or runtime behavior.

Given that scope, describing the change as a =E2=80=9Cfix=E2=80=9D feels sli=
ghtly misleading. =46rom a reader=E2=80=99s point of view, this appears clos=
er to a cosmetic or comment cleanup driven by checkpatch preferences rather t=
han a fix addressing an actual issue.

This is not to say the change is invalid, but clearer framing would help set=
 expectations when scanning patches on the list and later when looking at hi=
story or blame output.

Thanks for sharing the patch.

> 2026. 2. 2. =EC=98=A4=EC=A0=84 5:19, =C3=96. Efe D. <skylinesytbe@gmail.co=
m> =EC=9E=91=EC=84=B1:
>=20
> =EF=BB=BFRemove spaces before tabs in comments to fix checkpatch warnings:=

> "please, no space before tabs"
>=20
> Signed-off-by: =C3=96ner Efe Dasg=C3=BCney <efedasguney@protonmail.com>
> ---
> drivers/staging/rtl8723bs/hal/hal_com.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl=
8723bs/hal/hal_com.c
> index 70b5b289f9cb..10c34228a595 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -362,8 +362,8 @@ static void _TwoOutPipeMapping(struct adapter *padapte=
r, bool bWIFICfg)
>=20
>    if (bWIFICfg) { /* WMM */
>=20
> -        /*    BK,    BE,    VI,    VO,    BCN,    CMD, MGT, HIGH, HCCA */=

> -        /*   0,        1,    0,    1,    0,    0,    0,    0,        0   =
 }; */
> +        /*    BK,    BE,    VI,    VO,    BCN,    CMD, MGT, HIGH, HCCA */=

> +        /*    0,    1,    0,    1,    0,    0,    0,    0,    0    }; */
>        /* 0:ep_0 num, 1:ep_1 num */
>=20
>        pdvobjpriv->Queue2Pipe[0] =3D pdvobjpriv->RtOutPipe[1];/* VO */
> @@ -379,8 +379,8 @@ static void _TwoOutPipeMapping(struct adapter *padapte=
r, bool bWIFICfg)
>    } else { /* typical setting */
>=20
>=20
> -        /* BK,    BE,    VI,    VO,    BCN,    CMD, MGT, HIGH, HCCA */
> -        /*   1,        1,    0,    0,    0,    0,    0,    0,        0   =
 }; */
> +        /*    BK,    BE,    VI,    VO,    BCN,    CMD, MGT, HIGH, HCCA */=

> +        /*    1,    1,    0,    0,    0,    0,    0,    0,    0    }; */
>        /* 0:ep_0 num, 1:ep_1 num */
>=20
>        pdvobjpriv->Queue2Pipe[0] =3D pdvobjpriv->RtOutPipe[0];/* VO */
> @@ -403,8 +403,8 @@ static void _ThreeOutPipeMapping(struct adapter *padap=
ter, bool bWIFICfg)
>=20
>    if (bWIFICfg) { /* for WMM */
>=20
> -        /*    BK,    BE,    VI,    VO,    BCN,    CMD, MGT, HIGH, HCCA */=

> -        /*   1,        2,    1,    0,    0,    0,    0,    0,        0   =
 }; */
> +        /*    BK,    BE,    VI,    VO,    BCN,    CMD, MGT, HIGH, HCCA */=

> +        /*    1,    2,    1,    0,    0,    0,    0,    0,    0    }; */
>        /* 0:H, 1:N, 2:L */
>=20
>        pdvobjpriv->Queue2Pipe[0] =3D pdvobjpriv->RtOutPipe[0];/* VO */
> @@ -420,8 +420,8 @@ static void _ThreeOutPipeMapping(struct adapter *padap=
ter, bool bWIFICfg)
>    } else { /* typical setting */
>=20
>=20
> -        /*    BK,    BE,    VI,    VO,    BCN,    CMD, MGT, HIGH, HCCA */=

> -        /*   2,        2,    1,    0,    0,    0,    0,    0,        0   =
 }; */
> +        /*    BK,    BE,    VI,    VO,    BCN,    CMD, MGT, HIGH, HCCA */=

> +        /*    2,    2,    1,    0,    0,    0,    0,    0,    0    }; */
>        /* 0:H, 1:N, 2:L */
>=20
>        pdvobjpriv->Queue2Pipe[0] =3D pdvobjpriv->RtOutPipe[0];/* VO */
> --
> 2.52.0
>=20
>=20

---
Best regards, =20
Mehmet Samet Duman
Author of Project Tick
https://projecttick.org
https://github.com/Project-Tick
