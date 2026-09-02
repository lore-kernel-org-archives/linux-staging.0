Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FEC4A49AA
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361704; cv=none; b=QmfN8+bcVGxLuZaZ1/9Jwoe13ILOLaraHJvdCQEjYPK9txdl4XnZG5goIl3ruQyCaSgMS+Etn4GSoUWAIJYMBAXKr3AUDWu3RzAdtqDl9Q0eVhP3Z7LAhNdMaoeC9oJoxFn/WxgozX2lw2wBYQq86F4TFvAdRYu2/DSmJMcMyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361704; c=relaxed/simple;
	bh=l7ZwSjQgUOrndePWgPw1DNfTC3+Zu49Xfw8/OOEu/MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyDnEvX8xLuSbkT/S+kOqEqK4e0swP3eSO4vSScnFQV7Vey8dm83HL+8EsGRroBxoIk2xi4T/L4B2WZz1qy6Eg6O+n9zPlT0aToJLeWfNpZpU77FxTcGLWpcuAyQ3JwtJEWw1BamGg257LvLN2B0P3YezBwH3x4AUWoJHhe05os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWs8jeMl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWs8jeMl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so12215975e9.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361701; x=1788966501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycK1MrIvVrQE0I5CTjXsTFUVNIDifR0haCk+RMqWznw=;
        b=CWs8jeMlV+Imned/WtH/4k5LsYzzVuPCoDqfBUxyIzBIhq6djjLZj/GrHiOEaoNMjQ
         gX1dVVCJwgD5SNcQBwKMFDWxO0V07bAXheEvTpCF02MzY6VqDv1wRpFttav04TbM3uez
         +mwoRsORG73LU3RheEIHoWjAGHtuQ13nmVDzQtTw+t0/Ws8YhFQt+zWDFi7O9AoEgiUG
         jAZA0/kfUPOuIX0YmwFCGAnQjTn7oqSX/Ydmb8gAh2R45nYpE/EQrHye0omp3/fRMIYj
         hjGGSuwysQf/QITxF0l9xa9ZA2GlWIjNAXDii/Zdeh33o6huwbxoFzKtJW5/g0O92sln
         CIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361701; x=1788966501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycK1MrIvVrQE0I5CTjXsTFUVNIDifR0haCk+RMqWznw=;
        b=I1fjz5pabtI1kLyMdRk3JnF38aMREFPEmP2r55wcVS2FygXAfbX4c1xUpS4FWS8BN9
         Ehnny+iCp9Xjit43bSJa1yqbfapwzAyiDv6503ErSosXAe7Jrj7PFQmNLyqdSmxt0zot
         Wgybuac16y5coXEoz1Dah/+EcLZImUMoSJsVwQs4teYA3IyzOOBIcQaqR7ovAiRh3+6u
         U8+/4QJrVbP5SJlHn0N3iK6NsHNHqkfa9AyRSGN1vk5Xy22iePrqG0i151hsMNKJzxSZ
         6daQnXc6OLBu83SK85dCNTQunKa9tR5XB1ByAfYZvU9owPQpgKXdtYdyp3v4DEch8oVb
         e98A==
X-Forwarded-Encrypted: i=1; AHgh+Rpq+rZxuMLTalerpCgFBlAe2H82Ia8inazMBDkR5rHa4rAk4YE/AZ+XuZXBJ4WZsLQcxMr+lMuGP0gJto10@lists.linux.dev
X-Gm-Message-State: AFuF++l2kezWTNijWnm6E6WvrY8d7sBPt6/8ClBDFGS6TYWeUwTY4+B3
	zE59xzZR04AFXyLzJHXaUAlI8mZK6fQfwAXqcSOCyDXG3tzVZBjp95Ze0ZRi0g==
X-Gm-Gg: AR+sD13U+8dhh5k1EObZ2zdQlcICmI4BWr1zNVCZOB0dhgi5CwEG+FuYTCrRRnFsGhP
	jIoq4SzZ+MVue+yv7sK2cloBdQ/cd4IIsXgV5BctDRN2WiI2wNEFRzgIwUc09Jl2mvRFW0SNUvj
	PRGw53BD+1T7AtLQlc02Vshg16FoXztwFaIAJAs0fJpTnN5mXlT6HwwBHWsPvqwkPYriLmnx0J9
	lsIzvcyvDYJ0vsdf/XGptbPYidoYC/1cfzJQEKWiL2MEGxcYodRyR+SOZOteCcOLB5OnSrqCAyu
	qE9lYXAeAqTXMWlKC1RR9jFMRd3Ef9WusgXcDe13gJB739QQNvkfnJFmTqSm2EGR2EI7KJbRhwW
	3PoLXfpqjAdKBRmlXDngMNKsjFR1I7Cl5tLmVdBrlY/lKDImsXPDaYaGNvbAQXXVFWoOIaHWOeT
	H7O+vkB7JTpMejKqtcDLecZY5kFUbJzoNmsGuNDvPHUG4E7dQv8K/qCvL1n0WZcpNCyJuaXMpi/
	DLv/7Paqvtz99Cu8GqrT8eLq9LkPtLQT4+BF5wyhgVeUITvtrX2Cok8f0w2ju1su3xRMhjhFn+a
	TSj8Iv9q
X-Received: by 2002:a7b:cc8d:0:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cedfa0177mr10580455e9.13.1788361700924;
        Wed, 02 Sep 2026 08:08:20 -0700 (PDT)
Received: from koolguy.fritz.box (dynamic-2a02-3100-1a72-6e00-ef52-6b66-008c-4439.310.pool.telefonica.de. [2a02:3100:1a72:6e00:ef52:6b66:8c:4439])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e0desm167404405e9.11.2026.09.02.08.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:08:19 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 0/2] staging: rtl8723bs: Changing two struct members
Date: Wed,  2 Sep 2026 15:05:40 +0000
Message-ID: <20260902150542.2746-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715171634.1550-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch changes two members of the struct adapter.
Two additional patches ar made to fix some checkpatch warnings.

Changes in v4:
- Rebased against staging-testing

Changes in v3:
- Rebased against staging-testing
- Fixed building error

Changes in v2:
- Rebased against staging-testing

Dalvin-Ehinoma Noah Aiguobas (2):
  staging: rtl8723bs: change struct member bSurpriseRemoved
  staging: rtl8723bs: fix Alignment should match open parenthesis in
    rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 80 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 12 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 10 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  8 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  8 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 10 +--
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  4 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 ++++----
 15 files changed, 104 insertions(+), 104 deletions(-)

-- 
2.55.0

