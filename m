Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDD222FE08
	for <linux-staging@lists.linux.dev>; Sat, 26 Apr 2025 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745679830; cv=none; b=mglWMh1a+L2lW6yy5Gr5rGW/QUBPUfI3OBN9PCmvpokqdBPzNbQjpYx4HisWm5lKqqKubP9SF/Dx8zXx1Bns5t2PJz2aYRWt3Ee6XlP+cLn8k1d1928EdruS3iTa+hmkqn9ELiuRC45nNOmdxL8ksBBWUkRNvj11I0tbg9NuWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745679830; c=relaxed/simple;
	bh=ys6A4cDEFP1W1sJupQLltwEWdunfdSd5hz+OjsL7hK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7oUsjHFO0JEWOAuTlFfOSabA8aZ2CPBUSZRcrZIhR1NM6Q/6809PM8EkpNEI4ExCy1UgdnqRfhOHFkXqFKBuHty/NUGrBXnigVrS+jMOuGDmCF+dRiVCE3SdJcAItuuToJGVChzKgXF8gozekwdBqDl5FxhZCp4ei8mVd5nYG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gg9HaWNs; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gg9HaWNs"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a064a3e143so1626577f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 26 Apr 2025 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745679827; x=1746284627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R12xvSBWaLq2rJ6VQZ7Dr5nb/4gTUkpwvOZxkJT4gsc=;
        b=Gg9HaWNsixUFL2jhhCuxNV8vdR024f+0TjddREARZfUuhKPa7viGkAiWqMomXfHULt
         LLynxkJnPvzacOknvgOUDfQO1KH1+uMd1GmZpONzpfCTC/tRBF8DvFOdeQMjGOawNiGe
         cvVWh62OzRFukqGHSbaIK6mNL7DR2pcfHdUILIsx8stV/gAsGSQVmg5inRdniatXsuBE
         r737dCOjZbBUFixXIDKs8VhHAgJ10JVCTy6xWS01EMpnYG9ZKTtRanqV2uoIaIMLvDDd
         QuFrkYc9k8vxg7LVn+1YyvkDAxXahHLZ3XAal42bma6K7o3Lnveg5iYKVJ4TlZ4EL7ly
         eQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745679827; x=1746284627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R12xvSBWaLq2rJ6VQZ7Dr5nb/4gTUkpwvOZxkJT4gsc=;
        b=wt/HEqTtnsevRVqr+y7hhK8wSOJat5oiBbW8xvqkd3/LMAJuuYmh1ai0qEN+5oV8y+
         GIAvBFag93IbJRId2tsEPQ8aHlaJVLKQztA9SeGwDocnrFrRXZXH5dv74e5vzhBxDoGk
         4ohvWK6xX+ngWX0IHiuEgyuNSw0ZoylE1JNozqp8uO+USZVUjw4VFqYKvMGvzI5mpksI
         DNEUHVr0SIAwQMbME4Ysicx0KTGLUUGzluN8sBVE5SLmSfBTa+3VmupKzqRSMdfZMmTg
         /2cLFIMiLIKMqiiXphgrHUOewec74bQWez6+Eeipg5C1esB43JZtA/2A0pvSsx3tNC4M
         TaJg==
X-Forwarded-Encrypted: i=1; AJvYcCVhmL8HIN2SvsIDDbco3Y+9BN4hlU+fN2/CVUHLc7qLT8LkYRXckdXa03JmDIg3+sqJD79yYznsC5+Ruqp2@lists.linux.dev
X-Gm-Message-State: AOJu0YzPKa2bELii+pr418tSb7glU2zcUxTTCgaqMkwvBdqaBpoz3iYe
	vNxQ0zNH3OwqVm1D7j9eyx1Y4PyieFKTbEbO+GKbyMb6boDQbZuC
X-Gm-Gg: ASbGncv2yGoUiGLDZiRuqyWCa1yqTLFhUSGhPfLNLXwm/SqwvkjHd9XtkxT/+rOIjCx
	wEMBvnEr7WvqwzKVE5SXjCn5+YJn6AU63EYvWnmXFQWP6DGoJU2jCRgSkX0z0GQQ54+69Zjhgjr
	umegCLX4N8yHIOGumh1CARY7k/VIzkbT7+WMovrWuGVMTQlVmtU9PENWl1r65/AuHz76Vs0XmIG
	5XIxYaMf3udLkT/I5Zvkb2Vl3Fajxzbo7Q0jeFQ/hAEM52xrA/N0rG5PjwD17eJLosRybyPp7Wl
	t64JvtdiQyl/a35N0MK3J1GOutmCnkzW36vAnWr6Mb80G0LLK42pz8JUEt7wkh4WPkAF0nwtnro
	b
X-Google-Smtp-Source: AGHT+IEjx09wY5wUftFqqXjkXTMQp6yzODOhA+KvWTfu3F37Mh9vH6f9hED17Nc5kra/W1ybxH13cg==
X-Received: by 2002:a05:6000:40c8:b0:39e:dbb0:310f with SMTP id ffacd0b85a97d-3a074f1488emr4646345f8f.39.1745679827039;
        Sat, 26 Apr 2025 08:03:47 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e1c6sm5931813f8f.98.2025.04.26.08.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 08:03:46 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2] staging: gpib: Fix lpvo request_system_control
Date: Sat, 26 Apr 2025 17:03:19 +0200
Message-ID: <20250426150319.5580-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IEEE-488 GPIB standard was designed to ensure that there is only ever
one controller-in-charge on the bus at any one time. If a board becomes
controller-in-charge on request_system_control there is no way to ensure
that there is not another board also acting as controller-in-charge.
This can lead to bus conflicts and hangs.

Remove the setting of controller-in-charge from request_system_control.

Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---

Changes V1->V2: Expand commit message to include user impact of bug

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 2e315c7756c4..3cf5037c0cd2 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -916,7 +916,6 @@ static int usb_gpib_request_system_control(struct gpib_board *board, int request
 	if (!request_control)
 		return -EINVAL;
 
-	set_bit(CIC_NUM, &board->status);
 	DIA_LOG(1, "done with %d -> %lx\n", request_control, board->status);
 	return 0;
 }
-- 
2.49.0

