Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAE53126B4
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775508465; cv=none; b=IrE3ta8W1/rSG1kI5MKbsb8YjIcOH/Yz5OJ9tmgD0MVUczWIVyf+rjiYjpBhl9u6NatoRKYxE1gp/5jwr/lTDCY/9GIyySOmjeSVnic5eklkvMBC/vfUVdY5KRRk+Fdm96XcgIMTwLx1F0CfDhW8lufkDgy9YurW6Oz1sejhds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775508465; c=relaxed/simple;
	bh=QyIZ3LiK1hCK/iTxaIe05uL7Wa5dFGvpMCo+BHEtues=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=d57udCT7e9x5KlxQfB4Qdi4+1GY2Qjl4duYif6GtkAG1z6V9JnL2bTKPD0EK0uuZYzllnTiT64YjS+gZq1oS9C9J3a0FSQxdbNtn3HTVUxkMJosCnrCMlPRORaHBKPzn2BjaTa/H9A/DNFssxyUfAGlWf/c5CD/dGsi6uDyvdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+mUr62C; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+mUr62C"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7a17bc5745eso39359617b3.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 13:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775508463; x=1776113263; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6bSpybbve/uppZrHu04AihAoKtS4Osvf69+FKM+5YU=;
        b=L+mUr62C0x03+x3rTN2hqECa9YsRAjRef4l9ILcvHYjL6I7H1q8xPPnXkx1Y6p1NMA
         Mcjb69H1DRiCBg/jSpGqTTRaC7QGwirDIwYHLdXPaDOrh0uCgnKYwxrVUlC12/MIT3e9
         lOog3RuN1tFCSRp/v4igeC6QBNy1zbB7+bSGiw/nHkOJjImoBGtHBVhybVfcJM7+enAb
         S0AK/90yIKG6cAWiYJ+CdRbYoNUoTBSYuShk7bImEVCO5hpd26YLyOiTzUQJouQBHBcP
         S9rCqH+ZdkAdcmmTZ7GECf4uZZqvbMNxtm8+OZIitjYhwhPAF+gzsYwlozXcIhdb1SJa
         X/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775508463; x=1776113263;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6bSpybbve/uppZrHu04AihAoKtS4Osvf69+FKM+5YU=;
        b=D43DKNlq5Sj870t9wU0kYmUVq66eRgu3KThdOKL5hdVKTy2Y+hDzCufRmkoXzN1DMv
         a9KAjOpNr/KejvB8lj0p30Vr7L+atmTuYP+XG4aca1+GOhAVwqHuJVG405RjjXxkrNPh
         NBv9nyaPrFBhUAuzn+ASFnHSOxYeFlbXpvbrOUUnZ7QISivjVdTsnI6bTNxNevQiK+Bs
         oLtR8O4B6M/0JnaJxBVifQdcgDF/zOZO+/Tg39SXhi3CvKZt1qZ+lblTQb6VXZKWs0FL
         laGXHbyzxdTzJfMLvA5ByAsMdrzV8oDxQMvIhU9fm1vg2h4SumxkPwNyVsV3VI+vS6pA
         ReuQ==
X-Gm-Message-State: AOJu0YxkCTbo5IqLHc4zelY0pVgOaiqPLA4xufRKHeeiz263PSNIMhTh
	BXIeSo+dZgUSWx0H0orCUcH0L/OYRvDbGKwueUvjQhYnXBPxAv8KSXsl
X-Gm-Gg: AeBDiet++VcD+8Nztl7qe6tx2fiyoyA/RK8Yut031BKTIAtRhh48xSZQBrT5NKvFsrz
	2rJvoLuW0syDAqZMkV9eIUUWDA4xNHVCZMUBVhJHMdQIPgfm1RKvW0Z1Nj9BeRNDSVSyWvBU6WL
	DXzd3Vwki0EKb8JHBIYXbF3DEw7QyIthQ3AJspGthw3/WEy1cF2/b8mdAx/dPVhfJslC0QPq3Nc
	FnG60z8jZMY+wLgBxxBinRgZeQrB2i/5hGg64IpRt4eXmCaLXrX4P5iEZPTdHLWo5om+ljhp+Y9
	djh56s3RCSGQ/i4JFactCXuaq+6D1RtwKy0w05xEQkAKjAEAtKsNoz7Dcgs1nZ39pjD+EipHhoW
	ZVNv9k7kHBTAI3nJP1ZX4Y8qBYSqwvKacH6bzwtnt1WgWuxrBAzcxCBCSjsyMjTTASBiUMvTUjo
	rnLBg+B+1ikTwmeQ5pOfKpI/OWgMI9S49ULMGxfCvV/s/F89mJ7pk8dkZvGvkL0SK/aFxaFEQgj
	4bN5wFFc5iuHq/s7iBV+Ma7tdt7o6TU
X-Received: by 2002:a05:690c:81:b0:798:cf16:1c6e with SMTP id 00721157ae682-7a4d3bd7d7amr143486757b3.21.1775508462885;
        Mon, 06 Apr 2026 13:47:42 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42fec3sm58082817b3.4.2026.04.06.13.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 13:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 15:47:39 -0500
Message-Id: <DHMD7XTRZ3LY.2EP61834E44FS@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [RFT PATCH v3 5/5] staging: rtl8723bs: remove duplicate rate
 checks in PHY_GetTxPowerIndexBase()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Luka Gejak" <luka.gejak@linux.dev>, "Prithvi Tambewagh"
 <activprithvi@gmail.com>, <gregkh@linuxfoundation.org>,
 <abrahamadekunle50@gmail.com>, <b9788213@gmail.com>,
 <straube.linux@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <dan.carpenter@linaro.org>,
 <weibu@redadmin.org>, <knavaneeth786@gmail.com>,
 <ignacio.pena87@gmail.com>, <dharanitharan725@gmail.com>,
 <samasth.norway.ananda@oracle.com>, <karanja99erick@gmail.com>,
 <s9430939@naver.com>, <suunj1331@gmail.com>, <ysinghcin@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260405114132.310774-1-activprithvi@gmail.com>
 <20260405114132.310774-6-activprithvi@gmail.com>
 <B3F00249-F9E5-4077-B863-EC809A556296@linux.dev>
In-Reply-To: <B3F00249-F9E5-4077-B863-EC809A556296@linux.dev>

On Sun Apr 5, 2026 at 7:57 AM CDT, Luka Gejak wrote:
> On April 5, 2026 1:41:32 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gm=
ail.com> wrote:
>>The code previously checked (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7)
>>condition twice - once for the (BandWidth =3D=3D CHANNEL_WIDTH_20) check =
and
>>once for the (BandWidth =3D=3D CHANNEL_WIDTH_40) check. Fix if statement
>>formatting to move that if check as an outer if check to improve code
>>formatting.
>>
>>Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
>>---
>> drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 7 +++----
>> 1 file changed, 3 insertions(+), 4 deletions(-)
>>
>>diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/sta=
ging/rtl8723bs/hal/hal_com_phycfg.c
>>index 9e523491a008..efd1c76f2953 100644
>>--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>@@ -469,11 +469,10 @@ u8 PHY_GetTxPowerIndexBase(
>> 	if ((Rate >=3D MGN_6M && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate))
>> 		txPower +=3D pHalData->OFDM_24G_Diff[RFPath][TX_1S];
>>=20
>>-	if (BandWidth =3D=3D CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
>>-		if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>>+	if (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7) {
>>+		if (BandWidth =3D=3D CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
>> 			txPower +=3D pHalData->BW20_24G_Diff[RFPath][TX_1S];
>>-	} else if (BandWidth =3D=3D CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
>>-		if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>>+		else if (BandWidth =3D=3D CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
>> 			txPower +=3D pHalData->BW40_24G_Diff[RFPath][TX_1S];
>> 	}
>>=20
>
> LGTM,
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Doesn't apply to staging-next too.

Thanks,

ET
