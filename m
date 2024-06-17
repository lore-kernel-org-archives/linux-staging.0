Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EFF158DBF
	for <linux-staging@lists.linux.dev>; Mon, 17 Jun 2024 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637695; cv=none; b=O9NqD5sY0X4KwEHBP7+unWqYd8Qb//oTFXl8RZWPptytZByqrssZZ4z+NQQ2ifYigUD9SSFQ+L8Anynk/8wn88paIZIsVpHpNLSBCPfEEWCvkpUTdvxHWcEKoXSu2Aj3cJNVRIGsRlpsYV46Lj8Ik/H01BMaaKwM4UJ15In45Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637695; c=relaxed/simple;
	bh=5Wn7SBadF1voQ3s8lFOjrITjw/7NasFYsMiD4rEzIT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FJcGw9sJPLroIGSz/cFsxoy9/fwz1QhCvSlA3Nb0gyko8xwrefpCHTWwAWlXl5/TNuWzLCBqhGiJzAk0/qf+AG8UFy8EOgVeYrUoCJx6bQIBldEtaTcKI8H3spw+stVymvhzQRP1Lp5zm/Jiwi7XrTUkTGQV1Gycl9TTMf1MyRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBfjN1GR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBfjN1GR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70435f4c330so3574813b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Jun 2024 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718637693; x=1719242493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00MR3ut2aMx7bMI2LS9yReBsbwXpambIHWaVlb3riis=;
        b=dBfjN1GRGJ56PA0+FL+I9RVdsItzqnoJj7fpO2kSTtRK6D189FJYX27LlK6/X+XnBW
         QTuGvrTqTYAhe71qcT38fO2cWlCS80tnh7hMvs5Wdx6r2vrfxvSYTyjAw8AvBNDnFjDd
         W/OWhdP5f9oM7ROuOBThXJzZ9O+zHb84rp+dGaUAMjSQjryzgmmXZzh56ikYH+Os0iXm
         7ipw3EnlvvvSeqlGM6+C1qzXuojyM3rqHPBErQTaUREcnHDgvoT9V+7TMLWSWk3dRNEr
         nx5T24kCi59L1xgjXdH130qCBh8xdA/5WhFSU1S3ioLWG996uKWXuIEfRjFpOOx5l5+3
         +l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718637693; x=1719242493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00MR3ut2aMx7bMI2LS9yReBsbwXpambIHWaVlb3riis=;
        b=H71qcO/By2k0aalBiGwLPqbWF4MUDE7hgDkJijr4rx4uYN4SST9Tiyq1YunzF+3j76
         JnTZpyxSBvb2Io55FWQri/gh1Sd2xFRVnan/pw0bWCaheOCDVbxtwvWSbDazdu/gjqnU
         +X9FPnwivf03CWK1n9L1HSzQhpiUWF4qPBoYt4+uewkeQEPK4HDWZGyOxIyJen64/jk+
         PgdFpZMxyUkiTD5diBoe9r0YM3BGgf0ecuuwYtxAT/Mom1equlFjW0LoZenBwxsZzj9N
         Sin1sMwAucRvUAK4xykKcGkjmf1O/3+x+05VIr/wN7h8wFoWQKyE/YrgavShV21W1qIk
         GaFA==
X-Forwarded-Encrypted: i=1; AJvYcCUHfCH8nYPuAu703VZg8w8PCElJYWlWEFPbHgPKgryVB7G1A9vQmYQK09ynNrRwHnDfwfq8gmedxovTBU9O3Ad5WXnEWaX7VirQdhbRHA==
X-Gm-Message-State: AOJu0YxO/dG0DOnb7HcEPXugZ3Rw3NcijGK8/+ZOYaa1qhn7fs7Sukw3
	k6tYsJKgfqWjSYbHHAJrE9m+2of3i8rElQhjHgqj6KC2XcKATFXk
X-Google-Smtp-Source: AGHT+IHBHAhCvnxr/UkOTrgt6uZtW2TW6zVduT+0n5X0O7AEH43lwuvAseCDAnFPI71RKlft3Z+Kkw==
X-Received: by 2002:a05:6a20:3c91:b0:1b6:5b3a:9a55 with SMTP id adf61e73a8af0-1bae7eb2d92mr9897841637.14.1718637692784;
        Mon, 17 Jun 2024 08:21:32 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-70a36b6954dsm1760558a12.84.2024.06.17.08.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:21:32 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: nicolas@ndufresne.ca
Cc: alchark@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 23:21:18 +0800
Message-Id: <20240617152118.30684-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f295f41ef1c9ee920ac3ac8e70ccf672ba7c9648.camel@ndufresne.ca>
References: <f295f41ef1c9ee920ac3ac8e70ccf672ba7c9648.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On Mon, 17 Jun 2024 10:04:59 -0400, Nicolas Dufresne wrote:
>> [5799:5886:0617/171224.851218:VERBOSE1:v4l2_device.cc(128)] Open(): No devices supporting H264 for type: 0
>> [5799:5886:0617/171224.851346:VERBOSE4:v4l2_queue.cc(1069)] This queue does  support requests.: No such file or directory (2)
>
>This one indicates that V4L2_BUF_CAP_SUPPORTS_REQUESTS might be missing in the
>REQBUFS implementation. I suspect GStreamer simply assumes this today for driver
>exposing stateless formats (which is fair, its not a compliance test, and we
>don't have a codec compliance yet).
>
>I'd suggest to check and fix this one, and retry, might only be noise, might be
>the main cause, we cannot tell.

This log doesn't harm chromium decoding. I can also see it when using
hantro g1 decoder. The issue is "VIDIOC_STREAMON failed" later causing 
decode failed.

>Are you using minigbm ? Because if you do, we don't have minigbm code for this
>driver (and have no plan to do so, since we don't aim for ChromeOS support).

I'm using patched chromium which can use mesa's libgbm to render NV12.
Robert Mader has showed me patches from this mesa's merge request[1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23214

Best regards,
Jianfeng
