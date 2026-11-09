Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246667;
	b=EvDc0WQnobGWQ8Kv9SBsNvSpduIQsIA48NGD6bpGAqrvYIaXUt9nPM7csLKZR3olIaz6
	 aa7y+ALsQWEiZ/oSEBnYEI+zbKXnJ3ZVyYbtY+hCtTMn2FiWviLpEhvthuEZfxZ/ZW0tX
	 lCjf4XFzff2Dr0n9uYEJgZ1Vhwl31+OA2zKWTgtuRADnOtq2s2alQPEWYiwQPVoTYg/oH
	 tisQJf9RP5UAPErkYfv/x8FFSNMyKohj0c4egLRBjQc/4daAGsiBzV5IR0JYDSlbFN/jW
	 BLhN2QI92c9SoYuE3/7NqaXWyk9vRdwAkAmm5ui/0obdfFAJ/Bv1awbmPqn+EPOxpvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
	b=TJP6zogGP8BJM9o+sFfMVl6SUfIwGOqVnJMa/oCg/Ea2jFoijhMCJ7tDoXh/QqGKBV1K
	 6G0NNs3qE06aDQtfiv4LvCfmzvGhAbs4/i79/WBY+GuIJg63CPga2hxhRmh2YIGIPhx8G
	 ldm3nDyg9OiWbP663eX8pIc8DU0WQSUlON7cla/YRvGXFX9x8gEJjHkqMg3iq4vUUM1W1
	 fHAxubyx0Z/xGpi0cylQAHm/g3VYgpWsA2OxRIHJuxVYTZxSvOdy/bRjATnOIZCk81rh3
	 f+U+LCMRBDyE3BC0m4RF7gruomU+TIGWIA9s2AE7M1jyFVIPUi7qxQVXdnHr5Gqrkog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkrHQLad;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A6606A332
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5A6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkrHQLad
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso581417f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246665; x=1794851465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
        b=WkrHQLadvu+NT91SRMzMLbVYkHVroI9pO6jMHtX0Y9Q4ZbvrWHv4x5aciAGYqufd/f
         ErmEgFy5IzbBKic/vdRGNDUzMFnmNHiWPjPYQfSePdSMzOWf6+C9UnoRQ8sxKPYmW3lv
         2ScupWl+v1Xjx0+YZiL0J2eDPFCHM2jKH1jGEy8/aoPuZLuSM5lz9l+QQeMIyxMYpVoq
         pXQZa3/zQICmVRAPUWyJAKDy4BdNcMrwBEn9OYJ9jWolpcHvvubFfeRdx4/6PyY1gskO
         sj61dV7B1EuhIJA1Xi4cSQ+wcYsvIn3VPq+gFosoeuUHcOcOOd/GpImNVNqg7gkr9sJM
         2oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246665; x=1794851465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
        b=sBrLzVuTW1fHvyq33gLiTRmG9p9Kzaa890d/A167qJZFmFTVz6VAVnrT+F4K5aH2PD
         Gzi/mMy29iJY24hdjvSnDvUFfPG5ImfajAqmu+0fN2XnQZmEas29uZSGLtDPM7SIeUfR
         t5HphY53uAEVPBOykEXk9iOIWjFxxtetNtqCwoBZNB9gDsrHksZ5TVZUBJS+OdrQW5ex
         kwz4Y+wqxLQOcRf87LZwV1wo1kR+5eddmj16Lh6zhvUm0K59cnYdXNjDFayXRPhgAHcv
         iCF9FaqC+nT37sdpG68cgjSiCwOmalrz2jHbOI0hNRUpTy3AXA9gkgV8aCWOOn9UgYnk
         Eo5g==
X-Forwarded-Encrypted: i=1; AL+hErFsvQNB6UTna7A/kUdn8Je//fMNZTlxNqsm5kt3ehUlE4QuqpLpoZcKTpOs4hiQ4nClItCjC8FpDuewj7HS@lists.linux.dev
X-Gm-Message-State: APuU4Z+kD5tLFfM8PFu8cFegTlsW2VA/cYlESpqCv7tvusgv7FZ0llAB
	gdblq+IGKCZ/zjp9/Ok9PwwlC9bPMQytA/fQdlabUD5kX377gPJwX4QC
X-Gm-Gg: AYBFou0+HUxzlydC7WzUbbAeg5y9K1sW2w7MaaByZhzLx/ws3m7J3quH3r4jqRAxmvi
	tdKAJ08Blpu3AMOKaWni09+xHeo0yM/pKb2nad2evuuqv5DTAH4qGVyS3a83RpEOugbniWh6y2l
	2DtO7KTPBRCTyynjxlEQxpcieF1nfGO6pxENbEZz1VTE2azdz40JYnI+5Y1Mr5lEm84RNp80Rc6
	REgV/AVTnPOzDCGVPXfSBvFZSm9ZxhZ3LOhHEvu0HB5Qw+ETQmY0xYUH17wGM6/xQd8CQRpv1VB
	u65M9iEO+rXecWruuEgwV6Wj7Nikx5wlVemESYaLRFDJ1RIy7MkpDyotPgBy6pc9UlmXM5Iet0S
	MOdeZMnSvZzbDUyfjDO4hblLIiO3Pk4U5njQOgTUz58surKcLU7+mMK0k9nvEpZ3yq5FcysB8zd
	H0qIkpSBTQ/JfvOp0g1lRHmQ07ehfHE6HHEDHxfOxlcEiUUxr9E7ne4yMDLW1DMOC1IISYlfFCE
	JpuaQdXE1l9oqwwx9axZks2b2zdQrY+xFS8LRkf2ti85XcjrIru2hJNjuyVrEI3pwFOGwpyPzb+
	soc2fSFvJAVLSSyCYY3CdXrhfT0lMG+4zdtWA+UYzYukEKSOXii9AOCFspK7p4cebwwHntwelC+
	+bkbBkw0LD4pwRDwuC5vnZ0nqtprUIQZu/SZGp8FT+fsRwI+CKdong19CmI42hRogYfRf0TsRnE
	Yycs3bDUlLtOUueWhiQhVBSH276uBxb9Vz01NYQotZg5he8mY9tmSLyhmJlinz0OEBpiyW6I7yl
	r208FfMxKk5g17aFdN3pHhI5OlEYdzP12SO
X-Received: by 2002:a05:6000:3c5:b0:48e:6419:ddf2 with SMTP id ffacd0b85a97d-4982e641f54mr399339f8f.17.1794246665055;
        Mon, 09 Nov 2026 09:51:05 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:04 -0800 (PST)
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
Subject: [PATCH v2 00/11] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  9 Nov 2026 18:50:05 +0100
Message-ID: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

Patches 1-10 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 reject H.264/HEVC SPS and VP8 frame sizes beyond the
  hardware limits, and fail jobs whose picture doesn't fit the buffers,
  preventing memory overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8,
- patch 10 clears the sizes of the H.264 DRAM buffers on start, which
  fixes a double free when a narrow H.264 stream follows a wide one on
  the same file handle.

Patch 11 is new functionality: VP8 decoding of frames wider than 2048
pixels. It depends on patch 10.

Changes in v2:
- patches 2 and 7: check only the hardware limits in try_ctrl. Check
  whether the picture fits the buffers in the setup callbacks instead,
  which fail the job with an error buffer. try_ctrl could be bypassed
  by setting the control before the buffers were allocated (Nicolas,
  Sashiko).
- patch 2: describe what the HEVC decoder takes from the SPS.
- patch 7: limit VP8 frames to 4080 pixels in width, as the frame size
  register holds 8-bit macroblock counts.
- patch 3: pass the reference type instead of a bool (Nicolas), and
  keep the reference type of the first field when the second field of
  a pair is decoded into the same buffer (Sashiko).
- patch 4: halve the macroblock aligned height for the boundary of a
  field, like the vendor library does (Nicolas).
- patch 10: new.
- patch 11: set the DRAM buffer sizes only once both buffers are
  allocated and clear them first, so that a failed allocation or the
  data of another codec can't leave stale sizes (Sashiko).
- collected Reviewed-by tags.

v1: https://lore.kernel.org/linux-sunxi/20261102170303.1973892-1-jernej.skrabec@gmail.com/

Please take a look.

Best regards,
Jernej

Jernej Skrabec (11):
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
  staging: media: cedrus: h264: clear the DRAM buffer sizes on start
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 +++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 49 ++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 66 +++++++++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 32 +++++---
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 +++-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 74 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 72 +++++++++++++++++-
 10 files changed, 329 insertions(+), 46 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0

