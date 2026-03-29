Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B622D4DC
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768598; cv=none; b=PcIf71OPAhxKHIqcu9E6NmusCtOfAHoPNS+o2gDwBTh6QM5Ukrnm/NqD5KxYm9VP7y9wGFJ72NztLcoh1xCOcF8/BDHzmPDGT12e/oyhaK7wn7NrRLGUdabiNoN1BHtGGZww5Cu9466XNVoLS55RZ1an/agMQsLaQIyqTRyjzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768598; c=relaxed/simple;
	bh=SJRE/7KRsudcGVRZrVRgBTRMuVolyj6lhYLA9kgm5S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J92ttAibhS6TblGrIzunFPgMZOOYFgf73Q2gAJjv8mRYHpxlT4mWCvqIlxAxzRUxWxZavZZuDX0M4Ng0sZE1c20/j8IZPJYTNVvjLz2q6DozkejOnOH8OEZcadig8bdXlebd4A6v4QrxMgksZawKJ08vZ6AJinoCMyNarSeRamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bkh/TTdC; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bkh/TTdC"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-604f834349cso713172137.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 00:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768595; x=1775373395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toe9kpqOLmbJqv5wMH+Pbc9jMDhi/6HRl6vvRfImJyA=;
        b=Bkh/TTdC439Gp7olS02/8oIDzU6j3pEzfVf/mhAyT0MwNux/9Cx7vqomWfNUkHn3s/
         RbMYx6awMHaR/gBjkkbcfzgDFtaylE2d23T1FuOtgAkufy/XUN95bcz1Lti3XIScxQ6B
         T1izmNRTNeobSi/hy0A2/94vB73ezkV/veeTEQ5crceQb7o589SSpicg9GPqsR32fiS5
         8honWL1kK7mJdp+DQ3YfXdZB8iM62GsXmL8HRETMrPe+aOuK+6RHKpsEflbBRM2xY++A
         xyVIhpgrSHo6z1f3Jkpw2eBZQwQy4R02wdw8q8h33Ti0roXZPh6rj7LlWijmhTTEyhpG
         KrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768595; x=1775373395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=toe9kpqOLmbJqv5wMH+Pbc9jMDhi/6HRl6vvRfImJyA=;
        b=mxXQqVN4Qhorgp3a8aJUE+Now+E6vSFMu0O/9p2+097Ob3Vb7ieBM2AtA0fYmoQ1Ow
         zRcIj6KqV5ZtcZCjVrxlazsBJNniz3ygCYZZxhb6vTwaHbJ+zOYT1ssr+IwSplktF1cw
         0rpPS9p4pTsVREpSMiq6aUsAGPeaqJaSx+XFkesHXBdThZSyd3ZwIT4Mljqow4Zoepzt
         evNqc/qtdRnPDOmV/F6qR4vp7Q0Ie3fX07KsCihnLWpgm7nYhXvRRE+o224xx65YbaVf
         vVDs/zWscbYtbz6dqdEG+bYm31RmoGE2cLBp58HwiQIv+gTArE2+JGLp5BWeX5KsdM6J
         Yplw==
X-Forwarded-Encrypted: i=1; AJvYcCVKL6PmUxNEMIvVhEozmNxUPbRKH0GrSKFiUatmnsCWxm3zXwlJicPZUPclLm/hV4qQm/hZwGnUS/7EvPqz@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1KPmPjgc/NsMQJ7wb47HXojnmmDr+LiOZfmf7XF9XeExQoDOE
	NFJos2brsirvNKfjAEpMAH+ANZU6YlikThZeUZZVeQnj4OK4HheWaKRt
X-Gm-Gg: ATEYQzxpCJuj/bx0BLEQrDcYRge4AUdMiViAc7ZFaQzxvTXkgRIgJ6iXTUAk8frvtRG
	QEQahTXbvR1P5YZnV6cwLG/l+FE6qg3Fu6MS/DfkZb9Ot/DwwsIvXaiSPVSEA2GGyu1tz6MIYhH
	b4Yyy57ywXKEI9pqavHVWRUlpNHwagzMPL8GeP1sKPzYg37jVuUGLujslQD4xdtBMGrwU2gnPeG
	1PvD2yL0DXLe9yBLcREpIB4RoYOl9ITNLFwtOgNJEJk4a0Porsx19H1dSCk0GZlpV5M9+xr1+yL
	TEea5BkXfcNxxz6htmDWOW5A7xVd650cVq9yKDWO1vcytNdFyb3sDlzU4LO95HauqSfcS50YdBH
	fDMhBOBiCR6q9KR3QcCUz4C/zUgtICdSP9UOTFN7IwZybZkZCKGJaDxRhOiSCkyRNJ94imYSwmo
	8XA1D6LIH1MCrJ8oXXInOHOiSD
X-Received: by 2002:a67:e111:0:b0:5ff:2426:94ed with SMTP id ada2fe7eead31-604f92960edmr3008410137.28.1774768594732;
        Sun, 29 Mar 2026 00:16:34 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:34 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] staging: vc04_services: vchiq-mmal: add buffer size check in inline_receive()
Date: Sun, 29 Mar 2026 01:15:40 -0600
Message-ID: <20260329071616.507876-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

inline_receive() copies payload data from a VCHIQ message into a
destination buffer using payload_in_message as the copy length, but
never validates that this length fits within the destination buffer
(msg_context->u.bulk.buffer->buffer_size).

While the caller validates payload_in_message <= MMAL_VC_SHORT_DATA
(128) to prevent overreading the source, the destination buffer may be
smaller than 128 bytes. This is inconsistent with bulk_receive() which
does check buffer_size before copying.

Add a bounds check against buffer_size and truncate the copy length if
it exceeds the destination capacity, matching the defensive pattern used
in bulk_receive(). Use pr_warn_ratelimited() for the truncation warning.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 9c6533f82..44e5246f1 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -368,12 +368,26 @@ static int inline_receive(struct vchiq_mmal_instance *instance,
 			  struct mmal_msg *msg,
 			  struct mmal_msg_context *msg_context)
 {
+	u32 payload_len = msg->u.buffer_from_host.payload_in_message;
+
+	/*
+	 * Ensure the payload fits within the destination buffer.
+	 * The caller already validates payload_len <= MMAL_VC_SHORT_DATA
+	 * against the source, but the destination buffer may be smaller.
+	 * bulk_receive() performs this check; inline_receive() must too.
+	 */
+	if (payload_len > msg_context->u.bulk.buffer->buffer_size) {
+		payload_len = msg_context->u.bulk.buffer->buffer_size;
+		pr_warn_ratelimited("inline_receive: payload truncated (%u > %lu)\n",
+				    msg->u.buffer_from_host.payload_in_message,
+				    msg_context->u.bulk.buffer->buffer_size);
+	}
+
 	memcpy(msg_context->u.bulk.buffer->buffer,
 	       msg->u.buffer_from_host.short_data,
-	       msg->u.buffer_from_host.payload_in_message);
+	       payload_len);
 
-	msg_context->u.bulk.buffer_used =
-	    msg->u.buffer_from_host.payload_in_message;
+	msg_context->u.bulk.buffer_used = payload_len;
 
 	return 0;
 }
-- 
2.43.0

