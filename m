Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638996;
	b=n8EqCmLiUpo2X1KndIDWAAcFZlgEcDOAtw8xk3yuE+QzVTqOxSFHBYWe554zOQNsTWBf
	 a3X5MKL6DWvbohuFBe7E1MMAGK0rsvtwWscjpUTX/s/fsb+ULubuSOyP3bBGltF2bNLwJ
	 PwXNKyqPrzFITQUfr0n8QeoifW25zR/sm6w6BxnieY9iwg+ZHUx476R08MTswxopHaAf6
	 zqbva/2libXlM3Ql/J6OAXOJpXLpx3JB02hyvT5x5x3VGlD1hmhfuF+5vGxzF44upXubU
	 kA/EYjDOhUFRkEf89LugAva1szeucKa0wP/XaC0Ibc3QcRd5ecOxN3TU+XtHA5z9wRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
	b=ZdeNHfWGkW9XYKM9bN5JB8njr3jt5fxagUJpkoT3SgHrDt4TOkfPIEy/nz9begLZ0CAE
	 e/aDXFU5giUmahBG8a3F207f22c1+6d/eR8Li4p211XBxNMbNdCEI077JqO6E5SoVmp2N
	 Kt9Vlxs4BNEv7bvV4nZxTDThcbryKsEX7YUTlt8wYyVd8GEzHtf699Cqi+D3mWXXy6qDu
	 NPRwLg1LBCR5Hb8iZGhmQu1/xzzm242NkTaqqDoyIo9CYCxaU20jGclrZmhAfKuRnXb/c
	 AVNancqv6zqTU7sjlE11ICpLGXPPt9OvHvdVqhZk3dAPolT3jtMZ7uxTBuEKkJiLJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6GcWqVv;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B58606A900
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B58606A900
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6GcWqVv
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso567035566b.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638994; x=1794243794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=b6GcWqVviwPkNc2hUrUD7vnf5jp98+FptutNIuktSeE9uphenyTkiWTokZ1KVN3WTW
         694cI3NoSs8OjOSdRMCgmujneuC+YE2Q3mCeCXKWux8qfPRtVC9s+e4pO2Q6lmKYlKRI
         dXYj6eFAf3TOwsAU34sQkrMiYQ0HffhZUdEx3MLpepzyl7oFeCdfOgLa1W7BxFnTeHmD
         raTffUowLfXR57P95555hRZN6ATtywy/5cwAoPZ+fPGrGNc+os5zhic2Een+ytA97tMo
         yf62njGDz48YUJKsCOR8Ctmz9fVO9cLSIZLJNiDmoMHNEN7DVo9XNP/rJg+dI+WX1WJs
         x+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638994; x=1794243794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=OiDiRk2HJd6iMP1xN/AtXDBsAwjvATPvpWPAvP+vSdoKqweABt3fNEEyBoO/yoWQGs
         vb6bzqt5muDbGCTL2iFY/6BKevIoD5WdVUVBpv+ma91N0NUH79U7FWVa1w9UpHEpSBf3
         LFera2MejYDCs96DshCOHp0bfhfnfqHS8IfwUGZkniV646JCqYkDTsbThxM/PYaYCL1Z
         hTVAjPA5xvTxInu5ZUYw1wP1lI+PSQ6eKg7X8p8OZDrms3AUC8ftKnTWgoChB9kxPXf3
         YO+0MNguNrU2G6i14BKdfts1o5cJ/AWhLx0hQRcehKKqb0iI1xCASK3SO9xnVnFNfQXx
         M9JA==
X-Forwarded-Encrypted: i=1; AKwUvBy30UQrTWY8E4AkkBGtY0geSCTpZj1HrPu+aT1Uyr7H0DtJ2jBtwjGPJudwEr5NUEt7mKRMOiyBw4R7SXBv@lists.linux.dev
X-Gm-Message-State: AFq9FYJnPNtGsCgx50V0tWy2TX++sH4IMZVvJP+/8QU4/atYsHeSD/yH
	Y1PBveSzng+1NZCmFRqgXqA+XpRy7JoTUatJFEyOUL/8w47rEoZmjow4
X-Gm-Gg: AYBFou253NetIghDvPVc4rxCnx1UWby/2Q0Nyr0jWZPRs4cVdTMYkhWheWqhnHbZy+3
	LP4DVEbNQcHKAVmzQcY2BYctKCqQMnrhTiPdEFgn3ug62VXJvmw9lQDIXHSy4o8lsv4FXfec43J
	3ZZc3UPz5QUrY0r60BAhHsFMtYhLDm/gRB2wjAKfNDMQNJT8SBMQzh/Ncq4ClmBNAF9WKxUnfD/
	bUIQNnGFjf3qDtqQHZknUNjsUl9gMH/y3bLJlLg+n068rTAqdcZbjYPgaPpz4Zt8Gg7HRIbSmBG
	/dAvPAVN0aXGCULCQhVZSIZ5YnFz60LpfuqSWgbGiE+HifUc/JdYm34IdI7c7i9079CKYjlmWeq
	Pc7wsNIt8wCKijtyMbDm//x6UoBDQgf0PRVfzWx++wjBeU8B+Umpmsjrtis6eg9vWSxWX8zW0bk
	8asReSuVIGKj9TYhdpUBPyy9q58VDXs4f8YaVddbzOVvqHs8nR0CzrH1D7kbKt29j36Qz5Lm7sv
	sIlO1kBcbpMIqZIa5iMTdWRHUd1f5AtadhLv9052xosWNPImYJ4tGVE4RsJ1x9/Y+4iJdbO2mqC
	35kYLtlnQAXNzo+7+lLFwMVnNCu5umABxQwEgS95AiLrBBmkPHvpwku9U+H2xUKx5mC+9i9P9j6
	WnB77vNOQwsI136qB30qLCTjO7jyhKQyZJNc4NLAcy60mGjTNcsWj4bb4xHrd2uHRr06pGbwMaL
	g8VYYJNrSrEsdkR08t3xMsVK0Hn7FwYEY/Ek9RZ0U6x3lomxB30rAHZ14jfCdTe+NC4Vm0Z/U9T
	ypVt9TNydNN1betSUeV9vzQqZ19J/SKIs/tOxgsPq9XsBkAxw==
X-Received: by 2002:a17:907:e8f:b0:c41:64c1:cc2d with SMTP id a640c23a62f3a-c4ca79353a4mr832997366b.2.1793638993799;
        Mon, 02 Nov 2026 09:03:13 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/10] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  2 Nov 2026 18:02:53 +0100
Message-ID: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes a number of bugs in the Cedrus driver, found while
running the conformance suites and comparing with the vendor library,
mostly on H616.

Patches 1-9 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 validate H.264/HEVC SPS and VP8 frame size against
  the hardware limits and allocated capture buffers, preventing memory
  overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8.

Patch 10 is new functionality: VP8 decoding of frames wider than 2048
pixels.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (10):
  staging: media: cedrus: free MV-col buffers in buf_cleanup
  staging: media: cedrus: reject too large H.264/HEVC SPS
  staging: media: cedrus: h264: mark long-term references in the frame
    info
  staging: media: cedrus: mpeg2: use the field height for field pictures
  staging: media: cedrus: mpeg2: derive the field order of field
    pictures
  staging: media: cedrus: mpeg2: fix the references of field pictures
  staging: media: cedrus: validate VP8 frame size
  staging: media: cedrus: vp8: use the vendor probability table size
  staging: media: cedrus: h616: use the 256-bit DDR mode
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 60 +++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 15 ++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 40 +++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 ++++----
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 ++--
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 72 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 66 ++++++++++++++++-
 10 files changed, 276 insertions(+), 47 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0

