Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267968;
	b=xhrJkYmRoaNV5DFLWMb1e/CTH012LsNlTPx5TLfYRMDWL6To2rqpa4oeyQLR4Clrzkrz
	 DO3f4oYprGwCDqGoU9zO1CfM9Sc/kHl1Pi9+n5Rfgyn7YpG6wAHaeL9H5xPNQIqx1/lEf
	 2H+JoZ6rkdBEHV/DD3msbk1xCZCvwtAiEnLZqUKKiywxTiV0olFZJGXhU2Iua3J2xcEwD
	 fmxJr6AAoxwHPralvapaA+c3LIOZLlSOF76kaIoWSBEJvNPbrazV1B3FCJSk5n+VICiYw
	 WDAyUwJ0afhnh7/pBoRomJTzaGsJ9tHv7amYYF74qJCGhVuP2DiXVZzQOSqAzL5mQ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Utfdnddl3HrhLFxOssPYnL8n9jheBCeiU8VtWG/2YVE=;
	b=vlh2M9jh9mGy/TkcBGrhLLUL7GKpWWq0bBZDJqhw+6SAPtHhOupxh/1FAw9a4JdimfEz
	 TK1UIEF1rat163pLsQ7dL3yOgPQUSpE6mRMYTX5SHiAmf3Odj+HEaORzFc3c7m+6+A8HW
	 lmqC2WWPMsHOI/zCH39iVO7/JXR9wBeDMODPVX3XszGjC00vc7ej9Jv49B8zd9lLMgRmE
	 wcWbReW214WAMjjwdu8bSDrbnJ52BbpQULYxivTYsEOqYFPYNgmrIB4gf6n/zMfI/sP7L
	 wuNPq9avRJvGq0PIKL9npLQLVOs2CDffpe4X/ey4gJObEEVLsIJ3yp+xKCtw0u+T9YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thPHbLwt;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBD5606A338
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBD5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thPHbLwt
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso26037605e9.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267965; x=1795872765; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Utfdnddl3HrhLFxOssPYnL8n9jheBCeiU8VtWG/2YVE=;
        b=thPHbLwt1gvHgys9Fb5xKkRp2mlTkGhk/OSl5eOr3EOe5norQN5/rhaUEUtEu4nLYO
         eUjvuXW4BIpmThYqLlW0Q2vTwbz4U3z6yy+y+ugOtKBGEaHVQl/kFKPkTflSBULSfezx
         XY1N6qQnLBy2zpftuK6BWHS7qLz36Dp0xp99gH02lmdPkVlWVMUFUS8Vx70/XUNPychW
         i7oMlrZe6t0W3dO/Z9dCZ0UtpLPcVijFSUKY75F1oTd0ElHu4362KM/WsKpUIIuxwMr8
         viGsJ4e9v2laSpYf7FODfwER6zf2PS5rsEohejF5ocKKZ1OaV27C14cXXVIOU3mgv8Rt
         hurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267965; x=1795872765;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Utfdnddl3HrhLFxOssPYnL8n9jheBCeiU8VtWG/2YVE=;
        b=Bi9MhZlLFX910OcXpDq+SGb6k68OrK0EhPXMnif4ortTnmqjJE4U4cNWycAWHg3xfv
         FAHJh28oVfjAgtrVu+JIHnPEhnoxYaAkhLxHI/DKoe4hEnu5NWfimP/UpGJ+QWybchYA
         5enIt3Dr+a7EFEO9sXYLJaOmD2xmDiGeBpqa25Ps68ygN/s4vIl4mAB7H6O/Q71gkhde
         S9yYZyy5D2sH3radkLqyYA7vCUbqu8J05fdJgKLhu9P23k81bvostklUNfSkLpc+6kON
         SbASks0V35T/fggVbzdmkTmDEN/C/i0HmI55hrVuiBWBecEoxUDKPaaQzW8xrRXmVQ5Y
         jQ7g==
X-Forwarded-Encrypted: i=1; AL+hErH/c995FiGJZbP/9Nm1HvkYc3Zum1B9a8ZCTTQIKZvuvU7U/nBltHzWvzMAv4POtTz9fa2BYLowzYGnIrx9@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZlowkN7zgaI4qBjmDDqd33GR6uCftVsi7nXPN2sO41GoMAzIW
	sq7HM03Xa/TBbvW4Rmkx7osBXTqe2APN4X0P1X3ZRojk8NlakML662pi
X-Gm-Gg: AZFdTZfD0zoAjKnGG4RKG56e6u26Y36RUpCWCLpQeer39ZRFcYDcj6A3ugjMk0E23xB
	5xYbN5NeItas0Et+CoqXvBS0k61RI8psfDlCB5rAL8mLJHONb3K0fV6Vk6FEYGpVBbpJBZglKcv
	bE23ot1VcBb98P6ZurCIPwqNiCK0bm0XZ0LBfladpC1wWE5UI7F/23DEEPsurf5G98MgEKNX8s/
	c57FWQ8+u3wPKbusbY5jJ7+IrgPURO6k0pQBBaxflA61I0GV7EElcX3zKuU7bWslqI9a8tH+ILZ
	F8g85hoUkpl7sdUvoibLLhYmS+3iDGmaO4jPeW07DeMOKRfHCYpFzky/1kVMqy6WNsAhBv+hqqi
	S7rwc9X1OH3PVwTuyMl7Q6nNurbzvJl6Tn9XdZkgCqgdHFMoBOZ8HKYUD4nJKKgI96ZphGEOjsY
	I+iQFwlv9m5zrjWPqkUdEsQ7D8DcO2IsBT6au4lGMgaRa9jb/jq2vF88P7HS0KgH78T/WJpxCfq
	DXmXSDigBgGaZGZIiNaNT2m1F/u144yzumodcsdutxXtRlYdulY1YwQugs/NAhlCFA81tDx+7TQ
	D1Natv9Su5//dlNgos+SQ2bpHqvvhwe8WUQ98LrgadY/z9Rc6jEYYNV79PcX4ObXKB8nyPlhNWI
	Z03WyNVTBbQG3
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr136284285e9.13.1795267965131;
        Sat, 21 Nov 2026 05:32:45 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:44 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 02/15] media: ov8858: support 19.2 MHz clock and manual white balance
Date: Sat, 21 Nov 2026 14:31:29 +0100
Message-ID: <20261121133148.1240789-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112212234.GA699509@killaraus.ideasonboard.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com> <20261002-submission-media-yogabook-v10-b4-final-v10-2-817ec765b257@gmail.com> <avYp7y9Vvh2Oo5c6@valkosipuli.retiisi.eu> <20261112212234.GA699509@killaraus.ideasonboard.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sakari and Laurent,

Thanks for the review. I split the OV8858 clock support out into a
local test patch.

> Any others notices that should be added?

The 2017 Intel notice in v10 came from the OV5670 manual white-balance
code, which I dropped from the clock-only change. The retained OV8858
register table matches 18 of 23 address/value pairs in Intel's GPLv2
OV8858 initialization table from the Yoga Book vendor kernel [1].
One more pair, 0x3f08 = 0x08, is also present in the existing Linux
OV8858 driver. I can trace the four changed PLL values (0x0300, 0x0302,
0x030b and 0x030d) back to the first public Yoga Book patch. Their
earlier source is still unverified. The revised clock-only patch
cites [1], carries its 2014 Intel OV8858 notice and records where
the four adjusted values first appeared. I removed the notice
that came with the dropped OV5670 manual white-balance code.

> The Assisted-by: tags are no longer used, please remove them.

I removed those trailers from the local series and kept the description
of Codex's contribution in the clock patch commit message.

> The 24 MHz configurations are lane number (and variant) dependent.

The only 19.2 MHz configuration I have is for an OV8858 R2A with four
data lanes and a 360 MHz link frequency. The test patch rejects other
revision and lane combinations at 19.2 MHz. At 24 MHz it retains the
existing register values for R1A with two lanes and R2A with two or four
lanes. I compared the table writes and final values for both modes in
each configuration. The clock writes move later in the sequence, and
24 MHz still needs a hardware test.

The Media CI review of v10 patch 02 flagged the same issue [2]. The
unconditional 19.2 MHz table selection in v10 could replace the PLL
settings chosen for a two-lane sensor. The revision and lane check in
the local patch prevents that override.

Laurent wrote:
> That's indeed not a good UAPI.

I dropped the red and blue balance controls from both sensor changes
in the local series. The existing scalar digital-gain control remains.
Any proposal for per-component gain can be reviewed separately.

On the X91L with the local 7.4.0-rc1 integration kernel, raw capture
produced 30 distinct frames on each pass in a front, rear, front test.
The rear OV8858 ran with four lanes at a 360 MHz link frequency. On
the front capture node, v4l2-compliance reported 40 passes, 7 failures
and no warnings. The same seven checks failed with the same diagnostics
on the 7.2 baseline using the same node, camera and tool version.
I repeated the capture sequence with the AtomISP and WV517S fixes in
place after retrying the front sensor probe.
On the exact revised 7.4 image, OV8858 bound automatically and
captured 30 distinct rear RAW frames before and after lens rebind.

[1] https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/ov8858.h
[2] https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/PWB2NAGYQ7EZVEDZNXK3R3UKZ7GGYAQY/

With Best Regards,
Maurizio Casciano
