Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC45661FFE
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 19:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244092; cv=none; b=MBxHRvNGWCNwrdZqeVhDqquUJDUhOWQ+QsSoRQF4mIQQuO2tN342Tb1RKpQlOgruh9cfT6MTSLZ108IVlweE4cDcfgR2MxftvuQpt1kT+RKa/S6VrWfHZ0Mz79kvvkkSZBl8ez/ghUukliOSQ81sqNCVdWytZHVfUPR43bMYS5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244092; c=relaxed/simple;
	bh=KC18oQKSAWs9kywE6iKwkxctk8zawGZhsNw/Y9wib9w=;
	h=Message-ID:From:Date:Subject:To:Cc:In-Reply-To:References; b=kBmCkOU+oU2L3tSgMBtTenvtAKDmKWM6Cdc9QsMcFbGxn99N0VEhy+teClgdZORAZZ9fOd4lSQhLpcRZbPIZ6CUvDc1g332mZuinJoe0XtqNTa6yxGtYzmvpzsAbE0wCm2zGmO1/YvV0ZWfDmSZ2jBOfPDgybIhsDOoReBAPgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVjtHBos; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVjtHBos"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so218850f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 12:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244089; x=1782848889; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:subject:date:from:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TTX5JvYWXCfnby0ctQo6oD6WutWtaxCrVrgoYMRZzBY=;
        b=SVjtHBosNoPEq28OPtqs317pD+ey7CxYooYRj4SvJhNqDeXS8NxbOGrS9IbaRJ+pzP
         gN7WnAOtxAfJDH/rXwxkKa00N5Rt9lG/DnmDSmTUGLQ593rWMj1YoVrGyKf8sCP6cVmR
         xJ9UdZpgIW/NQ2vnDoe2l7wkvYD2hg5atbHp3m2PxLkaGp7ePtJGLecf0IZjF1DTH1uF
         NeunVmR27AnUoFPIcw0+iIQFc/YVlumIzVSuSgMqVIdZpVvzER16Is1LvEp7dgDNRWcP
         Z50S4O91Efu4npZzx23eE1dMe5Q1jU7hnGuLQEzeCWojocLZfa13w6Ml1opod66bcXKa
         PK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244089; x=1782848889;
        h=references:in-reply-to:cc:to:subject:date:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTX5JvYWXCfnby0ctQo6oD6WutWtaxCrVrgoYMRZzBY=;
        b=IuxspNiJYOG0b1VvPqHR8F8zPMGvkYSo+3HRJEXVgs6/xwZpArFArZ/o1RL+tg6oqt
         8vmdCSYsgqVVOgxUMvNDebW8qfd3vRI1fdndLlA7iECwmYYl2IlhZzXDSXD8Y4JGP5li
         OhBAmEvqYUm6UkNN9BLedKj1O26Ub5C6c/wUP/uKuA7Vh9AkZJsFPlPrGgeOduiL1N+S
         CP5oIJ17yY0HA5X6vXD+pYb3eHm/hiRQHHRvfAMO+ScBB/scWgMJMxhOIgKjPP2HV+rL
         LfWb+DafIW96QxpODYOVNK3yO1p8a4E+uVkqIdpYbHc/lvNvmSvDoHWuNY7TwOp2CLJX
         WgxA==
X-Forwarded-Encrypted: i=1; AHgh+RoLtgscVZK8HUGO6VA3EgQ6SEnc/HdZqaFlW7wW3KbxE8HktotPWwO4f+wfeGiLbaIulbSkugtuZvR3wfRO@lists.linux.dev
X-Gm-Message-State: AOJu0YyfzrFGoXuNVoz1L6NvWagktNWPKboNILQnHx/91N/DnwzNDUxz
	p1j2yjq7RCAeA5U9uH+hZcnhuCKnGxVUR3CvIdvTh4SqH9KuA1yKU3ur
X-Gm-Gg: AfdE7cn88poOoYCxDex/L3Qs0cmpY18qhZud/6TvwHrs0B7xzs1Vj56UiyyBLPeTceg
	skZLqr2iTOgxKyZrj2EVfOOAItkBfk1F0F9TWiihO5cUNTHnOvuDtWWkwlEQPJ0CNLYQB6lhdjs
	BaBA3UKW+VZn8/3EwRqjvwRFu6H4GbAEdd+yj6igLgNUS4Kp2g1PREZX2NykiNErEYll/HIbgdU
	BN15KXsmutqCJIjx2cSQkJsEVERcEaC7wvchyTkKbcob+PY4cLAvYHrF9I0tZJRG7KC6cKmSJtx
	FTFtt5zNjOEHimS2gBm23Pc8s3wuyKcQi421VHLU1lG7Hv1KTkHCjWsXA15GHRLTLygKlazWj1j
	emNYU+6KOCabIqT956AgeZSOBSzslOHkhXH3zyAL5ZxA6tyrnSIY4qzhiE6mCWYwMgpnCSsj4wZ
	Kp7lyrgk3Hm8YryIBQVEMKoKxiKsrjOxuEj+ompTggDfhJloRIklV+tNzdjIMeKGYheQ==
X-Received: by 2002:a05:6000:4202:b0:465:d0f9:95e3 with SMTP id ffacd0b85a97d-46c0951d9d9mr431562f8f.19.1782244089034;
        Tue, 23 Jun 2026 12:48:09 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466667881bfsm40346658f8f.22.2026.06.23.12.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:48:08 -0700 (PDT)
Message-ID: <6a3ae2f8.cf2df9a4.132dbf.1a50@mx.google.com>
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
Date: Tue, 23 Jun 2026 22:46:07 +0300
Subject: [PATCH v2] staging: most: dim2: use dev_err_probe() for clock errors
 in rcar enable functions
To: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, error27@gmail.com
In-Reply-To: <20260623124243.1245-1-batuadatutkun@gmail.com>
References: <20260623124243.1245-1-batuadatutkun@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

rcar_gen2_enable() and rcar_gen3_enable() use the old pattern of
dev_err() followed by return PTR_ERR() when devm_clk_get() fails.
fsl_mx6_enable() in the same file was already converted to use
dev_err_probe() by a previous cleanup series.

Convert the remaining two functions for consistency. devm_clk_get()
calls clk_get() which can return -EPROBE_DEFER if the clock provider
has not yet registered. Using dev_err_probe() suppresses the log at
error level in that case, avoiding misleading "cannot get clock" output
during a normal deferred probe.

clk_prepare_enable() cannot return -EPROBE_DEFER since the clock handle
is already acquired at that point, so those error paths are left as
dev_err().

Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
Compile tested only. No R-Car hardware available. This is a correctness
fix for the deferred probe path, not a response to a reported
user visible issue.

Changes in v2:
- Mention clk_get() explicitly in commit message
- Add testing note under --- cut off line

 drivers/staging/most/video/video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8cc..1e1ff3c52 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,14 +33,14 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
-	spinlock_t list_lock;
+	spinlock_t list_lock;	/* protects pending_mbos and mute */
 
 	struct v4l2_device v4l2_dev;
 	atomic_t access_ref;
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
-	struct mutex lock;
+	struct mutex lock;		/* serializes V4L2 ioctls */
 
 	wait_queue_head_t wait_data;
 };
-- 
2.53.0

