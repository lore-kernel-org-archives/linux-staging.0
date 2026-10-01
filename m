Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8E53E557D
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866085; cv=none; b=fribdTiu2BOSikIO2hchSlYoUXzqBIOVFyR3yvWlag0fKpNRBCVqxSoWmnsw6tmq6nQEoeQSDIa8kvRWHSECjMja47vjliQRiJccmymyU+rKaujDWCJt6pyhn3frH21RJ1wf3kJIx4EQNLJrVAPBgN3iMaQo7KEWQR/N13cb0dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866085; c=relaxed/simple;
	bh=rK0uz/KSkFjE1x+MXlOe6fim8a3tw/1d0l+5isYZhlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPtJPei5axR4pPyKClx6au5Ux0pMU9YElN/CBMKpOfOK0vfwgzZoufwvbzhgj6EHyOrkrooam9MwRGf3dUQpTBBlojpeHLow/m54JSg6zooGd78hUr6bMGBjkaHUlWwgD/OArTiBkh0KN9jJ/0dnGpRNdfRVJckAi5ulxYUG0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ+iIzdZ; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ+iIzdZ"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so63376961fa.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866078; x=1791470878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FOj1RGK/mRk1UhJU2+5CuBy3GqPCpS4tTpMqltPtOA=;
        b=XQ+iIzdZxlmzCYfbr3R6EDJi7GenzW83G/8i7Uw0notucEamTv0f2qUdMHjVdIQKeg
         +TBbFr5pHgnG/hXkmyiOIV35CQ1ZrBr7fCA3ej7Bt6UtDEubbU30IYRttWKPqScut4OZ
         kIvhpzkX+WBJsQtpUjk7CUIAIpsfUclxOVyUbCd7RG4KoFbGhK+12Ns5xGyPV12AGOVJ
         PnWBjEy9ftvepUiiFRQKZgTt2XWp2MSVdw8oxU3cEFrg0I4PbRXspvQzBJX7C6rZ8KQD
         jNhrT4vKGcDYeLKex1+e92Z/p26aLX9oxETxYZPHNE+QA6BrAh2sUcyJJGOzZfoFfGk/
         ILsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866078; x=1791470878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FOj1RGK/mRk1UhJU2+5CuBy3GqPCpS4tTpMqltPtOA=;
        b=clFYabPtxpl2WV3dwSDNX7kpFHP3z4vxQLT2RKRY/g2861LnGep/YBnWagkoALtSH2
         sXTdCkZw+Ya3s7ckyUj+h4aJ07wk1nUhF3snEedxET5D3Y8Uv94s8PHdgXmiam69gWnm
         H9BXkmBuoL/zoOSC3Ae7MLTFYYQEaG7ZpvykcN5+Tz4JxO/jtsyo2gMDiy1s/Pd9yO+n
         R4zLQb/WT/hdKlB0eSCueHnSYA2cYOO7QSgJR1A+LbB2Tmbnzne1AnXchcqd30QzO/Ec
         G0VeTsQvV8cRKidvU66X9PuwQ9ZvUcQ3T38LdT8FxC139hSr5Nmf5OqpTIGogx9tYrle
         hDUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRzPBkOv+pm/Oh9NKJEo0M8njWz3+/js/D4kc5jjQTFx9cA20Dony2plN8Dx8/dxlDFPOGj7CTLpfVzWFM@lists.linux.dev
X-Gm-Message-State: AFq9FYI0NeZQqJX7zgULxyLVV8bwih5mU61bEx6MBRNQRMI8N5/fLk76
	fulJ1f0iNyinkfk9sg8f4HgFGNlCMIBJWEQm8vhW4WJS2nPZOV43dT8d
X-Gm-Gg: AYBFou2fIogIvgD7qOcxyP0bSRsJ91BQW83Xqi3FJXwuYIz41tL8gaJU/D2AHIKLx++
	mZEO9FAO0c1ywvAHLowVJMI3IoMpntm2Z+vmCoqWCw+3SrlhiMBh8DTNyASUMt8N0jVbM/8TqA2
	pQHP+HVYwHpeTv3RurTaqRvJNybFi9uR8Cpju/dtgQ0yy9A0p1MvgXGVmZDqT6RK50PgFJ50ndi
	dWaKHYl+yduyG7tVAQMRopZPyd/+1grzQmoWAipbzEA7KP3nfScvfcKd9nLDnvF5gQiAz51VHDZ
	kMeW4ZgQltToZSEft3UOqQaB342o8FOeRseF4MPCfxgYfChPSY+T7jBYmX60e9cNKz+o0T7X/yX
	0b56b9dBTyqFJB2gRd67pAnIlUKB0iO/BPRrQo9Y1nKCKsnyGas4MQ0ii8nVAGOnyfSqr5/Q35i
	GDwd0QSZGV5F0B7fkYy1gewKTLy3p/cGDqZpUfhgXmFlRt4yeG6d6/QzE3PJmGsmqN/PKIH/jPh
	nNpaFxxpdE=
X-Received: by 2002:a05:651c:41d5:b0:3a7:72ec:81aa with SMTP id 38308e7fff4ca-3a779207c3dmr16366201fa.28.1790866077663;
        Thu, 01 Oct 2026 07:47:57 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87cfec0efsm918191fa.17.2026.10.01.07.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:47:57 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Qiling Zhu <kmatzkaczor244@gmail.com>
Cc: Ruslan Koreev <koreev.r@gmail.com>,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pm@petermarshall.ca
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Thu,  1 Oct 2026 17:47:47 +0300
Message-ID: <20261001144747.1167917-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aru5-aq_sPUDy8dq@ThinkPad>
References: <20260924171820.1179823-1-koreev.r@gmail.com> <20260924171820.1179823-5-koreev.r@gmail.com> <arY2CULvwXGyVvH_@kekkonen.localdomain> <20260929092238.1765758-1-koreev.r@gmail.com> <aru5-aq_sPUDy8dq@ThinkPad>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Qiling,

On Tue, Sep 29, 2026 at 09:25:39PM +0800, Qiling Zhu wrote:
> Since you reported successful plain-V4L2 Y10/Y10P streaming on
> next-20260924, could you share the exact media-ctl/v4l2-ctl commands
> and any setup performed before STREAMON?

I tested on next-20260924 with intel-ipu6 bound to 8086:b05d and v1
patches 1-3, with the vd55g1 changes reworked for v2. Before the plain
V4L2 test, I ran the following with libcamera 0.7.2:

  cam -l
  timeout 30 cam -c '\_SB_.LNK1' -C5 -s width=804,height=704

That captured five frames at 804x704 R8. Afterwards, media-ctl -p
showed Y8_1X8/804x704 on sensor pad 0 and CSI2 pads 0 and 1. The sensor
link was enabled and immutable, and this capture link was enabled:

  "Intel IPU6 CSI2 2":1 -> "Intel IPU6 ISYS Capture 16":0

I did not enable any links manually. I have not repeated this sequence
from a fresh boot using only media-ctl and v4l2-ctl, so the prior
libcamera setup is relevant to reproducing my test.

For each format, I ran these commands first:

  sudo media-ctl -V '"vd55g1 1-0010":0 [fmt:Y10_1X10/804x704]'
  sudo media-ctl -V '"Intel IPU6 CSI2 2":0 [fmt:Y10_1X10/804x704]'
  sudo media-ctl -V '"Intel IPU6 CSI2 2":1 [fmt:Y10_1X10/804x704]'

Then, for Y10 (with the trailing space in the FourCC):

  sudo v4l2-ctl -d /dev/video16 --set-fmt-video \
    'width=804,height=704,pixelformat=Y10 '
  sudo v4l2-ctl -d /dev/video16 --get-fmt-video
  sudo timeout 20 v4l2-ctl -d /dev/video16 --stream-mmap=4 \
    --stream-count=5 --stream-to=/tmp/ir-Y10.raw

I repeated the three media-ctl commands, then used:

  sudo v4l2-ctl -d /dev/video16 --set-fmt-video \
    'width=804,height=704,pixelformat=Y10P'
  sudo v4l2-ctl -d /dev/video16 --get-fmt-video
  sudo timeout 20 v4l2-ctl -d /dev/video16 --stream-mmap=4 \
    --stream-count=5 --stream-to=/tmp/ir-Y10P.raw

Both Y10 and Y10P captured five frames successfully and the images
looked correct.

I have not tested next-20260928, so I cannot yet explain the EPIPE.
Could you capture media-ctl -p immediately before STREAMON and any
IPU or vd55g1 messages from dmesg after it fails?

Ruslan
