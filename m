Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68511F4611
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765371; cv=none; b=tOQFQlYl/6BQ1sG2n5aMGAetiBkMavRyh0mOmpJdQ8N27Rk2MYAXetzfgD68dM4/fH/7/vycbZb0zC9vm5+HT3jWNWeoSeffWq6nfBrNFSUtkZAx9qTOKifVNlssFYpCO51AZl0iOjTIQrE1wUtv6GTXHMSFEcYrFZ/iLB0e2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765371; c=relaxed/simple;
	bh=kO3cHKvxWs9h2ty+QdXQbQN52ifSHtoJPbXeuqCapSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kn/JQfmw3RuNMSX9Fi8IlaXaivp6VOLUdiD3KZMCZi+x4fqX2xhO+nXzON4PdYn7dO2Es/1SUV+u/ri5JP+iO3T+W8GAnvuhSdcdElaf1kVII+UyY9Fec2vQMwP+TrIfG0KHujIQkvatSrSCBTAqkU4+UR1f19KePmIgY75pwig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkV1vMKl; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkV1vMKl"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-951a4e8d1b5so997000241.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765369; x=1775370169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2/8bJbSlzsQgyqyE2qlsA0InSGRaqOGGPVG89RGKtg=;
        b=FkV1vMKlqgc7icxFbxjpHyDMB9jXDJZQ8pkACItocGPoHZEXLnaX0CH+Fcwbi3uxjk
         IfH0tThPqb+Ry2hdLJZiSs+9FPekk/2fx2uVdG9MjKmNxVI48XTA/U1qXm0nYiNkGLnC
         wBnRP71tcZFXCshRivGgU5glcJd9LZQ0mwoCug3u82L+e0Fi+5lLK2s39MoeXBekmegJ
         JloC+7in/iYtNFj0B08GbYt09CwikIPUksS7t/ko3iCF9VmJlJbzinsMrrDtUVprto+I
         SEjB6gHIeBj59Bn2W4/Dgemp9FjuHEt7gOduKBIFeOKweRP38OgjcdUE6Y/0wwHLkMrT
         tBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765369; x=1775370169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2/8bJbSlzsQgyqyE2qlsA0InSGRaqOGGPVG89RGKtg=;
        b=UMbNIdLODi7AaR8xjzA+12Z/Jq1JQZHp2S2Ff0w5NlazUXzjh/YZGAWUw7mtgtWgd2
         0XkVM3trtRFVaukblvRab5DTLej4HRhqwE8QhZ8piX/H1IFA+ProSFwGo7Gz8eSqHfIg
         Xq07aDS/NvT252zJMl82WYOeedol6p56wuo0uc4vaVn+wExM7ULA6/LZ/SIw9R/h63GR
         PwkYECRTJJ2IxNUYVWIfkzOh1HCW954+07CJ5EVdBlo1pHninL1SXpz+BRg6tRORu7oh
         FafWKIUOUZfeZ1/EhJwajMUpCiZAL6HksTdIGcnrScIPg+8SXF96QBXxCFu6zolW/OVB
         xm3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1z9s+m8zYc6LWALphQM2ukhEW2CplipXkkVEcCinZHrm6eFfxbv2ViLtP8oRAqBcaX7OphsRm9QOAEpiw@lists.linux.dev
X-Gm-Message-State: AOJu0YwXEqtvClhrBSFAqp1qo1cBiHzqflXaHy+rmtAFEBdyFOlzO3VZ
	NaB7BDVQ4Tkho5o33dhF5LC8jJYyD5t32QL5N7Xf7nNhrmCDCfzqLsmR
X-Gm-Gg: ATEYQzzR19DXnGoaFEtNdhUXhjAjLsSCtRDuNOp9KShp0DvwSZb/H+NADmpLcAp94oC
	pNHtAbuE9xbpMnXcAHUAleh2numU3JDbU5Sxk/F7JB9va5qZdzLfA9s9eSq1B0D92JEhUVD6J5I
	acjy0FFkZQeasqFVCKgsCrqUCx3H0pvrVyEfumbe79HNxnVdQAzwCPNvXTrbtpaGfN4ghDkNKzC
	Hs/DoUac9idEJphUQWt1MXBR5QxoO5f64PTDo8fEAw2DJ/OC5obH6qWvYy+eE7gpYaqlFuPfXci
	PDYUHf03aJf4ZR2qVYvVDvSU7KW5+3ngPQy/5BZCYl180Hrn+86SAlS7rnwPbirl9hrv4EpdgxR
	F4SY7+N3Avf1XyVwGnR9udDyT75R6NrhkIrlfk9V1qCSO3KdgGLje/L3Q4j14ifVW7GqoKpNPSn
	VM3zE8AAnOIqx+8BJUlc0Z3arYDXVLB0X5Nfw=
X-Received: by 2002:a05:6102:6053:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-604f928bd10mr2726527137.22.1774765368828;
        Sat, 28 Mar 2026 23:22:48 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:48 -0700 (PDT)
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
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 2/4] staging: vc04_services: vchiq-mmal: add buffer size check in inline_receive()
Date: Sun, 29 Mar 2026 00:21:12 -0600
Message-ID: <20260329062229.493430-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
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
does check buffer_size before copying. A VideoCore GPU sending a short
inline payload to a smaller destination buffer would cause a heap buffer
overflow in kernel memory.

Add a bounds check against buffer_size and truncate the copy length if
it exceeds the destination capacity, matching the defensive pattern used
in bulk_receive().

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 4772126d7..e18471930 100644
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
+		pr_warn("inline_receive: payload truncated (%u > %lu)\n",
+			msg->u.buffer_from_host.payload_in_message,
+			msg_context->u.bulk.buffer->buffer_size);
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

