Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE875435EEA
	for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791623730; cv=none; b=J/YSUpHIkIb42TFLaXnFUYfIdeWyhUnNAm7q2rE+GKvBWsQXoAknjGw09cpNnnCBQGLVy2l3pB/bqaFodc7Qs3ErZrzWSXmi3/ZG68G8SbrOjy8m6mRljFhm8ZNjHYbCq/nfLdaAqJwyAs0L6W4LjaEBUREWwO4CxDNMzS6wCbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791623730; c=relaxed/simple;
	bh=pMBstT9/Xhd7MIwl1B19jAdAsHKIbsnScIIiwKmVBc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egY4ye4VYUtg9NJ64yWezBjrCEZki99MTUh6T9VGDt1/j3q+mUNZMrzCIkoC6u7DMnifAmuLvuU0bOUagw6lg8qbUbvuhBv4sIm5HRBwnxo37UjZoesrKuhZDLdLFI5AiLr57HviOEePgAtL+xhpzqYAUFK9yf1wn6B/1Fxa9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3Uo9+hH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3Uo9+hH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so3971805e9.2
        for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 02:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791623727; x=1792228527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORCsaPkxBXAIwv8e2nVnJgx67e0gWCZdbaFEBMdQuEI=;
        b=I3Uo9+hH7767w2HvnfJgY+wGcYECCJRYbM4XFrc/AFlJcY58n1xhO6VaZEBE49MgSZ
         3K30DE/FtChow4ZCfy4FkEkCgFFFDI1vMBL8E9hv25D9QSiMoeEmYUBOR9bZYioA218G
         Ho7thGT71CFKmIRDBLVz3L0gWnZGpgK36sV2aSjA2/0DyH67/po13ASlwaKe0mCHOepb
         Jp/WwP8sctZLlAL8QkVtGUvQn8PCwoSYLe3IJnM8jqkNEzI5fiSVjBiCeoNugO9fXA87
         w9Jvq1kuex7fkpbLAbYk0K6J21vAIYli1tHztM0soC86QU449IWyWv1ArMgOUk8nrsJu
         LPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791623727; x=1792228527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORCsaPkxBXAIwv8e2nVnJgx67e0gWCZdbaFEBMdQuEI=;
        b=DeB2vP9rxR2uxccjWDnR+lk7zxgjY1VOWk0pR+OjK+BwzhIg0e+tkKcv/Fyhf4ujHH
         ivzg00Op36JFdqe4MiBULB+0oi4CwjPqafANTYVtvNNQDMyAkiJF+4/oPtvsVQpEQ4Vc
         NAYZA8B2h9eMjYcCyk8cdozFOyORwLJA72EzDJekeKuDcJRBZdwRLwJESFaXb8TU+Hof
         JA3DIXYJW90tYtyGQ4YeRAu6YUb9ZQIFynmOtKAIL8YOPm5x+i5YmO99bPDBgf5zKpAU
         zNg0CJmLtx5UTyRdrPNgw8If5ycCVi8RCtOq/u77XlohflIZm8RsAXtN6AwSFsFU8ikt
         T8Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxUCHayYRXSEAA5MbvJGb4f4Gfbsgw9ur/SohYPsZihQABW4n1rXBmTATYAJZ6QOEjL9gQDavKA/1is+eP9@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6mW+USDuGuhP/2pv8YPL8hP95NlcTRXmh62reH2ZqLx3w8Mjs
	Do07qvzPthA7gw2WChrVUwHAxht/xGBEsj3xdvAnuGIKybN+3huDMoYZAwHxhYe/
X-Gm-Gg: AYBFou3hWP/EwXln0mnxQxtCHfoGuqmKwDEyIUoTiGStUPCgJ+LFgFlG0oRqzFe4Eve
	Uj++2xM2Br8gXuOmoPfjC/9TQNoJx8XYL0EKX/i+k9bCt0M3r1CDpumUGg9BSTeWbMjurBWQ12G
	8gPzIofLl6cqBqbrZziQ+ffBs41e73uEc6O4iK+CM75WI9Q5wUIh+VOIBlgN8P7IFWMO2SpS881
	XIfhdgkGmKNGt4zDXnYoBTK+PTn+6a3K5TnvS36UYpwkciflf7C07vDqxHvjuYFwhOuNs2mr46I
	PIhb4vS3JsZpy9jy526Hco/pLjeT+MfQKvnUHeGZvAUDgtBIhSQ+cIQoptowqbNXsooDrz4IJ12
	pWNSdSrDLaHGQa/iJwTX+C12fMvFWzyAg8YrByy/YBUBZA1KEgxZf5Pan3hYWRsgETN7TsnxM01
	5ulf3WP5MZZijGwewLvzkFK+KvKlxvlDt6+A1NWl9lZLNNDB+PAXxGaij7ZXAooxWscsYZRCcVe
	HwlvHubxBvyEyL6bR+XNt+Wzrs=
X-Received: by 2002:a05:600c:4747:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a18e4a9862mr85422695e9.15.1791623726602;
        Sat, 10 Oct 2026 02:15:26 -0700 (PDT)
Received: from ekulyk (78-80-42-240.customers.tmcz.cz. [78.80.42.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm118773235e9.15.2026.10.10.02.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 02:15:26 -0700 (PDT)
From: Eduard Kulyk <kulikeduard89@gmail.com>
To: j@metarealtyinc.ca
Cc: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration
Date: Sat, 10 Oct 2026 11:15:24 +0200
Message-ID: <20261010091524.1390879-1-kulikeduard89@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca>
References: <cover.1791608336.git.j@metarealtyinc.ca> <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jake,

Tested v6 plus this patch on a Dell Latitude 7350 (Meteor Lake, IPU6),
kernel 7.2.3, with an out-of-tree ipu-bridge that has the HIMX1092
entry. Patch 2 is not needed there, IPU6 already has Y10.

The sensor binds as hm1092 i2c-HIMX1092:00 and streams Y10 648x368
(1344 bytes per line) through IPU6 CSI2 4 at link frequency 180480000.

- v4l2-compliance 1.32.0 on the subdev: 46 tests, 0 failures,
  0 warnings
- 300 frames at 30.11 fps, 20 start/stop cycles without errors
- runtime PM: suspended when idle, active while streaming
- streams again after s2idle suspend/resume
- exposure and analogue gain behave as expected (analogue gain
  0/32/64/128/255 gives mean levels 16/31/45/73/113)
- IR flood LED (INT3472) off/on/off at exposure 700: mean levels
  9/117/9, clean IR image with the LED on
- the crop rectangle reads (0,0)/1294x734 against bounds
  (8,8)/1280x720, as you described

One issue, which I think comes from v6 rather than this patch:
digital_gain is advertised as 256..4095, but only the low 10 bits
seem to take effect. At exposure 100:

  256  -> 15     1024 -> 8 (black frame)
  512  -> 22     1280 -> 15
  768  -> 29     2048 -> 8 (black frame)
  1023 -> 36     4095 -> 35

So 1024 behaves like 0 and 1280 like 256. Perhaps the maximum should
be 0x3ff, but I don't have the datasheet to confirm.

Thanks a lot for your work on this. If you need anything else tested on
this machine, feel free to contact me.

Tested-by: Eduard Kulyk <kulikeduard89@gmail.com> # Dell Latitude 7350 (IPU6)

Regards,
Eduard
