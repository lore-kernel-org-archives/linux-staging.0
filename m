Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8E36B934
	for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608369; cv=none; b=lDnS1qP4Au1Swb+k2bDtVfGld4fBVfDdu6ByBH/oyEpZhJD7Sejwoqf3sSjCfaE72Znw1w7ZJ+nLMuVI7JLBFt3gMzvLTZepqMbOtfguVQD8NkfrOgiaUAy51AOrxywFbz7bwpPzcuSO9/gW/k+IbSh4GBFHT9/9mDN7mwYL/BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608369; c=relaxed/simple;
	bh=P7yCH5kYXrmTKOJ0FGZzZuy+blQgstUKAmh/g+oX51s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFt5Thjxg/+9t91n0GlqZUw/H/KWNkHoOpU5/fuLIaTFhbSOu2KUIVH7hIcSye5Czo/6pz3DMoEaIfKwi3ES3+T/lbxxmTBbVG8ctnTxiJngaQ7+TZ+qlthpXeUejegaCHVuwfoA76OTnK9udImcc7BW3qyDv3mCY98QkQsafl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=Zn5DzgEE; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="Zn5DzgEE"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93cc1ab5f6cso44190285a.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Oct 2026 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791608365; x=1792213165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nRDOlvFA2YLyiFZW2o7vc4YCb0RwgsJ9ji12ZBwLmc=;
        b=Zn5DzgEEWxv4CBs5WEEfzUG4uzDuoLL+zfF2JfI6KFKgoG0h30C8jIREvTl67nB1JH
         qBpPyr8q5jSAUk3v7cL4l5jau3HJCMRxbz6wG0fpecsrvG/wUIugYmTwMY5BB63DFqIR
         bGqf4kQnnwD7fTahHzqWLvl3WK2iR4sz1W9WQjTWnLrBf/6FqGoECuB7e81eeGyYNqNx
         th4l7OSmrsDv6SjL1jvPzC+fQHHeVVWFrX3D2M3Xo2z+jX7fSoud9C9xgg2lRqHWPRoE
         rZNDn4HB/Y2jgDsdlHzeeRgbg2qhEYWfmZfB48SwUQb0BEBgr+4CY6nZkho99nDw3a4s
         6skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791608365; x=1792213165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nRDOlvFA2YLyiFZW2o7vc4YCb0RwgsJ9ji12ZBwLmc=;
        b=tMlhSv+nAfmjLzs46fVMJG5YH6E5xWj4tYNgtMExK+PZXM4IXV1BnpaCBblrZFFRZZ
         qZGKIfZgcqjdfoq4Brbi99Q9WSt2TCF9YdV3O/upcP2nEpw3yR/0a2uC18WtRNSfmCci
         tUKzP3bK5pWP+sDf3R491ONdb46W+Lwz9MzfqtJIVo4c81a8hwF/RKe+plH4UzkrrZyJ
         Il5fY92iXL9XWGHh0cXv1V5hBcao5ZkU/Sm6B0IUMMMHdgBUhhROFCowwT0tNYvqA5eq
         ZaNeGnZimJtr14b48eH97QlGtc5ej0YwwUCBVLqaJdq+eExutmSBOcpJQw/f0ypBaO5I
         SScQ==
X-Forwarded-Encrypted: i=1; AKwUvByd6OEr+R6vXXZR/Vqf+gb9aQtPis7APvO7JJ3dliuV4jrfURb24Gftm2iNCBqQU3HI0ctSzJK+y+htiVjf@lists.linux.dev
X-Gm-Message-State: AFq9FYJeDjEgIfyNFFkLZdJlU6I0RvgvUTfVhfYJRb6H7cOsVNu6mIkp
	wggcoBii3XcTtoo3vfHTWSyyBU/8v6FX+BhxAFsVCKZtJk32ojAxJMoFvQ3IvpjPoDk=
X-Gm-Gg: AYBFou2aZ4DUAFOZDwGZoxZzneQavz/z/WmtqUDpGmWoeBdzMLNYBTA0GnvwHnvYii9
	RfCnFVAk2EBsPkFfPmU0Ay/S+Wej61ba7iJWZHADI1s8HdeH+IXT6cbSpubADZZmV6bNIthbcGZ
	65pP/FUbiYQFrFCUb8/snodO5Kto5V6MJ7PcszZPyJWPgDLdzjkQe1eI5TNlHT2uyXy636tM/C4
	X5oPymie1yQLbZRuwP+HMYRA54gJAtFOEcahmoE4w4WoDF2SwunhwXHYPCHSrwszh/arRQLr7yi
	4P9+7wJsN6M8BJe5Efe8J8LYNvx0t3rgmRGp8VoNRWuYjLJU7/w1M3xklO40QqSVK4rweMyEc38
	wj5KcANOg+ATwDIRw+SETrm+pKSBXVHP2a68+nb1FQuqF13wK/YXBaqm7vNeisXx4QgjE635dT4
	3WggSA+IavLNur4HEbIl2tqAfR8Vtag54lMKWalJMoXcgtfTb8PeNqBlP3FHbJI79KO4R6kC+tU
	HzIyxWJzkF1pyVhW158xlWEh0dB+Dt/h14meSo823fKC1DYijH70HCZIVwLuWs5tQ2uFDHhY+fF
	Szls7byRq7FIl93dT1oIVugVgBMjuWS94nIcXkwQf8lrcZg9G2ZEXcA14PrfDc4Zqw6e
X-Received: by 2002:a05:620a:261d:b0:93e:49eb:a274 with SMTP id af79cd13be357-93ebd225724mr641879885a.23.1791608365448;
        Fri, 09 Oct 2026 21:59:25 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550887ebsm35827736d6.33.2026.10.09.21.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:59:24 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: hm1092: Intel IPU (ACPI) support on top of v6
Date: Sat, 10 Oct 2026 00:59:20 -0400
Message-ID: <cover.1791608336.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ramshouriesh, Sakari,

These two patches make the HM1092 usable on Intel IPU laptops, where the
sensor is described in ACPI as HIMX1092. They apply on top of
"[PATCH v6 0/2] media: Add Himax HM1092 mono NIR sensor driver".

Patch 1 is for the sensor driver. v6 cannot bind on x86: there is no
ACPI match table, the 19.2 MHz clock these machines supply is rejected,
and the only mode is the 24 MHz one. The patch selects the configuration
from the clock rate and adds the 19.2 MHz / 648x368 / 180.48 MHz one.
The 24 MHz path is functionally unchanged. Ramshouriesh, feel free to
fold it into a v7 if you prefer that to a follow-up.

Patch 2 is independent of the sensor. The IPU7 capture nodes have no
pixel format for MEDIA_BUS_FMT_Y10_1X10, so no monochrome sensor can be
captured, whatever its driver.

Tested together on a Dell XPS 16 DA16260 (Panther Lake), kernel
7.3-rc5, with the ipu-bridge entry that is already in media/next:

  intel_ipu7_isys.isys intel_ipu7.isys.40: bind hm1092 17-0024 nlanes is 1 port is 2

  link_frequency  180480000
  pixel_rate      36096000
  exposure        min=2 max=719 default=360

  Y10   648x368, 1344 bytes per line, 10 frames, 4945920 bytes
  Y10P  648x368,  832 bytes per line, 10 frames, 3061760 bytes

  exposure 100: mean level  59
  exposure 700: mean level 198

Two things worth knowing when reviewing patch 1:

- The 19.2 MHz configuration reads X 0..1293 and Y 0..733, which is the
  full 1296x736 array including the dummy border. That is what the
  vendor sequence programs, so the crop rectangle reports it as is, and
  it lies outside the 1280x720 crop bounds v6 defines. I left the
  bounds alone. Say if you would rather have them widened.

- The 24 MHz configuration is compile-tested only here. I have no
  devicetree hardware with this sensor.

Regards,
Jake

Jake Steinman (2):
  media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz
    configuration
  media: staging/ipu7: Add 10-bit greyscale capture formats

 drivers/media/i2c/hm1092.c                   | 363 ++++++++++++++++---
 drivers/staging/media/ipu7/ipu7-isys-video.c |   4 +
 2 files changed, 321 insertions(+), 46 deletions(-)

-- 
2.56.0

