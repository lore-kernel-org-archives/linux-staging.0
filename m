Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208151DF987
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178355; cv=none; b=evoujh7g474Fri6RtuMuSz3OdC3wDDixqKzAM5Wvl5lv9/IqQp2jnt5X31ckYUDRlPMyTMhdgTB3uFxvQL/W2jMgdfw7T8zPiVgbTF/HTyvWEiWO32cFXfksk9YgFzyaFNAtN+MaH8yHaPX/0AIUn6RvPPGaBQOAyxSp2eXKw0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178355; c=relaxed/simple;
	bh=GCAMB7IyTb297JpowGEBrQLbjSUPow2wpDfCSxuGjf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAAOvEqJcXLMKxbw/UWebziCki2ndIQaaNvToggZNcz+DgbIzLltqPY34bMLZUqFDDtmaeUb5/VVxKQbmlBA9J3mL/8Q6Y3GTcD1W5ltG7xEmUIL8aTSRaA8bXcBPUUWt9/HzOGfJV/DkHWzpqg9Mlh/6K5Ahi4udD/o/knZklg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=PuXKAG34; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="PuXKAG34"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224171d6826so90383965ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178353; x=1744783153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v/NOtquRdRwOPT8OcPE89pweXS9CADmxhep3BQdI6I=;
        b=PuXKAG344VCcg/c3fnLJQcU9B0RyooH65KJGhV3db/12bcGPpbf29woqO0Lk7JYMvf
         Swki/L6OFqWi8F4kmT25mORQSE//65rtsokgCfzlxH8Nzq6Hnup01g0UfyUydDn1xck7
         ohDVE9RaS+NmjTq4NUu7d0woD6kbkyKNafsaqy1oLhopbWbd5xM9Q7a26uLiOQht52Nl
         YHaUyLAEhQ9MNoxb0KDAmY9o75Qqqc0qWkkzZlXGYOsgpWqS65w9RpcayaRxq4YK2uoD
         jNUq11s07Y+sVy352E6Zw9StKCfmqaT8Y3CmQsCJwF6CZhDcIV1P4i9rR7L5cEo547hp
         aBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178353; x=1744783153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v/NOtquRdRwOPT8OcPE89pweXS9CADmxhep3BQdI6I=;
        b=lVlDjHP2A0mMi2c0SySDBb0sFDKkcjF1JDkkZTA7bhEjYCUbN2ml70DoMfsG3vHcEZ
         ywEXLoosW1kiHopSBJdla+PQYHL+CNzVfbdqfFzU+8sTlxFqvAwubb3OQZ65Nluhh58z
         xH1C0o+aInwV/GqUp+BSa9zCzv5PvxDdgs/g2tjwgyrH2xdGpHMKq+OMP/Ajs+kj+JjN
         iFNna9ule4OnsObLqjHwh37qkF44uMGsU4TbsLEIrS9hP6rAQB3vwZLpVEF+VPl25fI9
         FXxC/V0XzyclTNRY69hlkQxnGApqqh6rsRIU6E4UA2YMx0WXehX9iYgGXixGkhlQduep
         pnQg==
X-Gm-Message-State: AOJu0YwbQe+ZaZxMo1YRmb+qXLvuOjoGE0Te7ep5U2EQitI6qwwJaWa2
	6t5Jmm+DuLP9DCy3ctJ8QmN8GigssQ5eolpYT1nMEdGpUXLXZkTHBJcP6aQ0v/kqfFcNSmCrvsQ
	=
X-Gm-Gg: ASbGncsRmfH6SwJ8dTfCUanIYYqmtyRyTwNxfbWO6dymdZLlY3l48CpIZI/b0qGH3sX
	cvT5aDAuA9WvauMPwI5uA6Xh4y1sJRF2qHXmEzmeJEwRFbCB4S9vEaGOaih9ROWpyHdZSC5cVNE
	dypmtumPEfyKmc82kaXpenC/vH13nClkMF/ZdDRu6VJmaHL/9mikLIP1nsPzulqpZP6+nic5gf1
	qvfYRXljDVRLAKRSm4AOd1E2m9KOEzzmvKqWdkRpVZXwOLf/iq1XvQjyQVFIZobsVTvoS9Fmplz
	/Xx4SY5y/3rBZiPpAMz5oJsKDy4o8aYYg4AvCcxFASPwKJHt3nMW37kAMyHGHMdAaHY7plqaAdr
	PIjlH8A==
X-Google-Smtp-Source: AGHT+IGyQSwzezThuhQv4lKEAvpv0AlE+n8nH1TjmcTKbI2mn0DR+loA/oAzlkmtKflBXNhFmW9+Fw==
X-Received: by 2002:a17:903:2292:b0:215:7421:262 with SMTP id d9443c01a7336-22ac3f6e7e9mr18111295ad.12.1744178353406;
        Tue, 08 Apr 2025 22:59:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8af2dsm3477515ad.69.2025.04.08.22.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 06/21] staging: gpib: Using struct gpib_eos_ioctl
Date: Wed,  9 Apr 2025 05:58:48 +0000
Message-ID: <20250409055903.321438-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_eos_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 9f7becb09e60..bbf8a60978d1 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1508,7 +1508,7 @@ static int sad_ioctl(struct gpib_board *board, struct gpib_file_private *file_pr
 
 static int eos_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	eos_ioctl_t eos_cmd;
+	struct gpib_eos_ioctl eos_cmd;
 	int retval;
 
 	retval = copy_from_user(&eos_cmd, (void __user *)arg, sizeof(eos_cmd));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 9be3262271c5..3f32eceaca93 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -42,10 +42,10 @@ struct gpib_serial_poll_ioctl {
 	uint8_t status_byte;
 };
 
-typedef struct {
+struct gpib_eos_ioctl {
 	int eos;
 	int eos_flags;
-} eos_ioctl_t;
+};
 
 typedef struct {
 	int handle;
@@ -138,7 +138,7 @@ enum gpib_ioctl {
 	IBSAD = _IOW(GPIB_CODE, 16, sad_ioctl_t),
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
-	IBEOS = _IOW(GPIB_CODE, 19, eos_ioctl_t),
+	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
 	IBRSV = _IOW(GPIB_CODE, 20, uint8_t),
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
-- 
2.43.0

