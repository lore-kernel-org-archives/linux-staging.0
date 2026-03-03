Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89861D555
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 22:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577096; cv=none; b=b6/J2ktZaiOrfgPvrzEWaLHK/fGgYWn8vDAuCe6YgmaCAX/4xPYNTwxycok5d2Kq7KUDB0PFQhJQWcObsfK7NUEfkZLhpc+HVn2l7KNLAWnQo6jYUcnG9vt6xlmtm20YuGm6YBkUgY+8dIDIShxNKZlYKWDMGuw2pZkfUMEL6eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577096; c=relaxed/simple;
	bh=+OMPouu9rLA/Uecs5skXa83Gisk+QvYrGZwDgVwEdNI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MuPcYd7kdEstl7DrpZSn+WTCR6bfJ3ST/9tRCwH0cbzo0w6DfziUkNhXPB8iXOHkdC2XkQPbZpLBPY/6IKO7om4yXy63HGiyicD3pFCBtjdNmmvZ+wr373LiqjPe7ZRzb4lFHgmWw70KrdaH2H0wlUNbImAfr81AKjKrv9RU1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWKh4bo4; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWKh4bo4"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7985d11da10so62246187b3.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772577094; x=1773181894; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S50xqUOZn4S2oclbdwMdGbvrFOPVJ97cthsmqhW5Bwk=;
        b=fWKh4bo4XH02Byel+As+ZyImdkgObDA8eiXKalGCpDBjcoiMebTopDW622LCUyUj0c
         tlHkDJdY3thVPCdnVAz3l1Dv6ieR+1QaQ9/9gipOY5YT4AFHdtwqQ70QaKf5J1B+jKdh
         iiTwUBSUF4WBLjmfossUHAheG2Bab3gwMHlXyM3893qSLdr5y/ECYDo4oI5KX3O+UGvO
         0n+xjCV+phe1AqPQjrYfj3Fl0WQmwHiUrGQEqweLU3n8pM+Ay/8+BMZKsBtCgIKS0W2U
         PQpJXZmCYCOgZp3wV1pwOaJXUif0t1zJ6ON6n5VsFfATpsL2qHQ8K8b9+yWeb+B2Ygmb
         Chig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577094; x=1773181894;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S50xqUOZn4S2oclbdwMdGbvrFOPVJ97cthsmqhW5Bwk=;
        b=ZWjkMczZesBdpKmqxCTuskQfV+AGkzySV9Sl2B0kvMOX8B3JD7jb5rjH9Hf30v4s75
         rL/dKuAAO5qXRIlCVmrvX+00FN7zcXatcN5GBtck7SSq4aagEPaHrLptsfGld149NGjU
         i0R2SbVeSppuRPX8hdj4JDF18C2/bVHw4q2T8xAwdiRwBCxlXIGoYu4dKjDRBvG2RC8I
         Ii4hAWcCOd6Z0JLNr/iILU0G+s9/jIm4FqWjjsSxkNXPTKfOkybDA1QrF20VqqYWr/oF
         USc2SFK9ce30DsX9rmkYjR1qvwBqsLGblnSeda509J/ofbo/I2rLQjcbH8KlfbzMaAkT
         w2Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUbVetJ6koDmJlGCKuMeWet0SP3QIUlbBeJ3Yb0Gm8Oo5si+NYWWFiOFAmGHJWgMKvIhorPJEL6rhASfhAi@lists.linux.dev
X-Gm-Message-State: AOJu0YzpBWsi9l1rxe3TSzf+WdWSOd0WBMoDJPZd6L6TfJX1UcpSNkt4
	b5pSPYHG9I94eT4JnYKi3TtVo4zfYJXHotUIXAlywLJDqEHdJlVoPuAR
X-Gm-Gg: ATEYQzxodcuhhviJlvuWON+9Tkr1V1KYp5ci+Hxglc03ebF3Z5je9DTTlaYvuHXSrHi
	qkgd5+tq6ScWVuJ8FNbXBS+YtS6TYT0EhOkAr2agyBwuAw3hsxomGhYNuiM6vWWvdu22I5CVGhH
	sk+aINZ9y+hoKDs+/5fUowpxM1URs9eKTrQ/Nyv50DHE9iMjnKzIV87InF/KyGhnPyW3Qpphvld
	AAzswyTP7MXIHSF1pVanVV9PbJsk3/jpDKq0/D/iwjQd3M8Hmr75Ne5yJu8lHAyALj0jouaqAT2
	0axSQHz581+Oi1KQ3ltK0FUdSjELQOmHnef3gCBIV5BFD/bqaABRvcpnef/65a4eYzyLySU3VXF
	/+YU+WzaNVs0qYR7EMCy2Os+2SlG+sbw4pe1stPcIgu8MkKhS2mPHM7/6CCDTKgDmH17nXSLt9V
	fG/HRDnL7kdf864aW02m5TS/8syypsl8AzN0g8P6S9lRWDvSvRYHlZsNQdEe4XzI1I2pnu6LJgz
	mJ8JmRtw+sDr/7BWILmp/cMeWvjwk1yVhZBdM6d5co=
X-Received: by 2002:a05:690c:ed5:b0:798:3a5:5a76 with SMTP id 00721157ae682-798c6bd6922mr38827b3.17.1772577093931;
        Tue, 03 Mar 2026 14:31:33 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876aea3b4sm67012967b3.21.2026.03.03.14.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 14:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 16:31:12 -0600
Message-Id: <DGTI4PFLPXF6.H9738F2M9HXN@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Khushal Chitturi"
 <khushalchitturi@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Zhuoheng Li" <lizhuoheng@kylinos.cn>,
 =?utf-8?q?Rog=C3=A9rio_Fernandes_Pereira?= <rfp2005@gmail.com>, "Ingo
 Molnar" <mingo@kernel.org>, "Artur Stupa" <arthur.stupa@gmail.com>,
 "Abraham Samuel Adekunle" <abrahamadekunle50@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] staging: rtl8723bs: format operators and logical
 continuations
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Jose A. Perez de Azpillaga"
 <azpijr@gmail.com>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303173844.47975-1-azpijr@gmail.com>
 <20260303173844.47975-3-azpijr@gmail.com>
 <DGTI46LV9K3B.13GIMLXBFRI1A@gmail.com>
In-Reply-To: <DGTI46LV9K3B.13GIMLXBFRI1A@gmail.com>

On Tue Mar 3, 2026 at 4:30 PM CST, Ethan Tidmore wrote:
> On Tue Mar 3, 2026 at 11:38 AM CST, Jose A. Perez de Azpillaga wrote:
>> Fix spaces around different operators. Move logical continuations to the
>> end of the previous line.
>>
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> ---
>>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 48 ++++++++++----------
>>  1 file changed, 24 insertions(+), 24 deletions(-)
>
> LGTM.=20
>
> One thing to note though is since this is a patch series you'd
> typically want to have a cover letter describing your changes. And
> then you'd send it all together using git send-email so they tie
> together.
>
> Thanks,
>
> ET

forgot RB.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
