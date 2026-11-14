Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650543;
	b=JPQT2N0+rIYWJw9xVLzbGZgXySSFBo7nWq+AxSCpxq/ppLpIWq4SvoOpAYqY7hoWaVB8
	 o5FPTDWT0ZoqGGzrJGZ/6q0pfyEECV7OLCGCfE/lcV4pLav8ar6vfXjZe0hPQ0iCFWG24
	 Ll5yeZ67P2g2NhtN/Y12CDsNkTzFckwyuaYAlCqRL8I7HKuuwCzeNiwSjPqSkQrvWaios
	 27m90xrJH0xZzhGCHGDRv6ovD35n7HES20UzNZsHalGSuoCg2MZ2OOm527bxU8BEyin/c
	 GE+RcCg0N7/WDIs5qGWLe2gXRepODmLLn8L3T8MF25kHJMyChhq5rw/w6PIt1sXl3qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=56kD8uC/JQs1NVPB4BPCYThtaKRA/inwI9P7GjKzDmc=;
	b=5Wp2IY2Y5YkiXDoRbfSUPd3Hc2Tq4nPqKmeO8dVnUIpXTCw39/L8B2ip+6kvx3X2EDNY
	 LWI+SVZHXT9fqdSUS698uTEuJuiIinuS/m8/p/riZS91FNwenXNnJqY3CyXA7SvucEpqY
	 Ns16JrVvIoiDb9imtq+ZLjQ7d7+qejyy6Z+8upP1CKiuRq70wFRmakViT8rKVhzIZwH1o
	 fHGWNkwH4ehL5qWlMRaS38SmduCyjZ629EJe7agA7aQ09p8auK+TsfenRi3+p0pjLd8n0
	 h2zG4khqOLv6xe147W/tPxxdIJlis8cjB3bwh0i0LNdAeILYiECRSSxob/tFFrVbZYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWaYotiR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E5606A32D
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 10:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23E5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWaYotiR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso13861885e9.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 02:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650541; x=1795255341; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56kD8uC/JQs1NVPB4BPCYThtaKRA/inwI9P7GjKzDmc=;
        b=lWaYotiR4u3JuQ2Bg6KUEFkeWOgC08qjVQYKa4Ht8XdQRA5sjSXRtyoAlhRo5t4YCR
         RDPACWdMuRvpb9Q2VHQ/GcyTucbfiWFPq0uVjzJBStbqCU4koZIadIQfJEo+RQOGRbgQ
         mlQbKHzRqJKdwInArOjzVYJDCFGt+iYn60HlQx3Q+jJTyhpWL0WTKyKYSpXgjlQvz+Ls
         8Z9GXn9pYYBDvql4wwIbUsaOnK5U9L85VW/w/7JFLt4QMethg7H5HSTS6Mg/YRYrLFu0
         7gM55LZaYUI/F2URsdM7UGxc47t6oXUnTgIAkh1zBEZu95BS/r0vq0mORPwmVmkF8zdP
         ocUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650541; x=1795255341;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56kD8uC/JQs1NVPB4BPCYThtaKRA/inwI9P7GjKzDmc=;
        b=yHNI5a0UgK8x5fodELzCUkPGmIhAfbfzp0UomcJZ1SeCYfzsDi0HFdnegDzh6WWrbF
         QsIisH860Cf929fKA5ZU3WIHJ2sdkUlu60uTcHM9UHMri3Ty0r5T80bGbfQxa+ITyeRt
         GPNHf2IM92pZp6clc7ZiPsOMHGQWrn50ChiT+FsqbqWA05Ny6+xHLcI84ravIXdHlc0w
         GokGbKEfONwjEwGiGKF0tvMDtdzzUYjmoCaHffw9ALDmE1oNnyfd6InxS/iio41Fk/tK
         wj+fx71Oxm+dGCoFtDdAmgaarv13bWilBDhkpl+TjpSncaZjWaa6prMotR3oz2ftL891
         catg==
X-Forwarded-Encrypted: i=1; AL+hErE7Y1VRveL0oksaCMjAZ4EvOljw9Z3z6T7fLkVm4kXzq35gZSy5pM8wi3A+Rr3BtulSVviv2mTSQLDJOUQF@lists.linux.dev
X-Gm-Message-State: APuU4Z9U3pN/679WoSBpkakWXqEv5qsMutlkrmYlUKVXLA+mbcR/ob0r
	K/yyF+y9Ky1DhxAHDXeLlT+ToISSyRDkpnnVgm5rJMmuDbauXAkunS1q
X-Gm-Gg: AYBFou12JfVItT3casZTjT1HKqgZYRVI13LoIZQ5Sv7bj5hl8eCcjFOKJ2kZR/UIQVe
	6KSV351JIFCNjWHOGQqarQAzFpRrhm3XuzyZNohS15ItEj+fEdeQvcvU8GSTOjIG9rRaI+72vn5
	QQ4PH8DjHQ5/LY7SjvGOlZ7hD7HDulzAdR9d+1HYdqJR9kLCB1BG9DqX0BXsIhv3Wx3BC5cKBP9
	0egM52VaGqL9w9Pb2qT8074s20tgWYAPHaL5tSau7+Hsy5UTfKGMi3DLKaGrgGgvmsTKBucBzR6
	I5BALYocmL1RqZEO6UvLHc0xH1L2LW2+K+rRtIcwDq7kQZqD+k1IVLPt0w2BwnEhVGweFUq9QCJ
	U7RRx/0ri2Tcgj3vdSfFUKbrBSyL1fOgmuKcs52X6V4C7/hTW3sOcs/KxjdvG3Jy/+jnt9pkugU
	8ibNPk5xSERQAuxZla1GsYC3sMmc+2Pb7hawf/dHloYoOxvirkx0zPLRrguKQtU/NRiAtzlj9mE
	pA0u7KVDTyqPjy9QNEAJLtzf3yAVYU7Y+O178C/kAJrEOhWFAFmcX9/n1bXcZvUT9aMOqN1T9Ad
	Z0WZFnKzGjNqPPzzaRpiM/rZQl5yaoLs6A==
X-Received: by 2002:a05:600c:6308:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb55a68492mr112151695e9.28.1794650540956;
        Sat, 14 Nov 2026 02:02:20 -0800 (PST)
Received: from DESKTOP-TMG47OE ([176.41.25.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm10520184f8f.43.2026.11.14.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:02:19 -0800 (PST)
From: =?UTF-8?q?Ali=20K=C3=B6se?= <shroot1337@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	rppt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: sm750fb: Clean up helpers and fix DAC power-off handling
Date: Sat, 14 Nov 2026 13:02:04 +0300
Message-ID: <20261114100207.9124-1-shroot1337@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series replaces the set_DAC macro with a local static function,
corrects the DAC power-off bit handling, and removes an empty software
I2C acknowledgement helper and its ineffective parameter.

The first and third patches preserve existing behavior. The second
patch maps the extracted 0/1 DAC state to bit 20 rather than OR-ing it
into bit 0 of MISC_CTRL.

Based on staging-next at 6628e7d4c6b (Linux 7.4-rc1).

Validation:
- All SM750 driver objects compiled and linked into sm750fb.o with W=1,
  CONFIG_FB=y, CONFIG_STAGING=y, and CONFIG_FB_SM750=m.
- A standalone mocked-register test checked 72 DAC state and register
  preservation cases: 36 failed before the fix and none failed afterward.
- checkpatch.pl reported no errors or warnings.
- git diff --check passed.

Hardware testing was not performed.

Ali Köse (3):
  staging: sm750fb: Replace set_DAC macro with a static function
  staging: sm750fb: Fix DAC power-off bit handling
  staging: sm750fb: Remove empty software I2C acknowledgement helper

 drivers/staging/sm750fb/ddk750_display.c |  9 ++++++++-
 drivers/staging/sm750fb/ddk750_power.h   |  5 -----
 drivers/staging/sm750fb/ddk750_swi2c.c   | 19 ++-----------------
 3 files changed, 10 insertions(+), 23 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

