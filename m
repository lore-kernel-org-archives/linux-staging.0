Received: from outbound.mr.icloud.com (mr-2006i-snip4-8.eps.apple.com [57.103.70.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BB62264A7
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778850116; cv=none; b=av4aIp0fIGEZC/lqbpt4BPmryRaZ2EDf0CI/OyvCXfxqMENz1FSrmR/leaEtMkR/jewWkujPnRYXgPyZmAqyn1Rz5YHr+2aw4STs777VhhBufV/2ZoQaUh5hf2Jnkuy2gDssA8BtxaOPGwoCZNfTM0LgfG79UdLnbGhb2Ci62wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778850116; c=relaxed/simple;
	bh=IOOpWNY6Yh9Rh+dggAmkseZbOjGF3PlZPpVrM0D+Rcg=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=kZcacTjO1WX4+Hg7kfOgDOEbs1tqzaoK59TaH3C3Z33aDHTdYqkb3HEcvCQfKDE1iPiTSmmNg4XazX0/stRr0O+SfYI19BK1CfHWgX+lE0b27a2+U6/QR979JdaQEA5iN972BzshdpXQhLp15ciOCY+Fxl0VT1w3EYb/R2kwzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=hn12epCv; arc=none smtp.client-ip=57.103.70.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="hn12epCv"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-1 (Postfix) with ESMTPS id 66D04180358C;
	Fri, 15 May 2026 13:01:53 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQxWB1sZUwZeC0gETVIPDxRMFVIDWg5aHVwMQAxaDkYwUBtfAkIPHBNWFRMLU1ZWBVQZXQBSA18VTQtSAFIfchlaFFwYU0VRH1RYQQ4KWBIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJCld3NnxLdV0BXh80f0p1QANcC0AUQApbc0YKQg5AciwEWwFECDlzBFQHXQVdVlACWlUSBEAIVlBeCF4fTBw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778850114; x=1781442114; bh=opRcPpaf7tTig9gIqlVPCAoefZbB9A7sYg7k+DAALRU=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=hn12epCvQdj3iX2WgkC3eE0/zXVJ0umDl8LxXgtvhSY1fkJMLcdIHDZ0d2oYEVd/2btT8DmXtq6EiPoaycNS8kJYb4j4VyUGuUuKh5kiZXsglIypiEMUxO/cXHFWgXh3N1LlBV1JHhPgAUAkLS/h2aVUCthLsqL5mhNUeiXShDnzdwKKDAr7rMZ2pv9GF1lRt45uBaA+pXpybQ+cREzUdJKofQS5ww+W9sCXN++wM3i24N/VLc2N9NeFEbMcAqfLxq2nS3dBVp/0qQ1RZh7x/lqPIjbA1rINg13MgRc4lF2i2Q8tB6pOknNZeZFAgYJ+I59CspnXmJCF5+TzA3mOmQ==
Received: from smtpclient.apple (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-1 (Postfix) with ESMTPSA id 060971812CDF;
	Fri, 15 May 2026 13:01:35 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "M.samet Duman" <dumanmehmetsamet@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Fri, 15 May 2026 16:01:22 +0300
Message-Id: <EFE3F065-DF2F-4790-896D-8278AA30341A@icloud.com>
References: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
In-Reply-To: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
X-Mailer: iPhone Mail (23D8133)
X-Proofpoint-ORIG-GUID: nJd1UFfBjkjb1LCVAPoxEYha0fj7Emx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzMiBTYWx0ZWRfX/K8hvDk5xwz2
 N8pukMt0q24SaxIuO37pEI5f/Omf3jFwvrxjTcVs7K3ePeacIAEzo0tD0BtQsTOpxfyrdjDcY02
 /VYVsacbe8rMu6p/HUXFI/5xo3jRfEWaQokobtKHWgAWkKeaRoac+ukMvdOvPBCaO9MEHAqGySM
 /Gb6U6xFODsd3gs2PKnHzfPF7Q0PfJEspqY+kRpgvlm0xXsui75+t1J0RcXhgdGBNcUReNcUjDT
 hj+YdHVCRRKkeEtJeKwaesJBeCmaui7IvFXnoBRMIEpqTYS08PxsPEHrwI7xmnZbWqioIGI59Pq
 g1p1pj/JM2kNvxoED8FfiLodgEc4h0GCAso0TrZnFc4JXM8ZtvAvCKaAb3bZv4=
X-Proofpoint-GUID: nJd1UFfBjkjb1LCVAPoxEYha0fj7Emx6
X-Authority-Info-Out: v=2.4 cv=fMA0HJae c=1 sm=1 tr=0 ts=6a071941
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=aRhIMoA-k8UA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=M4xulAB6ajHQm-HqXMkA:9 a=QEXdDO2ut3YA:10

Was this patch written with LLM? Why is there separate text on the patch? It=
 could have been mentioned in the cover letter.

--
Samet

> 2026. 5. 15. =EC=98=A4=ED=9B=84 2:08, Alexandru Hossu <hossu.alexandru@gma=
il.com> =EC=9E=91=EC=84=B1:
>=20
> =EF=BB=BFHi Greg,
>=20
> Here is the fix.
>=20
> Alexandru
>=20
> ---
>=20
> The loop in HT_caps_handler() iterates up to pIE->length times, but
> HT_cap[] is only 26 bytes. pIE->length comes from the HT Capability IE
> in the association response and can be up to 255. This lets a rogue AP
> write up to 229 bytes past the array using a bitwise AND into adjacent
> struct fields.
>=20
> Clamp the iteration count to the array size.
>=20
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/stag=
ing/rtl8723bs/core/rtw_wlan_util.c
> index 4f41f88908d7..e271d1e395a5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -935,7 +935,8 @@ void HT_caps_handler(struct adapter *padapter, struct n=
dis_80211_var_ie *pIE)
>=20
>    pmlmeinfo->HT_caps_enable =3D 1;
>=20
> -    for (i =3D 0; i < (pIE->length); i++) {
> +    for (i =3D 0; i < min_t(unsigned int, pIE->length,
> +                   sizeof(pmlmeinfo->HT_caps.u.HT_cap)); i++) {
>        if (i !=3D 2) {
>            /* Commented by Albert 2010/07/12 */
>            /* Got the endian issue here. */
