Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD846221540
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768602; cv=none; b=mjDKV/t8VxJDrIyEpgBFTo7fb+wfDgM+b/V4/lOPGK++inrfIjklKMUK3wngxRW8pBp6mvtYsMkqNMjXLHiloxr8GyJHUicX7FpNFTO5PuXhEAmXXZvc1hsioTewxYpVROUrQWAuO6q5o07BzBLAqwjtdpNzogoF2A78rgpDMI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768602; c=relaxed/simple;
	bh=JfFn5dD8fXSM0/s/rgq34bUOJdT1IsgTK5+GKwn9EYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4RXawtAuyEef3Lp1LGMY996LA90KXTWM53r2DC+zw9kwNKq7S3mDn/eeLck50Qw92hOX5xVN4zehOknnCUwuxfew98iEsNmuAjaDPO5f2uB6Wd2igVm2UN+vntMdEbbkyYY77aZVdXAtmfET0wmTxgFpZLo95o1AuIlrUrN5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scIKdTNS; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scIKdTNS"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffe1c73287so1303521137.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768600; x=1775373400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IncM+rKcgmau4uVK2sm4qPStCq75MjSeVAISYr8iaEQ=;
        b=scIKdTNS9fn7hhhdbw9SGmpngxziOw++w17xDpLh0j6bVjwXzV5DR2i1bzMPWrE02V
         cABIgZ/hDnyN0cgNCJQWZAR3wMVosywPJ2YrQ8+/XqsjBd3zML5xdF96ppXBchykQrcV
         GQDBf5K7B3QEt7na9av8fvUvkbbwK0QCKqp/eNHzbO420DnImA2g2nRijVjz0VjLzE37
         Ot02+u5D/wM2NByMYvwt/B3nGZn3pQEw6EgyWNbFfQXQ9klo0zytc6wvjaE+qwnH6Z/s
         8lx/NDvmHRywqlUdtQkBKXxdOFUTSbWLErdjdktecsRLCaKO2Uwk/8tBLYRRXUrBrPCp
         KpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768600; x=1775373400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IncM+rKcgmau4uVK2sm4qPStCq75MjSeVAISYr8iaEQ=;
        b=s5vSeiE8VcyvO6xU5FWzEK/9Vom5wGetxJS7AFV8ljaW+mkuEIMLvbPFUQYlDTQXEJ
         Nq8La1GID/0g3JHveFskenmToG16Jej/yjHHB/NfF4HKPP64FYcQDl0JjFao0ktSa2cn
         gq3xp5MWAMEymqkaVgDVuw/fTLAJGshBye+rBJ2xOnAIiFmaLNfj50sQpxQ9UNr5rTVW
         zh46HsYj8Hr7OCjF3yqhRT3ctmvkUJ8rUhWhwksg+VIe9Pk9x5DrbB/zi86yy223uYO4
         83dvLAJLzyeg1MDG9rztE92z7MGEmsLgmRSGtD67RgY2621HBME6Qxcj2aoxT4uDH9Pd
         39dg==
X-Forwarded-Encrypted: i=1; AJvYcCUNJ32jlkrmwe9cwglgX7JJB5utoxkVX7UoX5Z5lTEFWuQf681EKGUrF0mf5JNkuTPqLOfB9QQlDP5ehQ2S@lists.linux.dev
X-Gm-Message-State: AOJu0YxnbO5/P6w32V7se5jZq3dCL5hUbaibiKYZBfi4JFDH0Rzpq1QC
	50uCI1BG5KPel/2HPzfCZaVQ+OSwCRVZHRd3riSzurDRdKoXAJDcUcK9
X-Gm-Gg: ATEYQzwnLkhGag6PCIkQA5c3FIwcg6D/q9amhSUYfmVLiONrSV3vXdMeg5Rz7Qf3tMG
	FLyPYiv/L4ZM9x/Zg06iQ1wIzWv1uvbyv7pzc0dPKu+NUesy6ULD/a0HoYKMPBOp9Ci3DC/YSRw
	9OLooYlVgHVuRM8BYukYs0gqjGyaAKpK/NBd+sNDphiALRgsK/ddBqlrc5PbC2GqBCgoyNDe0jL
	SrPGzdBH0VRzKgGDplrR+aXu0n1T42BwBeasn1dz6/qS6bgQpMgQ2MtTz48W3YysUZDmbIRz4SM
	0tjQG0HKAbt2dtmThacSwEynPQu42OvjXQ0pUAZ/EcRBBpn0j4w7nQmSZDC8Bc+xAJB0z+ztlYa
	M8F8ANrr66iApTaC8gPowWD1oBMeZli8W3DWnFGA/pTbmCOj9A0EF8tcV5f2s5BaS9Wuk38gaWF
	woC324Rh6UWBQ2lADm69imkhE2
X-Received: by 2002:a05:6102:41aa:b0:5f1:b7b2:8929 with SMTP id ada2fe7eead31-604f90e520cmr2908812137.15.1774768600043;
        Sun, 29 Mar 2026 00:16:40 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:39 -0700 (PDT)
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
Subject: [PATCH v2 4/4] staging: vc04_services: vchiq-mmal: fix integer underflow in port_parameter_get()
Date: Sun, 29 Mar 2026 01:15:42 -0600
Message-ID: <20260329071616.507876-5-sebasjosue84@gmail.com>
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

port_parameter_get() subtracts 2 * sizeof(u32) from the VideoCore
firmware's reply size field to compute the parameter value size. If
the firmware returns a size smaller than 8, the subtraction wraps
around to a large value due to unsigned integer underflow.

The underflowed size is then used in a comparison that selects the
wrong copy path and stored back to the caller via *value_size,
propagating a bogus size to subsequent operations.

Add a minimum size check before the subtraction and return -EPROTO
if the reply is malformed.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 18e805b92..f2bb5ce0a 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1436,6 +1436,10 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 	/* port_parameter_get_reply.size includes the header,
 	 * whilst *value_size doesn't.
 	 */
+	if (rmsg->u.port_parameter_get_reply.size < (2 * sizeof(u32))) {
+		ret = -EPROTO;
+		goto release_msg;
+	}
 	rmsg->u.port_parameter_get_reply.size -= (2 * sizeof(u32));
 
 	if (ret || rmsg->u.port_parameter_get_reply.size > *value_size) {
-- 
2.43.0

