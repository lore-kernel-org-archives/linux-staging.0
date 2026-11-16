Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851901;
	b=UuAhJ+TDCOis662MyDh+CB+pW1yKlqkmk7lB7Z9ghwC7gBPh/tzHSWm5Y+ZVHlyL5eWW
	 /osBE5HPnXLNWFEt6h7Sh0UGp67nLDp5rRMxTvUvsS89J7aSj87EOkGAGUgMiFGvAejyr
	 zii2qQD1bz1bM7iW4OFfInREnJbehbngbb1uOMFTrphqI2G1Nz6UNBmmz8hgUv8nhloCG
	 NwLSCx2fwYlFvB2k2CSXSXCYxa820ZbhF6PyDhDNxgV41ve2foRrdytu4dmnqFf7A523C
	 ObQ+yBT6AlnxFHq5uECL3pQJ6gJy5EuIyO5bUUNJ+JOFnaS9lI8IS7Y8waR3L2ur7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
	b=aTVvn4lN/s8WvQEM8DtROze7f6F6jZiIRz0niCw0wEe7qrNo1+5zsKFyaGaPSvMRFOtD
	 J4TSdAqaD10LPi9r297eiX6KSSbFJNhQ9LC/maPv4FqpGMkPQWozxDDELoflsvdCRQYec
	 ijFNLi29p0zSP8A85cYD/rT5aBRmKoNydocmvwzwgPwI/KNLgbpGIxNJcJUKXiDI4ue+g
	 7nBg3RZ+ez+RRZtZo7hxs1bTpSCS7L+USo/rFEq8gIvjRXzCKYJrd/uC/N139twmwWey7
	 JHBS4BGmqTG7xQfOp7El2UI8ryVGPqjJuVFdI+SEG9JcNJ9PzzSQXpZRQowOZtovLrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OgIn1JZE;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED8606A897
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4ED8606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OgIn1JZE
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so3284129f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851897; x=1795456697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
        b=OgIn1JZEdSuJaRQPbByNvi0zz5D9LVtCzNAoDS8yKKSd18oiMHT0Ro1LfrV4jPJ1Y3
         DVRnLxB1cmRqDStsH+aIolsx1dR9Wz4uhgvktsEmM72Ye2QclIdjKucSRfczHXtyeUni
         mq3FZI08FUVsMYolMZzp7MGAFUAMore06JRlum5XlyDahJhnUdbu66FSvxg4A0otKVcz
         RnQQ+g4ELTEYBaGbqnxMYZljetqU+aUIB33YJIkDZdXjwHa51vxBMh4PFWVTAd2EnDV/
         Ztu/14tOaBiaaLlu3+P5XoPbAYA4I0bq0MwcFXEEio2eH+i5iP3xWqPq15fOW0wQhpY7
         yW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851897; x=1795456697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
        b=bKXyPsS5n2YMgTAR1NPVkXHWNq1D6So7/9ez+gmdZdGzxsKk/VKgeL5FWO4HJxk6il
         lajQzsWw1wGTee6+u2+nQ5BdtVt7HpqJPnOPD/KjXbyukhi3Ds2a3fjwcfP+KE4BZbZs
         WWVCID8O8O0JLos8y9DO1dhtFff/Ff455ptm+JiBLDjEt7CScmaYVKcr6oXo7QKKKWtE
         vJU0a5NZxd77vmjyF+va9CFrHNUQQl0/TpL/lGjWJq2NGN96I0qYNjBPK9gL1Lg+xAg3
         L5MhuCbacgtWBXxn9zTKin/8Tvfvk+4cIPRFCctaWoN1dnenMWyxI5Z59rQhDe5BtrAS
         pF1A==
X-Forwarded-Encrypted: i=1; AL+hErHwTcjFK2g2B40P0anq3HghqqwM+qO1KY2FtFM+sz0mIhGoSX8H3f40q5HdiQAfzai2Oz0cqXMheDl8S7wN@lists.linux.dev
X-Gm-Message-State: APuU4Z+3sMyUSG32u54lyAq0Sm0Uxbri1KvoavtAwFFS5yNUCZ1J5aIu
	m2hrihuhtaA4H7x2voWuQ+wzxf/i9tZDVAyoB50xuW95nsfeKi5SwQ/T
X-Gm-Gg: AZFdTZeFgIjlSzKWSUxzsfEEUcTPOQZZ8OWmD7+RIBoFAuisPZuU/jNxzIvEWWWuyKa
	MXDed4UvrMr5iVNmpRU7/Ns4q45YBL6VVOfVbuGn5mqsSvFtCH49zHB+qJPIjJ7bzWN6EjDMEh0
	fB9gLgEiQ9an0LgwNjte7D5DeFsVfzxJxaDSsoqGiMTUZvGUciW/IWqZRbVfzB1k7osxKhCgWWL
	vl7N+huPNVRdVhMg35Q756i/c1NTeRXOBFlbam3SMQi8vo6I1f7Ngr46iYUNRfMvqUgvwpyVUKi
	qS7LyR9/J8rcbjASKFJS5yauW1XDHIatDAatNjDrkY6mYz+bgOfdrs/UddvkU84Mr+j9I4Fr1hB
	nn/PH63KYI4bZMmoOwWEAwaCfb1+lwsEORcaIOyllot70i5pxIdiTkWNSwCcNzQcMTMhzpcxs5K
	DPNcMrQ74ZpyV3nwzk00FFqHcuCq8j4O02fl9mf4S+aTaT83B1bioBBg93GVtsOvDllQM39BHmb
	ss+tezu0Qe4IqiHZ7QebUDGplZN6YHxEGD3t2gg4cXRdFhFKijQBJjUn+4Tbdsqd7NQdIbMDDCs
	7X0m1ma9v/IxI0F8+0Nv39bBBvy2coSQPFPe+aMDZSO2Ww==
X-Received: by 2002:a05:6000:4541:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-49c70ed7ff4mr17130136f8f.11.1794851896560;
        Mon, 16 Nov 2026 09:58:16 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:16 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 0/2] media: atomisp: Fix PipeWire/Firefox streaming for sensors without crop or frame interval support
Date: Mon, 16 Nov 2026 17:57:48 +0000
Message-ID: <20261116175750.21905-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

With PipeWire as the camera path, Firefox could not stream from the two
cameras of a Lenovo ThinkPad 10 (20C3) on atomisp:

- Patch 1: for sensors without crop support, VIDIOC_ENUM_FRAMESIZES lists
  sizes which the preview pipeline cannot output, so format negotiation
  fails when userspace picks the largest one (IMX175 3264x2448).
- Patch 2: VIDIOC_ENUM_FRAMEINTERVALS fails for sensors without
  enum_frame_interval, so PipeWire advertises a 1-120 fps range, which
  Firefox turns into 1 fps. atomisp now reports the sensor's current
  frame interval from get_frame_interval or the pixel rate and blanking
  controls.

Patch 2 has no Fixes tag: ENUM_FRAMEINTERVALS never worked for these
sensors, so this is more an improvement than a regression fix.

Tested on the ThinkPad 10 with the OV2722 front sensor and the IMX175 rear
sensor (the IMX175 driver is pending in a separate series [1]), with both
patches built out of tree against a 7.2.15 kernel: Firefox 160 streams from
both sensors at about 30 fps through PipeWire. Build-tested on media.git
next.

[1] https://lore.kernel.org/linux-media/20261116175151.20150-1-volodymyrchapman@gmail.com/

The problems were investigated and the patches drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Volodymyr Chapman (2):
  media: atomisp: Don't enumerate frame sizes the preview pipe can't
    output
  media: atomisp: Report frame interval for sensors without
    enum_frame_interval

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 86 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 3 deletions(-)


base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

