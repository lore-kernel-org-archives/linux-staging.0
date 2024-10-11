Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3CE1D0177
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728673189; cv=none; b=TnTSM9wNlrKl3DXQR/vbXAUZchHDoWSeAd8s3Er2i0L55H2lBwN0E6CslNGfea+YCd2lEI8/yP92+TlvsYFOgWyMG8YFWK0nUmnFznamOvxOo7++4AbyVvxyJHLbee3z+iAIEIdf4KS8PLZ8HPFmkW3gnWakDHFhklElMO81FwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728673189; c=relaxed/simple;
	bh=DVB4dVhVZ/XAV1+ShuvPw4FP9kY0aGQnXBc6U6sbKJc=;
	h=Message-ID:Date:MIME-Version:Cc:From:Subject:To:Content-Type; b=BIkwmUhUFYnN+R5Z2rZuUo8K9ywG5wglahcMiZfFwOCtLf28wU4DGJLrnvk7mFfy9y67bZ7qFpgfLp5EYAumswQswtnZn4CNbhyOovZex3HbcEfem+Ltq1w5i0HpQUrd8a4aj/S/A/MEmq3F3ZQzgxO57Vr5yHwYZj40QQ00BCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bi3yxCIt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bi3yxCIt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9932aa108cso352823966b.2
        for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728673186; x=1729277986; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:from:cc:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrSoOBsX+fyaOaBJqOaUdYh1pjEXpggjg85T8AzPojk=;
        b=bi3yxCItT2SIZWrMj9zMwexBd9qH2vdpVvMVUjJv6AbxCzAjzidxhfrsvBqRibo41Y
         DsN9VShHk++dSHzhjWDq5jrQ8NoUL441YHXydJEW4rRBX96dRe885gs/yyq/y2kGb/C+
         D2KsgyCaly7r6OM9g4vmAaoRH6J6yVxNYdXfzx3/MYvHBnigGaS9yE1Cc3cnAis/+w2Y
         mDnw5eNOGDlEzAzhoRvzgYWKsoP9S0KyRpVKXh58uXxDnM+jP6dnHZjDmFuRhaNNst0A
         bjEjgXqHlXhjF9hudbJWYxRQ4t6iIb+VOaGNUr55IfkvnvQRwQi2vrAghnbDINtJgr5E
         o1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728673186; x=1729277986;
        h=content-transfer-encoding:to:subject:from:cc:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MrSoOBsX+fyaOaBJqOaUdYh1pjEXpggjg85T8AzPojk=;
        b=Mq+BoWnErIxrxZ+b2XmAB5sOXCv4tTViC6HPglkPF2nIDeC+06Gvc8csOgm4SC4eEI
         dkauP/z0xLjNvNJWa43OHrVULzfrhInDoDtwY71+VhADP2EQLMGLMl/8Ssf0X8F21led
         J/DVdNk9WP3g6KiX1Cfqv41cZj5Sg2eJPEuZRwbNYo9YXueJ1YJV8lYeJa9YbstaEw9p
         A3iDRSm284U4SSE0lCGWIKmxpWsY5yKNrmLF5IK/WP2CtwzooQnE50o0uguitjFvYkOz
         7kYuLFMPtNHbDMUD2b5E/n5urNQsc7/F3+5j2f2pTUgdJjCDhunak8kSARMAtXUSYUVX
         V0qQ==
X-Gm-Message-State: AOJu0Yy37PyBjzYmOTEYHO4Rn99N0DW0InBQXQDhidGF/K4arp6dtfTL
	DUyCeXABK0Bww893HeGEz4H8rweTjkXj/IlWINumcRhq1H1gpDvPvpV+o+7u
X-Google-Smtp-Source: AGHT+IEBAKE0eElGdrA3pm59neuAr7gQh275QTJvmPc8Jwiq7IX1ASgkODASR88cqmv1tZDgfSBNsw==
X-Received: by 2002:a17:907:961e:b0:a99:89ea:3643 with SMTP id a640c23a62f3a-a99b9711d61mr317961866b.53.1728673185829;
        Fri, 11 Oct 2024 11:59:45 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec56eesm241064366b.31.2024.10.11.11.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 11:59:45 -0700 (PDT)
Message-ID: <d7ef2954-21d0-4ddc-85d3-1334e7270ced@gmail.com>
Date: Fri, 11 Oct 2024 20:59:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Malcolm Priestley <tvboxspy@gmail.com>,
 Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 Sathish Kumar <skumark1902@gmail.com>,
 Florian Ziegler <florian.ziegler@posteo.de>,
 Pritthijit Nath <pritthijit.nath@icloud.com>, Arnd Bergmann <arnd@arndb.de>,
 tdavies@darkphysics.net, m.omerfarukbulut@gmail.com,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] staging: vt6656: Proposal to delete driver vt6656_stage
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Sirs,

Forest Bond contributed this driver in 2009.

The following points let me propose to delete the driver:
- This driver generates maintenance workload
- This driver has a maximum 54MBit/s as it supports only 802.11 b/g. 
Peak throughput is 3MBytes/s.
- ping times can be 17ms are often above 500ms and worst case 22 seconds.

I suggest deleting the driver as it no longer meets current expectations.

Former Maintainer Forest Bond <forest@alittletooquiet.net> is unreachable.

The staging subsystem needs to focus on drivers that support usable 
hardware that is available. Newbies can then get the hardware and play 
around which is fun.

Please consider that support will remain for years in the longterm kernels.

Thanks for any response about your thoughts.

No response will result in a patch for removal in 14 days.

Bye Philipp
