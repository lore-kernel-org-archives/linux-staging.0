Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3393B0AF8
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782565293; cv=none; b=ifMEGMRixCi8DYNuxJVP3v6cVk8FPOBu4LiKtl2cKRhShKIJQGoUndZmHDNwqEyazQm8YZgLebjazHy9TWLyk+Xa9Mw8cNBm7xwUZTPluCB4gO/wRgzHUNmhOHM5jW6pe594yWePYjcBFTH32bXwx9+KF6arvhfHViWD0iALapg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782565293; c=relaxed/simple;
	bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rm68uTV7JorqfvpmY1DlkzHfQqQPqopB/Jq5Y0GCRI73xadA9YkL9gxPJ3CV1mr+PiLW0vG9fNCOl1cY2uST5uky8NdCYk/V8OA2g7GqnG9928Ry3MYTb0Ve4vUsg8PqgEzCeq4Ed1kOnBzsIjXhfWXVMFwpD6HGEGM0RqPDqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=BgTBk8K6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="BgTBk8K6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13508985e9.1
        for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782565291; x=1783170091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
        b=BgTBk8K6KDPtUBcNDI7eP70bqog18b6sW8pxAiGLcFXdRBl2TrZHEbSMsfaH27ois2
         eXwUL44ey+UmZiTHnjA/UkT/9db7WV7Bz2tBRcJ6E/PPm0sP1Q6GK7VXKOIuet++wVND
         iGWODckLkZTPEjfjXuompiPHa6RFGsFAQhy4uzp2ckBvtTaYYsPcESI1OvBJEz43SwC6
         o3v6pELUEwlr34PkYoeEBn/mRw8/DHGwEBKyZeORPYn5SlMqE1l0C9iJYkMHLjwK1XVW
         D5FbTgh4HEPXXt55jT4iawggU9YtbS4sGFmKT3DlglfWfO/xdIeQGZxaf1nsJeZV+BTH
         Qz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565291; x=1783170091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
        b=iAXkKjenx9PpWNdBJOV4qY88IQlnTIyaRAOroSLmeb2k8K78/5D+UjvqPEuPMda3XB
         QrsW8P3F0GxNbVwlikgalX+/grtxqR4tO8nPD2kHoEkAIZdJEsOkYiGMSpU0jQedPWHy
         20Yj/I4581WayitWkR3YOom8eWmHMSRiWO78nqUDD0x/czYnajuONuY4qX/bWvUGGMZW
         nUXw+35mqvoxQSntclTRP0vc+CBPgYvL61qRkVMfYVCcx/bV5ofJPkw+KMFjaYGDQduk
         HzV66H+fV9U2//aqFeG5NEZAoIpKhDTcJWU/o6/mOQGEm7Sw4FMgx9bBFOZSJ4QgEMg4
         DlqA==
X-Forwarded-Encrypted: i=1; AFNElJ9NVKW0NKtYhBINOPZUvHmMckVeJ0HyWJXweAbTDtnTAwLUyk+h/HgkNAqxMCSXUqqZCtdZlWbEoitlCCCl@lists.linux.dev
X-Gm-Message-State: AOJu0YzMYWafGDbvHxdS/PNg1czfgequIJMYJZ8zN0oZ49FrZgz4xh84
	s5bIIJPlhObMP9iDRp9gi+n1Fl/mDNl1WqjKWOzdVq5XNNSsxkXbKB4/22P+OAFyI3vR
X-Gm-Gg: AfdE7cnU7FprLEC4PK3IBJUecke2aT5RIczBGSCGtm1/4QlE5VzBlUdVFmKgGpml+Ox
	XbgyViMwuLL4996oeDWeS9W6o4EYmXDZ1VdS1Ra5/HVoXqgMN5Rz2/xBd2RUOHVkfbypolloBld
	B67P0LFf9y0JmwpoNPD+R5zlEykMK+zdmA7l35n7FjLZD698TmPo4G6pj+Mh7/G+imDuUnu5cX3
	54aO1zz4ERZTezq+JwICs+5DlLW+isgMjOmxnmuP7Mjdp5+WCIiLX92GBsOpP8hIUWPrMDKR94y
	R9arQB+jgw3wn9YpxVhbdDrU/7Hn8TCgW+KszNtMp1WL1AWQdMmL7V8VWnYjMtpdMlw9/jA/eRy
	bhIWLxSYhc+V6g38L9gAJpBEfmqgWzmcn6D0b2euIg3d8iV0XajwyUNtj6pay4xHnKj8BurcRpk
	XGGn7k/wIuRXxkcDubbOoix4AOAjsshXHIv66hHxuMkwdIJz0U64KOGPHB2lfXXE/j1AcrYWDuB
	KmeElo9G5q6CWzPUEbz1+kavjZyiZHIGnU=
X-Received: by 2002:a05:600c:e555:10b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-4926685af4cmr112906525e9.11.1782565290833;
        Sat, 27 Jun 2026 06:01:30 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c00a34esm82809035e9.0.2026.06.27.06.01.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 06:01:29 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH 0/2] media: meson: vdec: fix two more VP9 reference-frame lifetime bugs
Date: Sat, 27 Jun 2026 15:01:26 +0200
Message-ID: <20260627130126.78749-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this series; both patches are wrong.

1/2 is mis-attributed: codec_vp9_flush_output() is the .drain handler and is
only followed by teardown (codec_vp9_stop), never a resume, so the "dangling
pointer on resume" path doesn't exist. The real stale-prev_frame deref is on
the source-change resume path, not flush.

2/2 fixes a real NULL deref but in the wrong place: the early return also skips
the current-frame MV-write register setup (HEVC_MPRED_MV_WR_START_ADDR /
HEVC_MPRED_MV_WPTR), leaving the hardware to DMA-write to a stale address.
Sashiko's review is correct. The right fix guards only the prev_frame reads
while keeping the cur_frame writes; I'll send that separately once tested.

The rm_noshow_frame() use-after-free ([PATCH v2] on the list) is independent
and unaffected.

Doruk
