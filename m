Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F82BE057
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604114; cv=none; b=OwFxsV/UKybqEYZH+hFHWjOtV0QQsWMvU35GhGhEzmx7ZIsF7arpwTZewbm+p2zBGWQ1HJaOmyk2Lksxb/+DqyMVrKGNHo3hQ5G6KfptNNUiSjvmxFCC8gDx/7/adhpBkX5Vevtuuj3zfxr0wo33Q1xXx63bV/mO4gy0P9i8BmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604114; c=relaxed/simple;
	bh=fzOSRSQCoHNu0dLeNFk9R+TyySgHxZ9QTmLjc6x/0b4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=spTa2rn/AxkIsCUzWuHd2etHA/YCE0UnsToUK+BdgGrjOVSnId1SgEdQI49q3h1V9Fj77XpHZ0SSVFwfW/8i9TGgQ8i5euifhrqKfakq1ksMGY2h4NcXVvDIr4pOwb0rInoUM7oNJ6emkRE+sWp3IQzmZ6weYO9kWuqdb8Whj84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lrir4VG4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lrir4VG4"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso1016194466b.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604110; x=1753208910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNAKp9Jrrt/krq6KY8ZZhtTOTeAjVwlU8hOn6TWbOn4=;
        b=Lrir4VG4L0SlzLCxFs7R89SPZlPpkk9Ir09kL6PJ5Yy+AtAZU4V2VgcXgue4sJhIRb
         URfjmU0H9ZDz2mBsV/DfnEAH362f0NwYd/HO4m5ecIZsOhniftE+c1B4DAlyO0B0SDWB
         DDfCbSLtSSN6Ncjn+VGg7JpdPUwSFeEshUt7T880ZISA/DMUo24y2GSzpewtl+6iebDe
         5xtPsDmVa5Wn91ZGk9Ca0PbIgCvzAcKtKrAFu6vGqE+sTTlnU21ydiwo3dT1VNCx7+e0
         FPPAHrBnPmhIHBQywvC40GcuFembFKSN6Pm0VJ59vk6qsjajxXx6L4wxP92fUHfvrb/1
         EMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604110; x=1753208910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNAKp9Jrrt/krq6KY8ZZhtTOTeAjVwlU8hOn6TWbOn4=;
        b=mNd4T4tp1ICtemRSrkV5Riby/cNn6GI3/8GYu7j2WB4jntctR8N+9231h8cvKbdWOC
         VGGlmSHChcteEXa7Om7kfQsr52hiJ+q/jHTqUNf0sE/nsNiZn3bC4YHB2H1jac18UnMR
         1sfx84BdV3SYNehbaZ978OUvly+CbXnTDRvZyYE7B+a9yOxuqXjlHVkVkCWdqta6Xrnw
         F2j7EEIsvHu9ubDY+ZyLQi/QIqiAihpB022qoacJU0pcuHw7MkBF+WftwALHL2lFa/y1
         sU35+A98xg62gt2Yi3KlGiOmBIH+MY6CK4fqEER155lsg3wTN0PI7s498KN7EZ+usv7K
         nHaw==
X-Forwarded-Encrypted: i=1; AJvYcCVREFQgAm1uMQHV4OfuG+yCzsR+j9E08Kqyynpt4TPOtCvX8QknuvlL0Zu+kQtqZUNaTmtcSKurEZtFFiOf@lists.linux.dev
X-Gm-Message-State: AOJu0YzLwbIOywgR2yN+dhQPIxn4lJJZXjxyiy7df/qhWDD72cH/8zDF
	sVm0OjvEHAu5UWBycBV+hNeLjwxNOzFB4ei3jnCBxuvDsgWFt5oW8T6TFCMiRg==
X-Gm-Gg: ASbGncsKrYgp39JWxDoMQ4J0gydlVNHIm6LHOeeGpAjxcF5bPpq9r+I116/Z2YzU+K7
	nmBMukBSyVPxYuMrXAC9VkMPVpb/xYFWKJf/blIxwRylVyvf0or912kN5OetSEQ5KDh5BjfVoFe
	TuEW/xYi1AbIZ4bqUXAli3SI486VZGX9ne/fSCCRXDUWTyA1b3fbqGai092HjajvwfE1TmP7NEt
	7JWDCOZjWV+ag/nLh6JRdaOTp+39JHhtS5Z03IN5RVHGYQvRoS+WFSq0SS8kWlpRbkFlEPh+6Oi
	cHnJuDAmt9lQaAATZ413O1CBJBsbOeXRiQPrkdCGw2vIsyvVDMvoo+pGNJsRdp0sEEBxjadPKMw
	f8lhQOzR/aHlmrSN1bGPr4aI=
X-Google-Smtp-Source: AGHT+IH//uRs0DZirwZlWD3pjj8AlbNnhVRn/1OY+8pccSolDMIpgSzcJHR+8gQWtBuy82tFc80XGg==
X-Received: by 2002:a17:907:868e:b0:ae3:ed38:8f63 with SMTP id a640c23a62f3a-ae9c999736fmr48181366b.14.1752604109818;
        Tue, 15 Jul 2025 11:28:29 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/11] staging: rtl8723bs: get rid of struct hal_ops
Date: Tue, 15 Jul 2025 20:28:03 +0200
Message-ID: <20250715182814.212708-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the remaining function pointers from the hal_ops
structure, and finally removes the structure itself. This reduces code
complexity and thereby improves readability, as the hal_ops structure
is just an unnecessary layer of abstraction.

The patches have been compile-tested only, due to lack of hardware.

Michael Straube (11):
  staging: rtl8723bs: remove function pointer SetHalODMVarHandler
  staging: rtl8723bs: remove wrapper rtl8723b_SetHalODMVar
  staging: rtl8723bs: remove function pointer hal_notch_filter
  staging: rtl8723bs: remove function pointer c2h_handler
  staging: rtl8723bs: remove macro FillH2CCmd
  staging: rtl8723bs: remove function pointer fill_h2c_cmd
  staging: rtl8723bs: remove macro hal_xmit_handler
  staging: rtl8723bs: remove function pointer xmit_thread_handler
  staging: rtl8723bs: remove function pointer hal_reset_security_engine
  staging: rtl8723bs: remove function pointer c2h_id_filter
  staging: rtl8723bs: remove struct hal_ops

 drivers/staging/rtl8723bs/hal/hal_intf.c      | 33 ++++---------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 26 +--------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  8 -----
 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 drivers/staging/rtl8723bs/include/hal_intf.h  | 13 +-------
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |  1 -
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  1 -
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |  1 -
 drivers/staging/rtl8723bs/include/sdio_hal.h  |  2 --
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  2 --
 10 files changed, 8 insertions(+), 80 deletions(-)

-- 
2.50.1

