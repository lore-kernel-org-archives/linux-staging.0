Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A3A27979A
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768594; cv=none; b=etDidmQNSoO6CnYaefADysZM23vq2esCFx7aJtPVMfoo5sn+cPWhgId718y+y9s3Sc9lgTj4q0KaUDsudg+Amf9qKLKT22THzXooQxClx23RLPRBK+iUyMZgHjCSTf9xQNBxqn1fvZ1rMjKMDJLfUDKyPDRiKDArlNdMIcN1Dgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768594; c=relaxed/simple;
	bh=nEeadJO/2VXHlqj2GhD2b9UbKa7ccc0BljwIKBpHWLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ksEnFtua/Phq6UqqDGJwsiXHE0Htg1Z92dmPObcImk6ujsv4q0zqVXm5ms3yGYkQ5URvD2LhMQIvVTrSJh4wwOdKXI9LziIh28ci28IUcmXXanT71hbeCLwZnjKm+rgAT+ru8Ko97iwfAf78v2ANwElZCsYF8PA2XXMclLSeYTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4MYXLhX; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4MYXLhX"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-60328aa10efso975212137.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768592; x=1775373392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSlLWkq4h8uaqpliAQo5iTD2HSvpKos26zajciLvI7A=;
        b=C4MYXLhXCjAvlUzKxRPLtib0aA1Jx7lJuF+2QROQ+KG2Q1YZyZThTVdMRrIJ6qhYBO
         bn+2Cpd7Fdg/yrv76HcOL+GH5N8zldtkj0O/+GqircukTiVWMkIbb7mS2U+yzsSsK8wT
         Ebixc6TwJTWWhC8+rJtyxgQrkGC5xyRhMcicAFZgL4SOn1mLiLizlODaKo3b7dw8cxHi
         zW2PDwDfw0o9SONdQZRIVJfP5xGgLQiKocAgGq6bo2pC4KCb5/aiWBUc8lLMs/HHtkY0
         gnXGAMzJeG2xBDojsd0oJH5gEPnpppZe9JFfX26I86iWQfV5XFJzQk3hujj00gnwaBwg
         G8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768592; x=1775373392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSlLWkq4h8uaqpliAQo5iTD2HSvpKos26zajciLvI7A=;
        b=gHf4t7gPeTINW/cpGoDUkr3ipkjh09x7c7isNEiqnQ3bbtkC054YjQkwZmJKPnVu6D
         gGIMha58myqfmfCuE3Aw77o6zwuLHsk2AT2de6xovv6vkvapVquo/DYGpLxqA/09eJaO
         E1PrLztS8uNFe5C4ANg001sjrBMF8Wt/jmIrFcllwpgEOjob2qGbK8yoJKYvF5qWF75V
         N76Ol9ElZQio4gZbLF2NdgJcrrySuC7KwL1NpwzS50ZNVycBpFal2NjUtNFbZCGaXsYR
         62ZPjhRzwv0hxL8t7HjWXfzBd3A+StmPCbFomqjAyl7WxSTd1B7NV4iM8tRZUgHkPsh9
         d7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmePw8TuCMIkHIPSmy6alKrMpfq/kfwFDW4KoFzVyJ2pYPDz4FiozDEj1dSzVvchbuhwV3XqxGBnVN22ws@lists.linux.dev
X-Gm-Message-State: AOJu0YyHRb6CHOf7/5m55JDRYlX+S0aV2rZFN1hMGel/DiQtcnv9pT5S
	/zbeTJdmcyXlu9NZTxIuPCfFY+KH5k8YbO1bI4UXfH30s++xx5UcJYTEJxFH262G
X-Gm-Gg: ATEYQzz9EDSMeHrtehbfbQyze3LZkq/PHwLg0DuQx9vHxeaxiKRnbxfoFaqRIa0UgtU
	1Oa/jzv4/GEHs/C1iK5qEtd5GGC4CaKVjQFtM2SoAQP6nmVh7SNGR1777dcHctK/4e0okmHrKyM
	rGilGLAXFN5qQffiD5v/+gSTio4/McysxxXAvsXkiuD6e6BdxLZgUhn59z3k7HPw/GABl36FILa
	zOUMwYVoQvSLAsecHEhJYC2eisc5A0qWyy+ClcBG/nr3XDKt2ah3dDSealD/21/WMvrTQfvpwmz
	Y3lZYKviS2RlwupUXDuZLykQZWOpF8ElVAlcgCO2mrt/QFJtwwwM0W6M6kth9i31bajIJ2ZViMu
	+jN+9VGS++Toj9Q9/KVQVII2XnejRl1LzDJCu7Q2vO9JncDr192IbpU5BHaQ9Z2FgGCPPEhyTiK
	6SiJJ2ADXemJ/Z2bNi82hCYECP
X-Received: by 2002:a05:6102:4421:b0:5ff:219b:497a with SMTP id ada2fe7eead31-604f8ff5ff7mr3225622137.3.1774768592246;
        Sun, 29 Mar 2026 00:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:31 -0700 (PDT)
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
Subject: [PATCH v2 1/4] staging: vc04_services: vchiq-mmal: validate component index in event_to_host_cb()
Date: Sun, 29 Mar 2026 01:15:39 -0600
Message-ID: <20260329071616.507876-2-sebasjosue84@gmail.com>
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

event_to_host_cb() uses msg->u.event_to_host.client_component as an
index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
= 64) without bounds validation. While the kernel generally trusts the
hardware it is bound to, a bounds check here hardens the driver against
potential firmware bugs that could otherwise cause an uncontrolled
out-of-bounds array access and kernel crash.

Add a bounds check on comp_idx before using it as an array index and
move the component pointer assignment after the validation. Use
pr_err_ratelimited() to avoid log flooding. Note: this file does not
currently have access to a struct device, so dev_err() is not available.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index d36ad71cc..9c6533f82 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
 			     struct mmal_msg *msg, u32 msg_len)
 {
 	int comp_idx = msg->u.event_to_host.client_component;
-	struct vchiq_mmal_component *component =
-					&instance->component[comp_idx];
+	struct vchiq_mmal_component *component;
 	struct vchiq_mmal_port *port = NULL;
 	struct mmal_msg_context *msg_context;
 	u32 port_num = msg->u.event_to_host.port_num;
 
+	if (comp_idx < 0 || comp_idx >= VCHIQ_MMAL_MAX_COMPONENTS) {
+		pr_err_ratelimited("%s: component index %d out of range\n",
+				   __func__, comp_idx);
+		return;
+	}
+
+	component = &instance->component[comp_idx];
+
 	if (msg->u.buffer_from_host.drvbuf.magic == MMAL_MAGIC) {
 		pr_err("%s: MMAL_MSG_TYPE_BUFFER_TO_HOST with bad magic\n",
 		       __func__);
-- 
2.43.0

