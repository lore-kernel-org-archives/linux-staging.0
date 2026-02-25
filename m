Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780DC38B7C5
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011213; cv=none; b=LROXdSfgkZ7JiWMoX1Edv/Jo8pquAjHENHL/uqdCf4LTBjq9+r6D90xtZhvDoqErNGxHJy5/rw1SJubETFQ3vqcNlQSQLm0YMboOFRIUIhSt1Nh2BO/diGdmJ8bX/zZaiqcHmE4sPcu+qCTaWJ2RqKurDQZk+3dkJb/r7rFJkTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011213; c=relaxed/simple;
	bh=K0PENzT2elohCt/vDRvBnG27F0pIJB5ytwOaQAU0uk8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HQU5cYru1+SPgQrA+0FzJflq9CZKkl92n2PM4K90FLNGM3gIrYx3s+lr6t9WvBTsRSMeif4F6nhQFNt8azAK/w09e6HN1ac+qJlfurogyvG+kwgNLD/koE1Xap9JiCrmvg4EJ6ycVKmCUHis38M72DuhW1dZpD6gpA8wirxHhFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YNbsVv3m; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YNbsVv3m"
Date: Wed, 25 Feb 2026 10:19:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772011205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJOQ4TvsPbetiGz75PaPp1ecqe4ZgwAgywY4Q15Jgyk=;
	b=YNbsVv3m4nwYOI4QGhBRDTLfC1fYQnjItu4v2EOPeGpQc3nHqZD7yffVkqEOFvdrSqgzPi
	KL1ySNB7H9w5QmS5SzOklaSkCs4JNFLm+Jz6CjNt+LUtPdb25GlFYJ90MO1FA7qLceYTxy
	cNAWtm4+D0hp482yELhjyioUdFmCUck=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_12/21=5D_staging=3A_rtl8723bs=3A_hal?=
 =?US-ASCII?Q?=3A_fix_line_lengths_in_rtl8723b=5Fhal=5Finit=2Ec?=
In-Reply-To: <aZ6eBdaItadBCoug@stanley.mountain>
References: <20260224132748.12336-1-luka.gejak@linux.dev> <20260224132748.12336-13-luka.gejak@linux.dev> <aZ6eBdaItadBCoug@stanley.mountain>
Message-ID: <ED189DC5-79BF-4F0E-9382-616D0C2F3F9B@linux.dev>
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

On February 25, 2026 8:00:21 AM GMT+01:00, Dan Carpenter <dan=2Ecarpenter@l=
inaro=2Eorg> wrote:
>On Tue, Feb 24, 2026 at 02:27:39PM +0100, luka=2Egejak@linux=2Edev wrote:
>> @@ -998,9 +1008,13 @@ void rtl8723b_SetBeaconRelatedRegisters(struct ad=
apter *padapter)
>>  	rtw_write32(padapter, REG_TCR, value32);
>> =20
>>  	/*  NOTE: Fix test chip's bug (about contention windows's randomness)=
 */
>> -	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MA=
STER_STATE|WIFI_AP_STATE) =3D=3D true) {
>> -		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
>> -		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
>> +	{
>> +		u16 state_mask =3D WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI=
_AP_STATE;
>> +
>> +		if (check_fwstate(&padapter->mlmepriv, state_mask)) {
>> +			rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
>> +			rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
>> +		}
>>  	}
>
>I'm done reviewing the patchset for now=2E
>
>regards,
>dan carpenter
>

Hey Dan,
I am writing to you because most of the patch series is already merged int=
o staging-testing, and Greg told me to rebase on staging-testing tree and r=
esend the rest=2E I would like to see how to proceed=2E Sincerely, Luka Gej=
ak
