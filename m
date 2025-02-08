Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D97228F3
	for <linux-staging@lists.linux.dev>; Sat,  8 Feb 2025 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002597; cv=none; b=qsUn9zrCdkoj3TPWJ/W4+RTIcFTNYB2B3LZp2d7SWoFwWZg0NBexQreDfkcQi9aPUPWUAhpwu2+jnKp1OekXswmZCIDouCfCqNMiegL58+AUP7PrRrMQTx6EoToKN86WPBPK7EOCBDrzGGcTRRbQHPioTsUmNT11PnZtR5DZid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002597; c=relaxed/simple;
	bh=YmsF3FA9wQc6E333xr0Xx4xLIsDEX8jsyRvV/iqNYnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8HQZaypMUeberDVv3vd04X+Xem0sZfJZDOlJBPxsNfhJq8fsqPhcLYxy2vLbIG5wG8JAvd6+ZeCZxxBV2bfl+MXZjKKQg6ebpaA2QWboK3s8zHXi7hTDPWqgK3n4FEkyc2KRr/j1PvW43wq8zX1HJbUQ6k4oRlzh62u+wTCEWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/nFXcOk; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/nFXcOk"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-71e181fb288so1897359a34.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Feb 2025 00:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002594; x=1739607394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tXoG7XaqENK2zN10Ebh6bFl5WkX7laHfMpPE30E2n0U=;
        b=k/nFXcOkqRFOUN3fDs5TCfUEPxi3ZaqIuOnFylUlvZnBvtiRPV2gINenAz6twp4wUX
         902dvNsphQsPAcImwrG7mF2S6F3nEbJALWcYW3zveACiBqrk/d4BMx7vrJDyuH1BK5to
         HZlCiKVq1ebe4EuomC7l4/mxJ40H6Xof5s6Inl3qeR+TvpNYpeuS+1qIgudXIUOflgxg
         UzgtAwtwH1y4Hl+FH11tAnEtad9m8ickZKorDTyl9DRInqLr6tv7hCpT2dQgebWCr/Re
         JOC+6A/4ldZGP1eFVjISaqzO2ikdbtbm8FsXJh8nD/NWhRYl3JpF2JSWwOYX00h4L/3w
         jHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002594; x=1739607394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXoG7XaqENK2zN10Ebh6bFl5WkX7laHfMpPE30E2n0U=;
        b=u/DciibO1hDVCzV6gQDn1sp9BE94iab3Ejcx61VGG73kIaXn0K8rKtZP7JwqaIqdz7
         C+cKFzPBx2zJprjCBchprBjaqrzw0B9ZKF08nRNg5PwGovAdD//QXsShdNWGAQvtRzd7
         5YTpAoutI07UW4x9jMoMA27AUhwjDmgl8lqzXRDp481B0o17d/mo1WQHR5//gQfergVy
         VJNC5Eq1fIqOcmpn+x3KbWfTbzPysZzo2ZtSobkT0yjCaGwji3CkfEer+96tbAgeJhYe
         9KA/0qUEXFUTp+ABz6y008Rixbp32AibHQqj4Q0mIhA5lv1ZzbiY643tOkrcuX1PmOjj
         urEw==
X-Gm-Message-State: AOJu0YwHcZehQEx2Xu6Iivu5Jd/DitispuI9zvo3N+ED5DnCokDL62H3
	oUPWcEN6/io0lV+92LpuWOpAyI8gVdB9e4V6PD45vX5m3jeWl5FK
X-Gm-Gg: ASbGncto5t0KJihqm/lg7l8gdZzSeX29CdCnYjDEJhaFaNGaZOd1Qkh6kp05aClTYq0
	fHcWRAxB0hgAtyyalhKsPkFJWLmqnq+3sw84RYHmpf1YOw/8HheJ/LYBaddK3Cajv95AZgQ9dVd
	9suQYjma/7Jzkaf4kmlz9t0tNL7HRT0HsHOeyjrsdVWB0rWLUDYMjpkNUaLioSB/dw0ypbpmwos
	6k0TvX2RlOEQu2nQFw130pwR2ianM5r9J2Y7TB3mGmtYapsKF0WD5zGUIdVE0ke1n/YumzCHxFj
	QpW+kR0yzXFE4uKEt+8FL2Fw6X4SvWt8QikwTjXeOHm/mKsDagEJpojr5ePPwMbju4dMf3PzBW5
	b
X-Google-Smtp-Source: AGHT+IFbqyEXqJ2M84FBVS3QUAXmHze7vLJBVil8Ilsyy2KXeJgbsvrw3VvXCLh3Mc96pEZOtgwSSg==
X-Received: by 2002:a05:6830:6f06:b0:718:f57:11ea with SMTP id 46e09a7af769-726b87a4e60mr4190310a34.3.1739002594131;
        Sat, 08 Feb 2025 00:16:34 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af914457sm1290441a34.2.2025.02.08.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:16:33 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/3] Adhere to coding style
Date: Sat,  8 Feb 2025 00:15:53 -0800
Message-ID: <cover.1739001527.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=358; i=onlyian4981@gmail.com;
 h=from:subject:message-id; bh=YmsF3FA9wQc6E333xr0Xx4xLIsDEX8jsyRvV/iqNYnA=;
 b=owEBbQKS/ZANAwAIAepTOeN7sYcPAcsmYgBnpxK4bCgoP4OUciUh7UqkIorYsKZA0CKdDTud8
 8Oza3RNvjaJAjMEAAEIAB0WIQRWEQChjkHIk0vVfn3qUznje7GHDwUCZ6cSuAAKCRDqUznje7GH
 D3hJEACu7z2e/IU8awuvIUCVfDU6WIL2IVe9fjVtoj2oDWOJF1FYHefm/kf+bPUJxioAAy2WW21
 pJr74WJ42QGHukBv0wti6iupJLK78mPpK4HWWk4HuQ+BikLiTjRXLPBNJt26FRNRsM/h/BfAbFF
 3dlZ8ZEfrN85kpyXLfLr2Pz7p8DNZ6yhoAD6+ZOhcJzVOv3x0x02t55JLJrnP6LeLCWOWQXs9Qx
 cOzQc4/eW+mBthmzYfqwhJnT5mohXG+GIZcBjDnTxgX/e82IEz82FgUIXK4qNZq+BphKm/zG85g
 0v1s6dG/5NnYqwtUmHC5vczYSHVuqp+Fcna8AB1JHjsPRaaW6LXpyzX3C4nye9Nzm3onr7R5tWB
 wm2O+gfgvsQKVSM18oZWRmvMlw7iTtwf5BKKO3cSUcvN7GFMPG7EXpfphLmgpJDrxKaA++vJ6+t
 a/if1h+T139VbtcZqatbRk82DIpCOAQcOY9MM0/+JOYxSZfNscwad8MuYRv9sGAB1DGoLPsWR0j
 dvL+NmhZnRyBYxqiG9fLh1IdKsjt8KZczmFp4DILgg0bSUKcpc/TdpXxFWB8gJJBxPyIVihX54Z
 c713mcYllK48tZ4zo+zP2zXOiT9q0HiQevvjWwQNL6Srhxv2N7TLeQ1OaMrI/64aPVRDQvjQbyB L5JrErLtnC+Z+wA==
X-Developer-Key: i=onlyian4981@gmail.com; a=openpgp; fpr=561100A18E41C8934BD57E7DEA5339E37BB1870F
Content-Transfer-Encoding: 8bit

Edit the file to adhere to the kernel coding style. Reported by
checkpatch.

Ian To (3):
  staging: rtl8723bs: format comments
  stagin: rtl8723bs: fix spacing
  staging: rtl8723bs: remove extra blank lines

 drivers/staging/rtl8723bs/core/rtw_security.c | 279 +++++++++---------
 1 file changed, 133 insertions(+), 146 deletions(-)

-- 
2.45.3

