Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7587360EF0
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 22:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781907553; cv=none; b=VAi5S7g68UHmDXtiyW4oLR1zcb27D6KuiwI5wdMtCuTuWn5Jz2SCVTde43R4xWJHzLdT27JiJjNYaku2cKBQhgWe2Bh4OUQV2Wb2knNPjqv3lvJPVhxSRGEsNdfNrj1hLjlgW/1kLSiCUZg6+4Vw94k2nbAhcUw7EPs98/jGrMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781907553; c=relaxed/simple;
	bh=DdEzNGXBbAJlLKvgKj8MWaMVC+JVtLzMufbPuNq+nrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwkeYKW+ecErqszTLtUpX9jiEXNi2TFEPQxwHdRLiN2ept3/JjXhGEElJVj06oKKwlTkKN5Z76WR6gCFZ3aIDIjGTz7IOYEiMmjUcAtve3oQ7vvAJCgiwuF9A3MAtFdR24sznC0NDYIun7VtLQ2sJzsc3EdnXwrnM/ZPC2ve6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEd3E5qB; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEd3E5qB"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69690062350so1727405a12.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 15:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781907550; x=1782512350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNj5JOnCEdVFcw3tVgjzQE7ie9IkNhVYMnie8GeBSUc=;
        b=DEd3E5qBKW6OGZPiPYcYiECcoJ+Wih0bSlOi+a0ckhCXfhycGyPmCADF2MaqCe5la6
         hqN8eV99e/tC6iZUrD3DYdj3aNKPrlej78J0zab1ytHVAH3J7jmixrA/54r6eqeLi3cN
         rVEfaVFtfQdBt9TDIg3/NxIHHgpCTk1zPDbzd9Hp150Wuq2c58lG3ulo8PWHjetVO2zC
         ZCFYf6BbEB3CAfscumja8VBxr6qrUDeX71DdTxUTLFyY0vXsu4lP0MyslP0th5L+LNCF
         PML7pGm787ogSe9SI97Wv8ljYfssL6HuspOYT8EcC1pQ8btSrRTWWEvqheJeJ2BZXGx0
         3WOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781907550; x=1782512350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNj5JOnCEdVFcw3tVgjzQE7ie9IkNhVYMnie8GeBSUc=;
        b=LcmU3bcaNKFH94XRSyTFRkl0KjSeKFEFtU+atGqoi5vc32gezs+UcGETs1w1IzwuJ2
         34KGcYBdgexV2aI5zBzTtXa2he0XhWw9Px/5vdQ3yB8isWA2PfDp+9zOMCYTQIIg+syj
         6y0CshkY1wZVZf1fuMLSh7PWTdEK7hr4Sn8zmIcLJW//9Pq0JHVScfE45FRBBhHbex5V
         4JMjS/uyXw+9+GJEX6MRXzP2CVF5PtBU5X0pLVurh9+aDnSfSF1mfySd8Qp8wu7omy2i
         DmY/YsN8qp0s1eks78Vfxbw3f3UUxu4JwnyedtAdhFS9OWGlT946irzYVbyCgt64/KCC
         v6lg==
X-Forwarded-Encrypted: i=1; AFNElJ8nBLOqbA086EDw83032vz1FDQ/QhP93+0IeV3P1lQn6iZVYA5SdI24pI3W/Zm/Ms9JCMq2lOJG2WiElzy6@lists.linux.dev
X-Gm-Message-State: AOJu0YyZhKAwXPVCO6wk8KW3LDCDMpze4PolzOPLkJbe8GXSGfsS3P2K
	GgeHeZ5f7iZowvdd+Q1Fv0dWyNtLvRzNt70SD0qgDby6Qh1aKJpBGDtDiv0zL9+LYUjFDkVX
X-Gm-Gg: AfdE7cnX1MomiZ2PdYoMoJeuwARHGkHq89+AZWn784te76vHz4JDX+QA9krdHJV8iGp
	secyrIZgyTAFZ5oEKK7CKp80QA1f9z6tGYF/ckC90QT3ZW8SczkpDzclsAaHg4j0dos03zIZ7Hn
	LBAAOwpl0IWze49OYOq2coQHacmVQKhO45l32vpEq/AvfL0eeLNrUhG4iZKj+w6fj7AEvZWR9P1
	h5aaXORW5Q2jmxRB6LVBq3ux43LGv+WRMsAZXuDW1PU+HHIayi8J23h7yRcx64D3D17geDGwf97
	bBlKXwcsqLkW7e8SCNNKvhuYvhuScwNhKB77bM9AI1nowlotyDHLcmFtxypQRes8XfsH4kPXoKr
	wI6hE/3fPuaH/IGC5nhDtB/jBeqZy0ADqhA2L3XrjmmXQR9Ul9wgs0677L2OdrNya8N++QOX1yR
	iY64gk1Vd2DY0JsatV0Sahhn2Ailm0nZW4iC1/l3SRMekMaW8=
X-Received: by 2002:a17:907:934d:b0:bfe:ed06:5a15 with SMTP id a640c23a62f3a-c098bd62af7mr321921166b.51.1781907549959;
        Fri, 19 Jun 2026 15:19:09 -0700 (PDT)
Received: from adr.. (212-8-253-73.hosted-by-worldstream.net. [212.8.253.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49b77bsm28513066b.2.2026.06.19.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 15:19:09 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH 2/2] staging: media: av7110: refactor av7110_start_feed to reduce indentation
Date: Fri, 19 Jun 2026 19:15:24 -0300
Message-ID: <20260619221524.51814-2-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619221524.51814-1-andrem.33333@gmail.com>
References: <20260619221524.51814-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The av7110_start_feed function contains heavily nested if-statements,
causing excessive indentation and violating code style guidelines.
Refactor the logic inside the DMX_MEMORY_FE case by inverting the
conditional check to break early, reducing the indentation level.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index e77be16f442c..2e32acf897ff 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -942,16 +942,16 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 		    (feed->pes_type <= DMX_PES_PCR)) {
 			switch (demux->dmx.frontend->source) {
 			case DMX_MEMORY_FE:
-				if (feed->ts_type & TS_DECODER)
-					if (feed->pes_type < 2 &&
-					    !(demux->pids[0] & 0x8000) &&
-					    !(demux->pids[1] & 0x8000)) {
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
-						ret = av7110_av_start_play(av7110, RP_AV);
-						if (!ret)
-							demux->playing = 1;
-					}
+				if (feed->pes_type >= 2 ||
+				    (demux->pids[0] & 0x8000) ||
+				    (demux->pids[1] & 0x8000))
+					break;
+
+				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+				ret = av7110_av_start_play(av7110, RP_AV);
+				if (!ret)
+					demux->playing = 1;
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
-- 
2.43.0

