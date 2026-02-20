Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C534923373D
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 06:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771569032; cv=none; b=Slqf3jf7bJfSBaJkHfDo3v8hpU2QtmdFYSI58kExU7yKDxre05hdnXHuyxUcksxDOOCvzujJzkv/kxfnrXTw9oisnnaytl+Hp5BAiDluWYlDXCsuHhaP2ItfUqqHs1R/4h3EShQ2pTKblsha4ViZvweNT+dxixg78uegthrHmCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771569032; c=relaxed/simple;
	bh=eF5nEs1EMSo3dkuaqgnwdJ2Hz3g1DhZo/d7U5mts22w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rH4q7/D0Lb+xWZmWcB4YITexBzaFflI7Zq9dV4tPgZAkHKCs9ttoQGu40hyketqlFa3/77idUk5mgqJcaWpcIPpG9FfI6CrHi3sajRwwJi4vhFIVal+7KRD/RVuiRMBE9kaPKOiwdhc2vWcyzyhFfjt3wdwFv8IDFiSIQ2XPalw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VIHBjfHU; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VIHBjfHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771569014; x=1771828214;
	bh=eF5nEs1EMSo3dkuaqgnwdJ2Hz3g1DhZo/d7U5mts22w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VIHBjfHUxk06/LcODi8EJl+2xLZhaMUIKKxY0NYlH/OPK/3twKI118N03+d64SI9U
	 J3JIYYIBi8yon93tIEiMnd1xBD2wjQqhzg8jEohN1HJ6xvlMgDbWIT9M9t19Z3LSFX
	 pGPDUgemuEg7zF3ekOvOH2Y5s0mDEOG5S1D6XEGGmwOc6MMHc5wXbJhoraOdpvW/AN
	 J5HwVN1WyIzrW32m32Dju5PwHuGwzFP6Of7+HfkctsuPkme+YeeJgFLjsAmvdl8bSC
	 onyOU1NEon/5F/KrWcj0PJjLqCCGPtmL8CjVprnEujMzLJJOH9U8CHw8VtfcdeSU5D
	 02s5KY/Gd3tiw==
Date: Fri, 20 Feb 2026 06:30:10 +0000
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
Subject: [PATCH v2 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
Message-ID: <20260220062741.399677-2-hardik.phalet@pm.me>
In-Reply-To: <20260220062741.399677-1-hardik.phalet@pm.me>
References: <20260220062741.399677-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: e38dc48ebd8090398fd7c8b9b6e58d90ee8b98e0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
can return NULL when the requested id does not exist. The returned
pointer is dereferenced unconditionally via kobject_get(), leading to a
NULL pointer dereference.

Only take a kobject reference when the module is found.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/staging/greybus/audio_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/grey=
bus/audio_manager.c
index 27ca5f796c5f..1da8804e61ca 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_mo=
dule(int id)
=20
 =09down_read(&modules_rwsem);
 =09module =3D gb_audio_manager_get_locked(id);
-=09kobject_get(&module->kobj);
+=09if (module)
+=09=09kobject_get(&module->kobj);
 =09up_read(&modules_rwsem);
 =09return module;
 }
--=20
2.53.0


