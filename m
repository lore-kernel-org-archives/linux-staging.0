Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938207;
	b=Wyvv40kSweLg6P3PXmP9oH4P5qfrt1HaZY1f46b4a9tfee4zryCX9Jyx4+Z0rYPKCnNJ
	 NJq4CGVGR8lVOmupfBSs+++kdjYlbdu8OKQhYzR/lBzitramyxYe57rARLlvvd51pNdM6
	 47DC2wYKyPmFr7A+2H9FFcZyGxE+UaWxctmob2zfSvRVrwE6SCRNNxxMpGW1KGKZhWVgc
	 bNL/ZKFtuS6iQVKVt+mLJvuQdmvWOlns/J9M1TYViZhfqQUcO+BxlZSiSlhKnMnwE2BFI
	 755442ijgXg9Y04njMVa7pyEtXTiZvU/SRbXI1Pwagt2QXWxRAim7fGVbS1+j41pgOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
	b=fo6vjWVHw1lw2+6vFfzgRT/5dyq8JOepbb8QTnrR3dYGtB67cd85symukBwd0fAPNJtk
	 puyLJy5Wl5ICGK9JkMkRymmiuSJsHNffCQHwKvenzLxRKJsOc7/vwd7IsX34rFUdu5UPw
	 aqBrD4YfdXgki3sjzHzAoRMWIk+f7a+eLRJ0Dl+WBq2bTiWlwE+p6ATjizpCWWFUaWWoR
	 PGKBYexRzCvA6fEqWDIFriYchwiJeZIxa4oDxuSIWvq/xVNv6ZRNJsyOj6xo5W5Fftz2U
	 Kej8/O/KQ70upwhZoNbriQ8thTeUffrfNGjlI2DIp2i8MQtjewTehGKRdV7ayK/nOcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJGkrvnc;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE00606A32C
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 17:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE00606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJGkrvnc
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so1607205e9.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938206; x=1795543006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
        b=cJGkrvncdIXgcAuXmUMIYoaFoLGaECyBtm/eICJLrczMnlpfpBmt/6BGjvP9hgPFjG
         JTOfuiF562D56J9pneREZavYnBOn5tXC7U2pso9FOcQLxn6CktZdw5aNEZKmaQLPOo/B
         4Mv0mB0OYhb7jmMMhunlWhGihN5KX2Z5CCOilqCxbDd/OXPfIii3TfFJi7p36h+yVb/A
         /twbw1D8cDQmL1BMXqJjBzdFNxuRVWOo1nya4XqoCcfT78lesiH+/zyM/CL7LsBZ3N2l
         TjvEqcay2dSArDDeHrFkyfYkEijWy177c8h7PpZv6v/UCkJO6O1EttAb5OrARETsFHt8
         qLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938206; x=1795543006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
        b=mge3cFxnrIFhNqM3rwGc+qAipmc1cVTw5FYj10uLp+95W9SWDapmEI2gH0+K180jpN
         M0UGYO5EY+xX3OhT9E1ePCZAKAj/AH53HscNBUuLknxeumKarqWc7Uz+xRMSshDKq6ND
         7sX5oXA3WlfH7IwM97D38V5hToYVN+fbvM8ah5MaWi5nA+hyc5WqlUU95iCgIB7NhMSF
         Q4PJwhliDGBigxt3v/Dskly1KaF8ZnNca+ET5XGTAY+8GMBMkvyk9JCEsqP5OjlVIFkR
         gdIsvWGXM9Y2czZH6hsNic6WHuQY7F4WPHkxVqfnUK+BP7Jm1v0VdVArTsRki3T1rTQv
         Zu0g==
X-Forwarded-Encrypted: i=1; AL+hErFzHuXAD47ySPHSBVrO8LsMMsDqdQxQBDze676CbGQQtP2qfbLYF7wWvIvgjn+m/GZWuWBysrlySqmlJuUC@lists.linux.dev
X-Gm-Message-State: APuU4Z/NDbk1Dwn/D0LkjIcX5beLV7A76UvIJNdYq9KYxW3KFkOvMbP3
	y9w9IohlTEzb9GwI4MCrKjYnc/QZzt9TDo1VNIIp2W4/3UnfWBAEP3sz
X-Gm-Gg: AYBFou3BnxJVTExOLcwspUMYVY+VZActWLgHg6rIe0G3QW7KoCat4Zl9mhtKhRhjPpK
	pWd2JO7W1yi0P4IpaBYotfAdd3/+4oqGdKAhJM4kKcQhB6GHbXL472a8cVk7mwuTjc2YbAygHNu
	10TIJ72A9+4Iq3Jht8tYAamPjoBkc0Tf/YAkV/gPIPTRozcUCBMFDY6G8907VsTWPXAqD4gz0Li
	6c9PLjhBGFoPOh9Wy3UjyLdqDDTVGDc2lly2HNvAsTT5CDuCrab8ZwQhsoGapWcufLQC4TCpfx4
	FIuUs1WqnkPWGIhwypwj9AT6Jh2VSYMICFScZ9LHTjp+bTsh9yOcHl/gIuktiDoqPy0edBd+iL2
	S/la5ExW+xVpFz4iMH6POqwP0/P7QO92n7ohX96kCXbPdqR5DQjcOqA+FSC4H/OpI2NopunjUpf
	wCLIgx7cTzfM6VPG9QehJOCTtYZO83czxaIQoXhq4+U+gSTZ2IuFZVc/RxoApkDL7Z/UBjKZ6XY
	0jYH50Fgmcg9XeayBzh7D8YqeoDkaGOxBGnEHtGJuDl56crbBop8ibpPoEcz/cesC3O53LHijXk
	W2TfJ2/Y5ccXicSl0Z2L6B3hDmvAOZt23OtQHkm/U/ZIyg==
X-Received: by 2002:a05:600c:8b57:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb6118533emr268214555e9.18.1794938205744;
        Tue, 17 Nov 2026 09:56:45 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b74d6sm1292895e9.9.2026.11.17.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:56:45 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: andriy.shevchenko@intel.com
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the preview pipe can't output
Date: Tue, 17 Nov 2026 17:56:35 +0000
Message-ID: <20261117175635.11790-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avwtA3b3XMkGXPfZ@ashevche-desk.local>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com> <20261116175750.21905-2-volodymyrchapman@gmail.com> <avwtA3b3XMkGXPfZ@ashevche-desk.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

On Tue, Nov 17, 2026 at 12:31:31PM +0200, Andy Shevchenko wrote:
> So, what makes us stop implementing the crop support there?

atomisp only uses its crop path for sensors whose driver supports the
NATIVE_SIZE, CROP_DEFAULT and CROP selection targets
(atomisp_init_sensor()). The IMX175 driver does not yet: in his review of
it, Dave Stevenson suggested that binning, and possibly cropping, should
wait for the Common Raw Sensor Model. Once the sensor supports cropping,
atomisp takes the atomisp_enum_framesizes_crop() path and this code
is not used for it.

Even with crop support, preview mode would list nothing larger than
1920x1440: that is the largest entry in the frame_sizes table of
atomisp_enum_framesizes_crop_inner(). This patch applies the same limit
to the non-crop path.

> No need to repeat these two paragraphs, make sure they are in the cover letter.

Of course. I will keep them in the cover letter only in v2.

> TBH, this feels like a hack, but I'm not v4l2/media reviewer/maintainer,
> so I don't know if this approach is legit.

The intent is to make VIDIOC_ENUM_FRAMESIZES match what
atomisp_try_fmt() returns, which already clamps the size to 1920x1440 in
preview mode. Without this patch the IMX175 lists 3264x2448 and
1624x1216, and TRY_FMT for 3264x2448 returns 1624x1216. With it, the
IMX175 lists only 1624x1216 and the OV2722 lists 1916x1076, 1616x1076
and 1436x1076. Every listed size is returned unchanged by TRY_FMT, and
for the other sizes I tried (640x480 up to 3264x2448) TRY_FMT
returned only listed sizes.

Hans, Sakari, would you prefer this, or a different approach for the
non-crop path?

Thanks,
Volodymyr
