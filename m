Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD48F35E1B4
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700085; cv=none; b=pd2OEBv6xISgmNhx3eIJ7xMrchNtx8O5guItrjPVhVVn5gOmpi52yoS7qfBhSYYDGEK9XU1AGR2Z2t4Qua9x9SoZCOfJMEheYCp5s2TyZMggq0itHmTF7NNCvuYKDNZJprPYWQMz6u7ropob5hUWfuIVXyHRiMe6BdHmgZLy0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700085; c=relaxed/simple;
	bh=IIk1jSbWatS+Z7jmi+dv7l6NN9oWCP52FaT8In5J2sY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQCApAKbutCjTfswV8h5ufd0v6czWjaFqCPzwA/rXOa5AgFA/u+apdFJAQPavLiv7WggTyi8GTtUa2JO+qcaiSouJkO2f+oILZOrthnEbqzewicuLfUGKWMvsZW2nL0pIiPABBXkVbVEEKrzsLU2tOG5uD5Vh8FIDP8FxcyMAHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MLz2xl1r; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fG4zd3E9; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MLz2xl1r";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fG4zd3E9"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gP95Z3VTnz9tpl;
	Mon, 25 May 2026 11:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779700082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OhGEIPPnudhSXKNfgKW/ZM6MGfAWgTq7e/KUAzuejuw=;
	b=MLz2xl1rtirdrsL+6oLN6g879bNi9AdufcyO6c5zYsGu0lCWT9fqKhSQpnWwsjLJoznCaT
	0aECNS4w+jQ6vjtUdiPlvkaKKcsiiTP05ZxmyllTWWTXAqLcUhznwt4qovVaA4P+f6+y0K
	2WN0gR4Q2yz4CCcTwO79G3WQqXyI8gcmj6IyBy1afCI2BlhST3XWXMLfjUvQb70D9bngyO
	Vb901DjBLVqcEVAIXM3jqpCskw/Vl4ODz4rd2wOtor7oKNHQDBpSCQHH/lHR6z2EjjA8Zd
	4MoRn/yHz/ewQJHWMkZkA99CgJN0G1sadGMGvM4OUmGYbs4XVRdCVu+QIj9RCQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779700080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OhGEIPPnudhSXKNfgKW/ZM6MGfAWgTq7e/KUAzuejuw=;
	b=fG4zd3E9C3/IA2k6Ft4CybFt5FPoMRj+gsZ5l+yvxAthCiziM0T7/WgatMbroIyRy0j8rD
	PKpGdFpdIOFsYfQnyLiZRWJOyfJ7ddSmM08wUOCaMnODvsKR8mmxbbxIbPknQiN7C6ewxM
	z+Jhs3CB99taLIMt5XVWOcMH8oDQGmWY8l0wcLG0N0/Zn8TA7Oc/ANon2dYG5/dvffpTIy
	cGsJ1Hfyx02bSV15A1eO/Dopd8n9UjHq/PMX2ILCEVPEGInfM4dmDVUJHn934kkzbkilxd
	9OXZcXRk9bf8dE0JENDKGyiE5VSXPb4rD63e+yRFLSBLZGhrgF34STpB6deo2Q==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v3 4/4 staging: rtl8723bs: cleanup braces of sdio_intf.c
Date: Mon, 25 May 2026 11:06:12 +0200
Message-ID: <20260525090611.216670-2-manuelebner@mailbox.org>
In-Reply-To: <20260525084956.215254-2-manuelebner@mailbox.org>
References: <20260525084956.215254-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dmkki184p14qradsy556do6nydzo3m45
X-MBO-RS-ID: 507b0d55f2b8859bd68

Remove braces of one-line if arm.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index fd805ee74a1b..32a0ee08f175 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -143,9 +143,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.54.0

