Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703EE2DAFBD
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959313; cv=none; b=X6WB646+HBCv32Qc/lqgS6nIqp+3EfTIHs8de3TSd1SypVgKCL3bsKC1r1+nFFm4LUjeaPAehbcPSvO4mtP73DeIwFEEnYZbKCO2VJZiaSRWEvcuV3KowgTK+vsy87ZLNgK4qUvVOBFhtg6ywHNA1lzaRsDYICRbG84DdwMQamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959313; c=relaxed/simple;
	bh=/I0g4pAJtB4CFwLX59jPUjFNm+tlip377Oon3+mS7XQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXdFKXHsxToMWbx7Dn9Uc94vLRmoM2EWbx9s7OiiAFIL+LNSVlF1rjymnR/qdtGKeKooeRFY6LLyRsNnSk/+SI+9jTKDLmOB0zK9phWpbA0/pmmJRa/DZFRX54BP5LVCehBqfceYYJU3LEDfrV2TFlpOqtramHMK2hz+2rCIHWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dkujm8ee; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dkujm8ee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771959304; x=1772218504;
	bh=kxiMSX85FR0vHxuxYmk5tZWATlOkxSIi5aOd5/WnLM0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dkujm8ee7Ata9gtdli/pM7KahdJMlCGjYPVi06KCxD6nx3OrmIuEGmmrBFdp2HhHk
	 ZL1WQzRSqRr3zdHii9Tr6+bz19/qGZM3N9kMBAJX6Yd5eSKYItkyvk6AMHC1qHw3zN
	 XqTKXGoz3XUFSMVMbK6bTEJcGUHCILDl+PBzRAEjQryC4mRAOjepC9n8Bd0t65ROQs
	 87neun0NLkqF0Ir1wrzamYmXKYfVt31362MIyp11X0MbUXQYIc6b4suRE3nkCevziy
	 Grmo3RkAhtp6yGepo11f8kEDY/Yw+g7w8Zz3d4h7QvOIELhj6lHLn2d/O0FVWEY27v
	 AnDMkq4fTpeFA==
Date: Tue, 24 Feb 2026 18:54:59 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
Subject: [PATCH v3 1/2] staging: greybus: audio: remove unused gb_audio_manager_get_module()
Message-ID: <20260224185421.824210-2-hardik.phalet@pm.me>
In-Reply-To: <20260224185421.824210-1-hardik.phalet@pm.me>
References: <20260224185421.824210-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 8bc6976a10a119dab266dad39635e92155bcfb25
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

gb_audio_manager_get_module() has no in-tree callers. The previously
reported NULL dereference is therefore unreachable.

Remove the unused function to avoid carrying dead code.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/staging/greybus/audio_manager.c | 12 ------------
 drivers/staging/greybus/audio_manager.h |  7 -------
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/grey=
bus/audio_manager.c
index 27ca5f796c5f..118ada9b909b 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -105,18 +105,6 @@ void gb_audio_manager_remove_all(void)
 }
 EXPORT_SYMBOL_GPL(gb_audio_manager_remove_all);
=20
-struct gb_audio_manager_module *gb_audio_manager_get_module(int id)
-{
-=09struct gb_audio_manager_module *module;
-
-=09down_read(&modules_rwsem);
-=09module =3D gb_audio_manager_get_locked(id);
-=09kobject_get(&module->kobj);
-=09up_read(&modules_rwsem);
-=09return module;
-}
-EXPORT_SYMBOL_GPL(gb_audio_manager_get_module);
-
 void gb_audio_manager_put_module(struct gb_audio_manager_module *module)
 {
 =09kobject_put(&module->kobj);
diff --git a/drivers/staging/greybus/audio_manager.h b/drivers/staging/grey=
bus/audio_manager.h
index be605485a8ce..c3ef62ee22c8 100644
--- a/drivers/staging/greybus/audio_manager.h
+++ b/drivers/staging/greybus/audio_manager.h
@@ -54,13 +54,6 @@ int gb_audio_manager_remove(int id);
  */
 void gb_audio_manager_remove_all(void);
=20
-/*
- * Retrieves a gb_audio_manager_module_descriptor for the specified id.
- * Returns the gb_audio_manager_module_descriptor structure,
- * or NULL if there is no module with the specified ID.
- */
-struct gb_audio_manager_module *gb_audio_manager_get_module(int id);
-
 /*
  * Decreases the refcount of the module, obtained by the get function.
  * Modules are removed via gb_audio_manager_remove
--=20
2.53.0


