Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59E212FB0
	for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439128; cv=none; b=oMpSOvD/SbRkXOXXHIvc16bRNv5m1aWx7RWhWDszV8nY7m3uAi24UrBSGKMmQKKbPgGTZC38Xj2UoNF0UkSVI/ztShrkG/on7evpcobtsODBS+Rw0mIkjWbpzj2yOhK5dLfOsc57b8K+q971nTngjnRQjqdMCLoPjsz0r3YeYP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439128; c=relaxed/simple;
	bh=Rz8niDCP/S5JHtYvlTHJaNeGsovQc9YWcOjL+l34xdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwVMecxy7mpwB6RPYsr24Ag6wR012NXkT2mAd0cn+O1nye0QJ5wV4Ad5HDnRr3tlMIXkXCwXQJRuBMSUecT5u//9v+FvRWLbiw4NNIaugdMeT8Wo97MfODYtH+YGIVBb4UJazlTSQKKN9gy+2B+HvyFh/kXdglhSoD5lMApetVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fyLMSg1k; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fyLMSg1k"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499659e669so179169e87.3
        for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439124; x=1744043924; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sS86lAWptOcn7UzG4ho8/rTQhup+4bcETIY9n4NgIPI=;
        b=fyLMSg1kJ+7SeRvtwdhC1XG2gtf0GtVVz4BGNIk3QqGPhZ09vSEqcGFZ55OK+PtOCT
         lSSkRJ3CWqHc3xLYsYu2UgAetGND523Xa+rjzXeLK3Up8x6sTz7ItU8siXSmfpmiHPi/
         Oo3i29rr+OgRm5rhFgpApWvNc+PkScQ+lgqP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439124; x=1744043924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sS86lAWptOcn7UzG4ho8/rTQhup+4bcETIY9n4NgIPI=;
        b=tZMBSr3zhQchUA7+NqdE6NfAs2NtgV3sdNIwyULECLiuNWbdttdMw3qJWh372X0myI
         gVZcU3xX0s0+MGqxuvKce4gUhMxJMG0RAWuhfhVxTTirwLHxxPkJGXDh6jGGsQ2Z2umb
         1pMgiGv6Hro6hKGrqj0I5u16cS9CYYbicF52NkQdIzLIWEtidcFzHFFZz3oqZxf3DF8p
         WNT+N95xwdY9QQZEtbVSHMSiELUcxX/SDzLN/G4e6EnJ0lbgVN05WI89Jgs9vmV8JcxD
         8TKE1wy3AoBZ1vMyCqFQAL8Y4asNyzC+dODnnR5QKwT3Li1IBJLxUeeDPFniaokRmVhn
         sIDw==
X-Forwarded-Encrypted: i=1; AJvYcCU+wcDnB+CvpCYKBeDUXqHge5sGUTOn7dtzayBjz5KVRuJitJGx0eOW5s00prymeqG707swjzLU4vb9W2GV@lists.linux.dev
X-Gm-Message-State: AOJu0YyU6fyjvQqtfPS6MmnbmCKtRpkS0TsYtoVnC4dFvhejKIE2eoqt
	rgjyYLrTPiP/l2jW9ly/VK1yZywxc1e/rkTe4Dphff26eaURUSJx6SAMrJMapQ==
X-Gm-Gg: ASbGncvEdRH3srLcwOTV1pN7lTMwbLCvdzBEWg+mSY2X7GIuNYHEfQKWvuZ9VTfGj+F
	r7j5vC+nNbwop9tKT7Ya+hKWSLd6QHm7RtVUEVE1GzH39BxR/O9VaOeaW7VWsHqOh34ktwSWy/w
	UcToLXlQZvZeYRJKCda4HbIbgJftbVs6Da1fvONayyhAI+ipAZgD+siUf05i3hwN7ZZKIWN8mcv
	ooMwm4Q75C9Op/0cttlesqlc8AbK9cUe2hMdtyfjYzyfLwGierPutGUYTJBNJF4vru3ahwpelnn
	gDuYn5zsIpzTOua6mk5cVHTtQiVQs3yJ+hxHhGcNg6fvrkd8jsGcMT2pb/V7qQThMBlIIaYSEOa
	Ag53w5T4gKWfHiGyY9d9Z1vUc
X-Google-Smtp-Source: AGHT+IHpyPMTl053/x1sB7ty7XO6/dSpV7J8c+JWgkb/ZJBprjEK8fsvW1T+8vB31EfEBwm4+jJmQQ==
X-Received: by 2002:a05:6512:3b14:b0:54a:cc76:1676 with SMTP id 2adb3069b0e04-54b1113d115mr2459354e87.44.1743439124261;
        Mon, 31 Mar 2025 09:38:44 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590fd3sm1151796e87.188.2025.03.31.09.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:38:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Mar 2025 16:38:42 +0000
Subject: [PATCH 1/2] media: cec: extron-da-hd-4k-plus: Fix
 Wformat-truncation
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-v614-v1-1-9bc69a873720@chromium.org>
References: <20250331-v614-v1-0-9bc69a873720@chromium.org>
In-Reply-To: <20250331-v614-v1-0-9bc69a873720@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Convince gcc8 that the port, initiator and destination fits in a single
char, despite the fact that they are 4 bits wide.

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e67fec9434aa6852ab465ad8c11225..e1a2a676bcaf9c313041ce8074c85636cfe4b2da 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1012,8 +1012,9 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	for (i = 0; i < msg->len - 1; i++)
 		sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
 	snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
-		 port->direction, port->port.port,
-		 cec_msg_initiator(msg), cec_msg_destination(msg), buf);
+		 port->direction, port->port.port % 10,
+		 cec_msg_initiator(msg) % 10, cec_msg_destination(msg) % 10,
+		 buf);
 	return extron_send_and_wait(port->extron, port, cmd, NULL);
 }
 

-- 
2.49.0.472.ge94155a9ec-goog

