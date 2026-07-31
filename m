Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076E53C5833
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494635; cv=none; b=XmmXyzarK3QzgTB4W8H+w3Dwta+u464RVawTP+3Oooii6A+8AG90322m1mS7fVz3nMUcsgabIL2fV5ehCB87wcynCxiy4mgZ/AQXH9XAmvO74wNAJ6FmY3zt9KjFYB7fpU+IfJH/ucn5w/6ZAF2zQjOWEq5fISe0G4XxxpW6ixY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494635; c=relaxed/simple;
	bh=HxwJmVcFY+aunv1tzkGrtLBUdHMQVU4afpXrVIxieYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uc52p0SjKAjxiR77YCT/tjxbmJO3CzEej6OeJyzGYtlp2i3MNm0fil8NqfJZs8VJUZfa09T7scL7VuzSdQW1f1hYh/qpeTRAQlsrd7TuLRQKzQzhN2PCAvyUZF7Fb7QbMrdH7mh4PbCd0KrB6RxXRg0/N2Zn+lhaiEbRVxuGxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDO+Yf5k; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDO+Yf5k"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4728c12ba97so488114f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494619; x=1786099419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Is8qTwEFvpRyPXN5IK1Gedxfv7DNnnmfqXUL4XRaUGo=;
        b=XDO+Yf5k2euam2YnwblKSr0HG/NpFrd5lREoMPQJfH0JopIvkjyPiwVSou8zPu29UB
         4EQXICBozQs0UANq4gRcEdeseFy7WBpLxulG8sbbI5sadG6FQB9jep+ixeGoSaaOoOum
         WIwHCw9xtskIEN3PAhevS3JSt/A7jxt4XpXD5dImattip9beDQlLLana2OBrcvkLWRw8
         atRiKDJ5Hu5rB3xRjn0SXAi6Jk8S37RJcguSmL+b2dCDk8oxYgsZzaj2fAfuOZp7q890
         C2QJF5tQaaXDtc+wYvdXKAQtDtHx5ZNXikRdBIj//9NzuweJ3soRBkpnSPxPn5GMKfn3
         RHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494619; x=1786099419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Is8qTwEFvpRyPXN5IK1Gedxfv7DNnnmfqXUL4XRaUGo=;
        b=rGk8tn3jPM5RfqKGBYrDLbsO9FIFHubg7RLgZg2Fl/Fo7hcef2UljGIROQkKfpWBjl
         yiflUJXY502v3BwDT2EFtsp0kVkxRDHN4PucXOkOIHcm0Lo+DgEjqH64Eu0mBnE5K4ey
         vebhEER1Wd7iDThndifLQolRqRDXgBtdlQz9JvgxGraw3px1LiYGzO3ek1Sx/mPcL3gI
         Wf6K/JC8QBEGbPBWZcceDKpQae65Kp9X4Wrw11I2as2qNV/0pF426trJPTt9IvobwB5P
         IZUb2UGOY87hfH7h77bXC3/Ld2b9OUgt+qaUZTGCB1CS/FzNrW//NFyWqIL1A69z2mEM
         tW4w==
X-Forwarded-Encrypted: i=1; AHgh+RpbEEgA4AIog7pwkLE5dw9CPeeExQAjdkKa+7wP53/6yoWbUNeRDzRMCTP2yX0T9FlX78yDFgldoRlcdQhJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+ukPcc2Ps3XExyzBrw7UNkJLl59eDYFGmcZ2JWDHvgIvmS4CA
	Y4TFGIOeXXpEgDFNbg0RpjkqESxODsli+vAxKhbv9Sv0owhSbWqg0RrYEglS55eV
X-Gm-Gg: AR+sD12GGoe+GAM2KKXCRWYu159v4XbS/QpNtGsbQbjOM3FSSDCw+UoTXB0fyFXo2Vg
	ToUGyVWUpFWIFXuTTd8flWPyTpsckIu/sn8SqvKoxUHkfGF9duEXu6on9oZ7n0swMGJ/qaP/bL6
	qUa7NYWCES1muVfAXEwURa2Wx910rFI/+c4TOha5GPxM5SpXBUZfMHbWDhH9WtFFyeJpJpivja+
	cb2w02zU9uhjkPAjHNwULyezhkZjggKiS8kuEY/smN1AsmRa40snh2SS7xfDtPHZ4QXFMQDJ6+L
	4hFLAYv03HwW46l/wj9kTWGeK9HZiv0UFUlBzaWl0WlSRrHcq6TYz59TFbQnZeeA5NOmkUoVvxr
	diRXV6IQZrtFuZhCX7kG6eWEEQnYvKGmDgyKik73KiC2A+8yc6y2usS/GWIus37jIu+VaY07UET
	zE9QpqepkdmTaDnfqZNRzg1dyp/CjqA9cW8Rz+Pp0HlnYNEU+QD6aeip2i4/RBqHcUi7iMffY7i
	f+9l/i3PiBlf5PM8JJoQo2encOhf21gxNoNsBhD92x2hyDUcKSJeA==
X-Received: by 2002:adf:e013:0:20b0:47f:93b4:2df3 with SMTP id ffacd0b85a97d-47fd2b5dda0mr2552195f8f.60.1785494619121;
        Fri, 31 Jul 2026 03:43:39 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:38 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 00/11] Rename variables in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:23 +0000
Message-ID: <20260731104134.12754-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset renames several variables because of an old naming
convention to use the variable type as prefix. Also some variables
are converted from camelcase to snakecase.

Dalvin-Ehinoma Noah Aiguobas (11):
  staging: rtl8723bs: renaming variable pbuf in rtw_mlme.c
  staging: rtl8723bs: renaming variable pmlmepriv in rtw_mlme.c
  staging: rtl8723bs: renaming variable pdev_network in rtw_mlme.c
  staging: rtl8723bs: renaming variable pibss in rtw_mlme.c
  staging: rtl8723bs: renaming variable padapter in rtw_mlme.c
  staging: rtl8723bs: renaming variable phtpriv in rtw_mlme.c
  staging: rtl8723bs: renaming variable pregistrypriv in rtw_mlme.c
  staging: rtl8723bs: renaming variable bHwLDPCSupport in rtw_mlme.c
  staging: rtl8723bs: renaming variable bHwSTBCSupport in rtw_mlme.c
  staging: rtl8723bs: renaming variable bHwSupportBeamformer in
    rtw_mlme.c
  staging: rtl8723bs: renaming variable bHwSupportBeamformee in
    rtw_mlme.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 960 +++++++++++-----------
 1 file changed, 480 insertions(+), 480 deletions(-)

-- 
2.55.0

