Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794827176;
	b=oCAfAHGkzg3Ej0ROphtk6l5QEAyZ/6OIv0JEa/DBB+ERifRY2dvi8Gbgciu2UgsHrOnP
	 dg+erav3LCNS8gYvElK/RiD5t6iPNEpw9IkMFG4AdYHvrs905xa3QzYfreWBrfXDxDieT
	 yIM0fJQ0N81ueWjIN88zlgKbwWQIt7d1teY2nudBymfRCklKJdhKjMQr4U5n2de3dNM6S
	 84+ysKymUmvT0kLu7d4aVg6h0fS+X7/smel37LtnBYTHvJtBtyyquneRfAte7QP2HpdX4
	 A72yFvomBMcqWcfKYCVGB5UVAtGTLUrTCIde4C5S3WV3ib5g1RsTuKJs0KkMTAqukiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=xQ+XRJRfqGWNe502z1NieQ6Di1+3uLEHnExv5SusGko=;
	b=1AX59nugyRdBNzaxW0j/Rq1322dhe+Ia/yppUqjs2z2NE5xzTyRP+nIAL0/gpycVLr7Z
	 3zSrJvn00apHViZSpw/XeQQLZxkoRzRpCkSVDsII0s6PC1VgGtAxPaX+pwfg6ddJ8JHku
	 SM2yyQYAkNI6ytegyxHJ+GjObbMcgfMfZT+Q+YCg4JFspqR9FhRnhnYcMlfDRqPjLeNiy
	 JDddDDpK0TV2xUCuhfCsgZF/Axauv6U3TI/xjJmKK2QfGzbc76vtAWbtzyBFhPQP7pfM0
	 3skMTqRqzj210HdHwce0LNgSoimZiZhshHEYFwJwC/61uO1vBWms3Q2tbicTLLgAdaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HqkqvPWj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26226606AB72
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 11:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26226606AB72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HqkqvPWj
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc53938a8fso3950771137.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 03:06:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794827175; cv=none;
        d=google.com; s=arc-20260327;
        b=lXjH9f/yFJz5zCMKMPMlw8DiUxlNtaD2yJGMOD3H2SNXSn2J4FqkIGQ5BTUThMj+mJ
         nIiDgKsRUzXSEgpb4IVKodvmHtKVPFXldx3nlE3y91QOSMeRi75WiMqMqKuShOkC1yk/
         2MY9FeyizCJpYd5KHzE/rIyjmUcPP4X1cL4VhZ6SDKNM4tEUADTo1twobgVS+JEwc0wP
         11A6N6kCWAO1epXAAUohOxlLoJV7P9g4192usOHYcOKKuvjSKcAyFwvJr+M7F9Xc03xJ
         r7SbxqCm2sTXa7SaFAj0xZ9AMmJn/H7m2uEPnz7FpwWi2Awlgd8ttBNHebL3bVQW76Cm
         tkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xQ+XRJRfqGWNe502z1NieQ6Di1+3uLEHnExv5SusGko=;
        fh=06daI33/+inoUvcXFPR6gT5yTMC7OkWsk+Q156eTRlw=;
        b=PdNpoWptcipIZBBMhtt42cI+zky2ivF7Y8qniVXrYBXKZZ9itJje51Zq45uOi81X7L
         2bAsWmdm5Uqj7qEgj0anT+DKRF7+ftUoaNT4orP4mG7z9sxxY226iJNlmkkzT8yuQ5GJ
         5V7FTtNxKwOMN4ajXJvcYXefaSWel6kRmM0QcapJ0DPyp5T8zt3uKG8gmLUDFzUkK0Zr
         d9UcQlTjPg7+f4isbEvtbMrs9MfhC/iD46NSfpqsnGfvSnTSX07MAV/9hgU3WXaWZwrm
         EjCb3Uxas/3Rbu39UlmdZM0THhiGE2saejIR32+9xOJJDIbczI1PQ1TVnwshF6Z/KI9j
         DBnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827175; x=1795431975; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQ+XRJRfqGWNe502z1NieQ6Di1+3uLEHnExv5SusGko=;
        b=HqkqvPWjLepAunrJWoBv3kF/RI07iUP2bXpy8VOFri/ay1Xn/IMw64eK0GAUXt9pzZ
         hpso9IKokSyBH/2RwQUSBFrp1UTj1Y4czQcpW/Kbulb407WwThTT25ULEVSZasD93vBF
         s3kb/tzinuxgaJw4tfTRDhSXjRwec+qlfPL/MpNh+/ZvFm4WJwcESGwjMcbgFcp0wRwQ
         K4c6Et169lKbu9MhV65Vv/ZpGaVgoG/USJlb+JGU9NEcdaXpJJgXHxsD8qJwgIvzvR6h
         6XB6RafPNnsaOeMr5huSJsHPvln3ESv/kA78RvGvmpNAGWywGa4X5TcI9ADMJZAjt9kT
         PjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827175; x=1795431975;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xQ+XRJRfqGWNe502z1NieQ6Di1+3uLEHnExv5SusGko=;
        b=M4BPLrPcCIA6SAQkVPPa9E5Bu6nwc5rBLcRCVv2FOUK6k3lglhdQajDrMzUm+JY+16
         G1HGIXOvxDsMNDuu/72OF8OgBZA6Fv0JSiKCzWpDtfiRmwMHNUv5F1mOo8e5zowM2NOW
         FEvqyi0p6deqshcStgEHMz0B1JO4kH2zCTqAMwwKQ/KvrCEcjiZB6KcwUWVYobiPW3bn
         1E2zInc3nYSQlFveR2G8DAGg21YlD9sJ3W6zeTVkKYOiEzsqMWJ/d/OzXtcdwLAMaiZk
         UOwT8ksdCSGkQ54rxoGd/PCtyYi1sBt4PMDcSMxCx7a48MD+q8XaJ+qehzRXgzm3MA/+
         DOEg==
X-Forwarded-Encrypted: i=1; AL+hErESJI/vibpzZal3CZ4rBl/vsaN+17kVjPBm6Vn1W9gu/O/0HIsXCr73wAbitw53o/E8y9FD88F8YDt7fTeN@lists.linux.dev
X-Gm-Message-State: APuU4Z/h6ccfb3LW/MJ37vw+wjmutZjq2W1MQm5x8XHUwSWZkAF7BYyE
	pZasfSWBxNa70RXWEakPXNNvQZmax0EXAY+6u3msHw4+k2icraFUiAwPyaK5JL9lRyTp9ynK4GQ
	H5SndffAeOHoePANWnIadEbTHASf+Jg==
X-Gm-Gg: AYBFou3MBZ1lqk4+V/cHsx6PvrO+0veASOUGpG93o/9egxyV8oj2cEcz4H/HFv/SqiR
	xlWpOzWnMXCrmINmmGqLATu+FnWRuRIq/lad5iunM9GXoHmAJXAnsZ26kwUGCjsgaUMFZe6OU2q
	AHCbTuIGVe3aPbQ0R2iUd4no4cyaciVxuiv7/PVHid+zpWxqNcGgouIPG/5G/hG4Kekeh7a4s4k
	ZfSp0YeH5axZTr1Bp+CP+09DkjdI3nvjP0fdgkfopTJ8LPlmhV4nZd+N9SRSTOREm1ihAhMDiq7
	SatMpeMaepivZG0HdaYhcB9Nt2ovligiyQn2dh2ssUHlvz83r9GpVoppLE/zGs+/5sZ1N0n0a8M
	fJSLbt5dEha8ZpNw4FGQ5KK8dBQt96881lWApUS3wprCmB5qovjEDNqCATgPBXujStNo4CnNnKy
	e3Ck6wrYAz+bsce+EwP8GuD580
X-Received: by 2002:a05:6102:6446:b0:7ab:af4a:f2f3 with SMTP id
 ada2fe7eead31-7d64d85ce1amr3733507137.26.1794827175120; Mon, 16 Nov 2026
 03:06:15 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?Q?Dan_Andre=C8=99an?= <danyer@gmail.com>
Date: Mon, 16 Nov 2026 12:06:03 +0100
X-Gm-Features: Aa3M54qWYR8xNcUWt6V_dGs18zbE6vtdwyxH9pDzTab3Ot52QukA3DbaldRNmBE
Message-ID: <CANOneGnzbBQ1WuMdgGBQ30+GqV09O1TwQ2C+RasmTJfhcWth4A@mail.gmail.com>
Subject: Re: r8723bs: NULL pointer dereference in GetDeltaSwingTable_8723B
 (RTW_CMD_THREAD) on kernel-7.3.3-300.fc45; 7.2.15-300.fc45 works
To: gregkh@linuxfoundation.org
Cc: federico.franceschi@proton.me, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Indeed, the driver is deleted from staging as the module is supported in
rtw88 [1], but only from 7.4 forward.
Fedora (and Arch) moved from 7.2 to 7.3 and this issue appeared.

Another confirmation for a similar tablet (mine): LENOVO Miix 300-10IBY
LENOVO 80NR/Madrid, BIOS DACN25WW 08/20/2015, 7.3.4-arch1-2

I have alternative WiFi hardware, so waiting for 7.4 under the tree in
December is an option. The better option would be to early test 7.4 on
my hardware and see if the bug happens with rtw88 too. If I get some
time I will post the results here.

Thank you for still supporting this piece of ... hardware, looking
forward to rtw88!

[1]: https://www.phoronix.com/news/Linux-7.4-Staging
