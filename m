Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1548C3E3C79
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702753; cv=none; b=Mi1RHZOYwWu8r4lDKqO1qXtYuIWu8KTcAxgWd9i/VAhkU6Z8ab+miQyH1JrFeVX8jVRtGisN+mbjg728FBnjobqCcmCw9b0Pr3o6VB6s9lpQUi6Qb/JOrvjYkePUxfQVSQhcvbnBKwEZiQbYFtcSMqkJ6hH2WR7QT7CXNmMsggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702753; c=relaxed/simple;
	bh=gfO1Y5Cvx+draxMRz7VV+taVU8+4zXC20+dPuEQlJG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rQLMy+vgqXUfxfJXtIaYdimAMn90sNqQId5EAtS6Eche5h3p0JesCmxNWFRCpzLsBNIYFIvbPClSXVb0kw7EdJZX6FH3pAljga+/6/2MKnSefMTcdIYLyOlN4UNinym/WioboBYOim6yxtDnnp7F8bR5/CcTpbKdNSlUH9ZBCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fELTCjhx; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fELTCjhx"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso6199827a91.2
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702751; x=1780307551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=;
        b=fELTCjhxZBqkTxwuDFLo+3xzXpOPmCgocJ/bAsx2apdl+l9GNfUg0sqsIHO5efaQct
         jb+LLg9fuhDlzOjUteOSkU32KpNXjrZ7hlHxBseBXbiZXzbaq//GoL4DhvrLZefRrSBc
         RtiDfxiTf0RCBbVhs3lHClJMMmbOPRE4xljZY8v8GMeKQ6nOb5IYXKGKSana4ZeUkx8L
         9K0qC/GLZXP3+rsricsY25ww/nH5bTj3CWaOXnBiZcl2IKepnIDu/5QfUhyeFco7orU8
         6z9XDIBelubWBj/UqVTSGz7s/rJrRkqYaH9mfNCSm4gGMknGAOn41WQbywGYnmCZ3JJM
         eruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702751; x=1780307551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=;
        b=WOEAjZeM+vrEIDeUTLKmdbDgSaDDoCI9B3gGJEvyMQDFrvSiIpWSVydC3jBICgzhVv
         ieXFzgU8jjidGh0J6GacW1JZ0DiQIH13GeNjq+VF36OqeqBp6Q3Wk57+OfENxZ6CFZAw
         xyjbU6KpLpRM++WHICyDvcVvmoNHi2JLs2/xJ7y7CkAZW60ixZhMqkfkMWqZcdTYPFdB
         diT8QXlhLc0aKpamw367dDjMtr4ETXsPgYxZnUAHoexKspXNrEyYQ47h/03rhzqwxfST
         L01wGV5+pQrJwRS2Z5g1WVH0dDEGtwHYMs0nKTITK6ZWQB/Ujzz/9Dbl5NRti3R25yl+
         8faQ==
X-Forwarded-Encrypted: i=1; AFNElJ9C24UfNJef2vRvebVa86+2aQ8t6MblcDKYRvPPAcFlDxxWdxTkpPJv3h+zxm+8dvqXzRk18KMgfKR/6iQi@lists.linux.dev
X-Gm-Message-State: AOJu0YwU8kIhsBV8NjGMwzG8zgc1yn2mzSVY+Gc4Jun3p1tReYupkT7+
	+GXU+4/yPLjwkTmJjVbhBwNCXeXeOLO3WpAZ/FYmtwFe+7vnawZVXQC8
X-Gm-Gg: Acq92OHiMo0U0s5Kqg3JV+RzmfQI8cMCL1Qo0PpLKC4T1dCXpS2orgnXGs07D2hFKt0
	k5inL9WrrcOs/cbSuGL21MgrAIWzSirTnNj7VIxPKl1x0XsPS51q0TK1ADrvoNB90eu51q9h8xC
	PbEs9sVCHqCbsv4Px8im6ww0d34puPed2HYDvRv0sFtrhKCYqQuRLEHN3GQTNAWJCMn4T4N/s8u
	/m3yPIU3ew6r4wxrMgAFmrURXqI3odKA7FT+nJRdSK+IUnPm/3hRmkDb3WjIcGrVZY+zecNyH+V
	5JQ6BTLb5iM9Jeq41LvU3KMasuQd8iuP68TKxEcPbu+M+6IHekhXH76/0eYJkJQw5mH8n9VsY/e
	u8/8RG9bKx8iVx93tVrykIMj2JlhnvwDIPhcBQgqt/DkvMRRNG3NgUuavEcMg92jlU+KhEbUKz1
	rYMfyS4E2XIobYwU8CTAlC
X-Received: by 2002:a17:902:ffcf:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2beb0385f3amr153090915ad.13.1779702751312;
        Mon, 25 May 2026 02:52:31 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:30 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 0/6] media: meson: Fix memory leak in error path in vdec
Date: Mon, 25 May 2026 15:21:48 +0530
Message-ID: <20260525095216.12078-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V5: Changes 
Following chamges try to fix the memory leak reported by Sashiko

New issues:
- [High] The newly added error path in `vdec_start_streaming()` leaks 
  `sess->priv` when `kthread_run()` fails.

Pre-existing issues:
- [Critical] Race condition between hardware power-on and `core->cur_sess`
   initialization leads to a NULL pointer dereference in the IRQ handler.
- [High] Returning buffers for both source and destination queues upon
    single-queue failure orphans active queue buffers.
- [High] Concurrent sessions can bypass the hardware exclusivity check, 
  leading to simultaneous hardware programming.
--

Reported-by: Sashiko <sashiko-bot@kernel.org>
https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/

V4: Changes:

Following chamges try to fix the memory leak reported by Sashiko

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Reported-by: Sashiko <sashiko-bot@kernel.org>
https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t

Thanks
-Anand

Anand Moon (6):
  media: meson: vdec: Fix memory leak in error path of vdec_open
  media: meson: vdec: Protect session exclusivity check with lock
  media: meson: vdec: Set cur_sess before hardware vdec_poweron()
  media: meson: vdec: Handle kthread error and free codec private data
  media: meson: vdec: Isolate error path buffer flush to the active
    queue
  media: meson: vdec: Cancel esparser work in error and stop paths

 drivers/staging/media/meson/vdec/vdec.c | 54 ++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 10 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.50.1

