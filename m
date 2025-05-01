Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A7D26159D
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135047; cv=none; b=cCWnEyWGSu5iqZQWMnbpSyaOrljZOdqbanH0J9/CNypgEugeZ5SC3e+lAOIGncs8HZfhl6lVHhMVw/5Qs7bgcB3s6/ZpC3YY5BzK/Qu+wcRoCD7gzeqQwo8v60b0icOFksPmrvlyVbRg1rpVkVdYdQCa7qR7y+0x1pSdMjBsWQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135047; c=relaxed/simple;
	bh=gOapckKc/P6PZfyll16dMvfDX1mJ/ZFGM/QRiaIG5MM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eq/JnX34SY0nDwdFFVe++d5b6KOJhC30HP176GM5qA8WOu03XzWsCeB2B3X+P2cEDUAevWsyxD155fwPsluhejEYUUccU3nhfbQxrCo8hMehLsAxXHBPqZ63dBRqzAy+VfnLxc/QYWzaULVb5aVlQcxSFQO8xut1IwHobsf4JkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KF0W/+Ex; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KF0W/+Ex"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso4500614a12.1
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135043; x=1746739843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rrcl/JpeQTu+NIHhF4Pb+87UlDs4MN4JYFVInV4UtgY=;
        b=KF0W/+ExPi550CeaXgl8gvLTgF7u5PWbSnayADG5zhy6OWxP9lafQ1BE4x/knELHMw
         RNxa6+xBJLT2GPqOW6gJf/A1dAbo1ptm0QNB2hwixnYmEYtKTJYXhEYBlBouSqmjOkd0
         jEJYS+9tZTmLE2LrxdLpzanYyMixze3g9c49DWoUCI+uyxDFSBJR2iPwn7CJ/hZ1IFNf
         DwUeOExjbjQrXGRx5wXeR7mghqURoAJmdosD6Po2HeQ5xzUPFFJ9LRIylIiZde1Ef/ii
         JcrrCDxPTDwCSIIDskUBLgL/kyW+RnYlew6H01SUOrEXOGvglrPrfgvA8ixgW+KqhSvk
         2pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135043; x=1746739843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rrcl/JpeQTu+NIHhF4Pb+87UlDs4MN4JYFVInV4UtgY=;
        b=frHh8s5qCcmFgjpyIboBc/D67yLJ/UD80aDq07hRqyhXAjC39jWWtIGIizkPk6VY7b
         S981srXGsoyOJqi+4UGKZGf5MtekQ+6YUQEm9MTMXFBexYHfXahI0YsHwSAxX/t7uDDj
         RLrMGqPRI+wSDpeWFuqXZ6990kp8zoQzUOFdVN/wrNPCnCmC2i2dnP5lvohzbzKwEq/q
         ie/t3yAhk5tdhHkYqELI+iV5GW5Drs4xQbsVJVwZjrRXaCdb8J8AUAGc7tk1XxA2Xu26
         RyQKLdSlTlQ3CsurfN1C6sfdiSEjut5TYrckIZl6ymro8Nlni50mTCSd3cTbGaQJpwPc
         Ujdw==
X-Forwarded-Encrypted: i=1; AJvYcCWi3QEPf+8OAuL994U/UoFTpMtRqCzeTvMCVkxKe8RkEDhuF5kJaqhYbI6xCHqTwpbivIh1rBN5oKJHshvA@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1qE/pL77/Pcu7qSyR0xj7QE1sp0taMANpvFmlZ2Bdlo6eE0ms
	vVw9ps3XzjyExIjUou8F0Rh/U7gX8YDH23oYOXEDr/rJmhl6BwloQFiQTbBNB0UR2F6F
X-Gm-Gg: ASbGncsKdOXrwdLdI645Q7iapkBTrLoM5YFN1BrBAY5+FDjY9PLzIT6c6p7O9jPGVOG
	sqjlhoSOma+i2N1JjYC+A/+4W6dyXUAGme0gZgMG/uJnmUnh/TRNKHsGtp8X6hcB0xKvisjNU1Q
	4Dm15jK2L9kDrPLa91gR3vy8BWZ6ibKoVqe6/fUGmrxScpTsHXrnNKa60oqQ3Z8wgf5QcYuWZ79
	OOAMfl1u1eVjJFuJJjM9GesTSGj0MtclVZ19tS4ALIv24pz0f/gAZz8OwQi1O2nHbSdrDCGOqLA
	ovHSAT2JOzyo9hCjysqEVeEwbktbPKIstiS17u2Gd5OGv45fU6e17eqZH5LTwkmVsETyVyxZCz/
	b+GUMCda4tP0rKpvH1/JHJ6tyVDkSOtkOuvh1kADSgyLiYMEuugnVEC4UNK+OpKhdV3bmSdeOsh
	ql7Q==
X-Google-Smtp-Source: AGHT+IEYu91JG9uDqTUFxmBZwv6866gZbhwuIT22bemmqPxLeyzNfO6CuJoLuTH/Vh7aEJacJErv/Q==
X-Received: by 2002:a17:907:a42:b0:aca:c6d5:1dde with SMTP id a640c23a62f3a-acefed69a43mr341279166b.8.1746135043207;
        Thu, 01 May 2025 14:30:43 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:43 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 7/8] Staging: gpib: `request_system_control` error handling in resume
Date: Thu,  1 May 2025 23:30:36 +0200
Message-Id: <87afefe2ba2fca9f09ffd66fb8ba8e1e5c3c1404.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function `agilent_82357a_driver_resume` now handles the return value of
`agilent_82357a_request_system_control` unlocking and returning error in case
of failure.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index ce2d3850ba31..4fdf6d42f63e 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1625,7 +1625,13 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 			return retval;
 		}
 		// set/unset system controller
-		agilent_82357a_request_system_control(board, board->master);
+		retval = agilent_82357a_request_system_control(board, board->master);
+		if (retval) {
+			dev_err(&usb_dev->dev, "failed to request system control in resume, retval=%i\n",
+				retval);
+			mutex_unlock(&agilent_82357a_hotplug_lock);
+			return retval;
+		}
 		// toggle ifc if master
 		if (board->master) {
 			agilent_82357a_interface_clear(board, 1);
-- 
2.34.1

