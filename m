Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4A275114
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773195498; cv=none; b=eGlPK9DOrpmVpnIQRE6c7JV9ubhjMcgnwxcutpZH2WWlMl3yozy4p1Q53Ij+hlEzDcm85JdvA8QV5eD9OkIgkqgKneWsYX1J9OI6Jo11O+JcQSdGl5N0mGQ92fJCRfWLRcYRdDEgzPIyWXC2p8rO5KTrwJ1xwKI/G7scH1ZK23c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773195498; c=relaxed/simple;
	bh=+/dHpzDdvnXv9XvCFyqZfCQUq6sgyPwg/78YsLVfcJ8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZwZO2d8HNvqidcQ7y/JC6aI28/kUwMy0kdksi7Kto4Bt09afgm9yaZllRxo50yK3IphrmIkUhBwEgIXSZoKDy1Lv+a39dMn+R361Y6zXELei22Nnlo7q/bePtSUgdu+aCruHw6z9GG6YDwLRUQsPayScawFB8M6dpjR96KoYNH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cM5iBvGd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cM5iBvGd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad9516a653so56011095ad.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773195497; x=1773800297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=cM5iBvGdwBVUpX4fsKbKSg0HlmjMrB/RAad5sMewhfw1cBQrCw4cGKp2rsX4acX9xb
         na9tA3GNGR13GmvZPHCTc421yZioEhxEcMQiRJ2U8R6G+Xjt/qvvAXJVXRUsWfYNkP2o
         fLqGK8g46RI1m1HRHteG6l/UmUdZMrJIKDzG5OWgclOKlLjfo80cqYL+yLG6500qsSCS
         cmRnlDPRuaaEMF0j9u/o6v0GKZJVm9Gd0Px4dCWMsP0mW4tZct7FVKE5p/bRnQhQfdi8
         6hE/RYUj59gGVpp+Zo+GxjYGApOkwE5VZMtEhWTueKVBZ3Vu5yhY6Jn6cgJ1ILro940C
         bubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195497; x=1773800297;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=tX/sKZ2JRtUtRrZBTXD7uMB5OL1UqHt3rGgSd1UDxnft67k8TgL7HZX2+YjdNhf3qK
         /CqTfON6r5b6ythTe9Qb/O5VyqWD9LGAnMg0dycTGNjSVNSsyNHi8M1Ud6S8U4S8GIf2
         UyQlved32Fay9Znd7QD9h8e0lX+NzHgh8KpjE9zn6qk7nfFylrh7ozwzsyk02EDbWuNk
         QH1bLho36AnHy09U+g5wHoQXzU6yRqhb7coZGOvrPPpzhxPW9yQ67SOsCbFdpVRlV+MJ
         UjnjD1LIcc/ePh3r+gYbEnbIscIGKTrlZXzzJWxuwbENzBVENRfScxR+5caWTDjrRgBo
         8drQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxZpoHfzOLERpCrz7y/Igwf+9f4Kdb5ylmyWs2UL5SpuoUXZ27Gu1Vqsf7EoKM3YABvoksQ8v5QqlFgYtJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzCbxF3Cs5QCNGBfW0SpcTovD7DFjL+aD/JuEj5Gcpb+qhvSKTg
	czgeURyFIj2xrOXhAIPR3sKm9Pkfqtgsj1uvTMsz4bfa22jAH8P8br9j
X-Gm-Gg: ATEYQzywE0AYJaL4e5pKl9ppw744KyR1aIVFkRTLt7XMjwe43RSvfVrHfHLO646/GSQ
	27bV6BhFiLrgootRZYwLKrX68HkGQ16nURkfup1Vtocx75pg1aSlu0nASbOZK2JAc/8Ei2ZHPNI
	9+MKPU8jbSORQQ1X2kOWEXz1RM51+7Tw4ewcO8FqyLctDYXwP1y7Q+3SyOjVEQs0TGLkcWWvUg9
	GHvPORd4L9Og8+14wuLWLkVV03o9xQE5jIPUL1gUrsc2EiPLlDsYIHhGNb6acc1TtaPbZ1XE8S5
	feUVxYkIY2ehIW8KERRHi1QQVxlapM6KNfuauJG5m5qOI+Zb49eJhHvFwkAusm8Cmhrhv3QzKdc
	Y3zMKlE9lUYEuGOT0y78U9rXsbvb40p4HS372fawkQU3EqgN+di1PvceeASlsSl5O+PO6/Y/q1j
	ISbs1irjOzo67i/96h6APRl1Y+8U93J6OdlgQ=
X-Received: by 2002:a17:903:1666:b0:2a9:47ff:101c with SMTP id d9443c01a7336-2aeae8eb7dcmr9366255ad.46.1773195496591;
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:aab1:729a::4bc6:faff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e009sm5679355ad.46.2026.03.10.19.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:27:18 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
CC: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org,
 nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com,
 maudspierings@gocontroll.com, hverkuil+cisco@kernel.org,
 ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org,
 lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
User-Agent: Thunderbird for Android
In-Reply-To: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com> <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Message-ID: <7F16ED38-6BC1-4D31-B5B6-6C1E45D24C25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11 March 2026 3:22:28=E2=80=AFam IST, David Lechner <dlechner@baylibre=
=2Ecom> wrote:
>On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>=20
>> Hi all,
>>=20
>> This patch series replaces manual cleanup and explicit kfree() calls wi=
th
>> the __free attribute from <linux/cleanup=2Eh>=2E This modernizes the me=
mory
>> management style and simplifies common error paths without altering any
>> functional behavior=2E
>>=20
>> The __free attribute provides automatic scope-based cleanup, making
>> resource management clearer and reducing the chances of missing cleanup
>> on early returns=2E
>>=20
>> No functional changes are intended in this series=2E
>>=20
>> Testing:
>>   - Compiled with W=3D1
>>   - Build-tested on i86_64
>>=20
>> Based on:
>>   <linux-v7=2E0-rc2>
>>=20
>> Feel free to share your valuable input in context of the cleanup API=2E
>>=20
>> Thanks,
>> Sanjay Chitroda
>>=20
>> Sanjay Chitroda (7):
>>   staging: greybus: simplify cleanup using __free
>>   iio: ssp_sensors: simplify cleanup using __free
>>   iio: st_sensors: simplify cleanup using __free
>>   media: mediatek: vcodec: simplify cleanup using __free
>>   media: chips-media: coda: simplify cleanup using __free
>>   media: allegro: simplify cleanup using __free
>>   staging: rtl8723bs: simplify cleanup using __free
>
>There is no reason to put patches from different subsystems
>in the same series when there is no dependency between them=2E
>It just make for more noise for everyone=2E
>

Thanks for the feedback=2E I will split unrelated patches into
separate series per subsystem or individual in future submissions=2E
